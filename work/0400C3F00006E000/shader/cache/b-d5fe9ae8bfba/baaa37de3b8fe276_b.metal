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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3684 = false;
    bool _2389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_58.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3991 = as_type<float>(_134);
        out.gl_Position.z = _3991;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_116);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4060 = as_type<float>(_172);
        out.gl_Position.z = _4060;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _176 = int(_174);
    float _178 = in.m_65.x;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = float(_116);
    float _184 = in.m_65.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _192 = int(_190);
    float _194 = float(_176);
    float _196 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _198 = int(_196);
    float _200 = _180;
    if (_188)
    {
        _124 = 1.0;
    }
    float _202 = _124;
    float _204 = _202;
    if (!_188)
    {
        _204 = 7.345489978790283203125;
    }
    float _206 = _204;
    float _208 = float(_192);
    float _210 = 1.0 / _194;
    float _212 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _214 = int(_212);
    float _216 = float(uint(_198));
    float _218 = float(_198);
    float _220 = 1.0 / _208;
    float _222 = _152 * _210;
    float _224 = 1.0 / _216;
    float _226 = float(uint(_214));
    float _228 = trunc(_222);
    int _230 = int(_228);
    float _232 = _152 * _220;
    int _234 = ~_198;
    int _236 = _234 + 1;
    float _238 = 1.0 / _226;
    int _240 = as_type<int>(_224) + (-2);
    float _242 = trunc(_232);
    int _244 = int(_242);
    float _246 = float(uint(_230));
    float _248 = as_type<float>(_240) * _246;
    int _250 = as_type<int>(_238) + (-2);
    float _252 = 1.0 / _182;
    int _254 = ~_214;
    int _256 = _254 + 1;
    float _258 = float(uint(_244));
    float _260 = trunc(_248);
    float _262 = precise::max(_260, 0.0);
    uint _265 = uint(_262);
    float _267 = as_type<float>(_250) * _258;
    float _269 = _206 * _178;
    float _271 = _206;
    if (_188)
    {
        _271 = 1.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_188)
    {
        _275 = 1.2345600128173828125;
    }
    float _277 = _275;
    float _279 = floor(_269);
    int _281 = int(_188);
    int _283 = false ? 2 : 0;
    int _285 = _281 | _283;
    int _287 = false ? 4 : 0;
    int _289 = _285 | _287;
    int _291 = false ? 8 : 0;
    int _293 = _289 | _291;
    int _295 = false ? 16 : 0;
    int _297 = _293 | _295;
    int _299 = false ? 32 : 0;
    int _301 = _297 | _299;
    int _303 = false ? 64 : 0;
    int _305 = _301 | _303;
    int _307 = _305 & 1;
    float _309 = as_type<float>(_307);
    if (_188)
    {
        _309 = _178;
    }
    float _311 = _309;
    float _313 = _311;
    float _315 = _184;
    if (!_188)
    {
        _313 = _184;
    }
    float _317 = _313;
    int _319 = _236 * int(_265);
    int _321 = _319 + _230;
    float _323 = trunc(_267);
    float _325 = precise::max(_323, 0.0);
    uint _327 = uint(_325);
    bool _329 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.0);
    bool _337 = _333 || _335;
    float _339 = float(uint(_321));
    float _341 = as_type<float>(_240) * _339;
    float _343 = _317 * _277;
    float _345 = _152 * _218;
    float _347 = trunc(_341);
    float _349 = precise::max(_347, 0.0);
    uint _351 = uint(_349);
    float _353 = 0.0;
    if (!_337)
    {
        float _355 = _180 * _180;
        float _357 = _355 * 0.5;
        _353 = _357;
    }
    float _359 = _353;
    int _361 = _256 * int(_327);
    int _363 = _361 + _244;
    float _365 = float(_214);
    float _367 = _345 * _252;
    float _369 = _359;
    if (!_337)
    {
        float _371 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _371;
    }
    float _373 = _369;
    float _375 = float(uint(_363));
    float _377 = floor(_343);
    float _379 = _152 * _365;
    float _381 = -_279;
    float _383 = _269 + _381;
    float _385 = as_type<float>(_250) * _375;
    float _387 = _379 * _252;
    int _389 = ~_198;
    int _391 = _389 + 1;
    int _393 = int(_265) + int(_351);
    float _395 = trunc(_385);
    float _397 = precise::max(_395, 0.0);
    uint _399 = uint(_397);
    float _401 = -_377;
    float _403 = _343 + _401;
    float _405 = float(_230);
    int _407 = _391 * _393;
    int _409 = _407 + _230;
    bool _411 = !_337;
    float _413 = _373;
    if (!_411)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _425 = _180 * _417;
        float _427 = 1.0 / _421;
        float _429 = _423 * 0.693147182464599609375;
        float _431 = exp2(_425);
        float _433 = 1.0 / _429;
        float _435 = _431 + (-1.0);
        float _437 = -_435;
        float _439 = fma(_437, _433, _180);
        float _441 = _439 * _427;
        float _443 = _441 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _413 = _443;
    }
    float _445 = _413;
    bool _447 = !_337;
    if (!_447)
    {
        float _449 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _451 = log2(_449);
        float _453 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _455 = _453 + 1.0;
        float _457 = 1.0 / _455;
        float _459 = _180 * _451;
        float _461 = exp2(_459);
        float _463 = -_461;
        float _465 = _463 + 1.0;
        float _467 = _465 * _457;
        _200 = _467;
    }
    float _469 = _200;
    bool _471 = _405 >= _218;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan(_218);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _365 * _403;
    bool _485 = uint(_409) >= uint(_198);
    float _487 = _383 * _218;
    float _489 = trunc(_367);
    int _491 = int(_489);
    bool _493 = !_485;
    int _495 = _493 ? 0 : (-1);
    float _497 = in.m_67.x;
    float _499 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _501 = ~_393;
    int _503 = _501 + _495;
    int _505 = _503 + 1;
    float _507 = in.m_65.z;
    bool _509 = _198 == 0;
    float _511 = trunc(_481);
    int _513 = int(_511);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _517 = _515 != 0;
    float _519 = in.m_67.y;
    int _521 = int(_327) + int(_399);
    int _523 = _198 * _505;
    int _525 = _523 + _230;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _537 = _535 != 0;
    float _539 = in.m_69.w;
    float _541 = float(_244);
    float _543 = trunc(_387);
    int _545 = int(_543);
    int _547 = ~_214;
    int _549 = _547 + 1;
    bool _551 = _541 >= _365;
    bool _553 = isnan(_541);
    bool _555 = _551 || _553;
    bool _557 = isnan(_365);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = !_533;
    int _565 = _563 ? 0 : 1;
    int _567 = _549 * _521;
    int _569 = _567 + _244;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _577 = _575 != 0;
    float _579 = trunc(_487);
    int _581 = int(_579);
    int _583 = ~_513;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _591 = _589 != 0;
    bool _593 = !_509;
    int _595 = _593 ? _525 : (-1);
    bool _597 = !_517;
    int _599 = _597 ? 0 : 1;
    float _601 = trunc(_561);
    int _603 = int(_601);
    bool _605 = !_529;
    int _607 = _605 ? 0 : 1;
    int _609 = _595 * _587;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _617 = _615 != 0;
    bool _619 = uint(_569) >= uint(_214);
    int _621 = _198 + (-1);
    float _623 = trunc(_483);
    int _625 = int(_623);
    int _627 = abs(_599);
    int _629 = abs(_565);
    int _631 = _513 * _621;
    int _633 = _631 + _609;
    bool _635 = !_619;
    int _637 = _635 ? 0 : (-1);
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _641 = _639 != 0;
    float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _645 = !_641;
    int _647 = _645 ? 0 : 1;
    int _649 = _581 * _627;
    int _651 = _649 + _230;
    bool _653 = !_537;
    int _655 = _653 ? 0 : 1;
    int _657 = _633 * _629;
    int _659 = ~_521;
    int _661 = _659 + _637;
    int _663 = _661 + 1;
    int _665 = abs(_607);
    int _667 = abs(_647);
    int _669 = _214 * _663;
    int _671 = _669 + _244;
    int _673 = abs(_655);
    int _675 = _625 * _667;
    int _677 = _675 + _244;
    bool _679 = _214 == 0;
    bool _681 = !_591;
    int _683 = _681 ? 0 : 1;
    int _685 = _491 * _665;
    int _687 = _685 + _657;
    int _689 = ~_603;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    bool _695 = !_679;
    int _697 = _695 ? _671 : (-1);
    int _699 = _651 * _673;
    int _701 = _699 + _687;
    int _703 = abs(_683);
    bool _705 = !_617;
    int _707 = _705 ? 0 : 1;
    int _709 = _693 * _697;
    int _711 = _214 + (-1);
    int _713 = _581 * _703;
    int _715 = _713 + _701;
    bool _717 = !_573;
    int _719 = _717 ? 0 : 1;
    int _721 = abs(_707);
    int _723 = _603 * _711;
    int _725 = _723 + _709;
    bool _727 = !_613;
    int _729 = _727 ? 0 : 1;
    int _731 = abs(_719);
    int _733 = _725 * _721;
    float _735 = float(uint(_715));
    int _737 = abs(_729);
    bool _739 = !_577;
    int _741 = _739 ? 0 : 1;
    float _743 = as_type<float>(_240) * _735;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _747 = _745 != 0;
    int _749 = _545 * _737;
    int _751 = _749 + _733;
    int _753 = abs(_741);
    float _755 = trunc(_743);
    float _757 = precise::max(_755, 0.0);
    uint _759 = uint(_757);
    int _761 = ~_214;
    int _763 = _761 + 1;
    int _765 = _677 * _731;
    int _767 = _765 + _751;
    int _769 = ~_198;
    int _771 = _769 + 1;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _775 = _773 != 0;
    int _777 = _625 * _753;
    int _779 = _777 + _767;
    int _781 = ~_198;
    int _783 = _781 + 1;
    bool _785 = _573;
    float _787 = as_type<float>(_625);
    float _789 = as_type<float>(_783);
    float _791 = _497;
    float _793 = _643;
    if (_747)
    {
        bool _795 = _178 > 0.5;
        _785 = _795;
    }
    bool _797 = _785;
    float _799 = float(uint(_779));
    bool _801 = _507 > 0.5;
    int _803 = _771 * int(_759);
    int _805 = _803 + _715;
    float _807 = _507;
    if (!_747)
    {
        _787 = _497;
    }
    float _809 = _787;
    float _811 = as_type<float>(_250) * _799;
    float _813 = float(uint(_677));
    float _815 = float(uint(_805));
    float _817 = trunc(_811);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    bool _823 = _198 == 0;
    float _825 = as_type<float>(_250) * _813;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _829 = _827 != 0;
    float _831 = as_type<float>(_240) * _815;
    float _833 = trunc(_831);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = in.m_65.w;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _845 = _763 * int(_821);
    int _847 = _845 + _779;
    int _849 = as_type<int>(_831);
    float _851 = _809;
    if (_747)
    {
        float _853 = -_497;
        float _855 = _853 + 1.0;
        _849 = as_type<int>(_855);
    }
    int _857 = _849;
    float _859 = trunc(_825);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    int _865 = 0;
    if (_829)
    {
        _865 = 0;
    }
    int _867 = _865;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _871 = float(uint(_847));
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _875 = as_type<int>(_871);
    int _877 = _867;
    if (_747)
    {
        float _879 = _797 ? as_type<float>(_857) : _497;
        _851 = _879;
    }
    float _881 = _851;
    float _883 = -_519;
    float _885 = _883 + 1.0;
    int _887 = int(_759) + int(_837);
    float _889 = as_type<float>(_250) * _871;
    float _891 = _519;
    if (_775)
    {
        float _893 = -_497;
        float _895 = _893 + 1.0;
        _875 = as_type<int>(_895);
    }
    int _897 = _875;
    if (!_775)
    {
        _789 = _497;
    }
    float _899 = _789;
    float _901 = trunc(_889);
    float _903 = precise::max(_901, 0.0);
    uint _905 = uint(_903);
    float _907 = _899;
    if (!_829)
    {
        _877 = 2;
    }
    int _909 = _877;
    int _911 = _783 * _887;
    int _913 = _911 + _715;
    if (_775)
    {
        float _915 = _801 ? as_type<float>(_897) : _497;
        _907 = _915;
    }
    float _917 = _907;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _921 = _184 > 0.5;
    float _923 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _873);
    bool _925 = uint(_913) >= uint(_198);
    float _927 = float(uint(_651));
    bool _929 = !_925;
    int _931 = _929 ? 0 : (-1);
    int _933 = ~_214;
    int _935 = _933 + 1;
    float _937 = as_type<float>(_240) * _927;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    int _943 = int(_821) + int(_905);
    int _945 = _921 ? as_type<int>(_885) : as_type<int>(_519);
    float _947 = trunc(_937);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    bool _953 = _839 > 0.5;
    int _955 = _935 * _943;
    int _957 = _955 + _779;
    float _959 = _941 ? as_type<float>(_945) : _519;
    int _961 = _953 ? as_type<int>(_885) : as_type<int>(_519);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _965 = _963 != 0;
    bool _967 = uint(_957) >= uint(_214);
    float _969 = _965 ? as_type<float>(_961) : _519;
    float _971 = in.m_71.x;
    float _973 = in.m_71.y;
    float _975 = in.m_71.z;
    int _977 = ~_198;
    int _979 = _977 + 1;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    bool _985 = !_967;
    int _987 = _985 ? 0 : (-1);
    int _989 = _979 * int(_951);
    int _991 = _989 + _651;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _995 = _993 != 0;
    int _997 = ~_887;
    int _999 = _997 + _931;
    int _1001 = _999 + 1;
    int _1003 = ~_943;
    int _1005 = _1003 + _987;
    int _1007 = _1005 + 1;
    float _1009 = float(uint(_991));
    int _1011 = _198 * _1001;
    int _1013 = _1011 + _715;
    int _1015 = ~_214;
    int _1017 = _1015 + 1;
    int _1019 = _214 * _1007;
    int _1021 = _1019 + _779;
    int _1023 = 0;
    if (_983)
    {
        float _1025 = -_497;
        float _1027 = _1025 + 1.0;
        _1023 = as_type<int>(_1027);
    }
    int _1029 = _1023;
    float _1031 = as_type<float>(_240) * _1009;
    bool _1033 = !_823;
    int _1035 = _1033 ? _1013 : (-1);
    float _1037 = in.m_69.x;
    float _1039 = in.m_69.y;
    float _1041 = in.m_69.z;
    bool _1043 = !_679;
    int _1045 = _1043 ? _1021 : (-1);
    int _1047 = _1017 * int(_863);
    int _1049 = _1047 + _677;
    if (_995)
    {
        float _1051 = _801 ? _885 : _519;
        _891 = _1051;
    }
    float _1053 = _891;
    float _1055 = in.m_73.x;
    float _1057 = in.m_73.y;
    float _1059 = in.m_73.z;
    if (_983)
    {
        float _1061 = _921 ? as_type<float>(_1029) : _497;
        _791 = _1061;
    }
    float _1063 = _791;
    int _1065 = _1035 & 3;
    bool _1067 = _1065 != 0;
    float _1069 = trunc(_1031);
    float _1071 = precise::max(_1069, 0.0);
    uint _1073 = uint(_1071);
    int _1075 = _1045 & 3;
    bool _1077 = _1075 != 0;
    bool _1079 = _973 != 0.0;
    bool _1081 = isnan(_973);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    int _1089 = _1035 & 3;
    bool _1091 = _1089 != 0;
    int _1093 = _1067 ? 0 : 1;
    int _1095 = _1077 ? 0 : 1;
    bool _1097 = uint(_1089) > 1u;
    bool _1099 = uint(_1075) > 1u;
    bool _1101 = _971 == 0.0;
    bool _1103 = !_1087;
    bool _1105 = _1101 && _1103;
    float _1107 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1109 = float(uint(_1049));
    bool _1111 = _975 == 0.0;
    bool _1113 = _1111 && _1105;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1117 = ~_1093;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = as_type<float>(_250) * _1109;
    int _1125 = ~_1095;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    float _1131 = trunc(_1123);
    float _1133 = precise::max(_1131, 0.0);
    uint _1135 = uint(_1133);
    int _1137 = _1121;
    int _1139 = _1129;
    if (!_1097)
    {
        int _1141 = ~_1093;
        int _1143 = _1141 + 1;
        _1137 = _1143;
    }
    int _1145 = _1137;
    float _1147 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (!_1099)
    {
        int _1149 = ~_1095;
        int _1151 = _1149 + 1;
        _1139 = _1151;
    }
    int _1153 = _1139;
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _971);
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1159 = _1157 != 0;
    float _1161 = _1055;
    float _1163 = _1057;
    float _1165 = _1059;
    if (!_1113)
    {
        float _1167 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1055);
        _1161 = _1167;
    }
    float _1169 = _1161;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1173 = _1171 != 0;
    float _1175 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1177 = ~_198;
    int _1179 = _1177 + 1;
    float _1181 = _1169;
    if (!_1113)
    {
        float _1183 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1057);
        _1163 = _1183;
    }
    float _1185 = _1163;
    float _1187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _973);
    if (!_1113)
    {
        float _1189 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1059);
        _1165 = _1189;
    }
    float _1191 = _1165;
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _975);
    int _1195 = int(_951) + int(_1073);
    float _1197 = in.m_63.x;
    float _1199 = in.m_63.y;
    float _1201 = in.m_63.z;
    float _1203 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1205 = int(_863) + int(_1135);
    float _1207 = in.m_58.x;
    float _1209 = in.m_58.y;
    float _1211 = in.m_58.z;
    int _1213 = ~_214;
    int _1215 = _1213 + 1;
    int _1217 = _1179 * _1195;
    int _1219 = _1217 + _651;
    float _1221 = fma(_1203, -2.0, _843);
    int _1223 = 0;
    if (_829)
    {
        _1223 = 0;
    }
    int _1225 = _1223;
    float _1227 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1229 = _1215 * _1205;
    int _1231 = _1229 + _677;
    bool _1233 = uint(_1219) >= uint(_198);
    float _1235 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1237 = _1225;
    if (!_829)
    {
        _1237 = 1;
    }
    int _1239 = _1237;
    float _1241 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1243 = -_841;
    float _1245 = fma(_1235, 2.0, _1243);
    bool _1247 = !_1233;
    int _1249 = _1247 ? 0 : (-1);
    float _1251 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1221);
    bool _1253 = uint(_1231) >= uint(_214);
    float _1255 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _1257 = _1239 != 1;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1261 = !_1253;
    int _1263 = _1261 ? 0 : (-1);
    float _1265 = fma(_469, _1199, _1255);
    float _1267 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1269 = fma(_469, _1201, _499);
    bool _1271 = uint(_1089) >= 2u;
    float _1273 = fma(_1265, _539, _1209);
    float _1275 = fma(_469, _1197, _1267);
    float _1277 = fma(_1269, _539, _1211);
    float _1279 = _643 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1283 = fma(_1275, _539, _1207);
    float _1285 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1287 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1289 = fma(_1279, _1053, -0.5);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1281);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1285);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1287);
    int _1297 = _1271 ? 0 : 1;
    float _1299 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1291);
    float _1301 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1293);
    float _1303 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1295);
    bool _1305 = _909 != 2;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1317 = _1307 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1321 = _1309 + _1319;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1325 = _1311 + _1323;
    float _1327 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1329 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1331 = _1321 * _1321;
    float _1333 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1335 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1327);
    float _1337 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1329);
    float _1339 = fma(_1317, _1317, _1331);
    float _1341 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1333);
    float _1343 = _1339;
    if (_1305)
    {
        _1181 = _178;
    }
    float _1345 = _1181;
    float _1347 = -_152;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1245);
    float _1351 = fma(_1325, _1325, _1339);
    float _1353 = _1345;
    if (!_1305)
    {
        _1353 = _507;
    }
    float _1355 = _1353;
    float _1357 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1257)
    {
        _1343 = _184;
    }
    float _1359 = _1343;
    float _1361 = rsqrt(_1351);
    float _1363 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1365 = fma(_1357, _1063, -0.5);
    float _1367 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1369 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1337);
    float _1371 = -_869;
    float _1373 = fma(_1363, 2.0, _1371);
    float _1375 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1341);
    float _1377 = _1359;
    if (!_1257)
    {
        _793 = _1359;
    }
    float _1379 = _793;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1383 = _1379;
    if (_1257)
    {
        _1377 = _178;
    }
    float _1385 = _1377;
    float _1387 = -_152;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1373);
    float _1391 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1381);
    float _1393 = 0.0;
    if (!_1257)
    {
        _1393 = _507;
    }
    float _1395 = _1393;
    float _1397 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1259);
    float _1399 = _1321 * _1361;
    float _1401 = _1317 * _1361;
    float _1403 = _1325 * _1361;
    float _1405 = _1395;
    if (_1257)
    {
        _1405 = _184;
    }
    float _1407 = _1405;
    float _1409 = -_1399;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1415 = _1035 >> 31;
    float _1417 = -_1401;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1317);
    float _1421 = _1411 * _1411;
    float _1423 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1413);
    int _1425 = _1045 >> 31;
    float _1427 = -_1403;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1325);
    int _1431 = _1415 & 3;
    float _1433 = fma(_1419, _1419, _1421);
    int _1435 = _1425 & 3;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1439 = _1035 + _1431;
    float _1441 = fma(_1429, _1429, _1433);
    int _1443 = _1045 + _1435;
    float _1445 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[83].w, _919);
    int _1447 = _1439 >> 2;
    float _1449 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _923);
    int _1451 = _1443 >> 2;
    float _1453 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1437);
    int _1455 = _1447 << 4;
    int _1457 = _1455 + 368;
    float _1459 = sqrt(_1441);
    int _1461 = _1451 << 4;
    int _1463 = _1461 + 512;
    float _1465 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1397);
    uint _1467 = uint(int(uint(_1457) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[int(_1477)][_1479];
    if (_1257)
    {
        _807 = _184;
    }
    float _1483 = _807;
    float _1485 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1391);
    if (_1257)
    {
        _1383 = _178;
    }
    float _1487 = _1383;
    float _1489 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1423);
    if (!_1305)
    {
        _315 = _178;
    }
    float _1491 = _315;
    float _1493 = fma(_1449, _1365, _1389);
    int _1495 = ~_1195;
    int _1497 = _1495 + _1249;
    int _1499 = _1497 + 1;
    uint _1501 = uint(int(uint(_1463) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    bool _1517 = uint(_1075) >= 2u;
    float _1519 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1521 = _1089 != 3;
    int _1523 = _198 * _1499;
    int _1525 = _1523 + _651;
    int _1527 = _1517 ? 0 : 1;
    float _1529 = _1361 * _1459;
    bool _1531 = _1075 != 3;
    int _1533 = _1457 + 8;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    uint _1537 = uint(int(uint(int(_1535)) >> uint(2)));
    int _1539 = int(_1535) & 3;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[int(_1537)][_1539];
    int _1543 = int(_1535) + 1;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    int _1547 = _1543 & 3;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[int(_1545)][_1547];
    int _1551 = ~_1205;
    int _1553 = _1551 + _1263;
    int _1555 = _1553 + 1;
    float _1557 = _1227 * _1529;
    int _1559 = abs(_1153);
    float _1561 = _1115 * _1529;
    int _1563 = ~_1297;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _214 * _1555;
    int _1571 = _1569 + _677;
    int _1573 = ~_1527;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1463 + 8;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[int(_1591)][_1593];
    int _1597 = abs(_1145);
    float _1599 = _1241 * _1529;
    int _1601 = _1567;
    int _1603 = _1577;
    if (_1521)
    {
        int _1605 = ~_1297;
        int _1607 = _1605 + 1;
        _1601 = _1607;
    }
    int _1609 = _1601;
    float _1611 = _1557 * _1155;
    if (_1531)
    {
        int _1613 = ~_1527;
        int _1615 = _1613 + 1;
        _1603 = _1615;
    }
    int _1617 = _1603;
    float _1619 = _1599 * _1193;
    float _1621 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1623 = !_1091;
    int _1625 = _1623 ? 0 : 1;
    float _1627 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1629 = ~_1559;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    float _1635 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1445);
    int _1637 = _1045 & 3;
    bool _1639 = _1637 != 0;
    int _1641 = abs(_1625);
    int _1643 = ~_1597;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    bool _1649 = _1089 != 3;
    bool _1651 = !_1639;
    int _1653 = _1651 ? 0 : 1;
    int _1655 = abs(_1609);
    int _1657 = _1647 * as_type<int>(_1481);
    int _1659 = abs(_1653);
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1663 = int(_1661);
    bool _1665 = !_679;
    int _1667 = _1665 ? _1571 : (-1);
    int _1669 = _1633 * as_type<int>(_1515);
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1673 = !_1649;
    int _1675 = _1673 ? 0 : (-1);
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1679 = ~_1641;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = -_1671;
    float _1687 = fma(_1519, 2.0, _1685);
    int _1689 = abs(_1617);
    float _1691 = fma(_1621, -2.0, _1677);
    int _1693 = abs(_1675);
    int _1695 = _1683 * as_type<int>(_1473);
    int _1697 = _1695 + _1657;
    float _1699 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1701 = int(_1699);
    int _1703 = ~_1659;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    float _1709 = -_152;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1687);
    int _1713 = ~_1655;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    int _1719 = _1707 * as_type<int>(_1507);
    int _1721 = _1719 + _1669;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = _1717 * as_type<int>(_1541);
    int _1731 = _1729 + _1697;
    bool _1733 = _1075 != 3;
    float _1735 = _1561 * _1187;
    int _1737 = ~_1689;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = _1727 * as_type<int>(_1549);
    int _1745 = _1743 + _1731;
    bool _1747 = !_1733;
    int _1749 = _1747 ? 0 : (-1);
    float _1751 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1753 = !_1159;
    int _1755 = _1753 ? 0 : 1;
    int _1757 = _1741 * as_type<int>(_1587);
    int _1759 = _1757 + _1721;
    int _1761 = abs(_1749);
    float _1763 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1751);
    int _1765 = abs(_1663);
    int _1767 = ~_1761;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1763);
    int _1775 = abs(_1755);
    float _1777 = float(uint(_1663));
    int _1779 = _1771 * as_type<int>(_1595);
    int _1781 = _1779 + _1759;
    float _1783 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1785 = !_1173;
    int _1787 = _1785 ? 0 : 1;
    float _1789 = _1309 + _1773;
    float _1791 = float(uint(_1765));
    float _1793 = 1.0 / _1777;
    int _1795 = abs(_1787);
    float _1797 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1783);
    float _1799 = float(uint(_1701));
    int _1801 = ~_1775;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    float _1807 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1797);
    int _1809 = ~_1795;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = 1.0 / _1791;
    int _1817 = ~_1701;
    int _1819 = _1817 + 1;
    int _1821 = _1745 * _1805;
    bool _1823 = !_823;
    int _1825 = _1823 ? _1525 : (-1);
    int _1827 = _1813 * _1781;
    int _1829 = abs(_1701);
    float _1831 = _1307 + _1807;
    int _1833 = ~_1765;
    int _1835 = _1833 + 1;
    float _1837 = 1.0 / _1799;
    int _1839 = _1825 * _1775;
    int _1841 = _1839 + _1821;
    int _1843 = as_type<int>(_1793) + (-2);
    int _1845 = _1667 * _1795;
    int _1847 = _1845 + _1827;
    float _1849 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1851 = float(uint(_1841));
    int _1853 = as_type<int>(_1815) + (-2);
    float _1855 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1849);
    float _1857 = float(uint(_1829));
    float _1859 = as_type<float>(_1843) * _1851;
    float _1861 = float(uint(_1847));
    float _1863 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1855);
    float _1865 = 1.0 / _1857;
    int _1867 = abs(_1841);
    int _1869 = as_type<int>(_1837) + (-2);
    float _1871 = _1311 + _1863;
    int _1873 = abs(_1847);
    float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1877 = _1831 + _1875;
    int _1879 = ~_1663;
    int _1881 = _1879 + 1;
    float _1883 = trunc(_1859);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = as_type<float>(_1869) * _1861;
    float _1891 = _1877 * _1877;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1895 = _1871 + _1893;
    float _1897 = float(uint(_1867));
    float _1899 = trunc(_1889);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = as_type<int>(_1865) + (-2);
    float _1907 = _1895 * _1895;
    float _1909 = float(uint(_1873));
    float _1911 = as_type<float>(_1853) * _1897;
    float _1913 = _1891 + _1907;
    float _1915 = as_type<float>(_1905) * _1909;
    int _1917 = _1881 * int(_1887);
    int _1919 = _1917 + _1841;
    float _1921 = trunc(_1911);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = float(uint(_1919));
    int _1929 = _1819 * int(_1903);
    int _1931 = _1929 + _1847;
    float _1933 = trunc(_1915);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    float _1939 = as_type<float>(_1843) * _1927;
    int _1941 = ~_1829;
    int _1943 = _1941 + 1;
    float _1945 = float(uint(_1931));
    float _1947 = sqrt(_1913);
    float _1949 = as_type<float>(_1869) * _1945;
    int _1951 = _1835 * int(_1925);
    int _1953 = _1951 + _1867;
    float _1955 = trunc(_1939);
    float _1957 = precise::max(_1955, 0.0);
    uint _1959 = uint(_1957);
    int _1961 = _1943 * int(_1937);
    int _1963 = _1961 + _1873;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1967 = float(uint(_1953));
    float _1969 = float(uint(_1963));
    float _1971 = fma(_1627, -2.0, _1965);
    bool _1973 = _1947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = as_type<float>(_1853) * _1967;
    float _1977 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1453);
    float _1979 = as_type<float>(_1905) * _1969;
    float _1981 = trunc(_1949);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    float _1987 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1691);
    float _1989 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1971);
    float _1991 = -_1987;
    float _1993 = fma(_1977, _1289, _1991);
    float _1995 = trunc(_1975);
    float _1997 = precise::max(_1995, 0.0);
    uint _1999 = uint(_1997);
    float _2001 = _1891;
    float _2003 = _1907;
    float _2005 = _1831;
    float _2007 = _1871;
    float _2009 = _1979;
    if (!_1973)
    {
        _156 = _1891;
    }
    float _2011 = _156;
    float _2013 = _2011;
    if (!_1973)
    {
        _2001 = _1789;
    }
    float _2015 = _2001;
    float _2017 = trunc(_1979);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    bool _2023 = !_1973;
    float _2025 = _2015;
    float _2027 = as_type<float>(_2021);
    if (!_2023)
    {
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2033 = _1947 + _2031;
        float _2035 = rsqrt(_1913);
        float _2037 = _2033 * _2029;
        float _2039 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2041 = _2037 * 0.15915493667125701904296875;
        float _2043 = _2041 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = fma(_2045, _2039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = _2035 * _2051;
        float _2055 = _2049 + (-1.0);
        float _2057 = fma(_1877, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1895, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2061 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2065 = _2057 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2069 = _2059 + _2067;
        float _2071 = fma(_1789, _2049, _2061);
        float _2073 = _2065 * _2065;
        float _2075 = _2069 * _2069;
        _2025 = _2071;
        _2013 = _2073;
        _2003 = _2075;
        _2005 = _2057;
        _2007 = _2059;
    }
    float _2077 = _2025;
    float _2079 = _2013;
    float _2081 = _2003;
    float _2083 = _2005;
    float _2085 = _2007;
    int _2087 = ~_1663;
    int _2089 = _2087 + 1;
    out.m_75.x = _1367;
    out.m_75.y = _1369;
    out.m_75.z = _1375;
    int _2091 = int(_1903) + int(_1985);
    int _2093 = ~_1701;
    int _2095 = _2093 + 1;
    int _2097 = int(_1937) + int(_2021);
    int _2099 = int(_1887) + int(_1959);
    int _2101 = _2095 * _2091;
    int _2103 = _2101 + _1847;
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2107 = _2077 + _2105;
    int _2109 = int(_1925) + int(_1999);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2113 = ~_1765;
    int _2115 = _2113 + 1;
    int _2117 = _2089 * _2099;
    int _2119 = _2117 + _1841;
    int _2121 = ~_1829;
    int _2123 = _2121 + 1;
    float _2125 = fma(_2107, _2107, _2079);
    bool _2127 = uint(_2103) >= uint(_1701);
    int _2129 = _2115 * _2109;
    int _2131 = _2129 + _1867;
    bool _2133 = uint(_2119) >= uint(_1663);
    int _2135 = _2123 * _2097;
    int _2137 = _2135 + _1873;
    bool _2139 = !_2127;
    int _2141 = _2139 ? 0 : (-1);
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2145 = !_2133;
    int _2147 = _2145 ? 0 : (-1);
    float _2149 = _2125 + _2081;
    bool _2151 = uint(_2137) >= uint(_1829);
    int _2153 = ~_2099;
    int _2155 = _2153 + _2147;
    int _2157 = _2155 + 1;
    bool _2159 = !_2151;
    int _2161 = _2159 ? 0 : (-1);
    float _2163 = sqrt(_2149);
    int _2165 = ~_2091;
    int _2167 = _2165 + _2141;
    int _2169 = _2167 + 1;
    bool _2171 = _1663 == 0;
    bool _2173 = _1663 == 0;
    int _2175 = _1841 ^ _1663;
    int _2177 = _1663 * _2157;
    int _2179 = _2177 + _1841;
    int _2181 = ~_2161;
    int _2183 = _2097 + _2181;
    int _2185 = _2183 + 1;
    float _2187 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2189 = uint(_2131) >= uint(_1765);
    float _2191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2193 = _1847 ^ _1701;
    float _2195 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2197 = !_2189;
    int _2199 = _2197 ? 0 : (-1);
    uint _2201 = uint(int(uint(_2175) >> uint(31)));
    uint _2203 = uint(int(uint(_2193) >> uint(31)));
    float _2205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2207 = !_2171;
    int _2209 = _2207 ? _2179 : (-1);
    int _2211 = ~_2199;
    int _2213 = _2109 + _2211;
    int _2215 = _2213 + 1;
    int _2217 = ~int(_2201);
    int _2219 = _2217 + 1;
    int _2221 = ~int(_2203);
    int _2223 = _2221 + 1;
    float _2225 = float(_2209);
    int _2227 = _1701 * _2169;
    int _2229 = _2227 + _1847;
    bool _2231 = _1701 == 0;
    int _2233 = _2215 ^ _2219;
    float _2235 = fma(_2187, _2225, _1349);
    int _2237 = _2185 ^ _2223;
    float _2239 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2241 = _1701 == 0;
    float _2243 = fma(_2187, _881, -0.5);
    bool _2245 = !_2231;
    int _2247 = _2245 ? _2229 : (-1);
    float _2249 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2251 = ~_2219;
    int _2253 = _2251 + _2233;
    int _2255 = _2253 + 1;
    float _2257 = fma(_2239, _917, -0.5);
    int _2259 = ~_2223;
    int _2261 = _2259 + _2237;
    int _2263 = _2261 + 1;
    float _2265 = fma(_969, _2249, -0.5);
    float _2267 = float(_2247);
    float _2269 = fma(_1465, _2243, _2235);
    bool _2271 = !_2173;
    int _2273 = _2271 ? _2255 : (-1);
    bool _2275 = !_2241;
    int _2277 = _2275 ? _2263 : (-1);
    float _2279 = fma(_2239, _2267, _1711);
    float _2281 = float(_2273);
    float _2283 = fma(_959, _2195, -0.5);
    float _2285 = float(_2277);
    float _2287 = fma(_1489, _2257, _2279);
    float _2289 = -_1251;
    float _2291 = fma(_2195, _2281, _2289);
    float _2293 = -_1989;
    float _2295 = fma(_2249, _2285, _2293);
    float _2297 = fma(_1485, _2283, _2291);
    float _2299 = fma(_1635, _2265, _2295);
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2307 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2311 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2315 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2317 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2319 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2321 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2323 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2325 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2327 = _2311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2329 = _1493 + 0.5;
    float _2331 = _1993 + 0.5;
    float _2333 = _2269 + 0.5;
    float _2335 = _2287 + 0.5;
    float _2337 = _2297 + 0.5;
    float _2339 = _2299 + 0.5;
    out.m_77.x = _2317;
    out.m_77.y = _2319;
    out.m_77.z = _2321;
    out.m_77.w = _2313;
    bool _2341 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2343 = isnan(_2163);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2349 = _2345 || _2347;
    out.m_79.x = _2323;
    out.m_79.y = _2325;
    out.m_79.z = _2327;
    out.m_79.w = _2315;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _2329;
    out.m_83.y = _2331;
    float _2351 = _2281;
    float _2353 = as_type<float>(_2123);
    if (!_2349)
    {
        _2351 = 1.0;
    }
    float _2355 = _2351;
    out.m_85.x = _2333;
    out.m_85.y = _2337;
    out.m_85.z = _2335;
    out.m_85.w = _2339;
    bool _2357 = !_2349;
    float _2359 = _2355;
    if (!_2357)
    {
        bool _2361 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2363 = isnan(_2163);
        bool _2365 = _2361 || _2363;
        bool _2367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2369 = _2365 || _2367;
        if (!_2369)
        {
            float _2371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2373 = _2163 + _2371;
            float _2375 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2377 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2381 = _2379 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2383 = 1.0 / _2377;
            float _2385 = _2373 * _2383;
            float _2387 = fma(_2385, _2381, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2359 = _2387;
            _2389 = true;
        }
        else
        {
            bool _2391 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2393 = isnan(_2163);
            bool _2395 = _2391 || _2393;
            bool _2397 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2399 = _2395 || _2397;
            if (!_2399)
            {
                float _2401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2403 = _2163 + _2401;
                float _2405 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2407 = _2405 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2409 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2411 = _2409 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2413 = 1.0 / _2407;
                float _2415 = _2403 * _2413;
                float _2417 = fma(_2415, _2411, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2359 = _2417;
                _2389 = true;
            }
            else
            {
                _2359 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2389 = false;
    float _2419 = _2359;
    float _2421 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2423 = _2077 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2427 = _2083 + _2425;
    float _2429 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2431 = _2085 + _2429;
    float _2433 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2435 = fma(_2423, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2437 = fma(_2427, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2439 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2441 = -_1399;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2435);
    float _2445 = -_1401;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2437);
    float _2449 = -_1403;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2439);
    float _2453 = -_1399;
    float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2459 = _2443 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2463 = _2447 + _2461;
    float _2465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2467 = _2451 + _2465;
    float _2469 = -_1401;
    float _2471 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _2473 = _2459 * _2459;
    float _2475 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2477 = -_1403;
    float _2479 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1311);
    float _2481 = fma(_2463, _2463, _2473);
    float _2483 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2475);
    float _2485 = fma(_2467, _2467, _2481);
    float _2487 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2483);
    float _2489 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2491 = rsqrt(_2485);
    float _2493 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2495 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2489);
    float _2497 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2495);
    float _2499 = 1.0 / _2493;
    float _2501 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2503 = _2501 + _2493;
    float _2505 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2507 = sqrt(_2485);
    float _2509 = _2463 * _2505;
    float _2511 = _2467 * _2505;
    float _2513 = _2509 * _2509;
    float _2515 = _2511 * _2511;
    float _2517 = _2503 * _2499;
    float _2519 = _2517 * 0.5;
    float _2521 = _2455 + _2433;
    float _2523 = _2513 + _2515;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2527 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2525);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2531 = sqrt(_2523);
    float _2533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2535 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2529);
    float _2537 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2535);
    float _2539 = precise::max(0.0, _2533);
    float _2541 = 1.0 / _2527;
    float _2543 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2545 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2547 = -_2505;
    float _2549 = -_2539;
    float _2551 = fma(_2459, _2547, _2549);
    float _2553 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2555 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2545);
    bool _2557 = _2531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2559 = trunc(_2543);
    int _2561 = int(_2559);
    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2565 = _2531 + _2563;
    float _2567 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2555);
    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = _2541 * _2571;
    float _2575 = trunc(_2569);
    int _2577 = int(_2575);
    bool _2579 = _2573 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2581 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _2583 = _2573 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2585 = !_2579;
    int _2587 = _2585 ? 0 : 1;
    float _2589 = _2163;
    int _2591 = 2;
    float _2593 = _2523;
    float _2595 = _2565;
    float _2597 = _2553;
    int _2599 = as_type<int>(_2455);
    float _2601 = _2509;
    float _2603 = _2511;
    float _2605 = _2551;
    float _2607 = _2463;
    if (_2557)
    {
        float _2609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2589 = _2609;
    }
    float _2611 = _2589;
    int _2613 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2615 = _2561 + _2613;
    int _2617 = _2615 + 1;
    if (!_2579)
    {
        _2591 = 1;
    }
    int _2619 = _2591;
    int _2621 = _2619;
    if (_2557)
    {
        float _2623 = rsqrt(_2523);
        _2593 = _2623;
    }
    float _2625 = _2593;
    int _2627 = as_type<int>(_2625);
    if (!_2583)
    {
        _2621 = _2587;
    }
    int _2629 = _2621;
    float _2631 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2633 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2635 = _2577 + _2633;
    int _2637 = _2635 + 1;
    int _2639 = _2629 << 6;
    float _2641 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2631);
    bool _2643 = _2617 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2645 = as_type<float>(_2639);
    if (_2557)
    {
        float _2647 = _2565 * _2611;
        _2595 = _2647;
    }
    float _2649 = _2595;
    int _2651 = _2639 + 48;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c15)._m0[int(_2663)][_2665];
    float _2669 = floor(_2581);
    float _2671 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2641);
    float _2673 = _2671;
    if (_2557)
    {
        float _2675 = _2649 * 0.15915493667125701904296875;
        _2353 = _2675;
    }
    float _2677 = _2353;
    int _2679 = _2617 | _2637;
    float _2681 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2683 = as_type<float>(_2679);
    if (_2557)
    {
        float _2685 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2673 = _2685;
    }
    float _2687 = _2673;
    int _2689 = _2639 + 96;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    uint _2693 = uint(int(uint(int(_2691)) >> uint(2)));
    int _2695 = int(_2691) & 3;
    float _2697 = (*spvDescriptorSet0.vp_c15)._m0[int(_2693)][_2695];
    int _2699 = int(_2691) + 1;
    uint _2701 = uint(int(uint(_2699) >> uint(2)));
    int _2703 = _2699 & 3;
    float _2705 = (*spvDescriptorSet0.vp_c15)._m0[int(_2701)][_2703];
    int _2707 = _2131;
    if (_2557)
    {
        float _2709 = _2677 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        _2707 = as_type<int>(_2711);
    }
    int _2713 = _2707;
    bool _2715 = _2679 < 0;
    bool _2717 = _2715 || _2643;
    float _2719 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2721 = _2637 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2723 = _2721 || _2717;
    float _2725 = -_2719;
    float _2727 = fma(_2725, _2553, 1.0);
    int _2729 = _2639 + 104;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    uint _2733 = uint(int(uint(int(_2731)) >> uint(2)));
    int _2735 = int(_2731) & 3;
    float _2737 = (*spvDescriptorSet0.vp_c15)._m0[int(_2733)][_2735];
    int _2739 = int(_2731) + 1;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    int _2743 = _2739 & 3;
    float _2745 = (*spvDescriptorSet0.vp_c15)._m0[int(_2741)][_2743];
    float _2747 = _2677;
    if (_2557)
    {
        float _2749 = _2677 * 6.283185482025146484375;
        float _2751 = cos(_2749);
        _2747 = _2751;
    }
    float _2753 = _2747;
    float _2755 = -_2669;
    float _2757 = _2581 + _2755;
    int _2759 = _2639 + 64;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c15)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
    int _2777 = _2713;
    if (_2557)
    {
        float _2779 = fma(as_type<float>(_2713), _2687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2683 = _2779;
    }
    float _2781 = _2683;
    if (!_2723)
    {
        int _2783 = _2637 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2785 = _2783 + _2617;
        _2777 = _2785;
    }
    int _2787 = _2777;
    if (_2557)
    {
        float _2789 = _2625 * _2781;
        _2027 = _2789;
    }
    float _2791 = _2027;
    float _2793 = _2791;
    if (!_2723)
    {
        int _2795 = _2787 << 2;
        _2627 = _2795;
    }
    int _2797 = _2627;
    int _2799 = _2639 + 56;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c15)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c15)._m0[int(_2811)][_2813];
    int _2817 = _2797;
    if (_2557)
    {
        float _2819 = _2753 + (-1.0);
        _2597 = _2819;
    }
    float _2821 = _2597;
    if (!_2723)
    {
        uint _2823 = uint(int(uint(_2787) >> uint(2)));
        _2599 = int(_2823);
    }
    int _2825 = _2599;
    float _2827 = as_type<float>(_2825);
    if (_2557)
    {
        float _2829 = _2509 * _2791;
        _2601 = _2829;
    }
    float _2831 = _2601;
    if (!_2723)
    {
        int _2833 = 12 & _2797;
        _2817 = _2833;
    }
    int _2835 = _2817;
    if (_2557)
    {
        float _2837 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2837;
    }
    float _2839 = _2009;
    float _2841 = _2839;
    if (_2557)
    {
        float _2843 = _2511 * _2791;
        _2603 = _2843;
    }
    float _2845 = _2603;
    if (!_2557)
    {
        _2793 = _2515;
    }
    float _2847 = _2793;
    float _2849 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2851 = _2847;
    if (!_2723)
    {
        int _2853 = _2825 << 4;
        int _2855 = _2853 + _2835;
        _2827 = as_type<float>(_2855);
    }
    float _2857 = _2827;
    if (_2557)
    {
        float _2859 = fma(_2551, _2753, _2839);
        _2605 = _2859;
    }
    float _2861 = _2605;
    int _2863 = _2639 + 72;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    uint _2867 = uint(int(uint(int(_2865)) >> uint(2)));
    int _2869 = int(_2865) & 3;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[int(_2867)][_2869];
    int _2873 = int(_2865) + 1;
    uint _2875 = uint(int(uint(_2873) >> uint(2)));
    int _2877 = _2873 & 3;
    float _2879 = (*spvDescriptorSet0.vp_c15)._m0[int(_2875)][_2877];
    if (!_2557)
    {
        _2841 = _2513;
    }
    float _2881 = _2841;
    float _2883 = _2881;
    if (_2557)
    {
        float _2885 = _2831 * _2831;
        _2883 = _2885;
    }
    float _2887 = _2883;
    float _2889 = log2(_2727);
    float _2891 = _2521 * _2667;
    if (_2557)
    {
        float _2893 = _2845 * _2845;
        _2851 = _2893;
    }
    float _2895 = _2851;
    float _2897 = fma(_2861, _2861, _2887);
    float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2901 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2899);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    int _2905 = _2639 + 80;
    uint _2907 = uint(int(uint(_2905) >> uint(2)));
    uint _2909 = uint(int(uint(int(_2907)) >> uint(2)));
    int _2911 = int(_2907) & 3;
    float _2913 = (*spvDescriptorSet0.vp_c15)._m0[int(_2909)][_2911];
    int _2915 = int(_2907) + 1;
    uint _2917 = uint(int(uint(_2915) >> uint(2)));
    int _2919 = _2915 & 3;
    float _2921 = (*spvDescriptorSet0.vp_c15)._m0[int(_2917)][_2919];
    float _2923 = fma(_2471, _2659, _2891);
    float _2925 = floor(_2849);
    float _2927 = _2521 * _2705;
    float _2929 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2931 = -_2903;
    float _2933 = _2931 + 1.0;
    float _2935 = fma(_2471, _2697, _2927);
    float _2937 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2939 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2929);
    int _2941 = _2639 + 88;
    uint _2943 = uint(int(uint(_2941) >> uint(2)));
    uint _2945 = uint(int(uint(int(_2943)) >> uint(2)));
    int _2947 = int(_2943) & 3;
    float _2949 = (*spvDescriptorSet0.vp_c15)._m0[int(_2945)][_2947];
    int _2951 = int(_2943) + 1;
    uint _2953 = uint(int(uint(_2951) >> uint(2)));
    int _2955 = _2951 & 3;
    float _2957 = (*spvDescriptorSet0.vp_c15)._m0[int(_2953)][_2955];
    float _2959 = fma(_2479, _2737, _2935);
    float _2961 = _2897 + _2895;
    float _2963 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2937);
    float _2965 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2967 = _2959 + _2745;
    float _2969 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2939);
    float _2971 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2963);
    float _2973 = rsqrt(_2961);
    float _2975 = _2857;
    if (!_2723)
    {
        int _2977 = as_type<int>(_2857) + 400;
        uint _2979 = uint(int(uint(_2977) >> uint(2)));
        uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
        int _2983 = int(_2979) & 3;
        float _2985 = (*spvDescriptorSet0.vp_c15)._m0[int(_2981)][_2983];
        _2975 = _2985;
    }
    float _2987 = _2975;
    float _2989 = _2969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2991 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2965);
    float _2993 = _2971 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2995 = _2521 * _2775;
    float _2997 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2999 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2991);
    float _3001 = 1.0 / _2967;
    float _3003 = fma(_2471, _2767, _2995);
    float _3005 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2997);
    float _3007 = fma(_2479, _2807, _2923);
    float _3009 = _2999 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3005);
    float _3013 = _2973 * _2831;
    float _3015 = _3007 + _2815;
    float _3017 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3011);
    float _3019 = abs(_2933);
    float _3021 = log2(_3019);
    float _3023 = _2973 * _2861;
    float _3025 = fma(_2479, _2871, _3003);
    float _3027 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3029 = _2973 * _2845;
    float _3031 = _3015 * _3001;
    float _3033 = _3025 + _2879;
    float _3035 = -_3027;
    float _3037 = fma(_3023, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3035);
    float _3039 = _2767;
    float _3041 = _2995;
    if (!_2723)
    {
        float _3043 = floor(_2569);
        _3039 = _3043;
    }
    float _3045 = _3039;
    bool _3047 = _3031 >= 0.0;
    float _3049 = _3033 * _3001;
    float _3051 = -_3029;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3037);
    float _3055 = -_2925;
    float _3057 = _2849 + _3055;
    bool _3059 = _3031 <= 1.0;
    bool _3061 = _3059 && _3047;
    float _3063 = _2521 * _2921;
    float _3065 = fma(_3053, -0.5, 0.5);
    float _3067 = fma(_3053, 0.5, 0.5);
    bool _3069 = _3049 >= 0.0;
    bool _3071 = _3069 && _3061;
    float _3073 = fma(_2471, _2913, _3063);
    float _3075 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3077 = fma(_3067, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _3079 = _3049 <= 1.0;
    bool _3081 = _3079 && _3071;
    float _3083 = fma(_2479, _2949, _3073);
    if (!_2723)
    {
        float _3085 = floor(_2543);
        _3041 = _3085;
    }
    float _3087 = _3041;
    float _3089 = _3045;
    if (!_2723)
    {
        float _3091 = -_3045;
        float _3093 = _2569 + _3091;
        _2645 = _3093;
    }
    float _3095 = _2645;
    float _3097 = fma(_3067, _3077, -0.212114393711090087890625);
    float _3099 = _3083 + _2957;
    float _3101 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3103 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3105 = fma(_3067, _3097, 1.570728778839111328125);
    float _3107 = exp2(_3075);
    float _3109 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3101);
    float _3111 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3103);
    if (_3081)
    {
        float _3113 = float(_2629);
        _3089 = _3113;
    }
    float _3115 = _3089;
    float _3117 = _3023 + 1.0;
    float _3119 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3109);
    float _3121 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3111);
    float _3123 = sqrt(_3065);
    float _3125 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3121);
    float _3127 = _3099 * _3001;
    float _3129 = 1.0 / _3017;
    float _3131 = -_3023;
    float _3133 = fma(_3107, _3117, _3131);
    float _3135 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3119);
    float _3137 = _3119;
    float _3139 = _3125;
    if (!_2723)
    {
        float _3141 = -_3087;
        float _3143 = _2543 + _3141;
        _3137 = _3143;
    }
    float _3145 = _3137;
    float _3147 = _2889 * 0.693147182464599609375;
    float _3149 = fma(_3133, 0.5, 0.5);
    float _3151 = _3101;
    if (!_2723)
    {
        float _3153 = rint(_2987);
        float _3155 = precise::max(_3153, 0.0);
        uint _3157 = uint(_3155);
        uint _3159 = clamp(_3157, 0u, 65535u);
        _3151 = as_type<float>(_3159);
    }
    float _3161 = _3151;
    float _3163 = _3123 * 0.636619746685028076171875;
    float _3165 = _3147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _8663 = float2(_2757, _3057);
    float _3167 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8663, float2(0.0), isnan(_8663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8663, float2(0.0), isnan(_8663)), level(0.0)).x;
    float _3169 = -_3105;
    float _3171 = fma(_3163, _3169, 1.0);
    float _3173 = _3115;
    if (_3081)
    {
        float _3175 = rint(_3115);
        float _3177 = precise::max(_3175, 0.0);
        uint _3179 = uint(_3177);
        uint _3181 = clamp(_3179, 0u, 65535u);
        _3173 = as_type<float>(_3181);
    }
    float _3183 = _3173;
    float _3185 = _3135 * _3129;
    float _3187 = _3125 * _3129;
    float _3189 = fma(_3185, 0.5, 0.5);
    float _3191 = fma(_3187, -0.5, 0.5);
    float _3193 = _3161;
    if (!_2723)
    {
        float3 _8710 = float3(_3145, _3095, float(as_type<int>(_3161)));
        float3 _8714 = select(_8710, float3(0.0), isnan(_8710));
        float _3195 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8714.xy, uint(rint(_8714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8714.xy, uint(rint(_8714.z)), level(0.0)).x;
        _3193 = _3195;
    }
    float _3197 = _3193;
    float _3199 = _3049;
    if (_3081)
    {
        float3 _8729 = float3(_3031, _3049, float(as_type<int>(_3183)));
        float3 _8731 = select(_8729, float3(0.0), isnan(_8729));
        float _3201 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8731.xy, uint(rint(_8731.z)), _3127, level(0.0));
        _3199 = _3201;
    }
    float _3203 = _3199;
    float3 _8741 = float3(_3189, _3191, _3165);
    float _3205 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8741, float3(0.0), isnan(_8741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8741, float3(0.0), isnan(_8741)), level(0.0)).x;
    float3 _8750 = float3(_3189, _3191, _3165);
    float4 _3208 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8750, float3(0.0), isnan(_8750)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8750, float3(0.0), isnan(_8750)), level(0.0)).xyzw;
    float _3210 = _3208.x;
    float _3212 = _3208.y;
    float _3214 = _3208.z;
    float _3216 = _3208.w;
    float2 _8766 = float2(_3171, _3149);
    float3 _3220 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8766, float2(0.0), isnan(_8766)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8766, float2(0.0), isnan(_8766)), level(0.0)).xyz;
    float _3222 = _3220.x;
    float _3224 = _3220.y;
    float _3226 = _3220.z;
    float _3228 = abs(_2573);
    float _3230 = log2(_3228);
    float _3232 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3234 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.x = _2463;
    out.m_87.y = _2459;
    out.m_87.z = _2467;
    float _3236 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3232);
    float _3238 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3236);
    float _3240 = _3017 * 0.5;
    float _3242 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3238);
    float _3244 = _3135 + _3017;
    float _3246 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3248 = _3242 + _3017;
    float _3250 = _3244 * 0.5;
    float _3252 = fma(_3125, -0.5, _3240);
    float _3254 = _3248 * 0.5;
    float _3256 = exp2(_3246);
    out.gl_Position.x = _3135;
    out.gl_Position.y = _3125;
    out.gl_Position.z = _3242;
    out.gl_Position.w = _3017;
    bool _3258 = _2573 <= 8000.0;
    bool _3260 = isnan(_2573);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan(8000.0);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    out.m_89.x = _3250;
    out.m_89.y = _3252;
    out.m_89.z = _3254;
    out.m_89.w = _3017;
    bool _3270 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3272 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan(0.5);
    bool _3278 = _3274 || _3276;
    float _3280 = exp2(_3234);
    float _3282 = fma(_3256, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = fma(_3284, -2.0, 3.0);
    float _3288 = _3284 * _3284;
    if (_3278)
    {
        _2607 = 1.0;
    }
    float _3290 = _2607;
    float _3292 = _3288 * _3286;
    float _3294 = -_3292;
    float _3296 = _3294 + 1.0;
    float _3298 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3292);
    float _3300 = _3268 * _3298;
    float _3302 = _3298;
    float _3304 = _3290;
    float _3306 = _3300;
    if (_3278)
    {
        _3302 = 1.0;
    }
    float _3308 = _3302;
    float _3310 = _3308;
    if (!_3278)
    {
        float _3312 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3314 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3316 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3314;
        float _3318 = _3312 * 0.15915493667125701904296875;
        float _3320 = _3318 * 6.283185482025146484375;
        float _3322 = cos(_3320);
        float _3324 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3326 = _3324 * 0.15915493667125701904296875;
        float _3328 = _3318 * 6.283185482025146484375;
        float _3330 = sin(_3328);
        float _3332 = 1.0 / _3322;
        float _3334 = _3326 * 6.283185482025146484375;
        float _3336 = cos(_3334);
        float _3338 = _3330 * _3332;
        float _3340 = _3326 * 6.283185482025146484375;
        float _3342 = sin(_3340);
        float _3344 = _3336 * _3338;
        float _3346 = 1.0 / _3316;
        float _3348 = 1.0 / _3344;
        float _3350 = _3342 * _3348;
        float _3352 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3354 = fma(_2573, _3350, _3352);
        float _3356 = _3354 * _3346;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        _3139 = _3354;
        _3304 = _3358;
    }
    float _3360 = _3139;
    float _3362 = _3304;
    float _3364 = _3360;
    if (!_3278)
    {
        float _3366 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3368 = _3366 * 0.15915493667125701904296875;
        float _3370 = _3368 * 6.283185482025146484375;
        float _3372 = cos(_3370);
        float _3374 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3376 = _3374 * 0.15915493667125701904296875;
        float _3378 = _3368 * 6.283185482025146484375;
        float _3380 = sin(_3378);
        float _3382 = 1.0 / _3372;
        float _3384 = _3376 * 6.283185482025146484375;
        float _3386 = cos(_3384);
        float _3388 = _3380 * _3382;
        float _3390 = _3376 * 6.283185482025146484375;
        float _3392 = sin(_3390);
        float _3394 = _3386 * _3388;
        float _3396 = 1.0 / _3394;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3400 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3398;
        float _3402 = 1.0 / _3400;
        float _3404 = _3392 * _3396;
        float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3408 = fma(_2573, _3404, _3406);
        float _3410 = _3408 * _3402;
        float _3412 = precise::clamp(_3410, 0.0, 1.0);
        float _3414 = -_3412;
        float _3416 = _3414 + 1.0;
        _3364 = _3376;
        _3310 = _3416;
    }
    float _3418 = _3364;
    float _3420 = _3310;
    float _3422 = -_3280;
    float _3424 = _3422 + 1.0;
    float _3426 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3428 = -_3167;
    float _3430 = _3428 + 1.0;
    float _3432 = _3424;
    float _3434 = _3418;
    if (!_3081)
    {
        _3306 = 1.0;
    }
    float _3436 = _3306;
    float _3438 = _3436;
    if (_3081)
    {
        bool _3440 = _3203 >= _3127;
        bool _3442 = isnan(_3203);
        bool _3444 = _3440 || _3442;
        bool _3446 = isnan(_3127);
        bool _3448 = _3444 || _3446;
        float _3450 = float(_3448);
        _3438 = _3450;
    }
    float _3452 = _3438;
    float _3454 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3456 = _3430 * _3426;
    float _3458 = precise::clamp(_3456, 0.0, 1.0);
    float _3460 = _3452;
    float _3462 = _3454;
    if (_2723)
    {
        _3432 = 1.0;
    }
    float _3464 = _3432;
    float _3466 = _3464;
    if (!_2723)
    {
        int _3468 = _2787 << 4;
        int _3470 = _3468 + 2048;
        uint _3472 = uint(int(uint(_3470) >> uint(2)));
        uint _3474 = uint(int(uint(int(_3472)) >> uint(2)));
        int _3476 = int(_3472) & 3;
        float _3478 = (*spvDescriptorSet0.vp_c15)._m0[int(_3474)][_3476];
        int _3480 = int(_3472) + 1;
        uint _3482 = uint(int(uint(_3480) >> uint(2)));
        int _3484 = _3480 & 3;
        float _3486 = (*spvDescriptorSet0.vp_c15)._m0[int(_3482)][_3484];
        int _3488 = _3470 + 8;
        uint _3490 = uint(int(uint(_3488) >> uint(2)));
        uint _3492 = uint(int(uint(int(_3490)) >> uint(2)));
        int _3494 = int(_3490) & 3;
        float _3496 = (*spvDescriptorSet0.vp_c15)._m0[int(_3492)][_3494];
        int _3498 = int(_3490) + 1;
        uint _3500 = uint(int(uint(_3498) >> uint(2)));
        int _3502 = _3498 & 3;
        float _3504 = (*spvDescriptorSet0.vp_c15)._m0[int(_3500)][_3502];
        float _3506 = _2521 * _3486;
        float _3508 = fma(_2471, _3478, _3506);
        float _3510 = fma(_2479, _3496, _3508);
        float _3512 = _3510 + _3504;
        float _3514 = precise::clamp(_3512, 0.0, 1.0);
        float _3516 = -_3514;
        float _3518 = _3516 + _3197;
        float _3520 = fma(_3518, 500.0, 1.5);
        float _3522 = exp2(_3520);
        float _3524 = 0.0 + _3522;
        float _3526 = precise::clamp(_3524, 0.0, 1.0);
        _3466 = _3526;
        _3434 = 500.0;
    }
    float _3528 = _3466;
    float _3530 = _3434;
    float _3532 = _3454 * _3205;
    float _3534 = _3452 * _3528;
    float _3536 = -_3458;
    float _3538 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3540 = -_3454;
    float _3542 = _3540 + 1.0;
    float _3544 = _3216 * _3532;
    float _3546 = _3226 * _3532;
    float _3548 = -_3534;
    float _3550 = fma(_3548, _3538, 1.0);
    float _3552 = precise::clamp(_3550, 0.0, 1.0);
    float _3554 = _3216 * _3542;
    float _3556 = fma(_3222, _3544, _3210);
    float _3558 = fma(_3224, _3544, _3212);
    float _3560 = _3552 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3562 = fma(_3216, _3546, _3214);
    bool _3564 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3566 = isnan(_2507);
    bool _3568 = _3564 || _3566;
    bool _3570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3572 = _3568 || _3570;
    float _3574 = _3362 * _3420;
    out.m_91.x = _3560;
    float _3576 = _3574 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _3556;
    out.m_93.y = _3558;
    out.m_93.z = _3562;
    out.m_93.w = _3554;
    float _3578 = _3530;
    float _3580 = _3534;
    float _3582 = _3542;
    float _3584 = _3552;
    if (!_3572)
    {
        _3460 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3586 = _3460;
    float _3588 = _3586;
    float _3590 = _3586;
    if (!_3572)
    {
        _3578 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3592 = _3578;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3572)
    {
        _3462 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3598 = _3462;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3572)
    {
        _3580 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3604 = _3580;
    float _3606 = _3604;
    float _3608 = _3604;
    if (!_3572)
    {
        _3582 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3610 = _3582;
    float _3612 = _3610;
    float _3614 = _3610;
    if (!_3572)
    {
        _3584 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3616 = _3584;
    bool _3618 = !_3572;
    float _3620 = _3616;
    float _3622 = _3616;
    if (!_3618)
    {
        bool _3624 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3626 = isnan(_2507);
        bool _3628 = _3624 || _3626;
        bool _3630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3632 = _3628 || _3630;
        if (!_3632)
        {
            float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3636 = _2507 + _3634;
            float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3640 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3638;
            float _3642 = 1.0 / _3640;
            float _3644 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3654 = _3652 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3664 = _3636 * _3642;
            float _3666 = precise::clamp(_3664, 0.0, 1.0);
            float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3672 = fma(_3666, _3646, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3674 = fma(_3666, _3670, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3676 = fma(_3666, _3650, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3678 = fma(_3666, _3654, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3680 = fma(_3666, _3658, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3682 = fma(_3666, _3662, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3596 = _3672;
            _3614 = _3680;
            _3590 = _3674;
            _3608 = _3678;
            _3602 = _3676;
            _3622 = _3682;
            _3684 = true;
        }
        else
        {
            bool _3686 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3688 = isnan(_2507);
            bool _3690 = _3686 || _3688;
            bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3694 = _3690 || _3692;
            if (!_3694)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3696 = _3588;
            _3590 = _3696;
            if (!_3694)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3698 = _3594;
            _3596 = _3698;
            if (!_3694)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3700 = _3600;
            _3602 = _3700;
            if (!_3694)
            {
                _3606 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3702 = _3606;
            _3608 = _3702;
            if (!_3694)
            {
                _3612 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3704 = _3612;
            _3614 = _3704;
            if (!_3694)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3706 = _3620;
            bool _3708 = !_3694;
            _3622 = _3706;
            if (!_3708)
            {
                bool _3710 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3712 = isnan(_2507);
                bool _3714 = _3710 || _3712;
                bool _3716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3718 = _3714 || _3716;
                if (!_3718)
                {
                    float _3720 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3722 = _2507 + _3720;
                    float _3724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3726 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3724;
                    float _3728 = 1.0 / _3726;
                    float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3750 = _3722 * _3728;
                    float _3752 = precise::clamp(_3750, 0.0, 1.0);
                    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3758 = fma(_3752, _3732, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3760 = fma(_3752, _3756, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3762 = fma(_3752, _3736, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3764 = fma(_3752, _3740, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3766 = fma(_3752, _3744, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3768 = fma(_3752, _3748, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3596 = _3758;
                    _3614 = _3766;
                    _3590 = _3760;
                    _3608 = _3764;
                    _3602 = _3762;
                    _3622 = _3768;
                    _3684 = true;
                }
                else
                {
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3614 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3608 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3684 = false;
    float _3770 = _3596;
    float _3772 = _3614;
    float _3774 = _3590;
    float _3776 = _3608;
    float _3778 = _3602;
    float _3780 = _3622;
    float _3782 = fma(_1369, -0.5, 0.5);
    float _3784 = precise::clamp(_3782, 0.0, 1.0);
    float _3786 = _3576 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3788 = -_3770;
    float _3790 = _3788 + _3772;
    float _3792 = -_3774;
    float _3794 = _3792 + _3776;
    out.m_95.x = 0.0;
    float _3796 = -_3778;
    float _3798 = _3796 + _3780;
    float _3800 = fma(_3784, _3790, _3770);
    float _3802 = fma(_3784, _3794, _3774);
    out.m_61.x = _3786;
    bool _3804 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3806 = _3800 * 0.586610972881317138671875;
    float _3808 = fma(_3784, _3798, _3778);
    bool _3810 = _3362 > 0.0;
    bool _3812 = isnan(_3362);
    bool _3814 = _3810 || _3812;
    bool _3816 = isnan(0.0);
    bool _3818 = _3814 || _3816;
    float _3820 = fma(_3802, 0.298911988735198974609375, _3806);
    bool _3822 = _3420 <= 0.0;
    bool _3824 = !_3818;
    bool _3826 = _3822 || _3824;
    float _3828 = fma(_3808, 0.114477999508380889892578125, _3820);
    float _3830 = -_3828;
    float _3832 = _3802 + _3830;
    float _3834 = -_3828;
    float _3836 = _3800 + _3834;
    float _3838 = -_3828;
    float _3840 = _3808 + _3838;
    float _3842 = fma(_3832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    float _3844 = fma(_3836, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    float _3846 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    bool _3848 = !_3804;
    if (!_3848)
    {
        float _3850 = -_2443;
        float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3854 = -_2447;
        float _3856 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3858 = -_2451;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3862 = _3852 * _3852;
        float _3864 = fma(_3856, _3856, _3862);
        float _3866 = fma(_3860, _3860, _3864);
        float _3868 = sqrt(_3866);
        float _3870 = rsqrt(_3866);
        float _3872 = -_3868;
        float _3874 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3876 = _3874 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3878 = precise::clamp(_3876, 0.0, 1.0);
        float _3880 = _3856 * _3870;
        float _3882 = _3852 * _3870;
        float _3884 = abs(_3878);
        float _3886 = log2(_3884);
        float _3888 = _3860 * _3870;
        float _3890 = _3880 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3892 = _1369 * _3882;
        float _3894 = -_3882;
        float _3896 = -_3890;
        float _3898 = fma(_3894, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3896);
        float _3900 = fma(_1367, _3880, _3892);
        float _3902 = -_3888;
        float _3904 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3898);
        float _3906 = fma(_1375, _3888, _3900);
        float _3908 = precise::clamp(_3906, 0.0, 1.0);
        float _3910 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3912 = _3904 + _3910;
        float _3914 = _3886 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3916 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3918 = precise::clamp(_3916, 0.0, 1.0);
        float _3920 = exp2(_3914);
        float _3922 = _3920 * _3918;
        float _3924 = _3908 * _3922;
        float _3926 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3928 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3930 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3926;
        out.m_95.y = _3928;
        out.m_95.z = _3930;
    }
    out.m_97.x = _3842;
    out.m_97.y = _3844;
    out.m_97.z = _3846;
    if (!_3826)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3932 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3932;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3684 = false;
    bool _2389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_58.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3991 = as_type<float>(_134);
        out.gl_Position.z = _3991;
    }
    if (!_120)
    {
        return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_116);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4060 = as_type<float>(_172);
        out.gl_Position.z = _4060;
    }
    if (_166)
    {
        return out;
    }
    float _174 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _176 = int(_174);
    float _178 = in.m_65.x;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = float(_116);
    float _184 = in.m_65.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _192 = int(_190);
    float _194 = float(_176);
    float _196 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _198 = int(_196);
    float _200 = _180;
    if (_188)
    {
        _124 = 1.0;
    }
    float _202 = _124;
    float _204 = _202;
    if (!_188)
    {
        _204 = 7.345489978790283203125;
    }
    float _206 = _204;
    float _208 = float(_192);
    float _210 = 1.0 / _194;
    float _212 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _214 = int(_212);
    float _216 = float(uint(_198));
    float _218 = float(_198);
    float _220 = 1.0 / _208;
    float _222 = _152 * _210;
    float _224 = 1.0 / _216;
    float _226 = float(uint(_214));
    float _228 = trunc(_222);
    int _230 = int(_228);
    float _232 = _152 * _220;
    int _234 = ~_198;
    int _236 = _234 + 1;
    float _238 = 1.0 / _226;
    int _240 = as_type<int>(_224) + (-2);
    float _242 = trunc(_232);
    int _244 = int(_242);
    float _246 = float(uint(_230));
    float _248 = as_type<float>(_240) * _246;
    int _250 = as_type<int>(_238) + (-2);
    float _252 = 1.0 / _182;
    int _254 = ~_214;
    int _256 = _254 + 1;
    float _258 = float(uint(_244));
    float _260 = trunc(_248);
    float _262 = precise::max(_260, 0.0);
    uint _265 = uint(_262);
    float _267 = as_type<float>(_250) * _258;
    float _269 = _206 * _178;
    float _271 = _206;
    if (_188)
    {
        _271 = 1.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_188)
    {
        _275 = 1.2345600128173828125;
    }
    float _277 = _275;
    float _279 = floor(_269);
    int _281 = int(_188);
    int _283 = false ? 2 : 0;
    int _285 = _281 | _283;
    int _287 = false ? 4 : 0;
    int _289 = _285 | _287;
    int _291 = false ? 8 : 0;
    int _293 = _289 | _291;
    int _295 = false ? 16 : 0;
    int _297 = _293 | _295;
    int _299 = false ? 32 : 0;
    int _301 = _297 | _299;
    int _303 = false ? 64 : 0;
    int _305 = _301 | _303;
    int _307 = _305 & 1;
    float _309 = as_type<float>(_307);
    if (_188)
    {
        _309 = _178;
    }
    float _311 = _309;
    float _313 = _311;
    float _315 = _184;
    if (!_188)
    {
        _313 = _184;
    }
    float _317 = _313;
    int _319 = _236 * int(_265);
    int _321 = _319 + _230;
    float _323 = trunc(_267);
    float _325 = precise::max(_323, 0.0);
    uint _327 = uint(_325);
    bool _329 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.0);
    bool _337 = _333 || _335;
    float _339 = float(uint(_321));
    float _341 = as_type<float>(_240) * _339;
    float _343 = _317 * _277;
    float _345 = _152 * _218;
    float _347 = trunc(_341);
    float _349 = precise::max(_347, 0.0);
    uint _351 = uint(_349);
    float _353 = 0.0;
    if (!_337)
    {
        float _355 = _180 * _180;
        float _357 = _355 * 0.5;
        _353 = _357;
    }
    float _359 = _353;
    int _361 = _256 * int(_327);
    int _363 = _361 + _244;
    float _365 = float(_214);
    float _367 = _345 * _252;
    float _369 = _359;
    if (!_337)
    {
        float _371 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _371;
    }
    float _373 = _369;
    float _375 = float(uint(_363));
    float _377 = floor(_343);
    float _379 = _152 * _365;
    float _381 = -_279;
    float _383 = _269 + _381;
    float _385 = as_type<float>(_250) * _375;
    float _387 = _379 * _252;
    int _389 = ~_198;
    int _391 = _389 + 1;
    int _393 = int(_265) + int(_351);
    float _395 = trunc(_385);
    float _397 = precise::max(_395, 0.0);
    uint _399 = uint(_397);
    float _401 = -_377;
    float _403 = _343 + _401;
    float _405 = float(_230);
    int _407 = _391 * _393;
    int _409 = _407 + _230;
    bool _411 = !_337;
    float _413 = _373;
    if (!_411)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _425 = _180 * _417;
        float _427 = 1.0 / _421;
        float _429 = _423 * 0.693147182464599609375;
        float _431 = exp2(_425);
        float _433 = 1.0 / _429;
        float _435 = _431 + (-1.0);
        float _437 = -_435;
        float _439 = fma(_437, _433, _180);
        float _441 = _439 * _427;
        float _443 = _441 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _413 = _443;
    }
    float _445 = _413;
    bool _447 = !_337;
    if (!_447)
    {
        float _449 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _451 = log2(_449);
        float _453 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _455 = _453 + 1.0;
        float _457 = 1.0 / _455;
        float _459 = _180 * _451;
        float _461 = exp2(_459);
        float _463 = -_461;
        float _465 = _463 + 1.0;
        float _467 = _465 * _457;
        _200 = _467;
    }
    float _469 = _200;
    bool _471 = _405 >= _218;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan(_218);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _365 * _403;
    bool _485 = uint(_409) >= uint(_198);
    float _487 = _383 * _218;
    float _489 = trunc(_367);
    int _491 = int(_489);
    bool _493 = !_485;
    int _495 = _493 ? 0 : (-1);
    float _497 = in.m_67.x;
    float _499 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _501 = ~_393;
    int _503 = _501 + _495;
    int _505 = _503 + 1;
    float _507 = in.m_65.z;
    bool _509 = _198 == 0;
    float _511 = trunc(_481);
    int _513 = int(_511);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _517 = _515 != 0;
    float _519 = in.m_67.y;
    int _521 = int(_327) + int(_399);
    int _523 = _198 * _505;
    int _525 = _523 + _230;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _537 = _535 != 0;
    float _539 = in.m_69.w;
    float _541 = float(_244);
    float _543 = trunc(_387);
    int _545 = int(_543);
    int _547 = ~_214;
    int _549 = _547 + 1;
    bool _551 = _541 >= _365;
    bool _553 = isnan(_541);
    bool _555 = _551 || _553;
    bool _557 = isnan(_365);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = !_533;
    int _565 = _563 ? 0 : 1;
    int _567 = _549 * _521;
    int _569 = _567 + _244;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _577 = _575 != 0;
    float _579 = trunc(_487);
    int _581 = int(_579);
    int _583 = ~_513;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _591 = _589 != 0;
    bool _593 = !_509;
    int _595 = _593 ? _525 : (-1);
    bool _597 = !_517;
    int _599 = _597 ? 0 : 1;
    float _601 = trunc(_561);
    int _603 = int(_601);
    bool _605 = !_529;
    int _607 = _605 ? 0 : 1;
    int _609 = _595 * _587;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _617 = _615 != 0;
    bool _619 = uint(_569) >= uint(_214);
    int _621 = _198 + (-1);
    float _623 = trunc(_483);
    int _625 = int(_623);
    int _627 = abs(_599);
    int _629 = abs(_565);
    int _631 = _513 * _621;
    int _633 = _631 + _609;
    bool _635 = !_619;
    int _637 = _635 ? 0 : (-1);
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _641 = _639 != 0;
    float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _645 = !_641;
    int _647 = _645 ? 0 : 1;
    int _649 = _581 * _627;
    int _651 = _649 + _230;
    bool _653 = !_537;
    int _655 = _653 ? 0 : 1;
    int _657 = _633 * _629;
    int _659 = ~_521;
    int _661 = _659 + _637;
    int _663 = _661 + 1;
    int _665 = abs(_607);
    int _667 = abs(_647);
    int _669 = _214 * _663;
    int _671 = _669 + _244;
    int _673 = abs(_655);
    int _675 = _625 * _667;
    int _677 = _675 + _244;
    bool _679 = _214 == 0;
    bool _681 = !_591;
    int _683 = _681 ? 0 : 1;
    int _685 = _491 * _665;
    int _687 = _685 + _657;
    int _689 = ~_603;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    bool _695 = !_679;
    int _697 = _695 ? _671 : (-1);
    int _699 = _651 * _673;
    int _701 = _699 + _687;
    int _703 = abs(_683);
    bool _705 = !_617;
    int _707 = _705 ? 0 : 1;
    int _709 = _693 * _697;
    int _711 = _214 + (-1);
    int _713 = _581 * _703;
    int _715 = _713 + _701;
    bool _717 = !_573;
    int _719 = _717 ? 0 : 1;
    int _721 = abs(_707);
    int _723 = _603 * _711;
    int _725 = _723 + _709;
    bool _727 = !_613;
    int _729 = _727 ? 0 : 1;
    int _731 = abs(_719);
    int _733 = _725 * _721;
    float _735 = float(uint(_715));
    int _737 = abs(_729);
    bool _739 = !_577;
    int _741 = _739 ? 0 : 1;
    float _743 = as_type<float>(_240) * _735;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _747 = _745 != 0;
    int _749 = _545 * _737;
    int _751 = _749 + _733;
    int _753 = abs(_741);
    float _755 = trunc(_743);
    float _757 = precise::max(_755, 0.0);
    uint _759 = uint(_757);
    int _761 = ~_214;
    int _763 = _761 + 1;
    int _765 = _677 * _731;
    int _767 = _765 + _751;
    int _769 = ~_198;
    int _771 = _769 + 1;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _775 = _773 != 0;
    int _777 = _625 * _753;
    int _779 = _777 + _767;
    int _781 = ~_198;
    int _783 = _781 + 1;
    bool _785 = _573;
    float _787 = as_type<float>(_625);
    float _789 = as_type<float>(_783);
    float _791 = _497;
    float _793 = _643;
    if (_747)
    {
        bool _795 = _178 > 0.5;
        _785 = _795;
    }
    bool _797 = _785;
    float _799 = float(uint(_779));
    bool _801 = _507 > 0.5;
    int _803 = _771 * int(_759);
    int _805 = _803 + _715;
    float _807 = _507;
    if (!_747)
    {
        _787 = _497;
    }
    float _809 = _787;
    float _811 = as_type<float>(_250) * _799;
    float _813 = float(uint(_677));
    float _815 = float(uint(_805));
    float _817 = trunc(_811);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    bool _823 = _198 == 0;
    float _825 = as_type<float>(_250) * _813;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _829 = _827 != 0;
    float _831 = as_type<float>(_240) * _815;
    float _833 = trunc(_831);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = in.m_65.w;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _845 = _763 * int(_821);
    int _847 = _845 + _779;
    int _849 = as_type<int>(_831);
    float _851 = _809;
    if (_747)
    {
        float _853 = -_497;
        float _855 = _853 + 1.0;
        _849 = as_type<int>(_855);
    }
    int _857 = _849;
    float _859 = trunc(_825);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    int _865 = 0;
    if (_829)
    {
        _865 = 0;
    }
    int _867 = _865;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _871 = float(uint(_847));
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _875 = as_type<int>(_871);
    int _877 = _867;
    if (_747)
    {
        float _879 = _797 ? as_type<float>(_857) : _497;
        _851 = _879;
    }
    float _881 = _851;
    float _883 = -_519;
    float _885 = _883 + 1.0;
    int _887 = int(_759) + int(_837);
    float _889 = as_type<float>(_250) * _871;
    float _891 = _519;
    if (_775)
    {
        float _893 = -_497;
        float _895 = _893 + 1.0;
        _875 = as_type<int>(_895);
    }
    int _897 = _875;
    if (!_775)
    {
        _789 = _497;
    }
    float _899 = _789;
    float _901 = trunc(_889);
    float _903 = precise::max(_901, 0.0);
    uint _905 = uint(_903);
    float _907 = _899;
    if (!_829)
    {
        _877 = 2;
    }
    int _909 = _877;
    int _911 = _783 * _887;
    int _913 = _911 + _715;
    if (_775)
    {
        float _915 = _801 ? as_type<float>(_897) : _497;
        _907 = _915;
    }
    float _917 = _907;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _921 = _184 > 0.5;
    float _923 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _873);
    bool _925 = uint(_913) >= uint(_198);
    float _927 = float(uint(_651));
    bool _929 = !_925;
    int _931 = _929 ? 0 : (-1);
    int _933 = ~_214;
    int _935 = _933 + 1;
    float _937 = as_type<float>(_240) * _927;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    int _943 = int(_821) + int(_905);
    int _945 = _921 ? as_type<int>(_885) : as_type<int>(_519);
    float _947 = trunc(_937);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    bool _953 = _839 > 0.5;
    int _955 = _935 * _943;
    int _957 = _955 + _779;
    float _959 = _941 ? as_type<float>(_945) : _519;
    int _961 = _953 ? as_type<int>(_885) : as_type<int>(_519);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _965 = _963 != 0;
    bool _967 = uint(_957) >= uint(_214);
    float _969 = _965 ? as_type<float>(_961) : _519;
    float _971 = in.m_71.x;
    float _973 = in.m_71.y;
    float _975 = in.m_71.z;
    int _977 = ~_198;
    int _979 = _977 + 1;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    bool _985 = !_967;
    int _987 = _985 ? 0 : (-1);
    int _989 = _979 * int(_951);
    int _991 = _989 + _651;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _995 = _993 != 0;
    int _997 = ~_887;
    int _999 = _997 + _931;
    int _1001 = _999 + 1;
    int _1003 = ~_943;
    int _1005 = _1003 + _987;
    int _1007 = _1005 + 1;
    float _1009 = float(uint(_991));
    int _1011 = _198 * _1001;
    int _1013 = _1011 + _715;
    int _1015 = ~_214;
    int _1017 = _1015 + 1;
    int _1019 = _214 * _1007;
    int _1021 = _1019 + _779;
    int _1023 = 0;
    if (_983)
    {
        float _1025 = -_497;
        float _1027 = _1025 + 1.0;
        _1023 = as_type<int>(_1027);
    }
    int _1029 = _1023;
    float _1031 = as_type<float>(_240) * _1009;
    bool _1033 = !_823;
    int _1035 = _1033 ? _1013 : (-1);
    float _1037 = in.m_69.x;
    float _1039 = in.m_69.y;
    float _1041 = in.m_69.z;
    bool _1043 = !_679;
    int _1045 = _1043 ? _1021 : (-1);
    int _1047 = _1017 * int(_863);
    int _1049 = _1047 + _677;
    if (_995)
    {
        float _1051 = _801 ? _885 : _519;
        _891 = _1051;
    }
    float _1053 = _891;
    float _1055 = in.m_73.x;
    float _1057 = in.m_73.y;
    float _1059 = in.m_73.z;
    if (_983)
    {
        float _1061 = _921 ? as_type<float>(_1029) : _497;
        _791 = _1061;
    }
    float _1063 = _791;
    int _1065 = _1035 & 3;
    bool _1067 = _1065 != 0;
    float _1069 = trunc(_1031);
    float _1071 = precise::max(_1069, 0.0);
    uint _1073 = uint(_1071);
    int _1075 = _1045 & 3;
    bool _1077 = _1075 != 0;
    bool _1079 = _973 != 0.0;
    bool _1081 = isnan(_973);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    int _1089 = _1035 & 3;
    bool _1091 = _1089 != 0;
    int _1093 = _1067 ? 0 : 1;
    int _1095 = _1077 ? 0 : 1;
    bool _1097 = uint(_1089) > 1u;
    bool _1099 = uint(_1075) > 1u;
    bool _1101 = _971 == 0.0;
    bool _1103 = !_1087;
    bool _1105 = _1101 && _1103;
    float _1107 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1109 = float(uint(_1049));
    bool _1111 = _975 == 0.0;
    bool _1113 = _1111 && _1105;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1117 = ~_1093;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = as_type<float>(_250) * _1109;
    int _1125 = ~_1095;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    float _1131 = trunc(_1123);
    float _1133 = precise::max(_1131, 0.0);
    uint _1135 = uint(_1133);
    int _1137 = _1121;
    int _1139 = _1129;
    if (!_1097)
    {
        int _1141 = ~_1093;
        int _1143 = _1141 + 1;
        _1137 = _1143;
    }
    int _1145 = _1137;
    float _1147 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (!_1099)
    {
        int _1149 = ~_1095;
        int _1151 = _1149 + 1;
        _1139 = _1151;
    }
    int _1153 = _1139;
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _971);
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1159 = _1157 != 0;
    float _1161 = _1055;
    float _1163 = _1057;
    float _1165 = _1059;
    if (!_1113)
    {
        float _1167 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1055);
        _1161 = _1167;
    }
    float _1169 = _1161;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1173 = _1171 != 0;
    float _1175 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1177 = ~_198;
    int _1179 = _1177 + 1;
    float _1181 = _1169;
    if (!_1113)
    {
        float _1183 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1057);
        _1163 = _1183;
    }
    float _1185 = _1163;
    float _1187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _973);
    if (!_1113)
    {
        float _1189 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1059);
        _1165 = _1189;
    }
    float _1191 = _1165;
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _975);
    int _1195 = int(_951) + int(_1073);
    float _1197 = in.m_63.x;
    float _1199 = in.m_63.y;
    float _1201 = in.m_63.z;
    float _1203 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1205 = int(_863) + int(_1135);
    float _1207 = in.m_58.x;
    float _1209 = in.m_58.y;
    float _1211 = in.m_58.z;
    int _1213 = ~_214;
    int _1215 = _1213 + 1;
    int _1217 = _1179 * _1195;
    int _1219 = _1217 + _651;
    float _1221 = fma(_1203, -2.0, _843);
    int _1223 = 0;
    if (_829)
    {
        _1223 = 0;
    }
    int _1225 = _1223;
    float _1227 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1229 = _1215 * _1205;
    int _1231 = _1229 + _677;
    bool _1233 = uint(_1219) >= uint(_198);
    float _1235 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1237 = _1225;
    if (!_829)
    {
        _1237 = 1;
    }
    int _1239 = _1237;
    float _1241 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1243 = -_841;
    float _1245 = fma(_1235, 2.0, _1243);
    bool _1247 = !_1233;
    int _1249 = _1247 ? 0 : (-1);
    float _1251 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1221);
    bool _1253 = uint(_1231) >= uint(_214);
    float _1255 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _1257 = _1239 != 1;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1261 = !_1253;
    int _1263 = _1261 ? 0 : (-1);
    float _1265 = fma(_469, _1199, _1255);
    float _1267 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1269 = fma(_469, _1201, _499);
    bool _1271 = uint(_1089) >= 2u;
    float _1273 = fma(_1265, _539, _1209);
    float _1275 = fma(_469, _1197, _1267);
    float _1277 = fma(_1269, _539, _1211);
    float _1279 = _643 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1283 = fma(_1275, _539, _1207);
    float _1285 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1287 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1289 = fma(_1279, _1053, -0.5);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1281);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1285);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1287);
    int _1297 = _1271 ? 0 : 1;
    float _1299 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1291);
    float _1301 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1293);
    float _1303 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1295);
    bool _1305 = _909 != 2;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1317 = _1307 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1321 = _1309 + _1319;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1325 = _1311 + _1323;
    float _1327 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1329 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1331 = _1321 * _1321;
    float _1333 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1335 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1327);
    float _1337 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1329);
    float _1339 = fma(_1317, _1317, _1331);
    float _1341 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1333);
    float _1343 = _1339;
    if (_1305)
    {
        _1181 = _178;
    }
    float _1345 = _1181;
    float _1347 = -_152;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1245);
    float _1351 = fma(_1325, _1325, _1339);
    float _1353 = _1345;
    if (!_1305)
    {
        _1353 = _507;
    }
    float _1355 = _1353;
    float _1357 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1257)
    {
        _1343 = _184;
    }
    float _1359 = _1343;
    float _1361 = rsqrt(_1351);
    float _1363 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1365 = fma(_1357, _1063, -0.5);
    float _1367 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1369 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1337);
    float _1371 = -_869;
    float _1373 = fma(_1363, 2.0, _1371);
    float _1375 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1341);
    float _1377 = _1359;
    if (!_1257)
    {
        _793 = _1359;
    }
    float _1379 = _793;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1383 = _1379;
    if (_1257)
    {
        _1377 = _178;
    }
    float _1385 = _1377;
    float _1387 = -_152;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1373);
    float _1391 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1381);
    float _1393 = 0.0;
    if (!_1257)
    {
        _1393 = _507;
    }
    float _1395 = _1393;
    float _1397 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1259);
    float _1399 = _1321 * _1361;
    float _1401 = _1317 * _1361;
    float _1403 = _1325 * _1361;
    float _1405 = _1395;
    if (_1257)
    {
        _1405 = _184;
    }
    float _1407 = _1405;
    float _1409 = -_1399;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1415 = _1035 >> 31;
    float _1417 = -_1401;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1317);
    float _1421 = _1411 * _1411;
    float _1423 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1413);
    int _1425 = _1045 >> 31;
    float _1427 = -_1403;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1325);
    int _1431 = _1415 & 3;
    float _1433 = fma(_1419, _1419, _1421);
    int _1435 = _1425 & 3;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1439 = _1035 + _1431;
    float _1441 = fma(_1429, _1429, _1433);
    int _1443 = _1045 + _1435;
    float _1445 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[83].w, _919);
    int _1447 = _1439 >> 2;
    float _1449 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _923);
    int _1451 = _1443 >> 2;
    float _1453 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1437);
    int _1455 = _1447 << 4;
    int _1457 = _1455 + 368;
    float _1459 = sqrt(_1441);
    int _1461 = _1451 << 4;
    int _1463 = _1461 + 512;
    float _1465 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1397);
    uint _1467 = uint(int(uint(_1457) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[int(_1477)][_1479];
    if (_1257)
    {
        _807 = _184;
    }
    float _1483 = _807;
    float _1485 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1391);
    if (_1257)
    {
        _1383 = _178;
    }
    float _1487 = _1383;
    float _1489 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1423);
    if (!_1305)
    {
        _315 = _178;
    }
    float _1491 = _315;
    float _1493 = fma(_1449, _1365, _1389);
    int _1495 = ~_1195;
    int _1497 = _1495 + _1249;
    int _1499 = _1497 + 1;
    uint _1501 = uint(int(uint(_1463) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    bool _1517 = uint(_1075) >= 2u;
    float _1519 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1521 = _1089 != 3;
    int _1523 = _198 * _1499;
    int _1525 = _1523 + _651;
    int _1527 = _1517 ? 0 : 1;
    float _1529 = _1361 * _1459;
    bool _1531 = _1075 != 3;
    int _1533 = _1457 + 8;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    uint _1537 = uint(int(uint(int(_1535)) >> uint(2)));
    int _1539 = int(_1535) & 3;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[int(_1537)][_1539];
    int _1543 = int(_1535) + 1;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    int _1547 = _1543 & 3;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[int(_1545)][_1547];
    int _1551 = ~_1205;
    int _1553 = _1551 + _1263;
    int _1555 = _1553 + 1;
    float _1557 = _1227 * _1529;
    int _1559 = abs(_1153);
    float _1561 = _1115 * _1529;
    int _1563 = ~_1297;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _214 * _1555;
    int _1571 = _1569 + _677;
    int _1573 = ~_1527;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1463 + 8;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[int(_1591)][_1593];
    int _1597 = abs(_1145);
    float _1599 = _1241 * _1529;
    int _1601 = _1567;
    int _1603 = _1577;
    if (_1521)
    {
        int _1605 = ~_1297;
        int _1607 = _1605 + 1;
        _1601 = _1607;
    }
    int _1609 = _1601;
    float _1611 = _1557 * _1155;
    if (_1531)
    {
        int _1613 = ~_1527;
        int _1615 = _1613 + 1;
        _1603 = _1615;
    }
    int _1617 = _1603;
    float _1619 = _1599 * _1193;
    float _1621 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1623 = !_1091;
    int _1625 = _1623 ? 0 : 1;
    float _1627 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1629 = ~_1559;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    float _1635 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1445);
    int _1637 = _1045 & 3;
    bool _1639 = _1637 != 0;
    int _1641 = abs(_1625);
    int _1643 = ~_1597;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    bool _1649 = _1089 != 3;
    bool _1651 = !_1639;
    int _1653 = _1651 ? 0 : 1;
    int _1655 = abs(_1609);
    int _1657 = _1647 * as_type<int>(_1481);
    int _1659 = abs(_1653);
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1663 = int(_1661);
    bool _1665 = !_679;
    int _1667 = _1665 ? _1571 : (-1);
    int _1669 = _1633 * as_type<int>(_1515);
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1673 = !_1649;
    int _1675 = _1673 ? 0 : (-1);
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1679 = ~_1641;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = -_1671;
    float _1687 = fma(_1519, 2.0, _1685);
    int _1689 = abs(_1617);
    float _1691 = fma(_1621, -2.0, _1677);
    int _1693 = abs(_1675);
    int _1695 = _1683 * as_type<int>(_1473);
    int _1697 = _1695 + _1657;
    float _1699 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1701 = int(_1699);
    int _1703 = ~_1659;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    float _1709 = -_152;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1687);
    int _1713 = ~_1655;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    int _1719 = _1707 * as_type<int>(_1507);
    int _1721 = _1719 + _1669;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = _1717 * as_type<int>(_1541);
    int _1731 = _1729 + _1697;
    bool _1733 = _1075 != 3;
    float _1735 = _1561 * _1187;
    int _1737 = ~_1689;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = _1727 * as_type<int>(_1549);
    int _1745 = _1743 + _1731;
    bool _1747 = !_1733;
    int _1749 = _1747 ? 0 : (-1);
    float _1751 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1753 = !_1159;
    int _1755 = _1753 ? 0 : 1;
    int _1757 = _1741 * as_type<int>(_1587);
    int _1759 = _1757 + _1721;
    int _1761 = abs(_1749);
    float _1763 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1751);
    int _1765 = abs(_1663);
    int _1767 = ~_1761;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1763);
    int _1775 = abs(_1755);
    float _1777 = float(uint(_1663));
    int _1779 = _1771 * as_type<int>(_1595);
    int _1781 = _1779 + _1759;
    float _1783 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1785 = !_1173;
    int _1787 = _1785 ? 0 : 1;
    float _1789 = _1309 + _1773;
    float _1791 = float(uint(_1765));
    float _1793 = 1.0 / _1777;
    int _1795 = abs(_1787);
    float _1797 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1783);
    float _1799 = float(uint(_1701));
    int _1801 = ~_1775;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    float _1807 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1797);
    int _1809 = ~_1795;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = 1.0 / _1791;
    int _1817 = ~_1701;
    int _1819 = _1817 + 1;
    int _1821 = _1745 * _1805;
    bool _1823 = !_823;
    int _1825 = _1823 ? _1525 : (-1);
    int _1827 = _1813 * _1781;
    int _1829 = abs(_1701);
    float _1831 = _1307 + _1807;
    int _1833 = ~_1765;
    int _1835 = _1833 + 1;
    float _1837 = 1.0 / _1799;
    int _1839 = _1825 * _1775;
    int _1841 = _1839 + _1821;
    int _1843 = as_type<int>(_1793) + (-2);
    int _1845 = _1667 * _1795;
    int _1847 = _1845 + _1827;
    float _1849 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1851 = float(uint(_1841));
    int _1853 = as_type<int>(_1815) + (-2);
    float _1855 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1849);
    float _1857 = float(uint(_1829));
    float _1859 = as_type<float>(_1843) * _1851;
    float _1861 = float(uint(_1847));
    float _1863 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1855);
    float _1865 = 1.0 / _1857;
    int _1867 = abs(_1841);
    int _1869 = as_type<int>(_1837) + (-2);
    float _1871 = _1311 + _1863;
    int _1873 = abs(_1847);
    float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1877 = _1831 + _1875;
    int _1879 = ~_1663;
    int _1881 = _1879 + 1;
    float _1883 = trunc(_1859);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = as_type<float>(_1869) * _1861;
    float _1891 = _1877 * _1877;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1895 = _1871 + _1893;
    float _1897 = float(uint(_1867));
    float _1899 = trunc(_1889);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = as_type<int>(_1865) + (-2);
    float _1907 = _1895 * _1895;
    float _1909 = float(uint(_1873));
    float _1911 = as_type<float>(_1853) * _1897;
    float _1913 = _1891 + _1907;
    float _1915 = as_type<float>(_1905) * _1909;
    int _1917 = _1881 * int(_1887);
    int _1919 = _1917 + _1841;
    float _1921 = trunc(_1911);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = float(uint(_1919));
    int _1929 = _1819 * int(_1903);
    int _1931 = _1929 + _1847;
    float _1933 = trunc(_1915);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    float _1939 = as_type<float>(_1843) * _1927;
    int _1941 = ~_1829;
    int _1943 = _1941 + 1;
    float _1945 = float(uint(_1931));
    float _1947 = sqrt(_1913);
    float _1949 = as_type<float>(_1869) * _1945;
    int _1951 = _1835 * int(_1925);
    int _1953 = _1951 + _1867;
    float _1955 = trunc(_1939);
    float _1957 = precise::max(_1955, 0.0);
    uint _1959 = uint(_1957);
    int _1961 = _1943 * int(_1937);
    int _1963 = _1961 + _1873;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1967 = float(uint(_1953));
    float _1969 = float(uint(_1963));
    float _1971 = fma(_1627, -2.0, _1965);
    bool _1973 = _1947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = as_type<float>(_1853) * _1967;
    float _1977 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1453);
    float _1979 = as_type<float>(_1905) * _1969;
    float _1981 = trunc(_1949);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    float _1987 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1691);
    float _1989 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1971);
    float _1991 = -_1987;
    float _1993 = fma(_1977, _1289, _1991);
    float _1995 = trunc(_1975);
    float _1997 = precise::max(_1995, 0.0);
    uint _1999 = uint(_1997);
    float _2001 = _1891;
    float _2003 = _1907;
    float _2005 = _1831;
    float _2007 = _1871;
    float _2009 = _1979;
    if (!_1973)
    {
        _156 = _1891;
    }
    float _2011 = _156;
    float _2013 = _2011;
    if (!_1973)
    {
        _2001 = _1789;
    }
    float _2015 = _2001;
    float _2017 = trunc(_1979);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    bool _2023 = !_1973;
    float _2025 = _2015;
    float _2027 = as_type<float>(_2021);
    if (!_2023)
    {
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2033 = _1947 + _2031;
        float _2035 = rsqrt(_1913);
        float _2037 = _2033 * _2029;
        float _2039 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2041 = _2037 * 0.15915493667125701904296875;
        float _2043 = _2041 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = fma(_2045, _2039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = _2035 * _2051;
        float _2055 = _2049 + (-1.0);
        float _2057 = fma(_1877, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1895, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2061 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2065 = _2057 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2069 = _2059 + _2067;
        float _2071 = fma(_1789, _2049, _2061);
        float _2073 = _2065 * _2065;
        float _2075 = _2069 * _2069;
        _2025 = _2071;
        _2013 = _2073;
        _2003 = _2075;
        _2005 = _2057;
        _2007 = _2059;
    }
    float _2077 = _2025;
    float _2079 = _2013;
    float _2081 = _2003;
    float _2083 = _2005;
    float _2085 = _2007;
    int _2087 = ~_1663;
    int _2089 = _2087 + 1;
    out.m_75.x = _1367;
    out.m_75.y = _1369;
    out.m_75.z = _1375;
    int _2091 = int(_1903) + int(_1985);
    int _2093 = ~_1701;
    int _2095 = _2093 + 1;
    int _2097 = int(_1937) + int(_2021);
    int _2099 = int(_1887) + int(_1959);
    int _2101 = _2095 * _2091;
    int _2103 = _2101 + _1847;
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2107 = _2077 + _2105;
    int _2109 = int(_1925) + int(_1999);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2113 = ~_1765;
    int _2115 = _2113 + 1;
    int _2117 = _2089 * _2099;
    int _2119 = _2117 + _1841;
    int _2121 = ~_1829;
    int _2123 = _2121 + 1;
    float _2125 = fma(_2107, _2107, _2079);
    bool _2127 = uint(_2103) >= uint(_1701);
    int _2129 = _2115 * _2109;
    int _2131 = _2129 + _1867;
    bool _2133 = uint(_2119) >= uint(_1663);
    int _2135 = _2123 * _2097;
    int _2137 = _2135 + _1873;
    bool _2139 = !_2127;
    int _2141 = _2139 ? 0 : (-1);
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2145 = !_2133;
    int _2147 = _2145 ? 0 : (-1);
    float _2149 = _2125 + _2081;
    bool _2151 = uint(_2137) >= uint(_1829);
    int _2153 = ~_2099;
    int _2155 = _2153 + _2147;
    int _2157 = _2155 + 1;
    bool _2159 = !_2151;
    int _2161 = _2159 ? 0 : (-1);
    float _2163 = sqrt(_2149);
    int _2165 = ~_2091;
    int _2167 = _2165 + _2141;
    int _2169 = _2167 + 1;
    bool _2171 = _1663 == 0;
    bool _2173 = _1663 == 0;
    int _2175 = _1841 ^ _1663;
    int _2177 = _1663 * _2157;
    int _2179 = _2177 + _1841;
    int _2181 = ~_2161;
    int _2183 = _2097 + _2181;
    int _2185 = _2183 + 1;
    float _2187 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2189 = uint(_2131) >= uint(_1765);
    float _2191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2193 = _1847 ^ _1701;
    float _2195 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2197 = !_2189;
    int _2199 = _2197 ? 0 : (-1);
    uint _2201 = uint(int(uint(_2175) >> uint(31)));
    uint _2203 = uint(int(uint(_2193) >> uint(31)));
    float _2205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2207 = !_2171;
    int _2209 = _2207 ? _2179 : (-1);
    int _2211 = ~_2199;
    int _2213 = _2109 + _2211;
    int _2215 = _2213 + 1;
    int _2217 = ~int(_2201);
    int _2219 = _2217 + 1;
    int _2221 = ~int(_2203);
    int _2223 = _2221 + 1;
    float _2225 = float(_2209);
    int _2227 = _1701 * _2169;
    int _2229 = _2227 + _1847;
    bool _2231 = _1701 == 0;
    int _2233 = _2215 ^ _2219;
    float _2235 = fma(_2187, _2225, _1349);
    int _2237 = _2185 ^ _2223;
    float _2239 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2241 = _1701 == 0;
    float _2243 = fma(_2187, _881, -0.5);
    bool _2245 = !_2231;
    int _2247 = _2245 ? _2229 : (-1);
    float _2249 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2251 = ~_2219;
    int _2253 = _2251 + _2233;
    int _2255 = _2253 + 1;
    float _2257 = fma(_2239, _917, -0.5);
    int _2259 = ~_2223;
    int _2261 = _2259 + _2237;
    int _2263 = _2261 + 1;
    float _2265 = fma(_969, _2249, -0.5);
    float _2267 = float(_2247);
    float _2269 = fma(_1465, _2243, _2235);
    bool _2271 = !_2173;
    int _2273 = _2271 ? _2255 : (-1);
    bool _2275 = !_2241;
    int _2277 = _2275 ? _2263 : (-1);
    float _2279 = fma(_2239, _2267, _1711);
    float _2281 = float(_2273);
    float _2283 = fma(_959, _2195, -0.5);
    float _2285 = float(_2277);
    float _2287 = fma(_1489, _2257, _2279);
    float _2289 = -_1251;
    float _2291 = fma(_2195, _2281, _2289);
    float _2293 = -_1989;
    float _2295 = fma(_2249, _2285, _2293);
    float _2297 = fma(_1485, _2283, _2291);
    float _2299 = fma(_1635, _2265, _2295);
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2307 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2311 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2315 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2317 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2319 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2321 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2323 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2325 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2327 = _2311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2329 = _1493 + 0.5;
    float _2331 = _1993 + 0.5;
    float _2333 = _2269 + 0.5;
    float _2335 = _2287 + 0.5;
    float _2337 = _2297 + 0.5;
    float _2339 = _2299 + 0.5;
    out.m_77.x = _2317;
    out.m_77.y = _2319;
    out.m_77.z = _2321;
    out.m_77.w = _2313;
    bool _2341 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2343 = isnan(_2163);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2349 = _2345 || _2347;
    out.m_79.x = _2323;
    out.m_79.y = _2325;
    out.m_79.z = _2327;
    out.m_79.w = _2315;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _2329;
    out.m_83.y = _2331;
    float _2351 = _2281;
    float _2353 = as_type<float>(_2123);
    if (!_2349)
    {
        _2351 = 1.0;
    }
    float _2355 = _2351;
    out.m_85.x = _2333;
    out.m_85.y = _2337;
    out.m_85.z = _2335;
    out.m_85.w = _2339;
    bool _2357 = !_2349;
    float _2359 = _2355;
    if (!_2357)
    {
        bool _2361 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2363 = isnan(_2163);
        bool _2365 = _2361 || _2363;
        bool _2367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2369 = _2365 || _2367;
        if (!_2369)
        {
            float _2371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2373 = _2163 + _2371;
            float _2375 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2377 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2381 = _2379 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2383 = 1.0 / _2377;
            float _2385 = _2373 * _2383;
            float _2387 = fma(_2385, _2381, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2359 = _2387;
            _2389 = true;
        }
        else
        {
            bool _2391 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2393 = isnan(_2163);
            bool _2395 = _2391 || _2393;
            bool _2397 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2399 = _2395 || _2397;
            if (!_2399)
            {
                float _2401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2403 = _2163 + _2401;
                float _2405 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2407 = _2405 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2409 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2411 = _2409 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2413 = 1.0 / _2407;
                float _2415 = _2403 * _2413;
                float _2417 = fma(_2415, _2411, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2359 = _2417;
                _2389 = true;
            }
            else
            {
                _2359 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2389 = false;
    float _2419 = _2359;
    float _2421 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2423 = _2077 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2427 = _2083 + _2425;
    float _2429 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2431 = _2085 + _2429;
    float _2433 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2435 = fma(_2423, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2437 = fma(_2427, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2439 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2441 = -_1399;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2435);
    float _2445 = -_1401;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2437);
    float _2449 = -_1403;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2439);
    float _2453 = -_1399;
    float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2459 = _2443 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2463 = _2447 + _2461;
    float _2465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2467 = _2451 + _2465;
    float _2469 = -_1401;
    float _2471 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _2473 = _2459 * _2459;
    float _2475 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2477 = -_1403;
    float _2479 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1311);
    float _2481 = fma(_2463, _2463, _2473);
    float _2483 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2475);
    float _2485 = fma(_2467, _2467, _2481);
    float _2487 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2483);
    float _2489 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2491 = rsqrt(_2485);
    float _2493 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2495 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2489);
    float _2497 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2495);
    float _2499 = 1.0 / _2493;
    float _2501 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2503 = _2501 + _2493;
    float _2505 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2507 = sqrt(_2485);
    float _2509 = _2463 * _2505;
    float _2511 = _2467 * _2505;
    float _2513 = _2509 * _2509;
    float _2515 = _2511 * _2511;
    float _2517 = _2503 * _2499;
    float _2519 = _2517 * 0.5;
    float _2521 = _2455 + _2433;
    float _2523 = _2513 + _2515;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2527 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2525);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2531 = sqrt(_2523);
    float _2533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2535 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2529);
    float _2537 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2535);
    float _2539 = precise::max(0.0, _2533);
    float _2541 = 1.0 / _2527;
    float _2543 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2545 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2547 = -_2505;
    float _2549 = -_2539;
    float _2551 = fma(_2459, _2547, _2549);
    float _2553 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2555 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2545);
    bool _2557 = _2531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2559 = trunc(_2543);
    int _2561 = int(_2559);
    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2565 = _2531 + _2563;
    float _2567 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2555);
    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = _2541 * _2571;
    float _2575 = trunc(_2569);
    int _2577 = int(_2575);
    bool _2579 = _2573 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2581 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _2583 = _2573 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2585 = !_2579;
    int _2587 = _2585 ? 0 : 1;
    float _2589 = _2163;
    int _2591 = 2;
    float _2593 = _2523;
    float _2595 = _2565;
    float _2597 = _2553;
    int _2599 = as_type<int>(_2455);
    float _2601 = _2509;
    float _2603 = _2511;
    float _2605 = _2551;
    float _2607 = _2463;
    if (_2557)
    {
        float _2609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2589 = _2609;
    }
    float _2611 = _2589;
    int _2613 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2615 = _2561 + _2613;
    int _2617 = _2615 + 1;
    if (!_2579)
    {
        _2591 = 1;
    }
    int _2619 = _2591;
    int _2621 = _2619;
    if (_2557)
    {
        float _2623 = rsqrt(_2523);
        _2593 = _2623;
    }
    float _2625 = _2593;
    int _2627 = as_type<int>(_2625);
    if (!_2583)
    {
        _2621 = _2587;
    }
    int _2629 = _2621;
    float _2631 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2633 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2635 = _2577 + _2633;
    int _2637 = _2635 + 1;
    int _2639 = _2629 << 6;
    float _2641 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2631);
    bool _2643 = _2617 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2645 = as_type<float>(_2639);
    if (_2557)
    {
        float _2647 = _2565 * _2611;
        _2595 = _2647;
    }
    float _2649 = _2595;
    int _2651 = _2639 + 48;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c15)._m0[int(_2663)][_2665];
    float _2669 = floor(_2581);
    float _2671 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2641);
    float _2673 = _2671;
    if (_2557)
    {
        float _2675 = _2649 * 0.15915493667125701904296875;
        _2353 = _2675;
    }
    float _2677 = _2353;
    int _2679 = _2617 | _2637;
    float _2681 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2683 = as_type<float>(_2679);
    if (_2557)
    {
        float _2685 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2673 = _2685;
    }
    float _2687 = _2673;
    int _2689 = _2639 + 96;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    uint _2693 = uint(int(uint(int(_2691)) >> uint(2)));
    int _2695 = int(_2691) & 3;
    float _2697 = (*spvDescriptorSet0.vp_c15)._m0[int(_2693)][_2695];
    int _2699 = int(_2691) + 1;
    uint _2701 = uint(int(uint(_2699) >> uint(2)));
    int _2703 = _2699 & 3;
    float _2705 = (*spvDescriptorSet0.vp_c15)._m0[int(_2701)][_2703];
    int _2707 = _2131;
    if (_2557)
    {
        float _2709 = _2677 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        _2707 = as_type<int>(_2711);
    }
    int _2713 = _2707;
    bool _2715 = _2679 < 0;
    bool _2717 = _2715 || _2643;
    float _2719 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2721 = _2637 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2723 = _2721 || _2717;
    float _2725 = -_2719;
    float _2727 = fma(_2725, _2553, 1.0);
    int _2729 = _2639 + 104;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    uint _2733 = uint(int(uint(int(_2731)) >> uint(2)));
    int _2735 = int(_2731) & 3;
    float _2737 = (*spvDescriptorSet0.vp_c15)._m0[int(_2733)][_2735];
    int _2739 = int(_2731) + 1;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    int _2743 = _2739 & 3;
    float _2745 = (*spvDescriptorSet0.vp_c15)._m0[int(_2741)][_2743];
    float _2747 = _2677;
    if (_2557)
    {
        float _2749 = _2677 * 6.283185482025146484375;
        float _2751 = cos(_2749);
        _2747 = _2751;
    }
    float _2753 = _2747;
    float _2755 = -_2669;
    float _2757 = _2581 + _2755;
    int _2759 = _2639 + 64;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c15)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
    int _2777 = _2713;
    if (_2557)
    {
        float _2779 = fma(as_type<float>(_2713), _2687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2683 = _2779;
    }
    float _2781 = _2683;
    if (!_2723)
    {
        int _2783 = _2637 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2785 = _2783 + _2617;
        _2777 = _2785;
    }
    int _2787 = _2777;
    if (_2557)
    {
        float _2789 = _2625 * _2781;
        _2027 = _2789;
    }
    float _2791 = _2027;
    float _2793 = _2791;
    if (!_2723)
    {
        int _2795 = _2787 << 2;
        _2627 = _2795;
    }
    int _2797 = _2627;
    int _2799 = _2639 + 56;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c15)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c15)._m0[int(_2811)][_2813];
    int _2817 = _2797;
    if (_2557)
    {
        float _2819 = _2753 + (-1.0);
        _2597 = _2819;
    }
    float _2821 = _2597;
    if (!_2723)
    {
        uint _2823 = uint(int(uint(_2787) >> uint(2)));
        _2599 = int(_2823);
    }
    int _2825 = _2599;
    float _2827 = as_type<float>(_2825);
    if (_2557)
    {
        float _2829 = _2509 * _2791;
        _2601 = _2829;
    }
    float _2831 = _2601;
    if (!_2723)
    {
        int _2833 = 12 & _2797;
        _2817 = _2833;
    }
    int _2835 = _2817;
    if (_2557)
    {
        float _2837 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2837;
    }
    float _2839 = _2009;
    float _2841 = _2839;
    if (_2557)
    {
        float _2843 = _2511 * _2791;
        _2603 = _2843;
    }
    float _2845 = _2603;
    if (!_2557)
    {
        _2793 = _2515;
    }
    float _2847 = _2793;
    float _2849 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2851 = _2847;
    if (!_2723)
    {
        int _2853 = _2825 << 4;
        int _2855 = _2853 + _2835;
        _2827 = as_type<float>(_2855);
    }
    float _2857 = _2827;
    if (_2557)
    {
        float _2859 = fma(_2551, _2753, _2839);
        _2605 = _2859;
    }
    float _2861 = _2605;
    int _2863 = _2639 + 72;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    uint _2867 = uint(int(uint(int(_2865)) >> uint(2)));
    int _2869 = int(_2865) & 3;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[int(_2867)][_2869];
    int _2873 = int(_2865) + 1;
    uint _2875 = uint(int(uint(_2873) >> uint(2)));
    int _2877 = _2873 & 3;
    float _2879 = (*spvDescriptorSet0.vp_c15)._m0[int(_2875)][_2877];
    if (!_2557)
    {
        _2841 = _2513;
    }
    float _2881 = _2841;
    float _2883 = _2881;
    if (_2557)
    {
        float _2885 = _2831 * _2831;
        _2883 = _2885;
    }
    float _2887 = _2883;
    float _2889 = log2(_2727);
    float _2891 = _2521 * _2667;
    if (_2557)
    {
        float _2893 = _2845 * _2845;
        _2851 = _2893;
    }
    float _2895 = _2851;
    float _2897 = fma(_2861, _2861, _2887);
    float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2901 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2899);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    int _2905 = _2639 + 80;
    uint _2907 = uint(int(uint(_2905) >> uint(2)));
    uint _2909 = uint(int(uint(int(_2907)) >> uint(2)));
    int _2911 = int(_2907) & 3;
    float _2913 = (*spvDescriptorSet0.vp_c15)._m0[int(_2909)][_2911];
    int _2915 = int(_2907) + 1;
    uint _2917 = uint(int(uint(_2915) >> uint(2)));
    int _2919 = _2915 & 3;
    float _2921 = (*spvDescriptorSet0.vp_c15)._m0[int(_2917)][_2919];
    float _2923 = fma(_2471, _2659, _2891);
    float _2925 = floor(_2849);
    float _2927 = _2521 * _2705;
    float _2929 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2931 = -_2903;
    float _2933 = _2931 + 1.0;
    float _2935 = fma(_2471, _2697, _2927);
    float _2937 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2939 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2929);
    int _2941 = _2639 + 88;
    uint _2943 = uint(int(uint(_2941) >> uint(2)));
    uint _2945 = uint(int(uint(int(_2943)) >> uint(2)));
    int _2947 = int(_2943) & 3;
    float _2949 = (*spvDescriptorSet0.vp_c15)._m0[int(_2945)][_2947];
    int _2951 = int(_2943) + 1;
    uint _2953 = uint(int(uint(_2951) >> uint(2)));
    int _2955 = _2951 & 3;
    float _2957 = (*spvDescriptorSet0.vp_c15)._m0[int(_2953)][_2955];
    float _2959 = fma(_2479, _2737, _2935);
    float _2961 = _2897 + _2895;
    float _2963 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2937);
    float _2965 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2967 = _2959 + _2745;
    float _2969 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2939);
    float _2971 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2963);
    float _2973 = rsqrt(_2961);
    float _2975 = _2857;
    if (!_2723)
    {
        int _2977 = as_type<int>(_2857) + 400;
        uint _2979 = uint(int(uint(_2977) >> uint(2)));
        uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
        int _2983 = int(_2979) & 3;
        float _2985 = (*spvDescriptorSet0.vp_c15)._m0[int(_2981)][_2983];
        _2975 = _2985;
    }
    float _2987 = _2975;
    float _2989 = _2969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2991 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2965);
    float _2993 = _2971 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2995 = _2521 * _2775;
    float _2997 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2999 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2991);
    float _3001 = 1.0 / _2967;
    float _3003 = fma(_2471, _2767, _2995);
    float _3005 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2997);
    float _3007 = fma(_2479, _2807, _2923);
    float _3009 = _2999 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3005);
    float _3013 = _2973 * _2831;
    float _3015 = _3007 + _2815;
    float _3017 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3011);
    float _3019 = abs(_2933);
    float _3021 = log2(_3019);
    float _3023 = _2973 * _2861;
    float _3025 = fma(_2479, _2871, _3003);
    float _3027 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3029 = _2973 * _2845;
    float _3031 = _3015 * _3001;
    float _3033 = _3025 + _2879;
    float _3035 = -_3027;
    float _3037 = fma(_3023, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3035);
    float _3039 = _2767;
    float _3041 = _2995;
    if (!_2723)
    {
        float _3043 = floor(_2569);
        _3039 = _3043;
    }
    float _3045 = _3039;
    bool _3047 = _3031 >= 0.0;
    float _3049 = _3033 * _3001;
    float _3051 = -_3029;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3037);
    float _3055 = -_2925;
    float _3057 = _2849 + _3055;
    bool _3059 = _3031 <= 1.0;
    bool _3061 = _3059 && _3047;
    float _3063 = _2521 * _2921;
    float _3065 = fma(_3053, -0.5, 0.5);
    float _3067 = fma(_3053, 0.5, 0.5);
    bool _3069 = _3049 >= 0.0;
    bool _3071 = _3069 && _3061;
    float _3073 = fma(_2471, _2913, _3063);
    float _3075 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3077 = fma(_3067, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _3079 = _3049 <= 1.0;
    bool _3081 = _3079 && _3071;
    float _3083 = fma(_2479, _2949, _3073);
    if (!_2723)
    {
        float _3085 = floor(_2543);
        _3041 = _3085;
    }
    float _3087 = _3041;
    float _3089 = _3045;
    if (!_2723)
    {
        float _3091 = -_3045;
        float _3093 = _2569 + _3091;
        _2645 = _3093;
    }
    float _3095 = _2645;
    float _3097 = fma(_3067, _3077, -0.212114393711090087890625);
    float _3099 = _3083 + _2957;
    float _3101 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3103 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3105 = fma(_3067, _3097, 1.570728778839111328125);
    float _3107 = exp2(_3075);
    float _3109 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3101);
    float _3111 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3103);
    if (_3081)
    {
        float _3113 = float(_2629);
        _3089 = _3113;
    }
    float _3115 = _3089;
    float _3117 = _3023 + 1.0;
    float _3119 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3109);
    float _3121 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3111);
    float _3123 = sqrt(_3065);
    float _3125 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3121);
    float _3127 = _3099 * _3001;
    float _3129 = 1.0 / _3017;
    float _3131 = -_3023;
    float _3133 = fma(_3107, _3117, _3131);
    float _3135 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3119);
    float _3137 = _3119;
    float _3139 = _3125;
    if (!_2723)
    {
        float _3141 = -_3087;
        float _3143 = _2543 + _3141;
        _3137 = _3143;
    }
    float _3145 = _3137;
    float _3147 = _2889 * 0.693147182464599609375;
    float _3149 = fma(_3133, 0.5, 0.5);
    float _3151 = _3101;
    if (!_2723)
    {
        float _3153 = rint(_2987);
        float _3155 = precise::max(_3153, 0.0);
        uint _3157 = uint(_3155);
        uint _3159 = clamp(_3157, 0u, 65535u);
        _3151 = as_type<float>(_3159);
    }
    float _3161 = _3151;
    float _3163 = _3123 * 0.636619746685028076171875;
    float _3165 = _3147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _8663 = float2(_2757, _3057);
    float _3167 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8663, float2(0.0), isnan(_8663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8663, float2(0.0), isnan(_8663)), level(0.0)).x;
    float _3169 = -_3105;
    float _3171 = fma(_3163, _3169, 1.0);
    float _3173 = _3115;
    if (_3081)
    {
        float _3175 = rint(_3115);
        float _3177 = precise::max(_3175, 0.0);
        uint _3179 = uint(_3177);
        uint _3181 = clamp(_3179, 0u, 65535u);
        _3173 = as_type<float>(_3181);
    }
    float _3183 = _3173;
    float _3185 = _3135 * _3129;
    float _3187 = _3125 * _3129;
    float _3189 = fma(_3185, 0.5, 0.5);
    float _3191 = fma(_3187, -0.5, 0.5);
    float _3193 = _3161;
    if (!_2723)
    {
        float3 _8710 = float3(_3145, _3095, float(as_type<int>(_3161)));
        float3 _8714 = select(_8710, float3(0.0), isnan(_8710));
        float _3195 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8714.xy, uint(rint(_8714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8714.xy, uint(rint(_8714.z)), level(0.0)).x;
        _3193 = _3195;
    }
    float _3197 = _3193;
    float _3199 = _3049;
    if (_3081)
    {
        float3 _8729 = float3(_3031, _3049, float(as_type<int>(_3183)));
        float3 _8731 = select(_8729, float3(0.0), isnan(_8729));
        float _3201 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8731.xy, uint(rint(_8731.z)), _3127, level(0.0));
        _3199 = _3201;
    }
    float _3203 = _3199;
    float3 _8741 = float3(_3189, _3191, _3165);
    float _3205 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8741, float3(0.0), isnan(_8741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8741, float3(0.0), isnan(_8741)), level(0.0)).x;
    float3 _8750 = float3(_3189, _3191, _3165);
    float4 _3208 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8750, float3(0.0), isnan(_8750)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8750, float3(0.0), isnan(_8750)), level(0.0)).xyzw;
    float _3210 = _3208.x;
    float _3212 = _3208.y;
    float _3214 = _3208.z;
    float _3216 = _3208.w;
    float2 _8766 = float2(_3171, _3149);
    float3 _3220 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8766, float2(0.0), isnan(_8766)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8766, float2(0.0), isnan(_8766)), level(0.0)).xyz;
    float _3222 = _3220.x;
    float _3224 = _3220.y;
    float _3226 = _3220.z;
    float _3228 = abs(_2573);
    float _3230 = log2(_3228);
    float _3232 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3234 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.x = _2463;
    out.m_87.y = _2459;
    out.m_87.z = _2467;
    float _3236 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3232);
    float _3238 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3236);
    float _3240 = _3017 * 0.5;
    float _3242 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3238);
    float _3244 = _3135 + _3017;
    float _3246 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3248 = _3242 + _3017;
    float _3250 = _3244 * 0.5;
    float _3252 = fma(_3125, -0.5, _3240);
    float _3254 = _3248 * 0.5;
    float _3256 = exp2(_3246);
    out.gl_Position.x = _3135;
    out.gl_Position.y = _3125;
    out.gl_Position.z = _3242;
    out.gl_Position.w = _3017;
    bool _3258 = _2573 <= 8000.0;
    bool _3260 = isnan(_2573);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan(8000.0);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    out.m_89.x = _3250;
    out.m_89.y = _3252;
    out.m_89.z = _3254;
    out.m_89.w = _3017;
    bool _3270 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3272 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan(0.5);
    bool _3278 = _3274 || _3276;
    float _3280 = exp2(_3234);
    float _3282 = fma(_3256, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = fma(_3284, -2.0, 3.0);
    float _3288 = _3284 * _3284;
    if (_3278)
    {
        _2607 = 1.0;
    }
    float _3290 = _2607;
    float _3292 = _3288 * _3286;
    float _3294 = -_3292;
    float _3296 = _3294 + 1.0;
    float _3298 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3292);
    float _3300 = _3268 * _3298;
    float _3302 = _3298;
    float _3304 = _3290;
    float _3306 = _3300;
    if (_3278)
    {
        _3302 = 1.0;
    }
    float _3308 = _3302;
    float _3310 = _3308;
    if (!_3278)
    {
        float _3312 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3314 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3316 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3314;
        float _3318 = _3312 * 0.15915493667125701904296875;
        float _3320 = _3318 * 6.283185482025146484375;
        float _3322 = cos(_3320);
        float _3324 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3326 = _3324 * 0.15915493667125701904296875;
        float _3328 = _3318 * 6.283185482025146484375;
        float _3330 = sin(_3328);
        float _3332 = 1.0 / _3322;
        float _3334 = _3326 * 6.283185482025146484375;
        float _3336 = cos(_3334);
        float _3338 = _3330 * _3332;
        float _3340 = _3326 * 6.283185482025146484375;
        float _3342 = sin(_3340);
        float _3344 = _3336 * _3338;
        float _3346 = 1.0 / _3316;
        float _3348 = 1.0 / _3344;
        float _3350 = _3342 * _3348;
        float _3352 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3354 = fma(_2573, _3350, _3352);
        float _3356 = _3354 * _3346;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        _3139 = _3354;
        _3304 = _3358;
    }
    float _3360 = _3139;
    float _3362 = _3304;
    float _3364 = _3360;
    if (!_3278)
    {
        float _3366 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3368 = _3366 * 0.15915493667125701904296875;
        float _3370 = _3368 * 6.283185482025146484375;
        float _3372 = cos(_3370);
        float _3374 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3376 = _3374 * 0.15915493667125701904296875;
        float _3378 = _3368 * 6.283185482025146484375;
        float _3380 = sin(_3378);
        float _3382 = 1.0 / _3372;
        float _3384 = _3376 * 6.283185482025146484375;
        float _3386 = cos(_3384);
        float _3388 = _3380 * _3382;
        float _3390 = _3376 * 6.283185482025146484375;
        float _3392 = sin(_3390);
        float _3394 = _3386 * _3388;
        float _3396 = 1.0 / _3394;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3400 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3398;
        float _3402 = 1.0 / _3400;
        float _3404 = _3392 * _3396;
        float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3408 = fma(_2573, _3404, _3406);
        float _3410 = _3408 * _3402;
        float _3412 = precise::clamp(_3410, 0.0, 1.0);
        float _3414 = -_3412;
        float _3416 = _3414 + 1.0;
        _3364 = _3376;
        _3310 = _3416;
    }
    float _3418 = _3364;
    float _3420 = _3310;
    float _3422 = -_3280;
    float _3424 = _3422 + 1.0;
    float _3426 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3428 = -_3167;
    float _3430 = _3428 + 1.0;
    float _3432 = _3424;
    float _3434 = _3418;
    if (!_3081)
    {
        _3306 = 1.0;
    }
    float _3436 = _3306;
    float _3438 = _3436;
    if (_3081)
    {
        bool _3440 = _3203 >= _3127;
        bool _3442 = isnan(_3203);
        bool _3444 = _3440 || _3442;
        bool _3446 = isnan(_3127);
        bool _3448 = _3444 || _3446;
        float _3450 = float(_3448);
        _3438 = _3450;
    }
    float _3452 = _3438;
    float _3454 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3456 = _3430 * _3426;
    float _3458 = precise::clamp(_3456, 0.0, 1.0);
    float _3460 = _3452;
    float _3462 = _3454;
    if (_2723)
    {
        _3432 = 1.0;
    }
    float _3464 = _3432;
    float _3466 = _3464;
    if (!_2723)
    {
        int _3468 = _2787 << 4;
        int _3470 = _3468 + 2048;
        uint _3472 = uint(int(uint(_3470) >> uint(2)));
        uint _3474 = uint(int(uint(int(_3472)) >> uint(2)));
        int _3476 = int(_3472) & 3;
        float _3478 = (*spvDescriptorSet0.vp_c15)._m0[int(_3474)][_3476];
        int _3480 = int(_3472) + 1;
        uint _3482 = uint(int(uint(_3480) >> uint(2)));
        int _3484 = _3480 & 3;
        float _3486 = (*spvDescriptorSet0.vp_c15)._m0[int(_3482)][_3484];
        int _3488 = _3470 + 8;
        uint _3490 = uint(int(uint(_3488) >> uint(2)));
        uint _3492 = uint(int(uint(int(_3490)) >> uint(2)));
        int _3494 = int(_3490) & 3;
        float _3496 = (*spvDescriptorSet0.vp_c15)._m0[int(_3492)][_3494];
        int _3498 = int(_3490) + 1;
        uint _3500 = uint(int(uint(_3498) >> uint(2)));
        int _3502 = _3498 & 3;
        float _3504 = (*spvDescriptorSet0.vp_c15)._m0[int(_3500)][_3502];
        float _3506 = _2521 * _3486;
        float _3508 = fma(_2471, _3478, _3506);
        float _3510 = fma(_2479, _3496, _3508);
        float _3512 = _3510 + _3504;
        float _3514 = precise::clamp(_3512, 0.0, 1.0);
        float _3516 = -_3514;
        float _3518 = _3516 + _3197;
        float _3520 = fma(_3518, 500.0, 1.5);
        float _3522 = exp2(_3520);
        float _3524 = 0.0 + _3522;
        float _3526 = precise::clamp(_3524, 0.0, 1.0);
        _3466 = _3526;
        _3434 = 500.0;
    }
    float _3528 = _3466;
    float _3530 = _3434;
    float _3532 = _3454 * _3205;
    float _3534 = _3452 * _3528;
    float _3536 = -_3458;
    float _3538 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3540 = -_3454;
    float _3542 = _3540 + 1.0;
    float _3544 = _3216 * _3532;
    float _3546 = _3226 * _3532;
    float _3548 = -_3534;
    float _3550 = fma(_3548, _3538, 1.0);
    float _3552 = precise::clamp(_3550, 0.0, 1.0);
    float _3554 = _3216 * _3542;
    float _3556 = fma(_3222, _3544, _3210);
    float _3558 = fma(_3224, _3544, _3212);
    float _3560 = _3552 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3562 = fma(_3216, _3546, _3214);
    bool _3564 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3566 = isnan(_2507);
    bool _3568 = _3564 || _3566;
    bool _3570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3572 = _3568 || _3570;
    float _3574 = _3362 * _3420;
    out.m_91.x = _3560;
    float _3576 = _3574 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _3556;
    out.m_93.y = _3558;
    out.m_93.z = _3562;
    out.m_93.w = _3554;
    float _3578 = _3530;
    float _3580 = _3534;
    float _3582 = _3542;
    float _3584 = _3552;
    if (!_3572)
    {
        _3460 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3586 = _3460;
    float _3588 = _3586;
    float _3590 = _3586;
    if (!_3572)
    {
        _3578 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3592 = _3578;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3572)
    {
        _3462 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3598 = _3462;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3572)
    {
        _3580 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3604 = _3580;
    float _3606 = _3604;
    float _3608 = _3604;
    if (!_3572)
    {
        _3582 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3610 = _3582;
    float _3612 = _3610;
    float _3614 = _3610;
    if (!_3572)
    {
        _3584 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3616 = _3584;
    bool _3618 = !_3572;
    float _3620 = _3616;
    float _3622 = _3616;
    if (!_3618)
    {
        bool _3624 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3626 = isnan(_2507);
        bool _3628 = _3624 || _3626;
        bool _3630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3632 = _3628 || _3630;
        if (!_3632)
        {
            float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3636 = _2507 + _3634;
            float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3640 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3638;
            float _3642 = 1.0 / _3640;
            float _3644 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3654 = _3652 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3664 = _3636 * _3642;
            float _3666 = precise::clamp(_3664, 0.0, 1.0);
            float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3672 = fma(_3666, _3646, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3674 = fma(_3666, _3670, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3676 = fma(_3666, _3650, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3678 = fma(_3666, _3654, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3680 = fma(_3666, _3658, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3682 = fma(_3666, _3662, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3596 = _3672;
            _3614 = _3680;
            _3590 = _3674;
            _3608 = _3678;
            _3602 = _3676;
            _3622 = _3682;
            _3684 = true;
        }
        else
        {
            bool _3686 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3688 = isnan(_2507);
            bool _3690 = _3686 || _3688;
            bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3694 = _3690 || _3692;
            if (!_3694)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3696 = _3588;
            _3590 = _3696;
            if (!_3694)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3698 = _3594;
            _3596 = _3698;
            if (!_3694)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3700 = _3600;
            _3602 = _3700;
            if (!_3694)
            {
                _3606 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3702 = _3606;
            _3608 = _3702;
            if (!_3694)
            {
                _3612 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3704 = _3612;
            _3614 = _3704;
            if (!_3694)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3706 = _3620;
            bool _3708 = !_3694;
            _3622 = _3706;
            if (!_3708)
            {
                bool _3710 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3712 = isnan(_2507);
                bool _3714 = _3710 || _3712;
                bool _3716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3718 = _3714 || _3716;
                if (!_3718)
                {
                    float _3720 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3722 = _2507 + _3720;
                    float _3724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3726 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3724;
                    float _3728 = 1.0 / _3726;
                    float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3750 = _3722 * _3728;
                    float _3752 = precise::clamp(_3750, 0.0, 1.0);
                    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3758 = fma(_3752, _3732, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3760 = fma(_3752, _3756, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3762 = fma(_3752, _3736, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3764 = fma(_3752, _3740, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3766 = fma(_3752, _3744, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3768 = fma(_3752, _3748, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3596 = _3758;
                    _3614 = _3766;
                    _3590 = _3760;
                    _3608 = _3764;
                    _3602 = _3762;
                    _3622 = _3768;
                    _3684 = true;
                }
                else
                {
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3614 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3608 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3684 = false;
    float _3770 = _3596;
    float _3772 = _3614;
    float _3774 = _3590;
    float _3776 = _3608;
    float _3778 = _3602;
    float _3780 = _3622;
    float _3782 = fma(_1369, -0.5, 0.5);
    float _3784 = precise::clamp(_3782, 0.0, 1.0);
    float _3786 = _3576 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3788 = -_3770;
    float _3790 = _3788 + _3772;
    float _3792 = -_3774;
    float _3794 = _3792 + _3776;
    out.m_95.x = 0.0;
    float _3796 = -_3778;
    float _3798 = _3796 + _3780;
    float _3800 = fma(_3784, _3790, _3770);
    float _3802 = fma(_3784, _3794, _3774);
    out.m_61.x = _3786;
    bool _3804 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3806 = _3800 * 0.586610972881317138671875;
    float _3808 = fma(_3784, _3798, _3778);
    bool _3810 = _3362 > 0.0;
    bool _3812 = isnan(_3362);
    bool _3814 = _3810 || _3812;
    bool _3816 = isnan(0.0);
    bool _3818 = _3814 || _3816;
    float _3820 = fma(_3802, 0.298911988735198974609375, _3806);
    bool _3822 = _3420 <= 0.0;
    bool _3824 = !_3818;
    bool _3826 = _3822 || _3824;
    float _3828 = fma(_3808, 0.114477999508380889892578125, _3820);
    float _3830 = -_3828;
    float _3832 = _3802 + _3830;
    float _3834 = -_3828;
    float _3836 = _3800 + _3834;
    float _3838 = -_3828;
    float _3840 = _3808 + _3838;
    float _3842 = fma(_3832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    float _3844 = fma(_3836, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    float _3846 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    bool _3848 = !_3804;
    if (!_3848)
    {
        float _3850 = -_2443;
        float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3854 = -_2447;
        float _3856 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3858 = -_2451;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3862 = _3852 * _3852;
        float _3864 = fma(_3856, _3856, _3862);
        float _3866 = fma(_3860, _3860, _3864);
        float _3868 = sqrt(_3866);
        float _3870 = rsqrt(_3866);
        float _3872 = -_3868;
        float _3874 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3876 = _3874 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3878 = precise::clamp(_3876, 0.0, 1.0);
        float _3880 = _3856 * _3870;
        float _3882 = _3852 * _3870;
        float _3884 = abs(_3878);
        float _3886 = log2(_3884);
        float _3888 = _3860 * _3870;
        float _3890 = _3880 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3892 = _1369 * _3882;
        float _3894 = -_3882;
        float _3896 = -_3890;
        float _3898 = fma(_3894, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3896);
        float _3900 = fma(_1367, _3880, _3892);
        float _3902 = -_3888;
        float _3904 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3898);
        float _3906 = fma(_1375, _3888, _3900);
        float _3908 = precise::clamp(_3906, 0.0, 1.0);
        float _3910 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3912 = _3904 + _3910;
        float _3914 = _3886 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3916 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3918 = precise::clamp(_3916, 0.0, 1.0);
        float _3920 = exp2(_3914);
        float _3922 = _3920 * _3918;
        float _3924 = _3908 * _3922;
        float _3926 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3928 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3930 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3926;
        out.m_95.y = _3928;
        out.m_95.z = _3930;
    }
    out.m_97.x = _3842;
    out.m_97.y = _3844;
    out.m_97.z = _3846;
    if (!_3826)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3932 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3932;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3684 = false;
    bool _2389 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_58.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_116);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    float _128 = _126;
    if (!_120)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3991 = as_type<float>(_134);
        out.gl_Position.z = _3991;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_116);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_61.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4060 = as_type<float>(_172);
        out.gl_Position.z = _4060;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _176 = int(_174);
    float _178 = in.m_65.x;
    float _180 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _182 = float(_116);
    float _184 = in.m_65.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _192 = int(_190);
    float _194 = float(_176);
    float _196 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _198 = int(_196);
    float _200 = _180;
    if (_188)
    {
        _124 = 1.0;
    }
    float _202 = _124;
    float _204 = _202;
    if (!_188)
    {
        _204 = 7.345489978790283203125;
    }
    float _206 = _204;
    float _208 = float(_192);
    float _210 = 1.0 / _194;
    float _212 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _214 = int(_212);
    float _216 = float(uint(_198));
    float _218 = float(_198);
    float _220 = 1.0 / _208;
    float _222 = _152 * _210;
    float _224 = 1.0 / _216;
    float _226 = float(uint(_214));
    float _228 = trunc(_222);
    int _230 = int(_228);
    float _232 = _152 * _220;
    int _234 = ~_198;
    int _236 = _234 + 1;
    float _238 = 1.0 / _226;
    int _240 = as_type<int>(_224) + (-2);
    float _242 = trunc(_232);
    int _244 = int(_242);
    float _246 = float(uint(_230));
    float _248 = as_type<float>(_240) * _246;
    int _250 = as_type<int>(_238) + (-2);
    float _252 = 1.0 / _182;
    int _254 = ~_214;
    int _256 = _254 + 1;
    float _258 = float(uint(_244));
    float _260 = trunc(_248);
    float _262 = precise::max(_260, 0.0);
    uint _265 = uint(_262);
    float _267 = as_type<float>(_250) * _258;
    float _269 = _206 * _178;
    float _271 = _206;
    if (_188)
    {
        _271 = 1.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_188)
    {
        _275 = 1.2345600128173828125;
    }
    float _277 = _275;
    float _279 = floor(_269);
    int _281 = int(_188);
    int _283 = false ? 2 : 0;
    int _285 = _281 | _283;
    int _287 = false ? 4 : 0;
    int _289 = _285 | _287;
    int _291 = false ? 8 : 0;
    int _293 = _289 | _291;
    int _295 = false ? 16 : 0;
    int _297 = _293 | _295;
    int _299 = false ? 32 : 0;
    int _301 = _297 | _299;
    int _303 = false ? 64 : 0;
    int _305 = _301 | _303;
    int _307 = _305 & 1;
    float _309 = as_type<float>(_307);
    if (_188)
    {
        _309 = _178;
    }
    float _311 = _309;
    float _313 = _311;
    float _315 = _184;
    if (!_188)
    {
        _313 = _184;
    }
    float _317 = _313;
    int _319 = _236 * int(_265);
    int _321 = _319 + _230;
    float _323 = trunc(_267);
    float _325 = precise::max(_323, 0.0);
    uint _327 = uint(_325);
    bool _329 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.0);
    bool _337 = _333 || _335;
    float _339 = float(uint(_321));
    float _341 = as_type<float>(_240) * _339;
    float _343 = _317 * _277;
    float _345 = _152 * _218;
    float _347 = trunc(_341);
    float _349 = precise::max(_347, 0.0);
    uint _351 = uint(_349);
    float _353 = 0.0;
    if (!_337)
    {
        float _355 = _180 * _180;
        float _357 = _355 * 0.5;
        _353 = _357;
    }
    float _359 = _353;
    int _361 = _256 * int(_327);
    int _363 = _361 + _244;
    float _365 = float(_214);
    float _367 = _345 * _252;
    float _369 = _359;
    if (!_337)
    {
        float _371 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _369 = _371;
    }
    float _373 = _369;
    float _375 = float(uint(_363));
    float _377 = floor(_343);
    float _379 = _152 * _365;
    float _381 = -_279;
    float _383 = _269 + _381;
    float _385 = as_type<float>(_250) * _375;
    float _387 = _379 * _252;
    int _389 = ~_198;
    int _391 = _389 + 1;
    int _393 = int(_265) + int(_351);
    float _395 = trunc(_385);
    float _397 = precise::max(_395, 0.0);
    uint _399 = uint(_397);
    float _401 = -_377;
    float _403 = _343 + _401;
    float _405 = float(_230);
    int _407 = _391 * _393;
    int _409 = _407 + _230;
    bool _411 = !_337;
    float _413 = _373;
    if (!_411)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _425 = _180 * _417;
        float _427 = 1.0 / _421;
        float _429 = _423 * 0.693147182464599609375;
        float _431 = exp2(_425);
        float _433 = 1.0 / _429;
        float _435 = _431 + (-1.0);
        float _437 = -_435;
        float _439 = fma(_437, _433, _180);
        float _441 = _439 * _427;
        float _443 = _441 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _413 = _443;
    }
    float _445 = _413;
    bool _447 = !_337;
    if (!_447)
    {
        float _449 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _451 = log2(_449);
        float _453 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _455 = _453 + 1.0;
        float _457 = 1.0 / _455;
        float _459 = _180 * _451;
        float _461 = exp2(_459);
        float _463 = -_461;
        float _465 = _463 + 1.0;
        float _467 = _465 * _457;
        _200 = _467;
    }
    float _469 = _200;
    bool _471 = _405 >= _218;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan(_218);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _365 * _403;
    bool _485 = uint(_409) >= uint(_198);
    float _487 = _383 * _218;
    float _489 = trunc(_367);
    int _491 = int(_489);
    bool _493 = !_485;
    int _495 = _493 ? 0 : (-1);
    float _497 = in.m_67.x;
    float _499 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _501 = ~_393;
    int _503 = _501 + _495;
    int _505 = _503 + 1;
    float _507 = in.m_65.z;
    bool _509 = _198 == 0;
    float _511 = trunc(_481);
    int _513 = int(_511);
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _517 = _515 != 0;
    float _519 = in.m_67.y;
    int _521 = int(_327) + int(_399);
    int _523 = _198 * _505;
    int _525 = _523 + _230;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _537 = _535 != 0;
    float _539 = in.m_69.w;
    float _541 = float(_244);
    float _543 = trunc(_387);
    int _545 = int(_543);
    int _547 = ~_214;
    int _549 = _547 + 1;
    bool _551 = _541 >= _365;
    bool _553 = isnan(_541);
    bool _555 = _551 || _553;
    bool _557 = isnan(_365);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = !_533;
    int _565 = _563 ? 0 : 1;
    int _567 = _549 * _521;
    int _569 = _567 + _244;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _577 = _575 != 0;
    float _579 = trunc(_487);
    int _581 = int(_579);
    int _583 = ~_513;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _591 = _589 != 0;
    bool _593 = !_509;
    int _595 = _593 ? _525 : (-1);
    bool _597 = !_517;
    int _599 = _597 ? 0 : 1;
    float _601 = trunc(_561);
    int _603 = int(_601);
    bool _605 = !_529;
    int _607 = _605 ? 0 : 1;
    int _609 = _595 * _587;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _617 = _615 != 0;
    bool _619 = uint(_569) >= uint(_214);
    int _621 = _198 + (-1);
    float _623 = trunc(_483);
    int _625 = int(_623);
    int _627 = abs(_599);
    int _629 = abs(_565);
    int _631 = _513 * _621;
    int _633 = _631 + _609;
    bool _635 = !_619;
    int _637 = _635 ? 0 : (-1);
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _641 = _639 != 0;
    float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _645 = !_641;
    int _647 = _645 ? 0 : 1;
    int _649 = _581 * _627;
    int _651 = _649 + _230;
    bool _653 = !_537;
    int _655 = _653 ? 0 : 1;
    int _657 = _633 * _629;
    int _659 = ~_521;
    int _661 = _659 + _637;
    int _663 = _661 + 1;
    int _665 = abs(_607);
    int _667 = abs(_647);
    int _669 = _214 * _663;
    int _671 = _669 + _244;
    int _673 = abs(_655);
    int _675 = _625 * _667;
    int _677 = _675 + _244;
    bool _679 = _214 == 0;
    bool _681 = !_591;
    int _683 = _681 ? 0 : 1;
    int _685 = _491 * _665;
    int _687 = _685 + _657;
    int _689 = ~_603;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    bool _695 = !_679;
    int _697 = _695 ? _671 : (-1);
    int _699 = _651 * _673;
    int _701 = _699 + _687;
    int _703 = abs(_683);
    bool _705 = !_617;
    int _707 = _705 ? 0 : 1;
    int _709 = _693 * _697;
    int _711 = _214 + (-1);
    int _713 = _581 * _703;
    int _715 = _713 + _701;
    bool _717 = !_573;
    int _719 = _717 ? 0 : 1;
    int _721 = abs(_707);
    int _723 = _603 * _711;
    int _725 = _723 + _709;
    bool _727 = !_613;
    int _729 = _727 ? 0 : 1;
    int _731 = abs(_719);
    int _733 = _725 * _721;
    float _735 = float(uint(_715));
    int _737 = abs(_729);
    bool _739 = !_577;
    int _741 = _739 ? 0 : 1;
    float _743 = as_type<float>(_240) * _735;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _747 = _745 != 0;
    int _749 = _545 * _737;
    int _751 = _749 + _733;
    int _753 = abs(_741);
    float _755 = trunc(_743);
    float _757 = precise::max(_755, 0.0);
    uint _759 = uint(_757);
    int _761 = ~_214;
    int _763 = _761 + 1;
    int _765 = _677 * _731;
    int _767 = _765 + _751;
    int _769 = ~_198;
    int _771 = _769 + 1;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _775 = _773 != 0;
    int _777 = _625 * _753;
    int _779 = _777 + _767;
    int _781 = ~_198;
    int _783 = _781 + 1;
    bool _785 = _573;
    float _787 = as_type<float>(_625);
    float _789 = as_type<float>(_783);
    float _791 = _497;
    float _793 = _643;
    if (_747)
    {
        bool _795 = _178 > 0.5;
        _785 = _795;
    }
    bool _797 = _785;
    float _799 = float(uint(_779));
    bool _801 = _507 > 0.5;
    int _803 = _771 * int(_759);
    int _805 = _803 + _715;
    float _807 = _507;
    if (!_747)
    {
        _787 = _497;
    }
    float _809 = _787;
    float _811 = as_type<float>(_250) * _799;
    float _813 = float(uint(_677));
    float _815 = float(uint(_805));
    float _817 = trunc(_811);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    bool _823 = _198 == 0;
    float _825 = as_type<float>(_250) * _813;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _829 = _827 != 0;
    float _831 = as_type<float>(_240) * _815;
    float _833 = trunc(_831);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = in.m_65.w;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _845 = _763 * int(_821);
    int _847 = _845 + _779;
    int _849 = as_type<int>(_831);
    float _851 = _809;
    if (_747)
    {
        float _853 = -_497;
        float _855 = _853 + 1.0;
        _849 = as_type<int>(_855);
    }
    int _857 = _849;
    float _859 = trunc(_825);
    float _861 = precise::max(_859, 0.0);
    uint _863 = uint(_861);
    int _865 = 0;
    if (_829)
    {
        _865 = 0;
    }
    int _867 = _865;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _871 = float(uint(_847));
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _875 = as_type<int>(_871);
    int _877 = _867;
    if (_747)
    {
        float _879 = _797 ? as_type<float>(_857) : _497;
        _851 = _879;
    }
    float _881 = _851;
    float _883 = -_519;
    float _885 = _883 + 1.0;
    int _887 = int(_759) + int(_837);
    float _889 = as_type<float>(_250) * _871;
    float _891 = _519;
    if (_775)
    {
        float _893 = -_497;
        float _895 = _893 + 1.0;
        _875 = as_type<int>(_895);
    }
    int _897 = _875;
    if (!_775)
    {
        _789 = _497;
    }
    float _899 = _789;
    float _901 = trunc(_889);
    float _903 = precise::max(_901, 0.0);
    uint _905 = uint(_903);
    float _907 = _899;
    if (!_829)
    {
        _877 = 2;
    }
    int _909 = _877;
    int _911 = _783 * _887;
    int _913 = _911 + _715;
    if (_775)
    {
        float _915 = _801 ? as_type<float>(_897) : _497;
        _907 = _915;
    }
    float _917 = _907;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _921 = _184 > 0.5;
    float _923 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _873);
    bool _925 = uint(_913) >= uint(_198);
    float _927 = float(uint(_651));
    bool _929 = !_925;
    int _931 = _929 ? 0 : (-1);
    int _933 = ~_214;
    int _935 = _933 + 1;
    float _937 = as_type<float>(_240) * _927;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    int _943 = int(_821) + int(_905);
    int _945 = _921 ? as_type<int>(_885) : as_type<int>(_519);
    float _947 = trunc(_937);
    float _949 = precise::max(_947, 0.0);
    uint _951 = uint(_949);
    bool _953 = _839 > 0.5;
    int _955 = _935 * _943;
    int _957 = _955 + _779;
    float _959 = _941 ? as_type<float>(_945) : _519;
    int _961 = _953 ? as_type<int>(_885) : as_type<int>(_519);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _965 = _963 != 0;
    bool _967 = uint(_957) >= uint(_214);
    float _969 = _965 ? as_type<float>(_961) : _519;
    float _971 = in.m_71.x;
    float _973 = in.m_71.y;
    float _975 = in.m_71.z;
    int _977 = ~_198;
    int _979 = _977 + 1;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _983 = _981 != 0;
    bool _985 = !_967;
    int _987 = _985 ? 0 : (-1);
    int _989 = _979 * int(_951);
    int _991 = _989 + _651;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _995 = _993 != 0;
    int _997 = ~_887;
    int _999 = _997 + _931;
    int _1001 = _999 + 1;
    int _1003 = ~_943;
    int _1005 = _1003 + _987;
    int _1007 = _1005 + 1;
    float _1009 = float(uint(_991));
    int _1011 = _198 * _1001;
    int _1013 = _1011 + _715;
    int _1015 = ~_214;
    int _1017 = _1015 + 1;
    int _1019 = _214 * _1007;
    int _1021 = _1019 + _779;
    int _1023 = 0;
    if (_983)
    {
        float _1025 = -_497;
        float _1027 = _1025 + 1.0;
        _1023 = as_type<int>(_1027);
    }
    int _1029 = _1023;
    float _1031 = as_type<float>(_240) * _1009;
    bool _1033 = !_823;
    int _1035 = _1033 ? _1013 : (-1);
    float _1037 = in.m_69.x;
    float _1039 = in.m_69.y;
    float _1041 = in.m_69.z;
    bool _1043 = !_679;
    int _1045 = _1043 ? _1021 : (-1);
    int _1047 = _1017 * int(_863);
    int _1049 = _1047 + _677;
    if (_995)
    {
        float _1051 = _801 ? _885 : _519;
        _891 = _1051;
    }
    float _1053 = _891;
    float _1055 = in.m_73.x;
    float _1057 = in.m_73.y;
    float _1059 = in.m_73.z;
    if (_983)
    {
        float _1061 = _921 ? as_type<float>(_1029) : _497;
        _791 = _1061;
    }
    float _1063 = _791;
    int _1065 = _1035 & 3;
    bool _1067 = _1065 != 0;
    float _1069 = trunc(_1031);
    float _1071 = precise::max(_1069, 0.0);
    uint _1073 = uint(_1071);
    int _1075 = _1045 & 3;
    bool _1077 = _1075 != 0;
    bool _1079 = _973 != 0.0;
    bool _1081 = isnan(_973);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    int _1089 = _1035 & 3;
    bool _1091 = _1089 != 0;
    int _1093 = _1067 ? 0 : 1;
    int _1095 = _1077 ? 0 : 1;
    bool _1097 = uint(_1089) > 1u;
    bool _1099 = uint(_1075) > 1u;
    bool _1101 = _971 == 0.0;
    bool _1103 = !_1087;
    bool _1105 = _1101 && _1103;
    float _1107 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1109 = float(uint(_1049));
    bool _1111 = _975 == 0.0;
    bool _1113 = _1111 && _1105;
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1117 = ~_1093;
    int _1119 = _1117 + 1;
    int _1121 = _1119 + 1;
    float _1123 = as_type<float>(_250) * _1109;
    int _1125 = ~_1095;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    float _1131 = trunc(_1123);
    float _1133 = precise::max(_1131, 0.0);
    uint _1135 = uint(_1133);
    int _1137 = _1121;
    int _1139 = _1129;
    if (!_1097)
    {
        int _1141 = ~_1093;
        int _1143 = _1141 + 1;
        _1137 = _1143;
    }
    int _1145 = _1137;
    float _1147 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (!_1099)
    {
        int _1149 = ~_1095;
        int _1151 = _1149 + 1;
        _1139 = _1151;
    }
    int _1153 = _1139;
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _971);
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1159 = _1157 != 0;
    float _1161 = _1055;
    float _1163 = _1057;
    float _1165 = _1059;
    if (!_1113)
    {
        float _1167 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1055);
        _1161 = _1167;
    }
    float _1169 = _1161;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1173 = _1171 != 0;
    float _1175 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1177 = ~_198;
    int _1179 = _1177 + 1;
    float _1181 = _1169;
    if (!_1113)
    {
        float _1183 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1057);
        _1163 = _1183;
    }
    float _1185 = _1163;
    float _1187 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _973);
    if (!_1113)
    {
        float _1189 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1059);
        _1165 = _1189;
    }
    float _1191 = _1165;
    float _1193 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _975);
    int _1195 = int(_951) + int(_1073);
    float _1197 = in.m_63.x;
    float _1199 = in.m_63.y;
    float _1201 = in.m_63.z;
    float _1203 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1205 = int(_863) + int(_1135);
    float _1207 = in.m_58.x;
    float _1209 = in.m_58.y;
    float _1211 = in.m_58.z;
    int _1213 = ~_214;
    int _1215 = _1213 + 1;
    int _1217 = _1179 * _1195;
    int _1219 = _1217 + _651;
    float _1221 = fma(_1203, -2.0, _843);
    int _1223 = 0;
    if (_829)
    {
        _1223 = 0;
    }
    int _1225 = _1223;
    float _1227 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1229 = _1215 * _1205;
    int _1231 = _1229 + _677;
    bool _1233 = uint(_1219) >= uint(_198);
    float _1235 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1237 = _1225;
    if (!_829)
    {
        _1237 = 1;
    }
    int _1239 = _1237;
    float _1241 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1243 = -_841;
    float _1245 = fma(_1235, 2.0, _1243);
    bool _1247 = !_1233;
    int _1249 = _1247 ? 0 : (-1);
    float _1251 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1221);
    bool _1253 = uint(_1231) >= uint(_214);
    float _1255 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _1257 = _1239 != 1;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1261 = !_1253;
    int _1263 = _1261 ? 0 : (-1);
    float _1265 = fma(_469, _1199, _1255);
    float _1267 = _445 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1269 = fma(_469, _1201, _499);
    bool _1271 = uint(_1089) >= 2u;
    float _1273 = fma(_1265, _539, _1209);
    float _1275 = fma(_469, _1197, _1267);
    float _1277 = fma(_1269, _539, _1211);
    float _1279 = _643 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1281 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1283 = fma(_1275, _539, _1207);
    float _1285 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1287 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1289 = fma(_1279, _1053, -0.5);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1281);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1285);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1287);
    int _1297 = _1271 ? 0 : 1;
    float _1299 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1291);
    float _1301 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1293);
    float _1303 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1295);
    bool _1305 = _909 != 2;
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = _1301 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1317 = _1307 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1321 = _1309 + _1319;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1325 = _1311 + _1323;
    float _1327 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1329 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1331 = _1321 * _1321;
    float _1333 = _1185 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1335 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1327);
    float _1337 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1329);
    float _1339 = fma(_1317, _1317, _1331);
    float _1341 = fma(_1169, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1333);
    float _1343 = _1339;
    if (_1305)
    {
        _1181 = _178;
    }
    float _1345 = _1181;
    float _1347 = -_152;
    float _1349 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1245);
    float _1351 = fma(_1325, _1325, _1339);
    float _1353 = _1345;
    if (!_1305)
    {
        _1353 = _507;
    }
    float _1355 = _1353;
    float _1357 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1257)
    {
        _1343 = _184;
    }
    float _1359 = _1343;
    float _1361 = rsqrt(_1351);
    float _1363 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1365 = fma(_1357, _1063, -0.5);
    float _1367 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1369 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1337);
    float _1371 = -_869;
    float _1373 = fma(_1363, 2.0, _1371);
    float _1375 = fma(_1191, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1341);
    float _1377 = _1359;
    if (!_1257)
    {
        _793 = _1359;
    }
    float _1379 = _793;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1383 = _1379;
    if (_1257)
    {
        _1377 = _178;
    }
    float _1385 = _1377;
    float _1387 = -_152;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1373);
    float _1391 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1381);
    float _1393 = 0.0;
    if (!_1257)
    {
        _1393 = _507;
    }
    float _1395 = _1393;
    float _1397 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1259);
    float _1399 = _1321 * _1361;
    float _1401 = _1317 * _1361;
    float _1403 = _1325 * _1361;
    float _1405 = _1395;
    if (_1257)
    {
        _1405 = _184;
    }
    float _1407 = _1405;
    float _1409 = -_1399;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1415 = _1035 >> 31;
    float _1417 = -_1401;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1317);
    float _1421 = _1411 * _1411;
    float _1423 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1413);
    int _1425 = _1045 >> 31;
    float _1427 = -_1403;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1325);
    int _1431 = _1415 & 3;
    float _1433 = fma(_1419, _1419, _1421);
    int _1435 = _1425 & 3;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1439 = _1035 + _1431;
    float _1441 = fma(_1429, _1429, _1433);
    int _1443 = _1045 + _1435;
    float _1445 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[83].w, _919);
    int _1447 = _1439 >> 2;
    float _1449 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _923);
    int _1451 = _1443 >> 2;
    float _1453 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1437);
    int _1455 = _1447 << 4;
    int _1457 = _1455 + 368;
    float _1459 = sqrt(_1441);
    int _1461 = _1451 << 4;
    int _1463 = _1461 + 512;
    float _1465 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1397);
    uint _1467 = uint(int(uint(_1457) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[int(_1477)][_1479];
    if (_1257)
    {
        _807 = _184;
    }
    float _1483 = _807;
    float _1485 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1391);
    if (_1257)
    {
        _1383 = _178;
    }
    float _1487 = _1383;
    float _1489 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1423);
    if (!_1305)
    {
        _315 = _178;
    }
    float _1491 = _315;
    float _1493 = fma(_1449, _1365, _1389);
    int _1495 = ~_1195;
    int _1497 = _1495 + _1249;
    int _1499 = _1497 + 1;
    uint _1501 = uint(int(uint(_1463) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[int(_1511)][_1513];
    bool _1517 = uint(_1075) >= 2u;
    float _1519 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1521 = _1089 != 3;
    int _1523 = _198 * _1499;
    int _1525 = _1523 + _651;
    int _1527 = _1517 ? 0 : 1;
    float _1529 = _1361 * _1459;
    bool _1531 = _1075 != 3;
    int _1533 = _1457 + 8;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    uint _1537 = uint(int(uint(int(_1535)) >> uint(2)));
    int _1539 = int(_1535) & 3;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[int(_1537)][_1539];
    int _1543 = int(_1535) + 1;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    int _1547 = _1543 & 3;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[int(_1545)][_1547];
    int _1551 = ~_1205;
    int _1553 = _1551 + _1263;
    int _1555 = _1553 + 1;
    float _1557 = _1227 * _1529;
    int _1559 = abs(_1153);
    float _1561 = _1115 * _1529;
    int _1563 = ~_1297;
    int _1565 = _1563 + 1;
    int _1567 = _1565 + 1;
    int _1569 = _214 * _1555;
    int _1571 = _1569 + _677;
    int _1573 = ~_1527;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    int _1579 = _1463 + 8;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[int(_1591)][_1593];
    int _1597 = abs(_1145);
    float _1599 = _1241 * _1529;
    int _1601 = _1567;
    int _1603 = _1577;
    if (_1521)
    {
        int _1605 = ~_1297;
        int _1607 = _1605 + 1;
        _1601 = _1607;
    }
    int _1609 = _1601;
    float _1611 = _1557 * _1155;
    if (_1531)
    {
        int _1613 = ~_1527;
        int _1615 = _1613 + 1;
        _1603 = _1615;
    }
    int _1617 = _1603;
    float _1619 = _1599 * _1193;
    float _1621 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1623 = !_1091;
    int _1625 = _1623 ? 0 : 1;
    float _1627 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1629 = ~_1559;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    float _1635 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1445);
    int _1637 = _1045 & 3;
    bool _1639 = _1637 != 0;
    int _1641 = abs(_1625);
    int _1643 = ~_1597;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    bool _1649 = _1089 != 3;
    bool _1651 = !_1639;
    int _1653 = _1651 ? 0 : 1;
    int _1655 = abs(_1609);
    int _1657 = _1647 * as_type<int>(_1481);
    int _1659 = abs(_1653);
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1663 = int(_1661);
    bool _1665 = !_679;
    int _1667 = _1665 ? _1571 : (-1);
    int _1669 = _1633 * as_type<int>(_1515);
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1673 = !_1649;
    int _1675 = _1673 ? 0 : (-1);
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1679 = ~_1641;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = -_1671;
    float _1687 = fma(_1519, 2.0, _1685);
    int _1689 = abs(_1617);
    float _1691 = fma(_1621, -2.0, _1677);
    int _1693 = abs(_1675);
    int _1695 = _1683 * as_type<int>(_1473);
    int _1697 = _1695 + _1657;
    float _1699 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1701 = int(_1699);
    int _1703 = ~_1659;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    float _1709 = -_152;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1687);
    int _1713 = ~_1655;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    int _1719 = _1707 * as_type<int>(_1507);
    int _1721 = _1719 + _1669;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = _1717 * as_type<int>(_1541);
    int _1731 = _1729 + _1697;
    bool _1733 = _1075 != 3;
    float _1735 = _1561 * _1187;
    int _1737 = ~_1689;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    int _1743 = _1727 * as_type<int>(_1549);
    int _1745 = _1743 + _1731;
    bool _1747 = !_1733;
    int _1749 = _1747 ? 0 : (-1);
    float _1751 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1753 = !_1159;
    int _1755 = _1753 ? 0 : 1;
    int _1757 = _1741 * as_type<int>(_1587);
    int _1759 = _1757 + _1721;
    int _1761 = abs(_1749);
    float _1763 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1751);
    int _1765 = abs(_1663);
    int _1767 = ~_1761;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1763);
    int _1775 = abs(_1755);
    float _1777 = float(uint(_1663));
    int _1779 = _1771 * as_type<int>(_1595);
    int _1781 = _1779 + _1759;
    float _1783 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1785 = !_1173;
    int _1787 = _1785 ? 0 : 1;
    float _1789 = _1309 + _1773;
    float _1791 = float(uint(_1765));
    float _1793 = 1.0 / _1777;
    int _1795 = abs(_1787);
    float _1797 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1783);
    float _1799 = float(uint(_1701));
    int _1801 = ~_1775;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    float _1807 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1797);
    int _1809 = ~_1795;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = 1.0 / _1791;
    int _1817 = ~_1701;
    int _1819 = _1817 + 1;
    int _1821 = _1745 * _1805;
    bool _1823 = !_823;
    int _1825 = _1823 ? _1525 : (-1);
    int _1827 = _1813 * _1781;
    int _1829 = abs(_1701);
    float _1831 = _1307 + _1807;
    int _1833 = ~_1765;
    int _1835 = _1833 + 1;
    float _1837 = 1.0 / _1799;
    int _1839 = _1825 * _1775;
    int _1841 = _1839 + _1821;
    int _1843 = as_type<int>(_1793) + (-2);
    int _1845 = _1667 * _1795;
    int _1847 = _1845 + _1827;
    float _1849 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1851 = float(uint(_1841));
    int _1853 = as_type<int>(_1815) + (-2);
    float _1855 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1849);
    float _1857 = float(uint(_1829));
    float _1859 = as_type<float>(_1843) * _1851;
    float _1861 = float(uint(_1847));
    float _1863 = fma(_1619, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1855);
    float _1865 = 1.0 / _1857;
    int _1867 = abs(_1841);
    int _1869 = as_type<int>(_1837) + (-2);
    float _1871 = _1311 + _1863;
    int _1873 = abs(_1847);
    float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1877 = _1831 + _1875;
    int _1879 = ~_1663;
    int _1881 = _1879 + 1;
    float _1883 = trunc(_1859);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = as_type<float>(_1869) * _1861;
    float _1891 = _1877 * _1877;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1895 = _1871 + _1893;
    float _1897 = float(uint(_1867));
    float _1899 = trunc(_1889);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    int _1905 = as_type<int>(_1865) + (-2);
    float _1907 = _1895 * _1895;
    float _1909 = float(uint(_1873));
    float _1911 = as_type<float>(_1853) * _1897;
    float _1913 = _1891 + _1907;
    float _1915 = as_type<float>(_1905) * _1909;
    int _1917 = _1881 * int(_1887);
    int _1919 = _1917 + _1841;
    float _1921 = trunc(_1911);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    float _1927 = float(uint(_1919));
    int _1929 = _1819 * int(_1903);
    int _1931 = _1929 + _1847;
    float _1933 = trunc(_1915);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    float _1939 = as_type<float>(_1843) * _1927;
    int _1941 = ~_1829;
    int _1943 = _1941 + 1;
    float _1945 = float(uint(_1931));
    float _1947 = sqrt(_1913);
    float _1949 = as_type<float>(_1869) * _1945;
    int _1951 = _1835 * int(_1925);
    int _1953 = _1951 + _1867;
    float _1955 = trunc(_1939);
    float _1957 = precise::max(_1955, 0.0);
    uint _1959 = uint(_1957);
    int _1961 = _1943 * int(_1937);
    int _1963 = _1961 + _1873;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1967 = float(uint(_1953));
    float _1969 = float(uint(_1963));
    float _1971 = fma(_1627, -2.0, _1965);
    bool _1973 = _1947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = as_type<float>(_1853) * _1967;
    float _1977 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1453);
    float _1979 = as_type<float>(_1905) * _1969;
    float _1981 = trunc(_1949);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    float _1987 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1691);
    float _1989 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1971);
    float _1991 = -_1987;
    float _1993 = fma(_1977, _1289, _1991);
    float _1995 = trunc(_1975);
    float _1997 = precise::max(_1995, 0.0);
    uint _1999 = uint(_1997);
    float _2001 = _1891;
    float _2003 = _1907;
    float _2005 = _1831;
    float _2007 = _1871;
    float _2009 = _1979;
    if (!_1973)
    {
        _156 = _1891;
    }
    float _2011 = _156;
    float _2013 = _2011;
    if (!_1973)
    {
        _2001 = _1789;
    }
    float _2015 = _2001;
    float _2017 = trunc(_1979);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    bool _2023 = !_1973;
    float _2025 = _2015;
    float _2027 = as_type<float>(_2021);
    if (!_2023)
    {
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2033 = _1947 + _2031;
        float _2035 = rsqrt(_1913);
        float _2037 = _2033 * _2029;
        float _2039 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2041 = _2037 * 0.15915493667125701904296875;
        float _2043 = _2041 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = fma(_2045, _2039, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = _2035 * _2051;
        float _2055 = _2049 + (-1.0);
        float _2057 = fma(_1877, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1895, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2061 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2065 = _2057 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2069 = _2059 + _2067;
        float _2071 = fma(_1789, _2049, _2061);
        float _2073 = _2065 * _2065;
        float _2075 = _2069 * _2069;
        _2025 = _2071;
        _2013 = _2073;
        _2003 = _2075;
        _2005 = _2057;
        _2007 = _2059;
    }
    float _2077 = _2025;
    float _2079 = _2013;
    float _2081 = _2003;
    float _2083 = _2005;
    float _2085 = _2007;
    int _2087 = ~_1663;
    int _2089 = _2087 + 1;
    out.m_75.x = _1367;
    out.m_75.y = _1369;
    out.m_75.z = _1375;
    int _2091 = int(_1903) + int(_1985);
    int _2093 = ~_1701;
    int _2095 = _2093 + 1;
    int _2097 = int(_1937) + int(_2021);
    int _2099 = int(_1887) + int(_1959);
    int _2101 = _2095 * _2091;
    int _2103 = _2101 + _1847;
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2107 = _2077 + _2105;
    int _2109 = int(_1925) + int(_1999);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2113 = ~_1765;
    int _2115 = _2113 + 1;
    int _2117 = _2089 * _2099;
    int _2119 = _2117 + _1841;
    int _2121 = ~_1829;
    int _2123 = _2121 + 1;
    float _2125 = fma(_2107, _2107, _2079);
    bool _2127 = uint(_2103) >= uint(_1701);
    int _2129 = _2115 * _2109;
    int _2131 = _2129 + _1867;
    bool _2133 = uint(_2119) >= uint(_1663);
    int _2135 = _2123 * _2097;
    int _2137 = _2135 + _1873;
    bool _2139 = !_2127;
    int _2141 = _2139 ? 0 : (-1);
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2145 = !_2133;
    int _2147 = _2145 ? 0 : (-1);
    float _2149 = _2125 + _2081;
    bool _2151 = uint(_2137) >= uint(_1829);
    int _2153 = ~_2099;
    int _2155 = _2153 + _2147;
    int _2157 = _2155 + 1;
    bool _2159 = !_2151;
    int _2161 = _2159 ? 0 : (-1);
    float _2163 = sqrt(_2149);
    int _2165 = ~_2091;
    int _2167 = _2165 + _2141;
    int _2169 = _2167 + 1;
    bool _2171 = _1663 == 0;
    bool _2173 = _1663 == 0;
    int _2175 = _1841 ^ _1663;
    int _2177 = _1663 * _2157;
    int _2179 = _2177 + _1841;
    int _2181 = ~_2161;
    int _2183 = _2097 + _2181;
    int _2185 = _2183 + 1;
    float _2187 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2189 = uint(_2131) >= uint(_1765);
    float _2191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2193 = _1847 ^ _1701;
    float _2195 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2197 = !_2189;
    int _2199 = _2197 ? 0 : (-1);
    uint _2201 = uint(int(uint(_2175) >> uint(31)));
    uint _2203 = uint(int(uint(_2193) >> uint(31)));
    float _2205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2207 = !_2171;
    int _2209 = _2207 ? _2179 : (-1);
    int _2211 = ~_2199;
    int _2213 = _2109 + _2211;
    int _2215 = _2213 + 1;
    int _2217 = ~int(_2201);
    int _2219 = _2217 + 1;
    int _2221 = ~int(_2203);
    int _2223 = _2221 + 1;
    float _2225 = float(_2209);
    int _2227 = _1701 * _2169;
    int _2229 = _2227 + _1847;
    bool _2231 = _1701 == 0;
    int _2233 = _2215 ^ _2219;
    float _2235 = fma(_2187, _2225, _1349);
    int _2237 = _2185 ^ _2223;
    float _2239 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2241 = _1701 == 0;
    float _2243 = fma(_2187, _881, -0.5);
    bool _2245 = !_2231;
    int _2247 = _2245 ? _2229 : (-1);
    float _2249 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2251 = ~_2219;
    int _2253 = _2251 + _2233;
    int _2255 = _2253 + 1;
    float _2257 = fma(_2239, _917, -0.5);
    int _2259 = ~_2223;
    int _2261 = _2259 + _2237;
    int _2263 = _2261 + 1;
    float _2265 = fma(_969, _2249, -0.5);
    float _2267 = float(_2247);
    float _2269 = fma(_1465, _2243, _2235);
    bool _2271 = !_2173;
    int _2273 = _2271 ? _2255 : (-1);
    bool _2275 = !_2241;
    int _2277 = _2275 ? _2263 : (-1);
    float _2279 = fma(_2239, _2267, _1711);
    float _2281 = float(_2273);
    float _2283 = fma(_959, _2195, -0.5);
    float _2285 = float(_2277);
    float _2287 = fma(_1489, _2257, _2279);
    float _2289 = -_1251;
    float _2291 = fma(_2195, _2281, _2289);
    float _2293 = -_1989;
    float _2295 = fma(_2249, _2285, _2293);
    float _2297 = fma(_1485, _2283, _2291);
    float _2299 = fma(_1635, _2265, _2295);
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2305 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2307 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2311 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2315 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2317 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2319 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2321 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2323 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2325 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2327 = _2311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2329 = _1493 + 0.5;
    float _2331 = _1993 + 0.5;
    float _2333 = _2269 + 0.5;
    float _2335 = _2287 + 0.5;
    float _2337 = _2297 + 0.5;
    float _2339 = _2299 + 0.5;
    out.m_77.x = _2317;
    out.m_77.y = _2319;
    out.m_77.z = _2321;
    out.m_77.w = _2313;
    bool _2341 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2343 = isnan(_2163);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2349 = _2345 || _2347;
    out.m_79.x = _2323;
    out.m_79.y = _2325;
    out.m_79.z = _2327;
    out.m_79.w = _2315;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    out.m_83.x = _2329;
    out.m_83.y = _2331;
    float _2351 = _2281;
    float _2353 = as_type<float>(_2123);
    if (!_2349)
    {
        _2351 = 1.0;
    }
    float _2355 = _2351;
    out.m_85.x = _2333;
    out.m_85.y = _2337;
    out.m_85.z = _2335;
    out.m_85.w = _2339;
    bool _2357 = !_2349;
    float _2359 = _2355;
    if (!_2357)
    {
        bool _2361 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2363 = isnan(_2163);
        bool _2365 = _2361 || _2363;
        bool _2367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2369 = _2365 || _2367;
        if (!_2369)
        {
            float _2371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2373 = _2163 + _2371;
            float _2375 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2377 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2381 = _2379 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2383 = 1.0 / _2377;
            float _2385 = _2373 * _2383;
            float _2387 = fma(_2385, _2381, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2359 = _2387;
            _2389 = true;
        }
        else
        {
            bool _2391 = _2163 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2393 = isnan(_2163);
            bool _2395 = _2391 || _2393;
            bool _2397 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2399 = _2395 || _2397;
            if (!_2399)
            {
                float _2401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2403 = _2163 + _2401;
                float _2405 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2407 = _2405 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2409 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2411 = _2409 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2413 = 1.0 / _2407;
                float _2415 = _2403 * _2413;
                float _2417 = fma(_2415, _2411, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2359 = _2417;
                _2389 = true;
            }
            else
            {
                _2359 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2389 = false;
    float _2419 = _2359;
    float _2421 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2423 = _2077 + _2421;
    float _2425 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2427 = _2083 + _2425;
    float _2429 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2431 = _2085 + _2429;
    float _2433 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2435 = fma(_2423, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2437 = fma(_2427, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2439 = fma(_2431, _2419, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2441 = -_1399;
    float _2443 = fma(_2441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2435);
    float _2445 = -_1401;
    float _2447 = fma(_2445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2437);
    float _2449 = -_1403;
    float _2451 = fma(_2449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2439);
    float _2453 = -_1399;
    float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2459 = _2443 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2463 = _2447 + _2461;
    float _2465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2467 = _2451 + _2465;
    float _2469 = -_1401;
    float _2471 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _2473 = _2459 * _2459;
    float _2475 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2477 = -_1403;
    float _2479 = fma(_2477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1311);
    float _2481 = fma(_2463, _2463, _2473);
    float _2483 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2475);
    float _2485 = fma(_2467, _2467, _2481);
    float _2487 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2483);
    float _2489 = _2455 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2491 = rsqrt(_2485);
    float _2493 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2495 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2489);
    float _2497 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2495);
    float _2499 = 1.0 / _2493;
    float _2501 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2503 = _2501 + _2493;
    float _2505 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2507 = sqrt(_2485);
    float _2509 = _2463 * _2505;
    float _2511 = _2467 * _2505;
    float _2513 = _2509 * _2509;
    float _2515 = _2511 * _2511;
    float _2517 = _2503 * _2499;
    float _2519 = _2517 * 0.5;
    float _2521 = _2455 + _2433;
    float _2523 = _2513 + _2515;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2527 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2525);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2531 = sqrt(_2523);
    float _2533 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2535 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2529);
    float _2537 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2535);
    float _2539 = precise::max(0.0, _2533);
    float _2541 = 1.0 / _2527;
    float _2543 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2545 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2547 = -_2505;
    float _2549 = -_2539;
    float _2551 = fma(_2459, _2547, _2549);
    float _2553 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2555 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2545);
    bool _2557 = _2531 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2559 = trunc(_2543);
    int _2561 = int(_2559);
    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2565 = _2531 + _2563;
    float _2567 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2555);
    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = _2541 * _2571;
    float _2575 = trunc(_2569);
    int _2577 = int(_2575);
    bool _2579 = _2573 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2581 = fma(_2471, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _2583 = _2573 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2585 = !_2579;
    int _2587 = _2585 ? 0 : 1;
    float _2589 = _2163;
    int _2591 = 2;
    float _2593 = _2523;
    float _2595 = _2565;
    float _2597 = _2553;
    int _2599 = as_type<int>(_2455);
    float _2601 = _2509;
    float _2603 = _2511;
    float _2605 = _2551;
    float _2607 = _2463;
    if (_2557)
    {
        float _2609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2589 = _2609;
    }
    float _2611 = _2589;
    int _2613 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2615 = _2561 + _2613;
    int _2617 = _2615 + 1;
    if (!_2579)
    {
        _2591 = 1;
    }
    int _2619 = _2591;
    int _2621 = _2619;
    if (_2557)
    {
        float _2623 = rsqrt(_2523);
        _2593 = _2623;
    }
    float _2625 = _2593;
    int _2627 = as_type<int>(_2625);
    if (!_2583)
    {
        _2621 = _2587;
    }
    int _2629 = _2621;
    float _2631 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2633 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2635 = _2577 + _2633;
    int _2637 = _2635 + 1;
    int _2639 = _2629 << 6;
    float _2641 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2631);
    bool _2643 = _2617 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2645 = as_type<float>(_2639);
    if (_2557)
    {
        float _2647 = _2565 * _2611;
        _2595 = _2647;
    }
    float _2649 = _2595;
    int _2651 = _2639 + 48;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c15)._m0[int(_2663)][_2665];
    float _2669 = floor(_2581);
    float _2671 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2641);
    float _2673 = _2671;
    if (_2557)
    {
        float _2675 = _2649 * 0.15915493667125701904296875;
        _2353 = _2675;
    }
    float _2677 = _2353;
    int _2679 = _2617 | _2637;
    float _2681 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2683 = as_type<float>(_2679);
    if (_2557)
    {
        float _2685 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2673 = _2685;
    }
    float _2687 = _2673;
    int _2689 = _2639 + 96;
    uint _2691 = uint(int(uint(_2689) >> uint(2)));
    uint _2693 = uint(int(uint(int(_2691)) >> uint(2)));
    int _2695 = int(_2691) & 3;
    float _2697 = (*spvDescriptorSet0.vp_c15)._m0[int(_2693)][_2695];
    int _2699 = int(_2691) + 1;
    uint _2701 = uint(int(uint(_2699) >> uint(2)));
    int _2703 = _2699 & 3;
    float _2705 = (*spvDescriptorSet0.vp_c15)._m0[int(_2701)][_2703];
    int _2707 = _2131;
    if (_2557)
    {
        float _2709 = _2677 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        _2707 = as_type<int>(_2711);
    }
    int _2713 = _2707;
    bool _2715 = _2679 < 0;
    bool _2717 = _2715 || _2643;
    float _2719 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2721 = _2637 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2723 = _2721 || _2717;
    float _2725 = -_2719;
    float _2727 = fma(_2725, _2553, 1.0);
    int _2729 = _2639 + 104;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    uint _2733 = uint(int(uint(int(_2731)) >> uint(2)));
    int _2735 = int(_2731) & 3;
    float _2737 = (*spvDescriptorSet0.vp_c15)._m0[int(_2733)][_2735];
    int _2739 = int(_2731) + 1;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    int _2743 = _2739 & 3;
    float _2745 = (*spvDescriptorSet0.vp_c15)._m0[int(_2741)][_2743];
    float _2747 = _2677;
    if (_2557)
    {
        float _2749 = _2677 * 6.283185482025146484375;
        float _2751 = cos(_2749);
        _2747 = _2751;
    }
    float _2753 = _2747;
    float _2755 = -_2669;
    float _2757 = _2581 + _2755;
    int _2759 = _2639 + 64;
    uint _2761 = uint(int(uint(_2759) >> uint(2)));
    uint _2763 = uint(int(uint(int(_2761)) >> uint(2)));
    int _2765 = int(_2761) & 3;
    float _2767 = (*spvDescriptorSet0.vp_c15)._m0[int(_2763)][_2765];
    int _2769 = int(_2761) + 1;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    int _2773 = _2769 & 3;
    float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
    int _2777 = _2713;
    if (_2557)
    {
        float _2779 = fma(as_type<float>(_2713), _2687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2683 = _2779;
    }
    float _2781 = _2683;
    if (!_2723)
    {
        int _2783 = _2637 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2785 = _2783 + _2617;
        _2777 = _2785;
    }
    int _2787 = _2777;
    if (_2557)
    {
        float _2789 = _2625 * _2781;
        _2027 = _2789;
    }
    float _2791 = _2027;
    float _2793 = _2791;
    if (!_2723)
    {
        int _2795 = _2787 << 2;
        _2627 = _2795;
    }
    int _2797 = _2627;
    int _2799 = _2639 + 56;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c15)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c15)._m0[int(_2811)][_2813];
    int _2817 = _2797;
    if (_2557)
    {
        float _2819 = _2753 + (-1.0);
        _2597 = _2819;
    }
    float _2821 = _2597;
    if (!_2723)
    {
        uint _2823 = uint(int(uint(_2787) >> uint(2)));
        _2599 = int(_2823);
    }
    int _2825 = _2599;
    float _2827 = as_type<float>(_2825);
    if (_2557)
    {
        float _2829 = _2509 * _2791;
        _2601 = _2829;
    }
    float _2831 = _2601;
    if (!_2723)
    {
        int _2833 = 12 & _2797;
        _2817 = _2833;
    }
    int _2835 = _2817;
    if (_2557)
    {
        float _2837 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2009 = _2837;
    }
    float _2839 = _2009;
    float _2841 = _2839;
    if (_2557)
    {
        float _2843 = _2511 * _2791;
        _2603 = _2843;
    }
    float _2845 = _2603;
    if (!_2557)
    {
        _2793 = _2515;
    }
    float _2847 = _2793;
    float _2849 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2851 = _2847;
    if (!_2723)
    {
        int _2853 = _2825 << 4;
        int _2855 = _2853 + _2835;
        _2827 = as_type<float>(_2855);
    }
    float _2857 = _2827;
    if (_2557)
    {
        float _2859 = fma(_2551, _2753, _2839);
        _2605 = _2859;
    }
    float _2861 = _2605;
    int _2863 = _2639 + 72;
    uint _2865 = uint(int(uint(_2863) >> uint(2)));
    uint _2867 = uint(int(uint(int(_2865)) >> uint(2)));
    int _2869 = int(_2865) & 3;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[int(_2867)][_2869];
    int _2873 = int(_2865) + 1;
    uint _2875 = uint(int(uint(_2873) >> uint(2)));
    int _2877 = _2873 & 3;
    float _2879 = (*spvDescriptorSet0.vp_c15)._m0[int(_2875)][_2877];
    if (!_2557)
    {
        _2841 = _2513;
    }
    float _2881 = _2841;
    float _2883 = _2881;
    if (_2557)
    {
        float _2885 = _2831 * _2831;
        _2883 = _2885;
    }
    float _2887 = _2883;
    float _2889 = log2(_2727);
    float _2891 = _2521 * _2667;
    if (_2557)
    {
        float _2893 = _2845 * _2845;
        _2851 = _2893;
    }
    float _2895 = _2851;
    float _2897 = fma(_2861, _2861, _2887);
    float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2901 = fma(_2507, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2899);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    int _2905 = _2639 + 80;
    uint _2907 = uint(int(uint(_2905) >> uint(2)));
    uint _2909 = uint(int(uint(int(_2907)) >> uint(2)));
    int _2911 = int(_2907) & 3;
    float _2913 = (*spvDescriptorSet0.vp_c15)._m0[int(_2909)][_2911];
    int _2915 = int(_2907) + 1;
    uint _2917 = uint(int(uint(_2915) >> uint(2)));
    int _2919 = _2915 & 3;
    float _2921 = (*spvDescriptorSet0.vp_c15)._m0[int(_2917)][_2919];
    float _2923 = fma(_2471, _2659, _2891);
    float _2925 = floor(_2849);
    float _2927 = _2521 * _2705;
    float _2929 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2931 = -_2903;
    float _2933 = _2931 + 1.0;
    float _2935 = fma(_2471, _2697, _2927);
    float _2937 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2939 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2929);
    int _2941 = _2639 + 88;
    uint _2943 = uint(int(uint(_2941) >> uint(2)));
    uint _2945 = uint(int(uint(int(_2943)) >> uint(2)));
    int _2947 = int(_2943) & 3;
    float _2949 = (*spvDescriptorSet0.vp_c15)._m0[int(_2945)][_2947];
    int _2951 = int(_2943) + 1;
    uint _2953 = uint(int(uint(_2951) >> uint(2)));
    int _2955 = _2951 & 3;
    float _2957 = (*spvDescriptorSet0.vp_c15)._m0[int(_2953)][_2955];
    float _2959 = fma(_2479, _2737, _2935);
    float _2961 = _2897 + _2895;
    float _2963 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2937);
    float _2965 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2967 = _2959 + _2745;
    float _2969 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2939);
    float _2971 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2963);
    float _2973 = rsqrt(_2961);
    float _2975 = _2857;
    if (!_2723)
    {
        int _2977 = as_type<int>(_2857) + 400;
        uint _2979 = uint(int(uint(_2977) >> uint(2)));
        uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
        int _2983 = int(_2979) & 3;
        float _2985 = (*spvDescriptorSet0.vp_c15)._m0[int(_2981)][_2983];
        _2975 = _2985;
    }
    float _2987 = _2975;
    float _2989 = _2969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2991 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2965);
    float _2993 = _2971 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2995 = _2521 * _2775;
    float _2997 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2999 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2991);
    float _3001 = 1.0 / _2967;
    float _3003 = fma(_2471, _2767, _2995);
    float _3005 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2997);
    float _3007 = fma(_2479, _2807, _2923);
    float _3009 = _2999 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3011 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3005);
    float _3013 = _2973 * _2831;
    float _3015 = _3007 + _2815;
    float _3017 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3011);
    float _3019 = abs(_2933);
    float _3021 = log2(_3019);
    float _3023 = _2973 * _2861;
    float _3025 = fma(_2479, _2871, _3003);
    float _3027 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3029 = _2973 * _2845;
    float _3031 = _3015 * _3001;
    float _3033 = _3025 + _2879;
    float _3035 = -_3027;
    float _3037 = fma(_3023, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3035);
    float _3039 = _2767;
    float _3041 = _2995;
    if (!_2723)
    {
        float _3043 = floor(_2569);
        _3039 = _3043;
    }
    float _3045 = _3039;
    bool _3047 = _3031 >= 0.0;
    float _3049 = _3033 * _3001;
    float _3051 = -_3029;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3037);
    float _3055 = -_2925;
    float _3057 = _2849 + _3055;
    bool _3059 = _3031 <= 1.0;
    bool _3061 = _3059 && _3047;
    float _3063 = _2521 * _2921;
    float _3065 = fma(_3053, -0.5, 0.5);
    float _3067 = fma(_3053, 0.5, 0.5);
    bool _3069 = _3049 >= 0.0;
    bool _3071 = _3069 && _3061;
    float _3073 = fma(_2471, _2913, _3063);
    float _3075 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3077 = fma(_3067, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _3079 = _3049 <= 1.0;
    bool _3081 = _3079 && _3071;
    float _3083 = fma(_2479, _2949, _3073);
    if (!_2723)
    {
        float _3085 = floor(_2543);
        _3041 = _3085;
    }
    float _3087 = _3041;
    float _3089 = _3045;
    if (!_2723)
    {
        float _3091 = -_3045;
        float _3093 = _2569 + _3091;
        _2645 = _3093;
    }
    float _3095 = _2645;
    float _3097 = fma(_3067, _3077, -0.212114393711090087890625);
    float _3099 = _3083 + _2957;
    float _3101 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3103 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3105 = fma(_3067, _3097, 1.570728778839111328125);
    float _3107 = exp2(_3075);
    float _3109 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3101);
    float _3111 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3103);
    if (_3081)
    {
        float _3113 = float(_2629);
        _3089 = _3113;
    }
    float _3115 = _3089;
    float _3117 = _3023 + 1.0;
    float _3119 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3109);
    float _3121 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3111);
    float _3123 = sqrt(_3065);
    float _3125 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3121);
    float _3127 = _3099 * _3001;
    float _3129 = 1.0 / _3017;
    float _3131 = -_3023;
    float _3133 = fma(_3107, _3117, _3131);
    float _3135 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3119);
    float _3137 = _3119;
    float _3139 = _3125;
    if (!_2723)
    {
        float _3141 = -_3087;
        float _3143 = _2543 + _3141;
        _3137 = _3143;
    }
    float _3145 = _3137;
    float _3147 = _2889 * 0.693147182464599609375;
    float _3149 = fma(_3133, 0.5, 0.5);
    float _3151 = _3101;
    if (!_2723)
    {
        float _3153 = rint(_2987);
        float _3155 = precise::max(_3153, 0.0);
        uint _3157 = uint(_3155);
        uint _3159 = clamp(_3157, 0u, 65535u);
        _3151 = as_type<float>(_3159);
    }
    float _3161 = _3151;
    float _3163 = _3123 * 0.636619746685028076171875;
    float _3165 = _3147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _8663 = float2(_2757, _3057);
    float _3167 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8663, float2(0.0), isnan(_8663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8663, float2(0.0), isnan(_8663)), level(0.0)).x;
    float _3169 = -_3105;
    float _3171 = fma(_3163, _3169, 1.0);
    float _3173 = _3115;
    if (_3081)
    {
        float _3175 = rint(_3115);
        float _3177 = precise::max(_3175, 0.0);
        uint _3179 = uint(_3177);
        uint _3181 = clamp(_3179, 0u, 65535u);
        _3173 = as_type<float>(_3181);
    }
    float _3183 = _3173;
    float _3185 = _3135 * _3129;
    float _3187 = _3125 * _3129;
    float _3189 = fma(_3185, 0.5, 0.5);
    float _3191 = fma(_3187, -0.5, 0.5);
    float _3193 = _3161;
    if (!_2723)
    {
        float3 _8710 = float3(_3145, _3095, float(as_type<int>(_3161)));
        float3 _8714 = select(_8710, float3(0.0), isnan(_8710));
        float _3195 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8714.xy, uint(rint(_8714.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8714.xy, uint(rint(_8714.z)), level(0.0)).x;
        _3193 = _3195;
    }
    float _3197 = _3193;
    float _3199 = _3049;
    if (_3081)
    {
        float3 _8729 = float3(_3031, _3049, float(as_type<int>(_3183)));
        float3 _8731 = select(_8729, float3(0.0), isnan(_8729));
        float _3201 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8731.xy, uint(rint(_8731.z)), _3127, level(0.0));
        _3199 = _3201;
    }
    float _3203 = _3199;
    float3 _8741 = float3(_3189, _3191, _3165);
    float _3205 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8741, float3(0.0), isnan(_8741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8741, float3(0.0), isnan(_8741)), level(0.0)).x;
    float3 _8750 = float3(_3189, _3191, _3165);
    float4 _3208 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8750, float3(0.0), isnan(_8750)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8750, float3(0.0), isnan(_8750)), level(0.0)).xyzw;
    float _3210 = _3208.x;
    float _3212 = _3208.y;
    float _3214 = _3208.z;
    float _3216 = _3208.w;
    float2 _8766 = float2(_3171, _3149);
    float3 _3220 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8766, float2(0.0), isnan(_8766)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8766, float2(0.0), isnan(_8766)), level(0.0)).xyz;
    float _3222 = _3220.x;
    float _3224 = _3220.y;
    float _3226 = _3220.z;
    float _3228 = abs(_2573);
    float _3230 = log2(_3228);
    float _3232 = _2989 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3234 = _3021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_87.x = _2463;
    out.m_87.y = _2459;
    out.m_87.z = _2467;
    float _3236 = fma(_2993, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3232);
    float _3238 = fma(_2681, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3236);
    float _3240 = _3017 * 0.5;
    float _3242 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3238);
    float _3244 = _3135 + _3017;
    float _3246 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3248 = _3242 + _3017;
    float _3250 = _3244 * 0.5;
    float _3252 = fma(_3125, -0.5, _3240);
    float _3254 = _3248 * 0.5;
    float _3256 = exp2(_3246);
    out.gl_Position.x = _3135;
    out.gl_Position.y = _3125;
    out.gl_Position.z = _3242;
    out.gl_Position.w = _3017;
    bool _3258 = _2573 <= 8000.0;
    bool _3260 = isnan(_2573);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan(8000.0);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    out.m_89.x = _3250;
    out.m_89.y = _3252;
    out.m_89.z = _3254;
    out.m_89.w = _3017;
    bool _3270 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3272 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan(0.5);
    bool _3278 = _3274 || _3276;
    float _3280 = exp2(_3234);
    float _3282 = fma(_3256, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3284 = precise::clamp(_3282, 0.0, 1.0);
    float _3286 = fma(_3284, -2.0, 3.0);
    float _3288 = _3284 * _3284;
    if (_3278)
    {
        _2607 = 1.0;
    }
    float _3290 = _2607;
    float _3292 = _3288 * _3286;
    float _3294 = -_3292;
    float _3296 = _3294 + 1.0;
    float _3298 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3292);
    float _3300 = _3268 * _3298;
    float _3302 = _3298;
    float _3304 = _3290;
    float _3306 = _3300;
    if (_3278)
    {
        _3302 = 1.0;
    }
    float _3308 = _3302;
    float _3310 = _3308;
    if (!_3278)
    {
        float _3312 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3314 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3316 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3314;
        float _3318 = _3312 * 0.15915493667125701904296875;
        float _3320 = _3318 * 6.283185482025146484375;
        float _3322 = cos(_3320);
        float _3324 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3326 = _3324 * 0.15915493667125701904296875;
        float _3328 = _3318 * 6.283185482025146484375;
        float _3330 = sin(_3328);
        float _3332 = 1.0 / _3322;
        float _3334 = _3326 * 6.283185482025146484375;
        float _3336 = cos(_3334);
        float _3338 = _3330 * _3332;
        float _3340 = _3326 * 6.283185482025146484375;
        float _3342 = sin(_3340);
        float _3344 = _3336 * _3338;
        float _3346 = 1.0 / _3316;
        float _3348 = 1.0 / _3344;
        float _3350 = _3342 * _3348;
        float _3352 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3354 = fma(_2573, _3350, _3352);
        float _3356 = _3354 * _3346;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        _3139 = _3354;
        _3304 = _3358;
    }
    float _3360 = _3139;
    float _3362 = _3304;
    float _3364 = _3360;
    if (!_3278)
    {
        float _3366 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3368 = _3366 * 0.15915493667125701904296875;
        float _3370 = _3368 * 6.283185482025146484375;
        float _3372 = cos(_3370);
        float _3374 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3376 = _3374 * 0.15915493667125701904296875;
        float _3378 = _3368 * 6.283185482025146484375;
        float _3380 = sin(_3378);
        float _3382 = 1.0 / _3372;
        float _3384 = _3376 * 6.283185482025146484375;
        float _3386 = cos(_3384);
        float _3388 = _3380 * _3382;
        float _3390 = _3376 * 6.283185482025146484375;
        float _3392 = sin(_3390);
        float _3394 = _3386 * _3388;
        float _3396 = 1.0 / _3394;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3400 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3398;
        float _3402 = 1.0 / _3400;
        float _3404 = _3392 * _3396;
        float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3408 = fma(_2573, _3404, _3406);
        float _3410 = _3408 * _3402;
        float _3412 = precise::clamp(_3410, 0.0, 1.0);
        float _3414 = -_3412;
        float _3416 = _3414 + 1.0;
        _3364 = _3376;
        _3310 = _3416;
    }
    float _3418 = _3364;
    float _3420 = _3310;
    float _3422 = -_3280;
    float _3424 = _3422 + 1.0;
    float _3426 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3428 = -_3167;
    float _3430 = _3428 + 1.0;
    float _3432 = _3424;
    float _3434 = _3418;
    if (!_3081)
    {
        _3306 = 1.0;
    }
    float _3436 = _3306;
    float _3438 = _3436;
    if (_3081)
    {
        bool _3440 = _3203 >= _3127;
        bool _3442 = isnan(_3203);
        bool _3444 = _3440 || _3442;
        bool _3446 = isnan(_3127);
        bool _3448 = _3444 || _3446;
        float _3450 = float(_3448);
        _3438 = _3450;
    }
    float _3452 = _3438;
    float _3454 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3456 = _3430 * _3426;
    float _3458 = precise::clamp(_3456, 0.0, 1.0);
    float _3460 = _3452;
    float _3462 = _3454;
    if (_2723)
    {
        _3432 = 1.0;
    }
    float _3464 = _3432;
    float _3466 = _3464;
    if (!_2723)
    {
        int _3468 = _2787 << 4;
        int _3470 = _3468 + 2048;
        uint _3472 = uint(int(uint(_3470) >> uint(2)));
        uint _3474 = uint(int(uint(int(_3472)) >> uint(2)));
        int _3476 = int(_3472) & 3;
        float _3478 = (*spvDescriptorSet0.vp_c15)._m0[int(_3474)][_3476];
        int _3480 = int(_3472) + 1;
        uint _3482 = uint(int(uint(_3480) >> uint(2)));
        int _3484 = _3480 & 3;
        float _3486 = (*spvDescriptorSet0.vp_c15)._m0[int(_3482)][_3484];
        int _3488 = _3470 + 8;
        uint _3490 = uint(int(uint(_3488) >> uint(2)));
        uint _3492 = uint(int(uint(int(_3490)) >> uint(2)));
        int _3494 = int(_3490) & 3;
        float _3496 = (*spvDescriptorSet0.vp_c15)._m0[int(_3492)][_3494];
        int _3498 = int(_3490) + 1;
        uint _3500 = uint(int(uint(_3498) >> uint(2)));
        int _3502 = _3498 & 3;
        float _3504 = (*spvDescriptorSet0.vp_c15)._m0[int(_3500)][_3502];
        float _3506 = _2521 * _3486;
        float _3508 = fma(_2471, _3478, _3506);
        float _3510 = fma(_2479, _3496, _3508);
        float _3512 = _3510 + _3504;
        float _3514 = precise::clamp(_3512, 0.0, 1.0);
        float _3516 = -_3514;
        float _3518 = _3516 + _3197;
        float _3520 = fma(_3518, 500.0, 1.5);
        float _3522 = exp2(_3520);
        float _3524 = 0.0 + _3522;
        float _3526 = precise::clamp(_3524, 0.0, 1.0);
        _3466 = _3526;
        _3434 = 500.0;
    }
    float _3528 = _3466;
    float _3530 = _3434;
    float _3532 = _3454 * _3205;
    float _3534 = _3452 * _3528;
    float _3536 = -_3458;
    float _3538 = fma(_3536, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3540 = -_3454;
    float _3542 = _3540 + 1.0;
    float _3544 = _3216 * _3532;
    float _3546 = _3226 * _3532;
    float _3548 = -_3534;
    float _3550 = fma(_3548, _3538, 1.0);
    float _3552 = precise::clamp(_3550, 0.0, 1.0);
    float _3554 = _3216 * _3542;
    float _3556 = fma(_3222, _3544, _3210);
    float _3558 = fma(_3224, _3544, _3212);
    float _3560 = _3552 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3562 = fma(_3216, _3546, _3214);
    bool _3564 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3566 = isnan(_2507);
    bool _3568 = _3564 || _3566;
    bool _3570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3572 = _3568 || _3570;
    float _3574 = _3362 * _3420;
    out.m_91.x = _3560;
    float _3576 = _3574 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _3556;
    out.m_93.y = _3558;
    out.m_93.z = _3562;
    out.m_93.w = _3554;
    float _3578 = _3530;
    float _3580 = _3534;
    float _3582 = _3542;
    float _3584 = _3552;
    if (!_3572)
    {
        _3460 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3586 = _3460;
    float _3588 = _3586;
    float _3590 = _3586;
    if (!_3572)
    {
        _3578 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3592 = _3578;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3572)
    {
        _3462 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3598 = _3462;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3572)
    {
        _3580 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3604 = _3580;
    float _3606 = _3604;
    float _3608 = _3604;
    if (!_3572)
    {
        _3582 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3610 = _3582;
    float _3612 = _3610;
    float _3614 = _3610;
    if (!_3572)
    {
        _3584 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3616 = _3584;
    bool _3618 = !_3572;
    float _3620 = _3616;
    float _3622 = _3616;
    if (!_3618)
    {
        bool _3624 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3626 = isnan(_2507);
        bool _3628 = _3624 || _3626;
        bool _3630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3632 = _3628 || _3630;
        if (!_3632)
        {
            float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3636 = _2507 + _3634;
            float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3640 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3638;
            float _3642 = 1.0 / _3640;
            float _3644 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3654 = _3652 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3664 = _3636 * _3642;
            float _3666 = precise::clamp(_3664, 0.0, 1.0);
            float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3672 = fma(_3666, _3646, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3674 = fma(_3666, _3670, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3676 = fma(_3666, _3650, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3678 = fma(_3666, _3654, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3680 = fma(_3666, _3658, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3682 = fma(_3666, _3662, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3596 = _3672;
            _3614 = _3680;
            _3590 = _3674;
            _3608 = _3678;
            _3602 = _3676;
            _3622 = _3682;
            _3684 = true;
        }
        else
        {
            bool _3686 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3688 = isnan(_2507);
            bool _3690 = _3686 || _3688;
            bool _3692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3694 = _3690 || _3692;
            if (!_3694)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3696 = _3588;
            _3590 = _3696;
            if (!_3694)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3698 = _3594;
            _3596 = _3698;
            if (!_3694)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3700 = _3600;
            _3602 = _3700;
            if (!_3694)
            {
                _3606 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3702 = _3606;
            _3608 = _3702;
            if (!_3694)
            {
                _3612 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3704 = _3612;
            _3614 = _3704;
            if (!_3694)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3706 = _3620;
            bool _3708 = !_3694;
            _3622 = _3706;
            if (!_3708)
            {
                bool _3710 = _2507 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3712 = isnan(_2507);
                bool _3714 = _3710 || _3712;
                bool _3716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3718 = _3714 || _3716;
                if (!_3718)
                {
                    float _3720 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3722 = _2507 + _3720;
                    float _3724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3726 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3724;
                    float _3728 = 1.0 / _3726;
                    float _3730 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3750 = _3722 * _3728;
                    float _3752 = precise::clamp(_3750, 0.0, 1.0);
                    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3758 = fma(_3752, _3732, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3760 = fma(_3752, _3756, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3762 = fma(_3752, _3736, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3764 = fma(_3752, _3740, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3766 = fma(_3752, _3744, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3768 = fma(_3752, _3748, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3596 = _3758;
                    _3614 = _3766;
                    _3590 = _3760;
                    _3608 = _3764;
                    _3602 = _3762;
                    _3622 = _3768;
                    _3684 = true;
                }
                else
                {
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3614 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3608 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3684 = false;
    float _3770 = _3596;
    float _3772 = _3614;
    float _3774 = _3590;
    float _3776 = _3608;
    float _3778 = _3602;
    float _3780 = _3622;
    float _3782 = fma(_1369, -0.5, 0.5);
    float _3784 = precise::clamp(_3782, 0.0, 1.0);
    float _3786 = _3576 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3788 = -_3770;
    float _3790 = _3788 + _3772;
    float _3792 = -_3774;
    float _3794 = _3792 + _3776;
    out.m_95.x = 0.0;
    float _3796 = -_3778;
    float _3798 = _3796 + _3780;
    float _3800 = fma(_3784, _3790, _3770);
    float _3802 = fma(_3784, _3794, _3774);
    out.m_61.x = _3786;
    bool _3804 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3806 = _3800 * 0.586610972881317138671875;
    float _3808 = fma(_3784, _3798, _3778);
    bool _3810 = _3362 > 0.0;
    bool _3812 = isnan(_3362);
    bool _3814 = _3810 || _3812;
    bool _3816 = isnan(0.0);
    bool _3818 = _3814 || _3816;
    float _3820 = fma(_3802, 0.298911988735198974609375, _3806);
    bool _3822 = _3420 <= 0.0;
    bool _3824 = !_3818;
    bool _3826 = _3822 || _3824;
    float _3828 = fma(_3808, 0.114477999508380889892578125, _3820);
    float _3830 = -_3828;
    float _3832 = _3802 + _3830;
    float _3834 = -_3828;
    float _3836 = _3800 + _3834;
    float _3838 = -_3828;
    float _3840 = _3808 + _3838;
    float _3842 = fma(_3832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    float _3844 = fma(_3836, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    float _3846 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3828);
    bool _3848 = !_3804;
    if (!_3848)
    {
        float _3850 = -_2443;
        float _3852 = _3850 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3854 = -_2447;
        float _3856 = _3854 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3858 = -_2451;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3862 = _3852 * _3852;
        float _3864 = fma(_3856, _3856, _3862);
        float _3866 = fma(_3860, _3860, _3864);
        float _3868 = sqrt(_3866);
        float _3870 = rsqrt(_3866);
        float _3872 = -_3868;
        float _3874 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3876 = _3874 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3878 = precise::clamp(_3876, 0.0, 1.0);
        float _3880 = _3856 * _3870;
        float _3882 = _3852 * _3870;
        float _3884 = abs(_3878);
        float _3886 = log2(_3884);
        float _3888 = _3860 * _3870;
        float _3890 = _3880 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3892 = _1369 * _3882;
        float _3894 = -_3882;
        float _3896 = -_3890;
        float _3898 = fma(_3894, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3896);
        float _3900 = fma(_1367, _3880, _3892);
        float _3902 = -_3888;
        float _3904 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3898);
        float _3906 = fma(_1375, _3888, _3900);
        float _3908 = precise::clamp(_3906, 0.0, 1.0);
        float _3910 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3912 = _3904 + _3910;
        float _3914 = _3886 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3916 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3918 = precise::clamp(_3916, 0.0, 1.0);
        float _3920 = exp2(_3914);
        float _3922 = _3920 * _3918;
        float _3924 = _3908 * _3922;
        float _3926 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3928 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3930 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3926;
        out.m_95.y = _3928;
        out.m_95.z = _3930;
    }
    out.m_97.x = _3842;
    out.m_97.y = _3844;
    out.m_97.z = _3846;
    if (!_3826)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3932 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3932;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

