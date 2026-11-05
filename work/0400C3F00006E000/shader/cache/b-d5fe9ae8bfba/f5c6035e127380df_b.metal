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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_89 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

static inline __attribute__((always_inline))
int _108(thread const int& _6705, thread const int& _6706, constant _10& support_buffer)
{
    float _6709 = as_type<float>(support_buffer._m4);
    int _6711 = _6706 + as_type<int>(_6709);
    int _6713 = 1 + _6711;
    float _6715 = support_buffer._m5[_6713].x;
    float _6717 = abs(_6715);
    bool _6719 = _6717 == 1.0;
    if (_6719)
    {
        return _6705;
    }
    float _6721 = float(_6705);
    float _6723 = _6721 / _6717;
    int _6725 = int(_6723);
    return _6725;
}

static inline __attribute__((always_inline))
int _109(thread const int& _6755, thread const int& _6756, constant _10& support_buffer)
{
    float _6759 = as_type<float>(support_buffer._m4);
    int _6761 = _6756 + as_type<int>(_6759);
    int _6763 = 1 + _6761;
    float _6765 = support_buffer._m5[_6763].x;
    bool _6767 = _6765 == 1.0;
    if (_6767)
    {
        return _6755;
    }
    float _6769 = float(_6755);
    float _6771 = _6769 * _6765;
    int _6773 = int(_6771);
    return _6773;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2377 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_133);
        out.gl_Position.z = _2662;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_53.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_51.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2731 = as_type<float>(_171);
        out.gl_Position.z = _2731;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = in.m_55.x;
    float _175 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _179 = in.m_57.x;
    float _181 = in.m_57.y;
    float _183 = in.m_57.z;
    float _185 = _175 * _173;
    float _187 = _181 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _181 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = trunc(_185);
    int _193 = int(_191);
    float _195 = _181 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    float _203 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _205 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    int _209 = _193 << 4;
    int _211 = _209 + 1712;
    bool _213 = !_177;
    float _215 = _173;
    float _231;
    if (!_213)
    {
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _219 = _173 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_117);
        float _237 = 1.0 / _235;
        float _239 = _151 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    int _243 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _245 = _243;
    int _247 = 0;
    int _249 = _108(_245, _247, (*spvDescriptorSet0.support_buffer));
    int _251 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _253 = _251;
    int _255 = 0;
    int _257 = _108(_253, _255, (*spvDescriptorSet0.support_buffer));
    float _259 = in.m_59.w;
    float _261 = trunc(_259);
    int _263 = int(_261);
    int _265 = abs(_263);
    uint _268 = uint(int(uint(_263) >> uint(31)));
    float _270 = float(uint(_265));
    int _272 = ~int(_268);
    int _274 = _272 + 1;
    float _276 = float(_257);
    float _278 = float(_249);
    float _280 = trunc(_276);
    int _282 = int(_280);
    float _284 = _278 + (-1.0);
    int _286 = abs(_282);
    bool _288 = _282 == 0;
    float _290 = float(uint(_286));
    int _292 = ~_286;
    int _294 = _292 + 1;
    float _296 = 1.0 / _290;
    float _298 = _278 + 9.9999997473787516355514526367188e-06;
    float _300 = 1.0 / _298;
    int _302 = as_type<int>(_296) + (-2);
    int _304 = ~_286;
    int _306 = _304 + 1;
    float _308 = as_type<float>(_302) * _270;
    float _310 = trunc(_308);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    int _316 = _294 * int(_314);
    int _318 = _316 + _265;
    float _320 = float(uint(_318));
    float _322 = as_type<float>(_302) * _320;
    float _324 = _151 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _326 = fma(_324, _300, _173);
    float _328 = trunc(_322);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    float _334 = floor(_326);
    int _336 = int(_314) + int(_332);
    float _338 = trunc(_284);
    int _340 = int(_338);
    int _342 = _306 * _336;
    int _344 = _342 + _265;
    float _346 = -_334;
    float _348 = _326 + _346;
    bool _350 = uint(_344) >= uint(_286);
    float _352 = _278 * _348;
    bool _354 = !_350;
    int _356 = _354 ? 0 : (-1);
    float _358 = trunc(_352);
    int _360 = int(_358);
    int _362 = ~_336;
    int _364 = _362 + _356;
    int _366 = _364 + 1;
    int _368 = _286 * _366;
    int _370 = _368 + _265;
    int _372 = _370 ^ _274;
    int _374 = ~_274;
    int _376 = _374 + _372;
    int _378 = _376 + 1;
    bool _380 = _360 >= _340;
    int _382 = _360 + 1;
    bool _384 = !_288;
    int _386 = _384 ? _378 : (-1);
    bool _388 = !_380;
    int _390 = _388 ? _382 : 0;
    int _392 = _360;
    int _394 = 0;
    int _396 = _109(_392, _394, (*spvDescriptorSet0.support_buffer));
    int _398 = _386;
    int _400 = 0;
    int _402 = _109(_398, _400, (*spvDescriptorSet0.support_buffer));
    float4 _405 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_396, _402)), 0).xyzw;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = _405.w;
    int _415 = _390;
    int _417 = 0;
    int _419 = _109(_415, _417, (*spvDescriptorSet0.support_buffer));
    int _421 = _386;
    int _423 = 0;
    int _425 = _109(_421, _423, (*spvDescriptorSet0.support_buffer));
    float4 _427 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_419, _425)), 0).xyzw;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _427.w;
    float _437 = in.m_55.z;
    float _439 = _173 * 2.0;
    float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _443 = log2(_441);
    float _445 = in.m_55.y;
    float _447 = floor(_439);
    float _449 = _443 * _151;
    float _451 = exp2(_449);
    float _453 = _437 * 2.0;
    bool _455 = _447 > 0.0;
    bool _457 = _447 >= 0.0;
    bool _459 = isnan(_447);
    bool _461 = _457 || _459;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    float _467 = _445 + _437;
    float _469 = floor(_453);
    float _471 = _445 * 2.0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    float _485 = _467 + (-1.0);
    int _487 = _465 ? 0 : 1;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _491 = 1.0 + _489;
    bool _493 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _501 = _497 || _499;
    int _503 = ~_487;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    float _509 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _511 = _507;
    bool _513 = _479;
    if (!_455)
    {
        int _515 = ~_487;
        int _517 = _515 + 1;
        _511 = _517;
    }
    int _519 = _511;
    float _521 = floor(_471);
    float _523 = in.m_59.x;
    float _525 = in.m_59.y;
    float _527 = in.m_59.z;
    bool _529 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(1.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = -_451;
    float _541 = _539 + 1.0;
    float _543 = float(_519);
    bool _545 = _469 > 0.0;
    bool _547 = _469 >= 0.0;
    bool _549 = isnan(_469);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = 1.0 / _491;
    bool _559 = !_479;
    int _561 = _559 ? 0 : 1;
    int _563 = _555 ? 0 : 1;
    int _565 = abs(_561);
    bool _567 = !_475;
    int _569 = _567 ? 0 : 1;
    float _571 = float(_565);
    bool _573 = _521 > 0.0;
    float _575 = _501 ? _541 : 0.0;
    float _577 = _571 * _543;
    int _579 = ~_563;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    int _585 = _583;
    if (!_545)
    {
        int _587 = ~_563;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    float _593 = _577 * (-2.0);
    int _595 = abs(_569);
    if (_537)
    {
        float _597 = _575 * _557;
        _155 = _597;
    }
    float _599 = _155;
    bool _601 = _521 >= 0.0;
    bool _603 = isnan(_521);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = _445 + (-0.5);
    float _613 = float(_595);
    float _615 = fma(_593, _525, _525);
    float _617 = float(_591);
    float _619 = fma(_509, _593, _509);
    int _621 = _609 ? 0 : 1;
    float _623 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    bool _625 = !_483;
    int _627 = _625 ? 0 : 1;
    float _629 = _173 + _445;
    int _631 = ~_621;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = _613 * _617;
    int _639 = _635;
    if (!_573)
    {
        int _641 = ~_621;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = _629 + (-1.0);
    int _649 = abs(_627);
    float _651 = fma(_619, _599, _623);
    float _653 = _637 * (-2.0);
    float _655 = float(_649);
    float _657 = _651 * 0.15915493667125701904296875;
    float _659 = float(_645);
    float _661 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _663 = _173 + (-0.5);
    float _665 = fma(_653, _523, _523);
    float _667 = _173 + _437;
    float _669 = _655 * _659;
    float _671 = fma(_661, _653, _661);
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].x, _665);
    float _675 = _667 + (-1.0);
    float _677 = _669 * (-2.0);
    float _679 = fma(_671, _599, _673);
    float _681 = _657 * 6.283185482025146484375;
    float _683 = cos(_681);
    float _685 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _687 = fma(_677, _527, _527);
    float _689 = _437 + (-0.5);
    float _691 = _679 * 0.15915493667125701904296875;
    float _693 = fma(_685, _677, _685);
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].z, _687);
    float _697 = _691 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = fma(_693, _599, _695);
    float _703 = _701 * 0.15915493667125701904296875;
    float _705 = _691 * 6.283185482025146484375;
    float _707 = cos(_705);
    float _709 = _703 * 6.283185482025146484375;
    float _711 = cos(_709);
    float _713 = _699 * _683;
    float _715 = _657 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = _707 * _683;
    float _721 = _683 * _711;
    float _723 = _703 * 6.283185482025146484375;
    float _725 = sin(_723);
    float _727 = _699 * _717;
    float _729 = _707 * _717;
    float _731 = _699 * _711;
    float _733 = _707 * _711;
    float _735 = _717 * _711;
    float _737 = floor(_352);
    float _739 = fma(_725, _719, _727);
    float _741 = -_729;
    float _743 = fma(_725, _713, _741);
    float _745 = fma(_725, _727, _719);
    float _747 = -_713;
    float _749 = fma(_725, _729, _747);
    float _751 = -_737;
    float _753 = _352 + _751;
    float _755 = in.m_48.x;
    float _757 = in.m_48.y;
    float _759 = in.m_48.z;
    float _761 = -_409;
    float _763 = _761 + _431;
    float _765 = -_407;
    float _767 = _765 + _429;
    float _769 = -_411;
    float _771 = _769 + _433;
    float _773 = _763 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _775 = _767 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _777 = _771 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _779 = fma(_753, _763, _409);
    float _781 = _773 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _783 = _773 * _773;
    float _785 = _773 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _787 = fma(_753, _771, _411);
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    float _791 = _773 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _793 = fma(_775, _775, _783);
    float _795 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[4].x, _785);
    float _797 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[5].z, _789);
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[6].x, _791);
    float _801 = fma(_777, _777, _793);
    float _803 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[4].z, _795);
    float _805 = _797 * _797;
    float _807 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[6].z, _799);
    float _809 = _757 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _811 = fma(_753, _767, _407);
    float _813 = fma(_803, _803, _805);
    float _815 = sqrt(_801);
    float _817 = _757 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _819 = _779 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _821 = fma(_807, _807, _813);
    float _823 = _757 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _825 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[5].x, _817);
    float _827 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[4].x, _809);
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _819);
    float _831 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[6].x, _823);
    float _833 = rsqrt(_821);
    float _835 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _837 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[4].z, _827);
    float _839 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[5].z, _829);
    float _841 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[6].z, _831);
    float _843 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _845 = _837 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _847 = _841 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _849 = _843 + _839;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _849 + _851;
    float _855 = _815 * _833;
    float _857 = fma(_797, _855, _205);
    float _859 = fma(_803, _855, _203);
    float _861 = fma(_807, _855, _207);
    float _863 = _779 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _857 * _857;
    float _867 = _779 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _869 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _871 = fma(_859, _859, _865);
    float _873 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _867);
    float _875 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[4].z, _869);
    float _877 = fma(_861, _861, _871);
    float _879 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _881 = _845 + _875;
    float _883 = rsqrt(_877);
    float _885 = _847 + _879;
    float _887 = _853 * _853;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _881 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _885 + _893;
    float _897 = fma(_891, _891, _887);
    float _899 = fma(_895, _895, _897);
    float _901 = rsqrt(_899);
    float _903 = _857 * _883;
    float _905 = _859 * _883;
    float _907 = _861 * _883;
    float _909 = _903 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _911 = _749 * _907;
    float _913 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[8].y, _909);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[10].y, _913);
    float _917 = _853 * _901;
    float _919 = _891 * _901;
    float _921 = abs(_915);
    bool _923 = _921 > 0.99989998340606689453125;
    float _925 = _895 * _901;
    float _927 = -_917;
    float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _931 = -_919;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _935 = -_925;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = in.m_61.x;
    float _945 = in.m_61.y;
    float _947 = in.m_61.z;
    float _949 = _833;
    float _951 = _767;
    float _953 = _899;
    float _955 = _861;
    float _957 = _919;
    if (_923)
    {
        _949 = 0.001000000047497451305389404296875;
    }
    float _959 = _949;
    float _961 = fma(_937, _937, _941);
    if (!_923)
    {
        _951 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _963 = _951;
    float _965 = _963;
    if (!_923)
    {
        _953 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _967 = _953;
    float _969 = _967;
    if (_923)
    {
        float _971 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _965 = _971;
    }
    float _973 = _965;
    if (_923)
    {
        float _975 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _969 = _975;
    }
    float _977 = _969;
    if (!_923)
    {
        _955 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _979 = _955;
    float _981 = -_973;
    float _983 = _907 * _981;
    float _985 = sqrt(_961);
    float _987 = _979;
    if (_923)
    {
        float _989 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _987 = _989;
    }
    float _991 = _987;
    float _993 = -_977;
    float _995 = _903 * _993;
    float _997 = -_977;
    float _999 = -_983;
    float _1001 = fma(_905, _997, _999);
    float _1003 = in.m_63.x;
    float _1005 = in.m_63.y;
    float _1007 = in.m_63.z;
    float _1009 = -_991;
    float _1011 = -_995;
    float _1013 = fma(_907, _1009, _1011);
    float _1015 = -_991;
    float _1017 = _905 * _1015;
    float _1019 = _1001 * _1001;
    float _1021 = -_973;
    float _1023 = -_1017;
    float _1025 = fma(_903, _1021, _1023);
    float _1027 = fma(_1013, _1013, _1019);
    float _1029 = _945 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1031 = _947 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1033 = _943 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1035 = fma(_1025, _1025, _1027);
    float _1037 = _901 * _985;
    float _1039 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1041 = rsqrt(_1035);
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1047 = _1039 * _1037;
    float _1049 = _1043 * _1037;
    float _1051 = _1045 * _1037;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1005);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1007);
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1003);
    float _1059 = _1047 * _1053;
    float _1061 = _1049 * _1055;
    float _1063 = _733 * _907;
    float _1065 = _1001 * _1041;
    float _1067 = _1013 * _1041;
    float _1069 = _733 * _905;
    float _1071 = _1025 * _1041;
    float _1073 = _905 * _1065;
    float _1075 = _1051 * _1057;
    float _1077 = _739 * _907;
    float _1079 = -_725;
    float _1081 = fma(_1079, _1067, _1069);
    float _1083 = _903 * _1071;
    float _1085 = -_1073;
    float _1087 = fma(_903, _1067, _1085);
    float _1089 = -_725;
    float _1091 = fma(_1089, _1071, _1063);
    float _1093 = fma(_721, _1071, _1077);
    float _1095 = fma(_735, _1071, _911);
    float _1097 = _739 * _905;
    float _1099 = -_1083;
    float _1101 = fma(_907, _1065, _1099);
    float _1103 = fma(_731, _1087, _1091);
    float _1105 = fma(_743, _1087, _1093);
    float _1107 = fma(_745, _1087, _1095);
    float _1109 = _749 * _905;
    float _1111 = fma(_721, _1067, _1097);
    float _1113 = fma(_731, _1101, _1081);
    float _1115 = _1059 * _1103;
    float _1117 = fma(_735, _1067, _1109);
    float _1119 = fma(_743, _1101, _1111);
    float _1121 = _1059 * _1113;
    float _1123 = fma(_1075, _1105, _1115);
    float _1125 = fma(_745, _1101, _1117);
    float _1127 = _733 * _903;
    float _1129 = fma(_1075, _1119, _1121);
    float _1131 = fma(_1061, _1107, _1123);
    float _1133 = _907 * _1067;
    float _1135 = -_725;
    float _1137 = fma(_1135, _1065, _1127);
    float _1139 = fma(_1061, _1125, _1129);
    float _1141 = _885 + _1131;
    float _1143 = _739 * _903;
    float _1145 = -_1133;
    float _1147 = fma(_905, _1071, _1145);
    float _1149 = _881 + _1139;
    float _1151 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1153 = _1141 + _1151;
    float _1155 = _749 * _903;
    float _1157 = fma(_721, _1065, _1143);
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1161 = _1149 + _1159;
    float _1163 = _1153 * _1153;
    float _1165 = fma(_731, _1147, _1137);
    float _1167 = fma(_735, _1065, _1155);
    float _1169 = fma(_743, _1147, _1157);
    float _1171 = fma(_1161, _1161, _1163);
    float _1173 = _1059 * _1165;
    float _1175 = fma(_745, _1147, _1167);
    float _1177 = sqrt(_1171);
    float _1179 = fma(_1075, _1169, _1173);
    float _1181 = fma(_1061, _1175, _1179);
    float _1183 = _849 + _1181;
    bool _1185 = _1177 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1061;
    float _1189 = _1181;
    float _1191 = _1075;
    float _1193 = _1183;
    if (!_1185)
    {
        _1187 = _1149;
    }
    float _1195 = _1187;
    float _1197 = _1195;
    if (!_1185)
    {
        _1189 = _1141;
    }
    float _1199 = _1189;
    float _1201 = _1199;
    if (!_1185)
    {
        _1191 = _1183;
    }
    float _1203 = _1191;
    bool _1205 = !_1185;
    float _1207 = _1203;
    if (!_1205)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1213 = _1177 + _1211;
        float _1215 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = rsqrt(_1171);
        float _1219 = _1213 * _1209;
        float _1221 = _1219 * 0.15915493667125701904296875;
        float _1223 = _1221 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        float _1227 = _1221 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = fma(_1225, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1217 * _1231;
        float _1235 = _1229 + (-1.0);
        float _1237 = fma(_1161, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1239 = fma(_1153, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = fma(_1183, _1229, _1241);
        _1207 = _1243;
        _1197 = _1237;
        _1201 = _1239;
    }
    float _1245 = _1207;
    float _1247 = _1197;
    float _1249 = _1201;
    float _1251 = -_917;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1255 = -_919;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1259 = -_925;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1263 = -_919;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1269 = _1253 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1273 = _1257 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1277 = _1261 + _1275;
    float _1279 = -_925;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1283 = _1269 * _1269;
    float _1285 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1287 = fma(_1273, _1273, _1283);
    float _1289 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1285);
    float _1291 = fma(_1277, _1277, _1287);
    float _1293 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1289);
    float _1295 = rsqrt(_1291);
    float _1297 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1299 = sqrt(_1291);
    float _1301 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1303 = _1273 * _1301;
    float _1305 = _1277 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 * _1305;
    float _1311 = _1307 + _1309;
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1313 + _1317;
    float _1321 = _1277;
    float _1323 = _1311;
    float _1325 = _1319;
    float _1327 = _1269;
    float _1329 = _1281;
    if (_1315)
    {
        float _1331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1331;
    }
    float _1333 = _1321;
    if (_1315)
    {
        float _1335 = rsqrt(_1311);
        _1323 = _1335;
    }
    float _1337 = _1323;
    if (_1315)
    {
        float _1339 = _1319 * _1333;
        _1325 = _1339;
    }
    float _1341 = _1325;
    if (_1315)
    {
        float _1343 = _1341 * 0.15915493667125701904296875;
        _1193 = _1343;
    }
    float _1345 = _1193;
    float _1347 = _1287;
    float _1349 = _1345;
    if (_1315)
    {
        float _1351 = _1345 * 6.283185482025146484375;
        float _1353 = sin(_1351);
        _1347 = _1353;
    }
    float _1355 = _1347;
    float _1357 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1359 = precise::max(0.0, _1357);
    float _1361 = _1295;
    float _1363 = _1359;
    float _1365 = _1357;
    if (_1315)
    {
        float _1367 = _1345 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        _1361 = _1369;
    }
    float _1371 = _1361;
    float _1373 = -_1301;
    float _1375 = -_1359;
    float _1377 = fma(_1269, _1373, _1375);
    float _1379 = _1377;
    if (!_1315)
    {
        _1327 = _1307;
    }
    float _1381 = _1327;
    float _1383 = _1381;
    if (_1315)
    {
        float _1385 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1385;
    }
    float _1387 = _1363;
    if (!_1315)
    {
        _1349 = _1303;
    }
    float _1389 = _1349;
    float _1391 = _1355;
    float _1393 = _1389;
    if (_1315)
    {
        float _1395 = fma(_1355, _1387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1397;
    float _1401 = _1371;
    if (_1315)
    {
        float _1403 = _1371 + (-1.0);
        _1365 = _1403;
    }
    float _1405 = _1365;
    float _1407 = _1405;
    if (_1315)
    {
        float _1409 = _1337 * _1397;
        _957 = _1409;
    }
    float _1411 = _957;
    if (!_1315)
    {
        _1399 = _1309;
    }
    float _1413 = _1399;
    float _1415 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1417 = _1413;
    if (_1315)
    {
        float _1419 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1407 = _1419;
    }
    float _1421 = _1407;
    if (_1315)
    {
        float _1423 = _1303 * _1411;
        _1393 = _1423;
    }
    float _1425 = _1393;
    float _1427 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1415);
    if (_1315)
    {
        float _1429 = fma(_1377, _1371, _1421);
        _1379 = _1429;
    }
    float _1431 = _1379;
    if (!_1315)
    {
        _1401 = _1305;
    }
    float _1433 = _1401;
    float _1435 = _1433;
    if (_1315)
    {
        float _1437 = _1305 * _1411;
        _1435 = _1437;
    }
    float _1439 = _1435;
    if (_1315)
    {
        float _1441 = _1425 * _1425;
        _1383 = _1441;
    }
    float _1443 = _1383;
    float _1445 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1427);
    if (_1315)
    {
        float _1447 = _1439 * _1439;
        _1417 = _1447;
    }
    float _1449 = _1417;
    float _1451 = fma(_1431, _1431, _1443);
    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1455 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1453);
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1461 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1463 = _1451 + _1449;
    float _1465 = -_1457;
    float _1467 = _1465 + 1.0;
    float _1469 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1459);
    float _1471 = rsqrt(_1463);
    float _1473 = fma(_1265, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1475 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1479 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1481 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = abs(_1467);
    float _1487 = log2(_1485);
    float _1489 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1491 = -_1479;
    float _1493 = fma(_1491, _1477, 1.0);
    float _1495 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1489);
    float _1497 = _1471 * _1425;
    float _1499 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1495);
    float _1501 = floor(_1473);
    float _1503 = _1471 * _1431;
    float _1505 = _1471 * _1439;
    float _1507 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1509 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1511 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1513 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1515 = -_1507;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1515);
    float _1519 = floor(_1481);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1511);
    float _1523 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1525 = -_1505;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1517);
    float _1529 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1521);
    float _1531 = _1503 + 1.0;
    float _1533 = log2(_1493);
    float _1535 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1529);
    float _1537 = -_1501;
    float _1539 = _1473 + _1537;
    float _1541 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1543 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1541);
    float _1545 = exp2(_1513);
    float _1547 = fma(_1527, -0.5, 0.5);
    float _1549 = fma(_1527, 0.5, 0.5);
    float _1551 = -_1519;
    float _1553 = _1481 + _1551;
    float _1555 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1523);
    float _1557 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1543);
    float _1559 = fma(_1549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1561 = 1.0 / _1535;
    float _1563 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1557);
    float _1565 = fma(_1549, _1559, -0.212114393711090087890625);
    float _1567 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1555);
    float _1569 = sqrt(_1547);
    float _1571 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1567);
    float _1573 = -_1503;
    float _1575 = fma(_1545, _1531, _1573);
    float _1577 = _1533 * 0.693147182464599609375;
    float2 _4895 = float2(_1539, _1553);
    float _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4895, float2(0.0), isnan(_4895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4895, float2(0.0), isnan(_4895)), level(0.0)).x;
    float _1581 = fma(_1549, _1565, 1.570728778839111328125);
    float _1583 = fma(_1575, 0.5, 0.5);
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1587 = _1563 * _1561;
    float _1589 = _1571 * _1561;
    float _1591 = fma(_1587, 0.5, 0.5);
    float _1593 = fma(_1589, -0.5, 0.5);
    float _1595 = _1569 * 0.636619746685028076171875;
    float3 _4929 = float3(_1591, _1593, _1585);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4929, float3(0.0), isnan(_4929)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4929, float3(0.0), isnan(_4929)), level(0.0)).x;
    float _1599 = -_1581;
    float _1601 = fma(_1595, _1599, 1.0);
    float3 _4945 = float3(_1591, _1593, _1585);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float2 _4961 = float2(_1601, _1583);
    float3 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4961, float2(0.0), isnan(_4961)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4961, float2(0.0), isnan(_4961)), level(0.0)).xyz;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = in.m_55.w;
    float _1625 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1627 = -_917;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1635 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1637 = isnan(_241);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = _1625 * _173;
    bool _1649 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1651 = isnan(_241);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1661;
    float _1665 = 1.0 / _1633;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1669 = _241 + _1667;
    float _1671 = -_1645;
    float _1673 = _1671 + 1.0;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1679 = _1659 * _1673;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1683 = _1681 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1685 = trunc(_1647);
    int _1687 = int(_1685);
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1691 = _1689 != 0;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1695 = _1693 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1699 = _1697 != 0;
    float _1701 = -_1659;
    float _1703 = _1701 + 1.0;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1707 = _1705 != 0;
    float _1709 = in.m_65.x;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1713 = _1711 != 0;
    float _1715 = _1663 * _1665;
    float _1717 = 1.0 / _1677;
    int _1719 = _211 + 8;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    uint _1723 = uint(int(uint(int(_1721)) >> uint(2)));
    int _1725 = int(_1721) & 3;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[int(_1723)][_1725];
    float _1729 = in.m_65.y;
    float _1731 = fma(_1715, _1669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1733 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1735 = isnan(_241);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1747 = _1687 << 4;
    int _1749 = _1747 + 1968;
    uint _1751 = uint(int(uint(_211) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[int(_1761)][_1763];
    float _1767 = 1.0 / _1695;
    float _1769 = _1743 * _1703;
    bool _1771 = _445 > 0.5;
    float _1773 = -_1743;
    float _1775 = _1773 + 1.0;
    bool _1777 = _1623 > 0.5;
    float _1779 = _1731 * _1769;
    bool _1781 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1783 = isnan(_241);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    int _1793 = _1749 + 8;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[int(_1797)][_1799];
    float _1803 = _1683 * _1717;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1805;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1811 = _241 + _1809;
    float _1813 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1779);
    float _1815 = -_1791;
    float _1817 = _1815 + 1.0;
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1821 = fma(_1803, _1811, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    uint _1823 = uint(int(uint(_1749) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c9)._m0[int(_1833)][_1835];
    float _1839 = _1807 * _1767;
    float _1841 = -_1729;
    float _1843 = _1841 + 1.0;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1847 = _241 + _1845;
    float _1849 = _1645 * _1817;
    float _1851 = fma(_1821, _1679, _1813);
    float _1853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1855 = fma(_1839, _1847, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1857 = _1777 ? as_type<int>(_1843) : as_type<int>(_1729);
    float _1859 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1745);
    bool _1861 = _1777;
    int _1863 = as_type<int>(_1851);
    float _1865 = _1729;
    int _1867 = as_type<int>(_1849);
    float _1869 = _1709;
    float _1871 = _1535;
    float _1873 = _1571;
    if (_1699)
    {
        bool _1875 = _437 > 0.5;
        _1861 = _1875;
    }
    bool _1877 = _1861;
    float _1879 = fma(_1855, _1849, _1851);
    float _1881 = _1707 ? as_type<float>(_1857) : _1729;
    if (_1691)
    {
        float _1883 = -_1709;
        float _1885 = _1883 + 1.0;
        _1863 = as_type<int>(_1885);
    }
    int _1887 = _1863;
    if (_1713)
    {
        float _1889 = _1771 ? _1843 : _1729;
        _1865 = _1889;
    }
    float _1891 = _1865;
    float _1893 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1879);
    float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1691)
    {
        bool _1897 = _173 > 0.5;
        _513 = _1897;
    }
    bool _1899 = _513;
    if (_1699)
    {
        float _1901 = -_1709;
        float _1903 = _1901 + 1.0;
        _1867 = as_type<int>(_1903);
    }
    int _1905 = _1867;
    if (!_1691)
    {
        _215 = _1709;
    }
    float _1907 = _215;
    float _1909 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1911 = _1907;
    if (_1691)
    {
        float _1913 = _1899 ? as_type<float>(_1887) : _1709;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1859);
    if (_1699)
    {
        float _1919 = _1877 ? as_type<float>(_1905) : _1709;
        _1869 = _1919;
    }
    float _1921 = _1869;
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1925 = _1005 != 0.0;
    bool _1927 = isnan(_1005);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(0.0);
    bool _1933 = _1929 || _1931;
    float _1935 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1937 = in.m_67.x;
    bool _1939 = _1003 == 0.0;
    bool _1941 = !_1933;
    bool _1943 = _1939 && _1941;
    float _1945 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1947 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1949 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1951 = _1765 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1953 = _1007 == 0.0;
    bool _1955 = _1953 && _1943;
    float _1957 = _1947 * _1819;
    float _1959 = _1935 * _1853;
    float _1961 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = _1801 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1965 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1629 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1969 = _1629 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1971 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1973 = _1963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1975 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1967);
    float _1977 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1969);
    float _1979 = _1829 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1981 = _1837 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1983 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1975);
    float _1985 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1977);
    float _1987 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1989 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1991 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1993 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1995 = _1987 * _1923;
    float _1997 = _1989 * _1895;
    float _1999 = 1.0 / _1991;
    float _2001 = _1993 + _1991;
    out.m_69.x = _1961;
    out.m_69.y = _1971;
    out.m_69.z = _1965;
    out.m_69.w = _1909;
    float _2003 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2005 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1959;
    out.m_71.y = _1957;
    out.m_71.z = _1997;
    out.m_71.w = _1995;
    out.m_73.x = _2003;
    out.m_73.y = _2005;
    out.m_73.z = _1973;
    float _2007 = _2001 * _1999;
    float _2009 = _2007 * 0.5;
    float _2011 = in.m_75.x;
    float _2013 = in.m_75.y;
    float _2015 = in.m_75.z;
    float _2017 = in.m_75.w;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2021 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2019);
    float _2023 = in.m_77.x;
    float _2025 = in.m_77.y;
    float _2027 = in.m_77.z;
    float _2029 = 1.0 / _2021;
    float _2031 = _1165 * _2013;
    float _2033 = _1103 * _2013;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2037 = _2029 * _2035;
    float _2039 = fma(_1169, _2011, _2031);
    float _2041 = fma(_1105, _2011, _2033);
    float _2043 = abs(_2037);
    float _2045 = log2(_2043);
    float _2047 = _2021;
    float _2049 = _1991;
    float _2051 = _1961;
    if (_1955)
    {
        _2047 = _2025;
    }
    float _2053 = _2047;
    float _2055 = _2053;
    if (_1955)
    {
        _1329 = _2023;
    }
    float _2057 = _1329;
    float _2059 = _2057;
    if (_1955)
    {
        _2049 = _2027;
    }
    float _2061 = _2049;
    float _2063 = _2061;
    if (_1955)
    {
        _2051 = _2057;
    }
    float _2065 = _2051;
    float _2067 = _2065;
    if (!_1955)
    {
        _2059 = _2023;
    }
    float _2069 = _2059;
    if (!_1955)
    {
        float _2071 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2069);
        _2067 = _2071;
    }
    float _2073 = _2067;
    float _2075 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2077 = _2045;
    if (_1955)
    {
        _2077 = _2053;
    }
    float _2079 = _2077;
    float _2081 = -_413;
    float _2083 = _2081 + _435;
    float _2085 = _2079;
    if (!_1955)
    {
        _2055 = _2025;
    }
    float _2087 = _2055;
    float _2089 = exp2(_2075);
    float _2091 = fma(_753, _2083, _413);
    if (!_1955)
    {
        float _2093 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2087);
        _2085 = _2093;
    }
    float _2095 = _2085;
    bool _2097 = _2037 <= 8000.0;
    bool _2099 = isnan(_2037);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan(8000.0);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    out.m_79.w = _2091;
    float _2109 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = _2089;
    if (_1955)
    {
        _2113 = _2061;
    }
    float _2115 = _2113;
    float _2117 = _2115;
    if (!_1955)
    {
        _2063 = _2027;
    }
    float _2119 = _2063;
    float _2121 = fma(_2111, -2.0, 3.0);
    float _2123 = _2111 * _2111;
    float _2125 = _2015 * _2069;
    float _2127 = _2013 * _2119;
    float _2129 = _2123 * _2121;
    float _2131 = -_2125;
    float _2133 = fma(_2011, _2119, _2131);
    if (!_1955)
    {
        float _2135 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2119);
        _2117 = _2135;
    }
    float _2137 = _2117;
    float _2139 = -_2127;
    float _2141 = fma(_2015, _2087, _2139);
    float _2143 = -_2129;
    float _2145 = _2143 + 1.0;
    float _2147 = _2133 * _2017;
    float _2149 = _2011 * _2087;
    float _2151 = _2141 * _2017;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2129);
    float _2155 = _1113 * _2013;
    float _2157 = _1113 * _2147;
    float _2159 = _1103 * _2095;
    float _2161 = _2107 * _2153;
    float _2163 = _1113 * _2095;
    float _2165 = _1165 * _2095;
    float _2167 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2169 = _1165 * _2147;
    float _2171 = _1103 * _2147;
    float _2173 = fma(_1119, _2011, _2155);
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2177 = fma(_1119, _2151, _2157);
    float _2179 = exp2(_2167);
    float _2181 = fma(_1169, _2151, _2169);
    float _2183 = fma(_1105, _2151, _2171);
    float _2185 = fma(_1119, _2073, _2163);
    float _2187 = fma(_1169, _2073, _2165);
    float _2189 = fma(_1105, _2073, _2159);
    float _2191 = -_2149;
    float _2193 = fma(_2013, _2069, _2191);
    float _2195 = fma(_1125, _2015, _2173);
    float _2197 = fma(_1175, _2015, _2039);
    float _2199 = fma(_1107, _2015, _2041);
    float _2201 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _2203 = _2193 * _2017;
    float _2205 = fma(_1125, _2137, _2185);
    float _2207 = fma(_1107, _2137, _2189);
    out.m_81.x = _2195;
    out.m_81.y = _2197;
    out.m_81.z = _2199;
    float _2209 = -_2179;
    float _2211 = _2209 + 1.0;
    float _2213 = _2201 + _1535;
    bool _2215 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2217 = isnan(_1299);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2223 = _2219 || _2221;
    out.gl_Position.x = _1563;
    out.gl_Position.y = _1571;
    out.gl_Position.z = _2201;
    out.gl_Position.w = _1535;
    float _2225 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2227 = _2213 * 0.5;
    float _2229 = fma(_1175, _2137, _2187);
    float _2231 = fma(_1125, _2203, _2177);
    float _2233 = fma(_1175, _2203, _2181);
    float _2235 = fma(_1107, _2203, _2183);
    out.m_83.z = _2227;
    out.m_83.w = _1535;
    out.m_85.x = _2205;
    out.m_85.y = _2229;
    out.m_85.z = _2207;
    float _2237 = -_2225;
    float _2239 = _2237 + 1.0;
    out.m_87.x = _2231;
    out.m_87.y = _2233;
    out.m_87.z = _2235;
    float _2241 = _2201;
    float _2243 = _2233;
    float _2245 = _2231;
    float _2247 = _2239;
    if (!_2223)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2249 = _1871;
    float _2251 = _2249;
    float _2253 = _2249;
    if (!_2223)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2255 = _2241;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2223)
    {
        _1873 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2261 = _1873;
    float _2263 = _2261;
    float _2265 = _2261;
    if (!_2223)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2267 = _2243;
    float _2269 = _2267;
    float _2271 = _2267;
    if (!_2223)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2273 = _2245;
    float _2275 = -_1579;
    float _2277 = _2275 + 1.0;
    float _2279 = _2277 * _2175;
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    float _2283 = -_2281;
    float _2285 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2287 = _2285 * _1937;
    float _2289 = _2225 * _1597;
    float _2291 = _2287 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2293 = _1611 * _2289;
    float _2295 = _1611 * _2239;
    float _2297 = _2273;
    float _2299 = _2273;
    if (!_2223)
    {
        _2247 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2301 = _2247;
    out.m_89.x = _2291;
    float _2303 = _1621 * _2289;
    float _2305 = fma(_1617, _2293, _1605);
    float _2307 = fma(_1619, _2293, _1607);
    float _2309 = fma(_1611, _2303, _1609);
    out.m_91.x = _2305;
    out.m_91.y = _2307;
    out.m_91.z = _2309;
    out.m_91.w = _2295;
    bool _2311 = !_2223;
    float _2313 = _2301;
    float _2315 = _2301;
    if (!_2311)
    {
        bool _2317 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2319 = isnan(_1299);
        bool _2321 = _2317 || _2319;
        bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2325 = _2321 || _2323;
        if (!_2325)
        {
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2329 = _1299 + _2327;
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2331;
            float _2335 = 1.0 / _2333;
            float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2357 = _2329 * _2335;
            float _2359 = precise::clamp(_2357, 0.0, 1.0);
            float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2365 = fma(_2359, _2339, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2299 = _2367;
            _2265 = _2373;
            _2271 = _2365;
            _2259 = _2371;
            _2253 = _2369;
            _2315 = _2375;
            _2377 = true;
        }
        else
        {
            bool _2379 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2381 = isnan(_1299);
            bool _2383 = _2379 || _2381;
            bool _2385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2387 = _2383 || _2385;
            if (!_2387)
            {
                _2269 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2389 = _2269;
            _2271 = _2389;
            if (!_2387)
            {
                _2297 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2391 = _2297;
            _2299 = _2391;
            if (!_2387)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2393 = _2251;
            _2253 = _2393;
            if (!_2387)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2395 = _2257;
            _2259 = _2395;
            if (!_2387)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2397 = _2263;
            _2265 = _2397;
            if (!_2387)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2399 = _2313;
            bool _2401 = !_2387;
            _2315 = _2399;
            if (!_2401)
            {
                bool _2403 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2405 = isnan(_1299);
                bool _2407 = _2403 || _2405;
                bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2411 = _2407 || _2409;
                if (!_2411)
                {
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2415 = _1299 + _2413;
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2419 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2417;
                    float _2421 = 1.0 / _2419;
                    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2443 = _2415 * _2421;
                    float _2445 = precise::clamp(_2443, 0.0, 1.0);
                    float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2451 = fma(_2445, _2425, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2453 = fma(_2445, _2449, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2455 = fma(_2445, _2429, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2457 = fma(_2445, _2433, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2459 = fma(_2445, _2437, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2461 = fma(_2445, _2441, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2299 = _2453;
                    _2265 = _2459;
                    _2271 = _2451;
                    _2259 = _2457;
                    _2253 = _2455;
                    _2315 = _2461;
                    _2377 = true;
                }
                else
                {
                    _2299 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2271 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2377 = false;
    float _2463 = _2299;
    float _2465 = _2265;
    float _2467 = _2271;
    float _2469 = _2259;
    float _2471 = _2253;
    float _2473 = _2315;
    float _2475 = fma(_2229, -0.5, 0.5);
    float _2477 = precise::clamp(_2475, 0.0, 1.0);
    float _2479 = -_2463;
    float _2481 = _2479 + _2465;
    float _2483 = -_2467;
    float _2485 = _2483 + _2469;
    float _2487 = -_2471;
    float _2489 = _2487 + _2473;
    bool _2491 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2493 = fma(_2477, _2481, _2463);
    float _2495 = fma(_2477, _2485, _2467);
    float _2497 = fma(_2477, _2489, _2471);
    float _2499 = _2493 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2501 = fma(_2495, 0.298911988735198974609375, _2499);
    float _2503 = fma(_2497, 0.114477999508380889892578125, _2501);
    out.m_93.x = 0.0;
    float _2505 = -_2503;
    float _2507 = _2495 + _2505;
    float _2509 = -_2503;
    float _2511 = _2493 + _2509;
    float _2513 = -_2503;
    float _2515 = _2497 + _2513;
    float _2517 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2519 = fma(_2507, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    float _2521 = fma(_2511, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    float _2523 = fma(_2515, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    out.m_89.w = _2517;
    out.m_95.x = _2519;
    out.m_95.y = _2521;
    out.m_95.z = _2523;
    if (!_2491)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2525 = -_1253;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2529 = -_1257;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2533 = -_1261;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2537 = _2527 * _2527;
    float _2539 = fma(_2531, _2531, _2537);
    float _2541 = fma(_2535, _2535, _2539);
    float _2543 = sqrt(_2541);
    float _2545 = rsqrt(_2541);
    float _2547 = -_2543;
    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2551 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2531 * _2545;
    float _2557 = _2527 * _2545;
    float _2559 = abs(_2553);
    float _2561 = log2(_2559);
    float _2563 = _2535 * _2545;
    float _2565 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2567 = _2229 * _2557;
    float _2569 = -_2557;
    float _2571 = -_2565;
    float _2573 = fma(_2569, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2571);
    float _2575 = fma(_2205, _2555, _2567);
    float _2577 = -_2563;
    float _2579 = fma(_2577, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2573);
    float _2581 = fma(_2207, _2563, _2575);
    float _2583 = precise::clamp(_2581, 0.0, 1.0);
    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2587 = _2579 + _2585;
    float _2589 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2591 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2593 = precise::clamp(_2591, 0.0, 1.0);
    float _2595 = exp2(_2589);
    float _2597 = _2595 * _2593;
    float _2599 = _2583 * _2597;
    float _2601 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2603 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2605 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2601;
    out.m_93.y = _2603;
    out.m_93.z = _2605;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2377 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_133);
        out.gl_Position.z = _2662;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_53.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_51.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2731 = as_type<float>(_171);
        out.gl_Position.z = _2731;
    }
    if (_165)
    {
        return out;
    }
    float _173 = in.m_55.x;
    float _175 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _179 = in.m_57.x;
    float _181 = in.m_57.y;
    float _183 = in.m_57.z;
    float _185 = _175 * _173;
    float _187 = _181 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _181 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = trunc(_185);
    int _193 = int(_191);
    float _195 = _181 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    float _203 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _205 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    int _209 = _193 << 4;
    int _211 = _209 + 1712;
    bool _213 = !_177;
    float _215 = _173;
    float _231;
    if (!_213)
    {
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _219 = _173 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_117);
        float _237 = 1.0 / _235;
        float _239 = _151 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    int _243 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _245 = _243;
    int _247 = 0;
    int _249 = _108(_245, _247, (*spvDescriptorSet0.support_buffer));
    int _251 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _253 = _251;
    int _255 = 0;
    int _257 = _108(_253, _255, (*spvDescriptorSet0.support_buffer));
    float _259 = in.m_59.w;
    float _261 = trunc(_259);
    int _263 = int(_261);
    int _265 = abs(_263);
    uint _268 = uint(int(uint(_263) >> uint(31)));
    float _270 = float(uint(_265));
    int _272 = ~int(_268);
    int _274 = _272 + 1;
    float _276 = float(_257);
    float _278 = float(_249);
    float _280 = trunc(_276);
    int _282 = int(_280);
    float _284 = _278 + (-1.0);
    int _286 = abs(_282);
    bool _288 = _282 == 0;
    float _290 = float(uint(_286));
    int _292 = ~_286;
    int _294 = _292 + 1;
    float _296 = 1.0 / _290;
    float _298 = _278 + 9.9999997473787516355514526367188e-06;
    float _300 = 1.0 / _298;
    int _302 = as_type<int>(_296) + (-2);
    int _304 = ~_286;
    int _306 = _304 + 1;
    float _308 = as_type<float>(_302) * _270;
    float _310 = trunc(_308);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    int _316 = _294 * int(_314);
    int _318 = _316 + _265;
    float _320 = float(uint(_318));
    float _322 = as_type<float>(_302) * _320;
    float _324 = _151 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _326 = fma(_324, _300, _173);
    float _328 = trunc(_322);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    float _334 = floor(_326);
    int _336 = int(_314) + int(_332);
    float _338 = trunc(_284);
    int _340 = int(_338);
    int _342 = _306 * _336;
    int _344 = _342 + _265;
    float _346 = -_334;
    float _348 = _326 + _346;
    bool _350 = uint(_344) >= uint(_286);
    float _352 = _278 * _348;
    bool _354 = !_350;
    int _356 = _354 ? 0 : (-1);
    float _358 = trunc(_352);
    int _360 = int(_358);
    int _362 = ~_336;
    int _364 = _362 + _356;
    int _366 = _364 + 1;
    int _368 = _286 * _366;
    int _370 = _368 + _265;
    int _372 = _370 ^ _274;
    int _374 = ~_274;
    int _376 = _374 + _372;
    int _378 = _376 + 1;
    bool _380 = _360 >= _340;
    int _382 = _360 + 1;
    bool _384 = !_288;
    int _386 = _384 ? _378 : (-1);
    bool _388 = !_380;
    int _390 = _388 ? _382 : 0;
    int _392 = _360;
    int _394 = 0;
    int _396 = _109(_392, _394, (*spvDescriptorSet0.support_buffer));
    int _398 = _386;
    int _400 = 0;
    int _402 = _109(_398, _400, (*spvDescriptorSet0.support_buffer));
    float4 _405 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_396, _402)), 0).xyzw;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = _405.w;
    int _415 = _390;
    int _417 = 0;
    int _419 = _109(_415, _417, (*spvDescriptorSet0.support_buffer));
    int _421 = _386;
    int _423 = 0;
    int _425 = _109(_421, _423, (*spvDescriptorSet0.support_buffer));
    float4 _427 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_419, _425)), 0).xyzw;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _427.w;
    float _437 = in.m_55.z;
    float _439 = _173 * 2.0;
    float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _443 = log2(_441);
    float _445 = in.m_55.y;
    float _447 = floor(_439);
    float _449 = _443 * _151;
    float _451 = exp2(_449);
    float _453 = _437 * 2.0;
    bool _455 = _447 > 0.0;
    bool _457 = _447 >= 0.0;
    bool _459 = isnan(_447);
    bool _461 = _457 || _459;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    float _467 = _445 + _437;
    float _469 = floor(_453);
    float _471 = _445 * 2.0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    float _485 = _467 + (-1.0);
    int _487 = _465 ? 0 : 1;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _491 = 1.0 + _489;
    bool _493 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _501 = _497 || _499;
    int _503 = ~_487;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    float _509 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _511 = _507;
    bool _513 = _479;
    if (!_455)
    {
        int _515 = ~_487;
        int _517 = _515 + 1;
        _511 = _517;
    }
    int _519 = _511;
    float _521 = floor(_471);
    float _523 = in.m_59.x;
    float _525 = in.m_59.y;
    float _527 = in.m_59.z;
    bool _529 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(1.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = -_451;
    float _541 = _539 + 1.0;
    float _543 = float(_519);
    bool _545 = _469 > 0.0;
    bool _547 = _469 >= 0.0;
    bool _549 = isnan(_469);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = 1.0 / _491;
    bool _559 = !_479;
    int _561 = _559 ? 0 : 1;
    int _563 = _555 ? 0 : 1;
    int _565 = abs(_561);
    bool _567 = !_475;
    int _569 = _567 ? 0 : 1;
    float _571 = float(_565);
    bool _573 = _521 > 0.0;
    float _575 = _501 ? _541 : 0.0;
    float _577 = _571 * _543;
    int _579 = ~_563;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    int _585 = _583;
    if (!_545)
    {
        int _587 = ~_563;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    float _593 = _577 * (-2.0);
    int _595 = abs(_569);
    if (_537)
    {
        float _597 = _575 * _557;
        _155 = _597;
    }
    float _599 = _155;
    bool _601 = _521 >= 0.0;
    bool _603 = isnan(_521);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = _445 + (-0.5);
    float _613 = float(_595);
    float _615 = fma(_593, _525, _525);
    float _617 = float(_591);
    float _619 = fma(_509, _593, _509);
    int _621 = _609 ? 0 : 1;
    float _623 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    bool _625 = !_483;
    int _627 = _625 ? 0 : 1;
    float _629 = _173 + _445;
    int _631 = ~_621;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = _613 * _617;
    int _639 = _635;
    if (!_573)
    {
        int _641 = ~_621;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = _629 + (-1.0);
    int _649 = abs(_627);
    float _651 = fma(_619, _599, _623);
    float _653 = _637 * (-2.0);
    float _655 = float(_649);
    float _657 = _651 * 0.15915493667125701904296875;
    float _659 = float(_645);
    float _661 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _663 = _173 + (-0.5);
    float _665 = fma(_653, _523, _523);
    float _667 = _173 + _437;
    float _669 = _655 * _659;
    float _671 = fma(_661, _653, _661);
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].x, _665);
    float _675 = _667 + (-1.0);
    float _677 = _669 * (-2.0);
    float _679 = fma(_671, _599, _673);
    float _681 = _657 * 6.283185482025146484375;
    float _683 = cos(_681);
    float _685 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _687 = fma(_677, _527, _527);
    float _689 = _437 + (-0.5);
    float _691 = _679 * 0.15915493667125701904296875;
    float _693 = fma(_685, _677, _685);
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].z, _687);
    float _697 = _691 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = fma(_693, _599, _695);
    float _703 = _701 * 0.15915493667125701904296875;
    float _705 = _691 * 6.283185482025146484375;
    float _707 = cos(_705);
    float _709 = _703 * 6.283185482025146484375;
    float _711 = cos(_709);
    float _713 = _699 * _683;
    float _715 = _657 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = _707 * _683;
    float _721 = _683 * _711;
    float _723 = _703 * 6.283185482025146484375;
    float _725 = sin(_723);
    float _727 = _699 * _717;
    float _729 = _707 * _717;
    float _731 = _699 * _711;
    float _733 = _707 * _711;
    float _735 = _717 * _711;
    float _737 = floor(_352);
    float _739 = fma(_725, _719, _727);
    float _741 = -_729;
    float _743 = fma(_725, _713, _741);
    float _745 = fma(_725, _727, _719);
    float _747 = -_713;
    float _749 = fma(_725, _729, _747);
    float _751 = -_737;
    float _753 = _352 + _751;
    float _755 = in.m_48.x;
    float _757 = in.m_48.y;
    float _759 = in.m_48.z;
    float _761 = -_409;
    float _763 = _761 + _431;
    float _765 = -_407;
    float _767 = _765 + _429;
    float _769 = -_411;
    float _771 = _769 + _433;
    float _773 = _763 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _775 = _767 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _777 = _771 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _779 = fma(_753, _763, _409);
    float _781 = _773 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _783 = _773 * _773;
    float _785 = _773 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _787 = fma(_753, _771, _411);
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    float _791 = _773 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _793 = fma(_775, _775, _783);
    float _795 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[4].x, _785);
    float _797 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[5].z, _789);
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[6].x, _791);
    float _801 = fma(_777, _777, _793);
    float _803 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[4].z, _795);
    float _805 = _797 * _797;
    float _807 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[6].z, _799);
    float _809 = _757 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _811 = fma(_753, _767, _407);
    float _813 = fma(_803, _803, _805);
    float _815 = sqrt(_801);
    float _817 = _757 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _819 = _779 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _821 = fma(_807, _807, _813);
    float _823 = _757 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _825 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[5].x, _817);
    float _827 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[4].x, _809);
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _819);
    float _831 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[6].x, _823);
    float _833 = rsqrt(_821);
    float _835 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _837 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[4].z, _827);
    float _839 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[5].z, _829);
    float _841 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[6].z, _831);
    float _843 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _845 = _837 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _847 = _841 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _849 = _843 + _839;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _849 + _851;
    float _855 = _815 * _833;
    float _857 = fma(_797, _855, _205);
    float _859 = fma(_803, _855, _203);
    float _861 = fma(_807, _855, _207);
    float _863 = _779 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _857 * _857;
    float _867 = _779 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _869 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _871 = fma(_859, _859, _865);
    float _873 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _867);
    float _875 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[4].z, _869);
    float _877 = fma(_861, _861, _871);
    float _879 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _881 = _845 + _875;
    float _883 = rsqrt(_877);
    float _885 = _847 + _879;
    float _887 = _853 * _853;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _881 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _885 + _893;
    float _897 = fma(_891, _891, _887);
    float _899 = fma(_895, _895, _897);
    float _901 = rsqrt(_899);
    float _903 = _857 * _883;
    float _905 = _859 * _883;
    float _907 = _861 * _883;
    float _909 = _903 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _911 = _749 * _907;
    float _913 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[8].y, _909);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[10].y, _913);
    float _917 = _853 * _901;
    float _919 = _891 * _901;
    float _921 = abs(_915);
    bool _923 = _921 > 0.99989998340606689453125;
    float _925 = _895 * _901;
    float _927 = -_917;
    float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _931 = -_919;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _935 = -_925;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = in.m_61.x;
    float _945 = in.m_61.y;
    float _947 = in.m_61.z;
    float _949 = _833;
    float _951 = _767;
    float _953 = _899;
    float _955 = _861;
    float _957 = _919;
    if (_923)
    {
        _949 = 0.001000000047497451305389404296875;
    }
    float _959 = _949;
    float _961 = fma(_937, _937, _941);
    if (!_923)
    {
        _951 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _963 = _951;
    float _965 = _963;
    if (!_923)
    {
        _953 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _967 = _953;
    float _969 = _967;
    if (_923)
    {
        float _971 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _965 = _971;
    }
    float _973 = _965;
    if (_923)
    {
        float _975 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _969 = _975;
    }
    float _977 = _969;
    if (!_923)
    {
        _955 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _979 = _955;
    float _981 = -_973;
    float _983 = _907 * _981;
    float _985 = sqrt(_961);
    float _987 = _979;
    if (_923)
    {
        float _989 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _987 = _989;
    }
    float _991 = _987;
    float _993 = -_977;
    float _995 = _903 * _993;
    float _997 = -_977;
    float _999 = -_983;
    float _1001 = fma(_905, _997, _999);
    float _1003 = in.m_63.x;
    float _1005 = in.m_63.y;
    float _1007 = in.m_63.z;
    float _1009 = -_991;
    float _1011 = -_995;
    float _1013 = fma(_907, _1009, _1011);
    float _1015 = -_991;
    float _1017 = _905 * _1015;
    float _1019 = _1001 * _1001;
    float _1021 = -_973;
    float _1023 = -_1017;
    float _1025 = fma(_903, _1021, _1023);
    float _1027 = fma(_1013, _1013, _1019);
    float _1029 = _945 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1031 = _947 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1033 = _943 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1035 = fma(_1025, _1025, _1027);
    float _1037 = _901 * _985;
    float _1039 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1041 = rsqrt(_1035);
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1047 = _1039 * _1037;
    float _1049 = _1043 * _1037;
    float _1051 = _1045 * _1037;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1005);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1007);
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1003);
    float _1059 = _1047 * _1053;
    float _1061 = _1049 * _1055;
    float _1063 = _733 * _907;
    float _1065 = _1001 * _1041;
    float _1067 = _1013 * _1041;
    float _1069 = _733 * _905;
    float _1071 = _1025 * _1041;
    float _1073 = _905 * _1065;
    float _1075 = _1051 * _1057;
    float _1077 = _739 * _907;
    float _1079 = -_725;
    float _1081 = fma(_1079, _1067, _1069);
    float _1083 = _903 * _1071;
    float _1085 = -_1073;
    float _1087 = fma(_903, _1067, _1085);
    float _1089 = -_725;
    float _1091 = fma(_1089, _1071, _1063);
    float _1093 = fma(_721, _1071, _1077);
    float _1095 = fma(_735, _1071, _911);
    float _1097 = _739 * _905;
    float _1099 = -_1083;
    float _1101 = fma(_907, _1065, _1099);
    float _1103 = fma(_731, _1087, _1091);
    float _1105 = fma(_743, _1087, _1093);
    float _1107 = fma(_745, _1087, _1095);
    float _1109 = _749 * _905;
    float _1111 = fma(_721, _1067, _1097);
    float _1113 = fma(_731, _1101, _1081);
    float _1115 = _1059 * _1103;
    float _1117 = fma(_735, _1067, _1109);
    float _1119 = fma(_743, _1101, _1111);
    float _1121 = _1059 * _1113;
    float _1123 = fma(_1075, _1105, _1115);
    float _1125 = fma(_745, _1101, _1117);
    float _1127 = _733 * _903;
    float _1129 = fma(_1075, _1119, _1121);
    float _1131 = fma(_1061, _1107, _1123);
    float _1133 = _907 * _1067;
    float _1135 = -_725;
    float _1137 = fma(_1135, _1065, _1127);
    float _1139 = fma(_1061, _1125, _1129);
    float _1141 = _885 + _1131;
    float _1143 = _739 * _903;
    float _1145 = -_1133;
    float _1147 = fma(_905, _1071, _1145);
    float _1149 = _881 + _1139;
    float _1151 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1153 = _1141 + _1151;
    float _1155 = _749 * _903;
    float _1157 = fma(_721, _1065, _1143);
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1161 = _1149 + _1159;
    float _1163 = _1153 * _1153;
    float _1165 = fma(_731, _1147, _1137);
    float _1167 = fma(_735, _1065, _1155);
    float _1169 = fma(_743, _1147, _1157);
    float _1171 = fma(_1161, _1161, _1163);
    float _1173 = _1059 * _1165;
    float _1175 = fma(_745, _1147, _1167);
    float _1177 = sqrt(_1171);
    float _1179 = fma(_1075, _1169, _1173);
    float _1181 = fma(_1061, _1175, _1179);
    float _1183 = _849 + _1181;
    bool _1185 = _1177 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1061;
    float _1189 = _1181;
    float _1191 = _1075;
    float _1193 = _1183;
    if (!_1185)
    {
        _1187 = _1149;
    }
    float _1195 = _1187;
    float _1197 = _1195;
    if (!_1185)
    {
        _1189 = _1141;
    }
    float _1199 = _1189;
    float _1201 = _1199;
    if (!_1185)
    {
        _1191 = _1183;
    }
    float _1203 = _1191;
    bool _1205 = !_1185;
    float _1207 = _1203;
    if (!_1205)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1213 = _1177 + _1211;
        float _1215 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = rsqrt(_1171);
        float _1219 = _1213 * _1209;
        float _1221 = _1219 * 0.15915493667125701904296875;
        float _1223 = _1221 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        float _1227 = _1221 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = fma(_1225, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1217 * _1231;
        float _1235 = _1229 + (-1.0);
        float _1237 = fma(_1161, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1239 = fma(_1153, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = fma(_1183, _1229, _1241);
        _1207 = _1243;
        _1197 = _1237;
        _1201 = _1239;
    }
    float _1245 = _1207;
    float _1247 = _1197;
    float _1249 = _1201;
    float _1251 = -_917;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1255 = -_919;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1259 = -_925;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1263 = -_919;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1269 = _1253 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1273 = _1257 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1277 = _1261 + _1275;
    float _1279 = -_925;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1283 = _1269 * _1269;
    float _1285 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1287 = fma(_1273, _1273, _1283);
    float _1289 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1285);
    float _1291 = fma(_1277, _1277, _1287);
    float _1293 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1289);
    float _1295 = rsqrt(_1291);
    float _1297 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1299 = sqrt(_1291);
    float _1301 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1303 = _1273 * _1301;
    float _1305 = _1277 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 * _1305;
    float _1311 = _1307 + _1309;
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1313 + _1317;
    float _1321 = _1277;
    float _1323 = _1311;
    float _1325 = _1319;
    float _1327 = _1269;
    float _1329 = _1281;
    if (_1315)
    {
        float _1331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1331;
    }
    float _1333 = _1321;
    if (_1315)
    {
        float _1335 = rsqrt(_1311);
        _1323 = _1335;
    }
    float _1337 = _1323;
    if (_1315)
    {
        float _1339 = _1319 * _1333;
        _1325 = _1339;
    }
    float _1341 = _1325;
    if (_1315)
    {
        float _1343 = _1341 * 0.15915493667125701904296875;
        _1193 = _1343;
    }
    float _1345 = _1193;
    float _1347 = _1287;
    float _1349 = _1345;
    if (_1315)
    {
        float _1351 = _1345 * 6.283185482025146484375;
        float _1353 = sin(_1351);
        _1347 = _1353;
    }
    float _1355 = _1347;
    float _1357 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1359 = precise::max(0.0, _1357);
    float _1361 = _1295;
    float _1363 = _1359;
    float _1365 = _1357;
    if (_1315)
    {
        float _1367 = _1345 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        _1361 = _1369;
    }
    float _1371 = _1361;
    float _1373 = -_1301;
    float _1375 = -_1359;
    float _1377 = fma(_1269, _1373, _1375);
    float _1379 = _1377;
    if (!_1315)
    {
        _1327 = _1307;
    }
    float _1381 = _1327;
    float _1383 = _1381;
    if (_1315)
    {
        float _1385 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1385;
    }
    float _1387 = _1363;
    if (!_1315)
    {
        _1349 = _1303;
    }
    float _1389 = _1349;
    float _1391 = _1355;
    float _1393 = _1389;
    if (_1315)
    {
        float _1395 = fma(_1355, _1387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1397;
    float _1401 = _1371;
    if (_1315)
    {
        float _1403 = _1371 + (-1.0);
        _1365 = _1403;
    }
    float _1405 = _1365;
    float _1407 = _1405;
    if (_1315)
    {
        float _1409 = _1337 * _1397;
        _957 = _1409;
    }
    float _1411 = _957;
    if (!_1315)
    {
        _1399 = _1309;
    }
    float _1413 = _1399;
    float _1415 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1417 = _1413;
    if (_1315)
    {
        float _1419 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1407 = _1419;
    }
    float _1421 = _1407;
    if (_1315)
    {
        float _1423 = _1303 * _1411;
        _1393 = _1423;
    }
    float _1425 = _1393;
    float _1427 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1415);
    if (_1315)
    {
        float _1429 = fma(_1377, _1371, _1421);
        _1379 = _1429;
    }
    float _1431 = _1379;
    if (!_1315)
    {
        _1401 = _1305;
    }
    float _1433 = _1401;
    float _1435 = _1433;
    if (_1315)
    {
        float _1437 = _1305 * _1411;
        _1435 = _1437;
    }
    float _1439 = _1435;
    if (_1315)
    {
        float _1441 = _1425 * _1425;
        _1383 = _1441;
    }
    float _1443 = _1383;
    float _1445 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1427);
    if (_1315)
    {
        float _1447 = _1439 * _1439;
        _1417 = _1447;
    }
    float _1449 = _1417;
    float _1451 = fma(_1431, _1431, _1443);
    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1455 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1453);
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1461 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1463 = _1451 + _1449;
    float _1465 = -_1457;
    float _1467 = _1465 + 1.0;
    float _1469 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1459);
    float _1471 = rsqrt(_1463);
    float _1473 = fma(_1265, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1475 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1479 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1481 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = abs(_1467);
    float _1487 = log2(_1485);
    float _1489 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1491 = -_1479;
    float _1493 = fma(_1491, _1477, 1.0);
    float _1495 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1489);
    float _1497 = _1471 * _1425;
    float _1499 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1495);
    float _1501 = floor(_1473);
    float _1503 = _1471 * _1431;
    float _1505 = _1471 * _1439;
    float _1507 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1509 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1511 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1513 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1515 = -_1507;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1515);
    float _1519 = floor(_1481);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1511);
    float _1523 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1525 = -_1505;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1517);
    float _1529 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1521);
    float _1531 = _1503 + 1.0;
    float _1533 = log2(_1493);
    float _1535 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1529);
    float _1537 = -_1501;
    float _1539 = _1473 + _1537;
    float _1541 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1543 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1541);
    float _1545 = exp2(_1513);
    float _1547 = fma(_1527, -0.5, 0.5);
    float _1549 = fma(_1527, 0.5, 0.5);
    float _1551 = -_1519;
    float _1553 = _1481 + _1551;
    float _1555 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1523);
    float _1557 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1543);
    float _1559 = fma(_1549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1561 = 1.0 / _1535;
    float _1563 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1557);
    float _1565 = fma(_1549, _1559, -0.212114393711090087890625);
    float _1567 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1555);
    float _1569 = sqrt(_1547);
    float _1571 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1567);
    float _1573 = -_1503;
    float _1575 = fma(_1545, _1531, _1573);
    float _1577 = _1533 * 0.693147182464599609375;
    float2 _4895 = float2(_1539, _1553);
    float _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4895, float2(0.0), isnan(_4895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4895, float2(0.0), isnan(_4895)), level(0.0)).x;
    float _1581 = fma(_1549, _1565, 1.570728778839111328125);
    float _1583 = fma(_1575, 0.5, 0.5);
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1587 = _1563 * _1561;
    float _1589 = _1571 * _1561;
    float _1591 = fma(_1587, 0.5, 0.5);
    float _1593 = fma(_1589, -0.5, 0.5);
    float _1595 = _1569 * 0.636619746685028076171875;
    float3 _4929 = float3(_1591, _1593, _1585);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4929, float3(0.0), isnan(_4929)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4929, float3(0.0), isnan(_4929)), level(0.0)).x;
    float _1599 = -_1581;
    float _1601 = fma(_1595, _1599, 1.0);
    float3 _4945 = float3(_1591, _1593, _1585);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float2 _4961 = float2(_1601, _1583);
    float3 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4961, float2(0.0), isnan(_4961)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4961, float2(0.0), isnan(_4961)), level(0.0)).xyz;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = in.m_55.w;
    float _1625 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1627 = -_917;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1635 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1637 = isnan(_241);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = _1625 * _173;
    bool _1649 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1651 = isnan(_241);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1661;
    float _1665 = 1.0 / _1633;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1669 = _241 + _1667;
    float _1671 = -_1645;
    float _1673 = _1671 + 1.0;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1679 = _1659 * _1673;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1683 = _1681 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1685 = trunc(_1647);
    int _1687 = int(_1685);
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1691 = _1689 != 0;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1695 = _1693 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1699 = _1697 != 0;
    float _1701 = -_1659;
    float _1703 = _1701 + 1.0;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1707 = _1705 != 0;
    float _1709 = in.m_65.x;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1713 = _1711 != 0;
    float _1715 = _1663 * _1665;
    float _1717 = 1.0 / _1677;
    int _1719 = _211 + 8;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    uint _1723 = uint(int(uint(int(_1721)) >> uint(2)));
    int _1725 = int(_1721) & 3;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[int(_1723)][_1725];
    float _1729 = in.m_65.y;
    float _1731 = fma(_1715, _1669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1733 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1735 = isnan(_241);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1747 = _1687 << 4;
    int _1749 = _1747 + 1968;
    uint _1751 = uint(int(uint(_211) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[int(_1761)][_1763];
    float _1767 = 1.0 / _1695;
    float _1769 = _1743 * _1703;
    bool _1771 = _445 > 0.5;
    float _1773 = -_1743;
    float _1775 = _1773 + 1.0;
    bool _1777 = _1623 > 0.5;
    float _1779 = _1731 * _1769;
    bool _1781 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1783 = isnan(_241);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    int _1793 = _1749 + 8;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[int(_1797)][_1799];
    float _1803 = _1683 * _1717;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1805;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1811 = _241 + _1809;
    float _1813 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1779);
    float _1815 = -_1791;
    float _1817 = _1815 + 1.0;
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1821 = fma(_1803, _1811, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    uint _1823 = uint(int(uint(_1749) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c9)._m0[int(_1833)][_1835];
    float _1839 = _1807 * _1767;
    float _1841 = -_1729;
    float _1843 = _1841 + 1.0;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1847 = _241 + _1845;
    float _1849 = _1645 * _1817;
    float _1851 = fma(_1821, _1679, _1813);
    float _1853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1855 = fma(_1839, _1847, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1857 = _1777 ? as_type<int>(_1843) : as_type<int>(_1729);
    float _1859 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1745);
    bool _1861 = _1777;
    int _1863 = as_type<int>(_1851);
    float _1865 = _1729;
    int _1867 = as_type<int>(_1849);
    float _1869 = _1709;
    float _1871 = _1535;
    float _1873 = _1571;
    if (_1699)
    {
        bool _1875 = _437 > 0.5;
        _1861 = _1875;
    }
    bool _1877 = _1861;
    float _1879 = fma(_1855, _1849, _1851);
    float _1881 = _1707 ? as_type<float>(_1857) : _1729;
    if (_1691)
    {
        float _1883 = -_1709;
        float _1885 = _1883 + 1.0;
        _1863 = as_type<int>(_1885);
    }
    int _1887 = _1863;
    if (_1713)
    {
        float _1889 = _1771 ? _1843 : _1729;
        _1865 = _1889;
    }
    float _1891 = _1865;
    float _1893 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1879);
    float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1691)
    {
        bool _1897 = _173 > 0.5;
        _513 = _1897;
    }
    bool _1899 = _513;
    if (_1699)
    {
        float _1901 = -_1709;
        float _1903 = _1901 + 1.0;
        _1867 = as_type<int>(_1903);
    }
    int _1905 = _1867;
    if (!_1691)
    {
        _215 = _1709;
    }
    float _1907 = _215;
    float _1909 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1911 = _1907;
    if (_1691)
    {
        float _1913 = _1899 ? as_type<float>(_1887) : _1709;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1859);
    if (_1699)
    {
        float _1919 = _1877 ? as_type<float>(_1905) : _1709;
        _1869 = _1919;
    }
    float _1921 = _1869;
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1925 = _1005 != 0.0;
    bool _1927 = isnan(_1005);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(0.0);
    bool _1933 = _1929 || _1931;
    float _1935 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1937 = in.m_67.x;
    bool _1939 = _1003 == 0.0;
    bool _1941 = !_1933;
    bool _1943 = _1939 && _1941;
    float _1945 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1947 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1949 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1951 = _1765 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1953 = _1007 == 0.0;
    bool _1955 = _1953 && _1943;
    float _1957 = _1947 * _1819;
    float _1959 = _1935 * _1853;
    float _1961 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = _1801 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1965 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1629 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1969 = _1629 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1971 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1973 = _1963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1975 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1967);
    float _1977 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1969);
    float _1979 = _1829 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1981 = _1837 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1983 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1975);
    float _1985 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1977);
    float _1987 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1989 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1991 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1993 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1995 = _1987 * _1923;
    float _1997 = _1989 * _1895;
    float _1999 = 1.0 / _1991;
    float _2001 = _1993 + _1991;
    out.m_69.x = _1961;
    out.m_69.y = _1971;
    out.m_69.z = _1965;
    out.m_69.w = _1909;
    float _2003 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2005 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1959;
    out.m_71.y = _1957;
    out.m_71.z = _1997;
    out.m_71.w = _1995;
    out.m_73.x = _2003;
    out.m_73.y = _2005;
    out.m_73.z = _1973;
    float _2007 = _2001 * _1999;
    float _2009 = _2007 * 0.5;
    float _2011 = in.m_75.x;
    float _2013 = in.m_75.y;
    float _2015 = in.m_75.z;
    float _2017 = in.m_75.w;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2021 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2019);
    float _2023 = in.m_77.x;
    float _2025 = in.m_77.y;
    float _2027 = in.m_77.z;
    float _2029 = 1.0 / _2021;
    float _2031 = _1165 * _2013;
    float _2033 = _1103 * _2013;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2037 = _2029 * _2035;
    float _2039 = fma(_1169, _2011, _2031);
    float _2041 = fma(_1105, _2011, _2033);
    float _2043 = abs(_2037);
    float _2045 = log2(_2043);
    float _2047 = _2021;
    float _2049 = _1991;
    float _2051 = _1961;
    if (_1955)
    {
        _2047 = _2025;
    }
    float _2053 = _2047;
    float _2055 = _2053;
    if (_1955)
    {
        _1329 = _2023;
    }
    float _2057 = _1329;
    float _2059 = _2057;
    if (_1955)
    {
        _2049 = _2027;
    }
    float _2061 = _2049;
    float _2063 = _2061;
    if (_1955)
    {
        _2051 = _2057;
    }
    float _2065 = _2051;
    float _2067 = _2065;
    if (!_1955)
    {
        _2059 = _2023;
    }
    float _2069 = _2059;
    if (!_1955)
    {
        float _2071 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2069);
        _2067 = _2071;
    }
    float _2073 = _2067;
    float _2075 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2077 = _2045;
    if (_1955)
    {
        _2077 = _2053;
    }
    float _2079 = _2077;
    float _2081 = -_413;
    float _2083 = _2081 + _435;
    float _2085 = _2079;
    if (!_1955)
    {
        _2055 = _2025;
    }
    float _2087 = _2055;
    float _2089 = exp2(_2075);
    float _2091 = fma(_753, _2083, _413);
    if (!_1955)
    {
        float _2093 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2087);
        _2085 = _2093;
    }
    float _2095 = _2085;
    bool _2097 = _2037 <= 8000.0;
    bool _2099 = isnan(_2037);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan(8000.0);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    out.m_79.w = _2091;
    float _2109 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = _2089;
    if (_1955)
    {
        _2113 = _2061;
    }
    float _2115 = _2113;
    float _2117 = _2115;
    if (!_1955)
    {
        _2063 = _2027;
    }
    float _2119 = _2063;
    float _2121 = fma(_2111, -2.0, 3.0);
    float _2123 = _2111 * _2111;
    float _2125 = _2015 * _2069;
    float _2127 = _2013 * _2119;
    float _2129 = _2123 * _2121;
    float _2131 = -_2125;
    float _2133 = fma(_2011, _2119, _2131);
    if (!_1955)
    {
        float _2135 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2119);
        _2117 = _2135;
    }
    float _2137 = _2117;
    float _2139 = -_2127;
    float _2141 = fma(_2015, _2087, _2139);
    float _2143 = -_2129;
    float _2145 = _2143 + 1.0;
    float _2147 = _2133 * _2017;
    float _2149 = _2011 * _2087;
    float _2151 = _2141 * _2017;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2129);
    float _2155 = _1113 * _2013;
    float _2157 = _1113 * _2147;
    float _2159 = _1103 * _2095;
    float _2161 = _2107 * _2153;
    float _2163 = _1113 * _2095;
    float _2165 = _1165 * _2095;
    float _2167 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2169 = _1165 * _2147;
    float _2171 = _1103 * _2147;
    float _2173 = fma(_1119, _2011, _2155);
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2177 = fma(_1119, _2151, _2157);
    float _2179 = exp2(_2167);
    float _2181 = fma(_1169, _2151, _2169);
    float _2183 = fma(_1105, _2151, _2171);
    float _2185 = fma(_1119, _2073, _2163);
    float _2187 = fma(_1169, _2073, _2165);
    float _2189 = fma(_1105, _2073, _2159);
    float _2191 = -_2149;
    float _2193 = fma(_2013, _2069, _2191);
    float _2195 = fma(_1125, _2015, _2173);
    float _2197 = fma(_1175, _2015, _2039);
    float _2199 = fma(_1107, _2015, _2041);
    float _2201 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _2203 = _2193 * _2017;
    float _2205 = fma(_1125, _2137, _2185);
    float _2207 = fma(_1107, _2137, _2189);
    out.m_81.x = _2195;
    out.m_81.y = _2197;
    out.m_81.z = _2199;
    float _2209 = -_2179;
    float _2211 = _2209 + 1.0;
    float _2213 = _2201 + _1535;
    bool _2215 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2217 = isnan(_1299);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2223 = _2219 || _2221;
    out.gl_Position.x = _1563;
    out.gl_Position.y = _1571;
    out.gl_Position.z = _2201;
    out.gl_Position.w = _1535;
    float _2225 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2227 = _2213 * 0.5;
    float _2229 = fma(_1175, _2137, _2187);
    float _2231 = fma(_1125, _2203, _2177);
    float _2233 = fma(_1175, _2203, _2181);
    float _2235 = fma(_1107, _2203, _2183);
    out.m_83.z = _2227;
    out.m_83.w = _1535;
    out.m_85.x = _2205;
    out.m_85.y = _2229;
    out.m_85.z = _2207;
    float _2237 = -_2225;
    float _2239 = _2237 + 1.0;
    out.m_87.x = _2231;
    out.m_87.y = _2233;
    out.m_87.z = _2235;
    float _2241 = _2201;
    float _2243 = _2233;
    float _2245 = _2231;
    float _2247 = _2239;
    if (!_2223)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2249 = _1871;
    float _2251 = _2249;
    float _2253 = _2249;
    if (!_2223)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2255 = _2241;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2223)
    {
        _1873 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2261 = _1873;
    float _2263 = _2261;
    float _2265 = _2261;
    if (!_2223)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2267 = _2243;
    float _2269 = _2267;
    float _2271 = _2267;
    if (!_2223)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2273 = _2245;
    float _2275 = -_1579;
    float _2277 = _2275 + 1.0;
    float _2279 = _2277 * _2175;
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    float _2283 = -_2281;
    float _2285 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2287 = _2285 * _1937;
    float _2289 = _2225 * _1597;
    float _2291 = _2287 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2293 = _1611 * _2289;
    float _2295 = _1611 * _2239;
    float _2297 = _2273;
    float _2299 = _2273;
    if (!_2223)
    {
        _2247 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2301 = _2247;
    out.m_89.x = _2291;
    float _2303 = _1621 * _2289;
    float _2305 = fma(_1617, _2293, _1605);
    float _2307 = fma(_1619, _2293, _1607);
    float _2309 = fma(_1611, _2303, _1609);
    out.m_91.x = _2305;
    out.m_91.y = _2307;
    out.m_91.z = _2309;
    out.m_91.w = _2295;
    bool _2311 = !_2223;
    float _2313 = _2301;
    float _2315 = _2301;
    if (!_2311)
    {
        bool _2317 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2319 = isnan(_1299);
        bool _2321 = _2317 || _2319;
        bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2325 = _2321 || _2323;
        if (!_2325)
        {
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2329 = _1299 + _2327;
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2331;
            float _2335 = 1.0 / _2333;
            float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2357 = _2329 * _2335;
            float _2359 = precise::clamp(_2357, 0.0, 1.0);
            float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2365 = fma(_2359, _2339, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2299 = _2367;
            _2265 = _2373;
            _2271 = _2365;
            _2259 = _2371;
            _2253 = _2369;
            _2315 = _2375;
            _2377 = true;
        }
        else
        {
            bool _2379 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2381 = isnan(_1299);
            bool _2383 = _2379 || _2381;
            bool _2385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2387 = _2383 || _2385;
            if (!_2387)
            {
                _2269 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2389 = _2269;
            _2271 = _2389;
            if (!_2387)
            {
                _2297 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2391 = _2297;
            _2299 = _2391;
            if (!_2387)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2393 = _2251;
            _2253 = _2393;
            if (!_2387)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2395 = _2257;
            _2259 = _2395;
            if (!_2387)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2397 = _2263;
            _2265 = _2397;
            if (!_2387)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2399 = _2313;
            bool _2401 = !_2387;
            _2315 = _2399;
            if (!_2401)
            {
                bool _2403 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2405 = isnan(_1299);
                bool _2407 = _2403 || _2405;
                bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2411 = _2407 || _2409;
                if (!_2411)
                {
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2415 = _1299 + _2413;
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2419 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2417;
                    float _2421 = 1.0 / _2419;
                    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2443 = _2415 * _2421;
                    float _2445 = precise::clamp(_2443, 0.0, 1.0);
                    float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2451 = fma(_2445, _2425, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2453 = fma(_2445, _2449, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2455 = fma(_2445, _2429, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2457 = fma(_2445, _2433, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2459 = fma(_2445, _2437, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2461 = fma(_2445, _2441, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2299 = _2453;
                    _2265 = _2459;
                    _2271 = _2451;
                    _2259 = _2457;
                    _2253 = _2455;
                    _2315 = _2461;
                    _2377 = true;
                }
                else
                {
                    _2299 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2271 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2377 = false;
    float _2463 = _2299;
    float _2465 = _2265;
    float _2467 = _2271;
    float _2469 = _2259;
    float _2471 = _2253;
    float _2473 = _2315;
    float _2475 = fma(_2229, -0.5, 0.5);
    float _2477 = precise::clamp(_2475, 0.0, 1.0);
    float _2479 = -_2463;
    float _2481 = _2479 + _2465;
    float _2483 = -_2467;
    float _2485 = _2483 + _2469;
    float _2487 = -_2471;
    float _2489 = _2487 + _2473;
    bool _2491 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2493 = fma(_2477, _2481, _2463);
    float _2495 = fma(_2477, _2485, _2467);
    float _2497 = fma(_2477, _2489, _2471);
    float _2499 = _2493 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2501 = fma(_2495, 0.298911988735198974609375, _2499);
    float _2503 = fma(_2497, 0.114477999508380889892578125, _2501);
    out.m_93.x = 0.0;
    float _2505 = -_2503;
    float _2507 = _2495 + _2505;
    float _2509 = -_2503;
    float _2511 = _2493 + _2509;
    float _2513 = -_2503;
    float _2515 = _2497 + _2513;
    float _2517 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2519 = fma(_2507, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    float _2521 = fma(_2511, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    float _2523 = fma(_2515, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    out.m_89.w = _2517;
    out.m_95.x = _2519;
    out.m_95.y = _2521;
    out.m_95.z = _2523;
    if (!_2491)
    {
        return out;
    }
    float _2525 = -_1253;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2529 = -_1257;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2533 = -_1261;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2537 = _2527 * _2527;
    float _2539 = fma(_2531, _2531, _2537);
    float _2541 = fma(_2535, _2535, _2539);
    float _2543 = sqrt(_2541);
    float _2545 = rsqrt(_2541);
    float _2547 = -_2543;
    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2551 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2531 * _2545;
    float _2557 = _2527 * _2545;
    float _2559 = abs(_2553);
    float _2561 = log2(_2559);
    float _2563 = _2535 * _2545;
    float _2565 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2567 = _2229 * _2557;
    float _2569 = -_2557;
    float _2571 = -_2565;
    float _2573 = fma(_2569, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2571);
    float _2575 = fma(_2205, _2555, _2567);
    float _2577 = -_2563;
    float _2579 = fma(_2577, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2573);
    float _2581 = fma(_2207, _2563, _2575);
    float _2583 = precise::clamp(_2581, 0.0, 1.0);
    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2587 = _2579 + _2585;
    float _2589 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2591 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2593 = precise::clamp(_2591, 0.0, 1.0);
    float _2595 = exp2(_2589);
    float _2597 = _2595 * _2593;
    float _2599 = _2583 * _2597;
    float _2601 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2603 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2605 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2601;
    out.m_93.y = _2603;
    out.m_93.z = _2605;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2377 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_133);
        out.gl_Position.z = _2662;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_53.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_51.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2731 = as_type<float>(_171);
        out.gl_Position.z = _2731;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = in.m_55.x;
    float _175 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _179 = in.m_57.x;
    float _181 = in.m_57.y;
    float _183 = in.m_57.z;
    float _185 = _175 * _173;
    float _187 = _181 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _181 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = trunc(_185);
    int _193 = int(_191);
    float _195 = _181 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    float _203 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _205 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _207 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    int _209 = _193 << 4;
    int _211 = _209 + 1712;
    bool _213 = !_177;
    float _215 = _173;
    float _231;
    if (!_213)
    {
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _219 = _173 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_117);
        float _237 = 1.0 / _235;
        float _239 = _151 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    int _243 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _245 = _243;
    int _247 = 0;
    int _249 = _108(_245, _247, (*spvDescriptorSet0.support_buffer));
    int _251 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).y;
    int _253 = _251;
    int _255 = 0;
    int _257 = _108(_253, _255, (*spvDescriptorSet0.support_buffer));
    float _259 = in.m_59.w;
    float _261 = trunc(_259);
    int _263 = int(_261);
    int _265 = abs(_263);
    uint _268 = uint(int(uint(_263) >> uint(31)));
    float _270 = float(uint(_265));
    int _272 = ~int(_268);
    int _274 = _272 + 1;
    float _276 = float(_257);
    float _278 = float(_249);
    float _280 = trunc(_276);
    int _282 = int(_280);
    float _284 = _278 + (-1.0);
    int _286 = abs(_282);
    bool _288 = _282 == 0;
    float _290 = float(uint(_286));
    int _292 = ~_286;
    int _294 = _292 + 1;
    float _296 = 1.0 / _290;
    float _298 = _278 + 9.9999997473787516355514526367188e-06;
    float _300 = 1.0 / _298;
    int _302 = as_type<int>(_296) + (-2);
    int _304 = ~_286;
    int _306 = _304 + 1;
    float _308 = as_type<float>(_302) * _270;
    float _310 = trunc(_308);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    int _316 = _294 * int(_314);
    int _318 = _316 + _265;
    float _320 = float(uint(_318));
    float _322 = as_type<float>(_302) * _320;
    float _324 = _151 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _326 = fma(_324, _300, _173);
    float _328 = trunc(_322);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    float _334 = floor(_326);
    int _336 = int(_314) + int(_332);
    float _338 = trunc(_284);
    int _340 = int(_338);
    int _342 = _306 * _336;
    int _344 = _342 + _265;
    float _346 = -_334;
    float _348 = _326 + _346;
    bool _350 = uint(_344) >= uint(_286);
    float _352 = _278 * _348;
    bool _354 = !_350;
    int _356 = _354 ? 0 : (-1);
    float _358 = trunc(_352);
    int _360 = int(_358);
    int _362 = ~_336;
    int _364 = _362 + _356;
    int _366 = _364 + 1;
    int _368 = _286 * _366;
    int _370 = _368 + _265;
    int _372 = _370 ^ _274;
    int _374 = ~_274;
    int _376 = _374 + _372;
    int _378 = _376 + 1;
    bool _380 = _360 >= _340;
    int _382 = _360 + 1;
    bool _384 = !_288;
    int _386 = _384 ? _378 : (-1);
    bool _388 = !_380;
    int _390 = _388 ? _382 : 0;
    int _392 = _360;
    int _394 = 0;
    int _396 = _109(_392, _394, (*spvDescriptorSet0.support_buffer));
    int _398 = _386;
    int _400 = 0;
    int _402 = _109(_398, _400, (*spvDescriptorSet0.support_buffer));
    float4 _405 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_396, _402)), 0).xyzw;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = _405.w;
    int _415 = _390;
    int _417 = 0;
    int _419 = _109(_415, _417, (*spvDescriptorSet0.support_buffer));
    int _421 = _386;
    int _423 = 0;
    int _425 = _109(_421, _423, (*spvDescriptorSet0.support_buffer));
    float4 _427 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_419, _425)), 0).xyzw;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _427.w;
    float _437 = in.m_55.z;
    float _439 = _173 * 2.0;
    float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _443 = log2(_441);
    float _445 = in.m_55.y;
    float _447 = floor(_439);
    float _449 = _443 * _151;
    float _451 = exp2(_449);
    float _453 = _437 * 2.0;
    bool _455 = _447 > 0.0;
    bool _457 = _447 >= 0.0;
    bool _459 = isnan(_447);
    bool _461 = _457 || _459;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    float _467 = _445 + _437;
    float _469 = floor(_453);
    float _471 = _445 * 2.0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    float _485 = _467 + (-1.0);
    int _487 = _465 ? 0 : 1;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _491 = 1.0 + _489;
    bool _493 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _501 = _497 || _499;
    int _503 = ~_487;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    float _509 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _511 = _507;
    bool _513 = _479;
    if (!_455)
    {
        int _515 = ~_487;
        int _517 = _515 + 1;
        _511 = _517;
    }
    int _519 = _511;
    float _521 = floor(_471);
    float _523 = in.m_59.x;
    float _525 = in.m_59.y;
    float _527 = in.m_59.z;
    bool _529 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(1.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = -_451;
    float _541 = _539 + 1.0;
    float _543 = float(_519);
    bool _545 = _469 > 0.0;
    bool _547 = _469 >= 0.0;
    bool _549 = isnan(_469);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = 1.0 / _491;
    bool _559 = !_479;
    int _561 = _559 ? 0 : 1;
    int _563 = _555 ? 0 : 1;
    int _565 = abs(_561);
    bool _567 = !_475;
    int _569 = _567 ? 0 : 1;
    float _571 = float(_565);
    bool _573 = _521 > 0.0;
    float _575 = _501 ? _541 : 0.0;
    float _577 = _571 * _543;
    int _579 = ~_563;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    int _585 = _583;
    if (!_545)
    {
        int _587 = ~_563;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    float _593 = _577 * (-2.0);
    int _595 = abs(_569);
    if (_537)
    {
        float _597 = _575 * _557;
        _155 = _597;
    }
    float _599 = _155;
    bool _601 = _521 >= 0.0;
    bool _603 = isnan(_521);
    bool _605 = _601 || _603;
    bool _607 = isnan(0.0);
    bool _609 = _605 || _607;
    float _611 = _445 + (-0.5);
    float _613 = float(_595);
    float _615 = fma(_593, _525, _525);
    float _617 = float(_591);
    float _619 = fma(_509, _593, _509);
    int _621 = _609 ? 0 : 1;
    float _623 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    bool _625 = !_483;
    int _627 = _625 ? 0 : 1;
    float _629 = _173 + _445;
    int _631 = ~_621;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = _613 * _617;
    int _639 = _635;
    if (!_573)
    {
        int _641 = ~_621;
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    float _647 = _629 + (-1.0);
    int _649 = abs(_627);
    float _651 = fma(_619, _599, _623);
    float _653 = _637 * (-2.0);
    float _655 = float(_649);
    float _657 = _651 * 0.15915493667125701904296875;
    float _659 = float(_645);
    float _661 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _663 = _173 + (-0.5);
    float _665 = fma(_653, _523, _523);
    float _667 = _173 + _437;
    float _669 = _655 * _659;
    float _671 = fma(_661, _653, _661);
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].x, _665);
    float _675 = _667 + (-1.0);
    float _677 = _669 * (-2.0);
    float _679 = fma(_671, _599, _673);
    float _681 = _657 * 6.283185482025146484375;
    float _683 = cos(_681);
    float _685 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _687 = fma(_677, _527, _527);
    float _689 = _437 + (-0.5);
    float _691 = _679 * 0.15915493667125701904296875;
    float _693 = fma(_685, _677, _685);
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[196].z, _687);
    float _697 = _691 * 6.283185482025146484375;
    float _699 = sin(_697);
    float _701 = fma(_693, _599, _695);
    float _703 = _701 * 0.15915493667125701904296875;
    float _705 = _691 * 6.283185482025146484375;
    float _707 = cos(_705);
    float _709 = _703 * 6.283185482025146484375;
    float _711 = cos(_709);
    float _713 = _699 * _683;
    float _715 = _657 * 6.283185482025146484375;
    float _717 = sin(_715);
    float _719 = _707 * _683;
    float _721 = _683 * _711;
    float _723 = _703 * 6.283185482025146484375;
    float _725 = sin(_723);
    float _727 = _699 * _717;
    float _729 = _707 * _717;
    float _731 = _699 * _711;
    float _733 = _707 * _711;
    float _735 = _717 * _711;
    float _737 = floor(_352);
    float _739 = fma(_725, _719, _727);
    float _741 = -_729;
    float _743 = fma(_725, _713, _741);
    float _745 = fma(_725, _727, _719);
    float _747 = -_713;
    float _749 = fma(_725, _729, _747);
    float _751 = -_737;
    float _753 = _352 + _751;
    float _755 = in.m_48.x;
    float _757 = in.m_48.y;
    float _759 = in.m_48.z;
    float _761 = -_409;
    float _763 = _761 + _431;
    float _765 = -_407;
    float _767 = _765 + _429;
    float _769 = -_411;
    float _771 = _769 + _433;
    float _773 = _763 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _775 = _767 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _777 = _771 * (*spvDescriptorSet0.vp_c13)._m0[4].w;
    float _779 = fma(_753, _763, _409);
    float _781 = _773 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _783 = _773 * _773;
    float _785 = _773 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _787 = fma(_753, _771, _411);
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    float _791 = _773 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _793 = fma(_775, _775, _783);
    float _795 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[4].x, _785);
    float _797 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[5].z, _789);
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[6].x, _791);
    float _801 = fma(_777, _777, _793);
    float _803 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[4].z, _795);
    float _805 = _797 * _797;
    float _807 = fma(_777, (*spvDescriptorSet0.vp_c10)._m0[6].z, _799);
    float _809 = _757 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _811 = fma(_753, _767, _407);
    float _813 = fma(_803, _803, _805);
    float _815 = sqrt(_801);
    float _817 = _757 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _819 = _779 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _821 = fma(_807, _807, _813);
    float _823 = _757 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _825 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[5].x, _817);
    float _827 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[4].x, _809);
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _819);
    float _831 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[6].x, _823);
    float _833 = rsqrt(_821);
    float _835 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _837 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[4].z, _827);
    float _839 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[5].z, _829);
    float _841 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[6].z, _831);
    float _843 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _845 = _837 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _847 = _841 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _849 = _843 + _839;
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _849 + _851;
    float _855 = _815 * _833;
    float _857 = fma(_797, _855, _205);
    float _859 = fma(_803, _855, _203);
    float _861 = fma(_807, _855, _207);
    float _863 = _779 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _857 * _857;
    float _867 = _779 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _869 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _871 = fma(_859, _859, _865);
    float _873 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _867);
    float _875 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[4].z, _869);
    float _877 = fma(_861, _861, _871);
    float _879 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _881 = _845 + _875;
    float _883 = rsqrt(_877);
    float _885 = _847 + _879;
    float _887 = _853 * _853;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _881 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _885 + _893;
    float _897 = fma(_891, _891, _887);
    float _899 = fma(_895, _895, _897);
    float _901 = rsqrt(_899);
    float _903 = _857 * _883;
    float _905 = _859 * _883;
    float _907 = _861 * _883;
    float _909 = _903 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _911 = _749 * _907;
    float _913 = fma(_905, (*spvDescriptorSet0.vp_c10)._m0[8].y, _909);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[10].y, _913);
    float _917 = _853 * _901;
    float _919 = _891 * _901;
    float _921 = abs(_915);
    bool _923 = _921 > 0.99989998340606689453125;
    float _925 = _895 * _901;
    float _927 = -_917;
    float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _931 = -_919;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _935 = -_925;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _939 = _929 * _929;
    float _941 = fma(_933, _933, _939);
    float _943 = in.m_61.x;
    float _945 = in.m_61.y;
    float _947 = in.m_61.z;
    float _949 = _833;
    float _951 = _767;
    float _953 = _899;
    float _955 = _861;
    float _957 = _919;
    if (_923)
    {
        _949 = 0.001000000047497451305389404296875;
    }
    float _959 = _949;
    float _961 = fma(_937, _937, _941);
    if (!_923)
    {
        _951 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _963 = _951;
    float _965 = _963;
    if (!_923)
    {
        _953 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _967 = _953;
    float _969 = _967;
    if (_923)
    {
        float _971 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _965 = _971;
    }
    float _973 = _965;
    if (_923)
    {
        float _975 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _969 = _975;
    }
    float _977 = _969;
    if (!_923)
    {
        _955 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _979 = _955;
    float _981 = -_973;
    float _983 = _907 * _981;
    float _985 = sqrt(_961);
    float _987 = _979;
    if (_923)
    {
        float _989 = fma(_959, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _987 = _989;
    }
    float _991 = _987;
    float _993 = -_977;
    float _995 = _903 * _993;
    float _997 = -_977;
    float _999 = -_983;
    float _1001 = fma(_905, _997, _999);
    float _1003 = in.m_63.x;
    float _1005 = in.m_63.y;
    float _1007 = in.m_63.z;
    float _1009 = -_991;
    float _1011 = -_995;
    float _1013 = fma(_907, _1009, _1011);
    float _1015 = -_991;
    float _1017 = _905 * _1015;
    float _1019 = _1001 * _1001;
    float _1021 = -_973;
    float _1023 = -_1017;
    float _1025 = fma(_903, _1021, _1023);
    float _1027 = fma(_1013, _1013, _1019);
    float _1029 = _945 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1031 = _947 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1033 = _943 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1035 = fma(_1025, _1025, _1027);
    float _1037 = _901 * _985;
    float _1039 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1041 = rsqrt(_1035);
    float _1043 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1045 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1047 = _1039 * _1037;
    float _1049 = _1043 * _1037;
    float _1051 = _1045 * _1037;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1005);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1007);
    float _1057 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1003);
    float _1059 = _1047 * _1053;
    float _1061 = _1049 * _1055;
    float _1063 = _733 * _907;
    float _1065 = _1001 * _1041;
    float _1067 = _1013 * _1041;
    float _1069 = _733 * _905;
    float _1071 = _1025 * _1041;
    float _1073 = _905 * _1065;
    float _1075 = _1051 * _1057;
    float _1077 = _739 * _907;
    float _1079 = -_725;
    float _1081 = fma(_1079, _1067, _1069);
    float _1083 = _903 * _1071;
    float _1085 = -_1073;
    float _1087 = fma(_903, _1067, _1085);
    float _1089 = -_725;
    float _1091 = fma(_1089, _1071, _1063);
    float _1093 = fma(_721, _1071, _1077);
    float _1095 = fma(_735, _1071, _911);
    float _1097 = _739 * _905;
    float _1099 = -_1083;
    float _1101 = fma(_907, _1065, _1099);
    float _1103 = fma(_731, _1087, _1091);
    float _1105 = fma(_743, _1087, _1093);
    float _1107 = fma(_745, _1087, _1095);
    float _1109 = _749 * _905;
    float _1111 = fma(_721, _1067, _1097);
    float _1113 = fma(_731, _1101, _1081);
    float _1115 = _1059 * _1103;
    float _1117 = fma(_735, _1067, _1109);
    float _1119 = fma(_743, _1101, _1111);
    float _1121 = _1059 * _1113;
    float _1123 = fma(_1075, _1105, _1115);
    float _1125 = fma(_745, _1101, _1117);
    float _1127 = _733 * _903;
    float _1129 = fma(_1075, _1119, _1121);
    float _1131 = fma(_1061, _1107, _1123);
    float _1133 = _907 * _1067;
    float _1135 = -_725;
    float _1137 = fma(_1135, _1065, _1127);
    float _1139 = fma(_1061, _1125, _1129);
    float _1141 = _885 + _1131;
    float _1143 = _739 * _903;
    float _1145 = -_1133;
    float _1147 = fma(_905, _1071, _1145);
    float _1149 = _881 + _1139;
    float _1151 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1153 = _1141 + _1151;
    float _1155 = _749 * _903;
    float _1157 = fma(_721, _1065, _1143);
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1161 = _1149 + _1159;
    float _1163 = _1153 * _1153;
    float _1165 = fma(_731, _1147, _1137);
    float _1167 = fma(_735, _1065, _1155);
    float _1169 = fma(_743, _1147, _1157);
    float _1171 = fma(_1161, _1161, _1163);
    float _1173 = _1059 * _1165;
    float _1175 = fma(_745, _1147, _1167);
    float _1177 = sqrt(_1171);
    float _1179 = fma(_1075, _1169, _1173);
    float _1181 = fma(_1061, _1175, _1179);
    float _1183 = _849 + _1181;
    bool _1185 = _1177 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1061;
    float _1189 = _1181;
    float _1191 = _1075;
    float _1193 = _1183;
    if (!_1185)
    {
        _1187 = _1149;
    }
    float _1195 = _1187;
    float _1197 = _1195;
    if (!_1185)
    {
        _1189 = _1141;
    }
    float _1199 = _1189;
    float _1201 = _1199;
    if (!_1185)
    {
        _1191 = _1183;
    }
    float _1203 = _1191;
    bool _1205 = !_1185;
    float _1207 = _1203;
    if (!_1205)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1213 = _1177 + _1211;
        float _1215 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = rsqrt(_1171);
        float _1219 = _1213 * _1209;
        float _1221 = _1219 * 0.15915493667125701904296875;
        float _1223 = _1221 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        float _1227 = _1221 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = fma(_1225, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1217 * _1231;
        float _1235 = _1229 + (-1.0);
        float _1237 = fma(_1161, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1239 = fma(_1153, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = fma(_1183, _1229, _1241);
        _1207 = _1243;
        _1197 = _1237;
        _1201 = _1239;
    }
    float _1245 = _1207;
    float _1247 = _1197;
    float _1249 = _1201;
    float _1251 = -_917;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1255 = -_919;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1259 = -_925;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1263 = -_919;
    float _1265 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1269 = _1253 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1273 = _1257 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1277 = _1261 + _1275;
    float _1279 = -_925;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1283 = _1269 * _1269;
    float _1285 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1287 = fma(_1273, _1273, _1283);
    float _1289 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1285);
    float _1291 = fma(_1277, _1277, _1287);
    float _1293 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1289);
    float _1295 = rsqrt(_1291);
    float _1297 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1299 = sqrt(_1291);
    float _1301 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1303 = _1273 * _1301;
    float _1305 = _1277 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 * _1305;
    float _1311 = _1307 + _1309;
    float _1313 = sqrt(_1311);
    bool _1315 = _1313 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1313 + _1317;
    float _1321 = _1277;
    float _1323 = _1311;
    float _1325 = _1319;
    float _1327 = _1269;
    float _1329 = _1281;
    if (_1315)
    {
        float _1331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1331;
    }
    float _1333 = _1321;
    if (_1315)
    {
        float _1335 = rsqrt(_1311);
        _1323 = _1335;
    }
    float _1337 = _1323;
    if (_1315)
    {
        float _1339 = _1319 * _1333;
        _1325 = _1339;
    }
    float _1341 = _1325;
    if (_1315)
    {
        float _1343 = _1341 * 0.15915493667125701904296875;
        _1193 = _1343;
    }
    float _1345 = _1193;
    float _1347 = _1287;
    float _1349 = _1345;
    if (_1315)
    {
        float _1351 = _1345 * 6.283185482025146484375;
        float _1353 = sin(_1351);
        _1347 = _1353;
    }
    float _1355 = _1347;
    float _1357 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1359 = precise::max(0.0, _1357);
    float _1361 = _1295;
    float _1363 = _1359;
    float _1365 = _1357;
    if (_1315)
    {
        float _1367 = _1345 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        _1361 = _1369;
    }
    float _1371 = _1361;
    float _1373 = -_1301;
    float _1375 = -_1359;
    float _1377 = fma(_1269, _1373, _1375);
    float _1379 = _1377;
    if (!_1315)
    {
        _1327 = _1307;
    }
    float _1381 = _1327;
    float _1383 = _1381;
    if (_1315)
    {
        float _1385 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1363 = _1385;
    }
    float _1387 = _1363;
    if (!_1315)
    {
        _1349 = _1303;
    }
    float _1389 = _1349;
    float _1391 = _1355;
    float _1393 = _1389;
    if (_1315)
    {
        float _1395 = fma(_1355, _1387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1397;
    float _1401 = _1371;
    if (_1315)
    {
        float _1403 = _1371 + (-1.0);
        _1365 = _1403;
    }
    float _1405 = _1365;
    float _1407 = _1405;
    if (_1315)
    {
        float _1409 = _1337 * _1397;
        _957 = _1409;
    }
    float _1411 = _957;
    if (!_1315)
    {
        _1399 = _1309;
    }
    float _1413 = _1399;
    float _1415 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1417 = _1413;
    if (_1315)
    {
        float _1419 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1407 = _1419;
    }
    float _1421 = _1407;
    if (_1315)
    {
        float _1423 = _1303 * _1411;
        _1393 = _1423;
    }
    float _1425 = _1393;
    float _1427 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1415);
    if (_1315)
    {
        float _1429 = fma(_1377, _1371, _1421);
        _1379 = _1429;
    }
    float _1431 = _1379;
    if (!_1315)
    {
        _1401 = _1305;
    }
    float _1433 = _1401;
    float _1435 = _1433;
    if (_1315)
    {
        float _1437 = _1305 * _1411;
        _1435 = _1437;
    }
    float _1439 = _1435;
    if (_1315)
    {
        float _1441 = _1425 * _1425;
        _1383 = _1441;
    }
    float _1443 = _1383;
    float _1445 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1427);
    if (_1315)
    {
        float _1447 = _1439 * _1439;
        _1417 = _1447;
    }
    float _1449 = _1417;
    float _1451 = fma(_1431, _1431, _1443);
    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1455 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1453);
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1461 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1463 = _1451 + _1449;
    float _1465 = -_1457;
    float _1467 = _1465 + 1.0;
    float _1469 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1459);
    float _1471 = rsqrt(_1463);
    float _1473 = fma(_1265, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1475 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1479 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1481 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1483 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = abs(_1467);
    float _1487 = log2(_1485);
    float _1489 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1491 = -_1479;
    float _1493 = fma(_1491, _1477, 1.0);
    float _1495 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1489);
    float _1497 = _1471 * _1425;
    float _1499 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1495);
    float _1501 = floor(_1473);
    float _1503 = _1471 * _1431;
    float _1505 = _1471 * _1439;
    float _1507 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1509 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1511 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1513 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1515 = -_1507;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1515);
    float _1519 = floor(_1481);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1511);
    float _1523 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1525 = -_1505;
    float _1527 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1517);
    float _1529 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1521);
    float _1531 = _1503 + 1.0;
    float _1533 = log2(_1493);
    float _1535 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1529);
    float _1537 = -_1501;
    float _1539 = _1473 + _1537;
    float _1541 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1543 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1541);
    float _1545 = exp2(_1513);
    float _1547 = fma(_1527, -0.5, 0.5);
    float _1549 = fma(_1527, 0.5, 0.5);
    float _1551 = -_1519;
    float _1553 = _1481 + _1551;
    float _1555 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1523);
    float _1557 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1543);
    float _1559 = fma(_1549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1561 = 1.0 / _1535;
    float _1563 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1557);
    float _1565 = fma(_1549, _1559, -0.212114393711090087890625);
    float _1567 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1555);
    float _1569 = sqrt(_1547);
    float _1571 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1567);
    float _1573 = -_1503;
    float _1575 = fma(_1545, _1531, _1573);
    float _1577 = _1533 * 0.693147182464599609375;
    float2 _4895 = float2(_1539, _1553);
    float _1579 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4895, float2(0.0), isnan(_4895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4895, float2(0.0), isnan(_4895)), level(0.0)).x;
    float _1581 = fma(_1549, _1565, 1.570728778839111328125);
    float _1583 = fma(_1575, 0.5, 0.5);
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1587 = _1563 * _1561;
    float _1589 = _1571 * _1561;
    float _1591 = fma(_1587, 0.5, 0.5);
    float _1593 = fma(_1589, -0.5, 0.5);
    float _1595 = _1569 * 0.636619746685028076171875;
    float3 _4929 = float3(_1591, _1593, _1585);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4929, float3(0.0), isnan(_4929)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4929, float3(0.0), isnan(_4929)), level(0.0)).x;
    float _1599 = -_1581;
    float _1601 = fma(_1595, _1599, 1.0);
    float3 _4945 = float3(_1591, _1593, _1585);
    float4 _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).xyzw;
    float _1605 = _1603.x;
    float _1607 = _1603.y;
    float _1609 = _1603.z;
    float _1611 = _1603.w;
    float2 _4961 = float2(_1601, _1583);
    float3 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4961, float2(0.0), isnan(_4961)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4961, float2(0.0), isnan(_4961)), level(0.0)).xyz;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = in.m_55.w;
    float _1625 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1627 = -_917;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1635 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1637 = isnan(_241);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = _1625 * _173;
    bool _1649 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1651 = isnan(_241);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1661;
    float _1665 = 1.0 / _1633;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1669 = _241 + _1667;
    float _1671 = -_1645;
    float _1673 = _1671 + 1.0;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1679 = _1659 * _1673;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1683 = _1681 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1685 = trunc(_1647);
    int _1687 = int(_1685);
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1691 = _1689 != 0;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1695 = _1693 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1699 = _1697 != 0;
    float _1701 = -_1659;
    float _1703 = _1701 + 1.0;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1707 = _1705 != 0;
    float _1709 = in.m_65.x;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1713 = _1711 != 0;
    float _1715 = _1663 * _1665;
    float _1717 = 1.0 / _1677;
    int _1719 = _211 + 8;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    uint _1723 = uint(int(uint(int(_1721)) >> uint(2)));
    int _1725 = int(_1721) & 3;
    float _1727 = (*spvDescriptorSet0.vp_c9)._m0[int(_1723)][_1725];
    float _1729 = in.m_65.y;
    float _1731 = fma(_1715, _1669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1733 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1735 = isnan(_241);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1747 = _1687 << 4;
    int _1749 = _1747 + 1968;
    uint _1751 = uint(int(uint(_211) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[int(_1761)][_1763];
    float _1767 = 1.0 / _1695;
    float _1769 = _1743 * _1703;
    bool _1771 = _445 > 0.5;
    float _1773 = -_1743;
    float _1775 = _1773 + 1.0;
    bool _1777 = _1623 > 0.5;
    float _1779 = _1731 * _1769;
    bool _1781 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1783 = isnan(_241);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    int _1793 = _1749 + 8;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[int(_1797)][_1799];
    float _1803 = _1683 * _1717;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1805;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1811 = _241 + _1809;
    float _1813 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1779);
    float _1815 = -_1791;
    float _1817 = _1815 + 1.0;
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1821 = fma(_1803, _1811, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    uint _1823 = uint(int(uint(_1749) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c9)._m0[int(_1833)][_1835];
    float _1839 = _1807 * _1767;
    float _1841 = -_1729;
    float _1843 = _1841 + 1.0;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1847 = _241 + _1845;
    float _1849 = _1645 * _1817;
    float _1851 = fma(_1821, _1679, _1813);
    float _1853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1855 = fma(_1839, _1847, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1857 = _1777 ? as_type<int>(_1843) : as_type<int>(_1729);
    float _1859 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1745);
    bool _1861 = _1777;
    int _1863 = as_type<int>(_1851);
    float _1865 = _1729;
    int _1867 = as_type<int>(_1849);
    float _1869 = _1709;
    float _1871 = _1535;
    float _1873 = _1571;
    if (_1699)
    {
        bool _1875 = _437 > 0.5;
        _1861 = _1875;
    }
    bool _1877 = _1861;
    float _1879 = fma(_1855, _1849, _1851);
    float _1881 = _1707 ? as_type<float>(_1857) : _1729;
    if (_1691)
    {
        float _1883 = -_1709;
        float _1885 = _1883 + 1.0;
        _1863 = as_type<int>(_1885);
    }
    int _1887 = _1863;
    if (_1713)
    {
        float _1889 = _1771 ? _1843 : _1729;
        _1865 = _1889;
    }
    float _1891 = _1865;
    float _1893 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1879);
    float _1895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1691)
    {
        bool _1897 = _173 > 0.5;
        _513 = _1897;
    }
    bool _1899 = _513;
    if (_1699)
    {
        float _1901 = -_1709;
        float _1903 = _1901 + 1.0;
        _1867 = as_type<int>(_1903);
    }
    int _1905 = _1867;
    if (!_1691)
    {
        _215 = _1709;
    }
    float _1907 = _215;
    float _1909 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1911 = _1907;
    if (_1691)
    {
        float _1913 = _1899 ? as_type<float>(_1887) : _1709;
        _1911 = _1913;
    }
    float _1915 = _1911;
    float _1917 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1859);
    if (_1699)
    {
        float _1919 = _1877 ? as_type<float>(_1905) : _1709;
        _1869 = _1919;
    }
    float _1921 = _1869;
    float _1923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1925 = _1005 != 0.0;
    bool _1927 = isnan(_1005);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(0.0);
    bool _1933 = _1929 || _1931;
    float _1935 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1937 = in.m_67.x;
    bool _1939 = _1003 == 0.0;
    bool _1941 = !_1933;
    bool _1943 = _1939 && _1941;
    float _1945 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1947 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1949 = _1727 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1951 = _1765 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1953 = _1007 == 0.0;
    bool _1955 = _1953 && _1943;
    float _1957 = _1947 * _1819;
    float _1959 = _1935 * _1853;
    float _1961 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = _1801 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1965 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1629 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1969 = _1629 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1971 = _1951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1973 = _1963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1975 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1967);
    float _1977 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1969);
    float _1979 = _1829 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1981 = _1837 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1983 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1975);
    float _1985 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1977);
    float _1987 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1989 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1991 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1993 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1995 = _1987 * _1923;
    float _1997 = _1989 * _1895;
    float _1999 = 1.0 / _1991;
    float _2001 = _1993 + _1991;
    out.m_69.x = _1961;
    out.m_69.y = _1971;
    out.m_69.z = _1965;
    out.m_69.w = _1909;
    float _2003 = _1979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2005 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1959;
    out.m_71.y = _1957;
    out.m_71.z = _1997;
    out.m_71.w = _1995;
    out.m_73.x = _2003;
    out.m_73.y = _2005;
    out.m_73.z = _1973;
    float _2007 = _2001 * _1999;
    float _2009 = _2007 * 0.5;
    float _2011 = in.m_75.x;
    float _2013 = in.m_75.y;
    float _2015 = in.m_75.z;
    float _2017 = in.m_75.w;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2021 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2019);
    float _2023 = in.m_77.x;
    float _2025 = in.m_77.y;
    float _2027 = in.m_77.z;
    float _2029 = 1.0 / _2021;
    float _2031 = _1165 * _2013;
    float _2033 = _1103 * _2013;
    float _2035 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2037 = _2029 * _2035;
    float _2039 = fma(_1169, _2011, _2031);
    float _2041 = fma(_1105, _2011, _2033);
    float _2043 = abs(_2037);
    float _2045 = log2(_2043);
    float _2047 = _2021;
    float _2049 = _1991;
    float _2051 = _1961;
    if (_1955)
    {
        _2047 = _2025;
    }
    float _2053 = _2047;
    float _2055 = _2053;
    if (_1955)
    {
        _1329 = _2023;
    }
    float _2057 = _1329;
    float _2059 = _2057;
    if (_1955)
    {
        _2049 = _2027;
    }
    float _2061 = _2049;
    float _2063 = _2061;
    if (_1955)
    {
        _2051 = _2057;
    }
    float _2065 = _2051;
    float _2067 = _2065;
    if (!_1955)
    {
        _2059 = _2023;
    }
    float _2069 = _2059;
    if (!_1955)
    {
        float _2071 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2069);
        _2067 = _2071;
    }
    float _2073 = _2067;
    float _2075 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2077 = _2045;
    if (_1955)
    {
        _2077 = _2053;
    }
    float _2079 = _2077;
    float _2081 = -_413;
    float _2083 = _2081 + _435;
    float _2085 = _2079;
    if (!_1955)
    {
        _2055 = _2025;
    }
    float _2087 = _2055;
    float _2089 = exp2(_2075);
    float _2091 = fma(_753, _2083, _413);
    if (!_1955)
    {
        float _2093 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2087);
        _2085 = _2093;
    }
    float _2095 = _2085;
    bool _2097 = _2037 <= 8000.0;
    bool _2099 = isnan(_2037);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan(8000.0);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    out.m_79.w = _2091;
    float _2109 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2111 = precise::clamp(_2109, 0.0, 1.0);
    float _2113 = _2089;
    if (_1955)
    {
        _2113 = _2061;
    }
    float _2115 = _2113;
    float _2117 = _2115;
    if (!_1955)
    {
        _2063 = _2027;
    }
    float _2119 = _2063;
    float _2121 = fma(_2111, -2.0, 3.0);
    float _2123 = _2111 * _2111;
    float _2125 = _2015 * _2069;
    float _2127 = _2013 * _2119;
    float _2129 = _2123 * _2121;
    float _2131 = -_2125;
    float _2133 = fma(_2011, _2119, _2131);
    if (!_1955)
    {
        float _2135 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2119);
        _2117 = _2135;
    }
    float _2137 = _2117;
    float _2139 = -_2127;
    float _2141 = fma(_2015, _2087, _2139);
    float _2143 = -_2129;
    float _2145 = _2143 + 1.0;
    float _2147 = _2133 * _2017;
    float _2149 = _2011 * _2087;
    float _2151 = _2141 * _2017;
    float _2153 = fma(_2145, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2129);
    float _2155 = _1113 * _2013;
    float _2157 = _1113 * _2147;
    float _2159 = _1103 * _2095;
    float _2161 = _2107 * _2153;
    float _2163 = _1113 * _2095;
    float _2165 = _1165 * _2095;
    float _2167 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2169 = _1165 * _2147;
    float _2171 = _1103 * _2147;
    float _2173 = fma(_1119, _2011, _2155);
    float _2175 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2177 = fma(_1119, _2151, _2157);
    float _2179 = exp2(_2167);
    float _2181 = fma(_1169, _2151, _2169);
    float _2183 = fma(_1105, _2151, _2171);
    float _2185 = fma(_1119, _2073, _2163);
    float _2187 = fma(_1169, _2073, _2165);
    float _2189 = fma(_1105, _2073, _2159);
    float _2191 = -_2149;
    float _2193 = fma(_2013, _2069, _2191);
    float _2195 = fma(_1125, _2015, _2173);
    float _2197 = fma(_1175, _2015, _2039);
    float _2199 = fma(_1107, _2015, _2041);
    float _2201 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _2203 = _2193 * _2017;
    float _2205 = fma(_1125, _2137, _2185);
    float _2207 = fma(_1107, _2137, _2189);
    out.m_81.x = _2195;
    out.m_81.y = _2197;
    out.m_81.z = _2199;
    float _2209 = -_2179;
    float _2211 = _2209 + 1.0;
    float _2213 = _2201 + _1535;
    bool _2215 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2217 = isnan(_1299);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2223 = _2219 || _2221;
    out.gl_Position.x = _1563;
    out.gl_Position.y = _1571;
    out.gl_Position.z = _2201;
    out.gl_Position.w = _1535;
    float _2225 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2227 = _2213 * 0.5;
    float _2229 = fma(_1175, _2137, _2187);
    float _2231 = fma(_1125, _2203, _2177);
    float _2233 = fma(_1175, _2203, _2181);
    float _2235 = fma(_1107, _2203, _2183);
    out.m_83.z = _2227;
    out.m_83.w = _1535;
    out.m_85.x = _2205;
    out.m_85.y = _2229;
    out.m_85.z = _2207;
    float _2237 = -_2225;
    float _2239 = _2237 + 1.0;
    out.m_87.x = _2231;
    out.m_87.y = _2233;
    out.m_87.z = _2235;
    float _2241 = _2201;
    float _2243 = _2233;
    float _2245 = _2231;
    float _2247 = _2239;
    if (!_2223)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2249 = _1871;
    float _2251 = _2249;
    float _2253 = _2249;
    if (!_2223)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2255 = _2241;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2223)
    {
        _1873 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2261 = _1873;
    float _2263 = _2261;
    float _2265 = _2261;
    if (!_2223)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2267 = _2243;
    float _2269 = _2267;
    float _2271 = _2267;
    if (!_2223)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2273 = _2245;
    float _2275 = -_1579;
    float _2277 = _2275 + 1.0;
    float _2279 = _2277 * _2175;
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    float _2283 = -_2281;
    float _2285 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2287 = _2285 * _1937;
    float _2289 = _2225 * _1597;
    float _2291 = _2287 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2293 = _1611 * _2289;
    float _2295 = _1611 * _2239;
    float _2297 = _2273;
    float _2299 = _2273;
    if (!_2223)
    {
        _2247 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2301 = _2247;
    out.m_89.x = _2291;
    float _2303 = _1621 * _2289;
    float _2305 = fma(_1617, _2293, _1605);
    float _2307 = fma(_1619, _2293, _1607);
    float _2309 = fma(_1611, _2303, _1609);
    out.m_91.x = _2305;
    out.m_91.y = _2307;
    out.m_91.z = _2309;
    out.m_91.w = _2295;
    bool _2311 = !_2223;
    float _2313 = _2301;
    float _2315 = _2301;
    if (!_2311)
    {
        bool _2317 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2319 = isnan(_1299);
        bool _2321 = _2317 || _2319;
        bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2325 = _2321 || _2323;
        if (!_2325)
        {
            float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2329 = _1299 + _2327;
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2331;
            float _2335 = 1.0 / _2333;
            float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2339 = _2337 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2357 = _2329 * _2335;
            float _2359 = precise::clamp(_2357, 0.0, 1.0);
            float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2365 = fma(_2359, _2339, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2299 = _2367;
            _2265 = _2373;
            _2271 = _2365;
            _2259 = _2371;
            _2253 = _2369;
            _2315 = _2375;
            _2377 = true;
        }
        else
        {
            bool _2379 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2381 = isnan(_1299);
            bool _2383 = _2379 || _2381;
            bool _2385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2387 = _2383 || _2385;
            if (!_2387)
            {
                _2269 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2389 = _2269;
            _2271 = _2389;
            if (!_2387)
            {
                _2297 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2391 = _2297;
            _2299 = _2391;
            if (!_2387)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2393 = _2251;
            _2253 = _2393;
            if (!_2387)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2395 = _2257;
            _2259 = _2395;
            if (!_2387)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2397 = _2263;
            _2265 = _2397;
            if (!_2387)
            {
                _2313 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2399 = _2313;
            bool _2401 = !_2387;
            _2315 = _2399;
            if (!_2401)
            {
                bool _2403 = _1299 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2405 = isnan(_1299);
                bool _2407 = _2403 || _2405;
                bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2411 = _2407 || _2409;
                if (!_2411)
                {
                    float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2415 = _1299 + _2413;
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2419 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2417;
                    float _2421 = 1.0 / _2419;
                    float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2443 = _2415 * _2421;
                    float _2445 = precise::clamp(_2443, 0.0, 1.0);
                    float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2451 = fma(_2445, _2425, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2453 = fma(_2445, _2449, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2455 = fma(_2445, _2429, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2457 = fma(_2445, _2433, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2459 = fma(_2445, _2437, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2461 = fma(_2445, _2441, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2299 = _2453;
                    _2265 = _2459;
                    _2271 = _2451;
                    _2259 = _2457;
                    _2253 = _2455;
                    _2315 = _2461;
                    _2377 = true;
                }
                else
                {
                    _2299 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2271 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2315 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2377 = false;
    float _2463 = _2299;
    float _2465 = _2265;
    float _2467 = _2271;
    float _2469 = _2259;
    float _2471 = _2253;
    float _2473 = _2315;
    float _2475 = fma(_2229, -0.5, 0.5);
    float _2477 = precise::clamp(_2475, 0.0, 1.0);
    float _2479 = -_2463;
    float _2481 = _2479 + _2465;
    float _2483 = -_2467;
    float _2485 = _2483 + _2469;
    float _2487 = -_2471;
    float _2489 = _2487 + _2473;
    bool _2491 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2493 = fma(_2477, _2481, _2463);
    float _2495 = fma(_2477, _2485, _2467);
    float _2497 = fma(_2477, _2489, _2471);
    float _2499 = _2493 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2501 = fma(_2495, 0.298911988735198974609375, _2499);
    float _2503 = fma(_2497, 0.114477999508380889892578125, _2501);
    out.m_93.x = 0.0;
    float _2505 = -_2503;
    float _2507 = _2495 + _2505;
    float _2509 = -_2503;
    float _2511 = _2493 + _2509;
    float _2513 = -_2503;
    float _2515 = _2497 + _2513;
    float _2517 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2519 = fma(_2507, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    float _2521 = fma(_2511, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    float _2523 = fma(_2515, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2503);
    out.m_89.w = _2517;
    out.m_95.x = _2519;
    out.m_95.y = _2521;
    out.m_95.z = _2523;
    if (!_2491)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2525 = -_1253;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2529 = -_1257;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2533 = -_1261;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2537 = _2527 * _2527;
    float _2539 = fma(_2531, _2531, _2537);
    float _2541 = fma(_2535, _2535, _2539);
    float _2543 = sqrt(_2541);
    float _2545 = rsqrt(_2541);
    float _2547 = -_2543;
    float _2549 = _2547 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2551 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2553 = precise::clamp(_2551, 0.0, 1.0);
    float _2555 = _2531 * _2545;
    float _2557 = _2527 * _2545;
    float _2559 = abs(_2553);
    float _2561 = log2(_2559);
    float _2563 = _2535 * _2545;
    float _2565 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2567 = _2229 * _2557;
    float _2569 = -_2557;
    float _2571 = -_2565;
    float _2573 = fma(_2569, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2571);
    float _2575 = fma(_2205, _2555, _2567);
    float _2577 = -_2563;
    float _2579 = fma(_2577, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2573);
    float _2581 = fma(_2207, _2563, _2575);
    float _2583 = precise::clamp(_2581, 0.0, 1.0);
    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2587 = _2579 + _2585;
    float _2589 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2591 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2593 = precise::clamp(_2591, 0.0, 1.0);
    float _2595 = exp2(_2589);
    float _2597 = _2595 * _2593;
    float _2599 = _2583 * _2597;
    float _2601 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2603 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2605 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2601;
    out.m_93.y = _2603;
    out.m_93.z = _2605;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

