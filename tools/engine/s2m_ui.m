// Hermit's front end for the games built on another engine (upstream nxnative, pokopia-native): Mario Kart World's performance overlay (key 1) and settings panel (key 2)
// (and, through s2m_share.m, the shared shader list's offer when the game closes),
// the same code as hermit-engine's dm/host/front_mac.m (github.com/azmasm/hermit-engine). tools/engine/patch.py copies this file into the engine's dm/host and adds the two calls front_mac.m makes:
// s2m_ui_attach once the window and layer exist, s2m_ui_key first in its key monitor.
// Data hooks (nvn_mtl.m / hle_nvn.c): mtl_cur_frame, mtl_gpu_ms, nvn_game_fps, nvn_game_size.
#import <Cocoa/Cocoa.h>
#import <QuartzCore/CAMetalLayer.h>
#include "dm.h"
#include <math.h>
#include <sys/resource.h>
#include <mach/mach.h>

static NSWindow *s_win; static CAMetalLayer *s_layer; static void (*s_release)(void), (*s_resume)(void);

// Performance overlay: a small box in the window's top-right corner, refreshed twice a second. Key 1 cycles it: compact (frame rate + the game's resolution) → detailed (the frame-rate
// graph, frame time, GPU, CPU, memory, the game's pacing, the window's output size) → off → compact. DM_OVERLAY=compact | detailed | off picks the mode at start (default compact; the settings window writes it)
uint64_t mtl_cur_frame(void); double mtl_gpu_ms(uint64_t f); int nvn_game_fps(void); void nvn_game_size(int *w, int *h);
uint64_t s2m_fg_shown(void);   // pictures shown after a generated frame (frame generation; 0 on an engine without it): patch.py adds it to nvn_mtl.m
#define OV_N 60   // graph samples: 30 s
static int g_ov_mode = 1;   // 0 off, 1 compact, 2 detailed
@interface DmOverlay : NSView
@property(strong) NSTextField *label, *build;
@end
@implementation DmOverlay {
    float _fps[OV_N]; int _n; uint64_t _f0; double _t0, _cpu0; NSString *_lines; double _fpsNow, _gpu, _fgNow; uint64_t _fg0;   // _fgNow: generated frames a second (frame generation), shown on top of the game's own
}
- (instancetype)initWithFrame:(NSRect)r {
    if (!(self = [super initWithFrame:r])) return nil;
    self.wantsLayer = YES; self.layer.backgroundColor = [NSColor colorWithWhite:0.04 alpha:0.72].CGColor; self.layer.cornerRadius = 7;
    self.layer.borderWidth = 1; self.layer.borderColor = [NSColor colorWithWhite:1 alpha:0.14].CGColor;
    self.label = [NSTextField labelWithString:@""]; self.label.maximumNumberOfLines = 0; [self addSubview:self.label];
    self.build = [NSTextField labelWithString:@""]; [self addSubview:self.build];   // the build's name, at the right of the FPS line
    _t0 = CACurrentMediaTime(); _f0 = mtl_cur_frame(); _gpu = -1;
    __weak DmOverlay *w = self; [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer *t) { (void)t; [w tick]; }];
    return self;
}
- (NSView *)hitTest:(NSPoint)p { (void)p; return nil; }   // clicks go through to the game (the touchscreen)
static double cpu_seconds(void) { struct rusage u; getrusage(RUSAGE_SELF, &u); return u.ru_utime.tv_sec + u.ru_stime.tv_sec + (u.ru_utime.tv_usec + u.ru_stime.tv_usec) / 1e6; }
static double footprint_gb(void) { task_vm_info_data_t vi; mach_msg_type_number_t n = TASK_VM_INFO_COUNT; return task_info(mach_task_self(), TASK_VM_INFO, (task_info_t)&vi, &n) == KERN_SUCCESS ? vi.phys_footprint / 1073741824.0 : 0; }
- (void)tick {
    double t = CACurrentMediaTime(), dt = t - _t0, cpu = cpu_seconds(); uint64_t f = mtl_cur_frame();
    if (dt <= 0) return;
    _fpsNow = f >= _f0 ? (f - _f0) / dt : 0;
    uint64_t fg = s2m_fg_shown(); _fgNow = fg >= _fg0 ? (fg - _fg0) / dt : 0; _fg0 = fg;
    double g = 0; int gn = 0;   // GPU busy time per frame: the frames of the last half second that have completed
    for (uint64_t k = f > 3 ? f - 3 : 0; k > _f0 && gn < 30; k--) { double v = mtl_gpu_ms(k); if (v >= 0) { g += v; gn++; } }
    if (gn) _gpu = g / gn;
    double cpuPct = _cpu0 > 0 ? (cpu - _cpu0) / dt * 100 : 0;
    _t0 = t; _f0 = f; _cpu0 = cpu;
    if (_n < OV_N) _fps[_n++] = (float)_fpsNow; else { memmove(_fps, _fps + 1, (OV_N - 1) * sizeof *_fps); _fps[OV_N - 1] = (float)_fpsNow; }
    [self refreshWithCPU:cpuPct];
}
// The engine this app was built with (S2M_ENGINE, baked in by hermit.py: "nxnative-84dea6983541", "pokopia-native-160604df414b", "switch2mac"):
// its name, and the commit's first 8 characters when it has one.
static void engine_name(NSString **name, NSString **version) {
    const char *e = getenv("S2M_ENGINE"); NSString *s = e && *e ? @(e) : @"";
    NSRange dash = [s rangeOfString:@"-" options:NSBackwardsSearch]; NSString *tail = dash.location != NSNotFound ? [s substringFromIndex:dash.location + 1] : @"";
    BOOL hex = tail.length >= 7 && [tail rangeOfCharacterFromSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdef"] invertedSet]].location == NSNotFound;
    *name = hex ? [s substringToIndex:dash.location] : s; *version = hex ? [tail substringToIndex:MIN(8u, tail.length)] : @"";
    const char *b = getenv("S2M_BUILD");   // the build's own name from its game page ("azmasm's build", "kid-with-sword-remake"), when hermit.py baked one in
    if (b && *b) *name = @(b);
}
- (void)refreshWithCPU:(double)cpuPct {
    self.hidden = g_ov_mode == 0; if (!g_ov_mode) return;
    NSFont *mono = [NSFont monospacedSystemFontOfSize:11 weight:NSFontWeightMedium];
    NSColor *green = [NSColor colorWithCalibratedRed:80/255.0 green:1 blue:120/255.0 alpha:1], *yellow = [NSColor colorWithCalibratedRed:1 green:230/255.0 blue:40/255.0 alpha:1],
            *red = [NSColor colorWithCalibratedRed:1 green:90/255.0 blue:80/255.0 alpha:1], *grey = [NSColor colorWithWhite:0.72 alpha:1];
    NSColor *fc = _fpsNow >= 55 ? green : _fpsNow >= 30 ? yellow : red;
    NSMutableAttributedString *a = [NSMutableAttributedString new];
    void (^line)(NSString *, NSColor *) = ^(NSString *s, NSColor *c) { [a appendAttributedString:[[NSAttributedString alloc] initWithString:s attributes:@{NSFontAttributeName: mono, NSForegroundColorAttributeName: c}]]; };
    NSString *gpu = _gpu >= 0 ? [NSString stringWithFormat:@"%.1f ms", _gpu] : @"--";
    int gw0, gh0; nvn_game_size(&gw0, &gh0);
    NSString *eng, *engVer; engine_name(&eng, &engVer);
    // With frame generation the screen shows the game's frames and one generated between each two: the figure is what is shown, with what the game draws beside it
    double shown = _fpsNow + _fgNow; int fgOn = _fgNow >= 1;
    if (fgOn) fc = shown >= 55 ? green : shown >= 30 ? yellow : red;
    NSString *fpsText = fgOn ? [NSString stringWithFormat:@"FPS %.0f (%.0f drawn)", shown, _fpsNow] : [NSString stringWithFormat:@"FPS %.0f", _fpsNow];
    line(fpsText, fc);
    line(gw0 > 0 ? [NSString stringWithFormat:@"\n%dx%d", gw0, gh0] : @"\n--", green);
    if (g_ov_mode == 2) {
        line([NSString stringWithFormat:@"\nGPU %@", gpu], _gpu > 16.7 ? yellow : green);
        line([NSString stringWithFormat:@"\nFrame %.1f ms", _fpsNow > 0 ? 1000 / _fpsNow : 0], green);
        line([NSString stringWithFormat:@"\nCPU %.0f%%", cpuPct], green);
        double mem = footprint_gb(); line([NSString stringWithFormat:@"\nMemory %.1f GB", mem], mem > 16 ? yellow : green);
        line([NSString stringWithFormat:@"\nGame pacing %d fps", nvn_game_fps()], grey);
        NSSize px = s_layer.drawableSize; line([NSString stringWithFormat:@"\nOutput %.0fx%.0f", px.width, px.height], grey);
        if (eng.length) line([NSString stringWithFormat:@"\nEngine %@%@%@", eng, engVer.length ? @" " : @"", engVer], grey);
    }
    line(g_ov_mode == 2 ? @"\n1: hide · 2: settings" : @"\n1: more · 2: settings", grey);
    self.label.attributedStringValue = a;
    NSSize z = [self.label sizeThatFits:NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX)];
    self.build.attributedStringValue = [[NSAttributedString alloc] initWithString:eng attributes:@{NSFontAttributeName: mono, NSForegroundColorAttributeName: [NSColor colorWithWhite:0.6 alpha:1]}];
    self.build.hidden = !eng.length; NSSize bz = [self.build sizeThatFits:NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGFloat fw = [[NSAttributedString alloc] initWithString:[fpsText stringByAppendingString:@"   "] attributes:@{NSFontAttributeName: mono}].size.width;   // the FPS figure and a gap before the build
    CGFloat gw = g_ov_mode == 2 ? 220 : 0, gh = g_ov_mode == 2 ? 74 : 0, cw = fmax(fmax(ceil(z.width), gw), eng.length ? ceil(fw + bz.width) : 0), m = 10;
    CGFloat w = cw + 16, h = ceil(z.height) + gh + 10; NSSize b = self.superview.bounds.size;
    self.frame = NSMakeRect(floor(b.width - w - m), floor(b.height - h - m), w, h);
    self.label.frame = NSMakeRect(8, gh + 5, ceil(z.width), ceil(z.height));
    self.build.frame = NSMakeRect(8 + cw - ceil(bz.width), gh + 5 + ceil(z.height) - ceil(bz.height), ceil(bz.width), ceil(bz.height));   // right-aligned with the box's text edge, on the first line
    [self setNeedsDisplay:YES];
}
- (void)drawRect:(NSRect)d {   // detailed mode: the frame rate of the last 30 s, with lines at 30 and 60
    (void)d; if (g_ov_mode != 2 || !_n) return;
    float lo = _fps[0], hi = _fps[0]; for (int i = 0; i < _n; i++) { lo = fminf(lo, _fps[i]); hi = fmaxf(hi, _fps[i]); }
    NSDictionary *st = @{NSFontAttributeName: [NSFont monospacedSystemFontOfSize:9 weight:NSFontWeightMedium], NSForegroundColorAttributeName: [NSColor colorWithWhite:0.88 alpha:1]};
    [[NSString stringWithFormat:@"min %.0f   max %.0f   (30 s)", lo, hi] drawAtPoint:NSMakePoint(8, 60) withAttributes:st];
    NSRect p = NSMakeRect(30, 8, self.bounds.size.width - 38, 46); double top = fmax(60, ceil(hi * 1.1 / 30) * 30);
    NSDictionary *ax = @{NSFontAttributeName: [NSFont monospacedSystemFontOfSize:8 weight:NSFontWeightRegular], NSForegroundColorAttributeName: [NSColor colorWithWhite:0.75 alpha:0.8]};
    for (int v = 30; v <= 60; v += 30) {
        CGFloat y = NSMinY(p) + v / top * p.size.height;
        NSBezierPath *g = [NSBezierPath bezierPath]; [g moveToPoint:NSMakePoint(NSMinX(p), y)]; [g lineToPoint:NSMakePoint(NSMaxX(p), y)];
        [[NSColor colorWithWhite:0.75 alpha:0.2] setStroke]; [g stroke];
        [[NSString stringWithFormat:@"%d", v] drawAtPoint:NSMakePoint(8, y - 5) withAttributes:ax];
    }
    NSBezierPath *c = [NSBezierPath bezierPath]; c.lineWidth = 1.5;
    for (int i = 0; i < _n; i++) {
        NSPoint q = NSMakePoint(NSMinX(p) + (OV_N > 1 ? (CGFloat)(OV_N - _n + i) / (OV_N - 1) : 0) * p.size.width, NSMinY(p) + fmin(_fps[i] / top, 1) * p.size.height);
        if (i) [c lineToPoint:q]; else [c moveToPoint:q];
    }
    [[NSColor colorWithCalibratedRed:80/255.0 green:1 blue:120/255.0 alpha:1] setStroke]; [c stroke];
}
@end
// Settings panel (key 2, Esc closes): the app's settings list (Resources/dm/launcher.json, the same rows the launcher window has) over the game, dark cards as in the launcher.
// A change is saved where the launcher reads it (launcher.<VAR> in the app's preferences, removed at the default) for the next start; the overlay and fullscreen apply at once.
// While it is open the keyboard and mouse do not reach the game
static NSUserDefaults *settings_store(void) {
    NSString *bid = NSBundle.mainBundle.bundleIdentifier ?: @"";
    return [bid hasPrefix:@"org.nxnative."] ? NSUserDefaults.standardUserDefaults : nil;   // the host inside the app: its bundle's domain, as the launcher's
}
static NSColor *ui_accent(void) { return [NSColor colorWithCalibratedRed:80/255.0 green:1 blue:120/255.0 alpha:1]; }
@interface DmFlipView : NSView
@end
@implementation DmFlipView
- (BOOL)isFlipped { return YES; }
@end
@interface DmPanelRow : NSObject
@property(copy) NSDictionary *s; @property(strong) NSTextField *note; @property BOOL locked;
@end
@implementation DmPanelRow @end
@interface DmPanel : NSView
@property(strong) NSMutableArray<DmPanelRow *> *rows;
@property(strong) NSMutableArray<NSView *> *advanced;   // (switch2mac) the engine's tuning rows, behind "Advanced"
@property(strong) NSStackView *stack; @property(strong) NSView *doc; @property(strong) NSButton *more;
@end
static DmPanel *g_panel;
static void overlay_set(int mode);
@implementation DmPanel
static NSTextField *panel_label(NSString *t, CGFloat size, NSFontWeight w, NSColor *c) {
    NSTextField *l = [NSTextField wrappingLabelWithString:t]; l.font = [NSFont systemFontOfSize:size weight:w]; l.textColor = c; l.drawsBackground = NO; return l;
}
static NSMutableDictionary<NSString *, NSString *> *g_chosen;   // (switch2mac) choices made in the panel this session: the panel shows them when it opens again
static NSString *setting_value(NSDictionary *s) {   // what the panel shows: this session's choice, else the saved choice, else the value the game started with, else the default
    NSString *env = s[@"env"], *v = g_chosen[env] ?: [settings_store() stringForKey:[@"launcher." stringByAppendingString:env]];
    if (v) return v;
    const char *e = getenv(env.UTF8String); return e ? @(e) : s[@"default"];
}
static NSMutableSet<NSString *> *g_locked;   // (switch2mac) settings the launch environment or an env file fixed for this run (filled at attach)
static NSString *setting_running(NSDictionary *s) { const char *e = getenv([s[@"env"] UTF8String]); return e ? @(e) : s[@"default"]; }   // the value this run uses
static void settings_lock_scan(void) {
    // A variable set at start but not to the saved choice came from the launch environment or an env file: the launcher keeps those, so the panel cannot change it
    g_locked = [NSMutableSet set];
    const char *fd = getenv("DM_FONT_DIR");
    NSData *d = fd ? [NSData dataWithContentsOfFile:[[@(fd) stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"launcher.json"]] : nil;
    for (NSDictionary *s in d ? [NSJSONSerialization JSONObjectWithData:d options:0 error:nil][@"settings"] : @[]) {
        const char *e = getenv([s[@"env"] UTF8String]); if (!e) continue;
        NSString *saved = [settings_store() stringForKey:[@"launcher." stringByAppendingString:s[@"env"]]];
        if (saved ? ![saved isEqual:@(e)] : ![@(e) isEqual:s[@"default"]]) [g_locked addObject:s[@"env"]];
    }
}
- (instancetype)initWithFrame:(NSRect)r {
    if (!(self = [super initWithFrame:r])) return nil;
    self.wantsLayer = YES; self.layer.backgroundColor = [NSColor colorWithWhite:0.07 alpha:0.94].CGColor; self.layer.cornerRadius = 12;
    self.layer.borderWidth = 1; self.layer.borderColor = [NSColor colorWithWhite:1 alpha:0.14].CGColor;
    self.appearance = [NSAppearance appearanceNamed:NSAppearanceNameDarkAqua];
    self.rows = [NSMutableArray array];
    const char *fd = getenv("DM_FONT_DIR"); NSArray *list = nil;
    if (fd) { NSData *d = [NSData dataWithContentsOfFile:[[@(fd) stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"launcher.json"]];
              if (d) list = [NSJSONSerialization JSONObjectWithData:d options:0 error:nil][@"settings"]; }
    NSStackView *st = [NSStackView stackViewWithViews:@[]]; st.orientation = NSUserInterfaceLayoutOrientationVertical; st.alignment = NSLayoutAttributeLeading; st.spacing = 8;
    st.edgeInsets = NSEdgeInsetsMake(18, 20, 18, 20);
    NSTextField *title = panel_label(@"Settings", 20, NSFontWeightBold, NSColor.whiteColor);
    NSTextField *sub = panel_label(@"2 or Esc closes · the overlay and display mode change at once, the rest at the next launch", 11, NSFontWeightMedium, ui_accent());
    [st addArrangedSubview:title]; [st addArrangedSubview:sub];
    // (switch2mac) the rows a player needs first (the list's basic ones and the picture's upscaling), then the engine's tuning under "Advanced", folded
    NSMutableArray *main = [NSMutableArray array], *adv = [NSMutableArray array];
    for (NSDictionary *s in list) [([s[@"level"] isEqual:@"basic"] || [@[@"DM_UPSCALER", @"DM_PRESENT_UPSCALE"] containsObject:s[@"env"]] ? main : adv) addObject:s];
    NSString *sec = nil;
    for (NSDictionary *s in main) {
        NSString *sc = [s[@"section"] isEqual:@"Game"] ? @"DISPLAY" : [s[@"section"] uppercaseString];
        if (![sc isEqual:sec]) { sec = sc; NSTextField *h = panel_label(sc, 11, NSFontWeightBold, [NSColor colorWithWhite:0.6 alpha:1]); [st addArrangedSubview:h]; [st setCustomSpacing:4 afterView:h]; }
        [st addArrangedSubview:[self card:s]];
    }
    self.advanced = [NSMutableArray array];
    if (adv.count) {
        self.more = [NSButton buttonWithTitle:@"Advanced ▸" target:self action:@selector(toggleAdvanced:)]; self.more.bordered = NO;
        self.more.attributedTitle = [[NSAttributedString alloc] initWithString:@"Advanced ▸" attributes:@{NSFontAttributeName: [NSFont systemFontOfSize:11 weight:NSFontWeightBold], NSForegroundColorAttributeName: [NSColor colorWithWhite:0.6 alpha:1]}];
        [st addArrangedSubview:self.more];
        for (NSDictionary *s in adv) { NSView *c = [self card:s]; c.hidden = YES; [self.advanced addObject:c]; [st addArrangedSubview:c]; }
    }
    if (!list.count) [st addArrangedSubview:panel_label(@"No settings list in this app (Resources/dm/launcher.json).", 12, NSFontWeightRegular, NSColor.whiteColor)];
    NSScrollView *sv = [[NSScrollView alloc] initWithFrame:self.bounds]; sv.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    sv.drawsBackground = NO; sv.hasVerticalScroller = YES;
    NSView *doc = [[DmFlipView alloc] initWithFrame:NSMakeRect(0, 0, r.size.width, 10)]; [doc addSubview:st]; st.translatesAutoresizingMaskIntoConstraints = NO;   // flipped: the rows grow downward from the top, which stays in view
    [NSLayoutConstraint activateConstraints:@[[st.leadingAnchor constraintEqualToAnchor:doc.leadingAnchor], [st.trailingAnchor constraintEqualToAnchor:doc.trailingAnchor], [st.topAnchor constraintEqualToAnchor:doc.topAnchor]]];
    doc.frame = NSMakeRect(0, 0, r.size.width - 16, st.fittingSize.height); sv.documentView = doc; [self addSubview:sv];
    self.stack = st; self.doc = doc;
    [doc scrollPoint:NSZeroPoint];
    return self;
}
- (BOOL)isFlipped { return YES; }
- (NSView *)card:(NSDictionary *)s {
    NSView *c = [NSView new]; c.wantsLayer = YES; c.layer.backgroundColor = [NSColor colorWithWhite:1 alpha:0.06].CGColor; c.layer.cornerRadius = 9;
    c.layer.borderWidth = 1; c.layer.borderColor = [NSColor colorWithWhite:1 alpha:0.12].CGColor; c.translatesAutoresizingMaskIntoConstraints = NO;
    NSTextField *l = panel_label(s[@"label"], 13, NSFontWeightSemibold, NSColor.whiteColor);
    DmPanelRow *row = [DmPanelRow new]; row.s = s; [self.rows addObject:row];
    NSString *v = setting_value(s); NSControl *ctl;
    if ([s[@"kind"] isEqual:@"choice"]) {
        NSPopUpButton *p = [NSPopUpButton new]; for (NSArray *o in s[@"options"]) { [p addItemWithTitle:o[1]]; p.lastItem.representedObject = o[0]; if ([o[0] isEqual:v]) [p selectItem:p.lastItem]; }
        ctl = p;
    } else if ([s[@"kind"] isEqual:@"range"]) {
        NSSlider *sl = [NSSlider sliderWithValue:v.doubleValue minValue:[s[@"min"] doubleValue] maxValue:[s[@"max"] doubleValue] target:nil action:nil]; sl.continuous = NO;
        [sl.widthAnchor constraintEqualToConstant:150].active = YES; ctl = sl;
    } else { NSSwitch *w = [NSSwitch new]; w.state = [v isEqual:s[@"on"] ?: @"1"] ? NSControlStateValueOn : NSControlStateValueOff; ctl = w; }
    ctl.target = self; ctl.action = @selector(changed:); ctl.tag = (NSInteger)self.rows.count - 1;
    BOOL live = [s[@"env"] isEqual:@"DM_OVERLAY"] || [s[@"env"] isEqual:@"DM_FULLSCREEN"];
    if (!live && [g_locked containsObject:s[@"env"]]) { ctl.enabled = NO; row.locked = YES; }   // set by how the game was started: a saved choice would be ignored
    NSString *n = s[@"note"]; row.note = panel_label(n ?: @"", 11, NSFontWeightRegular, [NSColor colorWithWhite:0.65 alpha:1]); row.note.hidden = !n.length;
    [self mark:row value:v];
    for (NSView *x in @[l, row.note, ctl]) { x.translatesAutoresizingMaskIntoConstraints = NO; [c addSubview:x]; }
    [NSLayoutConstraint activateConstraints:@[
        [c.widthAnchor constraintEqualToConstant:self.bounds.size.width - 56],
        [l.leadingAnchor constraintEqualToAnchor:c.leadingAnchor constant:12], [l.topAnchor constraintEqualToAnchor:c.topAnchor constant:9],
        [l.trailingAnchor constraintLessThanOrEqualToAnchor:ctl.leadingAnchor constant:-10],
        [row.note.leadingAnchor constraintEqualToAnchor:l.leadingAnchor], [row.note.topAnchor constraintEqualToAnchor:l.bottomAnchor constant:2],
        [row.note.trailingAnchor constraintLessThanOrEqualToAnchor:ctl.leadingAnchor constant:-10],
        [row.note.bottomAnchor constraintEqualToAnchor:c.bottomAnchor constant:-9],
        [ctl.trailingAnchor constraintEqualToAnchor:c.trailingAnchor constant:-12], [ctl.centerYAnchor constraintEqualToAnchor:c.centerYAnchor]]];
    [row.note setContentCompressionResistancePriority:NSLayoutPriorityRequired forOrientation:NSLayoutConstraintOrientationVertical];
    return c;
}
- (void)changed:(NSControl *)ctl {
    NSDictionary *s = self.rows[(NSUInteger)ctl.tag].s; NSString *v;
    if ([ctl isKindOfClass:NSPopUpButton.class]) v = ((NSPopUpButton *)ctl).selectedItem.representedObject;
    else if ([ctl isKindOfClass:NSSlider.class]) v = [NSString stringWithFormat:@"%.2f", ctl.doubleValue];
    else v = ((NSSwitch *)ctl).state == NSControlStateValueOn ? (s[@"on"] ?: @"1") : (s[@"off"] ?: @"0");
    NSString *env = s[@"env"]; NSUserDefaults *u = settings_store(); NSString *key = [@"launcher." stringByAppendingString:env];
    if ([v isEqual:s[@"default"]]) [u removeObjectForKey:key]; else [u setObject:v forKey:key];
    [u synchronize];   // written now: the game may be quit (or crash) before the preferences would be saved
    if (!g_chosen) g_chosen = [NSMutableDictionary dictionary];
    g_chosen[env] = v; [self mark:self.rows[(NSUInteger)ctl.tag] value:v];
    LOG("front end: setting %s = %s (%s)", env.UTF8String, v.UTF8String, u ? "saved for the next launch" : "not saved: no app preferences");
    if ([env isEqual:@"DM_OVERLAY"]) overlay_set([v isEqual:@"off"] ? 0 : [v isEqual:@"detailed"] ? 2 : 1);
    if ([env isEqual:@"DM_FULLSCREEN"] && ([v isEqual:@"1"] != ((s_win.styleMask & NSWindowStyleMaskFullScreen) != 0))) [s_win toggleFullScreen:nil];
}
// A row whose choice differs from what this run uses says so under its name (the overlay and display mode apply at once)
- (void)mark:(DmPanelRow *)row value:(NSString *)v {
    NSString *env = row.s[@"env"], *n = row.s[@"note"] ?: @"";
    BOOL live = [env isEqual:@"DM_OVERLAY"] || [env isEqual:@"DM_FULLSCREEN"], later = !live && ![v isEqual:setting_running(row.s)];
    NSString *add = row.locked ? @"Set by how this game was started (its launch settings or env.txt), so it can't be changed here."
                  : later ? @"Changed: applies when the game starts again." : nil;
    NSString *t = add ? (n.length ? [NSString stringWithFormat:@"%@\n%@", n, add] : add) : n;
    row.note.stringValue = t; row.note.hidden = !t.length;
    row.note.textColor = row.locked ? [NSColor colorWithCalibratedRed:1 green:0.75 blue:0.35 alpha:1] : later ? ui_accent() : [NSColor colorWithWhite:0.65 alpha:1];
}
- (void)toggleAdvanced:(id)sender {
    (void)sender; BOOL show = self.advanced.firstObject.hidden;
    for (NSView *c in self.advanced) c.hidden = !show;
    NSString *t = show ? @"Advanced ▾" : @"Advanced ▸";
    self.more.attributedTitle = [[NSAttributedString alloc] initWithString:t attributes:@{NSFontAttributeName: [NSFont systemFontOfSize:11 weight:NSFontWeightBold], NSForegroundColorAttributeName: [NSColor colorWithWhite:0.6 alpha:1]}];
    [self fitDoc];
}
// (switch2mac) The scrolled area's height, measured once the panel is on screen: before that the wrapping notes measure as one line each, the area came out shorter than
// its rows and the last ones could not be scrolled to (Mario Kart World's long list on an M4). Twice: the second pass after the notes have taken their wrapped width
// Then the panel takes the rows' height, up to the window's less a margin (it was 560 at most: on a tall window the last rows sat below a scroll the player did not
// see, and the top scrolled out of view), centred again, and shows its top
- (void)fitDoc {
    for (int pass = 0; pass < 2; pass++) {
        [self layoutSubtreeIfNeeded]; [self.stack layoutSubtreeIfNeeded];
        NSRect f = self.doc.frame; f.size.height = MAX(self.stack.fittingSize.height, NSMaxY(self.stack.frame)); self.doc.frame = f;
        NSView *cv = self.superview;
        if (cv) {
            CGFloat h = fmin(ceil(f.size.height) + 2, cv.bounds.size.height - 60); if (h < 200) h = fmin(200, cv.bounds.size.height - 20);
            NSRect p = self.frame; p.size.height = h; p.origin.y = floor((cv.bounds.size.height - h) / 2); self.frame = p;
        }
    }
    [self.doc scrollPoint:NSZeroPoint];
}
- (void)mouseDown:(NSEvent *)e { (void)e; }   // clicks on the panel's background do not reach the game
@end
static void panel_toggle(void) {
    NSView *cv = s_win.contentView;
    if (g_panel) { [g_panel removeFromSuperview]; g_panel = nil; s_resume(); LOG("front end: settings panel closed"); return; }
    s_release();
    CGFloat w = fmin(500, cv.bounds.size.width - 40), h = cv.bounds.size.height - 60;   // fitDoc then takes the rows' height
    g_panel = [[DmPanel alloc] initWithFrame:NSMakeRect(floor((cv.bounds.size.width - w) / 2), floor((cv.bounds.size.height - h) / 2), w, h)];
    g_panel.autoresizingMask = NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin;
    [cv addSubview:g_panel positioned:NSWindowAbove relativeTo:nil]; [g_panel fitDoc]; LOG("front end: settings panel open (key 2)");
    dispatch_async(dispatch_get_main_queue(), ^{ [g_panel fitDoc]; });   // and once more after the first layout pass on screen
}

static DmOverlay *g_ov;
static void overlay_set(int mode) { g_ov_mode = mode; [g_ov refreshWithCPU:0]; }
static void overlay_cycle(void) {
    g_ov_mode = g_ov_mode == 1 ? 2 : g_ov_mode == 2 ? 0 : 1;
    LOG("front end: overlay %s (key 1)", g_ov_mode == 0 ? "off" : g_ov_mode == 1 ? "compact" : "detailed");
    [g_ov refreshWithCPU:0];
}

void s2m_ui_attach(NSWindow *win, NSView *view, CAMetalLayer *layer, void (*release)(void), void (*resume)(void)) {
    s_win = win; s_layer = layer; s_release = release; s_resume = resume;
    settings_lock_scan();
    const char *ov = getenv("DM_OVERLAY"); g_ov_mode = ov && !strcmp(ov, "off") ? 0 : ov && !strcmp(ov, "detailed") ? 2 : 1;
    g_ov = [[DmOverlay alloc] initWithFrame:NSMakeRect(0, 0, 10, 10)]; [view addSubview:g_ov]; [g_ov refreshWithCPU:0];
    void s2m_share_attach(NSWindow *win); s2m_share_attach(win);   // the shared shader list: contribution file and the offer to send it, when the game closes (s2m_share.m)
}
int s2m_ui_key(NSEvent *e) {   // 1: the front end's key (1, 2, Esc with the panel open, anything while it is open), which the game does not get
    if (e.keyCode == 18) { if (e.type == NSEventTypeKeyDown && !e.isARepeat) overlay_cycle(); return 1; }   // key 1: the overlay's next mode (not a game button)
    if (e.keyCode == 19 || (e.keyCode == 53 && g_panel)) { if (e.type == NSEventTypeKeyDown && !e.isARepeat) panel_toggle(); return 1; }   // key 2 (or Esc while it is open): the settings panel
    return g_panel != nil;   // the panel is open: no keys reach the game
}
