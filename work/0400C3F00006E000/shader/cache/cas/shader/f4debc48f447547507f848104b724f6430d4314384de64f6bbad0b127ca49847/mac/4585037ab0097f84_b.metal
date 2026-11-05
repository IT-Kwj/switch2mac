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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
    float4 m_81 [[attribute(11)]];
    float4 m_55 [[attribute(12)]];
    float4 m_57 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3820 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4105 = as_type<float>(_134);
        out.gl_Position.z = _4105;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_51.w;
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
        float _158 = float(_118);
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
        out.m_49.x = 0.0;
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
        float _4174 = as_type<float>(_172);
        out.gl_Position.z = _4174;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _208 = int(_206);
    float _210 = in.m_53.x;
    float _212 = in.m_53.y;
    float _214 = in.m_55.x;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _218 = _216 != 0;
    float _220 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _222 = int(_220);
    float _224 = float(_118);
    float _226 = in.m_55.y;
    float _228 = in.m_46.x;
    float _230 = in.m_46.y;
    float _232 = in.m_46.z;
    float _234 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _236 = int(_234);
    float _238 = float(_208);
    float _240 = in.m_53.w;
    float _242 = in.m_57.w;
    float _244 = 1.0 / _238;
    float _246 = float(_222);
    float _248 = in.m_57.x;
    float _250 = in.m_57.y;
    float _252 = float(uint(_236));
    float _254 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _256 = int(_254);
    bool _258 = _236 == 0;
    float _260 = in.m_57.z;
    int _262 = ~_236;
    int _264 = _262 + 1;
    float _266 = _244 * _152;
    float _268 = 1.0 / _246;
    out.m_59.w = _242;
    float _270 = 1.0 / _252;
    float _272 = float(uint(_256));
    out.m_59.x = _248;
    int _274 = ~_256;
    int _276 = _274 + 1;
    int _278 = ~_256;
    int _280 = _278 + 1;
    out.m_59.y = _250;
    float _282 = trunc(_266);
    int _284 = int(_282);
    float _286 = _268 * _152;
    float _288 = _268;
    float _290 = _214;
    float _292 = _226;
    if (_218)
    {
        float _294 = in.m_53.x;
        _288 = _294;
    }
    float _296 = _288;
    float _298 = _296;
    if (!_218)
    {
        float _300 = in.m_53.y;
        _298 = _300;
    }
    float _302 = _298;
    int _304 = as_type<int>(_270) + (-2);
    float _306 = 1.0 / _272;
    int _308 = ~_236;
    int _310 = _308 + 1;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.z = _260;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _318 = float(uint(_284));
    float _320 = trunc(_286);
    int _322 = int(_320);
    float _324 = as_type<float>(_304) * _318;
    float _326 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _328 = trunc(_324);
    float _330 = precise::max(_328, 0.0);
    uint _333 = uint(_330);
    int _335 = as_type<int>(_306) + (-2);
    float _337 = float(uint(_322));
    float _339 = 1.0 / _224;
    float _341 = _324;
    if (_218)
    {
        _341 = 1.0;
    }
    float _343 = _341;
    float _345 = _343;
    if (!_218)
    {
        _345 = 7.345489978790283203125;
    }
    float _347 = _345;
    float _349 = as_type<float>(_335) * _337;
    int _351 = _310 * int(_333);
    int _353 = _351 + _284;
    float _355 = trunc(_349);
    float _357 = precise::max(_355, 0.0);
    uint _359 = uint(_357);
    float _361 = float(uint(_353));
    float _363 = as_type<float>(_304) * _361;
    float _365 = _347 * _210;
    int _367 = ~_236;
    int _369 = _367 + 1;
    float _371 = floor(_365);
    int _373 = _276 * int(_359);
    int _375 = _373 + _322;
    float _377 = float(uint(_375));
    float _379 = trunc(_363);
    float _381 = precise::max(_379, 0.0);
    uint _383 = uint(_381);
    float _385 = as_type<float>(_335) * _377;
    float _387 = as_type<float>(_369);
    if (_218)
    {
        _387 = 1.0;
    }
    float _389 = _387;
    float _391 = -_371;
    float _393 = _365 + _391;
    float _395 = _389;
    if (!_218)
    {
        _395 = 1.2345600128173828125;
    }
    float _397 = _395;
    float _399 = trunc(_385);
    float _401 = precise::max(_399, 0.0);
    uint _403 = uint(_401);
    int _405 = int(_333) + int(_383);
    float _407 = float(_236);
    float _409 = float(_284);
    int _411 = _369 * _405;
    int _413 = _411 + _284;
    float _415 = _393 * _407;
    bool _417 = _409 >= _407;
    bool _419 = isnan(_409);
    bool _421 = _417 || _419;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = _407 * _152;
    bool _431 = uint(_413) >= uint(_236);
    float _433 = _302 * _397;
    int _435 = int(_359) + int(_403);
    float _437 = _429 * _339;
    float _439 = trunc(_427);
    int _441 = int(_439);
    bool _443 = !_431;
    int _445 = _443 ? 0 : (-1);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _449 = _447 != 0;
    int _451 = ~_405;
    int _453 = _451 + _445;
    int _455 = _453 + 1;
    bool _457 = !_449;
    int _459 = _457 ? 0 : 1;
    float _461 = trunc(_415);
    int _463 = int(_461);
    int _465 = ~_256;
    int _467 = _465 + 1;
    int _469 = abs(_459);
    int _471 = _236 * _455;
    int _473 = _471 + _284;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _485 = _483 != 0;
    float _487 = float(_256);
    float _489 = trunc(_437);
    int _491 = int(_489);
    int _493 = _467 * _435;
    int _495 = _493 + _322;
    int _497 = ~_441;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    bool _503 = !_258;
    int _505 = _503 ? _473 : (-1);
    bool _507 = uint(_495) >= uint(_256);
    int _509 = _463 * _469;
    int _511 = _509 + _284;
    float _513 = floor(_433);
    int _515 = _505 * _501;
    bool _517 = !_477;
    int _519 = _517 ? 0 : 1;
    int _521 = _236 + (-1);
    int _523 = abs(_519);
    float _525 = float(_322);
    int _527 = _441 * _521;
    int _529 = _527 + _515;
    bool _531 = !_481;
    int _533 = _531 ? 0 : 1;
    bool _535 = _525 >= _487;
    bool _537 = isnan(_525);
    bool _539 = _535 || _537;
    bool _541 = isnan(_487);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    int _547 = abs(_533);
    bool _549 = !_485;
    int _551 = _549 ? 0 : 1;
    float _553 = -_513;
    float _555 = _433 + _553;
    float _557 = trunc(_545);
    int _559 = int(_557);
    int _561 = abs(_551);
    int _563 = _529 * _547;
    bool _565 = !_507;
    int _567 = _565 ? 0 : (-1);
    float _569 = _487 * _555;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _573 = _571 != 0;
    int _575 = _491 * _523;
    int _577 = _575 + _563;
    int _579 = ~_435;
    int _581 = _579 + _567;
    int _583 = _581 + 1;
    float _585 = in.m_53.z;
    bool _587 = !_573;
    int _589 = _587 ? 0 : 1;
    float _591 = trunc(_569);
    int _593 = int(_591);
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _597 = _595 != 0;
    int _599 = _256 * _583;
    int _601 = _599 + _322;
    int _603 = abs(_589);
    int _605 = _511 * _561;
    int _607 = _605 + _577;
    bool _609 = _256 == 0;
    float _611 = _487 * _152;
    bool _613 = !_597;
    int _615 = _613 ? 0 : 1;
    float _617 = _611 * _339;
    int _619 = ~_559;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    int _625 = _463 * _603;
    int _627 = _625 + _607;
    bool _629 = !_609;
    int _631 = _629 ? _601 : (-1);
    int _633 = abs(_615);
    int _635 = _256 + (-1);
    int _637 = _623 * _631;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _641 = _639 != 0;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _645 = _643 != 0;
    float _647 = trunc(_617);
    int _649 = int(_647);
    int _651 = _559 * _635;
    int _653 = _651 + _637;
    float _655 = float(uint(_627));
    bool _657 = !_645;
    int _659 = _657 ? 0 : 1;
    int _661 = _593 * _633;
    int _663 = _661 + _322;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _671 = _669 != 0;
    float _673 = as_type<float>(_304) * _655;
    bool _675 = !_641;
    int _677 = _675 ? 0 : 1;
    int _679 = abs(_659);
    float _681 = trunc(_673);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    bool _687 = !_667;
    int _689 = _687 ? 0 : 1;
    int _691 = abs(_677);
    int _693 = ~_236;
    int _695 = _693 + 1;
    int _697 = abs(_689);
    int _699 = _653 * _679;
    bool _701 = !_671;
    int _703 = _701 ? 0 : 1;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _707 = _705 != 0;
    int _709 = _649 * _691;
    int _711 = _709 + _699;
    int _713 = abs(_703);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _717 = _715 != 0;
    int _719 = _663 * _697;
    int _721 = _719 + _711;
    int _723 = _695 * int(_685);
    int _725 = _723 + _627;
    float _727 = float(uint(_511));
    bool _729 = _236 == 0;
    int _731 = _593 * _713;
    int _733 = _731 + _721;
    float _735 = _673;
    float _737 = as_type<float>(_523);
    int _739 = _695;
    bool _741 = _667;
    bool _743 = _645;
    if (_707)
    {
        float _745 = in.m_53.x;
        _735 = _745;
    }
    float _747 = _735;
    float _749 = float(uint(_725));
    float _751 = as_type<float>(_304) * _727;
    if (!_707)
    {
        _737 = _214;
    }
    float _753 = _737;
    float _755 = in.m_61.x;
    float _757 = in.m_61.y;
    float _759 = in.m_61.z;
    float _761 = in.m_61.w;
    float _763 = float(uint(_733));
    float _765 = as_type<float>(_304) * _749;
    int _767 = as_type<int>(_763);
    float _769 = _753;
    if (_717)
    {
        float _771 = -_214;
        float _773 = _771 + 1.0;
        _739 = as_type<int>(_773);
    }
    int _775 = _739;
    if (_717)
    {
        bool _777 = _585 > 0.5;
        _741 = _777;
    }
    bool _779 = _741;
    float _781 = trunc(_751);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    float _787 = as_type<float>(_335) * _763;
    if (_707)
    {
        float _789 = -_214;
        float _791 = _789 + 1.0;
        _767 = as_type<int>(_791);
    }
    int _793 = _767;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _797 = _795 != 0;
    float _799 = trunc(_787);
    float _801 = precise::max(_799, 0.0);
    uint _803 = uint(_801);
    if (_707)
    {
        bool _805 = _747 > 0.5;
        _743 = _805;
    }
    bool _807 = _743;
    float _809 = trunc(_765);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    int _815 = 0;
    if (_797)
    {
        _815 = 0;
    }
    int _817 = _815;
    int _819 = _817;
    if (_707)
    {
        float _821 = _807 ? as_type<float>(_793) : _214;
        _769 = _821;
    }
    float _823 = _769;
    float _825 = _230 * _757;
    if (_717)
    {
        float _827 = _779 ? as_type<float>(_775) : _214;
        _290 = _827;
    }
    float _829 = _290;
    bool _831 = _212 > 0.5;
    float _833 = fma(_228, _755, _825);
    int _835 = ~_256;
    int _837 = _835 + 1;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _841 = _839 != 0;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _845 = _843 != 0;
    int _847 = _837 * int(_803);
    int _849 = _847 + _733;
    if (!_797)
    {
        _819 = 1;
    }
    int _851 = _819;
    int _853 = int(_685) + int(_813);
    float _855 = float(uint(_849));
    float _857 = in.m_63.x;
    float _859 = in.m_63.y;
    float _861 = in.m_63.z;
    float _863 = in.m_63.w;
    int _865 = _264 * _853;
    int _867 = _865 + _627;
    float _869 = in.m_65.x;
    float _871 = in.m_65.y;
    float _873 = in.m_65.z;
    float _875 = in.m_65.w;
    float _877 = as_type<float>(_335) * _855;
    bool _879 = uint(_867) >= uint(_236);
    float _881 = -_226;
    float _883 = _881 + 1.0;
    float _885 = trunc(_877);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    bool _891 = !_879;
    int _893 = _891 ? 0 : (-1);
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _897 = _895 != 0;
    int _899 = _831 ? as_type<int>(_883) : as_type<int>(_226);
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _903 = _901 != 0;
    float _905 = _841 ? as_type<float>(_899) : _226;
    bool _907 = _240 > 0.5;
    int _909 = ~_236;
    int _911 = _909 + 1;
    float _913 = _230 * _859;
    int _915 = int(_803) + int(_889);
    if (_897)
    {
        float _917 = _907 ? _883 : _226;
        _292 = _917;
    }
    float _919 = _292;
    float _921 = _230 * _871;
    int _923 = ~_256;
    int _925 = _923 + 1;
    int _927 = ~_853;
    int _929 = _927 + _893;
    int _931 = _929 + 1;
    float _933 = fma(_228, _857, _913);
    int _935 = _925 * _915;
    int _937 = _935 + _733;
    int _939 = _236 * _931;
    int _941 = _939 + _627;
    int _943 = _911 * int(_785);
    int _945 = _943 + _511;
    bool _947 = uint(_937) >= uint(_256);
    float _949 = fma(_228, _869, _921);
    float _951 = float(uint(_663));
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _955 = !_729;
    int _957 = _955 ? _941 : (-1);
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _961 = float(uint(_945));
    float _963 = as_type<float>(_335) * _951;
    int _965 = _957 & 3;
    bool _967 = _965 != 0;
    float _969 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _971 = !_947;
    int _973 = _971 ? 0 : (-1);
    float _975 = as_type<float>(_304) * _961;
    int _977 = _967 ? 0 : 1;
    float _979 = trunc(_963);
    float _981 = precise::max(_979, 0.0);
    uint _983 = uint(_981);
    int _985 = _957 & 3;
    bool _987 = _985 != 0;
    float _989 = _210 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _991 = uint(_985) > 1u;
    float _993 = -_959;
    float _995 = fma(_989, 2.0, _993);
    float _997 = trunc(_975);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1005 = ~_915;
    int _1007 = _1005 + _973;
    int _1009 = _1007 + 1;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1015 = _280 * int(_983);
    int _1017 = _1015 + _663;
    bool _1019 = !_903;
    int _1021 = _1019 ? 0 : 1;
    out.m_67.x = _1011;
    out.m_67.y = _316;
    out.m_67.z = _969;
    out.m_67.w = _314;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1023;
    float _1027 = fma(_326, -2.0, _1013);
    float _1029 = float(uint(_1017));
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1035 = int(_785) + int(_1001);
    float _1037 = as_type<float>(_335) * _1029;
    int _1039 = ~_977;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = 1.0 / _1025;
    int _1047 = _1043;
    if (!_991)
    {
        int _1049 = ~_977;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    float _1055 = fma(_232, _861, _933);
    bool _1057 = uint(_985) >= 2u;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1061 = ~_236;
    int _1063 = _1061 + 1;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1067 = _1057 ? 0 : 1;
    float _1069 = trunc(_1037);
    float _1071 = precise::max(_1069, 0.0);
    uint _1073 = uint(_1071);
    bool _1075 = _985 != 3;
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1081 = ~_1067;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    float _1087 = _1055 + _863;
    int _1089 = _1063 * _1035;
    int _1091 = _1089 + _511;
    float _1093 = 1.0 / _1033;
    int _1095 = _256 * _1009;
    int _1097 = _1095 + _733;
    float _1099 = fma(_232, _759, _833);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1103 = ~_256;
    int _1105 = _1103 + 1;
    float _1107 = fma(_232, _873, _949);
    int _1109 = _1085;
    if (_1075)
    {
        int _1111 = ~_1067;
        int _1113 = _1111 + 1;
        _1109 = _1113;
    }
    int _1115 = _1109;
    float _1117 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1119 = uint(_1091) >= uint(_236);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1123 = _204 + _1121;
    bool _1125 = !_609;
    int _1127 = _1125 ? _1097 : (-1);
    float _1129 = _1107 + _875;
    bool _1131 = !_1119;
    int _1133 = _1131 ? 0 : (-1);
    out.m_69.x = _1077;
    out.m_69.y = _1079;
    out.m_69.z = _1117;
    int _1135 = _1127 & 3;
    bool _1137 = _1135 != 0;
    float _1139 = _1123 * _1045;
    int _1141 = int(_983) + int(_1073);
    float _1143 = _210 + _212;
    int _1145 = _1137 ? 0 : 1;
    bool _1147 = uint(_1135) >= 2u;
    float _1149 = _1143 + (-1.0);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1153 = _204 + _1151;
    int _1155 = _1147 ? 0 : 1;
    float _1157 = _210 * 2.0;
    bool _1159 = _1135 != 3;
    int _1161 = _1105 * _1141;
    int _1163 = _1161 + _663;
    float _1165 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1167 = _212 * 2.0;
    float _1169 = floor(_1157);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1173 = _204 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1183 = ~_1155;
    int _1185 = _1183 + 1;
    int _1187 = _1185 + 1;
    float _1189 = _1173 * _1093;
    bool _1191 = !_845;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _1187;
    if (_1159)
    {
        int _1197 = ~_1155;
        int _1199 = _1197 + 1;
        _1195 = _1199;
    }
    int _1201 = _1195;
    float _1203 = floor(_1167);
    bool _1205 = uint(_1163) >= uint(_256);
    float _1207 = _210 + _585;
    int _1209 = ~_1035;
    int _1211 = _1209 + _1133;
    int _1213 = _1211 + 1;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1217 = _204 + _1215;
    bool _1219 = !_1205;
    int _1221 = _1219 ? 0 : (-1);
    float _1223 = _1207 + (-1.0);
    bool _1225 = uint(_1135) > 1u;
    float _1227 = 1.0 / _1181;
    int _1229 = ~_1145;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    int _1235 = _236 * _1213;
    int _1237 = _1235 + _511;
    int _1239 = ~_1141;
    int _1241 = _1239 + _1221;
    int _1243 = _1241 + 1;
    bool _1245 = _1169 > 0.0;
    int _1247 = _256 * _1243;
    int _1249 = _1247 + _663;
    float _1251 = _212 + _585;
    bool _1253 = _1203 >= 0.0;
    bool _1255 = isnan(_1203);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.0);
    bool _1261 = _1257 || _1259;
    float _1263 = 1.0 / _1177;
    int _1265 = _1233;
    if (!_1225)
    {
        int _1267 = ~_1145;
        int _1269 = _1267 + 1;
        _1265 = _1269;
    }
    int _1271 = _1265;
    float _1273 = _1251 + (-1.0);
    bool _1275 = _1169 >= 0.0;
    bool _1277 = isnan(_1169);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.0);
    bool _1283 = _1279 || _1281;
    bool _1285 = !_729;
    int _1287 = _1285 ? _1237 : (-1);
    float _1289 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1291 = _1283 ? 0 : 1;
    float _1293 = _1217 * _1227;
    bool _1295 = _1203 > 0.0;
    float _1297 = _585 * 2.0;
    bool _1299 = !_609;
    int _1301 = _1299 ? _1249 : (-1);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1303;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1313 = _1311 != 0;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1317 = _1315 != 0;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1323 = ~_1291;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    float _1329 = _1153 * _1263;
    int _1331 = _957 >> 31;
    int _1333 = _1327;
    if (!_1245)
    {
        int _1335 = ~_1291;
        int _1337 = _1335 + 1;
        _1333 = _1337;
    }
    int _1339 = _1333;
    float _1341 = fma(_1305, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1343 = _1127 >> 31;
    int _1345 = _1127 & 3;
    bool _1347 = _1345 != 0;
    int _1349 = _1331 & 3;
    int _1351 = _1343 & 3;
    bool _1353 = !_1347;
    int _1355 = _1353 ? 0 : 1;
    float _1357 = floor(_1297);
    bool _1359 = _985 != 3;
    int _1361 = _957 + _1349;
    int _1363 = _1127 + _1351;
    int _1365 = _1363 >> 2;
    int _1367 = _1361 >> 2;
    float _1369 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1371 = _1365 << 4;
    int _1373 = _1371 + 512;
    bool _1375 = !_1359;
    int _1377 = _1375 ? 0 : (-1);
    bool _1379 = _1135 != 3;
    int _1381 = _1367 << 4;
    int _1383 = _1381 + 368;
    uint _1385 = uint(int(uint(_1373) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[int(_1395)][_1397];
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1401;
    float _1405 = fma(_1403, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1411;
    uint _1415 = uint(int(uint(_1383) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1431;
    float _1435 = fma(_1409, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1437 = fma(_1413, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1443 = fma(_1433, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _1449 = !_987;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1383 + 8;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    float _1471 = fma(_1441, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1473 = fma(_1447, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _1475 = abs(_1053);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1477;
    int _1481 = _1261 ? 0 : 1;
    float _1483 = fma(_1321, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _1485 = _851 != 1;
    int _1487 = _1373 + 8;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[int(_1499)][_1501];
    int _1505 = abs(_1451);
    float _1507 = fma(_1479, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _1509 = abs(_1271);
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1513 = _1511 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    int _1515 = abs(_1355);
    int _1517 = ~_1475;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1099 + _761;
    bool _1525 = !_1379;
    int _1527 = _1525 ? 0 : (-1);
    bool _1529 = _1357 > 0.0;
    bool _1531 = _1357 >= 0.0;
    bool _1533 = isnan(_1357);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.0);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1541;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _1549 = ~_1509;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    float _1555 = fma(_1543, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _1557 = ~_1515;
    int _1559 = _1557 + 1;
    int _1561 = _1559 + 1;
    float _1563 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1565 = int(_1563);
    int _1567 = abs(_1377);
    int _1569 = _1553 * as_type<int>(_1399);
    int _1571 = abs(_1193);
    float _1573 = fma(_1547, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _1575 = ~_1567;
    int _1577 = _1575 + 1;
    int _1579 = _1577 + 1;
    int _1581 = _1561 * as_type<int>(_1391);
    int _1583 = _1581 + _1569;
    int _1585 = abs(_1115);
    float _1587 = fma(_1513, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _1589 = abs(_1201);
    int _1591 = _1521 * as_type<int>(_1429);
    int _1593 = ~_1505;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    int _1599 = ~_1585;
    int _1601 = _1599 + 1;
    int _1603 = _1601 + 1;
    float _1605 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1607 = int(_1605);
    int _1609 = abs(_1527);
    int _1611 = _1597 * as_type<int>(_1421);
    int _1613 = _1611 + _1591;
    int _1615 = abs(_1565);
    float _1617 = float(uint(_1565));
    int _1619 = _1603 * as_type<int>(_1461);
    int _1621 = _1619 + _1613;
    int _1623 = ~_1571;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    int _1629 = ~_1589;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    int _1635 = _1579 * as_type<int>(_1469);
    int _1637 = _1635 + _1621;
    float _1639 = float(uint(_1615));
    float _1641 = 1.0 / _1617;
    int _1643 = abs(_1021);
    int _1645 = _1637 * _1627;
    int _1647 = _1633 * as_type<int>(_1495);
    int _1649 = _1647 + _1583;
    float _1651 = float(uint(_1607));
    int _1653 = _1287 * _1571;
    int _1655 = _1653 + _1645;
    int _1657 = ~_1609;
    int _1659 = _1657 + 1;
    int _1661 = _1659 + 1;
    float _1663 = 1.0 / _1639;
    int _1665 = abs(_1607);
    int _1667 = abs(_1655);
    int _1669 = _1661 * as_type<int>(_1503);
    int _1671 = _1669 + _1649;
    int _1673 = ~_1643;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = float(uint(_1655));
    float _1681 = 1.0 / _1651;
    int _1683 = as_type<int>(_1641) + (-2);
    int _1685 = _1677 * _1671;
    float _1687 = float(uint(_1665));
    int _1689 = _1301 * _1643;
    int _1691 = _1689 + _1685;
    float _1693 = float(uint(_1667));
    float _1695 = as_type<float>(_1683) * _1679;
    int _1697 = as_type<int>(_1663) + (-2);
    float _1699 = 1.0 / _1687;
    float _1701 = float(uint(_1691));
    float _1703 = as_type<float>(_1697) * _1693;
    int _1705 = as_type<int>(_1681) + (-2);
    float _1707 = trunc(_1695);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = _1681;
    float _1715 = as_type<float>(_1685);
    if (!_1485)
    {
        _1713 = _212;
    }
    float _1717 = _1713;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1721 = as_type<float>(_1705) * _1701;
    float _1723 = _1717;
    if (_1485)
    {
        _1723 = _210;
    }
    float _1725 = _1723;
    int _1727 = _1539 ? 0 : 1;
    float _1729 = trunc(_1703);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    float _1735 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1719);
    int _1737 = ~_1727;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    float _1743 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1735);
    int _1745 = abs(_1691);
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1749 = trunc(_1721);
    float _1751 = precise::max(_1749, 0.0);
    uint _1753 = uint(_1751);
    int _1755 = _1741;
    float _1757 = _1747;
    if (!_1529)
    {
        int _1759 = ~_1727;
        int _1761 = _1759 + 1;
        _1755 = _1761;
    }
    int _1763 = _1755;
    int _1765 = ~_1565;
    int _1767 = _1765 + 1;
    if (!_1485)
    {
        _1715 = _585;
    }
    float _1769 = _1715;
    float _1771 = _1769;
    if (_1485)
    {
        _1771 = _212;
    }
    float _1773 = _1771;
    int _1775 = _1767 * int(_1711);
    int _1777 = _1775 + _1655;
    int _1779 = ~int(_1733);
    int _1781 = _1779 + 1;
    int _1783 = as_type<int>(_1699) + (-2);
    float _1785 = float(uint(_1745));
    int _1787 = _1781 * _1615;
    int _1789 = _1787 + _1667;
    int _1791 = ~_1481;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = _1795;
    if (!_1295)
    {
        int _1799 = ~_1481;
        int _1801 = _1799 + 1;
        _1797 = _1801;
    }
    int _1803 = _1797;
    float _1805 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1747);
    float _1807 = as_type<float>(_1783) * _1785;
    int _1809 = ~_1607;
    int _1811 = _1809 + 1;
    float _1813 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1815 = log2(_1813);
    if (!_1485)
    {
        _1757 = _212;
    }
    float _1817 = _1757;
    float _1819 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1805);
    int _1821 = _1811 * int(_1753);
    int _1823 = _1821 + _1691;
    float _1825 = _1817;
    if (_1485)
    {
        _1825 = _210;
    }
    float _1827 = _1825;
    float _1829 = float(uint(_1777));
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1833 = float(uint(_1789));
    float _1835 = trunc(_1807);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    float _1841 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1843 = float(uint(_1823));
    float _1845 = as_type<float>(_1683) * _1829;
    float _1847 = as_type<float>(_1697) * _1833;
    bool _1849 = !_1313;
    int _1851 = _1849 ? 0 : 1;
    float _1853 = -_1831;
    float _1855 = fma(_1841, 2.0, _1853);
    float _1857 = as_type<float>(_1705) * _1843;
    int _1859 = abs(_1851);
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1087 + _1861;
    bool _1865 = !_1309;
    int _1867 = _1865 ? 0 : 1;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1485)
    {
        _1871 = _585;
    }
    float _1873 = _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1877 = _1523 + _1875;
    float _1879 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1881 = abs(_1867);
    float _1883 = trunc(_1845);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = _1873;
    if (_1485)
    {
        _1889 = _212;
    }
    float _1891 = _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1895 = _1129 + _1893;
    int _1897 = ~int(_1839);
    int _1899 = _1897 + 1;
    float _1901 = -_152;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1855);
    float _1905 = float(_1339);
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1909 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1911 = isnan(0.0);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1917 = _1913 || _1915;
    float _1919 = trunc(_1857);
    float _1921 = precise::max(_1919, 0.0);
    uint _1923 = uint(_1921);
    float _1925 = float(_1859);
    float _1927 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1879);
    float _1929 = float(_1881);
    float _1931 = fma(_1907, -2.0, _1869);
    float _1933 = float(_1763);
    int _1935 = _1899 * _1665;
    int _1937 = _1935 + _1745;
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1927);
    float _1941 = trunc(_1847);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    int _1947 = int(_1711) + int(_1887);
    float _1949 = _1929 * _1933;
    float _1951 = float(uint(_1937));
    float _1953 = _1925 * _1905;
    float _1955 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1931);
    bool _1957 = _1939 >= 0.0;
    float _1959 = as_type<float>(_1783) * _1951;
    float _1961 = _1815 * _152;
    int _1963 = int(_1753) + int(_1923);
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1967 = 1.0 + _1965;
    float _1969 = _1949 * (-2.0);
    float _1971 = trunc(_1959);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    int _1977 = ~_1565;
    int _1979 = _1977 + 1;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1983 = ~_1607;
    int _1985 = _1983 + 1;
    float _1987 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1981);
    float _1989 = exp2(_1961);
    int _1991 = int(_1733) + int(_1945);
    int _1993 = _1979 * _1947;
    int _1995 = _1993 + _1655;
    bool _1997 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1999 = isnan(1.0);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2005 = _2001 || _2003;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2009 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1027);
    int _2011 = ~_1991;
    int _2013 = _2011 + 1;
    float _2015 = 1.0 / _1967;
    float _2017 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2007);
    int _2019 = _1985 * _1963;
    int _2021 = _2019 + _1691;
    int _2023 = int(_1839) + int(_1975);
    float _2025 = -_152;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _995);
    float _2029 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2017);
    float _2031 = in.m_71.x;
    float _2033 = in.m_71.y;
    float _2035 = in.m_71.z;
    float _2037 = _210 + (-0.5);
    float _2039 = -_1989;
    float _2041 = _2039 + 1.0;
    float _2043 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1987);
    float _2045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1957)
    {
        out.m_49.x = 0.0;
    }
    float _2047 = _1917 ? _2041 : 0.0;
    bool _2049 = uint(_1995) >= uint(_1565);
    int _2051 = _2013 * _1615;
    int _2053 = _2051 + _1667;
    int _2055 = ~_2023;
    int _2057 = _2055 + 1;
    float _2059 = as_type<float>(_2053);
    if (_2005)
    {
        float _2061 = _2047 * _2015;
        _156 = _2061;
    }
    float _2063 = _156;
    bool _2065 = !_2049;
    int _2067 = _2065 ? 0 : (-1);
    float _2069 = _1953 * (-2.0);
    bool _2071 = uint(_2021) >= uint(_1607);
    bool _2073 = uint(_2053) >= uint(_1615);
    int _2075 = ~_1947;
    int _2077 = _2075 + _2067;
    int _2079 = _2077 + 1;
    float _2081 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2083 = _1655 ^ _1565;
    float _2085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2087 = fma(_1289, _2069, _1289);
    bool _2089 = !_2071;
    int _2091 = _2089 ? 0 : (-1);
    float _2093 = fma(_2081, _823, -0.5);
    bool _2095 = _1565 == 0;
    int _2097 = _2057 * _1665;
    int _2099 = _2097 + _1745;
    bool _2101 = _1565 == 0;
    int _2103 = _1565 * _2079;
    int _2105 = _2103 + _1655;
    bool _2107 = !_2073;
    int _2109 = _2107 ? 0 : (-1);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2113 = uint(int(uint(_2083) >> uint(31)));
    float _2115 = fma(_2069, _2033, _2033);
    int _2117 = ~_2109;
    int _2119 = _1991 + _2117;
    int _2121 = _2119 + 1;
    float _2123 = fma(_1165, _1969, _1165);
    int _2125 = ~int(_2113);
    int _2127 = _2125 + 1;
    float _2129 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2131 = !_2095;
    int _2133 = _2131 ? _2105 : (-1);
    int _2135 = _2121 ^ _2127;
    float _2137 = fma(_2129, _905, -0.5);
    bool _2139 = uint(_2099) >= uint(_1665);
    int _2141 = ~_1963;
    int _2143 = _2141 + _2091;
    int _2145 = _2143 + 1;
    int _2147 = _1691 ^ _1607;
    float _2149 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2151 = float(_2133);
    int _2153 = _1607 * _2145;
    int _2155 = _2153 + _1691;
    int _2157 = ~_2127;
    int _2159 = _2157 + _2135;
    int _2161 = _2159 + 1;
    float _2163 = fma(_2149, _829, -0.5);
    bool _2165 = !_2139;
    int _2167 = _2165 ? 0 : (-1);
    float _2169 = fma(_2081, _2151, _2027);
    uint _2171 = uint(int(uint(_2147) >> uint(31)));
    bool _2173 = _1607 == 0;
    float _2175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2177 = !_2101;
    int _2179 = _2177 ? _2161 : (-1);
    float _2181 = fma(_2029, _2093, _2169);
    int _2183 = ~_2167;
    int _2185 = _2023 + _2183;
    int _2187 = _2185 + 1;
    float _2189 = _212 + (-0.5);
    int _2191 = ~int(_2171);
    int _2193 = _2191 + 1;
    float _2195 = fma(_1969, _2031, _2031);
    bool _2197 = !_2173;
    int _2199 = _2197 ? _2155 : (-1);
    float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2115);
    float _2203 = float(_2179);
    float _2205 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2195);
    int _2207 = _2187 ^ _2193;
    bool _2209 = _1607 == 0;
    float _2211 = -_2009;
    float _2213 = fma(_2129, _2203, _2211);
    float _2215 = float(_2199);
    float _2217 = _1863 * _1863;
    int _2219 = ~_2193;
    int _2221 = _2219 + _2207;
    int _2223 = _2221 + 1;
    float _2225 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2227 = fma(_2043, _2137, _2213);
    float _2229 = fma(_2149, _2215, _1903);
    bool _2231 = !_2209;
    int _2233 = _2231 ? _2223 : (-1);
    float _2235 = fma(_1877, _1877, _2217);
    float _2237 = fma(_2225, _919, -0.5);
    float _2239 = fma(_1743, _2163, _2229);
    float _2241 = float(_2233);
    float _2243 = fma(_1895, _1895, _2235);
    float _2245 = _2213;
    float _2247 = _2069;
    if (_1957)
    {
        _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2249 = _2245;
    float _2251 = _2239 + 0.5;
    float _2253 = _2181 + 0.5;
    float _2255 = -_1955;
    float _2257 = fma(_2225, _2241, _2255);
    bool _2259 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2261 = isnan(_204);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = rsqrt(_2243);
    float _2273 = fma(_1819, _2237, _2257);
    int _2275 = as_type<int>(_2249);
    if (_1957)
    {
        float _2277 = _2249 * 5.0;
        _2275 = as_type<int>(_2277);
    }
    int _2279 = _2275;
    bool _2281 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2283 = isnan(_204);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2289 = _2285 || _2287;
    float _2291 = float(_2289);
    float _2293 = _2273 + 0.5;
    float _2295 = _2227 + 0.5;
    if (_1957)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7229 = as_type<float>(_2279);
        out.gl_Position.z = _7229;
    }
    bool _2297 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2299 = isnan(_204);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    bool _2309 = !_1317;
    int _2311 = _2309 ? 0 : 1;
    out.m_73.x = _2253;
    out.m_73.y = _2295;
    out.m_73.z = _2251;
    out.m_73.w = _2293;
    float _2313 = _1863 * _2271;
    float _2315 = _1877 * _2271;
    if (_1957)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2317 = -_2313;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1087);
    float _2321 = _1895 * _2271;
    float _2323 = -_2315;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1523);
    float _2327 = -_2307;
    float _2329 = _2327 + 1.0;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2333 = _2319 + _2331;
    float _2335 = -_2321;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1129);
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2341 = _2325 + _2339;
    float _2343 = _2291 * _2329;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2349 = _2337 + _2347;
    float _2351 = -_2291;
    float _2353 = _2351 + 1.0;
    bool _2355 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2357 = isnan(_204);
    bool _2359 = _2355 || _2357;
    bool _2361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2363 = _2359 || _2361;
    float _2365 = float(_2363);
    float _2367 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2345);
    float _2369 = -_2269;
    float _2371 = _2369 + 1.0;
    int _2373 = abs(_2311);
    float _2375 = fma(_2087, _2063, _2201);
    float _2377 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2367);
    float _2379 = _2365 * _2371;
    float _2381 = -_2365;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2123, _2063, _2205);
    bool _2387 = _2377 >= 0.0;
    float _2389 = _2375 * 0.15915493667125701904296875;
    float _2391 = float(_1803);
    float _2393 = _2385 * 0.15915493667125701904296875;
    float _2395 = float(_2373);
    float _2397 = _2269 * _2353;
    bool _2399 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2401 = isnan(_204);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = _2393 * 6.283185482025146484375;
    float _2413 = sin(_2411);
    float _2415 = -_2313;
    float _2417 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1863);
    float _2419 = _2395 * _2391;
    float _2421 = -_2315;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1877);
    float _2425 = _2409 * _2383;
    float _2427 = -_2409;
    float _2429 = _2427 + 1.0;
    float _2431 = _2419 * (-2.0);
    float _2433 = _2419;
    int _2435 = as_type<int>(_2393);
    if (_2387)
    {
        _2433 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2437 = _2433;
    float _2439 = _1405 * _2425;
    float _2441 = _1443 * _2425;
    float _2443 = _2389 * 6.283185482025146484375;
    float _2445 = cos(_2443);
    float _2447 = _1437 * _2425;
    float _2449 = _2417 * _2417;
    if (_2387)
    {
        out.m_49.x = 0.0;
    }
    float _2451 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2447);
    float _2453 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2439);
    float _2455 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].z, _2441);
    float _2457 = _2389 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = fma(_2431, _2035, _2035);
    float _2463 = fma(_2423, _2423, _2449);
    float _2465 = -_2321;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1895);
    float _2469 = _2393 * 6.283185482025146484375;
    float _2471 = cos(_2469);
    if (_2387)
    {
        float _2473 = _2437 * 5.0;
        _2435 = as_type<int>(_2473);
    }
    int _2475 = _2435;
    if (_2387)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7518 = as_type<float>(_2475);
        out.gl_Position.z = _7518;
    }
    if (_2387)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2477 = -_1087;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2481 = -_1523;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2485 = fma(_2467, _2467, _2463);
    float _2487 = -_1129;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2491 = _2479 * _2479;
    float _2493 = in.m_75.x;
    float _2495 = in.m_75.y;
    float _2497 = in.m_75.z;
    float _2499 = fma(_1473, _2379, _2455);
    float _2501 = fma(_1471, _2379, _2451);
    float _2503 = fma(_2483, _2483, _2491);
    float _2505 = fma(_1435, _2379, _2453);
    float _2507 = _585 + (-0.5);
    float _2509 = sqrt(_2485);
    float _2511 = fma(_2489, _2489, _2503);
    float _2513 = fma(_1507, _2397, _2499);
    float _2515 = fma(_1555, _2397, _2501);
    float _2517 = fma(_1341, _2397, _2505);
    float _2519 = fma(_1369, _2431, _1369);
    float _2521 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2461);
    float _2523 = fma(_1587, _2343, _2513);
    float _2525 = rsqrt(_2511);
    float _2527 = fma(_1573, _2343, _2515);
    float _2529 = fma(_1483, _2343, _2517);
    float _2531 = fma(_2519, _2063, _2521);
    float _2533 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].z, _2523);
    float _2535 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2527);
    float _2537 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2529);
    float _2539 = _2531 * 0.15915493667125701904296875;
    float _2541 = _2271 * _2509;
    float _2543 = _2413 * _2459;
    float _2545 = _2533 * _2497;
    float _2547 = _2535 * _2495;
    float _2549 = _2537 * _2493;
    float _2551 = _2539 * 6.283185482025146484375;
    float _2553 = sin(_2551);
    float _2555 = in.m_77.x;
    float _2557 = in.m_77.y;
    float _2559 = in.m_77.z;
    float _2561 = _2471 * _2445;
    float _2563 = _2483 * _2525;
    float _2565 = _2489 * _2525;
    float _2567 = _2479 * _2525;
    float _2569 = _2545 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2573 = _2563 * _2571;
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2577 = _2565 * _2575;
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2581 = _2567 * _2579;
    float _2583 = _2539 * 6.283185482025146484375;
    float _2585 = cos(_2583);
    float _2587 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2589 = -_2573;
    float _2591 = fma(_2565, _2587, _2589);
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2595 = -_2577;
    float _2597 = fma(_2567, _2593, _2595);
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2601 = -_2581;
    float _2603 = fma(_2563, _2599, _2601);
    float _2605 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2607 = _2591 * _2591;
    float _2609 = fma(_2553, _2561, _2543);
    float _2611 = fma(_2553, _2543, _2561);
    float _2613 = fma(_2597, _2597, _2607);
    float _2615 = _2549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2617 = _2471 * _2459;
    float _2619 = _2413 * _2445;
    float _2621 = fma(_2603, _2603, _2613);
    float _2623 = _2541 * _2605;
    float _2625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2557);
    float _2627 = _2471 * _2585;
    float _2629 = _2445 * _2585;
    float _2631 = _2413 * _2585;
    float _2633 = rsqrt(_2621);
    float _2635 = _2459 * _2585;
    float _2637 = _2625 * _2623;
    float _2639 = _2541 * _2569;
    float _2641 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2559);
    float _2643 = _2541 * _2615;
    float _2645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2555);
    float _2647 = -_2617;
    float _2649 = fma(_2553, _2619, _2647);
    float _2651 = _2641 * _2639;
    float _2653 = _2627 * _2637;
    float _2655 = _2645 * _2643;
    float _2657 = -_2619;
    float _2659 = fma(_2553, _2617, _2657);
    float _2661 = -_2637;
    float _2663 = _2553 * _2661;
    float _2665 = fma(_2609, _2655, _2653);
    float _2667 = _2631 * _2637;
    float _2669 = _2597 * _2633;
    float _2671 = _2591 * _2633;
    float _2673 = _2603 * _2633;
    float _2675 = fma(_2629, _2655, _2663);
    float _2677 = _2567 * _2669;
    float _2679 = fma(_2659, _2651, _2665);
    float _2681 = _2565 * _2671;
    float _2683 = fma(_2649, _2655, _2667);
    float _2685 = -_2677;
    float _2687 = fma(_2563, _2671, _2685);
    float _2689 = fma(_2635, _2651, _2675);
    float _2691 = -_2681;
    float _2693 = fma(_2567, _2673, _2691);
    float _2695 = fma(_2611, _2651, _2683);
    float _2697 = _2687 * _2679;
    bool _2699 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2701 = isnan(0.5);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2707 = _2703 || _2705;
    float _2709 = _2693 * _2679;
    bool _2711 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2713 = isnan(0.5);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2719 = _2715 || _2717;
    float _2721 = fma(_2673, _2689, _2697);
    float _2723 = fma(_2669, _2689, _2709);
    float _2725 = fma(_2565, _2695, _2721);
    float _2727 = fma(_2563, _2695, _2723);
    float _2729 = _1129 + _2725;
    float _2731 = _1523 + _2727;
    float _2733 = _2563 * _2673;
    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2737 = _2729 + _2735;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2741 = _2731 + _2739;
    float _2743 = -_2733;
    float _2745 = fma(_2565, _2669, _2743);
    float _2747 = _2737 * _2737;
    float _2749 = _2745 * _2679;
    float _2751 = fma(_2741, _2741, _2747);
    float _2753 = fma(_2671, _2689, _2749);
    float _2755 = sqrt(_2751);
    float _2757 = fma(_2567, _2695, _2753);
    float _2759 = _1087 + _2757;
    bool _2761 = _2755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2763 = _2695;
    float _2765 = _2757;
    float _2767 = _2753;
    float _2769 = _2759;
    if (!_2761)
    {
        _2763 = _2731;
    }
    float _2771 = _2763;
    float _2773 = _2771;
    if (!_2761)
    {
        _2765 = _2729;
    }
    float _2775 = _2765;
    float _2777 = _2775;
    if (!_2761)
    {
        _2767 = _2759;
    }
    float _2779 = _2767;
    bool _2781 = !_2761;
    float _2783 = _2779;
    if (!_2781)
    {
        float _2785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2789 = _2755 + _2787;
        float _2791 = rsqrt(_2751);
        float _2793 = _2789 * _2785;
        float _2795 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2797 = _2793 * 0.15915493667125701904296875;
        float _2799 = _2797 * 6.283185482025146484375;
        float _2801 = cos(_2799);
        float _2803 = _2797 * 6.283185482025146484375;
        float _2805 = sin(_2803);
        float _2807 = _2801 + (-1.0);
        float _2809 = fma(_2805, _2795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2811 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2813 = _2791 * _2809;
        float _2815 = fma(_2759, _2801, _2811);
        float _2817 = fma(_2741, _2813, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2819 = fma(_2737, _2813, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2773 = _2817;
        _2783 = _2815;
        _2777 = _2819;
    }
    float _2821 = _2773;
    float _2823 = _2783;
    float _2825 = _2777;
    float _2827 = -_2315;
    float _2829 = fma(_2827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2821);
    float _2831 = -_2313;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2823);
    float _2835 = -_2321;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2825);
    float _2839 = _2833;
    float _2841 = _2829;
    float _2843 = _2837;
    float _2845 = _2825;
    if (_2719)
    {
        _2769 = 1.0;
    }
    float _2847 = _2769;
    float _2849 = _2847;
    if (!_2707)
    {
        float _2851 = _2333 * _2333;
        float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2855 = -_1523;
        float _2857 = _2855 + _2821;
        float _2859 = -_1087;
        float _2861 = _2859 + _2823;
        float _2863 = fma(_2341, _2341, _2851);
        float _2865 = -_1129;
        float _2867 = _2865 + _2825;
        float _2869 = fma(_2349, _2349, _2863);
        float _2871 = 1.0 / _2541;
        float _2873 = sqrt(_2869);
        float _2875 = precise::min(_2873, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2877 = _2875 * _2853;
        float _2879 = _2877 * _2871;
        float _2881 = fma(_2857, _2879, _2325);
        float _2883 = fma(_2861, _2879, _2319);
        float _2885 = fma(_2867, _2879, _2337);
        _2839 = _2883;
        _2841 = _2881;
        _2843 = _2885;
    }
    float _2887 = _2839;
    float _2889 = _2841;
    float _2891 = _2843;
    if (!_2719)
    {
        float _2893 = in.m_79.w;
        int _2895 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _2897 = _2895 == 4;
        bool _2899 = _2895 == 8;
        bool _2901 = _2895 == 12;
        int _2903 = as_type<int>(_2893) << 16;
        int _2905 = as_type<int>(_2893) << 8;
        int _2907 = as_type<int>(_2893) << 24;
        int _2909 = _2903 >> 24;
        int _2911 = _2905 >> 24;
        int _2913 = as_type<int>(_2893) >> 24;
        int _2915 = _2907 >> 24;
        float _2917 = float(_2909);
        float _2919 = float(_2911);
        float _2921 = float(_2913);
        float _2923 = _2917 * 0.0078740157186985015869140625;
        float _2925 = float(_2915);
        float _2927 = _2919 * 0.0078740157186985015869140625;
        float _2929 = _2921 * 0.0078740157186985015869140625;
        float _2931 = precise::min(_2923, 1.0);
        float _2933 = _2925 * 0.0078740157186985015869140625;
        float _2935 = precise::min(_2927, 1.0);
        float _2937 = precise::min(_2929, 1.0);
        float _2939 = precise::min(_2933, 1.0);
        float _2941 = precise::max(_2931, -1.0);
        float _2943 = precise::max(_2935, -1.0);
        float _2945 = precise::max(_2937, -1.0);
        float _2947 = precise::max(_2939, -1.0);
        float _2949 = _2947;
        if (_2897)
        {
            _2949 = _2941;
        }
        float _2951 = _2949;
        float _2953 = _2951;
        if (_2899)
        {
            _2953 = _2943;
        }
        float _2955 = _2953;
        float _2957 = _2955;
        if (_2901)
        {
            _2957 = _2945;
        }
        float _2959 = _2957;
        float _2961 = abs(_2959);
        float _2963 = (-0.0) + _2961;
        _2849 = _2963;
    }
    float _2965 = _2849;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2969 = _2887 + _2967;
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2973 = _2889 + _2971;
    float _2975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2977 = _2891 + _2975;
    float _2979 = _2969 * _2969;
    bool _2981 = _2965 != 0.0;
    bool _2983 = isnan(_2965);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.0);
    bool _2989 = _2985 || _2987;
    float _2991 = fma(_2973, _2973, _2979);
    float _2993 = fma(_2977, _2977, _2991);
    float _2995 = rsqrt(_2993);
    float _2997 = sqrt(_2993);
    float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3001 = _2973 * _2999;
    float _3003 = _2977 * _2999;
    float _3005 = _3001 * _3001;
    float _3007 = _3003 * _3003;
    float _3009 = _3005 + _3007;
    float _3011 = sqrt(_3009);
    bool _3013 = _3011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3017 = _3011 + _3015;
    float _3019 = _2977;
    float _3021 = _3009;
    float _3023 = _3017;
    float _3025 = _3001;
    if (_3013)
    {
        float _3027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3019 = _3027;
    }
    float _3029 = _3019;
    if (_3013)
    {
        float _3031 = rsqrt(_3009);
        _3021 = _3031;
    }
    float _3033 = _3021;
    if (_3013)
    {
        float _3035 = _3017 * _3029;
        _3023 = _3035;
    }
    float _3037 = _3023;
    if (_3013)
    {
        float _3039 = _3037 * 0.15915493667125701904296875;
        _2845 = _3039;
    }
    float _3041 = _2845;
    float _3043 = _2979;
    float _3045 = _3041;
    if (_3013)
    {
        float _3047 = _3041 * 6.283185482025146484375;
        float _3049 = sin(_3047);
        _3043 = _3049;
    }
    float _3051 = _3043;
    float _3053 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3055 = precise::max(0.0, _3053);
    float _3057 = _2995;
    float _3059 = _3053;
    float _3061 = _3055;
    if (_3013)
    {
        float _3063 = _3041 * 6.283185482025146484375;
        float _3065 = cos(_3063);
        _3057 = _3065;
    }
    float _3067 = _3057;
    float _3069 = -_2999;
    float _3071 = -_3055;
    float _3073 = fma(_2969, _3069, _3071);
    float _3075 = _3073;
    if (_3013)
    {
        float _3077 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3059 = _3077;
    }
    float _3079 = _3059;
    float _3081 = _3051;
    float _3083 = _3079;
    if (_3013)
    {
        float _3085 = fma(_3051, _3079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3081 = _3085;
    }
    float _3087 = _3081;
    float _3089 = _3087;
    if (!_3013)
    {
        _3083 = _3003;
    }
    float _3091 = _3083;
    float _3093 = _3091;
    if (_3013)
    {
        float _3095 = _3067 + (-1.0);
        _3061 = _3095;
    }
    float _3097 = _3061;
    float _3099 = _3097;
    if (_3013)
    {
        float _3101 = _3033 * _3087;
        _3045 = _3101;
    }
    float _3103 = _3045;
    float _3105 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3107 = _3105;
    if (!_3013)
    {
        _3089 = _3005;
    }
    float _3109 = _3089;
    float _3111 = _3109;
    if (_3013)
    {
        float _3113 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3099 = _3113;
    }
    float _3115 = _3099;
    if (_3013)
    {
        float _3117 = _3001 * _3103;
        _3025 = _3117;
    }
    float _3119 = _3025;
    if (_3013)
    {
        float _3121 = _3003 * _3103;
        _3093 = _3121;
    }
    float _3123 = _3093;
    float _3125 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3105);
    if (_3013)
    {
        float _3127 = fma(_3073, _3067, _3115);
        _3075 = _3127;
    }
    float _3129 = _3075;
    if (_3013)
    {
        float _3131 = _3119 * _3119;
        _3111 = _3131;
    }
    float _3133 = _3111;
    if (!_3013)
    {
        _3107 = _3007;
    }
    float _3135 = _3107;
    float _3137 = _3135;
    if (_3013)
    {
        float _3139 = _3123 * _3123;
        _3137 = _3139;
    }
    float _3141 = _3137;
    float _3143 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3145 = fma(_3129, _3129, _3133);
    float _3147 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3125);
    float _3149 = floor(_3143);
    float _3151 = _3145 + _3141;
    float _3153 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3155 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3159 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3161 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3163 = rsqrt(_3151);
    float _3165 = -_3159;
    float _3167 = fma(_3165, _3157, 1.0);
    float _3169 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3161);
    float _3171 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3173 = fma(_2337, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3175 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3177 = _3169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3181 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3179);
    float _3183 = precise::clamp(_3181, 0.0, 1.0);
    float _3185 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3171);
    float _3187 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3175);
    float _3189 = floor(_3173);
    float _3191 = -_3183;
    float _3193 = _3191 + 1.0;
    float _3195 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3185);
    float _3197 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3187);
    float _3199 = _3163 * _3119;
    float _3201 = _3195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3203 = _3163 * _3129;
    float _3205 = abs(_3193);
    float _3207 = log2(_3205);
    float _3209 = _3199 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3211 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3213 = _3163 * _3123;
    float _3215 = _3197 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3217 = -_3209;
    float _3219 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3217);
    float _3221 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3211);
    float _3223 = log2(_3167);
    float _3225 = -_3213;
    float _3227 = fma(_3225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3219);
    float _3229 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3221);
    float _3231 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3233 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3235 = fma(_3227, -0.5, 0.5);
    float _3237 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3229);
    float _3239 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3231);
    float _3241 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3233);
    float _3243 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3245 = 1.0 / _3237;
    float _3247 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3239);
    float _3249 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3241);
    float _3251 = fma(_3227, 0.5, 0.5);
    float _3253 = -_3189;
    float _3255 = _3173 + _3253;
    float _3257 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3247);
    float _3259 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3249);
    float _3261 = fma(_3251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3263 = sqrt(_3235);
    float _3265 = _3223 * 0.693147182464599609375;
    float _3267 = _3203 + 1.0;
    float _3269 = fma(_3251, _3261, -0.212114393711090087890625);
    float _3271 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3273 = fma(_3251, _3269, 1.570728778839111328125);
    float _3275 = exp2(_3243);
    float _3277 = -_3149;
    float _3279 = _3143 + _3277;
    float _3281 = _3149;
    float _3283 = _3143;
    float _3285 = _3237;
    float _3287 = _3259;
    if (_2989)
    {
        _3281 = _3257;
    }
    float _3289 = _3281;
    float _3291 = _3289;
    if (_2989)
    {
        _3283 = _3259;
    }
    float _3293 = _3283;
    float _3295 = _3293;
    if (!_2989)
    {
        _3291 = 0.0;
        _3295 = 0.0;
    }
    float _3297 = _3291;
    float _3299 = _3295;
    float2 _8808 = float2(_3279, _3255);
    float _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8808, float2(0.0), isnan(_8808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8808, float2(0.0), isnan(_8808)), level(0.0)).x;
    float _3303 = _3263 * 0.636619746685028076171875;
    float _3305 = _3245 * _3297;
    float _3307 = _3245 * _3299;
    float _3309 = -_3273;
    float _3311 = fma(_3303, _3309, 1.0);
    float _3313 = fma(_3305, 0.5, 0.5);
    float _3315 = -_3203;
    float _3317 = fma(_3275, _3267, _3315);
    float _3319 = fma(_3307, -0.5, 0.5);
    float _3321 = fma(_3317, 0.5, 0.5);
    float3 _8845 = float3(_3313, _3319, _3271);
    float _3323 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8845, float3(0.0), isnan(_8845)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8845, float3(0.0), isnan(_8845)), level(0.0)).x;
    float3 _8856 = float3(_3313, _3319, _3271);
    float4 _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8856, float3(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8856, float3(0.0), isnan(_8856)), level(0.0)).xyzw;
    float _3328 = _3326.x;
    float _3330 = _3326.y;
    float _3332 = _3326.z;
    float _3334 = _3326.w;
    float2 _8872 = float2(_3311, _3321);
    float3 _3338 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8872, float2(0.0), isnan(_8872)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8872, float2(0.0), isnan(_8872)), level(0.0)).xyz;
    float _3340 = _3338.x;
    float _3342 = _3338.y;
    float _3344 = _3338.z;
    float _3346 = _2319 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3348 = _2319 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3350 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3352 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3346);
    float _3354 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3348);
    bool _3356 = _2557 != 0.0;
    bool _3358 = isnan(_2557);
    bool _3360 = _3356 || _3358;
    bool _3362 = isnan(0.0);
    bool _3364 = _3360 || _3362;
    float _3366 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3352);
    float _3368 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3354);
    bool _3370 = _2555 == 0.0;
    bool _3372 = !_3364;
    bool _3374 = _3370 && _3372;
    float _3376 = exp2(_3350);
    float _3378 = _3366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3380 = _3368 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3382 = _2559 == 0.0;
    bool _3384 = _3382 && _3374;
    float _3386 = _3380 + _3378;
    float _3388 = 1.0 / _3378;
    float _3390 = -_3376;
    float _3392 = _3390 + 1.0;
    float _3394 = in.m_81.x;
    float _3396 = in.m_81.y;
    float _3398 = in.m_81.z;
    float _3400 = in.m_81.w;
    float _3402 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3404 = _3386 * _3388;
    float _3406 = _3404 * 0.5;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3410 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3408);
    float _3412 = in.m_83.x;
    float _3414 = in.m_83.y;
    float _3416 = in.m_83.z;
    float _3418 = 1.0 / _3410;
    float _3420 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3422 = _3418 * _3420;
    float _3424 = abs(_3422);
    float _3426 = log2(_3424);
    float _3428 = _3418;
    float _3430 = _3412;
    if (_3384)
    {
        _2059 = _3412;
    }
    float _3432 = _2059;
    float _3434 = _3432;
    if (_3384)
    {
        _2247 = _3414;
    }
    float _3436 = _2247;
    float _3438 = _3436;
    if (_3384)
    {
        _3428 = _3416;
    }
    float _3440 = _3428;
    float _3442 = _3440;
    if (!_3384)
    {
        float _3444 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3416);
        _3442 = _3444;
    }
    float _3446 = _3442;
    bool _3448 = _3422 <= 8000.0;
    bool _3450 = isnan(_3422);
    bool _3452 = _3448 || _3450;
    bool _3454 = isnan(8000.0);
    bool _3456 = _3452 || _3454;
    float _3458 = float(_3456);
    float _3460 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3462 = _3426;
    if (_3384)
    {
        _3462 = _3432;
    }
    float _3464 = _3462;
    float _3466 = _3464;
    if (!_3384)
    {
        _3434 = _3412;
    }
    float _3468 = _3434;
    if (_3384)
    {
        _3430 = _3436;
    }
    float _3470 = _3430;
    float _3472 = exp2(_3460);
    float _3474 = _3470;
    if (!_3384)
    {
        _3438 = _3414;
    }
    float _3476 = _3438;
    if (!_3384)
    {
        float _3478 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3468);
        _3466 = _3478;
    }
    float _3480 = _3466;
    float _3482 = _3398 * _3468;
    if (!_3384)
    {
        float _3484 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3476);
        _3474 = _3484;
    }
    float _3486 = _3474;
    float _3488 = _3396 * _3416;
    float _3490 = _3394 * _3476;
    float _3492 = -_3482;
    float _3494 = fma(_3394, _3416, _3492);
    bool _3496 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3498 = isnan(_2997);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3504 = _3500 || _3502;
    float _3506 = -_3488;
    float _3508 = fma(_3398, _3476, _3506);
    float _3510 = _3508 * _3400;
    float _3512 = fma(_3472, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3514 = precise::clamp(_3512, 0.0, 1.0);
    float _3516 = -_3490;
    float _3518 = fma(_3396, _3468, _3516);
    float _3520 = _3494 * _3400;
    float _3522 = _2627 * _2687;
    float _3524 = fma(_3514, -2.0, 3.0);
    float _3526 = _3514 * _3514;
    float _3528 = _3518 * _3400;
    float _3530 = _2609 * _2693;
    float _3532 = _2609 * _2745;
    float _3534 = _3526 * _3524;
    float _3536 = _2609 * _2687;
    float _3538 = _2627 * _2693;
    float _3540 = _2627 * _2745;
    float _3542 = _2659 * _2693;
    float _3544 = _2659 * _2745;
    float _3546 = _2659 * _2687;
    float _3548 = fma(_2629, _2669, _3530);
    float _3550 = -_2553;
    float _3552 = fma(_3550, _2669, _3538);
    float _3554 = -_2553;
    float _3556 = fma(_3554, _2671, _3540);
    float _3558 = fma(_2629, _2671, _3532);
    float _3560 = -_2553;
    float _3562 = fma(_3560, _2673, _3522);
    float _3564 = -_3534;
    float _3566 = _3564 + 1.0;
    float _3568 = fma(_2629, _2673, _3536);
    float _3570 = fma(_2635, _2669, _3542);
    float _3572 = fma(_2635, _2671, _3544);
    float _3574 = fma(_2635, _2673, _3546);
    float _3576 = fma(_2631, _2563, _3552);
    float _3578 = fma(_2631, _2567, _3556);
    float _3580 = fma(_2631, _2565, _3562);
    float _3582 = fma(_3566, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3534);
    float _3584 = fma(_2649, _2567, _3558);
    float _3586 = fma(_2649, _2563, _3548);
    float _3588 = fma(_2611, _2563, _3570);
    float _3590 = fma(_2611, _2567, _3572);
    float _3592 = _3576 * _3396;
    float _3594 = _3578 * _3396;
    float _3596 = _3580 * _3396;
    float _3598 = _3576 * _3486;
    float _3600 = fma(_2649, _2565, _3568);
    float _3602 = fma(_2611, _2565, _3574);
    float _3604 = _3520 * _3576;
    float _3606 = _3520 * _3578;
    float _3608 = _3520 * _3580;
    float _3610 = fma(_3586, _3480, _3598);
    float _3612 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3614 = fma(_3586, _3394, _3592);
    float _3616 = fma(_3584, _3394, _3594);
    float _3618 = fma(_3600, _3394, _3596);
    float _3620 = fma(_3510, _3586, _3604);
    float _3622 = fma(_3510, _3584, _3606);
    float _3624 = fma(_3510, _3600, _3608);
    float _3626 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3612);
    float _3628 = fma(_3588, _3398, _3614);
    float _3630 = fma(_3590, _3398, _3616);
    float _3632 = fma(_3602, _3398, _3618);
    float _3634 = fma(_3528, _3588, _3620);
    float _3636 = _3458 * _3582;
    float _3638 = in.m_79.x;
    float _3640 = _3578 * _3486;
    float _3642 = _3580 * _3486;
    float _3644 = _3636 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _3628;
    out.m_85.y = _3630;
    out.m_85.z = _3632;
    float _3646 = fma(_3584, _3480, _3640);
    float _3648 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3626);
    float _3650 = fma(_3600, _3480, _3642);
    float _3652 = fma(_3528, _3590, _3622);
    float _3654 = fma(_3528, _3602, _3624);
    float _3656 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3648);
    float _3658 = fma(_3588, _3446, _3610);
    float _3660 = _3656 + _3237;
    int _3662 = as_type<int>(_3616);
    float _3664 = _3257;
    float _3666 = _3654;
    float _3668 = _3652;
    float _3670 = _3634;
    if (!_2989)
    {
        float _3672 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _3662 = as_type<int>(_3672);
    }
    int _3674 = _3662;
    float _3676 = fma(_3602, _3446, _3650);
    float _3678 = _3660 * 0.5;
    float _3680 = fma(_3590, _3446, _3646);
    out.gl_Position.x = _3257;
    out.gl_Position.y = _3259;
    out.gl_Position.z = _3656;
    out.gl_Position.w = _3237;
    if (!_2989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9455 = as_type<float>(_3674);
        out.gl_Position.z = _9455;
    }
    out.m_87.z = _3678;
    out.m_87.w = _3237;
    out.m_89.x = _3658;
    out.m_89.y = _3680;
    out.m_89.z = _3676;
    float _3682 = _2965 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3684 = _3682;
    if (!_2989)
    {
        _3684 = 0.0;
    }
    float _3686 = _3684;
    out.m_91.x = _3634;
    out.m_91.y = _3652;
    out.m_91.z = _3654;
    if (!_3504)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3688 = _3285;
    float _3690 = _3688;
    float _3692 = _3688;
    if (!_3504)
    {
        _3664 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3694 = _3664;
    float _3696 = _3694;
    float _3698 = _3694;
    if (!_3504)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3700 = _3287;
    float _3702 = _3700;
    float _3704 = _3700;
    if (!_3504)
    {
        _3666 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3706 = _3666;
    float _3708 = _3706;
    float _3710 = _3706;
    if (!_3504)
    {
        _3668 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3712 = _3668;
    float _3714 = _3712;
    float _3716 = _3712;
    if (!_3504)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3718 = _3670;
    float _3720 = -_3301;
    float _3722 = _3720 + 1.0;
    float _3724 = _3722 * _3644;
    float _3726 = precise::clamp(_3724, 0.0, 1.0);
    float _3728 = -_3726;
    float _3730 = fma(_3728, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3732 = _3730 * _3638;
    float _3734 = _3402 * _3323;
    float _3736 = -_3402;
    float _3738 = _3736 + 1.0;
    float _3740 = _3732 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3742 = _3334 * _3734;
    float _3744 = _3344 * _3734;
    float _3746 = _3334 * _3738;
    out.m_93.x = _3740;
    float _3748 = fma(_3340, _3742, _3328);
    float _3750 = fma(_3342, _3742, _3330);
    float _3752 = fma(_3334, _3744, _3332);
    out.m_95.x = _3748;
    out.m_95.y = _3750;
    out.m_95.z = _3752;
    out.m_95.w = _3746;
    bool _3754 = !_3504;
    float _3756 = _3718;
    float _3758 = _3718;
    if (!_3754)
    {
        bool _3760 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3762 = isnan(_2997);
        bool _3764 = _3760 || _3762;
        bool _3766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3768 = _3764 || _3766;
        if (!_3768)
        {
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = _2997 + _3770;
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3776 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3774;
            float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3786 = 1.0 / _3776;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3792 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3800 = _3772 * _3786;
            float _3802 = precise::clamp(_3800, 0.0, 1.0);
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3808 = fma(_3802, _3780, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3810 = fma(_3802, _3784, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3812 = fma(_3802, _3806, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3814 = fma(_3802, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3816 = fma(_3802, _3794, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3818 = fma(_3802, _3798, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3716 = _3808;
            _3698 = _3816;
            _3710 = _3810;
            _3692 = _3814;
            _3758 = _3812;
            _3704 = _3818;
            _3820 = true;
        }
        else
        {
            bool _3822 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3824 = isnan(_2997);
            bool _3826 = _3822 || _3824;
            bool _3828 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3830 = _3826 || _3828;
            if (!_3830)
            {
                _3690 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3832 = _3690;
            _3692 = _3832;
            if (!_3830)
            {
                _3696 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3834 = _3696;
            _3698 = _3834;
            if (!_3830)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3836 = _3702;
            _3704 = _3836;
            if (!_3830)
            {
                _3708 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3838 = _3708;
            _3710 = _3838;
            if (!_3830)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3840 = _3714;
            _3716 = _3840;
            if (!_3830)
            {
                _3756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3842 = _3756;
            bool _3844 = !_3830;
            _3758 = _3842;
            if (!_3844)
            {
                bool _3846 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3848 = isnan(_2997);
                bool _3850 = _3846 || _3848;
                bool _3852 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3854 = _3850 || _3852;
                if (!_3854)
                {
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3858 = _2997 + _3856;
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3862 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3860;
                    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3870 = _3868 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3872 = 1.0 / _3862;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3880 = _3878 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3886 = _3858 * _3872;
                    float _3888 = precise::clamp(_3886, 0.0, 1.0);
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3894 = fma(_3888, _3866, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3896 = fma(_3888, _3870, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3898 = fma(_3888, _3892, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3900 = fma(_3888, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3902 = fma(_3888, _3880, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3904 = fma(_3888, _3884, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3716 = _3894;
                    _3698 = _3902;
                    _3710 = _3896;
                    _3692 = _3900;
                    _3758 = _3898;
                    _3704 = _3904;
                    _3820 = true;
                }
                else
                {
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3698 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3710 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3692 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3820 = false;
    float _3906 = _3716;
    float _3908 = _3698;
    float _3910 = _3710;
    float _3912 = _3692;
    float _3914 = _3758;
    float _3916 = _3704;
    float _3918 = fma(_3680, -0.5, 0.5);
    float _3920 = precise::clamp(_3918, 0.0, 1.0);
    float _3922 = -_3906;
    float _3924 = _3908 + _3922;
    float _3926 = -_3910;
    float _3928 = _3912 + _3926;
    float _3930 = -_3914;
    float _3932 = _3916 + _3930;
    bool _3934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3936 = fma(_3920, _3924, _3906);
    float _3938 = fma(_3920, _3928, _3910);
    float _3940 = fma(_3920, _3932, _3914);
    float _3942 = _3686 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3944 = _3936 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3946 = fma(_3938, 0.298911988735198974609375, _3944);
    out.m_93.w = _3942;
    float _3948 = fma(_3940, 0.114477999508380889892578125, _3946);
    float _3950 = -_3948;
    float _3952 = _3938 + _3950;
    float _3954 = -_3948;
    float _3956 = _3936 + _3954;
    float _3958 = -_3948;
    float _3960 = _3940 + _3958;
    out.m_97.x = 0.0;
    float _3962 = fma(_3952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    float _3964 = fma(_3956, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    float _3966 = fma(_3960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    out.m_99.x = _3962;
    out.m_99.y = _3964;
    out.m_99.z = _3966;
    if (!_3934)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3968 = -_2887;
    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3972 = -_2889;
    float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3976 = -_2891;
    float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3980 = _3970 * _3970;
    float _3982 = fma(_3974, _3974, _3980);
    float _3984 = fma(_3978, _3978, _3982);
    float _3986 = sqrt(_3984);
    float _3988 = rsqrt(_3984);
    float _3990 = -_3986;
    float _3992 = _3990 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3994 = _3992 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3996 = precise::clamp(_3994, 0.0, 1.0);
    float _3998 = _3974 * _3988;
    float _4000 = _3970 * _3988;
    float _4002 = abs(_3996);
    float _4004 = log2(_4002);
    float _4006 = _3978 * _3988;
    float _4008 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4010 = _3680 * _4000;
    float _4012 = -_4000;
    float _4014 = -_4008;
    float _4016 = fma(_4012, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4014);
    float _4018 = fma(_3658, _3998, _4010);
    float _4020 = -_4006;
    float _4022 = fma(_4020, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4016);
    float _4024 = fma(_3676, _4006, _4018);
    float _4026 = precise::clamp(_4024, 0.0, 1.0);
    float _4028 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4030 = _4022 + _4028;
    float _4032 = _4004 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4034 = _4030 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4036 = precise::clamp(_4034, 0.0, 1.0);
    float _4038 = exp2(_4032);
    float _4040 = _4038 * _4036;
    float _4042 = _4026 * _4040;
    float _4044 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4046 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4048 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4044;
    out.m_97.y = _4046;
    out.m_97.z = _4048;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3820 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4105 = as_type<float>(_134);
        out.gl_Position.z = _4105;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_51.w;
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
        float _158 = float(_118);
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
        out.m_49.x = 0.0;
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
        float _4174 = as_type<float>(_172);
        out.gl_Position.z = _4174;
    }
    if (_166)
    {
        return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _208 = int(_206);
    float _210 = in.m_53.x;
    float _212 = in.m_53.y;
    float _214 = in.m_55.x;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _218 = _216 != 0;
    float _220 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _222 = int(_220);
    float _224 = float(_118);
    float _226 = in.m_55.y;
    float _228 = in.m_46.x;
    float _230 = in.m_46.y;
    float _232 = in.m_46.z;
    float _234 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _236 = int(_234);
    float _238 = float(_208);
    float _240 = in.m_53.w;
    float _242 = in.m_57.w;
    float _244 = 1.0 / _238;
    float _246 = float(_222);
    float _248 = in.m_57.x;
    float _250 = in.m_57.y;
    float _252 = float(uint(_236));
    float _254 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _256 = int(_254);
    bool _258 = _236 == 0;
    float _260 = in.m_57.z;
    int _262 = ~_236;
    int _264 = _262 + 1;
    float _266 = _244 * _152;
    float _268 = 1.0 / _246;
    out.m_59.w = _242;
    float _270 = 1.0 / _252;
    float _272 = float(uint(_256));
    out.m_59.x = _248;
    int _274 = ~_256;
    int _276 = _274 + 1;
    int _278 = ~_256;
    int _280 = _278 + 1;
    out.m_59.y = _250;
    float _282 = trunc(_266);
    int _284 = int(_282);
    float _286 = _268 * _152;
    float _288 = _268;
    float _290 = _214;
    float _292 = _226;
    if (_218)
    {
        float _294 = in.m_53.x;
        _288 = _294;
    }
    float _296 = _288;
    float _298 = _296;
    if (!_218)
    {
        float _300 = in.m_53.y;
        _298 = _300;
    }
    float _302 = _298;
    int _304 = as_type<int>(_270) + (-2);
    float _306 = 1.0 / _272;
    int _308 = ~_236;
    int _310 = _308 + 1;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.z = _260;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _318 = float(uint(_284));
    float _320 = trunc(_286);
    int _322 = int(_320);
    float _324 = as_type<float>(_304) * _318;
    float _326 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _328 = trunc(_324);
    float _330 = precise::max(_328, 0.0);
    uint _333 = uint(_330);
    int _335 = as_type<int>(_306) + (-2);
    float _337 = float(uint(_322));
    float _339 = 1.0 / _224;
    float _341 = _324;
    if (_218)
    {
        _341 = 1.0;
    }
    float _343 = _341;
    float _345 = _343;
    if (!_218)
    {
        _345 = 7.345489978790283203125;
    }
    float _347 = _345;
    float _349 = as_type<float>(_335) * _337;
    int _351 = _310 * int(_333);
    int _353 = _351 + _284;
    float _355 = trunc(_349);
    float _357 = precise::max(_355, 0.0);
    uint _359 = uint(_357);
    float _361 = float(uint(_353));
    float _363 = as_type<float>(_304) * _361;
    float _365 = _347 * _210;
    int _367 = ~_236;
    int _369 = _367 + 1;
    float _371 = floor(_365);
    int _373 = _276 * int(_359);
    int _375 = _373 + _322;
    float _377 = float(uint(_375));
    float _379 = trunc(_363);
    float _381 = precise::max(_379, 0.0);
    uint _383 = uint(_381);
    float _385 = as_type<float>(_335) * _377;
    float _387 = as_type<float>(_369);
    if (_218)
    {
        _387 = 1.0;
    }
    float _389 = _387;
    float _391 = -_371;
    float _393 = _365 + _391;
    float _395 = _389;
    if (!_218)
    {
        _395 = 1.2345600128173828125;
    }
    float _397 = _395;
    float _399 = trunc(_385);
    float _401 = precise::max(_399, 0.0);
    uint _403 = uint(_401);
    int _405 = int(_333) + int(_383);
    float _407 = float(_236);
    float _409 = float(_284);
    int _411 = _369 * _405;
    int _413 = _411 + _284;
    float _415 = _393 * _407;
    bool _417 = _409 >= _407;
    bool _419 = isnan(_409);
    bool _421 = _417 || _419;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = _407 * _152;
    bool _431 = uint(_413) >= uint(_236);
    float _433 = _302 * _397;
    int _435 = int(_359) + int(_403);
    float _437 = _429 * _339;
    float _439 = trunc(_427);
    int _441 = int(_439);
    bool _443 = !_431;
    int _445 = _443 ? 0 : (-1);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _449 = _447 != 0;
    int _451 = ~_405;
    int _453 = _451 + _445;
    int _455 = _453 + 1;
    bool _457 = !_449;
    int _459 = _457 ? 0 : 1;
    float _461 = trunc(_415);
    int _463 = int(_461);
    int _465 = ~_256;
    int _467 = _465 + 1;
    int _469 = abs(_459);
    int _471 = _236 * _455;
    int _473 = _471 + _284;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _485 = _483 != 0;
    float _487 = float(_256);
    float _489 = trunc(_437);
    int _491 = int(_489);
    int _493 = _467 * _435;
    int _495 = _493 + _322;
    int _497 = ~_441;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    bool _503 = !_258;
    int _505 = _503 ? _473 : (-1);
    bool _507 = uint(_495) >= uint(_256);
    int _509 = _463 * _469;
    int _511 = _509 + _284;
    float _513 = floor(_433);
    int _515 = _505 * _501;
    bool _517 = !_477;
    int _519 = _517 ? 0 : 1;
    int _521 = _236 + (-1);
    int _523 = abs(_519);
    float _525 = float(_322);
    int _527 = _441 * _521;
    int _529 = _527 + _515;
    bool _531 = !_481;
    int _533 = _531 ? 0 : 1;
    bool _535 = _525 >= _487;
    bool _537 = isnan(_525);
    bool _539 = _535 || _537;
    bool _541 = isnan(_487);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    int _547 = abs(_533);
    bool _549 = !_485;
    int _551 = _549 ? 0 : 1;
    float _553 = -_513;
    float _555 = _433 + _553;
    float _557 = trunc(_545);
    int _559 = int(_557);
    int _561 = abs(_551);
    int _563 = _529 * _547;
    bool _565 = !_507;
    int _567 = _565 ? 0 : (-1);
    float _569 = _487 * _555;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _573 = _571 != 0;
    int _575 = _491 * _523;
    int _577 = _575 + _563;
    int _579 = ~_435;
    int _581 = _579 + _567;
    int _583 = _581 + 1;
    float _585 = in.m_53.z;
    bool _587 = !_573;
    int _589 = _587 ? 0 : 1;
    float _591 = trunc(_569);
    int _593 = int(_591);
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _597 = _595 != 0;
    int _599 = _256 * _583;
    int _601 = _599 + _322;
    int _603 = abs(_589);
    int _605 = _511 * _561;
    int _607 = _605 + _577;
    bool _609 = _256 == 0;
    float _611 = _487 * _152;
    bool _613 = !_597;
    int _615 = _613 ? 0 : 1;
    float _617 = _611 * _339;
    int _619 = ~_559;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    int _625 = _463 * _603;
    int _627 = _625 + _607;
    bool _629 = !_609;
    int _631 = _629 ? _601 : (-1);
    int _633 = abs(_615);
    int _635 = _256 + (-1);
    int _637 = _623 * _631;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _641 = _639 != 0;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _645 = _643 != 0;
    float _647 = trunc(_617);
    int _649 = int(_647);
    int _651 = _559 * _635;
    int _653 = _651 + _637;
    float _655 = float(uint(_627));
    bool _657 = !_645;
    int _659 = _657 ? 0 : 1;
    int _661 = _593 * _633;
    int _663 = _661 + _322;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _671 = _669 != 0;
    float _673 = as_type<float>(_304) * _655;
    bool _675 = !_641;
    int _677 = _675 ? 0 : 1;
    int _679 = abs(_659);
    float _681 = trunc(_673);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    bool _687 = !_667;
    int _689 = _687 ? 0 : 1;
    int _691 = abs(_677);
    int _693 = ~_236;
    int _695 = _693 + 1;
    int _697 = abs(_689);
    int _699 = _653 * _679;
    bool _701 = !_671;
    int _703 = _701 ? 0 : 1;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _707 = _705 != 0;
    int _709 = _649 * _691;
    int _711 = _709 + _699;
    int _713 = abs(_703);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _717 = _715 != 0;
    int _719 = _663 * _697;
    int _721 = _719 + _711;
    int _723 = _695 * int(_685);
    int _725 = _723 + _627;
    float _727 = float(uint(_511));
    bool _729 = _236 == 0;
    int _731 = _593 * _713;
    int _733 = _731 + _721;
    float _735 = _673;
    float _737 = as_type<float>(_523);
    int _739 = _695;
    bool _741 = _667;
    bool _743 = _645;
    if (_707)
    {
        float _745 = in.m_53.x;
        _735 = _745;
    }
    float _747 = _735;
    float _749 = float(uint(_725));
    float _751 = as_type<float>(_304) * _727;
    if (!_707)
    {
        _737 = _214;
    }
    float _753 = _737;
    float _755 = in.m_61.x;
    float _757 = in.m_61.y;
    float _759 = in.m_61.z;
    float _761 = in.m_61.w;
    float _763 = float(uint(_733));
    float _765 = as_type<float>(_304) * _749;
    int _767 = as_type<int>(_763);
    float _769 = _753;
    if (_717)
    {
        float _771 = -_214;
        float _773 = _771 + 1.0;
        _739 = as_type<int>(_773);
    }
    int _775 = _739;
    if (_717)
    {
        bool _777 = _585 > 0.5;
        _741 = _777;
    }
    bool _779 = _741;
    float _781 = trunc(_751);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    float _787 = as_type<float>(_335) * _763;
    if (_707)
    {
        float _789 = -_214;
        float _791 = _789 + 1.0;
        _767 = as_type<int>(_791);
    }
    int _793 = _767;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _797 = _795 != 0;
    float _799 = trunc(_787);
    float _801 = precise::max(_799, 0.0);
    uint _803 = uint(_801);
    if (_707)
    {
        bool _805 = _747 > 0.5;
        _743 = _805;
    }
    bool _807 = _743;
    float _809 = trunc(_765);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    int _815 = 0;
    if (_797)
    {
        _815 = 0;
    }
    int _817 = _815;
    int _819 = _817;
    if (_707)
    {
        float _821 = _807 ? as_type<float>(_793) : _214;
        _769 = _821;
    }
    float _823 = _769;
    float _825 = _230 * _757;
    if (_717)
    {
        float _827 = _779 ? as_type<float>(_775) : _214;
        _290 = _827;
    }
    float _829 = _290;
    bool _831 = _212 > 0.5;
    float _833 = fma(_228, _755, _825);
    int _835 = ~_256;
    int _837 = _835 + 1;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _841 = _839 != 0;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _845 = _843 != 0;
    int _847 = _837 * int(_803);
    int _849 = _847 + _733;
    if (!_797)
    {
        _819 = 1;
    }
    int _851 = _819;
    int _853 = int(_685) + int(_813);
    float _855 = float(uint(_849));
    float _857 = in.m_63.x;
    float _859 = in.m_63.y;
    float _861 = in.m_63.z;
    float _863 = in.m_63.w;
    int _865 = _264 * _853;
    int _867 = _865 + _627;
    float _869 = in.m_65.x;
    float _871 = in.m_65.y;
    float _873 = in.m_65.z;
    float _875 = in.m_65.w;
    float _877 = as_type<float>(_335) * _855;
    bool _879 = uint(_867) >= uint(_236);
    float _881 = -_226;
    float _883 = _881 + 1.0;
    float _885 = trunc(_877);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    bool _891 = !_879;
    int _893 = _891 ? 0 : (-1);
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _897 = _895 != 0;
    int _899 = _831 ? as_type<int>(_883) : as_type<int>(_226);
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _903 = _901 != 0;
    float _905 = _841 ? as_type<float>(_899) : _226;
    bool _907 = _240 > 0.5;
    int _909 = ~_236;
    int _911 = _909 + 1;
    float _913 = _230 * _859;
    int _915 = int(_803) + int(_889);
    if (_897)
    {
        float _917 = _907 ? _883 : _226;
        _292 = _917;
    }
    float _919 = _292;
    float _921 = _230 * _871;
    int _923 = ~_256;
    int _925 = _923 + 1;
    int _927 = ~_853;
    int _929 = _927 + _893;
    int _931 = _929 + 1;
    float _933 = fma(_228, _857, _913);
    int _935 = _925 * _915;
    int _937 = _935 + _733;
    int _939 = _236 * _931;
    int _941 = _939 + _627;
    int _943 = _911 * int(_785);
    int _945 = _943 + _511;
    bool _947 = uint(_937) >= uint(_256);
    float _949 = fma(_228, _869, _921);
    float _951 = float(uint(_663));
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _955 = !_729;
    int _957 = _955 ? _941 : (-1);
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _961 = float(uint(_945));
    float _963 = as_type<float>(_335) * _951;
    int _965 = _957 & 3;
    bool _967 = _965 != 0;
    float _969 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _971 = !_947;
    int _973 = _971 ? 0 : (-1);
    float _975 = as_type<float>(_304) * _961;
    int _977 = _967 ? 0 : 1;
    float _979 = trunc(_963);
    float _981 = precise::max(_979, 0.0);
    uint _983 = uint(_981);
    int _985 = _957 & 3;
    bool _987 = _985 != 0;
    float _989 = _210 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _991 = uint(_985) > 1u;
    float _993 = -_959;
    float _995 = fma(_989, 2.0, _993);
    float _997 = trunc(_975);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1005 = ~_915;
    int _1007 = _1005 + _973;
    int _1009 = _1007 + 1;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1015 = _280 * int(_983);
    int _1017 = _1015 + _663;
    bool _1019 = !_903;
    int _1021 = _1019 ? 0 : 1;
    out.m_67.x = _1011;
    out.m_67.y = _316;
    out.m_67.z = _969;
    out.m_67.w = _314;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1023;
    float _1027 = fma(_326, -2.0, _1013);
    float _1029 = float(uint(_1017));
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1035 = int(_785) + int(_1001);
    float _1037 = as_type<float>(_335) * _1029;
    int _1039 = ~_977;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = 1.0 / _1025;
    int _1047 = _1043;
    if (!_991)
    {
        int _1049 = ~_977;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    float _1055 = fma(_232, _861, _933);
    bool _1057 = uint(_985) >= 2u;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1061 = ~_236;
    int _1063 = _1061 + 1;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1067 = _1057 ? 0 : 1;
    float _1069 = trunc(_1037);
    float _1071 = precise::max(_1069, 0.0);
    uint _1073 = uint(_1071);
    bool _1075 = _985 != 3;
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1081 = ~_1067;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    float _1087 = _1055 + _863;
    int _1089 = _1063 * _1035;
    int _1091 = _1089 + _511;
    float _1093 = 1.0 / _1033;
    int _1095 = _256 * _1009;
    int _1097 = _1095 + _733;
    float _1099 = fma(_232, _759, _833);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1103 = ~_256;
    int _1105 = _1103 + 1;
    float _1107 = fma(_232, _873, _949);
    int _1109 = _1085;
    if (_1075)
    {
        int _1111 = ~_1067;
        int _1113 = _1111 + 1;
        _1109 = _1113;
    }
    int _1115 = _1109;
    float _1117 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1119 = uint(_1091) >= uint(_236);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1123 = _204 + _1121;
    bool _1125 = !_609;
    int _1127 = _1125 ? _1097 : (-1);
    float _1129 = _1107 + _875;
    bool _1131 = !_1119;
    int _1133 = _1131 ? 0 : (-1);
    out.m_69.x = _1077;
    out.m_69.y = _1079;
    out.m_69.z = _1117;
    int _1135 = _1127 & 3;
    bool _1137 = _1135 != 0;
    float _1139 = _1123 * _1045;
    int _1141 = int(_983) + int(_1073);
    float _1143 = _210 + _212;
    int _1145 = _1137 ? 0 : 1;
    bool _1147 = uint(_1135) >= 2u;
    float _1149 = _1143 + (-1.0);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1153 = _204 + _1151;
    int _1155 = _1147 ? 0 : 1;
    float _1157 = _210 * 2.0;
    bool _1159 = _1135 != 3;
    int _1161 = _1105 * _1141;
    int _1163 = _1161 + _663;
    float _1165 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1167 = _212 * 2.0;
    float _1169 = floor(_1157);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1173 = _204 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1183 = ~_1155;
    int _1185 = _1183 + 1;
    int _1187 = _1185 + 1;
    float _1189 = _1173 * _1093;
    bool _1191 = !_845;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _1187;
    if (_1159)
    {
        int _1197 = ~_1155;
        int _1199 = _1197 + 1;
        _1195 = _1199;
    }
    int _1201 = _1195;
    float _1203 = floor(_1167);
    bool _1205 = uint(_1163) >= uint(_256);
    float _1207 = _210 + _585;
    int _1209 = ~_1035;
    int _1211 = _1209 + _1133;
    int _1213 = _1211 + 1;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1217 = _204 + _1215;
    bool _1219 = !_1205;
    int _1221 = _1219 ? 0 : (-1);
    float _1223 = _1207 + (-1.0);
    bool _1225 = uint(_1135) > 1u;
    float _1227 = 1.0 / _1181;
    int _1229 = ~_1145;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    int _1235 = _236 * _1213;
    int _1237 = _1235 + _511;
    int _1239 = ~_1141;
    int _1241 = _1239 + _1221;
    int _1243 = _1241 + 1;
    bool _1245 = _1169 > 0.0;
    int _1247 = _256 * _1243;
    int _1249 = _1247 + _663;
    float _1251 = _212 + _585;
    bool _1253 = _1203 >= 0.0;
    bool _1255 = isnan(_1203);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.0);
    bool _1261 = _1257 || _1259;
    float _1263 = 1.0 / _1177;
    int _1265 = _1233;
    if (!_1225)
    {
        int _1267 = ~_1145;
        int _1269 = _1267 + 1;
        _1265 = _1269;
    }
    int _1271 = _1265;
    float _1273 = _1251 + (-1.0);
    bool _1275 = _1169 >= 0.0;
    bool _1277 = isnan(_1169);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.0);
    bool _1283 = _1279 || _1281;
    bool _1285 = !_729;
    int _1287 = _1285 ? _1237 : (-1);
    float _1289 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1291 = _1283 ? 0 : 1;
    float _1293 = _1217 * _1227;
    bool _1295 = _1203 > 0.0;
    float _1297 = _585 * 2.0;
    bool _1299 = !_609;
    int _1301 = _1299 ? _1249 : (-1);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1303;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1313 = _1311 != 0;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1317 = _1315 != 0;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1323 = ~_1291;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    float _1329 = _1153 * _1263;
    int _1331 = _957 >> 31;
    int _1333 = _1327;
    if (!_1245)
    {
        int _1335 = ~_1291;
        int _1337 = _1335 + 1;
        _1333 = _1337;
    }
    int _1339 = _1333;
    float _1341 = fma(_1305, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1343 = _1127 >> 31;
    int _1345 = _1127 & 3;
    bool _1347 = _1345 != 0;
    int _1349 = _1331 & 3;
    int _1351 = _1343 & 3;
    bool _1353 = !_1347;
    int _1355 = _1353 ? 0 : 1;
    float _1357 = floor(_1297);
    bool _1359 = _985 != 3;
    int _1361 = _957 + _1349;
    int _1363 = _1127 + _1351;
    int _1365 = _1363 >> 2;
    int _1367 = _1361 >> 2;
    float _1369 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1371 = _1365 << 4;
    int _1373 = _1371 + 512;
    bool _1375 = !_1359;
    int _1377 = _1375 ? 0 : (-1);
    bool _1379 = _1135 != 3;
    int _1381 = _1367 << 4;
    int _1383 = _1381 + 368;
    uint _1385 = uint(int(uint(_1373) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[int(_1395)][_1397];
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1401;
    float _1405 = fma(_1403, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1411;
    uint _1415 = uint(int(uint(_1383) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1431;
    float _1435 = fma(_1409, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1437 = fma(_1413, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1443 = fma(_1433, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _1449 = !_987;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1383 + 8;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    float _1471 = fma(_1441, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1473 = fma(_1447, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _1475 = abs(_1053);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1477;
    int _1481 = _1261 ? 0 : 1;
    float _1483 = fma(_1321, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _1485 = _851 != 1;
    int _1487 = _1373 + 8;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[int(_1499)][_1501];
    int _1505 = abs(_1451);
    float _1507 = fma(_1479, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _1509 = abs(_1271);
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1513 = _1511 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    int _1515 = abs(_1355);
    int _1517 = ~_1475;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1099 + _761;
    bool _1525 = !_1379;
    int _1527 = _1525 ? 0 : (-1);
    bool _1529 = _1357 > 0.0;
    bool _1531 = _1357 >= 0.0;
    bool _1533 = isnan(_1357);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.0);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1541;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _1549 = ~_1509;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    float _1555 = fma(_1543, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _1557 = ~_1515;
    int _1559 = _1557 + 1;
    int _1561 = _1559 + 1;
    float _1563 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1565 = int(_1563);
    int _1567 = abs(_1377);
    int _1569 = _1553 * as_type<int>(_1399);
    int _1571 = abs(_1193);
    float _1573 = fma(_1547, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _1575 = ~_1567;
    int _1577 = _1575 + 1;
    int _1579 = _1577 + 1;
    int _1581 = _1561 * as_type<int>(_1391);
    int _1583 = _1581 + _1569;
    int _1585 = abs(_1115);
    float _1587 = fma(_1513, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _1589 = abs(_1201);
    int _1591 = _1521 * as_type<int>(_1429);
    int _1593 = ~_1505;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    int _1599 = ~_1585;
    int _1601 = _1599 + 1;
    int _1603 = _1601 + 1;
    float _1605 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1607 = int(_1605);
    int _1609 = abs(_1527);
    int _1611 = _1597 * as_type<int>(_1421);
    int _1613 = _1611 + _1591;
    int _1615 = abs(_1565);
    float _1617 = float(uint(_1565));
    int _1619 = _1603 * as_type<int>(_1461);
    int _1621 = _1619 + _1613;
    int _1623 = ~_1571;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    int _1629 = ~_1589;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    int _1635 = _1579 * as_type<int>(_1469);
    int _1637 = _1635 + _1621;
    float _1639 = float(uint(_1615));
    float _1641 = 1.0 / _1617;
    int _1643 = abs(_1021);
    int _1645 = _1637 * _1627;
    int _1647 = _1633 * as_type<int>(_1495);
    int _1649 = _1647 + _1583;
    float _1651 = float(uint(_1607));
    int _1653 = _1287 * _1571;
    int _1655 = _1653 + _1645;
    int _1657 = ~_1609;
    int _1659 = _1657 + 1;
    int _1661 = _1659 + 1;
    float _1663 = 1.0 / _1639;
    int _1665 = abs(_1607);
    int _1667 = abs(_1655);
    int _1669 = _1661 * as_type<int>(_1503);
    int _1671 = _1669 + _1649;
    int _1673 = ~_1643;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = float(uint(_1655));
    float _1681 = 1.0 / _1651;
    int _1683 = as_type<int>(_1641) + (-2);
    int _1685 = _1677 * _1671;
    float _1687 = float(uint(_1665));
    int _1689 = _1301 * _1643;
    int _1691 = _1689 + _1685;
    float _1693 = float(uint(_1667));
    float _1695 = as_type<float>(_1683) * _1679;
    int _1697 = as_type<int>(_1663) + (-2);
    float _1699 = 1.0 / _1687;
    float _1701 = float(uint(_1691));
    float _1703 = as_type<float>(_1697) * _1693;
    int _1705 = as_type<int>(_1681) + (-2);
    float _1707 = trunc(_1695);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = _1681;
    float _1715 = as_type<float>(_1685);
    if (!_1485)
    {
        _1713 = _212;
    }
    float _1717 = _1713;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1721 = as_type<float>(_1705) * _1701;
    float _1723 = _1717;
    if (_1485)
    {
        _1723 = _210;
    }
    float _1725 = _1723;
    int _1727 = _1539 ? 0 : 1;
    float _1729 = trunc(_1703);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    float _1735 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1719);
    int _1737 = ~_1727;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    float _1743 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1735);
    int _1745 = abs(_1691);
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1749 = trunc(_1721);
    float _1751 = precise::max(_1749, 0.0);
    uint _1753 = uint(_1751);
    int _1755 = _1741;
    float _1757 = _1747;
    if (!_1529)
    {
        int _1759 = ~_1727;
        int _1761 = _1759 + 1;
        _1755 = _1761;
    }
    int _1763 = _1755;
    int _1765 = ~_1565;
    int _1767 = _1765 + 1;
    if (!_1485)
    {
        _1715 = _585;
    }
    float _1769 = _1715;
    float _1771 = _1769;
    if (_1485)
    {
        _1771 = _212;
    }
    float _1773 = _1771;
    int _1775 = _1767 * int(_1711);
    int _1777 = _1775 + _1655;
    int _1779 = ~int(_1733);
    int _1781 = _1779 + 1;
    int _1783 = as_type<int>(_1699) + (-2);
    float _1785 = float(uint(_1745));
    int _1787 = _1781 * _1615;
    int _1789 = _1787 + _1667;
    int _1791 = ~_1481;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = _1795;
    if (!_1295)
    {
        int _1799 = ~_1481;
        int _1801 = _1799 + 1;
        _1797 = _1801;
    }
    int _1803 = _1797;
    float _1805 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1747);
    float _1807 = as_type<float>(_1783) * _1785;
    int _1809 = ~_1607;
    int _1811 = _1809 + 1;
    float _1813 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1815 = log2(_1813);
    if (!_1485)
    {
        _1757 = _212;
    }
    float _1817 = _1757;
    float _1819 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1805);
    int _1821 = _1811 * int(_1753);
    int _1823 = _1821 + _1691;
    float _1825 = _1817;
    if (_1485)
    {
        _1825 = _210;
    }
    float _1827 = _1825;
    float _1829 = float(uint(_1777));
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1833 = float(uint(_1789));
    float _1835 = trunc(_1807);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    float _1841 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1843 = float(uint(_1823));
    float _1845 = as_type<float>(_1683) * _1829;
    float _1847 = as_type<float>(_1697) * _1833;
    bool _1849 = !_1313;
    int _1851 = _1849 ? 0 : 1;
    float _1853 = -_1831;
    float _1855 = fma(_1841, 2.0, _1853);
    float _1857 = as_type<float>(_1705) * _1843;
    int _1859 = abs(_1851);
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1087 + _1861;
    bool _1865 = !_1309;
    int _1867 = _1865 ? 0 : 1;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1485)
    {
        _1871 = _585;
    }
    float _1873 = _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1877 = _1523 + _1875;
    float _1879 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1881 = abs(_1867);
    float _1883 = trunc(_1845);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = _1873;
    if (_1485)
    {
        _1889 = _212;
    }
    float _1891 = _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1895 = _1129 + _1893;
    int _1897 = ~int(_1839);
    int _1899 = _1897 + 1;
    float _1901 = -_152;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1855);
    float _1905 = float(_1339);
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1909 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1911 = isnan(0.0);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1917 = _1913 || _1915;
    float _1919 = trunc(_1857);
    float _1921 = precise::max(_1919, 0.0);
    uint _1923 = uint(_1921);
    float _1925 = float(_1859);
    float _1927 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1879);
    float _1929 = float(_1881);
    float _1931 = fma(_1907, -2.0, _1869);
    float _1933 = float(_1763);
    int _1935 = _1899 * _1665;
    int _1937 = _1935 + _1745;
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1927);
    float _1941 = trunc(_1847);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    int _1947 = int(_1711) + int(_1887);
    float _1949 = _1929 * _1933;
    float _1951 = float(uint(_1937));
    float _1953 = _1925 * _1905;
    float _1955 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1931);
    bool _1957 = _1939 >= 0.0;
    float _1959 = as_type<float>(_1783) * _1951;
    float _1961 = _1815 * _152;
    int _1963 = int(_1753) + int(_1923);
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1967 = 1.0 + _1965;
    float _1969 = _1949 * (-2.0);
    float _1971 = trunc(_1959);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    int _1977 = ~_1565;
    int _1979 = _1977 + 1;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1983 = ~_1607;
    int _1985 = _1983 + 1;
    float _1987 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1981);
    float _1989 = exp2(_1961);
    int _1991 = int(_1733) + int(_1945);
    int _1993 = _1979 * _1947;
    int _1995 = _1993 + _1655;
    bool _1997 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1999 = isnan(1.0);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2005 = _2001 || _2003;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2009 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1027);
    int _2011 = ~_1991;
    int _2013 = _2011 + 1;
    float _2015 = 1.0 / _1967;
    float _2017 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2007);
    int _2019 = _1985 * _1963;
    int _2021 = _2019 + _1691;
    int _2023 = int(_1839) + int(_1975);
    float _2025 = -_152;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _995);
    float _2029 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2017);
    float _2031 = in.m_71.x;
    float _2033 = in.m_71.y;
    float _2035 = in.m_71.z;
    float _2037 = _210 + (-0.5);
    float _2039 = -_1989;
    float _2041 = _2039 + 1.0;
    float _2043 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1987);
    float _2045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1957)
    {
        out.m_49.x = 0.0;
    }
    float _2047 = _1917 ? _2041 : 0.0;
    bool _2049 = uint(_1995) >= uint(_1565);
    int _2051 = _2013 * _1615;
    int _2053 = _2051 + _1667;
    int _2055 = ~_2023;
    int _2057 = _2055 + 1;
    float _2059 = as_type<float>(_2053);
    if (_2005)
    {
        float _2061 = _2047 * _2015;
        _156 = _2061;
    }
    float _2063 = _156;
    bool _2065 = !_2049;
    int _2067 = _2065 ? 0 : (-1);
    float _2069 = _1953 * (-2.0);
    bool _2071 = uint(_2021) >= uint(_1607);
    bool _2073 = uint(_2053) >= uint(_1615);
    int _2075 = ~_1947;
    int _2077 = _2075 + _2067;
    int _2079 = _2077 + 1;
    float _2081 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2083 = _1655 ^ _1565;
    float _2085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2087 = fma(_1289, _2069, _1289);
    bool _2089 = !_2071;
    int _2091 = _2089 ? 0 : (-1);
    float _2093 = fma(_2081, _823, -0.5);
    bool _2095 = _1565 == 0;
    int _2097 = _2057 * _1665;
    int _2099 = _2097 + _1745;
    bool _2101 = _1565 == 0;
    int _2103 = _1565 * _2079;
    int _2105 = _2103 + _1655;
    bool _2107 = !_2073;
    int _2109 = _2107 ? 0 : (-1);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2113 = uint(int(uint(_2083) >> uint(31)));
    float _2115 = fma(_2069, _2033, _2033);
    int _2117 = ~_2109;
    int _2119 = _1991 + _2117;
    int _2121 = _2119 + 1;
    float _2123 = fma(_1165, _1969, _1165);
    int _2125 = ~int(_2113);
    int _2127 = _2125 + 1;
    float _2129 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2131 = !_2095;
    int _2133 = _2131 ? _2105 : (-1);
    int _2135 = _2121 ^ _2127;
    float _2137 = fma(_2129, _905, -0.5);
    bool _2139 = uint(_2099) >= uint(_1665);
    int _2141 = ~_1963;
    int _2143 = _2141 + _2091;
    int _2145 = _2143 + 1;
    int _2147 = _1691 ^ _1607;
    float _2149 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2151 = float(_2133);
    int _2153 = _1607 * _2145;
    int _2155 = _2153 + _1691;
    int _2157 = ~_2127;
    int _2159 = _2157 + _2135;
    int _2161 = _2159 + 1;
    float _2163 = fma(_2149, _829, -0.5);
    bool _2165 = !_2139;
    int _2167 = _2165 ? 0 : (-1);
    float _2169 = fma(_2081, _2151, _2027);
    uint _2171 = uint(int(uint(_2147) >> uint(31)));
    bool _2173 = _1607 == 0;
    float _2175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2177 = !_2101;
    int _2179 = _2177 ? _2161 : (-1);
    float _2181 = fma(_2029, _2093, _2169);
    int _2183 = ~_2167;
    int _2185 = _2023 + _2183;
    int _2187 = _2185 + 1;
    float _2189 = _212 + (-0.5);
    int _2191 = ~int(_2171);
    int _2193 = _2191 + 1;
    float _2195 = fma(_1969, _2031, _2031);
    bool _2197 = !_2173;
    int _2199 = _2197 ? _2155 : (-1);
    float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2115);
    float _2203 = float(_2179);
    float _2205 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2195);
    int _2207 = _2187 ^ _2193;
    bool _2209 = _1607 == 0;
    float _2211 = -_2009;
    float _2213 = fma(_2129, _2203, _2211);
    float _2215 = float(_2199);
    float _2217 = _1863 * _1863;
    int _2219 = ~_2193;
    int _2221 = _2219 + _2207;
    int _2223 = _2221 + 1;
    float _2225 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2227 = fma(_2043, _2137, _2213);
    float _2229 = fma(_2149, _2215, _1903);
    bool _2231 = !_2209;
    int _2233 = _2231 ? _2223 : (-1);
    float _2235 = fma(_1877, _1877, _2217);
    float _2237 = fma(_2225, _919, -0.5);
    float _2239 = fma(_1743, _2163, _2229);
    float _2241 = float(_2233);
    float _2243 = fma(_1895, _1895, _2235);
    float _2245 = _2213;
    float _2247 = _2069;
    if (_1957)
    {
        _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2249 = _2245;
    float _2251 = _2239 + 0.5;
    float _2253 = _2181 + 0.5;
    float _2255 = -_1955;
    float _2257 = fma(_2225, _2241, _2255);
    bool _2259 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2261 = isnan(_204);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = rsqrt(_2243);
    float _2273 = fma(_1819, _2237, _2257);
    int _2275 = as_type<int>(_2249);
    if (_1957)
    {
        float _2277 = _2249 * 5.0;
        _2275 = as_type<int>(_2277);
    }
    int _2279 = _2275;
    bool _2281 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2283 = isnan(_204);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2289 = _2285 || _2287;
    float _2291 = float(_2289);
    float _2293 = _2273 + 0.5;
    float _2295 = _2227 + 0.5;
    if (_1957)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7229 = as_type<float>(_2279);
        out.gl_Position.z = _7229;
    }
    bool _2297 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2299 = isnan(_204);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    bool _2309 = !_1317;
    int _2311 = _2309 ? 0 : 1;
    out.m_73.x = _2253;
    out.m_73.y = _2295;
    out.m_73.z = _2251;
    out.m_73.w = _2293;
    float _2313 = _1863 * _2271;
    float _2315 = _1877 * _2271;
    if (_1957)
    {
        return out;
    }
    float _2317 = -_2313;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1087);
    float _2321 = _1895 * _2271;
    float _2323 = -_2315;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1523);
    float _2327 = -_2307;
    float _2329 = _2327 + 1.0;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2333 = _2319 + _2331;
    float _2335 = -_2321;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1129);
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2341 = _2325 + _2339;
    float _2343 = _2291 * _2329;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2349 = _2337 + _2347;
    float _2351 = -_2291;
    float _2353 = _2351 + 1.0;
    bool _2355 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2357 = isnan(_204);
    bool _2359 = _2355 || _2357;
    bool _2361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2363 = _2359 || _2361;
    float _2365 = float(_2363);
    float _2367 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2345);
    float _2369 = -_2269;
    float _2371 = _2369 + 1.0;
    int _2373 = abs(_2311);
    float _2375 = fma(_2087, _2063, _2201);
    float _2377 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2367);
    float _2379 = _2365 * _2371;
    float _2381 = -_2365;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2123, _2063, _2205);
    bool _2387 = _2377 >= 0.0;
    float _2389 = _2375 * 0.15915493667125701904296875;
    float _2391 = float(_1803);
    float _2393 = _2385 * 0.15915493667125701904296875;
    float _2395 = float(_2373);
    float _2397 = _2269 * _2353;
    bool _2399 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2401 = isnan(_204);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = _2393 * 6.283185482025146484375;
    float _2413 = sin(_2411);
    float _2415 = -_2313;
    float _2417 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1863);
    float _2419 = _2395 * _2391;
    float _2421 = -_2315;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1877);
    float _2425 = _2409 * _2383;
    float _2427 = -_2409;
    float _2429 = _2427 + 1.0;
    float _2431 = _2419 * (-2.0);
    float _2433 = _2419;
    int _2435 = as_type<int>(_2393);
    if (_2387)
    {
        _2433 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2437 = _2433;
    float _2439 = _1405 * _2425;
    float _2441 = _1443 * _2425;
    float _2443 = _2389 * 6.283185482025146484375;
    float _2445 = cos(_2443);
    float _2447 = _1437 * _2425;
    float _2449 = _2417 * _2417;
    if (_2387)
    {
        out.m_49.x = 0.0;
    }
    float _2451 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2447);
    float _2453 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2439);
    float _2455 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].z, _2441);
    float _2457 = _2389 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = fma(_2431, _2035, _2035);
    float _2463 = fma(_2423, _2423, _2449);
    float _2465 = -_2321;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1895);
    float _2469 = _2393 * 6.283185482025146484375;
    float _2471 = cos(_2469);
    if (_2387)
    {
        float _2473 = _2437 * 5.0;
        _2435 = as_type<int>(_2473);
    }
    int _2475 = _2435;
    if (_2387)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7518 = as_type<float>(_2475);
        out.gl_Position.z = _7518;
    }
    if (_2387)
    {
        return out;
    }
    float _2477 = -_1087;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2481 = -_1523;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2485 = fma(_2467, _2467, _2463);
    float _2487 = -_1129;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2491 = _2479 * _2479;
    float _2493 = in.m_75.x;
    float _2495 = in.m_75.y;
    float _2497 = in.m_75.z;
    float _2499 = fma(_1473, _2379, _2455);
    float _2501 = fma(_1471, _2379, _2451);
    float _2503 = fma(_2483, _2483, _2491);
    float _2505 = fma(_1435, _2379, _2453);
    float _2507 = _585 + (-0.5);
    float _2509 = sqrt(_2485);
    float _2511 = fma(_2489, _2489, _2503);
    float _2513 = fma(_1507, _2397, _2499);
    float _2515 = fma(_1555, _2397, _2501);
    float _2517 = fma(_1341, _2397, _2505);
    float _2519 = fma(_1369, _2431, _1369);
    float _2521 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2461);
    float _2523 = fma(_1587, _2343, _2513);
    float _2525 = rsqrt(_2511);
    float _2527 = fma(_1573, _2343, _2515);
    float _2529 = fma(_1483, _2343, _2517);
    float _2531 = fma(_2519, _2063, _2521);
    float _2533 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].z, _2523);
    float _2535 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2527);
    float _2537 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2529);
    float _2539 = _2531 * 0.15915493667125701904296875;
    float _2541 = _2271 * _2509;
    float _2543 = _2413 * _2459;
    float _2545 = _2533 * _2497;
    float _2547 = _2535 * _2495;
    float _2549 = _2537 * _2493;
    float _2551 = _2539 * 6.283185482025146484375;
    float _2553 = sin(_2551);
    float _2555 = in.m_77.x;
    float _2557 = in.m_77.y;
    float _2559 = in.m_77.z;
    float _2561 = _2471 * _2445;
    float _2563 = _2483 * _2525;
    float _2565 = _2489 * _2525;
    float _2567 = _2479 * _2525;
    float _2569 = _2545 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2573 = _2563 * _2571;
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2577 = _2565 * _2575;
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2581 = _2567 * _2579;
    float _2583 = _2539 * 6.283185482025146484375;
    float _2585 = cos(_2583);
    float _2587 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2589 = -_2573;
    float _2591 = fma(_2565, _2587, _2589);
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2595 = -_2577;
    float _2597 = fma(_2567, _2593, _2595);
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2601 = -_2581;
    float _2603 = fma(_2563, _2599, _2601);
    float _2605 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2607 = _2591 * _2591;
    float _2609 = fma(_2553, _2561, _2543);
    float _2611 = fma(_2553, _2543, _2561);
    float _2613 = fma(_2597, _2597, _2607);
    float _2615 = _2549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2617 = _2471 * _2459;
    float _2619 = _2413 * _2445;
    float _2621 = fma(_2603, _2603, _2613);
    float _2623 = _2541 * _2605;
    float _2625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2557);
    float _2627 = _2471 * _2585;
    float _2629 = _2445 * _2585;
    float _2631 = _2413 * _2585;
    float _2633 = rsqrt(_2621);
    float _2635 = _2459 * _2585;
    float _2637 = _2625 * _2623;
    float _2639 = _2541 * _2569;
    float _2641 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2559);
    float _2643 = _2541 * _2615;
    float _2645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2555);
    float _2647 = -_2617;
    float _2649 = fma(_2553, _2619, _2647);
    float _2651 = _2641 * _2639;
    float _2653 = _2627 * _2637;
    float _2655 = _2645 * _2643;
    float _2657 = -_2619;
    float _2659 = fma(_2553, _2617, _2657);
    float _2661 = -_2637;
    float _2663 = _2553 * _2661;
    float _2665 = fma(_2609, _2655, _2653);
    float _2667 = _2631 * _2637;
    float _2669 = _2597 * _2633;
    float _2671 = _2591 * _2633;
    float _2673 = _2603 * _2633;
    float _2675 = fma(_2629, _2655, _2663);
    float _2677 = _2567 * _2669;
    float _2679 = fma(_2659, _2651, _2665);
    float _2681 = _2565 * _2671;
    float _2683 = fma(_2649, _2655, _2667);
    float _2685 = -_2677;
    float _2687 = fma(_2563, _2671, _2685);
    float _2689 = fma(_2635, _2651, _2675);
    float _2691 = -_2681;
    float _2693 = fma(_2567, _2673, _2691);
    float _2695 = fma(_2611, _2651, _2683);
    float _2697 = _2687 * _2679;
    bool _2699 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2701 = isnan(0.5);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2707 = _2703 || _2705;
    float _2709 = _2693 * _2679;
    bool _2711 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2713 = isnan(0.5);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2719 = _2715 || _2717;
    float _2721 = fma(_2673, _2689, _2697);
    float _2723 = fma(_2669, _2689, _2709);
    float _2725 = fma(_2565, _2695, _2721);
    float _2727 = fma(_2563, _2695, _2723);
    float _2729 = _1129 + _2725;
    float _2731 = _1523 + _2727;
    float _2733 = _2563 * _2673;
    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2737 = _2729 + _2735;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2741 = _2731 + _2739;
    float _2743 = -_2733;
    float _2745 = fma(_2565, _2669, _2743);
    float _2747 = _2737 * _2737;
    float _2749 = _2745 * _2679;
    float _2751 = fma(_2741, _2741, _2747);
    float _2753 = fma(_2671, _2689, _2749);
    float _2755 = sqrt(_2751);
    float _2757 = fma(_2567, _2695, _2753);
    float _2759 = _1087 + _2757;
    bool _2761 = _2755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2763 = _2695;
    float _2765 = _2757;
    float _2767 = _2753;
    float _2769 = _2759;
    if (!_2761)
    {
        _2763 = _2731;
    }
    float _2771 = _2763;
    float _2773 = _2771;
    if (!_2761)
    {
        _2765 = _2729;
    }
    float _2775 = _2765;
    float _2777 = _2775;
    if (!_2761)
    {
        _2767 = _2759;
    }
    float _2779 = _2767;
    bool _2781 = !_2761;
    float _2783 = _2779;
    if (!_2781)
    {
        float _2785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2789 = _2755 + _2787;
        float _2791 = rsqrt(_2751);
        float _2793 = _2789 * _2785;
        float _2795 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2797 = _2793 * 0.15915493667125701904296875;
        float _2799 = _2797 * 6.283185482025146484375;
        float _2801 = cos(_2799);
        float _2803 = _2797 * 6.283185482025146484375;
        float _2805 = sin(_2803);
        float _2807 = _2801 + (-1.0);
        float _2809 = fma(_2805, _2795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2811 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2813 = _2791 * _2809;
        float _2815 = fma(_2759, _2801, _2811);
        float _2817 = fma(_2741, _2813, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2819 = fma(_2737, _2813, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2773 = _2817;
        _2783 = _2815;
        _2777 = _2819;
    }
    float _2821 = _2773;
    float _2823 = _2783;
    float _2825 = _2777;
    float _2827 = -_2315;
    float _2829 = fma(_2827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2821);
    float _2831 = -_2313;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2823);
    float _2835 = -_2321;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2825);
    float _2839 = _2833;
    float _2841 = _2829;
    float _2843 = _2837;
    float _2845 = _2825;
    if (_2719)
    {
        _2769 = 1.0;
    }
    float _2847 = _2769;
    float _2849 = _2847;
    if (!_2707)
    {
        float _2851 = _2333 * _2333;
        float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2855 = -_1523;
        float _2857 = _2855 + _2821;
        float _2859 = -_1087;
        float _2861 = _2859 + _2823;
        float _2863 = fma(_2341, _2341, _2851);
        float _2865 = -_1129;
        float _2867 = _2865 + _2825;
        float _2869 = fma(_2349, _2349, _2863);
        float _2871 = 1.0 / _2541;
        float _2873 = sqrt(_2869);
        float _2875 = precise::min(_2873, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2877 = _2875 * _2853;
        float _2879 = _2877 * _2871;
        float _2881 = fma(_2857, _2879, _2325);
        float _2883 = fma(_2861, _2879, _2319);
        float _2885 = fma(_2867, _2879, _2337);
        _2839 = _2883;
        _2841 = _2881;
        _2843 = _2885;
    }
    float _2887 = _2839;
    float _2889 = _2841;
    float _2891 = _2843;
    if (!_2719)
    {
        float _2893 = in.m_79.w;
        int _2895 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _2897 = _2895 == 4;
        bool _2899 = _2895 == 8;
        bool _2901 = _2895 == 12;
        int _2903 = as_type<int>(_2893) << 16;
        int _2905 = as_type<int>(_2893) << 8;
        int _2907 = as_type<int>(_2893) << 24;
        int _2909 = _2903 >> 24;
        int _2911 = _2905 >> 24;
        int _2913 = as_type<int>(_2893) >> 24;
        int _2915 = _2907 >> 24;
        float _2917 = float(_2909);
        float _2919 = float(_2911);
        float _2921 = float(_2913);
        float _2923 = _2917 * 0.0078740157186985015869140625;
        float _2925 = float(_2915);
        float _2927 = _2919 * 0.0078740157186985015869140625;
        float _2929 = _2921 * 0.0078740157186985015869140625;
        float _2931 = precise::min(_2923, 1.0);
        float _2933 = _2925 * 0.0078740157186985015869140625;
        float _2935 = precise::min(_2927, 1.0);
        float _2937 = precise::min(_2929, 1.0);
        float _2939 = precise::min(_2933, 1.0);
        float _2941 = precise::max(_2931, -1.0);
        float _2943 = precise::max(_2935, -1.0);
        float _2945 = precise::max(_2937, -1.0);
        float _2947 = precise::max(_2939, -1.0);
        float _2949 = _2947;
        if (_2897)
        {
            _2949 = _2941;
        }
        float _2951 = _2949;
        float _2953 = _2951;
        if (_2899)
        {
            _2953 = _2943;
        }
        float _2955 = _2953;
        float _2957 = _2955;
        if (_2901)
        {
            _2957 = _2945;
        }
        float _2959 = _2957;
        float _2961 = abs(_2959);
        float _2963 = (-0.0) + _2961;
        _2849 = _2963;
    }
    float _2965 = _2849;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2969 = _2887 + _2967;
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2973 = _2889 + _2971;
    float _2975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2977 = _2891 + _2975;
    float _2979 = _2969 * _2969;
    bool _2981 = _2965 != 0.0;
    bool _2983 = isnan(_2965);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.0);
    bool _2989 = _2985 || _2987;
    float _2991 = fma(_2973, _2973, _2979);
    float _2993 = fma(_2977, _2977, _2991);
    float _2995 = rsqrt(_2993);
    float _2997 = sqrt(_2993);
    float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3001 = _2973 * _2999;
    float _3003 = _2977 * _2999;
    float _3005 = _3001 * _3001;
    float _3007 = _3003 * _3003;
    float _3009 = _3005 + _3007;
    float _3011 = sqrt(_3009);
    bool _3013 = _3011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3017 = _3011 + _3015;
    float _3019 = _2977;
    float _3021 = _3009;
    float _3023 = _3017;
    float _3025 = _3001;
    if (_3013)
    {
        float _3027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3019 = _3027;
    }
    float _3029 = _3019;
    if (_3013)
    {
        float _3031 = rsqrt(_3009);
        _3021 = _3031;
    }
    float _3033 = _3021;
    if (_3013)
    {
        float _3035 = _3017 * _3029;
        _3023 = _3035;
    }
    float _3037 = _3023;
    if (_3013)
    {
        float _3039 = _3037 * 0.15915493667125701904296875;
        _2845 = _3039;
    }
    float _3041 = _2845;
    float _3043 = _2979;
    float _3045 = _3041;
    if (_3013)
    {
        float _3047 = _3041 * 6.283185482025146484375;
        float _3049 = sin(_3047);
        _3043 = _3049;
    }
    float _3051 = _3043;
    float _3053 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3055 = precise::max(0.0, _3053);
    float _3057 = _2995;
    float _3059 = _3053;
    float _3061 = _3055;
    if (_3013)
    {
        float _3063 = _3041 * 6.283185482025146484375;
        float _3065 = cos(_3063);
        _3057 = _3065;
    }
    float _3067 = _3057;
    float _3069 = -_2999;
    float _3071 = -_3055;
    float _3073 = fma(_2969, _3069, _3071);
    float _3075 = _3073;
    if (_3013)
    {
        float _3077 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3059 = _3077;
    }
    float _3079 = _3059;
    float _3081 = _3051;
    float _3083 = _3079;
    if (_3013)
    {
        float _3085 = fma(_3051, _3079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3081 = _3085;
    }
    float _3087 = _3081;
    float _3089 = _3087;
    if (!_3013)
    {
        _3083 = _3003;
    }
    float _3091 = _3083;
    float _3093 = _3091;
    if (_3013)
    {
        float _3095 = _3067 + (-1.0);
        _3061 = _3095;
    }
    float _3097 = _3061;
    float _3099 = _3097;
    if (_3013)
    {
        float _3101 = _3033 * _3087;
        _3045 = _3101;
    }
    float _3103 = _3045;
    float _3105 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3107 = _3105;
    if (!_3013)
    {
        _3089 = _3005;
    }
    float _3109 = _3089;
    float _3111 = _3109;
    if (_3013)
    {
        float _3113 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3099 = _3113;
    }
    float _3115 = _3099;
    if (_3013)
    {
        float _3117 = _3001 * _3103;
        _3025 = _3117;
    }
    float _3119 = _3025;
    if (_3013)
    {
        float _3121 = _3003 * _3103;
        _3093 = _3121;
    }
    float _3123 = _3093;
    float _3125 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3105);
    if (_3013)
    {
        float _3127 = fma(_3073, _3067, _3115);
        _3075 = _3127;
    }
    float _3129 = _3075;
    if (_3013)
    {
        float _3131 = _3119 * _3119;
        _3111 = _3131;
    }
    float _3133 = _3111;
    if (!_3013)
    {
        _3107 = _3007;
    }
    float _3135 = _3107;
    float _3137 = _3135;
    if (_3013)
    {
        float _3139 = _3123 * _3123;
        _3137 = _3139;
    }
    float _3141 = _3137;
    float _3143 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3145 = fma(_3129, _3129, _3133);
    float _3147 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3125);
    float _3149 = floor(_3143);
    float _3151 = _3145 + _3141;
    float _3153 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3155 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3159 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3161 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3163 = rsqrt(_3151);
    float _3165 = -_3159;
    float _3167 = fma(_3165, _3157, 1.0);
    float _3169 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3161);
    float _3171 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3173 = fma(_2337, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3175 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3177 = _3169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3181 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3179);
    float _3183 = precise::clamp(_3181, 0.0, 1.0);
    float _3185 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3171);
    float _3187 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3175);
    float _3189 = floor(_3173);
    float _3191 = -_3183;
    float _3193 = _3191 + 1.0;
    float _3195 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3185);
    float _3197 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3187);
    float _3199 = _3163 * _3119;
    float _3201 = _3195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3203 = _3163 * _3129;
    float _3205 = abs(_3193);
    float _3207 = log2(_3205);
    float _3209 = _3199 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3211 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3213 = _3163 * _3123;
    float _3215 = _3197 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3217 = -_3209;
    float _3219 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3217);
    float _3221 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3211);
    float _3223 = log2(_3167);
    float _3225 = -_3213;
    float _3227 = fma(_3225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3219);
    float _3229 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3221);
    float _3231 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3233 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3235 = fma(_3227, -0.5, 0.5);
    float _3237 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3229);
    float _3239 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3231);
    float _3241 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3233);
    float _3243 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3245 = 1.0 / _3237;
    float _3247 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3239);
    float _3249 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3241);
    float _3251 = fma(_3227, 0.5, 0.5);
    float _3253 = -_3189;
    float _3255 = _3173 + _3253;
    float _3257 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3247);
    float _3259 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3249);
    float _3261 = fma(_3251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3263 = sqrt(_3235);
    float _3265 = _3223 * 0.693147182464599609375;
    float _3267 = _3203 + 1.0;
    float _3269 = fma(_3251, _3261, -0.212114393711090087890625);
    float _3271 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3273 = fma(_3251, _3269, 1.570728778839111328125);
    float _3275 = exp2(_3243);
    float _3277 = -_3149;
    float _3279 = _3143 + _3277;
    float _3281 = _3149;
    float _3283 = _3143;
    float _3285 = _3237;
    float _3287 = _3259;
    if (_2989)
    {
        _3281 = _3257;
    }
    float _3289 = _3281;
    float _3291 = _3289;
    if (_2989)
    {
        _3283 = _3259;
    }
    float _3293 = _3283;
    float _3295 = _3293;
    if (!_2989)
    {
        _3291 = 0.0;
        _3295 = 0.0;
    }
    float _3297 = _3291;
    float _3299 = _3295;
    float2 _8808 = float2(_3279, _3255);
    float _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8808, float2(0.0), isnan(_8808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8808, float2(0.0), isnan(_8808)), level(0.0)).x;
    float _3303 = _3263 * 0.636619746685028076171875;
    float _3305 = _3245 * _3297;
    float _3307 = _3245 * _3299;
    float _3309 = -_3273;
    float _3311 = fma(_3303, _3309, 1.0);
    float _3313 = fma(_3305, 0.5, 0.5);
    float _3315 = -_3203;
    float _3317 = fma(_3275, _3267, _3315);
    float _3319 = fma(_3307, -0.5, 0.5);
    float _3321 = fma(_3317, 0.5, 0.5);
    float3 _8845 = float3(_3313, _3319, _3271);
    float _3323 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8845, float3(0.0), isnan(_8845)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8845, float3(0.0), isnan(_8845)), level(0.0)).x;
    float3 _8856 = float3(_3313, _3319, _3271);
    float4 _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8856, float3(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8856, float3(0.0), isnan(_8856)), level(0.0)).xyzw;
    float _3328 = _3326.x;
    float _3330 = _3326.y;
    float _3332 = _3326.z;
    float _3334 = _3326.w;
    float2 _8872 = float2(_3311, _3321);
    float3 _3338 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8872, float2(0.0), isnan(_8872)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8872, float2(0.0), isnan(_8872)), level(0.0)).xyz;
    float _3340 = _3338.x;
    float _3342 = _3338.y;
    float _3344 = _3338.z;
    float _3346 = _2319 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3348 = _2319 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3350 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3352 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3346);
    float _3354 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3348);
    bool _3356 = _2557 != 0.0;
    bool _3358 = isnan(_2557);
    bool _3360 = _3356 || _3358;
    bool _3362 = isnan(0.0);
    bool _3364 = _3360 || _3362;
    float _3366 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3352);
    float _3368 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3354);
    bool _3370 = _2555 == 0.0;
    bool _3372 = !_3364;
    bool _3374 = _3370 && _3372;
    float _3376 = exp2(_3350);
    float _3378 = _3366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3380 = _3368 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3382 = _2559 == 0.0;
    bool _3384 = _3382 && _3374;
    float _3386 = _3380 + _3378;
    float _3388 = 1.0 / _3378;
    float _3390 = -_3376;
    float _3392 = _3390 + 1.0;
    float _3394 = in.m_81.x;
    float _3396 = in.m_81.y;
    float _3398 = in.m_81.z;
    float _3400 = in.m_81.w;
    float _3402 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3404 = _3386 * _3388;
    float _3406 = _3404 * 0.5;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3410 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3408);
    float _3412 = in.m_83.x;
    float _3414 = in.m_83.y;
    float _3416 = in.m_83.z;
    float _3418 = 1.0 / _3410;
    float _3420 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3422 = _3418 * _3420;
    float _3424 = abs(_3422);
    float _3426 = log2(_3424);
    float _3428 = _3418;
    float _3430 = _3412;
    if (_3384)
    {
        _2059 = _3412;
    }
    float _3432 = _2059;
    float _3434 = _3432;
    if (_3384)
    {
        _2247 = _3414;
    }
    float _3436 = _2247;
    float _3438 = _3436;
    if (_3384)
    {
        _3428 = _3416;
    }
    float _3440 = _3428;
    float _3442 = _3440;
    if (!_3384)
    {
        float _3444 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3416);
        _3442 = _3444;
    }
    float _3446 = _3442;
    bool _3448 = _3422 <= 8000.0;
    bool _3450 = isnan(_3422);
    bool _3452 = _3448 || _3450;
    bool _3454 = isnan(8000.0);
    bool _3456 = _3452 || _3454;
    float _3458 = float(_3456);
    float _3460 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3462 = _3426;
    if (_3384)
    {
        _3462 = _3432;
    }
    float _3464 = _3462;
    float _3466 = _3464;
    if (!_3384)
    {
        _3434 = _3412;
    }
    float _3468 = _3434;
    if (_3384)
    {
        _3430 = _3436;
    }
    float _3470 = _3430;
    float _3472 = exp2(_3460);
    float _3474 = _3470;
    if (!_3384)
    {
        _3438 = _3414;
    }
    float _3476 = _3438;
    if (!_3384)
    {
        float _3478 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3468);
        _3466 = _3478;
    }
    float _3480 = _3466;
    float _3482 = _3398 * _3468;
    if (!_3384)
    {
        float _3484 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3476);
        _3474 = _3484;
    }
    float _3486 = _3474;
    float _3488 = _3396 * _3416;
    float _3490 = _3394 * _3476;
    float _3492 = -_3482;
    float _3494 = fma(_3394, _3416, _3492);
    bool _3496 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3498 = isnan(_2997);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3504 = _3500 || _3502;
    float _3506 = -_3488;
    float _3508 = fma(_3398, _3476, _3506);
    float _3510 = _3508 * _3400;
    float _3512 = fma(_3472, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3514 = precise::clamp(_3512, 0.0, 1.0);
    float _3516 = -_3490;
    float _3518 = fma(_3396, _3468, _3516);
    float _3520 = _3494 * _3400;
    float _3522 = _2627 * _2687;
    float _3524 = fma(_3514, -2.0, 3.0);
    float _3526 = _3514 * _3514;
    float _3528 = _3518 * _3400;
    float _3530 = _2609 * _2693;
    float _3532 = _2609 * _2745;
    float _3534 = _3526 * _3524;
    float _3536 = _2609 * _2687;
    float _3538 = _2627 * _2693;
    float _3540 = _2627 * _2745;
    float _3542 = _2659 * _2693;
    float _3544 = _2659 * _2745;
    float _3546 = _2659 * _2687;
    float _3548 = fma(_2629, _2669, _3530);
    float _3550 = -_2553;
    float _3552 = fma(_3550, _2669, _3538);
    float _3554 = -_2553;
    float _3556 = fma(_3554, _2671, _3540);
    float _3558 = fma(_2629, _2671, _3532);
    float _3560 = -_2553;
    float _3562 = fma(_3560, _2673, _3522);
    float _3564 = -_3534;
    float _3566 = _3564 + 1.0;
    float _3568 = fma(_2629, _2673, _3536);
    float _3570 = fma(_2635, _2669, _3542);
    float _3572 = fma(_2635, _2671, _3544);
    float _3574 = fma(_2635, _2673, _3546);
    float _3576 = fma(_2631, _2563, _3552);
    float _3578 = fma(_2631, _2567, _3556);
    float _3580 = fma(_2631, _2565, _3562);
    float _3582 = fma(_3566, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3534);
    float _3584 = fma(_2649, _2567, _3558);
    float _3586 = fma(_2649, _2563, _3548);
    float _3588 = fma(_2611, _2563, _3570);
    float _3590 = fma(_2611, _2567, _3572);
    float _3592 = _3576 * _3396;
    float _3594 = _3578 * _3396;
    float _3596 = _3580 * _3396;
    float _3598 = _3576 * _3486;
    float _3600 = fma(_2649, _2565, _3568);
    float _3602 = fma(_2611, _2565, _3574);
    float _3604 = _3520 * _3576;
    float _3606 = _3520 * _3578;
    float _3608 = _3520 * _3580;
    float _3610 = fma(_3586, _3480, _3598);
    float _3612 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3614 = fma(_3586, _3394, _3592);
    float _3616 = fma(_3584, _3394, _3594);
    float _3618 = fma(_3600, _3394, _3596);
    float _3620 = fma(_3510, _3586, _3604);
    float _3622 = fma(_3510, _3584, _3606);
    float _3624 = fma(_3510, _3600, _3608);
    float _3626 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3612);
    float _3628 = fma(_3588, _3398, _3614);
    float _3630 = fma(_3590, _3398, _3616);
    float _3632 = fma(_3602, _3398, _3618);
    float _3634 = fma(_3528, _3588, _3620);
    float _3636 = _3458 * _3582;
    float _3638 = in.m_79.x;
    float _3640 = _3578 * _3486;
    float _3642 = _3580 * _3486;
    float _3644 = _3636 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _3628;
    out.m_85.y = _3630;
    out.m_85.z = _3632;
    float _3646 = fma(_3584, _3480, _3640);
    float _3648 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3626);
    float _3650 = fma(_3600, _3480, _3642);
    float _3652 = fma(_3528, _3590, _3622);
    float _3654 = fma(_3528, _3602, _3624);
    float _3656 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3648);
    float _3658 = fma(_3588, _3446, _3610);
    float _3660 = _3656 + _3237;
    int _3662 = as_type<int>(_3616);
    float _3664 = _3257;
    float _3666 = _3654;
    float _3668 = _3652;
    float _3670 = _3634;
    if (!_2989)
    {
        float _3672 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _3662 = as_type<int>(_3672);
    }
    int _3674 = _3662;
    float _3676 = fma(_3602, _3446, _3650);
    float _3678 = _3660 * 0.5;
    float _3680 = fma(_3590, _3446, _3646);
    out.gl_Position.x = _3257;
    out.gl_Position.y = _3259;
    out.gl_Position.z = _3656;
    out.gl_Position.w = _3237;
    if (!_2989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9455 = as_type<float>(_3674);
        out.gl_Position.z = _9455;
    }
    out.m_87.z = _3678;
    out.m_87.w = _3237;
    out.m_89.x = _3658;
    out.m_89.y = _3680;
    out.m_89.z = _3676;
    float _3682 = _2965 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3684 = _3682;
    if (!_2989)
    {
        _3684 = 0.0;
    }
    float _3686 = _3684;
    out.m_91.x = _3634;
    out.m_91.y = _3652;
    out.m_91.z = _3654;
    if (!_3504)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3688 = _3285;
    float _3690 = _3688;
    float _3692 = _3688;
    if (!_3504)
    {
        _3664 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3694 = _3664;
    float _3696 = _3694;
    float _3698 = _3694;
    if (!_3504)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3700 = _3287;
    float _3702 = _3700;
    float _3704 = _3700;
    if (!_3504)
    {
        _3666 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3706 = _3666;
    float _3708 = _3706;
    float _3710 = _3706;
    if (!_3504)
    {
        _3668 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3712 = _3668;
    float _3714 = _3712;
    float _3716 = _3712;
    if (!_3504)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3718 = _3670;
    float _3720 = -_3301;
    float _3722 = _3720 + 1.0;
    float _3724 = _3722 * _3644;
    float _3726 = precise::clamp(_3724, 0.0, 1.0);
    float _3728 = -_3726;
    float _3730 = fma(_3728, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3732 = _3730 * _3638;
    float _3734 = _3402 * _3323;
    float _3736 = -_3402;
    float _3738 = _3736 + 1.0;
    float _3740 = _3732 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3742 = _3334 * _3734;
    float _3744 = _3344 * _3734;
    float _3746 = _3334 * _3738;
    out.m_93.x = _3740;
    float _3748 = fma(_3340, _3742, _3328);
    float _3750 = fma(_3342, _3742, _3330);
    float _3752 = fma(_3334, _3744, _3332);
    out.m_95.x = _3748;
    out.m_95.y = _3750;
    out.m_95.z = _3752;
    out.m_95.w = _3746;
    bool _3754 = !_3504;
    float _3756 = _3718;
    float _3758 = _3718;
    if (!_3754)
    {
        bool _3760 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3762 = isnan(_2997);
        bool _3764 = _3760 || _3762;
        bool _3766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3768 = _3764 || _3766;
        if (!_3768)
        {
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = _2997 + _3770;
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3776 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3774;
            float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3786 = 1.0 / _3776;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3792 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3800 = _3772 * _3786;
            float _3802 = precise::clamp(_3800, 0.0, 1.0);
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3808 = fma(_3802, _3780, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3810 = fma(_3802, _3784, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3812 = fma(_3802, _3806, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3814 = fma(_3802, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3816 = fma(_3802, _3794, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3818 = fma(_3802, _3798, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3716 = _3808;
            _3698 = _3816;
            _3710 = _3810;
            _3692 = _3814;
            _3758 = _3812;
            _3704 = _3818;
            _3820 = true;
        }
        else
        {
            bool _3822 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3824 = isnan(_2997);
            bool _3826 = _3822 || _3824;
            bool _3828 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3830 = _3826 || _3828;
            if (!_3830)
            {
                _3690 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3832 = _3690;
            _3692 = _3832;
            if (!_3830)
            {
                _3696 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3834 = _3696;
            _3698 = _3834;
            if (!_3830)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3836 = _3702;
            _3704 = _3836;
            if (!_3830)
            {
                _3708 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3838 = _3708;
            _3710 = _3838;
            if (!_3830)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3840 = _3714;
            _3716 = _3840;
            if (!_3830)
            {
                _3756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3842 = _3756;
            bool _3844 = !_3830;
            _3758 = _3842;
            if (!_3844)
            {
                bool _3846 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3848 = isnan(_2997);
                bool _3850 = _3846 || _3848;
                bool _3852 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3854 = _3850 || _3852;
                if (!_3854)
                {
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3858 = _2997 + _3856;
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3862 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3860;
                    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3870 = _3868 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3872 = 1.0 / _3862;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3880 = _3878 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3886 = _3858 * _3872;
                    float _3888 = precise::clamp(_3886, 0.0, 1.0);
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3894 = fma(_3888, _3866, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3896 = fma(_3888, _3870, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3898 = fma(_3888, _3892, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3900 = fma(_3888, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3902 = fma(_3888, _3880, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3904 = fma(_3888, _3884, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3716 = _3894;
                    _3698 = _3902;
                    _3710 = _3896;
                    _3692 = _3900;
                    _3758 = _3898;
                    _3704 = _3904;
                    _3820 = true;
                }
                else
                {
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3698 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3710 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3692 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3820 = false;
    float _3906 = _3716;
    float _3908 = _3698;
    float _3910 = _3710;
    float _3912 = _3692;
    float _3914 = _3758;
    float _3916 = _3704;
    float _3918 = fma(_3680, -0.5, 0.5);
    float _3920 = precise::clamp(_3918, 0.0, 1.0);
    float _3922 = -_3906;
    float _3924 = _3908 + _3922;
    float _3926 = -_3910;
    float _3928 = _3912 + _3926;
    float _3930 = -_3914;
    float _3932 = _3916 + _3930;
    bool _3934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3936 = fma(_3920, _3924, _3906);
    float _3938 = fma(_3920, _3928, _3910);
    float _3940 = fma(_3920, _3932, _3914);
    float _3942 = _3686 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3944 = _3936 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3946 = fma(_3938, 0.298911988735198974609375, _3944);
    out.m_93.w = _3942;
    float _3948 = fma(_3940, 0.114477999508380889892578125, _3946);
    float _3950 = -_3948;
    float _3952 = _3938 + _3950;
    float _3954 = -_3948;
    float _3956 = _3936 + _3954;
    float _3958 = -_3948;
    float _3960 = _3940 + _3958;
    out.m_97.x = 0.0;
    float _3962 = fma(_3952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    float _3964 = fma(_3956, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    float _3966 = fma(_3960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    out.m_99.x = _3962;
    out.m_99.y = _3964;
    out.m_99.z = _3966;
    if (!_3934)
    {
        return out;
    }
    float _3968 = -_2887;
    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3972 = -_2889;
    float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3976 = -_2891;
    float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3980 = _3970 * _3970;
    float _3982 = fma(_3974, _3974, _3980);
    float _3984 = fma(_3978, _3978, _3982);
    float _3986 = sqrt(_3984);
    float _3988 = rsqrt(_3984);
    float _3990 = -_3986;
    float _3992 = _3990 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3994 = _3992 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3996 = precise::clamp(_3994, 0.0, 1.0);
    float _3998 = _3974 * _3988;
    float _4000 = _3970 * _3988;
    float _4002 = abs(_3996);
    float _4004 = log2(_4002);
    float _4006 = _3978 * _3988;
    float _4008 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4010 = _3680 * _4000;
    float _4012 = -_4000;
    float _4014 = -_4008;
    float _4016 = fma(_4012, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4014);
    float _4018 = fma(_3658, _3998, _4010);
    float _4020 = -_4006;
    float _4022 = fma(_4020, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4016);
    float _4024 = fma(_3676, _4006, _4018);
    float _4026 = precise::clamp(_4024, 0.0, 1.0);
    float _4028 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4030 = _4022 + _4028;
    float _4032 = _4004 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4034 = _4030 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4036 = precise::clamp(_4034, 0.0, 1.0);
    float _4038 = exp2(_4032);
    float _4040 = _4038 * _4036;
    float _4042 = _4026 * _4040;
    float _4044 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4046 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4048 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4044;
    out.m_97.y = _4046;
    out.m_97.z = _4048;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3820 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4105 = as_type<float>(_134);
        out.gl_Position.z = _4105;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_51.w;
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
        float _158 = float(_118);
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
        out.m_49.x = 0.0;
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
        float _4174 = as_type<float>(_172);
        out.gl_Position.z = _4174;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _208 = int(_206);
    float _210 = in.m_53.x;
    float _212 = in.m_53.y;
    float _214 = in.m_55.x;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _218 = _216 != 0;
    float _220 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _222 = int(_220);
    float _224 = float(_118);
    float _226 = in.m_55.y;
    float _228 = in.m_46.x;
    float _230 = in.m_46.y;
    float _232 = in.m_46.z;
    float _234 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _236 = int(_234);
    float _238 = float(_208);
    float _240 = in.m_53.w;
    float _242 = in.m_57.w;
    float _244 = 1.0 / _238;
    float _246 = float(_222);
    float _248 = in.m_57.x;
    float _250 = in.m_57.y;
    float _252 = float(uint(_236));
    float _254 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _256 = int(_254);
    bool _258 = _236 == 0;
    float _260 = in.m_57.z;
    int _262 = ~_236;
    int _264 = _262 + 1;
    float _266 = _244 * _152;
    float _268 = 1.0 / _246;
    out.m_59.w = _242;
    float _270 = 1.0 / _252;
    float _272 = float(uint(_256));
    out.m_59.x = _248;
    int _274 = ~_256;
    int _276 = _274 + 1;
    int _278 = ~_256;
    int _280 = _278 + 1;
    out.m_59.y = _250;
    float _282 = trunc(_266);
    int _284 = int(_282);
    float _286 = _268 * _152;
    float _288 = _268;
    float _290 = _214;
    float _292 = _226;
    if (_218)
    {
        float _294 = in.m_53.x;
        _288 = _294;
    }
    float _296 = _288;
    float _298 = _296;
    if (!_218)
    {
        float _300 = in.m_53.y;
        _298 = _300;
    }
    float _302 = _298;
    int _304 = as_type<int>(_270) + (-2);
    float _306 = 1.0 / _272;
    int _308 = ~_236;
    int _310 = _308 + 1;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.z = _260;
    float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _318 = float(uint(_284));
    float _320 = trunc(_286);
    int _322 = int(_320);
    float _324 = as_type<float>(_304) * _318;
    float _326 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _328 = trunc(_324);
    float _330 = precise::max(_328, 0.0);
    uint _333 = uint(_330);
    int _335 = as_type<int>(_306) + (-2);
    float _337 = float(uint(_322));
    float _339 = 1.0 / _224;
    float _341 = _324;
    if (_218)
    {
        _341 = 1.0;
    }
    float _343 = _341;
    float _345 = _343;
    if (!_218)
    {
        _345 = 7.345489978790283203125;
    }
    float _347 = _345;
    float _349 = as_type<float>(_335) * _337;
    int _351 = _310 * int(_333);
    int _353 = _351 + _284;
    float _355 = trunc(_349);
    float _357 = precise::max(_355, 0.0);
    uint _359 = uint(_357);
    float _361 = float(uint(_353));
    float _363 = as_type<float>(_304) * _361;
    float _365 = _347 * _210;
    int _367 = ~_236;
    int _369 = _367 + 1;
    float _371 = floor(_365);
    int _373 = _276 * int(_359);
    int _375 = _373 + _322;
    float _377 = float(uint(_375));
    float _379 = trunc(_363);
    float _381 = precise::max(_379, 0.0);
    uint _383 = uint(_381);
    float _385 = as_type<float>(_335) * _377;
    float _387 = as_type<float>(_369);
    if (_218)
    {
        _387 = 1.0;
    }
    float _389 = _387;
    float _391 = -_371;
    float _393 = _365 + _391;
    float _395 = _389;
    if (!_218)
    {
        _395 = 1.2345600128173828125;
    }
    float _397 = _395;
    float _399 = trunc(_385);
    float _401 = precise::max(_399, 0.0);
    uint _403 = uint(_401);
    int _405 = int(_333) + int(_383);
    float _407 = float(_236);
    float _409 = float(_284);
    int _411 = _369 * _405;
    int _413 = _411 + _284;
    float _415 = _393 * _407;
    bool _417 = _409 >= _407;
    bool _419 = isnan(_409);
    bool _421 = _417 || _419;
    bool _423 = isnan(_407);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = _407 * _152;
    bool _431 = uint(_413) >= uint(_236);
    float _433 = _302 * _397;
    int _435 = int(_359) + int(_403);
    float _437 = _429 * _339;
    float _439 = trunc(_427);
    int _441 = int(_439);
    bool _443 = !_431;
    int _445 = _443 ? 0 : (-1);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _449 = _447 != 0;
    int _451 = ~_405;
    int _453 = _451 + _445;
    int _455 = _453 + 1;
    bool _457 = !_449;
    int _459 = _457 ? 0 : 1;
    float _461 = trunc(_415);
    int _463 = int(_461);
    int _465 = ~_256;
    int _467 = _465 + 1;
    int _469 = abs(_459);
    int _471 = _236 * _455;
    int _473 = _471 + _284;
    int _475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _477 = _475 != 0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _485 = _483 != 0;
    float _487 = float(_256);
    float _489 = trunc(_437);
    int _491 = int(_489);
    int _493 = _467 * _435;
    int _495 = _493 + _322;
    int _497 = ~_441;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    bool _503 = !_258;
    int _505 = _503 ? _473 : (-1);
    bool _507 = uint(_495) >= uint(_256);
    int _509 = _463 * _469;
    int _511 = _509 + _284;
    float _513 = floor(_433);
    int _515 = _505 * _501;
    bool _517 = !_477;
    int _519 = _517 ? 0 : 1;
    int _521 = _236 + (-1);
    int _523 = abs(_519);
    float _525 = float(_322);
    int _527 = _441 * _521;
    int _529 = _527 + _515;
    bool _531 = !_481;
    int _533 = _531 ? 0 : 1;
    bool _535 = _525 >= _487;
    bool _537 = isnan(_525);
    bool _539 = _535 || _537;
    bool _541 = isnan(_487);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    int _547 = abs(_533);
    bool _549 = !_485;
    int _551 = _549 ? 0 : 1;
    float _553 = -_513;
    float _555 = _433 + _553;
    float _557 = trunc(_545);
    int _559 = int(_557);
    int _561 = abs(_551);
    int _563 = _529 * _547;
    bool _565 = !_507;
    int _567 = _565 ? 0 : (-1);
    float _569 = _487 * _555;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _573 = _571 != 0;
    int _575 = _491 * _523;
    int _577 = _575 + _563;
    int _579 = ~_435;
    int _581 = _579 + _567;
    int _583 = _581 + 1;
    float _585 = in.m_53.z;
    bool _587 = !_573;
    int _589 = _587 ? 0 : 1;
    float _591 = trunc(_569);
    int _593 = int(_591);
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _597 = _595 != 0;
    int _599 = _256 * _583;
    int _601 = _599 + _322;
    int _603 = abs(_589);
    int _605 = _511 * _561;
    int _607 = _605 + _577;
    bool _609 = _256 == 0;
    float _611 = _487 * _152;
    bool _613 = !_597;
    int _615 = _613 ? 0 : 1;
    float _617 = _611 * _339;
    int _619 = ~_559;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    int _625 = _463 * _603;
    int _627 = _625 + _607;
    bool _629 = !_609;
    int _631 = _629 ? _601 : (-1);
    int _633 = abs(_615);
    int _635 = _256 + (-1);
    int _637 = _623 * _631;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _641 = _639 != 0;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _645 = _643 != 0;
    float _647 = trunc(_617);
    int _649 = int(_647);
    int _651 = _559 * _635;
    int _653 = _651 + _637;
    float _655 = float(uint(_627));
    bool _657 = !_645;
    int _659 = _657 ? 0 : 1;
    int _661 = _593 * _633;
    int _663 = _661 + _322;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _671 = _669 != 0;
    float _673 = as_type<float>(_304) * _655;
    bool _675 = !_641;
    int _677 = _675 ? 0 : 1;
    int _679 = abs(_659);
    float _681 = trunc(_673);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    bool _687 = !_667;
    int _689 = _687 ? 0 : 1;
    int _691 = abs(_677);
    int _693 = ~_236;
    int _695 = _693 + 1;
    int _697 = abs(_689);
    int _699 = _653 * _679;
    bool _701 = !_671;
    int _703 = _701 ? 0 : 1;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _707 = _705 != 0;
    int _709 = _649 * _691;
    int _711 = _709 + _699;
    int _713 = abs(_703);
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _717 = _715 != 0;
    int _719 = _663 * _697;
    int _721 = _719 + _711;
    int _723 = _695 * int(_685);
    int _725 = _723 + _627;
    float _727 = float(uint(_511));
    bool _729 = _236 == 0;
    int _731 = _593 * _713;
    int _733 = _731 + _721;
    float _735 = _673;
    float _737 = as_type<float>(_523);
    int _739 = _695;
    bool _741 = _667;
    bool _743 = _645;
    if (_707)
    {
        float _745 = in.m_53.x;
        _735 = _745;
    }
    float _747 = _735;
    float _749 = float(uint(_725));
    float _751 = as_type<float>(_304) * _727;
    if (!_707)
    {
        _737 = _214;
    }
    float _753 = _737;
    float _755 = in.m_61.x;
    float _757 = in.m_61.y;
    float _759 = in.m_61.z;
    float _761 = in.m_61.w;
    float _763 = float(uint(_733));
    float _765 = as_type<float>(_304) * _749;
    int _767 = as_type<int>(_763);
    float _769 = _753;
    if (_717)
    {
        float _771 = -_214;
        float _773 = _771 + 1.0;
        _739 = as_type<int>(_773);
    }
    int _775 = _739;
    if (_717)
    {
        bool _777 = _585 > 0.5;
        _741 = _777;
    }
    bool _779 = _741;
    float _781 = trunc(_751);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    float _787 = as_type<float>(_335) * _763;
    if (_707)
    {
        float _789 = -_214;
        float _791 = _789 + 1.0;
        _767 = as_type<int>(_791);
    }
    int _793 = _767;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _797 = _795 != 0;
    float _799 = trunc(_787);
    float _801 = precise::max(_799, 0.0);
    uint _803 = uint(_801);
    if (_707)
    {
        bool _805 = _747 > 0.5;
        _743 = _805;
    }
    bool _807 = _743;
    float _809 = trunc(_765);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    int _815 = 0;
    if (_797)
    {
        _815 = 0;
    }
    int _817 = _815;
    int _819 = _817;
    if (_707)
    {
        float _821 = _807 ? as_type<float>(_793) : _214;
        _769 = _821;
    }
    float _823 = _769;
    float _825 = _230 * _757;
    if (_717)
    {
        float _827 = _779 ? as_type<float>(_775) : _214;
        _290 = _827;
    }
    float _829 = _290;
    bool _831 = _212 > 0.5;
    float _833 = fma(_228, _755, _825);
    int _835 = ~_256;
    int _837 = _835 + 1;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _841 = _839 != 0;
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _845 = _843 != 0;
    int _847 = _837 * int(_803);
    int _849 = _847 + _733;
    if (!_797)
    {
        _819 = 1;
    }
    int _851 = _819;
    int _853 = int(_685) + int(_813);
    float _855 = float(uint(_849));
    float _857 = in.m_63.x;
    float _859 = in.m_63.y;
    float _861 = in.m_63.z;
    float _863 = in.m_63.w;
    int _865 = _264 * _853;
    int _867 = _865 + _627;
    float _869 = in.m_65.x;
    float _871 = in.m_65.y;
    float _873 = in.m_65.z;
    float _875 = in.m_65.w;
    float _877 = as_type<float>(_335) * _855;
    bool _879 = uint(_867) >= uint(_236);
    float _881 = -_226;
    float _883 = _881 + 1.0;
    float _885 = trunc(_877);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    bool _891 = !_879;
    int _893 = _891 ? 0 : (-1);
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _897 = _895 != 0;
    int _899 = _831 ? as_type<int>(_883) : as_type<int>(_226);
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _903 = _901 != 0;
    float _905 = _841 ? as_type<float>(_899) : _226;
    bool _907 = _240 > 0.5;
    int _909 = ~_236;
    int _911 = _909 + 1;
    float _913 = _230 * _859;
    int _915 = int(_803) + int(_889);
    if (_897)
    {
        float _917 = _907 ? _883 : _226;
        _292 = _917;
    }
    float _919 = _292;
    float _921 = _230 * _871;
    int _923 = ~_256;
    int _925 = _923 + 1;
    int _927 = ~_853;
    int _929 = _927 + _893;
    int _931 = _929 + 1;
    float _933 = fma(_228, _857, _913);
    int _935 = _925 * _915;
    int _937 = _935 + _733;
    int _939 = _236 * _931;
    int _941 = _939 + _627;
    int _943 = _911 * int(_785);
    int _945 = _943 + _511;
    bool _947 = uint(_937) >= uint(_256);
    float _949 = fma(_228, _869, _921);
    float _951 = float(uint(_663));
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _955 = !_729;
    int _957 = _955 ? _941 : (-1);
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _961 = float(uint(_945));
    float _963 = as_type<float>(_335) * _951;
    int _965 = _957 & 3;
    bool _967 = _965 != 0;
    float _969 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _971 = !_947;
    int _973 = _971 ? 0 : (-1);
    float _975 = as_type<float>(_304) * _961;
    int _977 = _967 ? 0 : 1;
    float _979 = trunc(_963);
    float _981 = precise::max(_979, 0.0);
    uint _983 = uint(_981);
    int _985 = _957 & 3;
    bool _987 = _985 != 0;
    float _989 = _210 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _991 = uint(_985) > 1u;
    float _993 = -_959;
    float _995 = fma(_989, 2.0, _993);
    float _997 = trunc(_975);
    float _999 = precise::max(_997, 0.0);
    uint _1001 = uint(_999);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1005 = ~_915;
    int _1007 = _1005 + _973;
    int _1009 = _1007 + 1;
    float _1011 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1015 = _280 * int(_983);
    int _1017 = _1015 + _663;
    bool _1019 = !_903;
    int _1021 = _1019 ? 0 : 1;
    out.m_67.x = _1011;
    out.m_67.y = _316;
    out.m_67.z = _969;
    out.m_67.w = _314;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1023;
    float _1027 = fma(_326, -2.0, _1013);
    float _1029 = float(uint(_1017));
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1035 = int(_785) + int(_1001);
    float _1037 = as_type<float>(_335) * _1029;
    int _1039 = ~_977;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = 1.0 / _1025;
    int _1047 = _1043;
    if (!_991)
    {
        int _1049 = ~_977;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    float _1055 = fma(_232, _861, _933);
    bool _1057 = uint(_985) >= 2u;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1061 = ~_236;
    int _1063 = _1061 + 1;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1067 = _1057 ? 0 : 1;
    float _1069 = trunc(_1037);
    float _1071 = precise::max(_1069, 0.0);
    uint _1073 = uint(_1071);
    bool _1075 = _985 != 3;
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1081 = ~_1067;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    float _1087 = _1055 + _863;
    int _1089 = _1063 * _1035;
    int _1091 = _1089 + _511;
    float _1093 = 1.0 / _1033;
    int _1095 = _256 * _1009;
    int _1097 = _1095 + _733;
    float _1099 = fma(_232, _759, _833);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1103 = ~_256;
    int _1105 = _1103 + 1;
    float _1107 = fma(_232, _873, _949);
    int _1109 = _1085;
    if (_1075)
    {
        int _1111 = ~_1067;
        int _1113 = _1111 + 1;
        _1109 = _1113;
    }
    int _1115 = _1109;
    float _1117 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1119 = uint(_1091) >= uint(_236);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1123 = _204 + _1121;
    bool _1125 = !_609;
    int _1127 = _1125 ? _1097 : (-1);
    float _1129 = _1107 + _875;
    bool _1131 = !_1119;
    int _1133 = _1131 ? 0 : (-1);
    out.m_69.x = _1077;
    out.m_69.y = _1079;
    out.m_69.z = _1117;
    int _1135 = _1127 & 3;
    bool _1137 = _1135 != 0;
    float _1139 = _1123 * _1045;
    int _1141 = int(_983) + int(_1073);
    float _1143 = _210 + _212;
    int _1145 = _1137 ? 0 : 1;
    bool _1147 = uint(_1135) >= 2u;
    float _1149 = _1143 + (-1.0);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1153 = _204 + _1151;
    int _1155 = _1147 ? 0 : 1;
    float _1157 = _210 * 2.0;
    bool _1159 = _1135 != 3;
    int _1161 = _1105 * _1141;
    int _1163 = _1161 + _663;
    float _1165 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1167 = _212 * 2.0;
    float _1169 = floor(_1157);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1173 = _204 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1183 = ~_1155;
    int _1185 = _1183 + 1;
    int _1187 = _1185 + 1;
    float _1189 = _1173 * _1093;
    bool _1191 = !_845;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _1187;
    if (_1159)
    {
        int _1197 = ~_1155;
        int _1199 = _1197 + 1;
        _1195 = _1199;
    }
    int _1201 = _1195;
    float _1203 = floor(_1167);
    bool _1205 = uint(_1163) >= uint(_256);
    float _1207 = _210 + _585;
    int _1209 = ~_1035;
    int _1211 = _1209 + _1133;
    int _1213 = _1211 + 1;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1217 = _204 + _1215;
    bool _1219 = !_1205;
    int _1221 = _1219 ? 0 : (-1);
    float _1223 = _1207 + (-1.0);
    bool _1225 = uint(_1135) > 1u;
    float _1227 = 1.0 / _1181;
    int _1229 = ~_1145;
    int _1231 = _1229 + 1;
    int _1233 = _1231 + 1;
    int _1235 = _236 * _1213;
    int _1237 = _1235 + _511;
    int _1239 = ~_1141;
    int _1241 = _1239 + _1221;
    int _1243 = _1241 + 1;
    bool _1245 = _1169 > 0.0;
    int _1247 = _256 * _1243;
    int _1249 = _1247 + _663;
    float _1251 = _212 + _585;
    bool _1253 = _1203 >= 0.0;
    bool _1255 = isnan(_1203);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.0);
    bool _1261 = _1257 || _1259;
    float _1263 = 1.0 / _1177;
    int _1265 = _1233;
    if (!_1225)
    {
        int _1267 = ~_1145;
        int _1269 = _1267 + 1;
        _1265 = _1269;
    }
    int _1271 = _1265;
    float _1273 = _1251 + (-1.0);
    bool _1275 = _1169 >= 0.0;
    bool _1277 = isnan(_1169);
    bool _1279 = _1275 || _1277;
    bool _1281 = isnan(0.0);
    bool _1283 = _1279 || _1281;
    bool _1285 = !_729;
    int _1287 = _1285 ? _1237 : (-1);
    float _1289 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1291 = _1283 ? 0 : 1;
    float _1293 = _1217 * _1227;
    bool _1295 = _1203 > 0.0;
    float _1297 = _585 * 2.0;
    bool _1299 = !_609;
    int _1301 = _1299 ? _1249 : (-1);
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1303;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1313 = _1311 != 0;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1317 = _1315 != 0;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1323 = ~_1291;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    float _1329 = _1153 * _1263;
    int _1331 = _957 >> 31;
    int _1333 = _1327;
    if (!_1245)
    {
        int _1335 = ~_1291;
        int _1337 = _1335 + 1;
        _1333 = _1337;
    }
    int _1339 = _1333;
    float _1341 = fma(_1305, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1343 = _1127 >> 31;
    int _1345 = _1127 & 3;
    bool _1347 = _1345 != 0;
    int _1349 = _1331 & 3;
    int _1351 = _1343 & 3;
    bool _1353 = !_1347;
    int _1355 = _1353 ? 0 : 1;
    float _1357 = floor(_1297);
    bool _1359 = _985 != 3;
    int _1361 = _957 + _1349;
    int _1363 = _1127 + _1351;
    int _1365 = _1363 >> 2;
    int _1367 = _1361 >> 2;
    float _1369 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1371 = _1365 << 4;
    int _1373 = _1371 + 512;
    bool _1375 = !_1359;
    int _1377 = _1375 ? 0 : (-1);
    bool _1379 = _1135 != 3;
    int _1381 = _1367 << 4;
    int _1383 = _1381 + 368;
    uint _1385 = uint(int(uint(_1373) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[int(_1395)][_1397];
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1403 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1401;
    float _1405 = fma(_1403, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1411;
    uint _1415 = uint(int(uint(_1383) >> uint(2)));
    uint _1417 = uint(int(uint(int(_1415)) >> uint(2)));
    int _1419 = int(_1415) & 3;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[int(_1417)][_1419];
    int _1423 = int(_1415) + 1;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    int _1427 = _1423 & 3;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[int(_1425)][_1427];
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1431;
    float _1435 = fma(_1409, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1437 = fma(_1413, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1443 = fma(_1433, _1139, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _1449 = !_987;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1383 + 8;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    float _1471 = fma(_1441, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1473 = fma(_1447, _1189, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _1475 = abs(_1053);
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1477;
    int _1481 = _1261 ? 0 : 1;
    float _1483 = fma(_1321, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _1485 = _851 != 1;
    int _1487 = _1373 + 8;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[int(_1499)][_1501];
    int _1505 = abs(_1451);
    float _1507 = fma(_1479, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _1509 = abs(_1271);
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1513 = _1511 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    int _1515 = abs(_1355);
    int _1517 = ~_1475;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1099 + _761;
    bool _1525 = !_1379;
    int _1527 = _1525 ? 0 : (-1);
    bool _1529 = _1357 > 0.0;
    bool _1531 = _1357 >= 0.0;
    bool _1533 = isnan(_1357);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(0.0);
    bool _1539 = _1535 || _1537;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1541;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _1549 = ~_1509;
    int _1551 = _1549 + 1;
    int _1553 = _1551 + 1;
    float _1555 = fma(_1543, _1329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _1557 = ~_1515;
    int _1559 = _1557 + 1;
    int _1561 = _1559 + 1;
    float _1563 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1565 = int(_1563);
    int _1567 = abs(_1377);
    int _1569 = _1553 * as_type<int>(_1399);
    int _1571 = abs(_1193);
    float _1573 = fma(_1547, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _1575 = ~_1567;
    int _1577 = _1575 + 1;
    int _1579 = _1577 + 1;
    int _1581 = _1561 * as_type<int>(_1391);
    int _1583 = _1581 + _1569;
    int _1585 = abs(_1115);
    float _1587 = fma(_1513, _1293, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _1589 = abs(_1201);
    int _1591 = _1521 * as_type<int>(_1429);
    int _1593 = ~_1505;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    int _1599 = ~_1585;
    int _1601 = _1599 + 1;
    int _1603 = _1601 + 1;
    float _1605 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1607 = int(_1605);
    int _1609 = abs(_1527);
    int _1611 = _1597 * as_type<int>(_1421);
    int _1613 = _1611 + _1591;
    int _1615 = abs(_1565);
    float _1617 = float(uint(_1565));
    int _1619 = _1603 * as_type<int>(_1461);
    int _1621 = _1619 + _1613;
    int _1623 = ~_1571;
    int _1625 = _1623 + 1;
    int _1627 = _1625 + 1;
    int _1629 = ~_1589;
    int _1631 = _1629 + 1;
    int _1633 = _1631 + 1;
    int _1635 = _1579 * as_type<int>(_1469);
    int _1637 = _1635 + _1621;
    float _1639 = float(uint(_1615));
    float _1641 = 1.0 / _1617;
    int _1643 = abs(_1021);
    int _1645 = _1637 * _1627;
    int _1647 = _1633 * as_type<int>(_1495);
    int _1649 = _1647 + _1583;
    float _1651 = float(uint(_1607));
    int _1653 = _1287 * _1571;
    int _1655 = _1653 + _1645;
    int _1657 = ~_1609;
    int _1659 = _1657 + 1;
    int _1661 = _1659 + 1;
    float _1663 = 1.0 / _1639;
    int _1665 = abs(_1607);
    int _1667 = abs(_1655);
    int _1669 = _1661 * as_type<int>(_1503);
    int _1671 = _1669 + _1649;
    int _1673 = ~_1643;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = float(uint(_1655));
    float _1681 = 1.0 / _1651;
    int _1683 = as_type<int>(_1641) + (-2);
    int _1685 = _1677 * _1671;
    float _1687 = float(uint(_1665));
    int _1689 = _1301 * _1643;
    int _1691 = _1689 + _1685;
    float _1693 = float(uint(_1667));
    float _1695 = as_type<float>(_1683) * _1679;
    int _1697 = as_type<int>(_1663) + (-2);
    float _1699 = 1.0 / _1687;
    float _1701 = float(uint(_1691));
    float _1703 = as_type<float>(_1697) * _1693;
    int _1705 = as_type<int>(_1681) + (-2);
    float _1707 = trunc(_1695);
    float _1709 = precise::max(_1707, 0.0);
    uint _1711 = uint(_1709);
    float _1713 = _1681;
    float _1715 = as_type<float>(_1685);
    if (!_1485)
    {
        _1713 = _212;
    }
    float _1717 = _1713;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1721 = as_type<float>(_1705) * _1701;
    float _1723 = _1717;
    if (_1485)
    {
        _1723 = _210;
    }
    float _1725 = _1723;
    int _1727 = _1539 ? 0 : 1;
    float _1729 = trunc(_1703);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    float _1735 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1719);
    int _1737 = ~_1727;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    float _1743 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1735);
    int _1745 = abs(_1691);
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1749 = trunc(_1721);
    float _1751 = precise::max(_1749, 0.0);
    uint _1753 = uint(_1751);
    int _1755 = _1741;
    float _1757 = _1747;
    if (!_1529)
    {
        int _1759 = ~_1727;
        int _1761 = _1759 + 1;
        _1755 = _1761;
    }
    int _1763 = _1755;
    int _1765 = ~_1565;
    int _1767 = _1765 + 1;
    if (!_1485)
    {
        _1715 = _585;
    }
    float _1769 = _1715;
    float _1771 = _1769;
    if (_1485)
    {
        _1771 = _212;
    }
    float _1773 = _1771;
    int _1775 = _1767 * int(_1711);
    int _1777 = _1775 + _1655;
    int _1779 = ~int(_1733);
    int _1781 = _1779 + 1;
    int _1783 = as_type<int>(_1699) + (-2);
    float _1785 = float(uint(_1745));
    int _1787 = _1781 * _1615;
    int _1789 = _1787 + _1667;
    int _1791 = ~_1481;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    int _1797 = _1795;
    if (!_1295)
    {
        int _1799 = ~_1481;
        int _1801 = _1799 + 1;
        _1797 = _1801;
    }
    int _1803 = _1797;
    float _1805 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1747);
    float _1807 = as_type<float>(_1783) * _1785;
    int _1809 = ~_1607;
    int _1811 = _1809 + 1;
    float _1813 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1815 = log2(_1813);
    if (!_1485)
    {
        _1757 = _212;
    }
    float _1817 = _1757;
    float _1819 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1805);
    int _1821 = _1811 * int(_1753);
    int _1823 = _1821 + _1691;
    float _1825 = _1817;
    if (_1485)
    {
        _1825 = _210;
    }
    float _1827 = _1825;
    float _1829 = float(uint(_1777));
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1833 = float(uint(_1789));
    float _1835 = trunc(_1807);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    float _1841 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1843 = float(uint(_1823));
    float _1845 = as_type<float>(_1683) * _1829;
    float _1847 = as_type<float>(_1697) * _1833;
    bool _1849 = !_1313;
    int _1851 = _1849 ? 0 : 1;
    float _1853 = -_1831;
    float _1855 = fma(_1841, 2.0, _1853);
    float _1857 = as_type<float>(_1705) * _1843;
    int _1859 = abs(_1851);
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1087 + _1861;
    bool _1865 = !_1309;
    int _1867 = _1865 ? 0 : 1;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1485)
    {
        _1871 = _585;
    }
    float _1873 = _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1877 = _1523 + _1875;
    float _1879 = _1863 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1881 = abs(_1867);
    float _1883 = trunc(_1845);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = _1873;
    if (_1485)
    {
        _1889 = _212;
    }
    float _1891 = _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1895 = _1129 + _1893;
    int _1897 = ~int(_1839);
    int _1899 = _1897 + 1;
    float _1901 = -_152;
    float _1903 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1855);
    float _1905 = float(_1339);
    float _1907 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1909 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1911 = isnan(0.0);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1917 = _1913 || _1915;
    float _1919 = trunc(_1857);
    float _1921 = precise::max(_1919, 0.0);
    uint _1923 = uint(_1921);
    float _1925 = float(_1859);
    float _1927 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1879);
    float _1929 = float(_1881);
    float _1931 = fma(_1907, -2.0, _1869);
    float _1933 = float(_1763);
    int _1935 = _1899 * _1665;
    int _1937 = _1935 + _1745;
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1927);
    float _1941 = trunc(_1847);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    int _1947 = int(_1711) + int(_1887);
    float _1949 = _1929 * _1933;
    float _1951 = float(uint(_1937));
    float _1953 = _1925 * _1905;
    float _1955 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1931);
    bool _1957 = _1939 >= 0.0;
    float _1959 = as_type<float>(_1783) * _1951;
    float _1961 = _1815 * _152;
    int _1963 = int(_1753) + int(_1923);
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1967 = 1.0 + _1965;
    float _1969 = _1949 * (-2.0);
    float _1971 = trunc(_1959);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    int _1977 = ~_1565;
    int _1979 = _1977 + 1;
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1983 = ~_1607;
    int _1985 = _1983 + 1;
    float _1987 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1981);
    float _1989 = exp2(_1961);
    int _1991 = int(_1733) + int(_1945);
    int _1993 = _1979 * _1947;
    int _1995 = _1993 + _1655;
    bool _1997 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1999 = isnan(1.0);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2005 = _2001 || _2003;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2009 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1027);
    int _2011 = ~_1991;
    int _2013 = _2011 + 1;
    float _2015 = 1.0 / _1967;
    float _2017 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2007);
    int _2019 = _1985 * _1963;
    int _2021 = _2019 + _1691;
    int _2023 = int(_1839) + int(_1975);
    float _2025 = -_152;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _995);
    float _2029 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2017);
    float _2031 = in.m_71.x;
    float _2033 = in.m_71.y;
    float _2035 = in.m_71.z;
    float _2037 = _210 + (-0.5);
    float _2039 = -_1989;
    float _2041 = _2039 + 1.0;
    float _2043 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1987);
    float _2045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1957)
    {
        out.m_49.x = 0.0;
    }
    float _2047 = _1917 ? _2041 : 0.0;
    bool _2049 = uint(_1995) >= uint(_1565);
    int _2051 = _2013 * _1615;
    int _2053 = _2051 + _1667;
    int _2055 = ~_2023;
    int _2057 = _2055 + 1;
    float _2059 = as_type<float>(_2053);
    if (_2005)
    {
        float _2061 = _2047 * _2015;
        _156 = _2061;
    }
    float _2063 = _156;
    bool _2065 = !_2049;
    int _2067 = _2065 ? 0 : (-1);
    float _2069 = _1953 * (-2.0);
    bool _2071 = uint(_2021) >= uint(_1607);
    bool _2073 = uint(_2053) >= uint(_1615);
    int _2075 = ~_1947;
    int _2077 = _2075 + _2067;
    int _2079 = _2077 + 1;
    float _2081 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2083 = _1655 ^ _1565;
    float _2085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2087 = fma(_1289, _2069, _1289);
    bool _2089 = !_2071;
    int _2091 = _2089 ? 0 : (-1);
    float _2093 = fma(_2081, _823, -0.5);
    bool _2095 = _1565 == 0;
    int _2097 = _2057 * _1665;
    int _2099 = _2097 + _1745;
    bool _2101 = _1565 == 0;
    int _2103 = _1565 * _2079;
    int _2105 = _2103 + _1655;
    bool _2107 = !_2073;
    int _2109 = _2107 ? 0 : (-1);
    float _2111 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2113 = uint(int(uint(_2083) >> uint(31)));
    float _2115 = fma(_2069, _2033, _2033);
    int _2117 = ~_2109;
    int _2119 = _1991 + _2117;
    int _2121 = _2119 + 1;
    float _2123 = fma(_1165, _1969, _1165);
    int _2125 = ~int(_2113);
    int _2127 = _2125 + 1;
    float _2129 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2131 = !_2095;
    int _2133 = _2131 ? _2105 : (-1);
    int _2135 = _2121 ^ _2127;
    float _2137 = fma(_2129, _905, -0.5);
    bool _2139 = uint(_2099) >= uint(_1665);
    int _2141 = ~_1963;
    int _2143 = _2141 + _2091;
    int _2145 = _2143 + 1;
    int _2147 = _1691 ^ _1607;
    float _2149 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2151 = float(_2133);
    int _2153 = _1607 * _2145;
    int _2155 = _2153 + _1691;
    int _2157 = ~_2127;
    int _2159 = _2157 + _2135;
    int _2161 = _2159 + 1;
    float _2163 = fma(_2149, _829, -0.5);
    bool _2165 = !_2139;
    int _2167 = _2165 ? 0 : (-1);
    float _2169 = fma(_2081, _2151, _2027);
    uint _2171 = uint(int(uint(_2147) >> uint(31)));
    bool _2173 = _1607 == 0;
    float _2175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2177 = !_2101;
    int _2179 = _2177 ? _2161 : (-1);
    float _2181 = fma(_2029, _2093, _2169);
    int _2183 = ~_2167;
    int _2185 = _2023 + _2183;
    int _2187 = _2185 + 1;
    float _2189 = _212 + (-0.5);
    int _2191 = ~int(_2171);
    int _2193 = _2191 + 1;
    float _2195 = fma(_1969, _2031, _2031);
    bool _2197 = !_2173;
    int _2199 = _2197 ? _2155 : (-1);
    float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2115);
    float _2203 = float(_2179);
    float _2205 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2195);
    int _2207 = _2187 ^ _2193;
    bool _2209 = _1607 == 0;
    float _2211 = -_2009;
    float _2213 = fma(_2129, _2203, _2211);
    float _2215 = float(_2199);
    float _2217 = _1863 * _1863;
    int _2219 = ~_2193;
    int _2221 = _2219 + _2207;
    int _2223 = _2221 + 1;
    float _2225 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2227 = fma(_2043, _2137, _2213);
    float _2229 = fma(_2149, _2215, _1903);
    bool _2231 = !_2209;
    int _2233 = _2231 ? _2223 : (-1);
    float _2235 = fma(_1877, _1877, _2217);
    float _2237 = fma(_2225, _919, -0.5);
    float _2239 = fma(_1743, _2163, _2229);
    float _2241 = float(_2233);
    float _2243 = fma(_1895, _1895, _2235);
    float _2245 = _2213;
    float _2247 = _2069;
    if (_1957)
    {
        _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2249 = _2245;
    float _2251 = _2239 + 0.5;
    float _2253 = _2181 + 0.5;
    float _2255 = -_1955;
    float _2257 = fma(_2225, _2241, _2255);
    bool _2259 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2261 = isnan(_204);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = rsqrt(_2243);
    float _2273 = fma(_1819, _2237, _2257);
    int _2275 = as_type<int>(_2249);
    if (_1957)
    {
        float _2277 = _2249 * 5.0;
        _2275 = as_type<int>(_2277);
    }
    int _2279 = _2275;
    bool _2281 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2283 = isnan(_204);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2289 = _2285 || _2287;
    float _2291 = float(_2289);
    float _2293 = _2273 + 0.5;
    float _2295 = _2227 + 0.5;
    if (_1957)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7229 = as_type<float>(_2279);
        out.gl_Position.z = _7229;
    }
    bool _2297 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2299 = isnan(_204);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2305 = _2301 || _2303;
    float _2307 = float(_2305);
    bool _2309 = !_1317;
    int _2311 = _2309 ? 0 : 1;
    out.m_73.x = _2253;
    out.m_73.y = _2295;
    out.m_73.z = _2251;
    out.m_73.w = _2293;
    float _2313 = _1863 * _2271;
    float _2315 = _1877 * _2271;
    if (_1957)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2317 = -_2313;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1087);
    float _2321 = _1895 * _2271;
    float _2323 = -_2315;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1523);
    float _2327 = -_2307;
    float _2329 = _2327 + 1.0;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2333 = _2319 + _2331;
    float _2335 = -_2321;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1129);
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2341 = _2325 + _2339;
    float _2343 = _2291 * _2329;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2349 = _2337 + _2347;
    float _2351 = -_2291;
    float _2353 = _2351 + 1.0;
    bool _2355 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2357 = isnan(_204);
    bool _2359 = _2355 || _2357;
    bool _2361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2363 = _2359 || _2361;
    float _2365 = float(_2363);
    float _2367 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2345);
    float _2369 = -_2269;
    float _2371 = _2369 + 1.0;
    int _2373 = abs(_2311);
    float _2375 = fma(_2087, _2063, _2201);
    float _2377 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2367);
    float _2379 = _2365 * _2371;
    float _2381 = -_2365;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2123, _2063, _2205);
    bool _2387 = _2377 >= 0.0;
    float _2389 = _2375 * 0.15915493667125701904296875;
    float _2391 = float(_1803);
    float _2393 = _2385 * 0.15915493667125701904296875;
    float _2395 = float(_2373);
    float _2397 = _2269 * _2353;
    bool _2399 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2401 = isnan(_204);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = _2393 * 6.283185482025146484375;
    float _2413 = sin(_2411);
    float _2415 = -_2313;
    float _2417 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1863);
    float _2419 = _2395 * _2391;
    float _2421 = -_2315;
    float _2423 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1877);
    float _2425 = _2409 * _2383;
    float _2427 = -_2409;
    float _2429 = _2427 + 1.0;
    float _2431 = _2419 * (-2.0);
    float _2433 = _2419;
    int _2435 = as_type<int>(_2393);
    if (_2387)
    {
        _2433 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2437 = _2433;
    float _2439 = _1405 * _2425;
    float _2441 = _1443 * _2425;
    float _2443 = _2389 * 6.283185482025146484375;
    float _2445 = cos(_2443);
    float _2447 = _1437 * _2425;
    float _2449 = _2417 * _2417;
    if (_2387)
    {
        out.m_49.x = 0.0;
    }
    float _2451 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2447);
    float _2453 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2439);
    float _2455 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[143].z, _2441);
    float _2457 = _2389 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = fma(_2431, _2035, _2035);
    float _2463 = fma(_2423, _2423, _2449);
    float _2465 = -_2321;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1895);
    float _2469 = _2393 * 6.283185482025146484375;
    float _2471 = cos(_2469);
    if (_2387)
    {
        float _2473 = _2437 * 5.0;
        _2435 = as_type<int>(_2473);
    }
    int _2475 = _2435;
    if (_2387)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7518 = as_type<float>(_2475);
        out.gl_Position.z = _7518;
    }
    if (_2387)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2477 = -_1087;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2481 = -_1523;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2485 = fma(_2467, _2467, _2463);
    float _2487 = -_1129;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2491 = _2479 * _2479;
    float _2493 = in.m_75.x;
    float _2495 = in.m_75.y;
    float _2497 = in.m_75.z;
    float _2499 = fma(_1473, _2379, _2455);
    float _2501 = fma(_1471, _2379, _2451);
    float _2503 = fma(_2483, _2483, _2491);
    float _2505 = fma(_1435, _2379, _2453);
    float _2507 = _585 + (-0.5);
    float _2509 = sqrt(_2485);
    float _2511 = fma(_2489, _2489, _2503);
    float _2513 = fma(_1507, _2397, _2499);
    float _2515 = fma(_1555, _2397, _2501);
    float _2517 = fma(_1341, _2397, _2505);
    float _2519 = fma(_1369, _2431, _1369);
    float _2521 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2461);
    float _2523 = fma(_1587, _2343, _2513);
    float _2525 = rsqrt(_2511);
    float _2527 = fma(_1573, _2343, _2515);
    float _2529 = fma(_1483, _2343, _2517);
    float _2531 = fma(_2519, _2063, _2521);
    float _2533 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].z, _2523);
    float _2535 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2527);
    float _2537 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2529);
    float _2539 = _2531 * 0.15915493667125701904296875;
    float _2541 = _2271 * _2509;
    float _2543 = _2413 * _2459;
    float _2545 = _2533 * _2497;
    float _2547 = _2535 * _2495;
    float _2549 = _2537 * _2493;
    float _2551 = _2539 * 6.283185482025146484375;
    float _2553 = sin(_2551);
    float _2555 = in.m_77.x;
    float _2557 = in.m_77.y;
    float _2559 = in.m_77.z;
    float _2561 = _2471 * _2445;
    float _2563 = _2483 * _2525;
    float _2565 = _2489 * _2525;
    float _2567 = _2479 * _2525;
    float _2569 = _2545 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2573 = _2563 * _2571;
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2577 = _2565 * _2575;
    float _2579 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2581 = _2567 * _2579;
    float _2583 = _2539 * 6.283185482025146484375;
    float _2585 = cos(_2583);
    float _2587 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2589 = -_2573;
    float _2591 = fma(_2565, _2587, _2589);
    float _2593 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2595 = -_2577;
    float _2597 = fma(_2567, _2593, _2595);
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2601 = -_2581;
    float _2603 = fma(_2563, _2599, _2601);
    float _2605 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2607 = _2591 * _2591;
    float _2609 = fma(_2553, _2561, _2543);
    float _2611 = fma(_2553, _2543, _2561);
    float _2613 = fma(_2597, _2597, _2607);
    float _2615 = _2549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2617 = _2471 * _2459;
    float _2619 = _2413 * _2445;
    float _2621 = fma(_2603, _2603, _2613);
    float _2623 = _2541 * _2605;
    float _2625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2557);
    float _2627 = _2471 * _2585;
    float _2629 = _2445 * _2585;
    float _2631 = _2413 * _2585;
    float _2633 = rsqrt(_2621);
    float _2635 = _2459 * _2585;
    float _2637 = _2625 * _2623;
    float _2639 = _2541 * _2569;
    float _2641 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2559);
    float _2643 = _2541 * _2615;
    float _2645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2555);
    float _2647 = -_2617;
    float _2649 = fma(_2553, _2619, _2647);
    float _2651 = _2641 * _2639;
    float _2653 = _2627 * _2637;
    float _2655 = _2645 * _2643;
    float _2657 = -_2619;
    float _2659 = fma(_2553, _2617, _2657);
    float _2661 = -_2637;
    float _2663 = _2553 * _2661;
    float _2665 = fma(_2609, _2655, _2653);
    float _2667 = _2631 * _2637;
    float _2669 = _2597 * _2633;
    float _2671 = _2591 * _2633;
    float _2673 = _2603 * _2633;
    float _2675 = fma(_2629, _2655, _2663);
    float _2677 = _2567 * _2669;
    float _2679 = fma(_2659, _2651, _2665);
    float _2681 = _2565 * _2671;
    float _2683 = fma(_2649, _2655, _2667);
    float _2685 = -_2677;
    float _2687 = fma(_2563, _2671, _2685);
    float _2689 = fma(_2635, _2651, _2675);
    float _2691 = -_2681;
    float _2693 = fma(_2567, _2673, _2691);
    float _2695 = fma(_2611, _2651, _2683);
    float _2697 = _2687 * _2679;
    bool _2699 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2701 = isnan(0.5);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2707 = _2703 || _2705;
    float _2709 = _2693 * _2679;
    bool _2711 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2713 = isnan(0.5);
    bool _2715 = _2711 || _2713;
    bool _2717 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2719 = _2715 || _2717;
    float _2721 = fma(_2673, _2689, _2697);
    float _2723 = fma(_2669, _2689, _2709);
    float _2725 = fma(_2565, _2695, _2721);
    float _2727 = fma(_2563, _2695, _2723);
    float _2729 = _1129 + _2725;
    float _2731 = _1523 + _2727;
    float _2733 = _2563 * _2673;
    float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2737 = _2729 + _2735;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2741 = _2731 + _2739;
    float _2743 = -_2733;
    float _2745 = fma(_2565, _2669, _2743);
    float _2747 = _2737 * _2737;
    float _2749 = _2745 * _2679;
    float _2751 = fma(_2741, _2741, _2747);
    float _2753 = fma(_2671, _2689, _2749);
    float _2755 = sqrt(_2751);
    float _2757 = fma(_2567, _2695, _2753);
    float _2759 = _1087 + _2757;
    bool _2761 = _2755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2763 = _2695;
    float _2765 = _2757;
    float _2767 = _2753;
    float _2769 = _2759;
    if (!_2761)
    {
        _2763 = _2731;
    }
    float _2771 = _2763;
    float _2773 = _2771;
    if (!_2761)
    {
        _2765 = _2729;
    }
    float _2775 = _2765;
    float _2777 = _2775;
    if (!_2761)
    {
        _2767 = _2759;
    }
    float _2779 = _2767;
    bool _2781 = !_2761;
    float _2783 = _2779;
    if (!_2781)
    {
        float _2785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2789 = _2755 + _2787;
        float _2791 = rsqrt(_2751);
        float _2793 = _2789 * _2785;
        float _2795 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2797 = _2793 * 0.15915493667125701904296875;
        float _2799 = _2797 * 6.283185482025146484375;
        float _2801 = cos(_2799);
        float _2803 = _2797 * 6.283185482025146484375;
        float _2805 = sin(_2803);
        float _2807 = _2801 + (-1.0);
        float _2809 = fma(_2805, _2795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2811 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2813 = _2791 * _2809;
        float _2815 = fma(_2759, _2801, _2811);
        float _2817 = fma(_2741, _2813, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2819 = fma(_2737, _2813, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2773 = _2817;
        _2783 = _2815;
        _2777 = _2819;
    }
    float _2821 = _2773;
    float _2823 = _2783;
    float _2825 = _2777;
    float _2827 = -_2315;
    float _2829 = fma(_2827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2821);
    float _2831 = -_2313;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2823);
    float _2835 = -_2321;
    float _2837 = fma(_2835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2825);
    float _2839 = _2833;
    float _2841 = _2829;
    float _2843 = _2837;
    float _2845 = _2825;
    if (_2719)
    {
        _2769 = 1.0;
    }
    float _2847 = _2769;
    float _2849 = _2847;
    if (!_2707)
    {
        float _2851 = _2333 * _2333;
        float _2853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2855 = -_1523;
        float _2857 = _2855 + _2821;
        float _2859 = -_1087;
        float _2861 = _2859 + _2823;
        float _2863 = fma(_2341, _2341, _2851);
        float _2865 = -_1129;
        float _2867 = _2865 + _2825;
        float _2869 = fma(_2349, _2349, _2863);
        float _2871 = 1.0 / _2541;
        float _2873 = sqrt(_2869);
        float _2875 = precise::min(_2873, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2877 = _2875 * _2853;
        float _2879 = _2877 * _2871;
        float _2881 = fma(_2857, _2879, _2325);
        float _2883 = fma(_2861, _2879, _2319);
        float _2885 = fma(_2867, _2879, _2337);
        _2839 = _2883;
        _2841 = _2881;
        _2843 = _2885;
    }
    float _2887 = _2839;
    float _2889 = _2841;
    float _2891 = _2843;
    if (!_2719)
    {
        float _2893 = in.m_79.w;
        int _2895 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _2897 = _2895 == 4;
        bool _2899 = _2895 == 8;
        bool _2901 = _2895 == 12;
        int _2903 = as_type<int>(_2893) << 16;
        int _2905 = as_type<int>(_2893) << 8;
        int _2907 = as_type<int>(_2893) << 24;
        int _2909 = _2903 >> 24;
        int _2911 = _2905 >> 24;
        int _2913 = as_type<int>(_2893) >> 24;
        int _2915 = _2907 >> 24;
        float _2917 = float(_2909);
        float _2919 = float(_2911);
        float _2921 = float(_2913);
        float _2923 = _2917 * 0.0078740157186985015869140625;
        float _2925 = float(_2915);
        float _2927 = _2919 * 0.0078740157186985015869140625;
        float _2929 = _2921 * 0.0078740157186985015869140625;
        float _2931 = precise::min(_2923, 1.0);
        float _2933 = _2925 * 0.0078740157186985015869140625;
        float _2935 = precise::min(_2927, 1.0);
        float _2937 = precise::min(_2929, 1.0);
        float _2939 = precise::min(_2933, 1.0);
        float _2941 = precise::max(_2931, -1.0);
        float _2943 = precise::max(_2935, -1.0);
        float _2945 = precise::max(_2937, -1.0);
        float _2947 = precise::max(_2939, -1.0);
        float _2949 = _2947;
        if (_2897)
        {
            _2949 = _2941;
        }
        float _2951 = _2949;
        float _2953 = _2951;
        if (_2899)
        {
            _2953 = _2943;
        }
        float _2955 = _2953;
        float _2957 = _2955;
        if (_2901)
        {
            _2957 = _2945;
        }
        float _2959 = _2957;
        float _2961 = abs(_2959);
        float _2963 = (-0.0) + _2961;
        _2849 = _2963;
    }
    float _2965 = _2849;
    float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2969 = _2887 + _2967;
    float _2971 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2973 = _2889 + _2971;
    float _2975 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2977 = _2891 + _2975;
    float _2979 = _2969 * _2969;
    bool _2981 = _2965 != 0.0;
    bool _2983 = isnan(_2965);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.0);
    bool _2989 = _2985 || _2987;
    float _2991 = fma(_2973, _2973, _2979);
    float _2993 = fma(_2977, _2977, _2991);
    float _2995 = rsqrt(_2993);
    float _2997 = sqrt(_2993);
    float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3001 = _2973 * _2999;
    float _3003 = _2977 * _2999;
    float _3005 = _3001 * _3001;
    float _3007 = _3003 * _3003;
    float _3009 = _3005 + _3007;
    float _3011 = sqrt(_3009);
    bool _3013 = _3011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3017 = _3011 + _3015;
    float _3019 = _2977;
    float _3021 = _3009;
    float _3023 = _3017;
    float _3025 = _3001;
    if (_3013)
    {
        float _3027 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3019 = _3027;
    }
    float _3029 = _3019;
    if (_3013)
    {
        float _3031 = rsqrt(_3009);
        _3021 = _3031;
    }
    float _3033 = _3021;
    if (_3013)
    {
        float _3035 = _3017 * _3029;
        _3023 = _3035;
    }
    float _3037 = _3023;
    if (_3013)
    {
        float _3039 = _3037 * 0.15915493667125701904296875;
        _2845 = _3039;
    }
    float _3041 = _2845;
    float _3043 = _2979;
    float _3045 = _3041;
    if (_3013)
    {
        float _3047 = _3041 * 6.283185482025146484375;
        float _3049 = sin(_3047);
        _3043 = _3049;
    }
    float _3051 = _3043;
    float _3053 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3055 = precise::max(0.0, _3053);
    float _3057 = _2995;
    float _3059 = _3053;
    float _3061 = _3055;
    if (_3013)
    {
        float _3063 = _3041 * 6.283185482025146484375;
        float _3065 = cos(_3063);
        _3057 = _3065;
    }
    float _3067 = _3057;
    float _3069 = -_2999;
    float _3071 = -_3055;
    float _3073 = fma(_2969, _3069, _3071);
    float _3075 = _3073;
    if (_3013)
    {
        float _3077 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3059 = _3077;
    }
    float _3079 = _3059;
    float _3081 = _3051;
    float _3083 = _3079;
    if (_3013)
    {
        float _3085 = fma(_3051, _3079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3081 = _3085;
    }
    float _3087 = _3081;
    float _3089 = _3087;
    if (!_3013)
    {
        _3083 = _3003;
    }
    float _3091 = _3083;
    float _3093 = _3091;
    if (_3013)
    {
        float _3095 = _3067 + (-1.0);
        _3061 = _3095;
    }
    float _3097 = _3061;
    float _3099 = _3097;
    if (_3013)
    {
        float _3101 = _3033 * _3087;
        _3045 = _3101;
    }
    float _3103 = _3045;
    float _3105 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3107 = _3105;
    if (!_3013)
    {
        _3089 = _3005;
    }
    float _3109 = _3089;
    float _3111 = _3109;
    if (_3013)
    {
        float _3113 = _3097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3099 = _3113;
    }
    float _3115 = _3099;
    if (_3013)
    {
        float _3117 = _3001 * _3103;
        _3025 = _3117;
    }
    float _3119 = _3025;
    if (_3013)
    {
        float _3121 = _3003 * _3103;
        _3093 = _3121;
    }
    float _3123 = _3093;
    float _3125 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3105);
    if (_3013)
    {
        float _3127 = fma(_3073, _3067, _3115);
        _3075 = _3127;
    }
    float _3129 = _3075;
    if (_3013)
    {
        float _3131 = _3119 * _3119;
        _3111 = _3131;
    }
    float _3133 = _3111;
    if (!_3013)
    {
        _3107 = _3007;
    }
    float _3135 = _3107;
    float _3137 = _3135;
    if (_3013)
    {
        float _3139 = _3123 * _3123;
        _3137 = _3139;
    }
    float _3141 = _3137;
    float _3143 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3145 = fma(_3129, _3129, _3133);
    float _3147 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3125);
    float _3149 = floor(_3143);
    float _3151 = _3145 + _3141;
    float _3153 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3155 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3157 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3159 = _3153 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3161 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3155);
    float _3163 = rsqrt(_3151);
    float _3165 = -_3159;
    float _3167 = fma(_3165, _3157, 1.0);
    float _3169 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3161);
    float _3171 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3173 = fma(_2337, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3175 = _2887 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3177 = _3169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3181 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3179);
    float _3183 = precise::clamp(_3181, 0.0, 1.0);
    float _3185 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3171);
    float _3187 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3175);
    float _3189 = floor(_3173);
    float _3191 = -_3183;
    float _3193 = _3191 + 1.0;
    float _3195 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3185);
    float _3197 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3187);
    float _3199 = _3163 * _3119;
    float _3201 = _3195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3203 = _3163 * _3129;
    float _3205 = abs(_3193);
    float _3207 = log2(_3205);
    float _3209 = _3199 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3211 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3213 = _3163 * _3123;
    float _3215 = _3197 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3217 = -_3209;
    float _3219 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3217);
    float _3221 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3211);
    float _3223 = log2(_3167);
    float _3225 = -_3213;
    float _3227 = fma(_3225, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3219);
    float _3229 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3221);
    float _3231 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3233 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3235 = fma(_3227, -0.5, 0.5);
    float _3237 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3229);
    float _3239 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3231);
    float _3241 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3233);
    float _3243 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3245 = 1.0 / _3237;
    float _3247 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3239);
    float _3249 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3241);
    float _3251 = fma(_3227, 0.5, 0.5);
    float _3253 = -_3189;
    float _3255 = _3173 + _3253;
    float _3257 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3247);
    float _3259 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3249);
    float _3261 = fma(_3251, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3263 = sqrt(_3235);
    float _3265 = _3223 * 0.693147182464599609375;
    float _3267 = _3203 + 1.0;
    float _3269 = fma(_3251, _3261, -0.212114393711090087890625);
    float _3271 = _3265 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3273 = fma(_3251, _3269, 1.570728778839111328125);
    float _3275 = exp2(_3243);
    float _3277 = -_3149;
    float _3279 = _3143 + _3277;
    float _3281 = _3149;
    float _3283 = _3143;
    float _3285 = _3237;
    float _3287 = _3259;
    if (_2989)
    {
        _3281 = _3257;
    }
    float _3289 = _3281;
    float _3291 = _3289;
    if (_2989)
    {
        _3283 = _3259;
    }
    float _3293 = _3283;
    float _3295 = _3293;
    if (!_2989)
    {
        _3291 = 0.0;
        _3295 = 0.0;
    }
    float _3297 = _3291;
    float _3299 = _3295;
    float2 _8808 = float2(_3279, _3255);
    float _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8808, float2(0.0), isnan(_8808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8808, float2(0.0), isnan(_8808)), level(0.0)).x;
    float _3303 = _3263 * 0.636619746685028076171875;
    float _3305 = _3245 * _3297;
    float _3307 = _3245 * _3299;
    float _3309 = -_3273;
    float _3311 = fma(_3303, _3309, 1.0);
    float _3313 = fma(_3305, 0.5, 0.5);
    float _3315 = -_3203;
    float _3317 = fma(_3275, _3267, _3315);
    float _3319 = fma(_3307, -0.5, 0.5);
    float _3321 = fma(_3317, 0.5, 0.5);
    float3 _8845 = float3(_3313, _3319, _3271);
    float _3323 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8845, float3(0.0), isnan(_8845)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8845, float3(0.0), isnan(_8845)), level(0.0)).x;
    float3 _8856 = float3(_3313, _3319, _3271);
    float4 _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8856, float3(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8856, float3(0.0), isnan(_8856)), level(0.0)).xyzw;
    float _3328 = _3326.x;
    float _3330 = _3326.y;
    float _3332 = _3326.z;
    float _3334 = _3326.w;
    float2 _8872 = float2(_3311, _3321);
    float3 _3338 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8872, float2(0.0), isnan(_8872)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8872, float2(0.0), isnan(_8872)), level(0.0)).xyz;
    float _3340 = _3338.x;
    float _3342 = _3338.y;
    float _3344 = _3338.z;
    float _3346 = _2319 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3348 = _2319 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3350 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3352 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3346);
    float _3354 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3348);
    bool _3356 = _2557 != 0.0;
    bool _3358 = isnan(_2557);
    bool _3360 = _3356 || _3358;
    bool _3362 = isnan(0.0);
    bool _3364 = _3360 || _3362;
    float _3366 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3352);
    float _3368 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3354);
    bool _3370 = _2555 == 0.0;
    bool _3372 = !_3364;
    bool _3374 = _3370 && _3372;
    float _3376 = exp2(_3350);
    float _3378 = _3366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3380 = _3368 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3382 = _2559 == 0.0;
    bool _3384 = _3382 && _3374;
    float _3386 = _3380 + _3378;
    float _3388 = 1.0 / _3378;
    float _3390 = -_3376;
    float _3392 = _3390 + 1.0;
    float _3394 = in.m_81.x;
    float _3396 = in.m_81.y;
    float _3398 = in.m_81.z;
    float _3400 = in.m_81.w;
    float _3402 = _3392 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3404 = _3386 * _3388;
    float _3406 = _3404 * 0.5;
    float _3408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3410 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3408);
    float _3412 = in.m_83.x;
    float _3414 = in.m_83.y;
    float _3416 = in.m_83.z;
    float _3418 = 1.0 / _3410;
    float _3420 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3422 = _3418 * _3420;
    float _3424 = abs(_3422);
    float _3426 = log2(_3424);
    float _3428 = _3418;
    float _3430 = _3412;
    if (_3384)
    {
        _2059 = _3412;
    }
    float _3432 = _2059;
    float _3434 = _3432;
    if (_3384)
    {
        _2247 = _3414;
    }
    float _3436 = _2247;
    float _3438 = _3436;
    if (_3384)
    {
        _3428 = _3416;
    }
    float _3440 = _3428;
    float _3442 = _3440;
    if (!_3384)
    {
        float _3444 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3416);
        _3442 = _3444;
    }
    float _3446 = _3442;
    bool _3448 = _3422 <= 8000.0;
    bool _3450 = isnan(_3422);
    bool _3452 = _3448 || _3450;
    bool _3454 = isnan(8000.0);
    bool _3456 = _3452 || _3454;
    float _3458 = float(_3456);
    float _3460 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3462 = _3426;
    if (_3384)
    {
        _3462 = _3432;
    }
    float _3464 = _3462;
    float _3466 = _3464;
    if (!_3384)
    {
        _3434 = _3412;
    }
    float _3468 = _3434;
    if (_3384)
    {
        _3430 = _3436;
    }
    float _3470 = _3430;
    float _3472 = exp2(_3460);
    float _3474 = _3470;
    if (!_3384)
    {
        _3438 = _3414;
    }
    float _3476 = _3438;
    if (!_3384)
    {
        float _3478 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3468);
        _3466 = _3478;
    }
    float _3480 = _3466;
    float _3482 = _3398 * _3468;
    if (!_3384)
    {
        float _3484 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3476);
        _3474 = _3484;
    }
    float _3486 = _3474;
    float _3488 = _3396 * _3416;
    float _3490 = _3394 * _3476;
    float _3492 = -_3482;
    float _3494 = fma(_3394, _3416, _3492);
    bool _3496 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3498 = isnan(_2997);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3504 = _3500 || _3502;
    float _3506 = -_3488;
    float _3508 = fma(_3398, _3476, _3506);
    float _3510 = _3508 * _3400;
    float _3512 = fma(_3472, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3514 = precise::clamp(_3512, 0.0, 1.0);
    float _3516 = -_3490;
    float _3518 = fma(_3396, _3468, _3516);
    float _3520 = _3494 * _3400;
    float _3522 = _2627 * _2687;
    float _3524 = fma(_3514, -2.0, 3.0);
    float _3526 = _3514 * _3514;
    float _3528 = _3518 * _3400;
    float _3530 = _2609 * _2693;
    float _3532 = _2609 * _2745;
    float _3534 = _3526 * _3524;
    float _3536 = _2609 * _2687;
    float _3538 = _2627 * _2693;
    float _3540 = _2627 * _2745;
    float _3542 = _2659 * _2693;
    float _3544 = _2659 * _2745;
    float _3546 = _2659 * _2687;
    float _3548 = fma(_2629, _2669, _3530);
    float _3550 = -_2553;
    float _3552 = fma(_3550, _2669, _3538);
    float _3554 = -_2553;
    float _3556 = fma(_3554, _2671, _3540);
    float _3558 = fma(_2629, _2671, _3532);
    float _3560 = -_2553;
    float _3562 = fma(_3560, _2673, _3522);
    float _3564 = -_3534;
    float _3566 = _3564 + 1.0;
    float _3568 = fma(_2629, _2673, _3536);
    float _3570 = fma(_2635, _2669, _3542);
    float _3572 = fma(_2635, _2671, _3544);
    float _3574 = fma(_2635, _2673, _3546);
    float _3576 = fma(_2631, _2563, _3552);
    float _3578 = fma(_2631, _2567, _3556);
    float _3580 = fma(_2631, _2565, _3562);
    float _3582 = fma(_3566, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3534);
    float _3584 = fma(_2649, _2567, _3558);
    float _3586 = fma(_2649, _2563, _3548);
    float _3588 = fma(_2611, _2563, _3570);
    float _3590 = fma(_2611, _2567, _3572);
    float _3592 = _3576 * _3396;
    float _3594 = _3578 * _3396;
    float _3596 = _3580 * _3396;
    float _3598 = _3576 * _3486;
    float _3600 = fma(_2649, _2565, _3568);
    float _3602 = fma(_2611, _2565, _3574);
    float _3604 = _3520 * _3576;
    float _3606 = _3520 * _3578;
    float _3608 = _3520 * _3580;
    float _3610 = fma(_3586, _3480, _3598);
    float _3612 = _3177 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3614 = fma(_3586, _3394, _3592);
    float _3616 = fma(_3584, _3394, _3594);
    float _3618 = fma(_3600, _3394, _3596);
    float _3620 = fma(_3510, _3586, _3604);
    float _3622 = fma(_3510, _3584, _3606);
    float _3624 = fma(_3510, _3600, _3608);
    float _3626 = fma(_3201, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3612);
    float _3628 = fma(_3588, _3398, _3614);
    float _3630 = fma(_3590, _3398, _3616);
    float _3632 = fma(_3602, _3398, _3618);
    float _3634 = fma(_3528, _3588, _3620);
    float _3636 = _3458 * _3582;
    float _3638 = in.m_79.x;
    float _3640 = _3578 * _3486;
    float _3642 = _3580 * _3486;
    float _3644 = _3636 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _3628;
    out.m_85.y = _3630;
    out.m_85.z = _3632;
    float _3646 = fma(_3584, _3480, _3640);
    float _3648 = fma(_3153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3626);
    float _3650 = fma(_3600, _3480, _3642);
    float _3652 = fma(_3528, _3590, _3622);
    float _3654 = fma(_3528, _3602, _3624);
    float _3656 = fma(_3215, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3648);
    float _3658 = fma(_3588, _3446, _3610);
    float _3660 = _3656 + _3237;
    int _3662 = as_type<int>(_3616);
    float _3664 = _3257;
    float _3666 = _3654;
    float _3668 = _3652;
    float _3670 = _3634;
    if (!_2989)
    {
        float _3672 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _3662 = as_type<int>(_3672);
    }
    int _3674 = _3662;
    float _3676 = fma(_3602, _3446, _3650);
    float _3678 = _3660 * 0.5;
    float _3680 = fma(_3590, _3446, _3646);
    out.gl_Position.x = _3257;
    out.gl_Position.y = _3259;
    out.gl_Position.z = _3656;
    out.gl_Position.w = _3237;
    if (!_2989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9455 = as_type<float>(_3674);
        out.gl_Position.z = _9455;
    }
    out.m_87.z = _3678;
    out.m_87.w = _3237;
    out.m_89.x = _3658;
    out.m_89.y = _3680;
    out.m_89.z = _3676;
    float _3682 = _2965 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3684 = _3682;
    if (!_2989)
    {
        _3684 = 0.0;
    }
    float _3686 = _3684;
    out.m_91.x = _3634;
    out.m_91.y = _3652;
    out.m_91.z = _3654;
    if (!_3504)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3688 = _3285;
    float _3690 = _3688;
    float _3692 = _3688;
    if (!_3504)
    {
        _3664 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3694 = _3664;
    float _3696 = _3694;
    float _3698 = _3694;
    if (!_3504)
    {
        _3287 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3700 = _3287;
    float _3702 = _3700;
    float _3704 = _3700;
    if (!_3504)
    {
        _3666 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3706 = _3666;
    float _3708 = _3706;
    float _3710 = _3706;
    if (!_3504)
    {
        _3668 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3712 = _3668;
    float _3714 = _3712;
    float _3716 = _3712;
    if (!_3504)
    {
        _3670 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3718 = _3670;
    float _3720 = -_3301;
    float _3722 = _3720 + 1.0;
    float _3724 = _3722 * _3644;
    float _3726 = precise::clamp(_3724, 0.0, 1.0);
    float _3728 = -_3726;
    float _3730 = fma(_3728, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3732 = _3730 * _3638;
    float _3734 = _3402 * _3323;
    float _3736 = -_3402;
    float _3738 = _3736 + 1.0;
    float _3740 = _3732 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3742 = _3334 * _3734;
    float _3744 = _3344 * _3734;
    float _3746 = _3334 * _3738;
    out.m_93.x = _3740;
    float _3748 = fma(_3340, _3742, _3328);
    float _3750 = fma(_3342, _3742, _3330);
    float _3752 = fma(_3334, _3744, _3332);
    out.m_95.x = _3748;
    out.m_95.y = _3750;
    out.m_95.z = _3752;
    out.m_95.w = _3746;
    bool _3754 = !_3504;
    float _3756 = _3718;
    float _3758 = _3718;
    if (!_3754)
    {
        bool _3760 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3762 = isnan(_2997);
        bool _3764 = _3760 || _3762;
        bool _3766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3768 = _3764 || _3766;
        if (!_3768)
        {
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3772 = _2997 + _3770;
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3776 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3774;
            float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3786 = 1.0 / _3776;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3792 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3800 = _3772 * _3786;
            float _3802 = precise::clamp(_3800, 0.0, 1.0);
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3808 = fma(_3802, _3780, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3810 = fma(_3802, _3784, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3812 = fma(_3802, _3806, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3814 = fma(_3802, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3816 = fma(_3802, _3794, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3818 = fma(_3802, _3798, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3716 = _3808;
            _3698 = _3816;
            _3710 = _3810;
            _3692 = _3814;
            _3758 = _3812;
            _3704 = _3818;
            _3820 = true;
        }
        else
        {
            bool _3822 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3824 = isnan(_2997);
            bool _3826 = _3822 || _3824;
            bool _3828 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3830 = _3826 || _3828;
            if (!_3830)
            {
                _3690 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3832 = _3690;
            _3692 = _3832;
            if (!_3830)
            {
                _3696 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3834 = _3696;
            _3698 = _3834;
            if (!_3830)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3836 = _3702;
            _3704 = _3836;
            if (!_3830)
            {
                _3708 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3838 = _3708;
            _3710 = _3838;
            if (!_3830)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3840 = _3714;
            _3716 = _3840;
            if (!_3830)
            {
                _3756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3842 = _3756;
            bool _3844 = !_3830;
            _3758 = _3842;
            if (!_3844)
            {
                bool _3846 = _2997 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3848 = isnan(_2997);
                bool _3850 = _3846 || _3848;
                bool _3852 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3854 = _3850 || _3852;
                if (!_3854)
                {
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3858 = _2997 + _3856;
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3862 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3860;
                    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3870 = _3868 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3872 = 1.0 / _3862;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3880 = _3878 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3886 = _3858 * _3872;
                    float _3888 = precise::clamp(_3886, 0.0, 1.0);
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3894 = fma(_3888, _3866, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3896 = fma(_3888, _3870, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3898 = fma(_3888, _3892, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3900 = fma(_3888, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3902 = fma(_3888, _3880, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3904 = fma(_3888, _3884, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3716 = _3894;
                    _3698 = _3902;
                    _3710 = _3896;
                    _3692 = _3900;
                    _3758 = _3898;
                    _3704 = _3904;
                    _3820 = true;
                }
                else
                {
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3698 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3710 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3692 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3820 = false;
    float _3906 = _3716;
    float _3908 = _3698;
    float _3910 = _3710;
    float _3912 = _3692;
    float _3914 = _3758;
    float _3916 = _3704;
    float _3918 = fma(_3680, -0.5, 0.5);
    float _3920 = precise::clamp(_3918, 0.0, 1.0);
    float _3922 = -_3906;
    float _3924 = _3908 + _3922;
    float _3926 = -_3910;
    float _3928 = _3912 + _3926;
    float _3930 = -_3914;
    float _3932 = _3916 + _3930;
    bool _3934 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3936 = fma(_3920, _3924, _3906);
    float _3938 = fma(_3920, _3928, _3910);
    float _3940 = fma(_3920, _3932, _3914);
    float _3942 = _3686 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3944 = _3936 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _3946 = fma(_3938, 0.298911988735198974609375, _3944);
    out.m_93.w = _3942;
    float _3948 = fma(_3940, 0.114477999508380889892578125, _3946);
    float _3950 = -_3948;
    float _3952 = _3938 + _3950;
    float _3954 = -_3948;
    float _3956 = _3936 + _3954;
    float _3958 = -_3948;
    float _3960 = _3940 + _3958;
    out.m_97.x = 0.0;
    float _3962 = fma(_3952, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    float _3964 = fma(_3956, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    float _3966 = fma(_3960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3948);
    out.m_99.x = _3962;
    out.m_99.y = _3964;
    out.m_99.z = _3966;
    if (!_3934)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3968 = -_2887;
    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3972 = -_2889;
    float _3974 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3976 = -_2891;
    float _3978 = _3976 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3980 = _3970 * _3970;
    float _3982 = fma(_3974, _3974, _3980);
    float _3984 = fma(_3978, _3978, _3982);
    float _3986 = sqrt(_3984);
    float _3988 = rsqrt(_3984);
    float _3990 = -_3986;
    float _3992 = _3990 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3994 = _3992 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3996 = precise::clamp(_3994, 0.0, 1.0);
    float _3998 = _3974 * _3988;
    float _4000 = _3970 * _3988;
    float _4002 = abs(_3996);
    float _4004 = log2(_4002);
    float _4006 = _3978 * _3988;
    float _4008 = _3998 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4010 = _3680 * _4000;
    float _4012 = -_4000;
    float _4014 = -_4008;
    float _4016 = fma(_4012, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4014);
    float _4018 = fma(_3658, _3998, _4010);
    float _4020 = -_4006;
    float _4022 = fma(_4020, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4016);
    float _4024 = fma(_3676, _4006, _4018);
    float _4026 = precise::clamp(_4024, 0.0, 1.0);
    float _4028 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4030 = _4022 + _4028;
    float _4032 = _4004 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4034 = _4030 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4036 = precise::clamp(_4034, 0.0, 1.0);
    float _4038 = exp2(_4032);
    float _4040 = _4038 * _4036;
    float _4042 = _4026 * _4040;
    float _4044 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4046 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4048 = _4042 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4044;
    out.m_97.y = _4046;
    out.m_97.z = _4048;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

