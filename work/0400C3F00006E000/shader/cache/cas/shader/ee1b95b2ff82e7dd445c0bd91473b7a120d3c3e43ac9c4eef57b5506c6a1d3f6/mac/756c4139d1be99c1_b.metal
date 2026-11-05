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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_81 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_55 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2548 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2795 = as_type<float>(_118);
        out.gl_Position.z = _2795;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2865 = as_type<float>(_156);
        out.gl_Position.z = _2865;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _162 * _160;
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _180 = _178 * 6.283185482025146484375;
    float _182 = floor(_178);
    float _184 = _180 * 0.15915493667125701904296875;
    bool _186 = !_166;
    int _188 = _186 ? 0 : 1;
    int _190 = abs(_188);
    float _192 = _184 * 6.283185482025146484375;
    float _194 = cos(_192);
    bool _196 = !_174;
    int _198 = _196 ? 0 : 1;
    bool _200 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _202 = abs(_198);
    float _204 = -_182;
    float _206 = _178 + _204;
    bool _208 = !_170;
    int _210 = _208 ? 0 : 1;
    float _212 = float(_190);
    int _214 = abs(_210);
    float _216 = -_206;
    float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _220 = fma(_194, 0.5, 0.5);
    float _222 = abs(_218);
    float _224 = _212 * _222;
    bool _226 = _206 < 0.5;
    float _228 = float(_226);
    float _230 = float(_202);
    float _232 = -_220;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_214);
    float _238 = -_228;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = fma(_230, _234, _224);
    float _244 = abs(_240);
    float _246 = fma(_236, _244, _242);
    bool _248 = !_200;
    float _264;
    if (!_248)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_102);
        float _270 = 1.0 / _268;
        float _272 = _136 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _278 = int(_276);
    float _280 = in.m_44.x;
    float _282 = in.m_44.y;
    float _284 = in.m_44.z;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = _274 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _274 + _290;
    float _294 = in.m_53.x;
    float _296 = in.m_53.y;
    float _298 = in.m_53.z;
    float _300 = in.m_53.w;
    float _302 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _304 = int(_302);
    float _306 = in.m_55.y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _308;
    float _312 = float(_278);
    float _314 = 1.0 / _312;
    float _316 = float(uint(_304));
    int _318 = ~_304;
    int _320 = _318 + 1;
    int _322 = ~_304;
    int _324 = _322 + 1;
    float _326 = _282 * _296;
    float _328 = 1.0 / _316;
    bool _330 = _304 == 0;
    float _332 = fma(_280, _294, _326);
    float _334 = _314 * _136;
    float _336 = trunc(_334);
    int _338 = int(_336);
    int _340 = as_type<int>(_328) + (-2);
    float _342 = float(uint(_338));
    float _344 = as_type<float>(_340) * _342;
    float _346 = trunc(_344);
    float _348 = precise::max(_346, 0.0);
    uint _351 = uint(_348);
    float _353 = float(_304);
    int _355 = _320 * int(_351);
    int _357 = _355 + _338;
    float _359 = float(uint(_357));
    float _361 = as_type<float>(_340) * _359;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _365 = _363 != 0;
    float _367 = trunc(_361);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    bool _373 = !_365;
    float _375 = _373 ? 7.345489978790283203125 : 1.0;
    float _377 = _375 * _158;
    float _379 = floor(_377);
    int _381 = int(_351) + int(_371);
    float _383 = float(_338);
    int _385 = _324 * _381;
    int _387 = _385 + _338;
    bool _389 = _383 >= _353;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = isnan(_353);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = float(_102);
    float _403 = _353 * _136;
    bool _405 = uint(_387) >= uint(_304);
    float _407 = trunc(_399);
    int _409 = int(_407);
    float _411 = -_379;
    float _413 = _377 + _411;
    bool _415 = !_405;
    int _417 = _415 ? 0 : (-1);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _429 = _427 != 0;
    float _431 = _413 * _353;
    int _433 = ~_381;
    int _435 = _433 + _417;
    int _437 = _435 + 1;
    float _439 = 1.0 / _401;
    int _441 = _304 + (-1);
    int _443 = _304 * _437;
    int _445 = _443 + _338;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    int _455 = ~_409;
    int _457 = _455 + 1;
    int _459 = _457 + 1;
    float _461 = trunc(_431);
    int _463 = int(_461);
    bool _465 = !_330;
    int _467 = _465 ? _445 : (-1);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _471 = _469 != 0;
    int _473 = _467 * _459;
    float _475 = _403 * _439;
    bool _477 = !_425;
    int _479 = _477 ? 0 : 1;
    int _481 = _409 * _441;
    int _483 = _481 + _473;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _487 = _485 != 0;
    float _489 = in.m_57.x;
    float _491 = in.m_57.y;
    float _493 = in.m_57.z;
    float _495 = in.m_57.w;
    int _497 = abs(_479);
    float _499 = trunc(_475);
    int _501 = int(_499);
    bool _503 = !_449;
    int _505 = _503 ? 0 : 1;
    float _507 = in.m_59.x;
    float _509 = in.m_59.y;
    float _511 = in.m_59.z;
    float _513 = in.m_59.w;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _517 = _515 != 0;
    int _519 = _483 * _497;
    bool _521 = !_421;
    int _523 = _521 ? 0 : 1;
    bool _525 = !_429;
    int _527 = _525 ? 0 : 1;
    int _529 = abs(_523);
    int _531 = abs(_505);
    bool _533 = !_517;
    int _535 = _533 ? 0 : 1;
    float _537 = in.m_51.y;
    int _539 = abs(_527);
    int _541 = _463 * _531;
    int _543 = _541 + _338;
    int _545 = abs(_535);
    int _547 = _501 * _529;
    int _549 = _547 + _519;
    float _551 = _282 * _491;
    int _553 = _543 * _539;
    int _555 = _553 + _549;
    float _557 = _282 * _509;
    float _559 = in.m_55.x;
    int _561 = _463 * _545;
    int _563 = _561 + _555;
    float _565 = fma(_280, _507, _557);
    float _567 = _158 * 2.0;
    float _569 = fma(_280, _489, _551);
    float _571 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _573 = float(uint(_563));
    float _575 = floor(_567);
    bool _577 = _537 > 0.5;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _581 = _158 > 0.5;
    bool _583 = _581 && _487;
    float _585 = as_type<float>(_340) * _573;
    float _587 = -_306;
    float _589 = _587 + 1.0;
    float _591 = -_579;
    float _593 = fma(_571, 2.0, _591);
    float _595 = in.m_51.z;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _597;
    float _601 = trunc(_585);
    float _603 = precise::max(_601, 0.0);
    uint _605 = uint(_603);
    float _607 = _306;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[146].w;
    if (_453)
    {
        float _611 = _577 ? _589 : _306;
        _607 = _611;
    }
    float _613 = _607;
    float _615 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _617 = ~_304;
    int _619 = _617 + 1;
    float _621 = fma(_284, _511, _565);
    float _623 = _158 + _537;
    bool _625 = _575 > 0.0;
    float _627 = 1.0 / _599;
    bool _629 = _575 >= 0.0;
    bool _631 = isnan(_575);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _641 = _158 * 6.283185482025146484375;
    float _643 = _623 + (-1.0);
    float _645 = fma(_615, -2.0, _639);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _651 = _619 * int(_605);
    int _653 = _651 + _563;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _655;
    float _659 = _559;
    if (!_487)
    {
        _609 = _559;
    }
    float _661 = _609;
    float _663 = _661;
    if (_583)
    {
        float _665 = -_559;
        float _667 = _665 + 1.0;
        _659 = _667;
    }
    float _669 = _659;
    float _671 = _641 + _136;
    float _673 = float(uint(_653));
    float _675 = 1.0 / _657;
    float _677 = fma(_284, _493, _569);
    if (_487)
    {
        _663 = _669;
    }
    float _679 = _663;
    float _681 = as_type<float>(_340) * _673;
    float _683 = fma(_284, _298, _332);
    float _685 = fma(_671, 0.070000000298023223876953125, 6.283185482025146484375);
    float _687 = _537 * 2.0;
    float _689 = 1.0 / _649;
    float _691 = _292 * _627;
    float _693 = _158 + _595;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _705 = _703 != 0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _709 = _274 + _707;
    float _711 = _288 * _675;
    float _713 = trunc(_681);
    float _715 = precise::max(_713, 0.0);
    uint _717 = uint(_715);
    float _719 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _721 = ~_304;
    int _723 = _721 + 1;
    float _725 = _595 * 2.0;
    float _727 = _537 + _595;
    float _729 = _693 + (-1.0);
    float _731 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _733 = fma(_310, _711, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _735 = floor(_687);
    float _737 = _727 + (-1.0);
    float _739 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _741 = _709 * _689;
    float _743 = _641 * 0.15915493667125701904296875;
    float _745 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _747 = _677 + _495;
    int _749 = int(_605) + int(_717);
    float _751 = floor(_725);
    int _753 = _637 ? 0 : 1;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _757 = _621 + _513;
    int _759 = _723 * _749;
    int _761 = _759 + _563;
    int _763 = ~_753;
    int _765 = _763 + 1;
    int _767 = _765 + 1;
    float _769 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _755);
    int _771 = _767;
    if (!_625)
    {
        int _773 = ~_753;
        int _775 = _773 + 1;
        _771 = _775;
    }
    int _777 = _771;
    float _779 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _781 = log2(_779);
    bool _783 = uint(_761) >= uint(_304);
    float _785 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _769);
    bool _787 = !_701;
    int _789 = _787 ? 0 : 1;
    float _791 = _683 + _300;
    bool _793 = !_783;
    int _795 = _793 ? 0 : (-1);
    float _797 = -_136;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _593);
    bool _801 = _735 >= 0.0;
    bool _803 = isnan(_735);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.0);
    bool _809 = _805 || _807;
    float _811 = _743 * 6.283185482025146484375;
    float _813 = cos(_811);
    bool _815 = _751 >= 0.0;
    bool _817 = isnan(_751);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = _685 * 0.15915493667125701904296875;
    int _827 = _809 ? 0 : 1;
    bool _829 = _751 > 0.0;
    float _831 = _781 * _136;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _833;
    bool _837 = _735 > 0.0;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _839;
    float _843 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _645);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _845;
    float _849 = fma(_835, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _851 = fma(_841, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _853 = -_843;
    float _855 = fma(_785, _731, _853);
    float _857 = fma(_847, _691, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _871;
    float _875 = fma(_861, _741, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _877 = fma(_865, _741, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _879 = fma(_869, _741, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _881;
    float _885 = exp2(_831);
    bool _887 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _889 = isnan(_274);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = fma(_883, _711, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _901 = fma(_873, _711, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _903 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _905 = isnan(_274);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = in.m_61.x;
    float _917 = in.m_61.y;
    float _919 = in.m_61.z;
    float _921 = _743 * 6.283185482025146484375;
    float _923 = sin(_921);
    bool _925 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _927 = isnan(_274);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    bool _937 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _939 = isnan(_274);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _951 = 1.0 + _949;
    int _953 = _823 ? 0 : 1;
    bool _955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _963 = _959 || _961;
    float _965 = -_947;
    float _967 = _965 + 1.0;
    float _969 = -_885;
    float _971 = _969 + 1.0;
    float _973 = 1.0 / _951;
    float _975 = float(uint(_543));
    float _977 = _935 * _967;
    float _979 = -_935;
    float _981 = _979 + 1.0;
    float _983 = _963 ? _971 : 0.0;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _987 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _995 = _991 || _993;
    float _997 = _913 * _981;
    float _999 = -_913;
    float _1001 = _999 + 1.0;
    float _1003 = as_type<float>(_340) * _975;
    int _1005 = ~_749;
    int _1007 = _1005 + _795;
    int _1009 = _1007 + 1;
    float _1011 = _923 * _917;
    float _1013 = _813 * _917;
    float _1015 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    int _1017 = _304 * _1009;
    int _1019 = _1017 + _563;
    float _1021 = -_1011;
    float _1023 = fma(_813, _915, _1021);
    float _1025 = fma(_923, _915, _1013);
    float _1027 = _897 * _1001;
    float _1029 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1015);
    float _1031 = trunc(_1003);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    float _1037 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1039 = _851 * _1027;
    float _1041 = -_897;
    float _1043 = _1041 + 1.0;
    if (_995)
    {
        float _1045 = _983 * _973;
        _138 = _1045;
    }
    float _1047 = _138;
    int _1049 = ~_304;
    int _1051 = _1049 + 1;
    float _1053 = fma(_1029, _1037, _799);
    float _1055 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1039);
    bool _1057 = !_330;
    int _1059 = _1057 ? _1019 : (-1);
    float _1061 = _849 * _1027;
    float _1063 = _857 * _1027;
    int _1065 = _1059 >> 31;
    float _1067 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1061);
    int _1069 = ~_827;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    float _1075 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1063);
    int _1077 = _1051 * int(_1035);
    int _1079 = _1077 + _543;
    int _1081 = _1065 & 3;
    float _1083 = fma(_875, _997, _1067);
    int _1085 = _1073;
    if (!_837)
    {
        int _1087 = ~_827;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = fma(_879, _997, _1075);
    float _1095 = float(uint(_1079));
    float _1097 = fma(_733, _977, _1083);
    int _1099 = _1059 + _1081;
    float _1101 = fma(_877, _997, _1055);
    int _1103 = abs(_789);
    float _1105 = as_type<float>(_340) * _1095;
    int _1107 = _1099 >> 2;
    float _1109 = fma(_899, _977, _1101);
    int _1111 = ~_953;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = trunc(_1105);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    int _1123 = _1107 << 4;
    int _1125 = _1123 + 368;
    float _1127 = fma(_901, _977, _1093);
    int _1129 = _1115;
    if (!_829)
    {
        int _1131 = ~_953;
        int _1133 = _1131 + 1;
        _1129 = _1133;
    }
    int _1135 = _1129;
    float _1137 = _855 + 0.5;
    uint _1139 = uint(int(uint(_1125) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[int(_1149)][_1151];
    float _1155 = float(_777);
    float _1157 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1097);
    float _1159 = float(_1103);
    float _1161 = _1053 + 0.5;
    int _1163 = _1059 & 3;
    bool _1165 = _1163 != 0;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _747 + _1167;
    int _1171 = _1059 & 3;
    bool _1173 = _1171 != 0;
    float _1175 = _1159 * _1155;
    int _1177 = _1165 ? 0 : 1;
    float _1179 = in.m_63.x;
    float _1181 = in.m_63.y;
    float _1183 = in.m_63.z;
    bool _1185 = uint(_1171) > 1u;
    float _1187 = _1175 * (-2.0);
    int _1189 = int(_1035) + int(_1121);
    float _1191 = in.m_65.x;
    float _1193 = in.m_65.y;
    float _1195 = in.m_65.z;
    int _1197 = ~_304;
    int _1199 = _1197 + 1;
    int _1201 = _1125 + 8;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    uint _1205 = uint(int(uint(int(_1203)) >> uint(2)));
    int _1207 = int(_1203) & 3;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[int(_1205)][_1207];
    int _1211 = int(_1203) + 1;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    int _1215 = _1211 & 3;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[int(_1213)][_1215];
    int _1219 = ~_1177;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    float _1225 = fma(_745, _1187, _745);
    bool _1227 = !_1173;
    int _1229 = _1227 ? 0 : 1;
    int _1231 = _1199 * _1189;
    int _1233 = _1231 + _543;
    bool _1235 = uint(_1171) >= 2u;
    out.m_67.x = _1161;
    out.m_67.y = _1137;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1239 = _791 + _1237;
    int _1241 = _1223;
    if (!_1185)
    {
        int _1243 = ~_1177;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _757 + _1249;
    bool _1253 = uint(_1233) >= uint(_304);
    float _1255 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1257 = !_1253;
    int _1259 = _1257 ? 0 : (-1);
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    bool _1263 = _1171 != 3;
    float _1265 = _1157 * _1179;
    int _1267 = abs(_1247);
    float _1269 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1261);
    int _1271 = abs(_1229);
    float _1273 = fma(_1187, _1193, _1193);
    int _1275 = _1235 ? 0 : 1;
    float _1277 = _246 * _1265;
    int _1279 = ~_1189;
    int _1281 = _1279 + _1259;
    int _1283 = _1281 + 1;
    int _1285 = ~_1275;
    int _1287 = _1285 + 1;
    int _1289 = _1287 + 1;
    int _1291 = _304 * _1283;
    int _1293 = _1291 + _543;
    bool _1295 = _1171 != 3;
    float _1297 = _1169 * _1169;
    int _1299 = _1289;
    float _1301 = _1195;
    if (_1263)
    {
        int _1303 = ~_1275;
        int _1305 = _1303 + 1;
        _1299 = _1305;
    }
    int _1307 = _1299;
    int _1309 = ~_1267;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1239, _1239, _1297);
    bool _1317 = !_1295;
    int _1319 = _1317 ? 0 : (-1);
    int _1321 = abs(_1307);
    int _1323 = _1313 * as_type<int>(_1153);
    int _1325 = ~_1271;
    int _1327 = _1325 + 1;
    int _1329 = _1327 + 1;
    int _1331 = abs(_1319);
    int _1333 = _1329 * as_type<int>(_1145);
    int _1335 = _1333 + _1323;
    bool _1337 = !_471;
    int _1339 = _1337 ? 0 : 1;
    int _1341 = ~_1321;
    int _1343 = _1341 + 1;
    int _1345 = _1343 + 1;
    float _1347 = fma(_1251, _1251, _1315);
    bool _1349 = !_697;
    int _1351 = _1349 ? 0 : 1;
    int _1353 = ~_1331;
    int _1355 = _1353 + 1;
    int _1357 = _1355 + 1;
    int _1359 = _1345 * as_type<int>(_1209);
    int _1361 = _1359 + _1335;
    int _1363 = abs(_1339);
    float _1365 = rsqrt(_1347);
    int _1367 = abs(_1351);
    int _1369 = _1357 * as_type<int>(_1217);
    int _1371 = _1369 + _1361;
    float _1373 = _537 + (-0.5);
    bool _1375 = _1269 >= 0.0;
    float _1377 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1379 = ~_1363;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1273);
    float _1387 = float(_1367);
    float _1389 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1391 = float(_1135);
    int _1393 = _1371 * _1383;
    bool _1395 = !_330;
    float _1397 = _1395 ? as_type<float>(_1293) : as_type<float>(0xffffffffu /* nan */);
    float _1399 = _1389 * _1365;
    float _1401 = _158 + (-0.5);
    float _1403 = _1387 * _1391;
    float _1405 = _825 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    int _1409 = as_type<int>(_1397) * _1363;
    int _1411 = _1409 + _1393;
    float _1413 = _1169 * _1399;
    float _1415 = _1397;
    float _1417 = _1413;
    if (_1375)
    {
        _1415 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1419 = _1415;
    float _1421 = fma(_1225, _1047, _1385);
    float _1423 = _1239 * _1399;
    float _1425 = -_1413;
    float _1427 = _1169 + _1425;
    int _1429 = as_type<int>(_1419);
    if (_1375)
    {
        float _1431 = _1419 * 5.0;
        _1429 = as_type<int>(_1431);
    }
    int _1433 = _1429;
    float _1435 = float(_1411);
    float _1437 = -_1423;
    float _1439 = _1239 + _1437;
    float _1441 = _1427 * _1427;
    bool _1443 = !_705;
    int _1445 = _1443 ? 0 : 1;
    if (_1375)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4705 = as_type<float>(_1433);
        out.gl_Position.z = _4705;
    }
    float _1447 = fma(_1439, _1439, _1441);
    int _1449 = abs(_1445);
    out.m_69.x = _1435;
    if (_1375)
    {
        out.m_47.x = 0.0;
    }
    if (_1375)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1451 = -_1413;
    float _1453 = _747 + _1451;
    float _1455 = _1403 * (-2.0);
    float _1457 = _1251 * _1399;
    float _1459 = -_1423;
    float _1461 = _791 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1465 = _1453 + _1463;
    float _1467 = float(_1449);
    float _1469 = fma(_1455, _1191, _1191);
    float _1471 = float(_1091);
    float _1473 = -_1457;
    float _1475 = _757 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1461 + _1477;
    float _1481 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1483 = -_1457;
    float _1485 = _1251 + _1483;
    float _1487 = fma(_719, _1455, _719);
    float _1489 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1469);
    float _1491 = _1421 * 0.15915493667125701904296875;
    float _1493 = _1467 * _1471;
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1497 = _1475 + _1495;
    float _1499 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1481);
    float _1501 = fma(_1485, _1485, _1447);
    float _1503 = fma(_1487, _1047, _1489);
    float _1505 = _1493 * (-2.0);
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1499);
    float _1509 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1127);
    float _1511 = _1503 * 0.15915493667125701904296875;
    float _1513 = sqrt(_1501);
    float _1515 = fma(_1505, _1195, _1195);
    float _1517 = _595 + (-0.5);
    bool _1519 = _1507 >= 0.0;
    float _1521 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1109);
    float _1523 = _1509 * _1183;
    float _1525 = fma(_739, _1505, _739);
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1515);
    float _1529 = _1491 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1521 * _1181;
    float _1535 = fma(_1525, _1047, _1527);
    float _1537 = _1407 * 0.100000001490116119384765625;
    float _1539 = _246 * _1533;
    float _1541 = _1535 * 0.15915493667125701904296875;
    if (_1519)
    {
        _1301 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1543 = _1301;
    float _1545 = _1365 * _1513;
    float _1547 = _1491 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    int _1551 = as_type<int>(_1543);
    float _1553 = _1545;
    if (_1519)
    {
        out.m_47.x = 0.0;
    }
    float _1555 = fma(_1023, _1537, _1023);
    if (_1519)
    {
        float _1557 = _1543 * 5.0;
        _1551 = as_type<int>(_1557);
    }
    int _1559 = _1551;
    float _1561 = fma(_1025, _1537, _1025);
    float _1563 = _1511 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    if (_1519)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4910 = as_type<float>(_1559);
        out.gl_Position.z = _4910;
    }
    float _1567 = _1511 * 6.283185482025146484375;
    float _1569 = cos(_1567);
    float _1571 = _1541 * 6.283185482025146484375;
    float _1573 = sin(_1571);
    if (_1519)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1575 = _1541 * 6.283185482025146484375;
    float _1577 = cos(_1575);
    float _1579 = _1539 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1581 = _246 * _1523;
    float _1583 = _1377 * _1545;
    float _1585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1555);
    float _1587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1561);
    float _1589 = _1545 * _1579;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1593 = fma(_1537, _919, _919);
    float _1595 = _1585 * _1583;
    float _1597 = _1587 * _1589;
    float _1599 = _1565 * _1531;
    float _1601 = _1569 * _1549;
    float _1603 = _1545 * _1591;
    float _1605 = _1565 * _1549;
    float _1607 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1593);
    float _1609 = _1569 * _1577;
    float _1611 = _1565 * _1577;
    float _1613 = _1549 * _1577;
    float _1615 = _1531 * _1577;
    float _1617 = _1569 * _1531;
    float _1619 = fma(_1573, _1601, _1599);
    float _1621 = _1609 * _1597;
    float _1623 = _1607 * _1603;
    float _1625 = -_1605;
    float _1627 = fma(_1573, _1617, _1625);
    float _1629 = -_1597;
    float _1631 = _1573 * _1629;
    float _1633 = fma(_1619, _1595, _1621);
    float _1635 = -_1617;
    float _1637 = fma(_1573, _1605, _1635);
    float _1639 = _1611 * _1597;
    float _1641 = fma(_1613, _1595, _1631);
    float _1643 = fma(_1627, _1623, _1633);
    float _1645 = fma(_1573, _1599, _1601);
    float _1647 = fma(_1637, _1595, _1639);
    float _1649 = fma(_1615, _1623, _1641);
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1653 = fma(_1645, _1623, _1647);
    float _1655 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1657 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1651);
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1661 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1663 = isnan(0.5);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1669 = _1665 || _1667;
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1655);
    float _1673 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1657);
    float _1675 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1659);
    bool _1677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1679 = isnan(0.5);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1685 = _1681 || _1683;
    float _1687 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1671);
    float _1689 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1691 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1675);
    float _1693 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1695 = _757 + _1689;
    float _1697 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1699 = _791 + _1693;
    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1703 = _1695 + _1701;
    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1707 = _1699 + _1705;
    float _1709 = _1703 * _1703;
    float _1711 = fma(_1707, _1707, _1709);
    float _1713 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1715 = sqrt(_1711);
    float _1717 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1713);
    float _1719 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1723 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1725 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1727 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1723);
    float _1729 = _747 + _1697;
    float _1731 = 1.0 / _1725;
    float _1733 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1735 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1737 = _1733 + _1725;
    float _1739 = _1653;
    float _1741 = _1733;
    float _1743 = _1699;
    float _1745 = _1697;
    if (!_1735)
    {
        _1739 = _1695;
    }
    float _1747 = _1739;
    float _1749 = _1747;
    if (!_1735)
    {
        _1741 = _1729;
    }
    float _1751 = _1741;
    bool _1753 = !_1735;
    float _1755 = _1751;
    if (!_1753)
    {
        float _1757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1761 = _1715 + _1759;
        float _1763 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1765 = _1761 * _1757;
        float _1767 = rsqrt(_1711);
        float _1769 = _1765 * 0.15915493667125701904296875;
        float _1771 = _1769 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1769 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        float _1779 = _1773 + (-1.0);
        float _1781 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = fma(_1777, _1763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1785 = fma(_1729, _1773, _1781);
        float _1787 = _1767 * _1783;
        float _1789 = fma(_1707, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1791 = fma(_1703, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1743 = _1789;
        _1755 = _1785;
        _1749 = _1791;
        _1745 = _1763;
    }
    float _1793 = _1743;
    float _1795 = _1755;
    float _1797 = _1749;
    float _1799 = _1745;
    float _1801 = -_1423;
    float _1803 = _1801 + _1793;
    float _1805 = -_1413;
    float _1807 = _1805 + _1795;
    float _1809 = -_1457;
    float _1811 = _1809 + _1797;
    float _1813 = _1737 * _1731;
    float _1815 = _1813 * 0.5;
    float _1817 = _1799;
    float _1819 = _1803;
    float _1821 = _1807;
    if (_1685)
    {
        _1817 = 1.0;
    }
    float _1823 = _1817;
    float _1825 = _1823;
    if (_1669)
    {
        _1417 = _1803;
    }
    float _1827 = _1417;
    float _1829 = _1827;
    if (_1669)
    {
        _1819 = _1807;
    }
    float _1831 = _1819;
    float _1833 = _1831;
    if (_1669)
    {
        _1821 = _1811;
    }
    float _1835 = _1821;
    float _1837 = _1835;
    if (!_1669)
    {
        float _1839 = _1465 * _1465;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1843 = -_757;
        float _1845 = _1843 + _1797;
        float _1847 = -_747;
        float _1849 = _1847 + _1795;
        float _1851 = fma(_1479, _1479, _1839);
        float _1853 = fma(_1497, _1497, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1857 = sqrt(_1853);
        float _1859 = 1.0 / _1545;
        float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1841;
        float _1867 = _1865 * _1859;
        float _1869 = -_791;
        float _1871 = _1869 + _1793;
        float _1873 = _1861 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1871, _1873, _1461);
        float _1879 = fma(_1849, _1873, _1453);
        float _1881 = fma(_1861, _1875, _1475);
        _1833 = _1879;
        _1829 = _1877;
        _1837 = _1881;
    }
    float _1883 = _1833;
    float _1885 = _1829;
    float _1887 = _1837;
    if (!_1685)
    {
        float _1889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1897 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1895);
        float _1899 = _1891 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1893 * 0.15915493667125701904296875;
        float _1905 = _1891 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        float _1909 = 1.0 / _1901;
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1907 * _1909;
        float _1917 = _1903 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = _1913 * _1915;
        float _1923 = 1.0 / _1897;
        float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1927 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1925;
        float _1929 = 1.0 / _1921;
        float _1931 = 1.0 / _1927;
        float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1935 = _1923 * _1933;
        float _1937 = _1919 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1941 = fma(_1937, _1935, _1939);
        float _1943 = _1941 * _1931;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1553 = _1929;
        _1825 = _1945;
    }
    float _1947 = _1553;
    float _1949 = _1825;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1953 = _1883 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1957 = _1885 + _1955;
    float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1961 = _1887 + _1959;
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1953 * _1953;
    float _1967 = fma(_1957, _1957, _1965);
    float _1969 = fma(_1961, _1961, _1967);
    float _1971 = rsqrt(_1969);
    float _1973 = sqrt(_1969);
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1977 = _1957 * _1975;
    float _1979 = _1961 * _1975;
    float _1981 = _1977 * _1977;
    float _1983 = _1979 * _1979;
    float _1985 = _1981 + _1983;
    float _1987 = sqrt(_1985);
    bool _1989 = _1987 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1993 = _1987 + _1991;
    float _1995 = _1961;
    float _1997 = _1985;
    float _1999 = _1993;
    float _2001 = _1947;
    float _2003 = _1975;
    if (_1989)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (_1989)
    {
        float _2009 = rsqrt(_1985);
        _1997 = _2009;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1989)
    {
        float _2015 = _1993 * _2007;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1989)
    {
        float _2019 = _2017 * 0.15915493667125701904296875;
        _2001 = _2019;
    }
    float _2021 = _2001;
    float _2023 = _2007;
    float _2025 = _2021;
    if (_1989)
    {
        float _2027 = _2021 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        _2023 = _2029;
    }
    float _2031 = _2023;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2035 = precise::max(0.0, _2033);
    float _2037 = _1965;
    float _2039 = _2035;
    if (_1989)
    {
        float _2041 = _2021 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        _2037 = _2043;
    }
    float _2045 = _2037;
    float _2047 = -_1975;
    float _2049 = -_2035;
    float _2051 = fma(_1953, _2047, _2049);
    float _2053 = _2051;
    if (_1989)
    {
        float _2055 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2039 = _2055;
    }
    float _2057 = _2039;
    float _2059 = _2031;
    float _2061 = _2057;
    if (_1989)
    {
        float _2063 = fma(_2031, _2057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = _2065;
    float _2069 = _2045;
    if (_1989)
    {
        float _2071 = _2045 + (-1.0);
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _2073;
    if (_1989)
    {
        float _2077 = _2011 * _2065;
        _2003 = _2077;
    }
    float _2079 = _2003;
    if (!_1989)
    {
        _2067 = _1977;
    }
    float _2081 = _2067;
    float _2083 = _2081;
    if (_1989)
    {
        float _2085 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2085;
    }
    float _2087 = _2025;
    if (_1989)
    {
        float _2089 = _1977 * _2079;
        _2083 = _2089;
    }
    float _2091 = _2083;
    if (!_1989)
    {
        _2075 = _1979;
    }
    float _2093 = _2075;
    float _2095 = _2093;
    if (_1989)
    {
        float _2097 = _1979 * _2079;
        _2095 = _2097;
    }
    float _2099 = _2095;
    if (!_1989)
    {
        _2013 = _1981;
    }
    float _2101 = _2013;
    float _2103 = _2101;
    if (_1989)
    {
        float _2105 = fma(_2051, _2045, _2087);
        _2053 = _2105;
    }
    float _2107 = _2053;
    if (_1989)
    {
        float _2109 = _2091 * _2091;
        _2103 = _2109;
    }
    float _2111 = _2103;
    if (!_1989)
    {
        _2069 = _1983;
    }
    float _2113 = _2069;
    float _2115 = _2113;
    if (_1989)
    {
        float _2117 = _2099 * _2099;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2123 = fma(_2107, _2107, _2111);
    float _2125 = _2123 + _2119;
    float _2127 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2121);
    float _2129 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2133 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2131);
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = rsqrt(_2125);
    float _2139 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2127);
    float _2141 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2143 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2145 = -_2135;
    float _2147 = _2145 + 1.0;
    float _2149 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2141);
    float _2153 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2143);
    float _2155 = abs(_2147);
    float _2157 = log2(_2155);
    float _2159 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2161 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2151);
    float _2163 = _2153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2165 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2167 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2173 = _2137 * _2091;
    float _2175 = _2137 * _2107;
    float _2177 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2165);
    float _2179 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2171);
    float _2181 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2183 = _2137 * _2099;
    float _2185 = -_2167;
    float _2187 = fma(_2185, _1963, 1.0);
    float _2189 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2191 = -_2181;
    float _2193 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2191);
    float _2195 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2179);
    float _2197 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2199 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2201 = -_2183;
    float _2203 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2193);
    float _2205 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2195);
    float _2207 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2209 = log2(_2187);
    float _2211 = fma(_2203, -0.5, 0.5);
    float _2213 = fma(_2203, 0.5, 0.5);
    float _2215 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2207);
    float _2217 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2199);
    float _2219 = _2175 + 1.0;
    float _2221 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2215);
    float _2223 = 1.0 / _2205;
    float _2225 = fma(_2213, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2227 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2217);
    float _2229 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2221);
    float _2231 = fma(_2213, _2225, -0.212114393711090087890625);
    float _2233 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2227);
    float _2235 = exp2(_2197);
    float _2237 = _2209 * 0.693147182464599609375;
    float _2239 = fma(_2213, _2231, 1.570728778839111328125);
    float _2241 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2243 = sqrt(_2211);
    float _2245 = _2229 * _2223;
    float _2247 = _2233 * _2223;
    float _2249 = fma(_2245, 0.5, 0.5);
    float _2251 = fma(_2247, -0.5, 0.5);
    float _2253 = -_2175;
    float _2255 = fma(_2235, _2219, _2253);
    float3 _6020 = float3(_2249, _2251, _2241);
    float _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6020, float3(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6020, float3(0.0), isnan(_6020)), level(0.0)).x;
    float _2259 = fma(_2255, 0.5, 0.5);
    float _2261 = _2243 * 0.636619746685028076171875;
    float _2263 = -_2239;
    float _2265 = fma(_2261, _2263, 1.0);
    float3 _6041 = float3(_2249, _2251, _2241);
    float4 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6041, float3(0.0), isnan(_6041)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6041, float3(0.0), isnan(_6041)), level(0.0)).xyzw;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _2268.w;
    float2 _6058 = float2(_2265, _2259);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6058, float2(0.0), isnan(_6058)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6058, float2(0.0), isnan(_6058)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = in.m_71.x;
    float _2290 = in.m_71.y;
    bool _2292 = _1561 != 0.0;
    bool _2294 = isnan(_1561);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan(0.0);
    bool _2300 = _2296 || _2298;
    float _2302 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _1885;
    out.m_73.y = _1883;
    out.m_73.z = _1887;
    bool _2306 = _1555 == 0.0;
    bool _2308 = !_2300;
    bool _2310 = _2306 && _2308;
    float _2312 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2314 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2316 = _1593 == 0.0;
    bool _2318 = _2316 && _2310;
    float _2320 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2322 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2312);
    float _2324 = -_1573;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2328 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2304);
    float _2330 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    float _2332 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2328);
    float _2334 = _923 * _2290;
    float _2336 = _813 * _2290;
    float _2338 = in.m_71.z;
    float _2340 = -_2334;
    float _2342 = fma(_813, _2288, _2340);
    float _2344 = fma(_923, _2288, _2336);
    float _2346 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2348 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2350 = _2342;
    float _2352 = _2344;
    float _2354 = _2233;
    float _2356 = _2229;
    if (!_2318)
    {
        float _2358 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2342);
        _2350 = _2358;
    }
    float _2360 = _2350;
    if (!_2318)
    {
        float _2362 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2344);
        _2352 = _2362;
    }
    float _2364 = _2352;
    float _2366 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2346);
    float _2368 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2348);
    float _2370 = -_1573;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2320);
    float _2374 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2376 = -_1573;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2380 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2368);
    float _2382 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2384 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2386 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2378);
    float _2388 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2372);
    float _2390 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2366);
    float _2392 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2384);
    float _2394 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2396 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2322);
    float _2398 = _2386 * _2364;
    float _2400 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2382);
    float _2402 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2392);
    float _2404 = _2338;
    if (!_2318)
    {
        float _2406 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = exp2(_2394);
    float _2412 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2374);
    float _2414 = _2330 * _2364;
    float _2416 = _2388 * _2364;
    float _2418 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2420 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2412);
    float _2422 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2332);
    float _2424 = fma(_2390, _2360, _2398);
    float _2426 = fma(_2396, _2360, _2414);
    float _2428 = fma(_2380, _2360, _2416);
    float _2430 = _2422 + _2205;
    float _2432 = _2229 + _2205;
    float _2434 = _2205 * 0.5;
    float _2436 = fma(_2420, _2408, _2424);
    float _2438 = fma(_2418, _2408, _2426);
    float _2440 = fma(_2402, _2408, _2428);
    float _2442 = -_2410;
    float _2444 = _2442 + 1.0;
    float _2446 = _2430 * 0.5;
    float _2448 = _2432 * 0.5;
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2452 = fma(_2233, -0.5, _2434);
    out.m_75.x = _2436;
    out.m_75.y = _2438;
    out.m_75.z = _2440;
    bool _2454 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2456 = isnan(_1973);
    bool _2458 = _2454 || _2456;
    bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2462 = _2458 || _2460;
    float _2464 = -_2450;
    float _2466 = _2464 + 1.0;
    out.m_77.x = _2448;
    out.m_77.y = _2452;
    out.m_77.z = _2446;
    out.m_77.w = _2205;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2233;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _2205;
    if (!_2462)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2468 = _2354;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2462)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2474 = _2356;
    float _2476 = _2450 * _2257;
    float _2478 = _2276 * _2476;
    float _2480 = _2276 * _2466;
    float _2482 = _2286 * _2476;
    float _2484 = fma(_2282, _2478, _2270);
    float _2486 = fma(_2284, _2478, _2272);
    float _2488 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2490 = fma(_2276, _2482, _2274);
    float _2492 = _2478;
    float _2494 = _2474;
    float _2496 = _2474;
    if (!_2462)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _2492;
    out.m_79.x = _2484;
    out.m_79.y = _2486;
    out.m_79.z = _2490;
    out.m_79.w = _2480;
    bool _2500 = !_2462;
    float _2502 = _2498;
    float _2504 = _2498;
    if (!_2500)
    {
        bool _2506 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2508 = isnan(_1973);
        bool _2510 = _2506 || _2508;
        bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2514 = _2510 || _2512;
        if (!_2514)
        {
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2518 = _1973 + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2520;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2532 = 1.0 / _2522;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2538 = _2518 * _2532;
            float _2540 = precise::clamp(_2538, 0.0, 1.0);
            float _2542 = fma(_2540, _2526, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2540, _2530, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2546 = fma(_2540, _2536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2496 = _2544;
            _2472 = _2542;
            _2504 = _2546;
            _2548 = true;
        }
        else
        {
            bool _2550 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2552 = isnan(_1973);
            bool _2554 = _2550 || _2552;
            bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2558 = _2554 || _2556;
            if (!_2558)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2560 = _2470;
            _2472 = _2560;
            if (!_2558)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2562 = _2494;
            _2496 = _2562;
            if (!_2558)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2564 = _2502;
            bool _2566 = !_2558;
            _2504 = _2564;
            if (!_2566)
            {
                bool _2568 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2570 = isnan(_1973);
                bool _2572 = _2568 || _2570;
                bool _2574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2576 = _2572 || _2574;
                if (!_2576)
                {
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2580 = _1973 + _2578;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2584 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2582;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2594 = 1.0 / _2584;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2600 = _2580 * _2594;
                    float _2602 = precise::clamp(_2600, 0.0, 1.0);
                    float _2604 = fma(_2602, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2606 = fma(_2602, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2496 = _2606;
                    _2472 = _2604;
                    _2504 = _2608;
                    _2548 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2548 = false;
    float _2610 = _2496;
    float _2612 = _2472;
    float _2614 = _2504;
    float _2616 = _2488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = 0.0;
    float _2618 = _2610 * 0.586610972881317138671875;
    bool _2620 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _2616;
    float _2622 = fma(_2612, 0.298911988735198974609375, _2618);
    bool _2624 = _1949 > 0.0;
    bool _2626 = isnan(_1949);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan(0.0);
    bool _2632 = _2628 || _2630;
    float _2634 = fma(_2614, 0.114477999508380889892578125, _2622);
    float _2636 = -_2634;
    float _2638 = _2636 + _2612;
    float _2640 = -_2634;
    float _2642 = _2640 + _2610;
    float _2644 = -_2634;
    float _2646 = _2644 + _2614;
    float _2648 = fma(_2638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2650 = fma(_2642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2652 = fma(_2646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    bool _2654 = !_2620;
    if (!_2654)
    {
        float _2656 = -_1883;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2660 = -_1885;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2664 = -_1887;
        float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2668 = _2658 * _2658;
        float _2670 = fma(_2662, _2662, _2668);
        float _2672 = fma(_2666, _2666, _2670);
        float _2674 = sqrt(_2672);
        float _2676 = rsqrt(_2672);
        float _2678 = -_2674;
        float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2684 = precise::clamp(_2682, 0.0, 1.0);
        float _2686 = _2662 * _2676;
        float _2688 = _2658 * _2676;
        float _2690 = abs(_2684);
        float _2692 = log2(_2690);
        float _2694 = _2666 * _2676;
        float _2696 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2698 = _2438 * _2688;
        float _2700 = -_2688;
        float _2702 = -_2696;
        float _2704 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2702);
        float _2706 = fma(_2436, _2686, _2698);
        float _2708 = -_2694;
        float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2704);
        float _2712 = fma(_2440, _2694, _2706);
        float _2714 = precise::clamp(_2712, 0.0, 1.0);
        float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2718 = _2710 + _2716;
        float _2720 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2722 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = exp2(_2720);
        float _2728 = _2726 * _2724;
        float _2730 = _2714 * _2728;
        float _2732 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2736 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2732;
        out.m_81.y = _2734;
        out.m_81.z = _2736;
    }
    out.m_83.x = _2648;
    out.m_83.y = _2650;
    out.m_83.z = _2652;
    if (_2632)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2738;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2548 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2795 = as_type<float>(_118);
        out.gl_Position.z = _2795;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2865 = as_type<float>(_156);
        out.gl_Position.z = _2865;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_51.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _162 * _160;
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _180 = _178 * 6.283185482025146484375;
    float _182 = floor(_178);
    float _184 = _180 * 0.15915493667125701904296875;
    bool _186 = !_166;
    int _188 = _186 ? 0 : 1;
    int _190 = abs(_188);
    float _192 = _184 * 6.283185482025146484375;
    float _194 = cos(_192);
    bool _196 = !_174;
    int _198 = _196 ? 0 : 1;
    bool _200 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _202 = abs(_198);
    float _204 = -_182;
    float _206 = _178 + _204;
    bool _208 = !_170;
    int _210 = _208 ? 0 : 1;
    float _212 = float(_190);
    int _214 = abs(_210);
    float _216 = -_206;
    float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _220 = fma(_194, 0.5, 0.5);
    float _222 = abs(_218);
    float _224 = _212 * _222;
    bool _226 = _206 < 0.5;
    float _228 = float(_226);
    float _230 = float(_202);
    float _232 = -_220;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_214);
    float _238 = -_228;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = fma(_230, _234, _224);
    float _244 = abs(_240);
    float _246 = fma(_236, _244, _242);
    bool _248 = !_200;
    float _264;
    if (!_248)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_102);
        float _270 = 1.0 / _268;
        float _272 = _136 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _278 = int(_276);
    float _280 = in.m_44.x;
    float _282 = in.m_44.y;
    float _284 = in.m_44.z;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = _274 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _274 + _290;
    float _294 = in.m_53.x;
    float _296 = in.m_53.y;
    float _298 = in.m_53.z;
    float _300 = in.m_53.w;
    float _302 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _304 = int(_302);
    float _306 = in.m_55.y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _308;
    float _312 = float(_278);
    float _314 = 1.0 / _312;
    float _316 = float(uint(_304));
    int _318 = ~_304;
    int _320 = _318 + 1;
    int _322 = ~_304;
    int _324 = _322 + 1;
    float _326 = _282 * _296;
    float _328 = 1.0 / _316;
    bool _330 = _304 == 0;
    float _332 = fma(_280, _294, _326);
    float _334 = _314 * _136;
    float _336 = trunc(_334);
    int _338 = int(_336);
    int _340 = as_type<int>(_328) + (-2);
    float _342 = float(uint(_338));
    float _344 = as_type<float>(_340) * _342;
    float _346 = trunc(_344);
    float _348 = precise::max(_346, 0.0);
    uint _351 = uint(_348);
    float _353 = float(_304);
    int _355 = _320 * int(_351);
    int _357 = _355 + _338;
    float _359 = float(uint(_357));
    float _361 = as_type<float>(_340) * _359;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _365 = _363 != 0;
    float _367 = trunc(_361);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    bool _373 = !_365;
    float _375 = _373 ? 7.345489978790283203125 : 1.0;
    float _377 = _375 * _158;
    float _379 = floor(_377);
    int _381 = int(_351) + int(_371);
    float _383 = float(_338);
    int _385 = _324 * _381;
    int _387 = _385 + _338;
    bool _389 = _383 >= _353;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = isnan(_353);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = float(_102);
    float _403 = _353 * _136;
    bool _405 = uint(_387) >= uint(_304);
    float _407 = trunc(_399);
    int _409 = int(_407);
    float _411 = -_379;
    float _413 = _377 + _411;
    bool _415 = !_405;
    int _417 = _415 ? 0 : (-1);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _429 = _427 != 0;
    float _431 = _413 * _353;
    int _433 = ~_381;
    int _435 = _433 + _417;
    int _437 = _435 + 1;
    float _439 = 1.0 / _401;
    int _441 = _304 + (-1);
    int _443 = _304 * _437;
    int _445 = _443 + _338;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    int _455 = ~_409;
    int _457 = _455 + 1;
    int _459 = _457 + 1;
    float _461 = trunc(_431);
    int _463 = int(_461);
    bool _465 = !_330;
    int _467 = _465 ? _445 : (-1);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _471 = _469 != 0;
    int _473 = _467 * _459;
    float _475 = _403 * _439;
    bool _477 = !_425;
    int _479 = _477 ? 0 : 1;
    int _481 = _409 * _441;
    int _483 = _481 + _473;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _487 = _485 != 0;
    float _489 = in.m_57.x;
    float _491 = in.m_57.y;
    float _493 = in.m_57.z;
    float _495 = in.m_57.w;
    int _497 = abs(_479);
    float _499 = trunc(_475);
    int _501 = int(_499);
    bool _503 = !_449;
    int _505 = _503 ? 0 : 1;
    float _507 = in.m_59.x;
    float _509 = in.m_59.y;
    float _511 = in.m_59.z;
    float _513 = in.m_59.w;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _517 = _515 != 0;
    int _519 = _483 * _497;
    bool _521 = !_421;
    int _523 = _521 ? 0 : 1;
    bool _525 = !_429;
    int _527 = _525 ? 0 : 1;
    int _529 = abs(_523);
    int _531 = abs(_505);
    bool _533 = !_517;
    int _535 = _533 ? 0 : 1;
    float _537 = in.m_51.y;
    int _539 = abs(_527);
    int _541 = _463 * _531;
    int _543 = _541 + _338;
    int _545 = abs(_535);
    int _547 = _501 * _529;
    int _549 = _547 + _519;
    float _551 = _282 * _491;
    int _553 = _543 * _539;
    int _555 = _553 + _549;
    float _557 = _282 * _509;
    float _559 = in.m_55.x;
    int _561 = _463 * _545;
    int _563 = _561 + _555;
    float _565 = fma(_280, _507, _557);
    float _567 = _158 * 2.0;
    float _569 = fma(_280, _489, _551);
    float _571 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _573 = float(uint(_563));
    float _575 = floor(_567);
    bool _577 = _537 > 0.5;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _581 = _158 > 0.5;
    bool _583 = _581 && _487;
    float _585 = as_type<float>(_340) * _573;
    float _587 = -_306;
    float _589 = _587 + 1.0;
    float _591 = -_579;
    float _593 = fma(_571, 2.0, _591);
    float _595 = in.m_51.z;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _597;
    float _601 = trunc(_585);
    float _603 = precise::max(_601, 0.0);
    uint _605 = uint(_603);
    float _607 = _306;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[146].w;
    if (_453)
    {
        float _611 = _577 ? _589 : _306;
        _607 = _611;
    }
    float _613 = _607;
    float _615 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _617 = ~_304;
    int _619 = _617 + 1;
    float _621 = fma(_284, _511, _565);
    float _623 = _158 + _537;
    bool _625 = _575 > 0.0;
    float _627 = 1.0 / _599;
    bool _629 = _575 >= 0.0;
    bool _631 = isnan(_575);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _641 = _158 * 6.283185482025146484375;
    float _643 = _623 + (-1.0);
    float _645 = fma(_615, -2.0, _639);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _651 = _619 * int(_605);
    int _653 = _651 + _563;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _655;
    float _659 = _559;
    if (!_487)
    {
        _609 = _559;
    }
    float _661 = _609;
    float _663 = _661;
    if (_583)
    {
        float _665 = -_559;
        float _667 = _665 + 1.0;
        _659 = _667;
    }
    float _669 = _659;
    float _671 = _641 + _136;
    float _673 = float(uint(_653));
    float _675 = 1.0 / _657;
    float _677 = fma(_284, _493, _569);
    if (_487)
    {
        _663 = _669;
    }
    float _679 = _663;
    float _681 = as_type<float>(_340) * _673;
    float _683 = fma(_284, _298, _332);
    float _685 = fma(_671, 0.070000000298023223876953125, 6.283185482025146484375);
    float _687 = _537 * 2.0;
    float _689 = 1.0 / _649;
    float _691 = _292 * _627;
    float _693 = _158 + _595;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _705 = _703 != 0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _709 = _274 + _707;
    float _711 = _288 * _675;
    float _713 = trunc(_681);
    float _715 = precise::max(_713, 0.0);
    uint _717 = uint(_715);
    float _719 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _721 = ~_304;
    int _723 = _721 + 1;
    float _725 = _595 * 2.0;
    float _727 = _537 + _595;
    float _729 = _693 + (-1.0);
    float _731 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _733 = fma(_310, _711, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _735 = floor(_687);
    float _737 = _727 + (-1.0);
    float _739 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _741 = _709 * _689;
    float _743 = _641 * 0.15915493667125701904296875;
    float _745 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _747 = _677 + _495;
    int _749 = int(_605) + int(_717);
    float _751 = floor(_725);
    int _753 = _637 ? 0 : 1;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _757 = _621 + _513;
    int _759 = _723 * _749;
    int _761 = _759 + _563;
    int _763 = ~_753;
    int _765 = _763 + 1;
    int _767 = _765 + 1;
    float _769 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _755);
    int _771 = _767;
    if (!_625)
    {
        int _773 = ~_753;
        int _775 = _773 + 1;
        _771 = _775;
    }
    int _777 = _771;
    float _779 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _781 = log2(_779);
    bool _783 = uint(_761) >= uint(_304);
    float _785 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _769);
    bool _787 = !_701;
    int _789 = _787 ? 0 : 1;
    float _791 = _683 + _300;
    bool _793 = !_783;
    int _795 = _793 ? 0 : (-1);
    float _797 = -_136;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _593);
    bool _801 = _735 >= 0.0;
    bool _803 = isnan(_735);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.0);
    bool _809 = _805 || _807;
    float _811 = _743 * 6.283185482025146484375;
    float _813 = cos(_811);
    bool _815 = _751 >= 0.0;
    bool _817 = isnan(_751);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = _685 * 0.15915493667125701904296875;
    int _827 = _809 ? 0 : 1;
    bool _829 = _751 > 0.0;
    float _831 = _781 * _136;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _833;
    bool _837 = _735 > 0.0;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _839;
    float _843 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _645);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _845;
    float _849 = fma(_835, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _851 = fma(_841, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _853 = -_843;
    float _855 = fma(_785, _731, _853);
    float _857 = fma(_847, _691, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _871;
    float _875 = fma(_861, _741, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _877 = fma(_865, _741, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _879 = fma(_869, _741, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _881;
    float _885 = exp2(_831);
    bool _887 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _889 = isnan(_274);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = fma(_883, _711, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _901 = fma(_873, _711, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _903 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _905 = isnan(_274);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = in.m_61.x;
    float _917 = in.m_61.y;
    float _919 = in.m_61.z;
    float _921 = _743 * 6.283185482025146484375;
    float _923 = sin(_921);
    bool _925 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _927 = isnan(_274);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    bool _937 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _939 = isnan(_274);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _951 = 1.0 + _949;
    int _953 = _823 ? 0 : 1;
    bool _955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _963 = _959 || _961;
    float _965 = -_947;
    float _967 = _965 + 1.0;
    float _969 = -_885;
    float _971 = _969 + 1.0;
    float _973 = 1.0 / _951;
    float _975 = float(uint(_543));
    float _977 = _935 * _967;
    float _979 = -_935;
    float _981 = _979 + 1.0;
    float _983 = _963 ? _971 : 0.0;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _987 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _995 = _991 || _993;
    float _997 = _913 * _981;
    float _999 = -_913;
    float _1001 = _999 + 1.0;
    float _1003 = as_type<float>(_340) * _975;
    int _1005 = ~_749;
    int _1007 = _1005 + _795;
    int _1009 = _1007 + 1;
    float _1011 = _923 * _917;
    float _1013 = _813 * _917;
    float _1015 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    int _1017 = _304 * _1009;
    int _1019 = _1017 + _563;
    float _1021 = -_1011;
    float _1023 = fma(_813, _915, _1021);
    float _1025 = fma(_923, _915, _1013);
    float _1027 = _897 * _1001;
    float _1029 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1015);
    float _1031 = trunc(_1003);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    float _1037 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1039 = _851 * _1027;
    float _1041 = -_897;
    float _1043 = _1041 + 1.0;
    if (_995)
    {
        float _1045 = _983 * _973;
        _138 = _1045;
    }
    float _1047 = _138;
    int _1049 = ~_304;
    int _1051 = _1049 + 1;
    float _1053 = fma(_1029, _1037, _799);
    float _1055 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1039);
    bool _1057 = !_330;
    int _1059 = _1057 ? _1019 : (-1);
    float _1061 = _849 * _1027;
    float _1063 = _857 * _1027;
    int _1065 = _1059 >> 31;
    float _1067 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1061);
    int _1069 = ~_827;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    float _1075 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1063);
    int _1077 = _1051 * int(_1035);
    int _1079 = _1077 + _543;
    int _1081 = _1065 & 3;
    float _1083 = fma(_875, _997, _1067);
    int _1085 = _1073;
    if (!_837)
    {
        int _1087 = ~_827;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = fma(_879, _997, _1075);
    float _1095 = float(uint(_1079));
    float _1097 = fma(_733, _977, _1083);
    int _1099 = _1059 + _1081;
    float _1101 = fma(_877, _997, _1055);
    int _1103 = abs(_789);
    float _1105 = as_type<float>(_340) * _1095;
    int _1107 = _1099 >> 2;
    float _1109 = fma(_899, _977, _1101);
    int _1111 = ~_953;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = trunc(_1105);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    int _1123 = _1107 << 4;
    int _1125 = _1123 + 368;
    float _1127 = fma(_901, _977, _1093);
    int _1129 = _1115;
    if (!_829)
    {
        int _1131 = ~_953;
        int _1133 = _1131 + 1;
        _1129 = _1133;
    }
    int _1135 = _1129;
    float _1137 = _855 + 0.5;
    uint _1139 = uint(int(uint(_1125) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[int(_1149)][_1151];
    float _1155 = float(_777);
    float _1157 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1097);
    float _1159 = float(_1103);
    float _1161 = _1053 + 0.5;
    int _1163 = _1059 & 3;
    bool _1165 = _1163 != 0;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _747 + _1167;
    int _1171 = _1059 & 3;
    bool _1173 = _1171 != 0;
    float _1175 = _1159 * _1155;
    int _1177 = _1165 ? 0 : 1;
    float _1179 = in.m_63.x;
    float _1181 = in.m_63.y;
    float _1183 = in.m_63.z;
    bool _1185 = uint(_1171) > 1u;
    float _1187 = _1175 * (-2.0);
    int _1189 = int(_1035) + int(_1121);
    float _1191 = in.m_65.x;
    float _1193 = in.m_65.y;
    float _1195 = in.m_65.z;
    int _1197 = ~_304;
    int _1199 = _1197 + 1;
    int _1201 = _1125 + 8;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    uint _1205 = uint(int(uint(int(_1203)) >> uint(2)));
    int _1207 = int(_1203) & 3;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[int(_1205)][_1207];
    int _1211 = int(_1203) + 1;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    int _1215 = _1211 & 3;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[int(_1213)][_1215];
    int _1219 = ~_1177;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    float _1225 = fma(_745, _1187, _745);
    bool _1227 = !_1173;
    int _1229 = _1227 ? 0 : 1;
    int _1231 = _1199 * _1189;
    int _1233 = _1231 + _543;
    bool _1235 = uint(_1171) >= 2u;
    out.m_67.x = _1161;
    out.m_67.y = _1137;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1239 = _791 + _1237;
    int _1241 = _1223;
    if (!_1185)
    {
        int _1243 = ~_1177;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _757 + _1249;
    bool _1253 = uint(_1233) >= uint(_304);
    float _1255 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1257 = !_1253;
    int _1259 = _1257 ? 0 : (-1);
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    bool _1263 = _1171 != 3;
    float _1265 = _1157 * _1179;
    int _1267 = abs(_1247);
    float _1269 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1261);
    int _1271 = abs(_1229);
    float _1273 = fma(_1187, _1193, _1193);
    int _1275 = _1235 ? 0 : 1;
    float _1277 = _246 * _1265;
    int _1279 = ~_1189;
    int _1281 = _1279 + _1259;
    int _1283 = _1281 + 1;
    int _1285 = ~_1275;
    int _1287 = _1285 + 1;
    int _1289 = _1287 + 1;
    int _1291 = _304 * _1283;
    int _1293 = _1291 + _543;
    bool _1295 = _1171 != 3;
    float _1297 = _1169 * _1169;
    int _1299 = _1289;
    float _1301 = _1195;
    if (_1263)
    {
        int _1303 = ~_1275;
        int _1305 = _1303 + 1;
        _1299 = _1305;
    }
    int _1307 = _1299;
    int _1309 = ~_1267;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1239, _1239, _1297);
    bool _1317 = !_1295;
    int _1319 = _1317 ? 0 : (-1);
    int _1321 = abs(_1307);
    int _1323 = _1313 * as_type<int>(_1153);
    int _1325 = ~_1271;
    int _1327 = _1325 + 1;
    int _1329 = _1327 + 1;
    int _1331 = abs(_1319);
    int _1333 = _1329 * as_type<int>(_1145);
    int _1335 = _1333 + _1323;
    bool _1337 = !_471;
    int _1339 = _1337 ? 0 : 1;
    int _1341 = ~_1321;
    int _1343 = _1341 + 1;
    int _1345 = _1343 + 1;
    float _1347 = fma(_1251, _1251, _1315);
    bool _1349 = !_697;
    int _1351 = _1349 ? 0 : 1;
    int _1353 = ~_1331;
    int _1355 = _1353 + 1;
    int _1357 = _1355 + 1;
    int _1359 = _1345 * as_type<int>(_1209);
    int _1361 = _1359 + _1335;
    int _1363 = abs(_1339);
    float _1365 = rsqrt(_1347);
    int _1367 = abs(_1351);
    int _1369 = _1357 * as_type<int>(_1217);
    int _1371 = _1369 + _1361;
    float _1373 = _537 + (-0.5);
    bool _1375 = _1269 >= 0.0;
    float _1377 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1379 = ~_1363;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1273);
    float _1387 = float(_1367);
    float _1389 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1391 = float(_1135);
    int _1393 = _1371 * _1383;
    bool _1395 = !_330;
    float _1397 = _1395 ? as_type<float>(_1293) : as_type<float>(0xffffffffu /* nan */);
    float _1399 = _1389 * _1365;
    float _1401 = _158 + (-0.5);
    float _1403 = _1387 * _1391;
    float _1405 = _825 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    int _1409 = as_type<int>(_1397) * _1363;
    int _1411 = _1409 + _1393;
    float _1413 = _1169 * _1399;
    float _1415 = _1397;
    float _1417 = _1413;
    if (_1375)
    {
        _1415 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1419 = _1415;
    float _1421 = fma(_1225, _1047, _1385);
    float _1423 = _1239 * _1399;
    float _1425 = -_1413;
    float _1427 = _1169 + _1425;
    int _1429 = as_type<int>(_1419);
    if (_1375)
    {
        float _1431 = _1419 * 5.0;
        _1429 = as_type<int>(_1431);
    }
    int _1433 = _1429;
    float _1435 = float(_1411);
    float _1437 = -_1423;
    float _1439 = _1239 + _1437;
    float _1441 = _1427 * _1427;
    bool _1443 = !_705;
    int _1445 = _1443 ? 0 : 1;
    if (_1375)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4705 = as_type<float>(_1433);
        out.gl_Position.z = _4705;
    }
    float _1447 = fma(_1439, _1439, _1441);
    int _1449 = abs(_1445);
    out.m_69.x = _1435;
    if (_1375)
    {
        out.m_47.x = 0.0;
    }
    if (_1375)
    {
        return out;
    }
    float _1451 = -_1413;
    float _1453 = _747 + _1451;
    float _1455 = _1403 * (-2.0);
    float _1457 = _1251 * _1399;
    float _1459 = -_1423;
    float _1461 = _791 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1465 = _1453 + _1463;
    float _1467 = float(_1449);
    float _1469 = fma(_1455, _1191, _1191);
    float _1471 = float(_1091);
    float _1473 = -_1457;
    float _1475 = _757 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1461 + _1477;
    float _1481 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1483 = -_1457;
    float _1485 = _1251 + _1483;
    float _1487 = fma(_719, _1455, _719);
    float _1489 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1469);
    float _1491 = _1421 * 0.15915493667125701904296875;
    float _1493 = _1467 * _1471;
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1497 = _1475 + _1495;
    float _1499 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1481);
    float _1501 = fma(_1485, _1485, _1447);
    float _1503 = fma(_1487, _1047, _1489);
    float _1505 = _1493 * (-2.0);
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1499);
    float _1509 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1127);
    float _1511 = _1503 * 0.15915493667125701904296875;
    float _1513 = sqrt(_1501);
    float _1515 = fma(_1505, _1195, _1195);
    float _1517 = _595 + (-0.5);
    bool _1519 = _1507 >= 0.0;
    float _1521 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1109);
    float _1523 = _1509 * _1183;
    float _1525 = fma(_739, _1505, _739);
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1515);
    float _1529 = _1491 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1521 * _1181;
    float _1535 = fma(_1525, _1047, _1527);
    float _1537 = _1407 * 0.100000001490116119384765625;
    float _1539 = _246 * _1533;
    float _1541 = _1535 * 0.15915493667125701904296875;
    if (_1519)
    {
        _1301 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1543 = _1301;
    float _1545 = _1365 * _1513;
    float _1547 = _1491 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    int _1551 = as_type<int>(_1543);
    float _1553 = _1545;
    if (_1519)
    {
        out.m_47.x = 0.0;
    }
    float _1555 = fma(_1023, _1537, _1023);
    if (_1519)
    {
        float _1557 = _1543 * 5.0;
        _1551 = as_type<int>(_1557);
    }
    int _1559 = _1551;
    float _1561 = fma(_1025, _1537, _1025);
    float _1563 = _1511 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    if (_1519)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4910 = as_type<float>(_1559);
        out.gl_Position.z = _4910;
    }
    float _1567 = _1511 * 6.283185482025146484375;
    float _1569 = cos(_1567);
    float _1571 = _1541 * 6.283185482025146484375;
    float _1573 = sin(_1571);
    if (_1519)
    {
        return out;
    }
    float _1575 = _1541 * 6.283185482025146484375;
    float _1577 = cos(_1575);
    float _1579 = _1539 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1581 = _246 * _1523;
    float _1583 = _1377 * _1545;
    float _1585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1555);
    float _1587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1561);
    float _1589 = _1545 * _1579;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1593 = fma(_1537, _919, _919);
    float _1595 = _1585 * _1583;
    float _1597 = _1587 * _1589;
    float _1599 = _1565 * _1531;
    float _1601 = _1569 * _1549;
    float _1603 = _1545 * _1591;
    float _1605 = _1565 * _1549;
    float _1607 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1593);
    float _1609 = _1569 * _1577;
    float _1611 = _1565 * _1577;
    float _1613 = _1549 * _1577;
    float _1615 = _1531 * _1577;
    float _1617 = _1569 * _1531;
    float _1619 = fma(_1573, _1601, _1599);
    float _1621 = _1609 * _1597;
    float _1623 = _1607 * _1603;
    float _1625 = -_1605;
    float _1627 = fma(_1573, _1617, _1625);
    float _1629 = -_1597;
    float _1631 = _1573 * _1629;
    float _1633 = fma(_1619, _1595, _1621);
    float _1635 = -_1617;
    float _1637 = fma(_1573, _1605, _1635);
    float _1639 = _1611 * _1597;
    float _1641 = fma(_1613, _1595, _1631);
    float _1643 = fma(_1627, _1623, _1633);
    float _1645 = fma(_1573, _1599, _1601);
    float _1647 = fma(_1637, _1595, _1639);
    float _1649 = fma(_1615, _1623, _1641);
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1653 = fma(_1645, _1623, _1647);
    float _1655 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1657 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1651);
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1661 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1663 = isnan(0.5);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1669 = _1665 || _1667;
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1655);
    float _1673 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1657);
    float _1675 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1659);
    bool _1677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1679 = isnan(0.5);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1685 = _1681 || _1683;
    float _1687 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1671);
    float _1689 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1691 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1675);
    float _1693 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1695 = _757 + _1689;
    float _1697 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1699 = _791 + _1693;
    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1703 = _1695 + _1701;
    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1707 = _1699 + _1705;
    float _1709 = _1703 * _1703;
    float _1711 = fma(_1707, _1707, _1709);
    float _1713 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1715 = sqrt(_1711);
    float _1717 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1713);
    float _1719 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1723 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1725 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1727 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1723);
    float _1729 = _747 + _1697;
    float _1731 = 1.0 / _1725;
    float _1733 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1735 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1737 = _1733 + _1725;
    float _1739 = _1653;
    float _1741 = _1733;
    float _1743 = _1699;
    float _1745 = _1697;
    if (!_1735)
    {
        _1739 = _1695;
    }
    float _1747 = _1739;
    float _1749 = _1747;
    if (!_1735)
    {
        _1741 = _1729;
    }
    float _1751 = _1741;
    bool _1753 = !_1735;
    float _1755 = _1751;
    if (!_1753)
    {
        float _1757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1761 = _1715 + _1759;
        float _1763 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1765 = _1761 * _1757;
        float _1767 = rsqrt(_1711);
        float _1769 = _1765 * 0.15915493667125701904296875;
        float _1771 = _1769 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1769 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        float _1779 = _1773 + (-1.0);
        float _1781 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = fma(_1777, _1763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1785 = fma(_1729, _1773, _1781);
        float _1787 = _1767 * _1783;
        float _1789 = fma(_1707, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1791 = fma(_1703, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1743 = _1789;
        _1755 = _1785;
        _1749 = _1791;
        _1745 = _1763;
    }
    float _1793 = _1743;
    float _1795 = _1755;
    float _1797 = _1749;
    float _1799 = _1745;
    float _1801 = -_1423;
    float _1803 = _1801 + _1793;
    float _1805 = -_1413;
    float _1807 = _1805 + _1795;
    float _1809 = -_1457;
    float _1811 = _1809 + _1797;
    float _1813 = _1737 * _1731;
    float _1815 = _1813 * 0.5;
    float _1817 = _1799;
    float _1819 = _1803;
    float _1821 = _1807;
    if (_1685)
    {
        _1817 = 1.0;
    }
    float _1823 = _1817;
    float _1825 = _1823;
    if (_1669)
    {
        _1417 = _1803;
    }
    float _1827 = _1417;
    float _1829 = _1827;
    if (_1669)
    {
        _1819 = _1807;
    }
    float _1831 = _1819;
    float _1833 = _1831;
    if (_1669)
    {
        _1821 = _1811;
    }
    float _1835 = _1821;
    float _1837 = _1835;
    if (!_1669)
    {
        float _1839 = _1465 * _1465;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1843 = -_757;
        float _1845 = _1843 + _1797;
        float _1847 = -_747;
        float _1849 = _1847 + _1795;
        float _1851 = fma(_1479, _1479, _1839);
        float _1853 = fma(_1497, _1497, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1857 = sqrt(_1853);
        float _1859 = 1.0 / _1545;
        float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1841;
        float _1867 = _1865 * _1859;
        float _1869 = -_791;
        float _1871 = _1869 + _1793;
        float _1873 = _1861 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1871, _1873, _1461);
        float _1879 = fma(_1849, _1873, _1453);
        float _1881 = fma(_1861, _1875, _1475);
        _1833 = _1879;
        _1829 = _1877;
        _1837 = _1881;
    }
    float _1883 = _1833;
    float _1885 = _1829;
    float _1887 = _1837;
    if (!_1685)
    {
        float _1889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1897 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1895);
        float _1899 = _1891 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1893 * 0.15915493667125701904296875;
        float _1905 = _1891 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        float _1909 = 1.0 / _1901;
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1907 * _1909;
        float _1917 = _1903 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = _1913 * _1915;
        float _1923 = 1.0 / _1897;
        float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1927 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1925;
        float _1929 = 1.0 / _1921;
        float _1931 = 1.0 / _1927;
        float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1935 = _1923 * _1933;
        float _1937 = _1919 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1941 = fma(_1937, _1935, _1939);
        float _1943 = _1941 * _1931;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1553 = _1929;
        _1825 = _1945;
    }
    float _1947 = _1553;
    float _1949 = _1825;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1953 = _1883 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1957 = _1885 + _1955;
    float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1961 = _1887 + _1959;
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1953 * _1953;
    float _1967 = fma(_1957, _1957, _1965);
    float _1969 = fma(_1961, _1961, _1967);
    float _1971 = rsqrt(_1969);
    float _1973 = sqrt(_1969);
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1977 = _1957 * _1975;
    float _1979 = _1961 * _1975;
    float _1981 = _1977 * _1977;
    float _1983 = _1979 * _1979;
    float _1985 = _1981 + _1983;
    float _1987 = sqrt(_1985);
    bool _1989 = _1987 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1993 = _1987 + _1991;
    float _1995 = _1961;
    float _1997 = _1985;
    float _1999 = _1993;
    float _2001 = _1947;
    float _2003 = _1975;
    if (_1989)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (_1989)
    {
        float _2009 = rsqrt(_1985);
        _1997 = _2009;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1989)
    {
        float _2015 = _1993 * _2007;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1989)
    {
        float _2019 = _2017 * 0.15915493667125701904296875;
        _2001 = _2019;
    }
    float _2021 = _2001;
    float _2023 = _2007;
    float _2025 = _2021;
    if (_1989)
    {
        float _2027 = _2021 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        _2023 = _2029;
    }
    float _2031 = _2023;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2035 = precise::max(0.0, _2033);
    float _2037 = _1965;
    float _2039 = _2035;
    if (_1989)
    {
        float _2041 = _2021 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        _2037 = _2043;
    }
    float _2045 = _2037;
    float _2047 = -_1975;
    float _2049 = -_2035;
    float _2051 = fma(_1953, _2047, _2049);
    float _2053 = _2051;
    if (_1989)
    {
        float _2055 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2039 = _2055;
    }
    float _2057 = _2039;
    float _2059 = _2031;
    float _2061 = _2057;
    if (_1989)
    {
        float _2063 = fma(_2031, _2057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = _2065;
    float _2069 = _2045;
    if (_1989)
    {
        float _2071 = _2045 + (-1.0);
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _2073;
    if (_1989)
    {
        float _2077 = _2011 * _2065;
        _2003 = _2077;
    }
    float _2079 = _2003;
    if (!_1989)
    {
        _2067 = _1977;
    }
    float _2081 = _2067;
    float _2083 = _2081;
    if (_1989)
    {
        float _2085 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2085;
    }
    float _2087 = _2025;
    if (_1989)
    {
        float _2089 = _1977 * _2079;
        _2083 = _2089;
    }
    float _2091 = _2083;
    if (!_1989)
    {
        _2075 = _1979;
    }
    float _2093 = _2075;
    float _2095 = _2093;
    if (_1989)
    {
        float _2097 = _1979 * _2079;
        _2095 = _2097;
    }
    float _2099 = _2095;
    if (!_1989)
    {
        _2013 = _1981;
    }
    float _2101 = _2013;
    float _2103 = _2101;
    if (_1989)
    {
        float _2105 = fma(_2051, _2045, _2087);
        _2053 = _2105;
    }
    float _2107 = _2053;
    if (_1989)
    {
        float _2109 = _2091 * _2091;
        _2103 = _2109;
    }
    float _2111 = _2103;
    if (!_1989)
    {
        _2069 = _1983;
    }
    float _2113 = _2069;
    float _2115 = _2113;
    if (_1989)
    {
        float _2117 = _2099 * _2099;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2123 = fma(_2107, _2107, _2111);
    float _2125 = _2123 + _2119;
    float _2127 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2121);
    float _2129 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2133 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2131);
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = rsqrt(_2125);
    float _2139 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2127);
    float _2141 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2143 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2145 = -_2135;
    float _2147 = _2145 + 1.0;
    float _2149 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2141);
    float _2153 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2143);
    float _2155 = abs(_2147);
    float _2157 = log2(_2155);
    float _2159 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2161 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2151);
    float _2163 = _2153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2165 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2167 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2173 = _2137 * _2091;
    float _2175 = _2137 * _2107;
    float _2177 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2165);
    float _2179 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2171);
    float _2181 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2183 = _2137 * _2099;
    float _2185 = -_2167;
    float _2187 = fma(_2185, _1963, 1.0);
    float _2189 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2191 = -_2181;
    float _2193 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2191);
    float _2195 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2179);
    float _2197 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2199 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2201 = -_2183;
    float _2203 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2193);
    float _2205 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2195);
    float _2207 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2209 = log2(_2187);
    float _2211 = fma(_2203, -0.5, 0.5);
    float _2213 = fma(_2203, 0.5, 0.5);
    float _2215 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2207);
    float _2217 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2199);
    float _2219 = _2175 + 1.0;
    float _2221 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2215);
    float _2223 = 1.0 / _2205;
    float _2225 = fma(_2213, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2227 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2217);
    float _2229 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2221);
    float _2231 = fma(_2213, _2225, -0.212114393711090087890625);
    float _2233 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2227);
    float _2235 = exp2(_2197);
    float _2237 = _2209 * 0.693147182464599609375;
    float _2239 = fma(_2213, _2231, 1.570728778839111328125);
    float _2241 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2243 = sqrt(_2211);
    float _2245 = _2229 * _2223;
    float _2247 = _2233 * _2223;
    float _2249 = fma(_2245, 0.5, 0.5);
    float _2251 = fma(_2247, -0.5, 0.5);
    float _2253 = -_2175;
    float _2255 = fma(_2235, _2219, _2253);
    float3 _6020 = float3(_2249, _2251, _2241);
    float _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6020, float3(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6020, float3(0.0), isnan(_6020)), level(0.0)).x;
    float _2259 = fma(_2255, 0.5, 0.5);
    float _2261 = _2243 * 0.636619746685028076171875;
    float _2263 = -_2239;
    float _2265 = fma(_2261, _2263, 1.0);
    float3 _6041 = float3(_2249, _2251, _2241);
    float4 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6041, float3(0.0), isnan(_6041)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6041, float3(0.0), isnan(_6041)), level(0.0)).xyzw;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _2268.w;
    float2 _6058 = float2(_2265, _2259);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6058, float2(0.0), isnan(_6058)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6058, float2(0.0), isnan(_6058)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = in.m_71.x;
    float _2290 = in.m_71.y;
    bool _2292 = _1561 != 0.0;
    bool _2294 = isnan(_1561);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan(0.0);
    bool _2300 = _2296 || _2298;
    float _2302 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _1885;
    out.m_73.y = _1883;
    out.m_73.z = _1887;
    bool _2306 = _1555 == 0.0;
    bool _2308 = !_2300;
    bool _2310 = _2306 && _2308;
    float _2312 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2314 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2316 = _1593 == 0.0;
    bool _2318 = _2316 && _2310;
    float _2320 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2322 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2312);
    float _2324 = -_1573;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2328 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2304);
    float _2330 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    float _2332 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2328);
    float _2334 = _923 * _2290;
    float _2336 = _813 * _2290;
    float _2338 = in.m_71.z;
    float _2340 = -_2334;
    float _2342 = fma(_813, _2288, _2340);
    float _2344 = fma(_923, _2288, _2336);
    float _2346 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2348 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2350 = _2342;
    float _2352 = _2344;
    float _2354 = _2233;
    float _2356 = _2229;
    if (!_2318)
    {
        float _2358 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2342);
        _2350 = _2358;
    }
    float _2360 = _2350;
    if (!_2318)
    {
        float _2362 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2344);
        _2352 = _2362;
    }
    float _2364 = _2352;
    float _2366 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2346);
    float _2368 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2348);
    float _2370 = -_1573;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2320);
    float _2374 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2376 = -_1573;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2380 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2368);
    float _2382 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2384 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2386 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2378);
    float _2388 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2372);
    float _2390 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2366);
    float _2392 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2384);
    float _2394 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2396 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2322);
    float _2398 = _2386 * _2364;
    float _2400 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2382);
    float _2402 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2392);
    float _2404 = _2338;
    if (!_2318)
    {
        float _2406 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = exp2(_2394);
    float _2412 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2374);
    float _2414 = _2330 * _2364;
    float _2416 = _2388 * _2364;
    float _2418 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2420 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2412);
    float _2422 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2332);
    float _2424 = fma(_2390, _2360, _2398);
    float _2426 = fma(_2396, _2360, _2414);
    float _2428 = fma(_2380, _2360, _2416);
    float _2430 = _2422 + _2205;
    float _2432 = _2229 + _2205;
    float _2434 = _2205 * 0.5;
    float _2436 = fma(_2420, _2408, _2424);
    float _2438 = fma(_2418, _2408, _2426);
    float _2440 = fma(_2402, _2408, _2428);
    float _2442 = -_2410;
    float _2444 = _2442 + 1.0;
    float _2446 = _2430 * 0.5;
    float _2448 = _2432 * 0.5;
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2452 = fma(_2233, -0.5, _2434);
    out.m_75.x = _2436;
    out.m_75.y = _2438;
    out.m_75.z = _2440;
    bool _2454 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2456 = isnan(_1973);
    bool _2458 = _2454 || _2456;
    bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2462 = _2458 || _2460;
    float _2464 = -_2450;
    float _2466 = _2464 + 1.0;
    out.m_77.x = _2448;
    out.m_77.y = _2452;
    out.m_77.z = _2446;
    out.m_77.w = _2205;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2233;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _2205;
    if (!_2462)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2468 = _2354;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2462)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2474 = _2356;
    float _2476 = _2450 * _2257;
    float _2478 = _2276 * _2476;
    float _2480 = _2276 * _2466;
    float _2482 = _2286 * _2476;
    float _2484 = fma(_2282, _2478, _2270);
    float _2486 = fma(_2284, _2478, _2272);
    float _2488 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2490 = fma(_2276, _2482, _2274);
    float _2492 = _2478;
    float _2494 = _2474;
    float _2496 = _2474;
    if (!_2462)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _2492;
    out.m_79.x = _2484;
    out.m_79.y = _2486;
    out.m_79.z = _2490;
    out.m_79.w = _2480;
    bool _2500 = !_2462;
    float _2502 = _2498;
    float _2504 = _2498;
    if (!_2500)
    {
        bool _2506 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2508 = isnan(_1973);
        bool _2510 = _2506 || _2508;
        bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2514 = _2510 || _2512;
        if (!_2514)
        {
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2518 = _1973 + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2520;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2532 = 1.0 / _2522;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2538 = _2518 * _2532;
            float _2540 = precise::clamp(_2538, 0.0, 1.0);
            float _2542 = fma(_2540, _2526, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2540, _2530, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2546 = fma(_2540, _2536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2496 = _2544;
            _2472 = _2542;
            _2504 = _2546;
            _2548 = true;
        }
        else
        {
            bool _2550 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2552 = isnan(_1973);
            bool _2554 = _2550 || _2552;
            bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2558 = _2554 || _2556;
            if (!_2558)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2560 = _2470;
            _2472 = _2560;
            if (!_2558)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2562 = _2494;
            _2496 = _2562;
            if (!_2558)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2564 = _2502;
            bool _2566 = !_2558;
            _2504 = _2564;
            if (!_2566)
            {
                bool _2568 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2570 = isnan(_1973);
                bool _2572 = _2568 || _2570;
                bool _2574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2576 = _2572 || _2574;
                if (!_2576)
                {
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2580 = _1973 + _2578;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2584 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2582;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2594 = 1.0 / _2584;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2600 = _2580 * _2594;
                    float _2602 = precise::clamp(_2600, 0.0, 1.0);
                    float _2604 = fma(_2602, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2606 = fma(_2602, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2496 = _2606;
                    _2472 = _2604;
                    _2504 = _2608;
                    _2548 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2548 = false;
    float _2610 = _2496;
    float _2612 = _2472;
    float _2614 = _2504;
    float _2616 = _2488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = 0.0;
    float _2618 = _2610 * 0.586610972881317138671875;
    bool _2620 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _2616;
    float _2622 = fma(_2612, 0.298911988735198974609375, _2618);
    bool _2624 = _1949 > 0.0;
    bool _2626 = isnan(_1949);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan(0.0);
    bool _2632 = _2628 || _2630;
    float _2634 = fma(_2614, 0.114477999508380889892578125, _2622);
    float _2636 = -_2634;
    float _2638 = _2636 + _2612;
    float _2640 = -_2634;
    float _2642 = _2640 + _2610;
    float _2644 = -_2634;
    float _2646 = _2644 + _2614;
    float _2648 = fma(_2638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2650 = fma(_2642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2652 = fma(_2646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    bool _2654 = !_2620;
    if (!_2654)
    {
        float _2656 = -_1883;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2660 = -_1885;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2664 = -_1887;
        float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2668 = _2658 * _2658;
        float _2670 = fma(_2662, _2662, _2668);
        float _2672 = fma(_2666, _2666, _2670);
        float _2674 = sqrt(_2672);
        float _2676 = rsqrt(_2672);
        float _2678 = -_2674;
        float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2684 = precise::clamp(_2682, 0.0, 1.0);
        float _2686 = _2662 * _2676;
        float _2688 = _2658 * _2676;
        float _2690 = abs(_2684);
        float _2692 = log2(_2690);
        float _2694 = _2666 * _2676;
        float _2696 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2698 = _2438 * _2688;
        float _2700 = -_2688;
        float _2702 = -_2696;
        float _2704 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2702);
        float _2706 = fma(_2436, _2686, _2698);
        float _2708 = -_2694;
        float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2704);
        float _2712 = fma(_2440, _2694, _2706);
        float _2714 = precise::clamp(_2712, 0.0, 1.0);
        float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2718 = _2710 + _2716;
        float _2720 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2722 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = exp2(_2720);
        float _2728 = _2726 * _2724;
        float _2730 = _2714 * _2728;
        float _2732 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2736 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2732;
        out.m_81.y = _2734;
        out.m_81.z = _2736;
    }
    out.m_83.x = _2648;
    out.m_83.y = _2650;
    out.m_83.z = _2652;
    if (_2632)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2738;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2548 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2795 = as_type<float>(_118);
        out.gl_Position.z = _2795;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2865 = as_type<float>(_156);
        out.gl_Position.z = _2865;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.x;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _162 = _136 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _170 = _168 != 0;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _162 * _160;
    float _178 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _180 = _178 * 6.283185482025146484375;
    float _182 = floor(_178);
    float _184 = _180 * 0.15915493667125701904296875;
    bool _186 = !_166;
    int _188 = _186 ? 0 : 1;
    int _190 = abs(_188);
    float _192 = _184 * 6.283185482025146484375;
    float _194 = cos(_192);
    bool _196 = !_174;
    int _198 = _196 ? 0 : 1;
    bool _200 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _202 = abs(_198);
    float _204 = -_182;
    float _206 = _178 + _204;
    bool _208 = !_170;
    int _210 = _208 ? 0 : 1;
    float _212 = float(_190);
    int _214 = abs(_210);
    float _216 = -_206;
    float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _220 = fma(_194, 0.5, 0.5);
    float _222 = abs(_218);
    float _224 = _212 * _222;
    bool _226 = _206 < 0.5;
    float _228 = float(_226);
    float _230 = float(_202);
    float _232 = -_220;
    float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _236 = float(_214);
    float _238 = -_228;
    float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _242 = fma(_230, _234, _224);
    float _244 = abs(_240);
    float _246 = fma(_236, _244, _242);
    bool _248 = !_200;
    float _264;
    if (!_248)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_102);
        float _270 = 1.0 / _268;
        float _272 = _136 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _278 = int(_276);
    float _280 = in.m_44.x;
    float _282 = in.m_44.y;
    float _284 = in.m_44.z;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = _274 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _274 + _290;
    float _294 = in.m_53.x;
    float _296 = in.m_53.y;
    float _298 = in.m_53.z;
    float _300 = in.m_53.w;
    float _302 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _304 = int(_302);
    float _306 = in.m_55.y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _308;
    float _312 = float(_278);
    float _314 = 1.0 / _312;
    float _316 = float(uint(_304));
    int _318 = ~_304;
    int _320 = _318 + 1;
    int _322 = ~_304;
    int _324 = _322 + 1;
    float _326 = _282 * _296;
    float _328 = 1.0 / _316;
    bool _330 = _304 == 0;
    float _332 = fma(_280, _294, _326);
    float _334 = _314 * _136;
    float _336 = trunc(_334);
    int _338 = int(_336);
    int _340 = as_type<int>(_328) + (-2);
    float _342 = float(uint(_338));
    float _344 = as_type<float>(_340) * _342;
    float _346 = trunc(_344);
    float _348 = precise::max(_346, 0.0);
    uint _351 = uint(_348);
    float _353 = float(_304);
    int _355 = _320 * int(_351);
    int _357 = _355 + _338;
    float _359 = float(uint(_357));
    float _361 = as_type<float>(_340) * _359;
    int _363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _365 = _363 != 0;
    float _367 = trunc(_361);
    float _369 = precise::max(_367, 0.0);
    uint _371 = uint(_369);
    bool _373 = !_365;
    float _375 = _373 ? 7.345489978790283203125 : 1.0;
    float _377 = _375 * _158;
    float _379 = floor(_377);
    int _381 = int(_351) + int(_371);
    float _383 = float(_338);
    int _385 = _324 * _381;
    int _387 = _385 + _338;
    bool _389 = _383 >= _353;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = isnan(_353);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = float(_102);
    float _403 = _353 * _136;
    bool _405 = uint(_387) >= uint(_304);
    float _407 = trunc(_399);
    int _409 = int(_407);
    float _411 = -_379;
    float _413 = _377 + _411;
    bool _415 = !_405;
    int _417 = _415 ? 0 : (-1);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _429 = _427 != 0;
    float _431 = _413 * _353;
    int _433 = ~_381;
    int _435 = _433 + _417;
    int _437 = _435 + 1;
    float _439 = 1.0 / _401;
    int _441 = _304 + (-1);
    int _443 = _304 * _437;
    int _445 = _443 + _338;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    int _455 = ~_409;
    int _457 = _455 + 1;
    int _459 = _457 + 1;
    float _461 = trunc(_431);
    int _463 = int(_461);
    bool _465 = !_330;
    int _467 = _465 ? _445 : (-1);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _471 = _469 != 0;
    int _473 = _467 * _459;
    float _475 = _403 * _439;
    bool _477 = !_425;
    int _479 = _477 ? 0 : 1;
    int _481 = _409 * _441;
    int _483 = _481 + _473;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _487 = _485 != 0;
    float _489 = in.m_57.x;
    float _491 = in.m_57.y;
    float _493 = in.m_57.z;
    float _495 = in.m_57.w;
    int _497 = abs(_479);
    float _499 = trunc(_475);
    int _501 = int(_499);
    bool _503 = !_449;
    int _505 = _503 ? 0 : 1;
    float _507 = in.m_59.x;
    float _509 = in.m_59.y;
    float _511 = in.m_59.z;
    float _513 = in.m_59.w;
    int _515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _517 = _515 != 0;
    int _519 = _483 * _497;
    bool _521 = !_421;
    int _523 = _521 ? 0 : 1;
    bool _525 = !_429;
    int _527 = _525 ? 0 : 1;
    int _529 = abs(_523);
    int _531 = abs(_505);
    bool _533 = !_517;
    int _535 = _533 ? 0 : 1;
    float _537 = in.m_51.y;
    int _539 = abs(_527);
    int _541 = _463 * _531;
    int _543 = _541 + _338;
    int _545 = abs(_535);
    int _547 = _501 * _529;
    int _549 = _547 + _519;
    float _551 = _282 * _491;
    int _553 = _543 * _539;
    int _555 = _553 + _549;
    float _557 = _282 * _509;
    float _559 = in.m_55.x;
    int _561 = _463 * _545;
    int _563 = _561 + _555;
    float _565 = fma(_280, _507, _557);
    float _567 = _158 * 2.0;
    float _569 = fma(_280, _489, _551);
    float _571 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _573 = float(uint(_563));
    float _575 = floor(_567);
    bool _577 = _537 > 0.5;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _581 = _158 > 0.5;
    bool _583 = _581 && _487;
    float _585 = as_type<float>(_340) * _573;
    float _587 = -_306;
    float _589 = _587 + 1.0;
    float _591 = -_579;
    float _593 = fma(_571, 2.0, _591);
    float _595 = in.m_51.z;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _597;
    float _601 = trunc(_585);
    float _603 = precise::max(_601, 0.0);
    uint _605 = uint(_603);
    float _607 = _306;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[146].w;
    if (_453)
    {
        float _611 = _577 ? _589 : _306;
        _607 = _611;
    }
    float _613 = _607;
    float _615 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _617 = ~_304;
    int _619 = _617 + 1;
    float _621 = fma(_284, _511, _565);
    float _623 = _158 + _537;
    bool _625 = _575 > 0.0;
    float _627 = 1.0 / _599;
    bool _629 = _575 >= 0.0;
    bool _631 = isnan(_575);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _641 = _158 * 6.283185482025146484375;
    float _643 = _623 + (-1.0);
    float _645 = fma(_615, -2.0, _639);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _651 = _619 * int(_605);
    int _653 = _651 + _563;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _655;
    float _659 = _559;
    if (!_487)
    {
        _609 = _559;
    }
    float _661 = _609;
    float _663 = _661;
    if (_583)
    {
        float _665 = -_559;
        float _667 = _665 + 1.0;
        _659 = _667;
    }
    float _669 = _659;
    float _671 = _641 + _136;
    float _673 = float(uint(_653));
    float _675 = 1.0 / _657;
    float _677 = fma(_284, _493, _569);
    if (_487)
    {
        _663 = _669;
    }
    float _679 = _663;
    float _681 = as_type<float>(_340) * _673;
    float _683 = fma(_284, _298, _332);
    float _685 = fma(_671, 0.070000000298023223876953125, 6.283185482025146484375);
    float _687 = _537 * 2.0;
    float _689 = 1.0 / _649;
    float _691 = _292 * _627;
    float _693 = _158 + _595;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _705 = _703 != 0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _709 = _274 + _707;
    float _711 = _288 * _675;
    float _713 = trunc(_681);
    float _715 = precise::max(_713, 0.0);
    uint _717 = uint(_715);
    float _719 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _721 = ~_304;
    int _723 = _721 + 1;
    float _725 = _595 * 2.0;
    float _727 = _537 + _595;
    float _729 = _693 + (-1.0);
    float _731 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _733 = fma(_310, _711, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _735 = floor(_687);
    float _737 = _727 + (-1.0);
    float _739 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _741 = _709 * _689;
    float _743 = _641 * 0.15915493667125701904296875;
    float _745 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _747 = _677 + _495;
    int _749 = int(_605) + int(_717);
    float _751 = floor(_725);
    int _753 = _637 ? 0 : 1;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _757 = _621 + _513;
    int _759 = _723 * _749;
    int _761 = _759 + _563;
    int _763 = ~_753;
    int _765 = _763 + 1;
    int _767 = _765 + 1;
    float _769 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _755);
    int _771 = _767;
    if (!_625)
    {
        int _773 = ~_753;
        int _775 = _773 + 1;
        _771 = _775;
    }
    int _777 = _771;
    float _779 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _781 = log2(_779);
    bool _783 = uint(_761) >= uint(_304);
    float _785 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _769);
    bool _787 = !_701;
    int _789 = _787 ? 0 : 1;
    float _791 = _683 + _300;
    bool _793 = !_783;
    int _795 = _793 ? 0 : (-1);
    float _797 = -_136;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _593);
    bool _801 = _735 >= 0.0;
    bool _803 = isnan(_735);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.0);
    bool _809 = _805 || _807;
    float _811 = _743 * 6.283185482025146484375;
    float _813 = cos(_811);
    bool _815 = _751 >= 0.0;
    bool _817 = isnan(_751);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = _685 * 0.15915493667125701904296875;
    int _827 = _809 ? 0 : 1;
    bool _829 = _751 > 0.0;
    float _831 = _781 * _136;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _833;
    bool _837 = _735 > 0.0;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _839;
    float _843 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _645);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _845;
    float _849 = fma(_835, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _851 = fma(_841, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _853 = -_843;
    float _855 = fma(_785, _731, _853);
    float _857 = fma(_847, _691, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _871;
    float _875 = fma(_861, _741, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _877 = fma(_865, _741, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _879 = fma(_869, _741, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _881;
    float _885 = exp2(_831);
    bool _887 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _889 = isnan(_274);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = fma(_883, _711, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _901 = fma(_873, _711, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _903 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _905 = isnan(_274);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = in.m_61.x;
    float _917 = in.m_61.y;
    float _919 = in.m_61.z;
    float _921 = _743 * 6.283185482025146484375;
    float _923 = sin(_921);
    bool _925 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _927 = isnan(_274);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    bool _937 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _939 = isnan(_274);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _951 = 1.0 + _949;
    int _953 = _823 ? 0 : 1;
    bool _955 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    bool _961 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _963 = _959 || _961;
    float _965 = -_947;
    float _967 = _965 + 1.0;
    float _969 = -_885;
    float _971 = _969 + 1.0;
    float _973 = 1.0 / _951;
    float _975 = float(uint(_543));
    float _977 = _935 * _967;
    float _979 = -_935;
    float _981 = _979 + 1.0;
    float _983 = _963 ? _971 : 0.0;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _987 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _995 = _991 || _993;
    float _997 = _913 * _981;
    float _999 = -_913;
    float _1001 = _999 + 1.0;
    float _1003 = as_type<float>(_340) * _975;
    int _1005 = ~_749;
    int _1007 = _1005 + _795;
    int _1009 = _1007 + 1;
    float _1011 = _923 * _917;
    float _1013 = _813 * _917;
    float _1015 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    int _1017 = _304 * _1009;
    int _1019 = _1017 + _563;
    float _1021 = -_1011;
    float _1023 = fma(_813, _915, _1021);
    float _1025 = fma(_923, _915, _1013);
    float _1027 = _897 * _1001;
    float _1029 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1015);
    float _1031 = trunc(_1003);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    float _1037 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1039 = _851 * _1027;
    float _1041 = -_897;
    float _1043 = _1041 + 1.0;
    if (_995)
    {
        float _1045 = _983 * _973;
        _138 = _1045;
    }
    float _1047 = _138;
    int _1049 = ~_304;
    int _1051 = _1049 + 1;
    float _1053 = fma(_1029, _1037, _799);
    float _1055 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1039);
    bool _1057 = !_330;
    int _1059 = _1057 ? _1019 : (-1);
    float _1061 = _849 * _1027;
    float _1063 = _857 * _1027;
    int _1065 = _1059 >> 31;
    float _1067 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1061);
    int _1069 = ~_827;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    float _1075 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1063);
    int _1077 = _1051 * int(_1035);
    int _1079 = _1077 + _543;
    int _1081 = _1065 & 3;
    float _1083 = fma(_875, _997, _1067);
    int _1085 = _1073;
    if (!_837)
    {
        int _1087 = ~_827;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = fma(_879, _997, _1075);
    float _1095 = float(uint(_1079));
    float _1097 = fma(_733, _977, _1083);
    int _1099 = _1059 + _1081;
    float _1101 = fma(_877, _997, _1055);
    int _1103 = abs(_789);
    float _1105 = as_type<float>(_340) * _1095;
    int _1107 = _1099 >> 2;
    float _1109 = fma(_899, _977, _1101);
    int _1111 = ~_953;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = trunc(_1105);
    float _1119 = precise::max(_1117, 0.0);
    uint _1121 = uint(_1119);
    int _1123 = _1107 << 4;
    int _1125 = _1123 + 368;
    float _1127 = fma(_901, _977, _1093);
    int _1129 = _1115;
    if (!_829)
    {
        int _1131 = ~_953;
        int _1133 = _1131 + 1;
        _1129 = _1133;
    }
    int _1135 = _1129;
    float _1137 = _855 + 0.5;
    uint _1139 = uint(int(uint(_1125) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[int(_1149)][_1151];
    float _1155 = float(_777);
    float _1157 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1097);
    float _1159 = float(_1103);
    float _1161 = _1053 + 0.5;
    int _1163 = _1059 & 3;
    bool _1165 = _1163 != 0;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _747 + _1167;
    int _1171 = _1059 & 3;
    bool _1173 = _1171 != 0;
    float _1175 = _1159 * _1155;
    int _1177 = _1165 ? 0 : 1;
    float _1179 = in.m_63.x;
    float _1181 = in.m_63.y;
    float _1183 = in.m_63.z;
    bool _1185 = uint(_1171) > 1u;
    float _1187 = _1175 * (-2.0);
    int _1189 = int(_1035) + int(_1121);
    float _1191 = in.m_65.x;
    float _1193 = in.m_65.y;
    float _1195 = in.m_65.z;
    int _1197 = ~_304;
    int _1199 = _1197 + 1;
    int _1201 = _1125 + 8;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    uint _1205 = uint(int(uint(int(_1203)) >> uint(2)));
    int _1207 = int(_1203) & 3;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[int(_1205)][_1207];
    int _1211 = int(_1203) + 1;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    int _1215 = _1211 & 3;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[int(_1213)][_1215];
    int _1219 = ~_1177;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    float _1225 = fma(_745, _1187, _745);
    bool _1227 = !_1173;
    int _1229 = _1227 ? 0 : 1;
    int _1231 = _1199 * _1189;
    int _1233 = _1231 + _543;
    bool _1235 = uint(_1171) >= 2u;
    out.m_67.x = _1161;
    out.m_67.y = _1137;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1239 = _791 + _1237;
    int _1241 = _1223;
    if (!_1185)
    {
        int _1243 = ~_1177;
        int _1245 = _1243 + 1;
        _1241 = _1245;
    }
    int _1247 = _1241;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _757 + _1249;
    bool _1253 = uint(_1233) >= uint(_304);
    float _1255 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1257 = !_1253;
    int _1259 = _1257 ? 0 : (-1);
    float _1261 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    bool _1263 = _1171 != 3;
    float _1265 = _1157 * _1179;
    int _1267 = abs(_1247);
    float _1269 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1261);
    int _1271 = abs(_1229);
    float _1273 = fma(_1187, _1193, _1193);
    int _1275 = _1235 ? 0 : 1;
    float _1277 = _246 * _1265;
    int _1279 = ~_1189;
    int _1281 = _1279 + _1259;
    int _1283 = _1281 + 1;
    int _1285 = ~_1275;
    int _1287 = _1285 + 1;
    int _1289 = _1287 + 1;
    int _1291 = _304 * _1283;
    int _1293 = _1291 + _543;
    bool _1295 = _1171 != 3;
    float _1297 = _1169 * _1169;
    int _1299 = _1289;
    float _1301 = _1195;
    if (_1263)
    {
        int _1303 = ~_1275;
        int _1305 = _1303 + 1;
        _1299 = _1305;
    }
    int _1307 = _1299;
    int _1309 = ~_1267;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = fma(_1239, _1239, _1297);
    bool _1317 = !_1295;
    int _1319 = _1317 ? 0 : (-1);
    int _1321 = abs(_1307);
    int _1323 = _1313 * as_type<int>(_1153);
    int _1325 = ~_1271;
    int _1327 = _1325 + 1;
    int _1329 = _1327 + 1;
    int _1331 = abs(_1319);
    int _1333 = _1329 * as_type<int>(_1145);
    int _1335 = _1333 + _1323;
    bool _1337 = !_471;
    int _1339 = _1337 ? 0 : 1;
    int _1341 = ~_1321;
    int _1343 = _1341 + 1;
    int _1345 = _1343 + 1;
    float _1347 = fma(_1251, _1251, _1315);
    bool _1349 = !_697;
    int _1351 = _1349 ? 0 : 1;
    int _1353 = ~_1331;
    int _1355 = _1353 + 1;
    int _1357 = _1355 + 1;
    int _1359 = _1345 * as_type<int>(_1209);
    int _1361 = _1359 + _1335;
    int _1363 = abs(_1339);
    float _1365 = rsqrt(_1347);
    int _1367 = abs(_1351);
    int _1369 = _1357 * as_type<int>(_1217);
    int _1371 = _1369 + _1361;
    float _1373 = _537 + (-0.5);
    bool _1375 = _1269 >= 0.0;
    float _1377 = _1277 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1379 = ~_1363;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1273);
    float _1387 = float(_1367);
    float _1389 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1391 = float(_1135);
    int _1393 = _1371 * _1383;
    bool _1395 = !_330;
    float _1397 = _1395 ? as_type<float>(_1293) : as_type<float>(0xffffffffu /* nan */);
    float _1399 = _1389 * _1365;
    float _1401 = _158 + (-0.5);
    float _1403 = _1387 * _1391;
    float _1405 = _825 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    int _1409 = as_type<int>(_1397) * _1363;
    int _1411 = _1409 + _1393;
    float _1413 = _1169 * _1399;
    float _1415 = _1397;
    float _1417 = _1413;
    if (_1375)
    {
        _1415 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1419 = _1415;
    float _1421 = fma(_1225, _1047, _1385);
    float _1423 = _1239 * _1399;
    float _1425 = -_1413;
    float _1427 = _1169 + _1425;
    int _1429 = as_type<int>(_1419);
    if (_1375)
    {
        float _1431 = _1419 * 5.0;
        _1429 = as_type<int>(_1431);
    }
    int _1433 = _1429;
    float _1435 = float(_1411);
    float _1437 = -_1423;
    float _1439 = _1239 + _1437;
    float _1441 = _1427 * _1427;
    bool _1443 = !_705;
    int _1445 = _1443 ? 0 : 1;
    if (_1375)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4705 = as_type<float>(_1433);
        out.gl_Position.z = _4705;
    }
    float _1447 = fma(_1439, _1439, _1441);
    int _1449 = abs(_1445);
    out.m_69.x = _1435;
    if (_1375)
    {
        out.m_47.x = 0.0;
    }
    if (_1375)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1451 = -_1413;
    float _1453 = _747 + _1451;
    float _1455 = _1403 * (-2.0);
    float _1457 = _1251 * _1399;
    float _1459 = -_1423;
    float _1461 = _791 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1465 = _1453 + _1463;
    float _1467 = float(_1449);
    float _1469 = fma(_1455, _1191, _1191);
    float _1471 = float(_1091);
    float _1473 = -_1457;
    float _1475 = _757 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1461 + _1477;
    float _1481 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1483 = -_1457;
    float _1485 = _1251 + _1483;
    float _1487 = fma(_719, _1455, _719);
    float _1489 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1469);
    float _1491 = _1421 * 0.15915493667125701904296875;
    float _1493 = _1467 * _1471;
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1497 = _1475 + _1495;
    float _1499 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1481);
    float _1501 = fma(_1485, _1485, _1447);
    float _1503 = fma(_1487, _1047, _1489);
    float _1505 = _1493 * (-2.0);
    float _1507 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1499);
    float _1509 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1127);
    float _1511 = _1503 * 0.15915493667125701904296875;
    float _1513 = sqrt(_1501);
    float _1515 = fma(_1505, _1195, _1195);
    float _1517 = _595 + (-0.5);
    bool _1519 = _1507 >= 0.0;
    float _1521 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1109);
    float _1523 = _1509 * _1183;
    float _1525 = fma(_739, _1505, _739);
    float _1527 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1515);
    float _1529 = _1491 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1521 * _1181;
    float _1535 = fma(_1525, _1047, _1527);
    float _1537 = _1407 * 0.100000001490116119384765625;
    float _1539 = _246 * _1533;
    float _1541 = _1535 * 0.15915493667125701904296875;
    if (_1519)
    {
        _1301 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1543 = _1301;
    float _1545 = _1365 * _1513;
    float _1547 = _1491 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    int _1551 = as_type<int>(_1543);
    float _1553 = _1545;
    if (_1519)
    {
        out.m_47.x = 0.0;
    }
    float _1555 = fma(_1023, _1537, _1023);
    if (_1519)
    {
        float _1557 = _1543 * 5.0;
        _1551 = as_type<int>(_1557);
    }
    int _1559 = _1551;
    float _1561 = fma(_1025, _1537, _1025);
    float _1563 = _1511 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    if (_1519)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4910 = as_type<float>(_1559);
        out.gl_Position.z = _4910;
    }
    float _1567 = _1511 * 6.283185482025146484375;
    float _1569 = cos(_1567);
    float _1571 = _1541 * 6.283185482025146484375;
    float _1573 = sin(_1571);
    if (_1519)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1575 = _1541 * 6.283185482025146484375;
    float _1577 = cos(_1575);
    float _1579 = _1539 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1581 = _246 * _1523;
    float _1583 = _1377 * _1545;
    float _1585 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1555);
    float _1587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1561);
    float _1589 = _1545 * _1579;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1593 = fma(_1537, _919, _919);
    float _1595 = _1585 * _1583;
    float _1597 = _1587 * _1589;
    float _1599 = _1565 * _1531;
    float _1601 = _1569 * _1549;
    float _1603 = _1545 * _1591;
    float _1605 = _1565 * _1549;
    float _1607 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1593);
    float _1609 = _1569 * _1577;
    float _1611 = _1565 * _1577;
    float _1613 = _1549 * _1577;
    float _1615 = _1531 * _1577;
    float _1617 = _1569 * _1531;
    float _1619 = fma(_1573, _1601, _1599);
    float _1621 = _1609 * _1597;
    float _1623 = _1607 * _1603;
    float _1625 = -_1605;
    float _1627 = fma(_1573, _1617, _1625);
    float _1629 = -_1597;
    float _1631 = _1573 * _1629;
    float _1633 = fma(_1619, _1595, _1621);
    float _1635 = -_1617;
    float _1637 = fma(_1573, _1605, _1635);
    float _1639 = _1611 * _1597;
    float _1641 = fma(_1613, _1595, _1631);
    float _1643 = fma(_1627, _1623, _1633);
    float _1645 = fma(_1573, _1599, _1601);
    float _1647 = fma(_1637, _1595, _1639);
    float _1649 = fma(_1615, _1623, _1641);
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1653 = fma(_1645, _1623, _1647);
    float _1655 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1657 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1651);
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1661 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1663 = isnan(0.5);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1669 = _1665 || _1667;
    float _1671 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1655);
    float _1673 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1657);
    float _1675 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1659);
    bool _1677 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1679 = isnan(0.5);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1685 = _1681 || _1683;
    float _1687 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1671);
    float _1689 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1691 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1675);
    float _1693 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1695 = _757 + _1689;
    float _1697 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1699 = _791 + _1693;
    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1703 = _1695 + _1701;
    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1707 = _1699 + _1705;
    float _1709 = _1703 * _1703;
    float _1711 = fma(_1707, _1707, _1709);
    float _1713 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1715 = sqrt(_1711);
    float _1717 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1713);
    float _1719 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1721 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1723 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1719);
    float _1725 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1727 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1723);
    float _1729 = _747 + _1697;
    float _1731 = 1.0 / _1725;
    float _1733 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1735 = _1715 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1737 = _1733 + _1725;
    float _1739 = _1653;
    float _1741 = _1733;
    float _1743 = _1699;
    float _1745 = _1697;
    if (!_1735)
    {
        _1739 = _1695;
    }
    float _1747 = _1739;
    float _1749 = _1747;
    if (!_1735)
    {
        _1741 = _1729;
    }
    float _1751 = _1741;
    bool _1753 = !_1735;
    float _1755 = _1751;
    if (!_1753)
    {
        float _1757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1761 = _1715 + _1759;
        float _1763 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1765 = _1761 * _1757;
        float _1767 = rsqrt(_1711);
        float _1769 = _1765 * 0.15915493667125701904296875;
        float _1771 = _1769 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1769 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        float _1779 = _1773 + (-1.0);
        float _1781 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = fma(_1777, _1763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1785 = fma(_1729, _1773, _1781);
        float _1787 = _1767 * _1783;
        float _1789 = fma(_1707, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1791 = fma(_1703, _1787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1743 = _1789;
        _1755 = _1785;
        _1749 = _1791;
        _1745 = _1763;
    }
    float _1793 = _1743;
    float _1795 = _1755;
    float _1797 = _1749;
    float _1799 = _1745;
    float _1801 = -_1423;
    float _1803 = _1801 + _1793;
    float _1805 = -_1413;
    float _1807 = _1805 + _1795;
    float _1809 = -_1457;
    float _1811 = _1809 + _1797;
    float _1813 = _1737 * _1731;
    float _1815 = _1813 * 0.5;
    float _1817 = _1799;
    float _1819 = _1803;
    float _1821 = _1807;
    if (_1685)
    {
        _1817 = 1.0;
    }
    float _1823 = _1817;
    float _1825 = _1823;
    if (_1669)
    {
        _1417 = _1803;
    }
    float _1827 = _1417;
    float _1829 = _1827;
    if (_1669)
    {
        _1819 = _1807;
    }
    float _1831 = _1819;
    float _1833 = _1831;
    if (_1669)
    {
        _1821 = _1811;
    }
    float _1835 = _1821;
    float _1837 = _1835;
    if (!_1669)
    {
        float _1839 = _1465 * _1465;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1843 = -_757;
        float _1845 = _1843 + _1797;
        float _1847 = -_747;
        float _1849 = _1847 + _1795;
        float _1851 = fma(_1479, _1479, _1839);
        float _1853 = fma(_1497, _1497, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1857 = sqrt(_1853);
        float _1859 = 1.0 / _1545;
        float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1841;
        float _1867 = _1865 * _1859;
        float _1869 = -_791;
        float _1871 = _1869 + _1793;
        float _1873 = _1861 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1871, _1873, _1461);
        float _1879 = fma(_1849, _1873, _1453);
        float _1881 = fma(_1861, _1875, _1475);
        _1833 = _1879;
        _1829 = _1877;
        _1837 = _1881;
    }
    float _1883 = _1833;
    float _1885 = _1829;
    float _1887 = _1837;
    if (!_1685)
    {
        float _1889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1891 = _1889 * 0.15915493667125701904296875;
        float _1893 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1897 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1895);
        float _1899 = _1891 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        float _1903 = _1893 * 0.15915493667125701904296875;
        float _1905 = _1891 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        float _1909 = 1.0 / _1901;
        float _1911 = _1903 * 6.283185482025146484375;
        float _1913 = cos(_1911);
        float _1915 = _1907 * _1909;
        float _1917 = _1903 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = _1913 * _1915;
        float _1923 = 1.0 / _1897;
        float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1927 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1925;
        float _1929 = 1.0 / _1921;
        float _1931 = 1.0 / _1927;
        float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1935 = _1923 * _1933;
        float _1937 = _1919 * _1929;
        float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1941 = fma(_1937, _1935, _1939);
        float _1943 = _1941 * _1931;
        float _1945 = precise::clamp(_1943, 0.0, 1.0);
        _1553 = _1929;
        _1825 = _1945;
    }
    float _1947 = _1553;
    float _1949 = _1825;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1953 = _1883 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1957 = _1885 + _1955;
    float _1959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1961 = _1887 + _1959;
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1953 * _1953;
    float _1967 = fma(_1957, _1957, _1965);
    float _1969 = fma(_1961, _1961, _1967);
    float _1971 = rsqrt(_1969);
    float _1973 = sqrt(_1969);
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1977 = _1957 * _1975;
    float _1979 = _1961 * _1975;
    float _1981 = _1977 * _1977;
    float _1983 = _1979 * _1979;
    float _1985 = _1981 + _1983;
    float _1987 = sqrt(_1985);
    bool _1989 = _1987 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1993 = _1987 + _1991;
    float _1995 = _1961;
    float _1997 = _1985;
    float _1999 = _1993;
    float _2001 = _1947;
    float _2003 = _1975;
    if (_1989)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (_1989)
    {
        float _2009 = rsqrt(_1985);
        _1997 = _2009;
    }
    float _2011 = _1997;
    float _2013 = _2011;
    if (_1989)
    {
        float _2015 = _1993 * _2007;
        _1999 = _2015;
    }
    float _2017 = _1999;
    if (_1989)
    {
        float _2019 = _2017 * 0.15915493667125701904296875;
        _2001 = _2019;
    }
    float _2021 = _2001;
    float _2023 = _2007;
    float _2025 = _2021;
    if (_1989)
    {
        float _2027 = _2021 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        _2023 = _2029;
    }
    float _2031 = _2023;
    float _2033 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2035 = precise::max(0.0, _2033);
    float _2037 = _1965;
    float _2039 = _2035;
    if (_1989)
    {
        float _2041 = _2021 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        _2037 = _2043;
    }
    float _2045 = _2037;
    float _2047 = -_1975;
    float _2049 = -_2035;
    float _2051 = fma(_1953, _2047, _2049);
    float _2053 = _2051;
    if (_1989)
    {
        float _2055 = _2051 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2039 = _2055;
    }
    float _2057 = _2039;
    float _2059 = _2031;
    float _2061 = _2057;
    if (_1989)
    {
        float _2063 = fma(_2031, _2057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2059 = _2063;
    }
    float _2065 = _2059;
    float _2067 = _2065;
    float _2069 = _2045;
    if (_1989)
    {
        float _2071 = _2045 + (-1.0);
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _2073;
    if (_1989)
    {
        float _2077 = _2011 * _2065;
        _2003 = _2077;
    }
    float _2079 = _2003;
    if (!_1989)
    {
        _2067 = _1977;
    }
    float _2081 = _2067;
    float _2083 = _2081;
    if (_1989)
    {
        float _2085 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2085;
    }
    float _2087 = _2025;
    if (_1989)
    {
        float _2089 = _1977 * _2079;
        _2083 = _2089;
    }
    float _2091 = _2083;
    if (!_1989)
    {
        _2075 = _1979;
    }
    float _2093 = _2075;
    float _2095 = _2093;
    if (_1989)
    {
        float _2097 = _1979 * _2079;
        _2095 = _2097;
    }
    float _2099 = _2095;
    if (!_1989)
    {
        _2013 = _1981;
    }
    float _2101 = _2013;
    float _2103 = _2101;
    if (_1989)
    {
        float _2105 = fma(_2051, _2045, _2087);
        _2053 = _2105;
    }
    float _2107 = _2053;
    if (_1989)
    {
        float _2109 = _2091 * _2091;
        _2103 = _2109;
    }
    float _2111 = _2103;
    if (!_1989)
    {
        _2069 = _1983;
    }
    float _2113 = _2069;
    float _2115 = _2113;
    if (_1989)
    {
        float _2117 = _2099 * _2099;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2123 = fma(_2107, _2107, _2111);
    float _2125 = _2123 + _2119;
    float _2127 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2121);
    float _2129 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2133 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2131);
    float _2135 = precise::clamp(_2133, 0.0, 1.0);
    float _2137 = rsqrt(_2125);
    float _2139 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2127);
    float _2141 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2143 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2129);
    float _2145 = -_2135;
    float _2147 = _2145 + 1.0;
    float _2149 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2141);
    float _2153 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2143);
    float _2155 = abs(_2147);
    float _2157 = log2(_2155);
    float _2159 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2161 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2151);
    float _2163 = _2153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2165 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2167 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2169 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2173 = _2137 * _2091;
    float _2175 = _2137 * _2107;
    float _2177 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2165);
    float _2179 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2171);
    float _2181 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2183 = _2137 * _2099;
    float _2185 = -_2167;
    float _2187 = fma(_2185, _1963, 1.0);
    float _2189 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2191 = -_2181;
    float _2193 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2191);
    float _2195 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2179);
    float _2197 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2199 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2201 = -_2183;
    float _2203 = fma(_2201, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2193);
    float _2205 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2195);
    float _2207 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2209 = log2(_2187);
    float _2211 = fma(_2203, -0.5, 0.5);
    float _2213 = fma(_2203, 0.5, 0.5);
    float _2215 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2207);
    float _2217 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2199);
    float _2219 = _2175 + 1.0;
    float _2221 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2215);
    float _2223 = 1.0 / _2205;
    float _2225 = fma(_2213, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2227 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2217);
    float _2229 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2221);
    float _2231 = fma(_2213, _2225, -0.212114393711090087890625);
    float _2233 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2227);
    float _2235 = exp2(_2197);
    float _2237 = _2209 * 0.693147182464599609375;
    float _2239 = fma(_2213, _2231, 1.570728778839111328125);
    float _2241 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2243 = sqrt(_2211);
    float _2245 = _2229 * _2223;
    float _2247 = _2233 * _2223;
    float _2249 = fma(_2245, 0.5, 0.5);
    float _2251 = fma(_2247, -0.5, 0.5);
    float _2253 = -_2175;
    float _2255 = fma(_2235, _2219, _2253);
    float3 _6020 = float3(_2249, _2251, _2241);
    float _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6020, float3(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6020, float3(0.0), isnan(_6020)), level(0.0)).x;
    float _2259 = fma(_2255, 0.5, 0.5);
    float _2261 = _2243 * 0.636619746685028076171875;
    float _2263 = -_2239;
    float _2265 = fma(_2261, _2263, 1.0);
    float3 _6041 = float3(_2249, _2251, _2241);
    float4 _2268 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6041, float3(0.0), isnan(_6041)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6041, float3(0.0), isnan(_6041)), level(0.0)).xyzw;
    float _2270 = _2268.x;
    float _2272 = _2268.y;
    float _2274 = _2268.z;
    float _2276 = _2268.w;
    float2 _6058 = float2(_2265, _2259);
    float3 _2280 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6058, float2(0.0), isnan(_6058)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6058, float2(0.0), isnan(_6058)), level(0.0)).xyz;
    float _2282 = _2280.x;
    float _2284 = _2280.y;
    float _2286 = _2280.z;
    float _2288 = in.m_71.x;
    float _2290 = in.m_71.y;
    bool _2292 = _1561 != 0.0;
    bool _2294 = isnan(_1561);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan(0.0);
    bool _2300 = _2296 || _2298;
    float _2302 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2304 = _2163 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _1885;
    out.m_73.y = _1883;
    out.m_73.z = _1887;
    bool _2306 = _1555 == 0.0;
    bool _2308 = !_2300;
    bool _2310 = _2306 && _2308;
    float _2312 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2314 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2316 = _1593 == 0.0;
    bool _2318 = _2316 && _2310;
    float _2320 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2322 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2312);
    float _2324 = -_1573;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2302);
    float _2328 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2304);
    float _2330 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    float _2332 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2328);
    float _2334 = _923 * _2290;
    float _2336 = _813 * _2290;
    float _2338 = in.m_71.z;
    float _2340 = -_2334;
    float _2342 = fma(_813, _2288, _2340);
    float _2344 = fma(_923, _2288, _2336);
    float _2346 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2348 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2350 = _2342;
    float _2352 = _2344;
    float _2354 = _2233;
    float _2356 = _2229;
    if (!_2318)
    {
        float _2358 = fma(_1555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2342);
        _2350 = _2358;
    }
    float _2360 = _2350;
    if (!_2318)
    {
        float _2362 = fma(_1561, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2344);
        _2352 = _2362;
    }
    float _2364 = _2352;
    float _2366 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2346);
    float _2368 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2348);
    float _2370 = -_1573;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2320);
    float _2374 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2376 = -_1573;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2380 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2368);
    float _2382 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2384 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2386 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2378);
    float _2388 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2372);
    float _2390 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2366);
    float _2392 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2384);
    float _2394 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2396 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2322);
    float _2398 = _2386 * _2364;
    float _2400 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2382);
    float _2402 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2392);
    float _2404 = _2338;
    if (!_2318)
    {
        float _2406 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = exp2(_2394);
    float _2412 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2374);
    float _2414 = _2330 * _2364;
    float _2416 = _2388 * _2364;
    float _2418 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2420 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2412);
    float _2422 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2332);
    float _2424 = fma(_2390, _2360, _2398);
    float _2426 = fma(_2396, _2360, _2414);
    float _2428 = fma(_2380, _2360, _2416);
    float _2430 = _2422 + _2205;
    float _2432 = _2229 + _2205;
    float _2434 = _2205 * 0.5;
    float _2436 = fma(_2420, _2408, _2424);
    float _2438 = fma(_2418, _2408, _2426);
    float _2440 = fma(_2402, _2408, _2428);
    float _2442 = -_2410;
    float _2444 = _2442 + 1.0;
    float _2446 = _2430 * 0.5;
    float _2448 = _2432 * 0.5;
    float _2450 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2452 = fma(_2233, -0.5, _2434);
    out.m_75.x = _2436;
    out.m_75.y = _2438;
    out.m_75.z = _2440;
    bool _2454 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2456 = isnan(_1973);
    bool _2458 = _2454 || _2456;
    bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2462 = _2458 || _2460;
    float _2464 = -_2450;
    float _2466 = _2464 + 1.0;
    out.m_77.x = _2448;
    out.m_77.y = _2452;
    out.m_77.z = _2446;
    out.m_77.w = _2205;
    out.gl_Position.x = _2229;
    out.gl_Position.y = _2233;
    out.gl_Position.z = _2422;
    out.gl_Position.w = _2205;
    if (!_2462)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2468 = _2354;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2462)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2474 = _2356;
    float _2476 = _2450 * _2257;
    float _2478 = _2276 * _2476;
    float _2480 = _2276 * _2466;
    float _2482 = _2286 * _2476;
    float _2484 = fma(_2282, _2478, _2270);
    float _2486 = fma(_2284, _2478, _2272);
    float _2488 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2490 = fma(_2276, _2482, _2274);
    float _2492 = _2478;
    float _2494 = _2474;
    float _2496 = _2474;
    if (!_2462)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _2492;
    out.m_79.x = _2484;
    out.m_79.y = _2486;
    out.m_79.z = _2490;
    out.m_79.w = _2480;
    bool _2500 = !_2462;
    float _2502 = _2498;
    float _2504 = _2498;
    if (!_2500)
    {
        bool _2506 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2508 = isnan(_1973);
        bool _2510 = _2506 || _2508;
        bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2514 = _2510 || _2512;
        if (!_2514)
        {
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2518 = _1973 + _2516;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2520;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2532 = 1.0 / _2522;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2538 = _2518 * _2532;
            float _2540 = precise::clamp(_2538, 0.0, 1.0);
            float _2542 = fma(_2540, _2526, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2540, _2530, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2546 = fma(_2540, _2536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2496 = _2544;
            _2472 = _2542;
            _2504 = _2546;
            _2548 = true;
        }
        else
        {
            bool _2550 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2552 = isnan(_1973);
            bool _2554 = _2550 || _2552;
            bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2558 = _2554 || _2556;
            if (!_2558)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2560 = _2470;
            _2472 = _2560;
            if (!_2558)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2562 = _2494;
            _2496 = _2562;
            if (!_2558)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2564 = _2502;
            bool _2566 = !_2558;
            _2504 = _2564;
            if (!_2566)
            {
                bool _2568 = _1973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2570 = isnan(_1973);
                bool _2572 = _2568 || _2570;
                bool _2574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2576 = _2572 || _2574;
                if (!_2576)
                {
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2580 = _1973 + _2578;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2584 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2582;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2594 = 1.0 / _2584;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2600 = _2580 * _2594;
                    float _2602 = precise::clamp(_2600, 0.0, 1.0);
                    float _2604 = fma(_2602, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2606 = fma(_2602, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2496 = _2606;
                    _2472 = _2604;
                    _2504 = _2608;
                    _2548 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2548 = false;
    float _2610 = _2496;
    float _2612 = _2472;
    float _2614 = _2504;
    float _2616 = _2488 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = 0.0;
    float _2618 = _2610 * 0.586610972881317138671875;
    bool _2620 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _2616;
    float _2622 = fma(_2612, 0.298911988735198974609375, _2618);
    bool _2624 = _1949 > 0.0;
    bool _2626 = isnan(_1949);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan(0.0);
    bool _2632 = _2628 || _2630;
    float _2634 = fma(_2614, 0.114477999508380889892578125, _2622);
    float _2636 = -_2634;
    float _2638 = _2636 + _2612;
    float _2640 = -_2634;
    float _2642 = _2640 + _2610;
    float _2644 = -_2634;
    float _2646 = _2644 + _2614;
    float _2648 = fma(_2638, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2650 = fma(_2642, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2652 = fma(_2646, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    bool _2654 = !_2620;
    if (!_2654)
    {
        float _2656 = -_1883;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2660 = -_1885;
        float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2664 = -_1887;
        float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2668 = _2658 * _2658;
        float _2670 = fma(_2662, _2662, _2668);
        float _2672 = fma(_2666, _2666, _2670);
        float _2674 = sqrt(_2672);
        float _2676 = rsqrt(_2672);
        float _2678 = -_2674;
        float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2684 = precise::clamp(_2682, 0.0, 1.0);
        float _2686 = _2662 * _2676;
        float _2688 = _2658 * _2676;
        float _2690 = abs(_2684);
        float _2692 = log2(_2690);
        float _2694 = _2666 * _2676;
        float _2696 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2698 = _2438 * _2688;
        float _2700 = -_2688;
        float _2702 = -_2696;
        float _2704 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2702);
        float _2706 = fma(_2436, _2686, _2698);
        float _2708 = -_2694;
        float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2704);
        float _2712 = fma(_2440, _2694, _2706);
        float _2714 = precise::clamp(_2712, 0.0, 1.0);
        float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2718 = _2710 + _2716;
        float _2720 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2722 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = exp2(_2720);
        float _2728 = _2726 * _2724;
        float _2730 = _2714 * _2728;
        float _2732 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2736 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _2732;
        out.m_81.y = _2734;
        out.m_81.z = _2736;
    }
    out.m_83.x = _2648;
    out.m_83.y = _2650;
    out.m_83.z = _2652;
    if (_2632)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2738 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2738;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

