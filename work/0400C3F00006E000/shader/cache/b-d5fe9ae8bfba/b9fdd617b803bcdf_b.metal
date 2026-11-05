#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
    float4 m_53 [[color(1)]];
};

struct main0_in
{
    float4 m_46 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_42.z;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_42.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_42.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _60;
    float _82 = _80 * _66;
    float _84 = _80 * _72;
    float _86 = _80 * _78;
    float _88 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _90 = _82 + _88;
    float _92 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _94 = _84 + _92;
    float _96 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _98 = _86 + _96;
    float _100 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _102 = _82 + _100;
    float _104 = _90 * _90;
    float _106 = fma(_94, _94, _104);
    float _108 = sqrt(_106);
    bool _112 = _108 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _114 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _116 = _108 + _114;
    float _118 = 0.0;
    float _120 = _116;
    float _122 = _78;
    if (_112)
    {
        float _124 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _118 = _124;
    }
    float _126 = _118;
    float _128 = 0.0;
    if (_112)
    {
        float _130 = rsqrt(_106);
        _128 = _130;
    }
    float _132 = _128;
    float _134 = _126;
    float _136 = _132;
    if (_112)
    {
        float _138 = _116 * _126;
        _120 = _138;
    }
    float _140 = _120;
    if (_112)
    {
        float _142 = _86 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _134 = _142;
    }
    float _144 = _134;
    float _146 = 0.0;
    float _148 = _144;
    if (_112)
    {
        float _150 = _140 * 0.15915493667125701904296875;
        _146 = _150;
    }
    float _152 = _146;
    float _154 = 0.0;
    if (_112)
    {
        float _156 = _152 * 6.283185482025146484375;
        float _158 = cos(_156);
        _154 = _158;
    }
    float _160 = _154;
    float _162 = _140;
    if (_112)
    {
        float _164 = _152 * 6.283185482025146484375;
        float _166 = sin(_164);
        _162 = _166;
    }
    float _168 = _162;
    float _170 = 0.0;
    if (_112)
    {
        float _172 = _160 + (-1.0);
        _170 = _172;
    }
    float _174 = _170;
    float _176 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _178 = _84 + _176;
    float _180 = _174;
    float _182 = _178;
    if (_112)
    {
        float _184 = _174 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _122 = _184;
    }
    float _186 = _122;
    if (!_112)
    {
        _180 = _84;
    }
    float _188 = _180;
    float _190 = 0.0;
    float _192 = _168;
    float _194 = _188;
    if (_112)
    {
        float _196 = fma(_168, _144, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _190 = _196;
    }
    float _198 = _190;
    if (!_112)
    {
        _148 = _86;
    }
    float _200 = _148;
    float _202 = _200;
    if (_112)
    {
        float _204 = fma(_86, _160, _186);
        _202 = _204;
    }
    float _206 = _202;
    if (!_112)
    {
        _192 = _82;
    }
    float _208 = _192;
    float _210 = _208;
    if (_112)
    {
        float _212 = _132 * _198;
        _136 = _212;
    }
    float _214 = _136;
    float _216 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _218 = _206 + _216;
    float _220 = _218;
    if (_112)
    {
        float _222 = fma(_94, _214, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _194 = _222;
    }
    float _224 = _194;
    if (_112)
    {
        float _226 = fma(_90, _214, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _210 = _226;
    }
    float _228 = _210;
    float _230 = _218 * _218;
    float _232 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _234 = _224 + _232;
    float _236 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _238 = _228 + _236;
    float _240 = fma(_234, _234, _230);
    float _242 = fma(_238, _238, _240);
    float _244 = rsqrt(_242);
    float _246 = _244 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _248 = _234 * _246;
    float _250 = _238 * _246;
    float _252 = _248 * _248;
    float _254 = _250 * _250;
    float _256 = _252 + _254;
    float _258 = sqrt(_256);
    bool _260 = _258 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _262 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _264 = _258 + _262;
    float _266 = _160;
    float _268 = _256;
    float _270 = _244;
    float _272 = _248;
    float _274 = _250;
    float _276 = _254;
    if (_260)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _266 = _278;
    }
    float _280 = _266;
    if (_260)
    {
        float _282 = rsqrt(_256);
        _268 = _282;
    }
    float _284 = _268;
    float _286 = _284;
    if (_260)
    {
        float _288 = _264 * _280;
        _270 = _288;
    }
    float _290 = _270;
    float _292 = 0.0;
    if (_260)
    {
        float _294 = _290 * 0.15915493667125701904296875;
        _292 = _294;
    }
    float _296 = _292;
    float _298 = _280;
    float _300 = _296;
    if (_260)
    {
        float _302 = _296 * 6.283185482025146484375;
        float _304 = sin(_302);
        _298 = _304;
    }
    float _306 = _298;
    float _308 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _310 = precise::max(0.0, _308);
    float _312 = _214;
    float _314 = _310;
    if (_260)
    {
        float _316 = _296 * 6.283185482025146484375;
        float _318 = cos(_316);
        _312 = _318;
    }
    float _320 = _312;
    float _322 = _98 * _98;
    float _324 = -_246;
    float _326 = -_310;
    float _328 = fma(_218, _324, _326);
    float _330 = fma(_178, _178, _322);
    float _332 = _330;
    if (_260)
    {
        float _334 = _328 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _314 = _334;
    }
    float _336 = _314;
    float _338 = fma(_102, _102, _330);
    float _340 = _336;
    if (!_260)
    {
        _332 = _328;
    }
    float _342 = _332;
    float _344 = _342;
    if (_260)
    {
        float _346 = fma(_306, _336, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _300 = _346;
    }
    float _348 = _300;
    float _350 = sqrt(_338);
    if (_260)
    {
        float _352 = _320 + (-1.0);
        _340 = _352;
    }
    float _354 = _340;
    float _356 = _354;
    if (_260)
    {
        float _358 = _284 * _348;
        _286 = _358;
    }
    float _360 = _286;
    if (_260)
    {
        float _362 = _354 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _220 = _362;
    }
    float _364 = _220;
    if (_260)
    {
        float _366 = _248 * _360;
        _272 = _366;
    }
    float _368 = _272;
    if (!_260)
    {
        _356 = _252;
    }
    float _370 = _356;
    float _372 = _370;
    if (_260)
    {
        float _374 = _250 * _360;
        _274 = _374;
    }
    float _376 = _274;
    if (_260)
    {
        float _378 = fma(_328, _320, _364);
        _344 = _378;
    }
    float _380 = _344;
    if (_260)
    {
        float _382 = _368 * _368;
        _372 = _382;
    }
    float _384 = _372;
    if (_260)
    {
        float _386 = _376 * _376;
        _276 = _386;
    }
    float _388 = _276;
    float _390 = fma(_380, _380, _384);
    float _392 = _390 + _388;
    float _394 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _396 = fma(_350, (*spvDescriptorSet0.fp_c9)._m0[63].x, _394);
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = rsqrt(_392);
    float _402 = -_398;
    float _404 = _402 + 1.0;
    float _406 = abs(_404);
    float _408 = log2(_406);
    float _410 = _400 * _368;
    float _412 = _400 * _380;
    float _414 = _400 * _376;
    float _416 = _410 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _418 = -_416;
    float _420 = fma(_412, (*spvDescriptorSet0.fp_c9)._m0[69].y, _418);
    float _422 = _408 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _424 = -_414;
    float _426 = fma(_424, (*spvDescriptorSet0.fp_c9)._m0[69].z, _420);
    float _428 = exp2(_422);
    float _430 = fma(_426, -0.5, 0.5);
    float _432 = fma(_426, 0.5, 0.5);
    float _434 = _412 + 1.0;
    float _436 = fma(_432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _438 = sqrt(_430);
    float _440 = fma(_432, _436, -0.212114393711090087890625);
    float _442 = -_412;
    float _444 = fma(_428, _434, _442);
    float _446 = fma(_432, _440, 1.570728778839111328125);
    float _448 = fma(_82, 6.2500002968590706586837768554688e-05, 0.5);
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = fma(_444, 0.5, 0.5);
    float _454 = fma(_84, 6.2500002968590706586837768554688e-05, 0.5);
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = _438 * 0.636619746685028076171875;
    float _460 = -_446;
    float _462 = fma(_458, _460, 1.0);
    float2 _1738 = float2(_456, _450);
    float4 _465 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1738, float2(0.0), isnan(_1738))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1738, float2(0.0), isnan(_1738))).xyzw;
    float _467 = _465.x;
    float _469 = _465.y;
    float _471 = _465.z;
    float _473 = _465.w;
    float2 _1756 = float2(_462, _452);
    float3 _477 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1756, float2(0.0), isnan(_1756))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1756, float2(0.0), isnan(_1756))).xyz;
    float _479 = _477.x;
    float _481 = _477.y;
    float _483 = _477.z;
    float _485 = in.m_44.y;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_44.x;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_44.z;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = _86 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _505 = _86 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _507 = in.m_46.x;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_48.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = fma(_84, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _503);
    float _521 = fma(_84, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _505);
    float _523 = in.m_48.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_48.z;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = fma(_82, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _519);
    float _537 = fma(_82, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _521);
    float _539 = in.m_48.w;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_46.y;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = _535 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _553 = _537 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _555 = spvFAdd(_350, 9.9999997473787516355514526367188e-06);
    float _557 = trunc(_551);
    int _560 = int(_557);
    float _562 = trunc(_553);
    int _564 = int(_562);
    float _566 = _80 * _489;
    float _568 = _80 * _495;
    float _570 = _80 * _501;
    float _572 = 1.0 / _555;
    float _574 = _566 * _566;
    float _576 = in.m_46.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = _80 * _511;
    float _584 = _80 * _517;
    float _586 = fma(_568, _568, _574);
    float _588 = _80 * _533;
    float _590 = fma(_570, _570, _586);
    float _592 = _80 * _543;
    float _594 = _80 * _549;
    float _596 = rsqrt(_590);
    float _598 = _566 * _596;
    float _600 = _568 * _596;
    float _602 = _570 * _596;
    int _604 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _606 = _560 + _604;
    int _608 = _606 + 1;
    float _610 = _598 * _598;
    int _612 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _614 = _564 + _612;
    int _616 = _614 + 1;
    bool _618 = _608 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _620 = fma(_600, _600, _610);
    int _622 = _608 | _616;
    float _624 = fma(_602, _602, _620);
    bool _626 = _622 < 0;
    bool _628 = _626 || _618;
    float _630 = _80 * _527;
    float _632 = _80 * _580;
    bool _634 = _616 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _636 = _634 || _628;
    float _638 = rsqrt(_624);
    float _640 = _600 * _638;
    float _642 = _178 * _572;
    float _644 = _598 * _638;
    float _646 = _602 * _638;
    if (_636)
    {
        _182 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _648 = _182;
    float _650 = _648;
    if (!_636)
    {
        int _652 = _616 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _654 = _652 + _608;
        float _656 = floor(_551);
        int _658 = _654 << 2;
        int _660 = _654 >> 2;
        int _662 = 12 & _658;
        int _664 = _660 << 4;
        int _666 = _664 + _662;
        float _668 = floor(_553);
        int _670 = _666 + 16256;
        uint _673 = uint(int(uint(_670) >> uint(2)));
        uint _675 = uint(int(uint(int(_673)) >> uint(2)));
        int _677 = int(_673) & 3;
        float _679 = (*spvDescriptorSet0.fp_c9)._m0[int(_675)][_677];
        float _681 = -_656;
        float _683 = _551 + _681;
        float _685 = -_668;
        float _687 = _553 + _685;
        float _689 = rint(_679);
        float _691 = precise::max(_689, 0.0);
        uint _693 = uint(_691);
        uint _695 = clamp(_693, 0u, 65535u);
        float3 _2083 = float3(_683, _687, float(int(_695)));
        float3 _2087 = select(_2083, float3(0.0), isnan(_2083));
        float _697 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2087.xy, uint(rint(_2087.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2087.xy, uint(rint(_2087.z))).x;
        int _699 = _654 << 4;
        int _701 = _699 + 17904;
        int _703 = _666 + 24304;
        uint _705 = uint(int(uint(_703) >> uint(2)));
        uint _707 = uint(int(uint(int(_705)) >> uint(2)));
        int _709 = int(_705) & 3;
        float _711 = (*spvDescriptorSet0.fp_c9)._m0[int(_707)][_709];
        uint _713 = uint(int(uint(_701) >> uint(2)));
        uint _715 = uint(int(uint(int(_713)) >> uint(2)));
        int _717 = int(_713) & 3;
        float _719 = (*spvDescriptorSet0.fp_c9)._m0[int(_715)][_717];
        int _721 = int(_713) + 1;
        uint _723 = uint(int(uint(_721) >> uint(2)));
        int _725 = _721 & 3;
        float _727 = (*spvDescriptorSet0.fp_c9)._m0[int(_723)][_725];
        int _729 = _701 + 8;
        uint _731 = uint(int(uint(_729) >> uint(2)));
        uint _733 = uint(int(uint(int(_731)) >> uint(2)));
        int _735 = int(_731) & 3;
        float _737 = (*spvDescriptorSet0.fp_c9)._m0[int(_733)][_735];
        int _739 = int(_731) + 1;
        uint _741 = uint(int(uint(_739) >> uint(2)));
        int _743 = _739 & 3;
        float _745 = (*spvDescriptorSet0.fp_c9)._m0[int(_741)][_743];
        float _747 = _86 * _727;
        float _749 = fma(_84, _719, _747);
        float _751 = 1.0 / _711;
        float _753 = fma(_82, _737, _749);
        float _755 = _753 + _745;
        float _757 = precise::clamp(_755, 0.0, 1.0);
        float _759 = _711 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _761 = -_757;
        float _763 = _761 + _697;
        float _765 = fma(_751, (*spvDescriptorSet0.fp_c13)._m0[4].w, _763);
        float _767 = _759 * _765;
        float _769 = exp2(_767);
        float _771 = 0.0 + _769;
        float _773 = precise::clamp(_771, 0.0, 1.0);
        float _775 = precise::min(_773, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _650 = _775;
    }
    float _777 = _650;
    float _779 = _102 * _572;
    float _781 = _98 * _572;
    float _783 = _642 * _640;
    float _785 = -_592;
    float _787 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _789 = _785 + _787;
    float _791 = abs(_98);
    bool _793 = _791 > 0.00999999977648258209228515625;
    float _795 = fma(_781, _644, _783);
    float _797 = _781 * 0.75187969207763671875;
    float _799 = -_781;
    float _801 = -_783;
    float _803 = fma(_799, _644, _801);
    float _805 = fma(_779, _646, _795);
    float _807 = _793 ? _98 : 0.00999999977648258209228515625;
    float _809 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _811 = _805 * _805;
    float _813 = -_779;
    float _815 = fma(_813, _646, _803);
    float _817 = precise::clamp(_815, 0.0, 1.0);
    float _819 = _807 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _821 = fma(_811, 0.565323054790496826171875, 0.434676945209503173828125);
    float _823 = -_809;
    float _825 = exp2(_823);
    float _827 = _817 * (-9.27999973297119140625);
    float _829 = precise::max(_819, -127.0);
    bool _831 = _821 >= 0.0;
    bool _833 = isnan(_821);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = sqrt(_821);
    float _843 = -_829;
    float _845 = exp2(_843);
    float _847 = fma(_805, 0.75187969207763671875, _841);
    float _849 = _781 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _851 = exp2(_827);
    float _853 = -_797;
    float _855 = fma(_644, _847, _853);
    float _857 = fma(_642, (*spvDescriptorSet0.fp_c9)._m0[69].x, _849);
    float _859 = _642 * 0.75187969207763671875;
    float _861 = fma(_779, (*spvDescriptorSet0.fp_c9)._m0[69].z, _857);
    float _863 = -_859;
    float _865 = fma(_640, _847, _863);
    float _867 = _779 * 0.75187969207763671875;
    float _869 = _350 + (-250.0);
    float _871 = fma(_861, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _873 = _839 ? _855 : (-0.0);
    float _875 = -_867;
    float _877 = fma(_646, _847, _875);
    float _879 = _839 ? _865 : (-0.0);
    float _881 = fma(_871, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _883 = precise::max(0.0, _869);
    float _885 = _873 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _887 = _839 ? _877 : (-0.0);
    float _889 = _350 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _891 = 1.0 / _829;
    float _893 = fma(_879, (*spvDescriptorSet0.fp_c9)._m0[69].x, _885);
    float _895 = _883 * 0.001000000047497451305389404296875;
    float _897 = precise::clamp(_895, 0.0, 1.0);
    float _899 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _901 = fma(_899, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _903 = fma(_887, (*spvDescriptorSet0.fp_c9)._m0[69].z, _893);
    float _905 = _408 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _907 = fma((*spvDescriptorSet0.fp_c11)._m0[5].w, (*spvDescriptorSet0.fp_c11)._m0[5].w, 1.0);
    float _909 = abs(_881);
    float _911 = log2(_909);
    float _913 = (*spvDescriptorSet0.fp_c11)._m0[5].w * 2.0;
    float _915 = fma(_897, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _917 = fma(_897, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _919 = -_913;
    float _921 = fma(_903, _919, _907);
    float _923 = -(*spvDescriptorSet0.fp_c11)._m0[5].w;
    float _925 = fma(_923, (*spvDescriptorSet0.fp_c11)._m0[5].w, 1.0);
    float _927 = exp2(_905);
    float _929 = _911 * 1.5;
    float _931 = abs(_921);
    float _933 = log2(_931);
    float _935 = -_845;
    float _937 = _935 + 1.0;
    float _939 = _917 * _917;
    float _941 = _825 * _937;
    float _943 = -_927;
    float _945 = _943 + 1.0;
    float _947 = exp2(_929);
    float _949 = _941 * _891;
    float _951 = _949 * _889;
    float _953 = precise::min(_939, _851);
    float _955 = _789 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = _933 * 1.5;
    float _961 = -_951;
    float _963 = exp2(_961);
    float _965 = _947 * 12.56637096405029296875;
    float _967 = fma(_915, -0.572000026702880859375, 1.03999996185302734375);
    float _969 = exp2(_959);
    float _971 = 1.0 / _965;
    float _973 = fma(_915, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _975 = fma(_915, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _977 = -_777;
    float _979 = _977 + 1.0;
    float _981 = fma(_917, _953, _973);
    float _983 = -_963;
    float _985 = _983 + 1.0;
    float _987 = fma(_957, _979, _777);
    float _989 = _969 * 12.56637096405029296875;
    float _991 = fma(_981, 1.03999996185302734375, _975);
    float _993 = precise::clamp(_991, 0.0, 1.0);
    float _995 = _945 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _997 = fma(_981, -1.03999996185302734375, _967);
    float _999 = precise::clamp(_997, 0.0, 1.0);
    float _1001 = 1.0 / _989;
    float _1003 = fma(_999, 0.02005931176245212554931640625, _993);
    float _1005 = _901 * _971;
    float _1007 = -_993;
    float _1009 = _1007 + 1.0;
    float _1011 = -_995;
    float _1013 = _1011 + 1.0;
    float _1015 = _995 * _963;
    float _1017 = _985 * _1005;
    float _1019 = _582 * _1009;
    float _1021 = _594 * _1009;
    float _1023 = precise::min(_987, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1025 = _987 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1027 = _467 * _1019;
    float _1029 = _632 * _1009;
    float _1031 = _473 + (*spvDescriptorSet0.fp_c11)._m0[5].x;
    float _1033 = _963 * _1013;
    float _1035 = _1027 * 0.079577468335628509521484375;
    float _1037 = _1023 * _1017;
    float _1039 = _467 * _1025;
    float _1041 = _473 + (*spvDescriptorSet0.fp_c11)._m0[5].z;
    float _1043 = _473 + (*spvDescriptorSet0.fp_c11)._m0[5].y;
    float _1045 = _987 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1047 = 1.0 / _1031;
    float _1049 = _987 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1051 = _469 * _1021;
    float _1053 = _471 * _1045;
    float _1055 = _471 * _1029;
    float _1057 = _925 * _1001;
    float _1059 = _469 * _1049;
    float _1061 = 1.0 / _1043;
    float _1063 = _1051 * 0.079577468335628509521484375;
    float _1065 = _1055 * 0.079577468335628509521484375;
    float _1067 = precise::min((*spvDescriptorSet0.fp_c9)._m0[27].w, 1.0);
    float _1069 = fma(_1057, _1039, _1035);
    float _1071 = fma(_1057, _1059, _1063);
    float _1073 = fma(_1057, _1053, _1065);
    float _1075 = _1037 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1077 = 1.0 / _1041;
    float _1079 = _1067 * 0.31830990314483642578125;
    float _1081 = _473 * _1069;
    float _1083 = _473 * _1071;
    float _1085 = _473 * _1073;
    float _1087 = _588 * _1079;
    float _1089 = _1081 * _1047;
    float _1091 = _1003 * _1079;
    float _1093 = _1083 * _1061;
    float _1095 = _1037 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1097 = fma(_479, _1015, _1075);
    float _1099 = fma(_584, _1091, _1089);
    float _1101 = fma(_630, _1091, _1093);
    float _1103 = _1037 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1105 = _1085 * _1077;
    float _1107 = precise::max(0.0, _1101);
    float _1109 = fma(_483, _1015, _1103);
    float _1111 = fma(_1003, _1087, _1105);
    float _1113 = fma(_481, _1015, _1095);
    float _1115 = precise::max(0.0, _1099);
    float _1117 = precise::max(0.0, _1111);
    float _1119 = fma(_1033, _1115, _1097);
    float _1121 = fma(_1033, _1107, _1113);
    float _1123 = fma(_1033, _1117, _1109);
    out.m_51.x = _1119;
    out.m_51.y = _1121;
    out.m_51.z = _1123;
    out.m_51.w = 1.0;
    out.m_53.x = _1119;
    out.m_53.y = _1121;
    out.m_53.z = _1123;
    out.m_53.w = 1.0;
    return out;
}

