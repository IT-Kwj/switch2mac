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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_22Smplr_w [[id(17)]];
    sampler vp_t_tcb_14Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_95 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_77 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3698 = false;
    bool _2097 = false;
    bool _2093 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_53.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_56.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3997 = as_type<float>(_130);
        out.gl_Position.z = _3997;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_58.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_56.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4065 = as_type<float>(_166);
        out.gl_Position.z = _4065;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = as_type<float>(int(gl_VertexIndex));
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _172 = as_type<int>(_168) & 1;
    bool _174 = _172 != 0;
    int _176 = as_type<int>(_168) & 2;
    bool _178 = _176 != 0;
    bool _180 = !_174;
    float _182 = _180 ? (-0.5) : 0.5;
    bool _184 = !_178;
    float _186 = _184 ? (-0.5) : 0.5;
    bool _188 = !_170;
    float _206;
    if (!_188)
    {
        float _190 = in.m_63.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        float _210 = float(_114);
        float _212 = 1.0 / _210;
        float _214 = _148 * _212;
        _206 = _214;
    }
    _208 = false;
    float _216 = _206;
    float _218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _220 = int(_218);
    float _222 = float(_114);
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _226 = _224 != 0;
    float _228 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _230 = int(_228);
    float _232 = float(_220);
    float _234 = 1.0 / _222;
    float _236 = float(uint(_230));
    float _238 = 1.0 / _232;
    int _240 = ~_230;
    int _242 = _240 + 1;
    int _244 = ~_230;
    int _246 = _244 + 1;
    bool _248 = _230 == 0;
    float _250 = 1.0 / _236;
    float _252 = _148 * _238;
    float _254 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _256 = int(_254);
    int _258 = as_type<int>(_250) + (-2);
    float _260 = trunc(_252);
    int _262 = int(_260);
    float _264 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _266 = int(_264);
    float _268 = float(uint(_262));
    float _270 = float(_262);
    float _272 = as_type<float>(_258) * _268;
    float _274 = trunc(_272);
    float _276 = precise::max(_274, 0.0);
    uint _279 = uint(_276);
    float _281 = float(_230);
    bool _283 = _270 >= _281;
    bool _285 = isnan(_270);
    bool _287 = _283 || _285;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    int _295 = _242 * int(_279);
    int _297 = _295 + _262;
    float _299 = in.m_63.x;
    float _301 = in.m_63.y;
    float _303 = in.m_63.z;
    float _305 = in.m_63.w;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = float(uint(_297));
    float _313 = as_type<float>(_258) * _311;
    float _315 = _311;
    if (_226)
    {
        _315 = 1.0;
    }
    float _317 = _315;
    float _319 = _317;
    if (!_226)
    {
        _319 = 7.345489978790283203125;
    }
    float _321 = _319;
    float _323 = trunc(_313);
    float _325 = precise::max(_323, 0.0);
    uint _327 = uint(_325);
    float _329 = _321 * _299;
    int _331 = int(_279) + int(_327);
    float _333 = floor(_329);
    int _335 = _246 * _331;
    int _337 = _335 + _262;
    float _339 = float(uint(_266));
    bool _341 = uint(_337) >= uint(_230);
    float _343 = 1.0 / _339;
    bool _345 = !_341;
    int _347 = _345 ? 0 : (-1);
    int _349 = ~_331;
    int _351 = _349 + _347;
    int _353 = _351 + 1;
    float _355 = -_333;
    float _357 = _329 + _355;
    float _359 = float(_256);
    int _361 = ~_309;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    int _367 = _230 * _353;
    int _369 = _367 + _262;
    float _371 = 1.0 / _359;
    float _373 = _357 * _281;
    int _375 = _230 + (-1);
    bool _377 = !_248;
    int _379 = _377 ? _369 : (-1);
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _391 = _389 != 0;
    float _393 = trunc(_373);
    int _395 = int(_393);
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _399 = _397 != 0;
    int _401 = _379 * _365;
    float _403 = _148 * _234;
    bool _405 = !_387;
    int _407 = _405 ? 0 : 1;
    int _409 = _309 * _375;
    int _411 = _409 + _401;
    float _413 = _403 * _281;
    bool _415 = !_383;
    int _417 = _415 ? 0 : 1;
    int _419 = abs(_407);
    float _421 = _148 * _371;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _425 = _423 != 0;
    float _427 = trunc(_413);
    int _429 = int(_427);
    bool _431 = !_391;
    int _433 = _431 ? 0 : 1;
    bool _435 = !_399;
    int _437 = _435 ? 0 : 1;
    int _439 = abs(_417);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _443 = _441 != 0;
    float _445 = trunc(_421);
    int _447 = int(_445);
    bool _449 = !_425;
    int _451 = _449 ? 0 : 1;
    int _453 = abs(_437);
    int _455 = abs(_433);
    int _457 = _411 * _419;
    int _459 = abs(_451);
    int _461 = _395 * _453;
    int _463 = _461 + _262;
    int _465 = _429 * _439;
    int _467 = _465 + _457;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _471 = _469 != 0;
    float _473 = as_type<float>(_375);
    float _475 = as_type<float>(_467);
    float _477 = _303;
    if (_443)
    {
        float _479 = in.m_63.x;
        _473 = _479;
    }
    float _481 = _473;
    int _483 = ~_230;
    int _485 = _483 + 1;
    int _487 = _463 * _455;
    int _489 = _487 + _467;
    int _491 = as_type<int>(_343) + (-2);
    float _493 = _481;
    if (!_443)
    {
        float _495 = in.m_63.y;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = float(uint(_447));
    int _501 = _395 * _459;
    int _503 = _501 + _489;
    int _505 = ~_266;
    int _507 = _505 + 1;
    int _509 = ~_230;
    int _511 = _509 + 1;
    float _513 = as_type<float>(_491) * _499;
    float _515 = float(uint(_503));
    if (_443)
    {
        _475 = 1.0;
    }
    float _517 = _475;
    float _519 = trunc(_513);
    float _521 = precise::max(_519, 0.0);
    uint _523 = uint(_521);
    float _525 = _517;
    if (!_443)
    {
        _525 = 1.2345600128173828125;
    }
    float _527 = _525;
    float _529 = as_type<float>(_258) * _515;
    float _531 = trunc(_529);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    float _537 = _497 * _527;
    int _539 = _507 * int(_523);
    int _541 = _539 + _447;
    float _543 = floor(_537);
    float _545 = float(uint(_541));
    int _547 = _511 * int(_535);
    int _549 = _547 + _503;
    float _551 = as_type<float>(_491) * _545;
    float _553 = float(uint(_463));
    float _555 = float(uint(_549));
    float _557 = trunc(_551);
    float _559 = precise::max(_557, 0.0);
    uint _561 = uint(_559);
    float _563 = as_type<float>(_258) * _553;
    float _565 = as_type<float>(_258) * _555;
    float _567 = -_543;
    float _569 = _537 + _567;
    int _571 = ~_230;
    int _573 = _571 + 1;
    float _575 = trunc(_565);
    float _577 = precise::max(_575, 0.0);
    uint _579 = uint(_577);
    float _581 = trunc(_563);
    float _583 = precise::max(_581, 0.0);
    uint _585 = uint(_583);
    int _587 = int(_523) + int(_561);
    int _589 = ~_266;
    int _591 = _589 + 1;
    int _593 = int(_535) + int(_579);
    int _595 = _591 * _587;
    int _597 = _595 + _447;
    float _599 = float(_266);
    float _601 = float(_447);
    int _603 = _573 * _593;
    int _605 = _603 + _503;
    bool _607 = !_471;
    int _609 = _607 ? 0 : 1;
    float _611 = _569 * _599;
    bool _613 = _601 >= _599;
    bool _615 = isnan(_601);
    bool _617 = _613 || _615;
    bool _619 = isnan(_599);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _403 * _599;
    bool _627 = uint(_597) >= uint(_266);
    bool _629 = uint(_605) >= uint(_230);
    float _631 = trunc(_611);
    int _633 = int(_631);
    int _635 = abs(_609);
    int _637 = _485 * int(_585);
    int _639 = _637 + _463;
    bool _641 = !_627;
    int _643 = _641 ? 0 : (-1);
    bool _645 = !_629;
    int _647 = _645 ? 0 : (-1);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _663 = _661 != 0;
    float _665 = trunc(_623);
    int _667 = int(_665);
    int _669 = ~_587;
    int _671 = _669 + _643;
    int _673 = _671 + 1;
    float _675 = float(uint(_639));
    int _677 = ~_593;
    int _679 = _677 + _647;
    int _681 = _679 + 1;
    int _683 = _266 * _673;
    int _685 = _683 + _447;
    bool _687 = _266 == 0;
    float _689 = as_type<float>(_258) * _675;
    bool _691 = _230 == 0;
    int _693 = _230 * _681;
    int _695 = _693 + _503;
    bool _697 = !_687;
    int _699 = _697 ? _685 : (-1);
    int _701 = _633 * _635;
    int _703 = _701 + _447;
    bool _705 = !_655;
    int _707 = _705 ? 0 : 1;
    float _709 = trunc(_625);
    int _711 = int(_709);
    bool _713 = !_691;
    int _715 = _713 ? _695 : (-1);
    int _717 = ~_667;
    int _719 = _717 + 1;
    int _721 = _719 + 1;
    int _723 = _266 + (-1);
    int _725 = abs(_707);
    int _727 = _699 * _721;
    int _729 = _715 >> 31;
    bool _731 = !_651;
    int _733 = _731 ? 0 : 1;
    int _735 = _667 * _723;
    int _737 = _735 + _727;
    int _739 = _729 & 3;
    int _741 = abs(_733);
    int _743 = _737 * _725;
    bool _745 = !_659;
    int _747 = _745 ? 0 : 1;
    int _749 = _715 + _739;
    int _751 = _711 * _741;
    int _753 = _751 + _743;
    bool _755 = !_663;
    int _757 = _755 ? 0 : 1;
    int _759 = abs(_747);
    int _761 = _749 >> 2;
    int _763 = abs(_757);
    int _765 = _703 * _759;
    int _767 = _765 + _753;
    int _769 = _761 << 4;
    int _771 = _769 + 368;
    float _773 = trunc(_689);
    float _775 = precise::max(_773, 0.0);
    uint _777 = uint(_775);
    uint _779 = uint(int(uint(_771) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[int(_789)][_791];
    int _795 = _715 & 3;
    bool _797 = _795 != 0;
    int _799 = _633 * _763;
    int _801 = _799 + _767;
    int _803 = ~_230;
    int _805 = _803 + 1;
    int _807 = ~_266;
    int _809 = _807 + 1;
    float _811 = float(uint(_801));
    int _813 = ~_266;
    int _815 = _813 + 1;
    float _817 = as_type<float>(_491) * _811;
    int _819 = int(_585) + int(_777);
    int _821 = _715 & 3;
    bool _823 = _821 != 0;
    int _825 = _771 + 8;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = trunc(_817);
    float _845 = precise::max(_843, 0.0);
    uint _847 = uint(_845);
    bool _849 = uint(_821) > 1u;
    int _851 = _805 * _819;
    int _853 = _851 + _463;
    int _855 = _797 ? 0 : 1;
    bool _857 = _305 > 0.5;
    bool _859 = uint(_853) >= uint(_230);
    int _861 = ~_855;
    int _863 = _861 + 1;
    int _865 = _863 + 1;
    bool _867 = !_823;
    int _869 = _867 ? 0 : 1;
    bool _871 = !_859;
    int _873 = _871 ? 0 : (-1);
    int _875 = _865;
    if (!_849)
    {
        int _877 = ~_855;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    int _883 = _809 * int(_847);
    int _885 = _883 + _801;
    bool _887 = _821 != 3;
    int _889 = abs(_881);
    int _891 = abs(_869);
    float _893 = float(uint(_885));
    bool _895 = uint(_821) >= 2u;
    int _897 = ~_889;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = ~_819;
    int _905 = _903 + _873;
    int _907 = _905 + 1;
    float _909 = as_type<float>(_491) * _893;
    int _911 = _895 ? 0 : 1;
    int _913 = _901 * as_type<int>(_793);
    int _915 = ~_891;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    int _921 = _230 * _907;
    int _923 = _921 + _463;
    int _925 = ~_911;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = trunc(_909);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    bool _937 = _821 != 3;
    int _939 = _919 * as_type<int>(_785);
    int _941 = _939 + _913;
    int _943 = _929;
    if (_887)
    {
        int _945 = ~_911;
        int _947 = _945 + 1;
        _943 = _947;
    }
    int _949 = _943;
    float _951 = float(uint(_703));
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _955 = _953 != 0;
    float _957 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _959 = int(_957);
    bool _961 = !_937;
    int _963 = _961 ? 0 : (-1);
    float _965 = as_type<float>(_491) * _951;
    int _967 = abs(_949);
    bool _969 = !_955;
    int _971 = _969 ? 0 : 1;
    int _973 = abs(_963);
    float _975 = trunc(_965);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    int _981 = abs(_971);
    int _983 = ~_967;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    int _989 = ~_973;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    float _995 = float(uint(_959));
    int _997 = _987 * as_type<int>(_833);
    int _999 = _997 + _941;
    int _1001 = abs(_959);
    float _1003 = in.m_53.x;
    float _1005 = in.m_53.y;
    float _1007 = in.m_53.z;
    int _1009 = ~_266;
    int _1011 = _1009 + 1;
    int _1013 = _993 * as_type<int>(_841);
    int _1015 = _1013 + _999;
    int _1017 = ~_981;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = 1.0 / _995;
    float _1025 = float(uint(_1001));
    int _1027 = _1011 * int(_979);
    int _1029 = _1027 + _703;
    bool _1031 = !_691;
    int _1033 = _1031 ? _923 : (-1);
    int _1035 = _1015 * _1021;
    int _1037 = int(_847) + int(_935);
    float _1039 = in.m_65.x;
    float _1041 = in.m_65.y;
    float _1043 = in.m_65.z;
    float _1045 = in.m_65.w;
    float _1047 = float(uint(_1029));
    float _1049 = 1.0 / _1025;
    int _1051 = _1033 * _981;
    int _1053 = _1051 + _1035;
    float _1055 = in.m_67.x;
    float _1057 = in.m_67.y;
    float _1059 = in.m_67.z;
    float _1061 = in.m_67.w;
    int _1063 = _815 * _1037;
    int _1065 = _1063 + _801;
    float _1067 = as_type<float>(_491) * _1047;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1071 = _1069 != 0;
    float _1073 = in.m_69.x;
    float _1075 = in.m_69.y;
    float _1077 = in.m_69.z;
    float _1079 = in.m_69.w;
    float _1081 = float(uint(_1053));
    float _1083 = trunc(_1067);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    int _1089 = as_type<int>(_1023) + (-2);
    int _1091 = abs(_1053);
    bool _1093 = uint(_1065) >= uint(_266);
    float _1095 = as_type<float>(_1089) * _1081;
    float _1097 = float(uint(_1091));
    int _1099 = as_type<int>(_1049) + (-2);
    float _1101 = -_186;
    int _1103 = _857 ? as_type<int>(_1101) : as_type<int>(_186);
    float _1105 = trunc(_1095);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1121 = _1119 != 0;
    float _1123 = as_type<float>(_1099) * _1097;
    float _1125 = _1005 * _1041;
    bool _1127 = !_1093;
    int _1129 = _1127 ? 0 : (-1);
    float _1131 = _1005 * _1057;
    float _1133 = trunc(_1123);
    float _1135 = precise::max(_1133, 0.0);
    uint _1137 = uint(_1135);
    int _1139 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1141 = _1139 != 0;
    float _1143 = _1005 * _1075;
    int _1145 = ~_266;
    int _1147 = _1145 + 1;
    float _1149 = fma(_1003, _1055, _1131);
    int _1151 = int(_979) + int(_1087);
    float _1153 = fma(_1003, _1073, _1143);
    float _1155 = fma(_1003, _1039, _1125);
    int _1157 = ~_959;
    int _1159 = _1157 + 1;
    int _1161 = as_type<int>(_1123);
    float _1163 = as_type<float>(_1001);
    if (_443)
    {
        _1161 = 0;
    }
    int _1165 = _1161;
    int _1167 = _1147 * _1151;
    int _1169 = _1167 + _703;
    int _1171 = _1165;
    if (!_443)
    {
        _1171 = 1;
    }
    int _1173 = _1171;
    int _1175 = _1159 * int(_1109);
    int _1177 = _1175 + _1053;
    int _1179 = ~_1037;
    int _1181 = _1179 + _1129;
    int _1183 = _1181 + 1;
    int _1185 = ~int(_1137);
    int _1187 = _1185 + 1;
    bool _1189 = uint(_1169) >= uint(_266);
    float _1191 = float(uint(_1177));
    int _1193 = _266 * _1183;
    int _1195 = _1193 + _801;
    bool _1197 = !_1189;
    int _1199 = _1197 ? 0 : (-1);
    int _1201 = _1187 * _1001;
    int _1203 = _1201 + _1091;
    float _1205 = as_type<float>(_1089) * _1191;
    bool _1207 = !_687;
    int _1209 = _1207 ? _1195 : (-1);
    float _1211 = float(uint(_1203));
    float _1213 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1215 = _1209 >> 31;
    float _1217 = trunc(_1205);
    float _1219 = precise::max(_1217, 0.0);
    uint _1221 = uint(_1219);
    bool _1223 = !_1113;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = as_type<float>(_1099) * _1211;
    int _1229 = _1209 & 3;
    bool _1231 = _1229 != 0;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1235 = _1209 & 3;
    bool _1237 = _1235 != 0;
    int _1239 = _1215 & 3;
    float _1241 = trunc(_1227);
    float _1243 = precise::max(_1241, 0.0);
    uint _1245 = uint(_1243);
    int _1247 = _1231 ? 0 : 1;
    float _1249 = -_1233;
    float _1251 = fma(_1213, 2.0, _1249);
    int _1253 = ~_1151;
    int _1255 = _1253 + _1199;
    int _1257 = _1255 + 1;
    bool _1259 = uint(_1235) > 1u;
    int _1261 = _1209 + _1239;
    int _1263 = _266 * _1257;
    int _1265 = _1263 + _703;
    int _1267 = int(_1109) + int(_1221);
    float _1269 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1271 = _1261 >> 2;
    bool _1273 = !_687;
    int _1275 = _1273 ? _1265 : (-1);
    int _1277 = _1271 << 4;
    int _1279 = _1277 + 512;
    bool _1281 = _1235 != 3;
    int _1283 = ~_1247;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    uint _1289 = uint(int(uint(_1279) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    int _1305 = _1287;
    if (!_1259)
    {
        int _1307 = ~_1247;
        int _1309 = _1307 + 1;
        _1305 = _1309;
    }
    int _1311 = _1305;
    bool _1313 = uint(_1235) >= 2u;
    int _1315 = int(_1137) + int(_1245);
    int _1317 = _1313 ? 0 : 1;
    int _1319 = ~_1315;
    int _1321 = _1319 + 1;
    int _1323 = ~_1317;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = ~_959;
    int _1331 = _1329 + 1;
    int _1333 = _1321 * _1001;
    int _1335 = _1333 + _1091;
    int _1337 = _1327;
    float _1339 = as_type<float>(_1311);
    if (_1281)
    {
        int _1341 = ~_1317;
        int _1343 = _1341 + 1;
        _1337 = _1343;
    }
    int _1345 = _1337;
    int _1347 = _1279 + 8;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    int _1365 = _1331 * _1267;
    int _1367 = _1365 + _1053;
    bool _1369 = !_1237;
    int _1371 = _1369 ? 0 : 1;
    bool _1373 = _1173 != 1;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1377 = uint(_1367) >= uint(_959);
    float _1379 = fma(_1269, -2.0, _1375);
    bool _1381 = !_1377;
    int _1383 = _1381 ? 0 : (-1);
    bool _1385 = _1235 != 3;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1389 = ~_1267;
    int _1391 = _1389 + _1383;
    int _1393 = _1391 + 1;
    float _1395 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1379);
    bool _1397 = !_1385;
    int _1399 = _1397 ? 0 : (-1);
    float _1401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1387);
    bool _1403 = uint(_1335) >= uint(_1001);
    int _1405 = _959 * _1393;
    int _1407 = _1405 + _1053;
    bool _1409 = _959 == 0;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1413 = int(_1411);
    bool _1415 = !_1403;
    int _1417 = _1415 ? 0 : (-1);
    float _1419 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1401);
    float _1421 = as_type<float>(_1367);
    if (!_1373)
    {
        _1421 = _301;
    }
    float _1423 = _1421;
    float _1425 = _1423;
    if (!_1373)
    {
        _1163 = _301;
    }
    float _1427 = _1163;
    float _1429 = -_1419;
    float _1431 = _1429 + 1.0;
    bool _1433 = _299 > 0.5;
    float _1435 = _1427;
    if (_1373)
    {
        _1425 = _299;
    }
    float _1437 = _1425;
    if (_1373)
    {
        _1435 = _299;
    }
    float _1439 = _1435;
    bool _1441 = !_1409;
    int _1443 = _1441 ? _1407 : (-1);
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1447 = abs(_1311);
    int _1449 = abs(_1371);
    int _1451 = ~_1447;
    int _1453 = _1451 + 1;
    int _1455 = _1453 + 1;
    int _1457 = ~_1449;
    int _1459 = _1457 + 1;
    int _1461 = _1459 + 1;
    int _1463 = _1455 * as_type<int>(_1303);
    float _1465 = fma(_1007, _1043, _1155);
    int _1467 = abs(_1345);
    int _1469 = _1461 * as_type<int>(_1295);
    int _1471 = _1469 + _1463;
    int _1473 = abs(_1399);
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1475;
    int _1479 = ~_1467;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    float _1485 = fma(_1007, _1059, _1149);
    float _1487 = fma(_1007, _1077, _1153);
    int _1489 = abs(_1225);
    int _1491 = _1483 * as_type<int>(_1355);
    int _1493 = _1491 + _1471;
    int _1495 = ~_1473;
    int _1497 = _1495 + 1;
    int _1499 = _1497 + 1;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1503 = abs(_1413);
    float _1505 = _1465 + _1045;
    bool _1507 = _303 > 0.5;
    int _1509 = _1499 * as_type<int>(_1363);
    int _1511 = _1509 + _1493;
    if (!_1373)
    {
        _1339 = _303;
    }
    float _1513 = _1339;
    float _1515 = _1485 + _1061;
    int _1517 = ~_1489;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1505 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1525 = _1513;
    if (_1373)
    {
        _477 = _301;
    }
    float _1527 = _477;
    if (_1373)
    {
        _1525 = _301;
    }
    float _1529 = _1525;
    bool _1531 = _301 > 0.5;
    float _1533 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1501);
    float _1535 = float(uint(_1503));
    float _1537 = 1.0 / _1477;
    float _1539 = float(uint(_1413));
    float _1541 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1533);
    float _1543 = -_1541;
    float _1545 = _1543 + 1.0;
    float _1547 = 1.0 / _1535;
    int _1549 = _1511 * _1521;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1553 = _216 + _1551;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1555;
    float _1559 = float(_1443);
    int _1561 = _1275 * _1489;
    int _1563 = _1561 + _1549;
    bool _1565 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1567 = isnan(_216);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = 1.0 / _1539;
    bool _1579 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1581 = isnan(_216);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1553 * _1537;
    int _1593 = abs(_1563);
    float _1595 = -_1575;
    float _1597 = _1595 + 1.0;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1599;
    float _1603 = fma(_1557, _1591, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1605 = _1589 * _1597;
    int _1607 = as_type<int>(_1547) + (-2);
    float _1609 = _1487 + _1079;
    float _1611 = float(uint(_1593));
    float _1613 = fma(_1601, _1591, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1615 = float(uint(_1563));
    float _1617 = _1603 * _1605;
    float _1619 = -_1589;
    float _1621 = _1619 + 1.0;
    float _1623 = as_type<float>(_1607) * _1611;
    int _1625 = as_type<int>(_1577) + (-2);
    float _1627 = _1613 * _1605;
    float _1629 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1617);
    float _1631 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1633 = as_type<float>(_1625) * _1615;
    float _1635 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1627);
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1641 = ~_1413;
    int _1643 = _1641 + 1;
    float _1645 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1635);
    float _1647 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1629);
    float _1649 = trunc(_1633);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = fma(_1529, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1639);
    float _1657 = _1515 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1659 = _1609 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1661 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1637);
    float _1663 = in.m_71.x;
    float _1665 = in.m_71.y;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1669 = trunc(_1623);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = _1053 ^ _959;
    int _1677 = ~_1417;
    int _1679 = _1315 + _1677;
    int _1681 = _1679 + 1;
    uint _1683 = uint(int(uint(_1675) >> uint(31)));
    bool _1685 = !_1071;
    float _1687 = _1685 ? _186 : as_type<float>(_1103);
    int _1689 = _1643 * int(_1653);
    int _1691 = _1689 + _1563;
    float _1693 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1697 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1699 = ~int(_1683);
    int _1701 = _1699 + 1;
    float _1703 = float(uint(_1691));
    float _1705 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1693);
    int _1707 = ~int(_1673);
    int _1709 = _1707 + 1;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1713 = as_type<float>(_1625) * _1703;
    float _1715 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1705);
    int _1717 = _1709 * _1503;
    int _1719 = _1717 + _1593;
    float _1721 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1667);
    float _1723 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1697);
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1727 = _1715 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1729 = float(uint(_1719));
    float _1731 = trunc(_1713);
    float _1733 = precise::max(_1731, 0.0);
    uint _1735 = uint(_1733);
    float _1737 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1721);
    float _1739 = _1727 * _1631;
    float _1741 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1723);
    float _1743 = as_type<float>(_1607) * _1729;
    float _1745 = _1737 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1747 = fma(_1739, 0.5, 0.5);
    float _1749 = -_1725;
    float _1751 = fma(_1445, 2.0, _1749);
    float _1753 = _1745 * _1695;
    float _1755 = trunc(_1743);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = _1741 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _1763 = ~_1413;
    int _1765 = _1763 + 1;
    float _1767 = _1647 * _1665;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1771 = _1761 * _1711;
    int _1773 = int(_1653) + int(_1735);
    float _1775 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1777 = _1645 * _1663;
    float _1779 = -_148;
    float _1781 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1251);
    float _1783 = -_148;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1751);
    int _1787 = _1765 * _1773;
    int _1789 = _1787 + _1563;
    float _1791 = fma(_1775, -2.0, _1769);
    float _1793 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1661);
    float _1795 = floor(_1747);
    float _1797 = -_182;
    int _1799 = _1433 ? as_type<int>(_1797) : as_type<int>(_182);
    float _1801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _182);
    int _1803 = int(_1673) + int(_1759);
    float _1805 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1655);
    float _1807 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1791);
    bool _1809 = uint(_1789) >= uint(_1413);
    float _1811 = _1777 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1815 = ~_1803;
    int _1817 = _1815 + 1;
    float _1819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _186);
    bool _1821 = !_1809;
    int _1823 = _1821 ? 0 : (-1);
    float _1825 = _1811 * _1801;
    float _1827 = _1767 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1829 = _1817 * _1503;
    int _1831 = _1829 + _1593;
    int _1833 = ~_1773;
    int _1835 = _1833 + _1823;
    int _1837 = _1835 + 1;
    float _1839 = -_1795;
    float _1841 = _1747 + _1839;
    float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1845 = !_1141;
    float _1847 = _1845 ? _182 : as_type<float>(_1799);
    float _1849 = _1827 * _1819;
    bool _1851 = uint(_1831) >= uint(_1503);
    int _1853 = _1413 * _1837;
    int _1855 = _1853 + _1563;
    int _1857 = _1563 ^ _1413;
    float _1859 = fma(_1753, 0.5, 0.5);
    float _1861 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1863 = !_1851;
    int _1865 = _1863 ? 0 : (-1);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1869 = _1413 == 0;
    float _1871 = fma(_1861, _1559, _1781);
    uint _1873 = uint(int(uint(_1857) >> uint(31)));
    float _1875 = fma(_1771, 0.5, 0.5);
    bool _1877 = _959 == 0;
    float _1879 = -_1793;
    float _1881 = _1879 + 1.0;
    bool _1883 = !_1869;
    int _1885 = _1883 ? _1855 : (-1);
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1889 = ~_1865;
    int _1891 = _1803 + _1889;
    int _1893 = _1891 + 1;
    float _1895 = _1687 + (-0.5);
    int _1897 = ~int(_1873);
    int _1899 = _1897 + 1;
    float _1901 = _1847 + 0.5;
    bool _1903 = _1413 == 0;
    float _1905 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1907 = float(_1885);
    float _1909 = fma(_1861, _1901, _1871);
    int _1911 = _1893 ^ _1899;
    float _1913 = floor(_1859);
    int _1915 = _1681 ^ _1701;
    float _1917 = fma(_1905, _1907, _1785);
    int _1919 = ~_1899;
    int _1921 = _1919 + _1911;
    int _1923 = _1921 + 1;
    float _1925 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1927 = ~_1701;
    int _1929 = _1927 + _1915;
    int _1931 = _1929 + 1;
    float _1933 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1935 = !_1903;
    int _1937 = _1935 ? _1923 : (-1);
    float _1939 = floor(_1875);
    bool _1941 = !_1877;
    int _1943 = _1941 ? _1931 : (-1);
    float _1945 = -_1805;
    float _1947 = _1945 + 1.0;
    float _1949 = -_182;
    int _1951 = _1507 ? as_type<int>(_1949) : as_type<int>(_182);
    float _1953 = -_1431;
    float _1955 = fma(_1847, _1953, _1909);
    float _1957 = -_186;
    int _1959 = _1531 ? as_type<int>(_1957) : as_type<int>(_186);
    float _1961 = float(_1937);
    float _1963 = -_1913;
    float _1965 = _1859 + _1963;
    float _1967 = float(_1943);
    bool _1969 = !_1121;
    float _1971 = _1969 ? _182 : as_type<float>(_1951);
    float _1973 = -_1807;
    float _1975 = fma(_1933, _1961, _1973);
    bool _1977 = !_1117;
    float _1979 = _1977 ? _186 : as_type<float>(_1959);
    float _1981 = -_1395;
    float _1983 = fma(_1925, _1967, _1981);
    float _1985 = _186 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1987 = _1971 + 0.5;
    float _1989 = -_1939;
    float _1991 = _1875 + _1989;
    float _1993 = _1979 + (-0.5);
    float _1995 = fma(_1905, _1987, _1917);
    float _1997 = -_1925;
    float _1999 = fma(_1997, _1993, _1983);
    bool _2001 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(1.0);
    bool _2009 = _2005 || _2007;
    float _2011 = -_1881;
    float _2013 = fma(_1971, _2011, _1995);
    float _2015 = -_1933;
    float _2017 = fma(_2015, _1895, _1975);
    float _2019 = fma(_1979, _1545, _1999);
    float _2021 = fma(_1985, _1985, 1.0);
    float _2023 = fma(_1965, 2.0, -1.0);
    float _2025 = fma(_1991, 2.0, -1.0);
    float _2027 = fma(_1841, 2.0, -1.0);
    float _2029 = rsqrt(_2021);
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2033 = fma(_1687, _1947, _2017);
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _2037 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2041 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2045 = _2025 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2047 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2039);
    float _2049 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2041);
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2043);
    out.m_73.x = _1955;
    out.m_73.y = _2019;
    out.m_73.z = _2013;
    out.m_73.w = _2033;
    float _2053 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2047);
    float _2055 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2051);
    float _2057 = _1985 * _2029;
    float _2059 = _2053 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2061 = _2055 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2063 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2049);
    float _2065 = _2063 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2067 = as_type<float>(_1701);
    float _2069 = as_type<float>(_1701);
    float _2071 = _2027;
    float _2073 = _2023;
    float _2075 = _2035;
    float _2077 = _2025;
    float _2079 = _2021;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c12)._m0[10].x);
    float _2083 = _2051;
    float _2085 = _1813;
    float _2087 = _1825;
    float _2095;
    if (!_2009)
    {
        bool _2089 = _2065 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2091 = !_2089;
        _2093 = _2091;
        if (!_2093)
        {
            _2095 = 0.0;
            _2097 = true;
        }
    }
    if ((!_2097) || _2093)
    {
        bool _2121;
        if (!_2093)
        {
            bool _2099 = _2065 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2101 = isnan(_2065);
            bool _2103 = _2099 || _2101;
            bool _2105 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2107 = _2103 || _2105;
            bool _2109 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2111 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2113 = !_2107;
            bool _2115 = _2111 && _2113;
            if (_2115)
            {
                _2067 = 0.0;
            }
            float _2117 = _2067;
            bool _2119 = !_2107;
            _2121 = _2119 && _2109;
            _2069 = _2117;
            _2095 = _2117;
        }
        if ((!_2121) || _2093)
        {
            _2093 = false;
            float _2123 = _2069;
            bool _2125 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2127 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2131 = _2019;
            float _2133 = _2123;
            if (_2125)
            {
                float _2135 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2131 = _2135;
            }
            float _2137 = _2131;
            if (_2125)
            {
                float _2139 = abs(_2027);
                float _2141 = -_2139;
                float _2143 = _2141 + 1.0;
                _2071 = _2143;
            }
            float _2145 = _2071;
            if (_2127)
            {
                float _2147 = abs(_2023);
                float _2149 = -_2147;
                float _2151 = _2149 + 1.0;
                _2073 = _2151;
            }
            float _2153 = _2073;
            if (!_2125)
            {
                _2075 = 1.0;
            }
            float _2155 = _2075;
            float _2157 = _2155;
            if (_2129)
            {
                float _2159 = abs(_2025);
                float _2161 = -_2159;
                float _2163 = _2161 + 1.0;
                _2077 = _2163;
            }
            float _2165 = _2077;
            if (!_2127)
            {
                _2079 = 1.0;
            }
            float _2167 = _2079;
            float _2169 = _2167;
            if (!_2129)
            {
                _2133 = 1.0;
            }
            float _2171 = _2133;
            float _2173 = _2045;
            float _2175 = _2171;
            if (_2127)
            {
                float _2177 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2173 = _2177;
            }
            float _2179 = _2173;
            float _2181 = _1955;
            if (_2129)
            {
                float _2183 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2181 = _2183;
            }
            float _2185 = _2181;
            if (_2125)
            {
                float _2187 = _2145 * _2137;
                float _2189 = precise::clamp(_2187, 0.0, 1.0);
                _2157 = _2189;
            }
            float _2191 = _2157;
            if (_2127)
            {
                float _2193 = _2153 * _2179;
                float _2195 = precise::clamp(_2193, 0.0, 1.0);
                _2169 = _2195;
            }
            float _2197 = _2169;
            float _2199 = _2191 * _2197;
            if (_2129)
            {
                float _2201 = _2165 * _2185;
                float _2203 = precise::clamp(_2201, 0.0, 1.0);
                _2175 = _2203;
            }
            float _2205 = _2175;
            float _2207 = _2199 * _2205;
            _2095 = _2207;
        }
    }
    _2097 = false;
    float _2209 = _2095;
    float _2211 = _2065 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2213 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2215 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2217 = fma(_2059, 6.2500002968590706586837768554688e-05, 0.5);
    float _2219 = fma(_2061, 6.2500002968590706586837768554688e-05, 0.5);
    float _2221 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2213);
    float _2223 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2215);
    float _2225 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2221);
    float _2227 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2223);
    float _2229 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2231 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2233 = trunc(_2229);
    int _2235 = int(_2233);
    float _2237 = trunc(_2231);
    int _2239 = int(_2237);
    int _2241 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2243 = _2235 + _2241;
    int _2245 = _2243 + 1;
    bool _2247 = _2245 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2249 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2251 = _2239 + _2249;
    int _2253 = _2251 + 1;
    int _2255 = _2245 | _2253;
    bool _2257 = _2255 < 0;
    bool _2259 = _2257 || _2247;
    bool _2261 = _2253 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2263 = _2261 || _2259;
    int _2265 = _2253;
    int _2267 = _2245;
    if (!_2263)
    {
        int _2269 = _2253 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2271 = _2269 + _2245;
        _2081 = _2271;
    }
    int _2273 = _2081;
    float _2275 = as_type<float>(_2255);
    if (!_2263)
    {
        float _2277 = floor(_2231);
        _2275 = _2277;
    }
    float _2279 = _2275;
    if (!_2263)
    {
        int _2281 = _2273 << 2;
        _2265 = _2281;
    }
    int _2283 = _2265;
    int _2285 = _2283;
    if (!_2263)
    {
        uint _2287 = uint(int(uint(_2273) >> uint(2)));
        _2267 = int(_2287);
    }
    int _2289 = _2267;
    if (!_2263)
    {
        int _2291 = 12 & _2283;
        _2285 = _2291;
    }
    int _2293 = _2285;
    float _2295 = as_type<float>(_2293);
    if (!_2263)
    {
        int _2297 = _2289 << 4;
        int _2299 = _2297 + _2293;
        _2295 = as_type<float>(_2299);
    }
    float _2301 = _2295;
    float _2303 = as_type<float>(_2289);
    if (!_2263)
    {
        float _2305 = floor(_2229);
        _2303 = _2305;
    }
    float _2307 = _2303;
    if (!_2263)
    {
        float _2309 = -_2279;
        float _2311 = _2231 + _2309;
        _2083 = _2311;
    }
    float _2313 = _2083;
    float _2315 = _2301;
    if (!_2263)
    {
        int _2317 = as_type<int>(_2301) + 400;
        uint _2319 = uint(int(uint(_2317) >> uint(2)));
        uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
        int _2323 = int(_2319) & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        _2315 = _2325;
    }
    float _2327 = _2315;
    float2 _7201 = float2(_2217, _2219);
    float _2329 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_7201, float2(0.0), isnan(_7201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_7201, float2(0.0), isnan(_7201)), level(0.0)).x;
    if (!_2263)
    {
        float _2331 = -_2307;
        float _2333 = _2229 + _2331;
        _2085 = _2333;
    }
    float _2335 = _2085;
    float _2337 = as_type<float>(_1799);
    if (!_2263)
    {
        float _2339 = rint(_2327);
        float _2341 = precise::max(_2339, 0.0);
        uint _2343 = uint(_2341);
        uint _2345 = clamp(_2343, 0u, 65535u);
        _2337 = as_type<float>(_2345);
    }
    float _2347 = _2337;
    float _2349 = _2313;
    if (!_2263)
    {
        float3 _7248 = float3(_2335, _2313, float(as_type<int>(_2347)));
        float3 _7252 = select(_7248, float3(0.0), isnan(_7248));
        float _2351 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7252.xy, uint(rint(_7252.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7252.xy, uint(rint(_7252.z)), level(0.0)).x;
        _2349 = _2351;
    }
    float _2353 = _2349;
    float _2355 = -_2065;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2359 = -_2059;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2363 = -_2061;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2375 = rsqrt(_2371);
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2381 = -_2373;
    float _2383 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2381);
    float _2385 = -_2377;
    float _2387 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2385);
    float _2389 = -_2379;
    float _2391 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2389);
    float _2393 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2397 = -_2393;
    float _2399 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2397);
    float _2401 = _2361 * _2375;
    float _2403 = _2365 * _2375;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2407 = _2357 * _2375;
    float _2409 = _2401 * _2401;
    float _2411 = fma(_2403, _2403, _2409);
    float _2413 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2415 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2417 = rsqrt(_2411);
    float _2419 = -_2413;
    float _2421 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2419);
    float _2423 = -_2415;
    float _2425 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2423);
    float _2427 = -_2405;
    float _2429 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2427);
    float _2431 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2433 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2435 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2429);
    float _2437 = -_2431;
    float _2439 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2437);
    float _2441 = -_2433;
    float _2443 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2441);
    float _2445 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2439);
    float _2447 = _2403 * _2417;
    float _2449 = _2401 * _2417;
    float _2451 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2443);
    float _2453 = -_2447;
    float _2455 = _2403 * _2453;
    float _2457 = -_2447;
    float _2459 = _2407 * _2457;
    float _2461 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2463 = -_2455;
    float _2465 = fma(_2401, _2449, _2463);
    float _2467 = _2407 * _2449;
    float _2469 = -_2461;
    float _2471 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2469);
    float _2473 = -_2395;
    float _2475 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2473);
    float _2477 = _2465 * _2465;
    float _2479 = fma(_2445, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2471);
    float _2481 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2475);
    float _2483 = fma(_2467, _2467, _2477);
    float _2485 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2487 = -_2481;
    float _2489 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2479);
    float _2491 = fma(_2459, _2459, _2483);
    float _2493 = -_2485;
    float _2495 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2493);
    float _2497 = _2399 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2499 = 1.0 / _2489;
    float _2501 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2495);
    float _2503 = -_2497;
    float _2505 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2503);
    float _2507 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2505);
    float _2509 = rsqrt(_2491);
    float _2511 = fma(_2501, _2499, -1.0);
    float _2513 = _2465 * _2509;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2519 = -_2515;
    float _2521 = _2519 + 1.0;
    float _2523 = -_2517;
    float _2525 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2523);
    float _2527 = _2521 * _2499;
    float _2529 = fma(_2521, _2511, 1.0);
    float _2531 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2525);
    float _2533 = _2507 * _2527;
    float _2535 = _2529 * _2529;
    float _2537 = _2531 * _2527;
    float _2539 = fma(_2533, _2533, _2535);
    float _2541 = fma(_2537, _2537, _2539);
    float _2543 = rsqrt(_2541);
    float _2545 = _2537 * _2543;
    float _2547 = _2529 * _2543;
    float _2549 = _2533 * _2543;
    float _2551 = -_2545;
    float _2553 = _2401 * _2551;
    float _2555 = _2403 * _2547;
    float _2557 = -_2549;
    float _2559 = _2407 * _2557;
    float _2561 = -_2549;
    float _2563 = -_2553;
    float _2565 = fma(_2403, _2561, _2563);
    float _2567 = -_2545;
    float _2569 = -_2555;
    float _2571 = fma(_2407, _2567, _2569);
    float _2573 = -_2559;
    float _2575 = fma(_2401, _2547, _2573);
    float _2577 = _2565 * _2565;
    float _2579 = fma(_2571, _2571, _2577);
    float _2581 = fma(_2575, _2575, _2579);
    float _2583 = rsqrt(_2581);
    float _2585 = _2571 * _2583;
    float _2587 = _2575 * _2583;
    float _2589 = _2565 * _2583;
    float _2591 = _2403 * _2585;
    float _2593 = _2407 * _2587;
    float _2595 = -_2591;
    float _2597 = fma(_2401, _2587, _2595);
    float _2599 = -_2593;
    float _2601 = fma(_2403, _2589, _2599);
    float _2603 = _2401 * _2589;
    float _2605 = _2597 * _2597;
    float _2607 = -_2603;
    float _2609 = fma(_2407, _2585, _2607);
    float _2611 = fma(_2601, _2601, _2605);
    float _2613 = fma(_2609, _2609, _2611);
    float _2615 = rsqrt(_2613);
    float _2617 = _2609 * _2615;
    float _2619 = _2601 * _2615;
    float _2621 = _2597 * _2615;
    float _2623 = _2401 * _2617;
    float _2625 = _2407 * _2619;
    float _2627 = _2403 * _2621;
    float _2629 = _1849 * _2617;
    float _2631 = -_2623;
    float _2633 = fma(_2403, _2619, _2631);
    float _2635 = -_2625;
    float _2637 = fma(_2401, _2621, _2635);
    float _2639 = -_2627;
    float _2641 = fma(_2407, _2617, _2639);
    float _2643 = _2633 * _2633;
    float _2645 = fma(_2641, _2641, _2643);
    float _2647 = fma(_2637, _2637, _2645);
    float _2649 = rsqrt(_2647);
    float _2651 = _2637 * _2649;
    float _2653 = _1849 * _2619;
    float _2655 = _2641 * _2649;
    float _2657 = _2633 * _2649;
    float _2659 = fma(_1825, _2651, _2629);
    float _2661 = _1849 * _2621;
    float _2663 = fma(_1825, _2655, _2653);
    float _2665 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2667 = _2061 + _2659;
    float _2669 = _2059 + _2663;
    float _2671 = fma(_1825, _2657, _2661);
    float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2675 = _2667 + _2673;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2689 = _2669 + _2687;
    float _2691 = _2065 + _2671;
    float _2693 = _2675 * _2675;
    float _2695 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2665);
    float _2697 = fma(_2689, _2689, _2693);
    float _2699 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2695);
    float _2701 = sqrt(_2697);
    bool _2703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.5);
    bool _2711 = _2707 || _2709;
    float _2713 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2715 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2713);
    float _2717 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2715);
    bool _2719 = _2701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2721 = _2671;
    float _2723 = _2715;
    float _2725 = _2689;
    if (!_2719)
    {
        _2721 = _2669;
    }
    float _2727 = _2721;
    float _2729 = _2727;
    if (!_2719)
    {
        _2723 = _2667;
    }
    float _2731 = _2723;
    float _2733 = _2731;
    if (!_2719)
    {
        _2087 = _2691;
    }
    float _2735 = _2087;
    bool _2737 = !_2719;
    float _2739 = _2735;
    float _2741 = _2329;
    if (!_2737)
    {
        float _2743 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2747 = _2701 + _2745;
        float _2749 = rsqrt(_2697);
        float _2751 = _2747 * _2743;
        float _2753 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2755 = _2751 * 0.15915493667125701904296875;
        float _2757 = _2755 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2755 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2759 + (-1.0);
        float _2767 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = fma(_2763, _2753, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2771 = fma(_2691, _2759, _2767);
        float _2773 = _2749 * _2769;
        float _2775 = fma(_2689, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2777 = fma(_2675, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2729 = _2775;
        _2733 = _2777;
        _2739 = _2771;
    }
    float _2779 = _2729;
    float _2781 = _2733;
    float _2783 = _2739;
    float _2785 = _2717 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2787 = _2699 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2789 = _2783;
    float _2791 = _2779;
    float _2793 = _2781;
    if (!_2711)
    {
        float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2797 = _2065 + _2795;
        float _2799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2801 = _2059 + _2799;
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2805 = -_2059;
        float _2807 = _2805 + _2779;
        float _2809 = _2797 * _2797;
        float _2811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2813 = _2061 + _2811;
        float _2815 = -_2061;
        float _2817 = _2815 + _2781;
        float _2819 = fma(_2801, _2801, _2809);
        float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2823 = fma(_2813, _2813, _2819);
        float _2825 = sqrt(_2823);
        float _2827 = _2803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2829 = precise::min(_2825, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2831 = _2829 * _2821;
        float _2833 = -_2065;
        float _2835 = _2833 + _2783;
        float _2837 = _2827 * _2831;
        float _2839 = fma(_2835, _2837, _2065);
        float _2841 = fma(_2807, _2837, _2059);
        float _2843 = fma(_2817, _2837, _2061);
        _2789 = _2839;
        _2791 = _2841;
        _2793 = _2843;
    }
    float _2845 = _2789;
    float _2847 = _2791;
    float _2849 = _2793;
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2853 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2855 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2857 = _2785 + _2787;
    float _2859 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2851);
    float _2861 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2853);
    float _2863 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2865 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2855);
    float _2867 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2859);
    float _2869 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2861);
    float _2871 = 1.0 / _2787;
    float _2873 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2863);
    float _2875 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2877 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2865);
    float _2879 = _2869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2881 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2873);
    float _2883 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2885 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2889 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2891 = _2877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2893 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2883);
    float _2895 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2885);
    float _2897 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2889);
    float _2899 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2887);
    float _2901 = _2881 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2903 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2893);
    float _2905 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2895);
    float _2907 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2897);
    float _2909 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2899);
    float _2911 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2903);
    float _2913 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2905);
    float _2915 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2907);
    float _2917 = _2857 * _2871;
    float _2919 = _2917 * 0.5;
    float _2921 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2909);
    float _2923 = _2879;
    float _2925 = _2897;
    float _2927 = _2919;
    float _2929 = _2913;
    float _2931 = _2911;
    int _2933 = as_type<int>(_2915);
    float _2935 = _2921;
    if (_2685)
    {
        _2923 = 1.0;
    }
    float _2937 = _2923;
    float _2939 = _2937;
    if (!_2685)
    {
        float _2941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2945 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2943);
        float _2947 = _2941 * 0.15915493667125701904296875;
        float _2949 = _2947 * 6.283185482025146484375;
        float _2951 = cos(_2949);
        float _2953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2955 = _2953 * 0.15915493667125701904296875;
        float _2957 = _2947 * 6.283185482025146484375;
        float _2959 = sin(_2957);
        float _2961 = 1.0 / _2951;
        float _2963 = _2955 * 6.283185482025146484375;
        float _2965 = cos(_2963);
        float _2967 = _2959 * _2961;
        float _2969 = 1.0 / _2945;
        float _2971 = _2965 * _2967;
        float _2973 = _2955 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2977;
        float _2981 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2983 = _2969 * _2981;
        float _2985 = 1.0 / _2971;
        float _2987 = 1.0 / _2979;
        float _2989 = _2975 * _2985;
        float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2993 = fma(_2989, _2983, _2991);
        float _2995 = _2993 * _2987;
        float _2997 = precise::clamp(_2995, 0.0, 1.0);
        _2725 = _2961;
        _2925 = _2983;
        _2927 = _2979;
        _2939 = _2997;
    }
    float _2999 = _2725;
    float _3001 = _2925;
    float _3003 = _2927;
    float _3005 = _2939;
    out.gl_Position.x = _2911;
    out.gl_Position.y = _2913;
    out.gl_Position.z = _2915;
    out.gl_Position.w = _2921;
    float _3007 = abs(_2329);
    bool _3009 = _3007 != 0.0;
    bool _3011 = isnan(_3007);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(0.0);
    bool _3017 = _3013 || _3015;
    float _3019 = _3003;
    float _3021 = _3001;
    float _3023 = _2999;
    if (_2685)
    {
        _3019 = 1.0;
    }
    float _3025 = _3019;
    float _3027 = _3025;
    if (_3017)
    {
        _2741 = _2921;
    }
    float _3029 = _2741;
    float _3031 = _3029;
    if (!_3017)
    {
        _3031 = 0.0;
    }
    float _3033 = _3031;
    float _3035 = _3033;
    if (!_2685)
    {
        float _3037 = as_type<float>(in.m_77.w);
        int _3039 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _3041 = _3039 == 4;
        bool _3043 = _3039 == 8;
        bool _3045 = _3039 == 12;
        int _3047 = as_type<int>(_3037) << 16;
        int _3049 = as_type<int>(_3037) << 8;
        int _3051 = as_type<int>(_3037) << 24;
        int _3053 = _3047 >> 24;
        int _3055 = _3049 >> 24;
        int _3057 = as_type<int>(_3037) >> 24;
        int _3059 = _3051 >> 24;
        float _3061 = float(_3053);
        float _3063 = float(_3055);
        float _3065 = float(_3057);
        float _3067 = _3061 * 0.0078740157186985015869140625;
        float _3069 = float(_3059);
        float _3071 = _3063 * 0.0078740157186985015869140625;
        float _3073 = _3065 * 0.0078740157186985015869140625;
        float _3075 = precise::min(_3067, 1.0);
        float _3077 = _3069 * 0.0078740157186985015869140625;
        float _3079 = precise::min(_3071, 1.0);
        float _3081 = precise::min(_3073, 1.0);
        float _3083 = precise::min(_3077, 1.0);
        float _3085 = precise::max(_3075, -1.0);
        float _3087 = precise::max(_3079, -1.0);
        float _3089 = precise::max(_3081, -1.0);
        float _3091 = precise::max(_3083, -1.0);
        float _3093 = _3091;
        _3021 = _3087;
        _3023 = _3089;
        if (_3041)
        {
            _3093 = _3085;
        }
        float _3095 = _3093;
        float _3097 = _3095;
        if (_3043)
        {
            _3097 = _3087;
        }
        float _3099 = _3097;
        float _3101 = _3099;
        if (_3045)
        {
            _3101 = _3089;
        }
        float _3103 = _3101;
        float _3105 = abs(_3103);
        float _3107 = (-0.0) + _3105;
        _3027 = _3107;
    }
    float _3109 = _3021;
    float _3111 = _3023;
    float _3113 = _3027;
    float _3115 = _3111;
    float _3117 = _3109;
    if (!_3017)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_2263)
    {
        int _3119 = _2273 << 4;
        int _3121 = _3119 + 2048;
        uint _3123 = uint(int(uint(_3121) >> uint(2)));
        uint _3125 = uint(int(uint(int(_3123)) >> uint(2)));
        int _3127 = int(_3123) & 3;
        float _3129 = (*spvDescriptorSet0.vp_c15)._m0[int(_3125)][_3127];
        int _3131 = int(_3123) + 1;
        uint _3133 = uint(int(uint(_3131) >> uint(2)));
        int _3135 = _3131 & 3;
        float _3137 = (*spvDescriptorSet0.vp_c15)._m0[int(_3133)][_3135];
        int _3139 = _3121 + 8;
        uint _3141 = uint(int(uint(_3139) >> uint(2)));
        uint _3143 = uint(int(uint(int(_3141)) >> uint(2)));
        int _3145 = int(_3141) & 3;
        float _3147 = (*spvDescriptorSet0.vp_c15)._m0[int(_3143)][_3145];
        int _3149 = int(_3141) + 1;
        uint _3151 = uint(int(uint(_3149) >> uint(2)));
        int _3153 = _3149 & 3;
        float _3155 = (*spvDescriptorSet0.vp_c15)._m0[int(_3151)][_3153];
        float _3157 = _2211 * _3137;
        float _3159 = fma(_2059, _3129, _3157);
        float _3161 = fma(_2061, _3147, _3159);
        float _3163 = _3161 + _3155;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        float _3167 = -_3165;
        float _3169 = _3167 + _2353;
        float _3171 = fma(_3169, 500.0, 1.5);
        float _3173 = exp2(_3171);
        float _3175 = 0.0 + _3173;
        float _3177 = precise::clamp(_3175, 0.0, 1.0);
        bool _3179 = _3177 >= 1.0;
        bool _3181 = isnan(_3177);
        bool _3183 = _3179 || _3181;
        bool _3185 = isnan(1.0);
        bool _3187 = _3183 || _3185;
        _3115 = _3165;
        _3117 = _3147;
        if (!_3187)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_3187)
        {
            _3035 = 0.0;
        }
    }
    float _3189 = _3115;
    float _3191 = _3117;
    float _3193 = _3035;
    float _3195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3197 = _2845 + _3195;
    float _3199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3201 = _2847 + _3199;
    float _3203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3205 = _2849 + _3203;
    float _3207 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3209 = _3197 * _3197;
    float _3211 = fma(_3201, _3201, _3209);
    float _3213 = fma(_3205, _3205, _3211);
    float _3215 = rsqrt(_3213);
    float _3217 = sqrt(_3213);
    float _3219 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3221 = _3201 * _3219;
    float _3223 = _3205 * _3219;
    float _3225 = _3221 * _3221;
    float _3227 = _3223 * _3223;
    float _3229 = _3225 + _3227;
    float _3231 = sqrt(_3229);
    bool _3233 = _3231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3237 = _3231 + _3235;
    float _3239 = _3215;
    float _3241 = _3229;
    float _3243 = _3237;
    float _3245 = _3189;
    float _3247 = _3197;
    float _3249 = _3191;
    if (_3233)
    {
        float _3251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3239 = _3251;
    }
    float _3253 = _3239;
    if (_3233)
    {
        float _3255 = rsqrt(_3229);
        _3241 = _3255;
    }
    float _3257 = _3241;
    float _3259 = _3257;
    if (_3233)
    {
        float _3261 = _3237 * _3253;
        _3243 = _3261;
    }
    float _3263 = _3243;
    if (_3233)
    {
        float _3265 = _3263 * 0.15915493667125701904296875;
        _3245 = _3265;
    }
    float _3267 = _3245;
    float _3269 = _3205;
    if (_3233)
    {
        float _3271 = _3267 * 6.283185482025146484375;
        float _3273 = sin(_3271);
        _3269 = _3273;
    }
    float _3275 = _3269;
    float _3277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3279 = precise::max(0.0, _3277);
    float _3281 = _3253;
    float _3283 = _3279;
    if (_3233)
    {
        float _3285 = _3267 * 6.283185482025146484375;
        float _3287 = cos(_3285);
        _3281 = _3287;
    }
    float _3289 = _3281;
    float _3291 = -_3219;
    float _3293 = -_3279;
    float _3295 = fma(_3197, _3291, _3293);
    if (_3233)
    {
        float _3297 = _3295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3247 = _3297;
    }
    float _3299 = _3247;
    float _3301 = _3275;
    float _3303 = _3299;
    if (_3233)
    {
        float _3305 = fma(_3275, _3299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3249 = _3305;
    }
    float _3307 = _3249;
    float _3309 = _3307;
    if (!_3233)
    {
        _3301 = _3221;
    }
    float _3311 = _3301;
    float _3313 = _3311;
    if (!_3233)
    {
        _3303 = _3295;
    }
    float _3315 = _3303;
    float _3317 = _3315;
    float _3319 = _3289;
    if (_3233)
    {
        float _3321 = _3289 + (-1.0);
        _3283 = _3321;
    }
    float _3323 = _3283;
    float _3325 = _3323;
    if (_3233)
    {
        float _3327 = _3257 * _3307;
        _3309 = _3327;
    }
    float _3329 = _3309;
    if (!_3233)
    {
        _3259 = _3225;
    }
    float _3331 = _3259;
    float _3333 = _3331;
    if (_3233)
    {
        float _3335 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3325 = _3335;
    }
    float _3337 = _3325;
    float _3339 = _3337;
    if (_3233)
    {
        float _3341 = _3221 * _3329;
        _3313 = _3341;
    }
    float _3343 = _3313;
    if (_3233)
    {
        float _3345 = fma(_3295, _3289, _3337);
        _3317 = _3345;
    }
    float _3347 = _3317;
    if (!_3233)
    {
        _3339 = _3223;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3233)
    {
        float _3353 = _3223 * _3329;
        _3351 = _3353;
    }
    float _3355 = _3351;
    if (_3233)
    {
        float _3357 = _3343 * _3343;
        _3333 = _3357;
    }
    float _3359 = _3333;
    if (!_3233)
    {
        _3319 = _3227;
    }
    float _3361 = _3319;
    float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3365 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3363);
    float _3367 = precise::clamp(_3365, 0.0, 1.0);
    float _3369 = _3361;
    if (_3233)
    {
        float _3371 = _3355 * _3355;
        _3369 = _3371;
    }
    float _3373 = _3369;
    float _3375 = fma(_3347, _3347, _3359);
    bool _3377 = _3113 != 0.0;
    bool _3379 = isnan(_3113);
    bool _3381 = _3377 || _3379;
    bool _3383 = isnan(0.0);
    bool _3385 = _3381 || _3383;
    float _3387 = -_3367;
    float _3389 = _3387 + 1.0;
    float _3391 = 1.0 / _3193;
    float _3393 = _3375 + _3373;
    float _3395 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3397 = rsqrt(_3393);
    float _3399 = -_3207;
    float _3401 = fma(_3399, _3395, 1.0);
    if (!_3385)
    {
        _2929 = 0.0;
        _2931 = 0.0;
    }
    float _3403 = _2929;
    float _3405 = _2931;
    float _3407 = abs(_3389);
    float _3409 = log2(_3407);
    float _3411 = _3391 * _3403;
    float _3413 = fma(_3411, -0.5, 0.5);
    float _3415 = _3397 * _3343;
    float _3417 = _3397 * _3347;
    float _3419 = _3397 * _3355;
    float _3421 = log2(_3401);
    float _3423 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3425 = _3417 + 1.0;
    float _3427 = -_3423;
    float _3429 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3427);
    float _3431 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3433 = -_3419;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3429);
    float _3437 = exp2(_3431);
    float _3439 = fma(_3435, -0.5, 0.5);
    float _3441 = fma(_3435, 0.5, 0.5);
    float _3443 = _3391 * _3405;
    float _3445 = _3421 * 0.693147182464599609375;
    float _3447 = fma(_3441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3449 = fma(_3443, 0.5, 0.5);
    float _3451 = sqrt(_3439);
    float _3453 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3455 = fma(_3441, _3447, -0.212114393711090087890625);
    float _3457 = fma(_3441, _3455, 1.570728778839111328125);
    float _3459 = -_3417;
    float _3461 = fma(_3437, _3425, _3459);
    float _3463 = fma(_3461, 0.5, 0.5);
    float _3465 = _3451 * 0.636619746685028076171875;
    float _3467 = -_3457;
    float _3469 = fma(_3465, _3467, 1.0);
    float3 _9012 = float3(_3449, _3413, _3453);
    float _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9012, float3(0.0), isnan(_9012)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9012, float3(0.0), isnan(_9012)), level(0.0)).x;
    float3 _9021 = float3(_3449, _3413, _3453);
    float4 _3474 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9021, float3(0.0), isnan(_9021)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9021, float3(0.0), isnan(_9021)), level(0.0)).xyzw;
    float _3476 = _3474.x;
    float _3478 = _3474.y;
    float _3480 = _3474.z;
    float _3482 = _3474.w;
    float2 _9037 = float2(_3469, _3463);
    float3 _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9037, float2(0.0), isnan(_9037)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9037, float2(0.0), isnan(_9037)), level(0.0)).xyz;
    float _3488 = _3486.x;
    float _3490 = _3486.y;
    float _3492 = _3486.z;
    float _3494 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3496 = -_2401;
    float _3498 = _2057 * _3496;
    float _3500 = -_2407;
    float _3502 = _2057 * _3500;
    float _3504 = -_2403;
    float _3506 = _2057 * _3504;
    out.m_79.x = _2655;
    out.m_79.y = _2657;
    out.m_79.z = _2651;
    float _3508 = fma(_2029, _2619, _3498);
    float _3510 = exp2(_3494);
    float _3512 = fma(_2029, _2621, _3502);
    float _3514 = fma(_2029, _2617, _3506);
    float _3516 = _1985 * _2617;
    float _3518 = _1985 * _2619;
    float _3520 = _1985 * _2621;
    out.m_81.x = _3508;
    out.m_81.y = _3512;
    out.m_81.z = _3514;
    float _3522 = fma(_2037, _2655, _3518);
    float _3524 = _2209 * _3005;
    float _3526 = fma(_2037, _2651, _3516);
    float _3528 = fma(_2037, _2657, _3520);
    float _3530 = _2915 + _2921;
    float _3532 = _2401 + _3522;
    float _3534 = _2403 + _3526;
    float _3536 = _3524 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3538 = -_3510;
    float _3540 = _3538 + 1.0;
    float _3542 = _3530 * 0.5;
    float _3544 = _2407 + _3528;
    out.m_83.x = _2847;
    out.m_83.y = _2845;
    out.m_83.z = _2849;
    float _3546 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3548 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3550 = isnan(_3217);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3556 = _3552 || _3554;
    out.m_85.z = _3542;
    out.m_85.w = _2921;
    float _3558 = _3453;
    float _3560 = _3540;
    float _3562 = 0.0;
    float _3564 = 0.0;
    if (!_3385)
    {
        _3558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3566 = _3558;
    float _3568 = _3536 * _3113;
    out.m_87.x = _3532;
    out.m_87.y = _3544;
    out.m_87.z = _3534;
    float _3570 = _3568;
    if (!_3385)
    {
        _3570 = 0.0;
    }
    float _3572 = _3570;
    if (!_3385)
    {
        float _3574 = _3566 * 5.0;
        _2933 = as_type<int>(_3574);
    }
    int _3576 = _2933;
    float _3578 = as_type<float>(_3576);
    if (!_3385)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9211 = as_type<float>(_3576);
        out.gl_Position.z = _9211;
    }
    if (!_3556)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3580 = _2935;
    float _3582 = _3580;
    float _3584 = _3580;
    if (!_3556)
    {
        _3560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3586 = _3560;
    float _3588 = _3586;
    float _3590 = _3586;
    if (!_3556)
    {
        _3578 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3592 = _3578;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3556)
    {
        _3562 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3598 = _3562;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3556)
    {
        _3564 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3604 = _3564;
    float _3606 = _3546 * _3471;
    float _3608 = -_3546;
    float _3610 = _3608 + 1.0;
    float _3612 = _3482 * _3606;
    float _3614 = _3492 * _3606;
    float _3616 = _3482 * _3610;
    float _3618 = _3610;
    float _3620 = _3604;
    float _3622 = _3604;
    if (!_3556)
    {
        _3618 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3624 = _3618;
    float _3626 = fma(_3488, _3612, _3476);
    float _3628 = fma(_3490, _3612, _3478);
    float _3630 = fma(_3482, _3614, _3480);
    out.m_89.x = _3626;
    out.m_89.y = _3628;
    out.m_89.z = _3630;
    out.m_89.w = _3616;
    bool _3632 = !_3556;
    float _3634 = _3624;
    float _3636 = _3624;
    if (!_3632)
    {
        bool _3638 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3640 = isnan(_3217);
        bool _3642 = _3638 || _3640;
        bool _3644 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3646 = _3642 || _3644;
        if (!_3646)
        {
            float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3650 = _3217 + _3648;
            float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3654 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3652;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3664 = 1.0 / _3654;
            float _3666 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3668 = _3666 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3670 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3672 = _3670 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3676 = _3674 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3678 = _3650 * _3664;
            float _3680 = precise::clamp(_3678, 0.0, 1.0);
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3684 = _3682 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3686 = fma(_3680, _3658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3688 = fma(_3680, _3662, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3690 = fma(_3680, _3684, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3692 = fma(_3680, _3668, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3694 = fma(_3680, _3672, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3696 = fma(_3680, _3676, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3622 = _3686;
            _3584 = _3694;
            _3602 = _3688;
            _3636 = _3692;
            _3590 = _3690;
            _3596 = _3696;
            _3698 = true;
        }
        else
        {
            bool _3700 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3702 = isnan(_3217);
            bool _3704 = _3700 || _3702;
            bool _3706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3708 = _3704 || _3706;
            if (!_3708)
            {
                _3634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3710 = _3634;
            _3636 = _3710;
            if (!_3708)
            {
                _3582 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3712 = _3582;
            _3584 = _3712;
            if (!_3708)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3714 = _3594;
            _3596 = _3714;
            if (!_3708)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3716 = _3600;
            _3602 = _3716;
            if (!_3708)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3718 = _3620;
            _3622 = _3718;
            if (!_3708)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3720 = _3588;
            bool _3722 = !_3708;
            _3590 = _3720;
            if (!_3722)
            {
                bool _3724 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3726 = isnan(_3217);
                bool _3728 = _3724 || _3726;
                bool _3730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3732 = _3728 || _3730;
                if (!_3732)
                {
                    float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3736 = _3217 + _3734;
                    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3738;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3750 = 1.0 / _3740;
                    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3758 = _3756 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3762 = _3760 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3764 = _3736 * _3750;
                    float _3766 = precise::clamp(_3764, 0.0, 1.0);
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3772 = fma(_3766, _3744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3774 = fma(_3766, _3748, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3776 = fma(_3766, _3770, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3778 = fma(_3766, _3754, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3780 = fma(_3766, _3758, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3782 = fma(_3766, _3762, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3622 = _3772;
                    _3584 = _3780;
                    _3602 = _3774;
                    _3636 = _3778;
                    _3590 = _3776;
                    _3596 = _3782;
                    _3698 = true;
                }
                else
                {
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3584 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3698 = false;
    float _3784 = _3622;
    float _3786 = _3584;
    float _3788 = _3602;
    float _3790 = _3636;
    float _3792 = _3590;
    float _3794 = _3596;
    float _3796 = fma(_3544, -0.5, 0.5);
    float _3798 = precise::clamp(_3796, 0.0, 1.0);
    float _3800 = -_3784;
    float _3802 = _3786 + _3800;
    float _3804 = _3572 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3806 = -_3788;
    float _3808 = _3790 + _3806;
    float _3810 = fma(_3798, _3802, _3784);
    out.m_91.w = _3804;
    float _3812 = fma(_3798, _3808, _3788);
    float _3814 = -_3792;
    float _3816 = _3794 + _3814;
    float _3818 = _3810 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    bool _3820 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3822 = fma(_3798, _3816, _3792);
    float _3824 = fma(_3812, 0.298911988735198974609375, _3818);
    bool _3826 = _3005 > 0.0;
    bool _3828 = isnan(_3005);
    bool _3830 = _3826 || _3828;
    bool _3832 = isnan(0.0);
    bool _3834 = _3830 || _3832;
    float _3836 = fma(_3822, 0.114477999508380889892578125, _3824);
    out.m_93.x = 0.0;
    float _3838 = -_3836;
    float _3840 = _3812 + _3838;
    float _3842 = -_3836;
    float _3844 = _3810 + _3842;
    float _3846 = -_3836;
    float _3848 = _3822 + _3846;
    float _3850 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    float _3852 = fma(_3844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    float _3854 = fma(_3848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    bool _3856 = !_3820;
    if (!_3856)
    {
        float _3858 = -_2845;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3862 = -_2847;
        float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3866 = -_2849;
        float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3870 = _3860 * _3860;
        float _3872 = fma(_3864, _3864, _3870);
        float _3874 = fma(_3868, _3868, _3872);
        float _3876 = sqrt(_3874);
        float _3878 = rsqrt(_3874);
        float _3880 = -_3876;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3884 = _3882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3886 = precise::clamp(_3884, 0.0, 1.0);
        float _3888 = _3864 * _3878;
        float _3890 = _3860 * _3878;
        float _3892 = abs(_3886);
        float _3894 = log2(_3892);
        float _3896 = _3868 * _3878;
        float _3898 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3900 = _3544 * _3890;
        float _3902 = -_3890;
        float _3904 = -_3898;
        float _3906 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3904);
        float _3908 = fma(_3532, _3888, _3900);
        float _3910 = -_3896;
        float _3912 = fma(_3910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3906);
        float _3914 = fma(_3534, _3896, _3908);
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3920 = _3912 + _3918;
        float _3922 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3924 = _3920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3926 = precise::clamp(_3924, 0.0, 1.0);
        float _3928 = exp2(_3922);
        float _3930 = _3928 * _3926;
        float _3932 = _3916 * _3930;
        float _3934 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3936 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3934;
        out.m_93.y = _3936;
        out.m_93.z = _3938;
    }
    out.m_95.x = _3850;
    out.m_95.y = _3852;
    out.m_95.z = _3854;
    if (_3834)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _3940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3698 = false;
    bool _2097 = false;
    bool _2093 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_53.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_56.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3997 = as_type<float>(_130);
        out.gl_Position.z = _3997;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_58.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_56.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4065 = as_type<float>(_166);
        out.gl_Position.z = _4065;
    }
    if (_160)
    {
        return out;
    }
    float _168 = as_type<float>(int(gl_VertexIndex));
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _172 = as_type<int>(_168) & 1;
    bool _174 = _172 != 0;
    int _176 = as_type<int>(_168) & 2;
    bool _178 = _176 != 0;
    bool _180 = !_174;
    float _182 = _180 ? (-0.5) : 0.5;
    bool _184 = !_178;
    float _186 = _184 ? (-0.5) : 0.5;
    bool _188 = !_170;
    float _206;
    if (!_188)
    {
        float _190 = in.m_63.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        float _210 = float(_114);
        float _212 = 1.0 / _210;
        float _214 = _148 * _212;
        _206 = _214;
    }
    _208 = false;
    float _216 = _206;
    float _218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _220 = int(_218);
    float _222 = float(_114);
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _226 = _224 != 0;
    float _228 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _230 = int(_228);
    float _232 = float(_220);
    float _234 = 1.0 / _222;
    float _236 = float(uint(_230));
    float _238 = 1.0 / _232;
    int _240 = ~_230;
    int _242 = _240 + 1;
    int _244 = ~_230;
    int _246 = _244 + 1;
    bool _248 = _230 == 0;
    float _250 = 1.0 / _236;
    float _252 = _148 * _238;
    float _254 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _256 = int(_254);
    int _258 = as_type<int>(_250) + (-2);
    float _260 = trunc(_252);
    int _262 = int(_260);
    float _264 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _266 = int(_264);
    float _268 = float(uint(_262));
    float _270 = float(_262);
    float _272 = as_type<float>(_258) * _268;
    float _274 = trunc(_272);
    float _276 = precise::max(_274, 0.0);
    uint _279 = uint(_276);
    float _281 = float(_230);
    bool _283 = _270 >= _281;
    bool _285 = isnan(_270);
    bool _287 = _283 || _285;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    int _295 = _242 * int(_279);
    int _297 = _295 + _262;
    float _299 = in.m_63.x;
    float _301 = in.m_63.y;
    float _303 = in.m_63.z;
    float _305 = in.m_63.w;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = float(uint(_297));
    float _313 = as_type<float>(_258) * _311;
    float _315 = _311;
    if (_226)
    {
        _315 = 1.0;
    }
    float _317 = _315;
    float _319 = _317;
    if (!_226)
    {
        _319 = 7.345489978790283203125;
    }
    float _321 = _319;
    float _323 = trunc(_313);
    float _325 = precise::max(_323, 0.0);
    uint _327 = uint(_325);
    float _329 = _321 * _299;
    int _331 = int(_279) + int(_327);
    float _333 = floor(_329);
    int _335 = _246 * _331;
    int _337 = _335 + _262;
    float _339 = float(uint(_266));
    bool _341 = uint(_337) >= uint(_230);
    float _343 = 1.0 / _339;
    bool _345 = !_341;
    int _347 = _345 ? 0 : (-1);
    int _349 = ~_331;
    int _351 = _349 + _347;
    int _353 = _351 + 1;
    float _355 = -_333;
    float _357 = _329 + _355;
    float _359 = float(_256);
    int _361 = ~_309;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    int _367 = _230 * _353;
    int _369 = _367 + _262;
    float _371 = 1.0 / _359;
    float _373 = _357 * _281;
    int _375 = _230 + (-1);
    bool _377 = !_248;
    int _379 = _377 ? _369 : (-1);
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _391 = _389 != 0;
    float _393 = trunc(_373);
    int _395 = int(_393);
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _399 = _397 != 0;
    int _401 = _379 * _365;
    float _403 = _148 * _234;
    bool _405 = !_387;
    int _407 = _405 ? 0 : 1;
    int _409 = _309 * _375;
    int _411 = _409 + _401;
    float _413 = _403 * _281;
    bool _415 = !_383;
    int _417 = _415 ? 0 : 1;
    int _419 = abs(_407);
    float _421 = _148 * _371;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _425 = _423 != 0;
    float _427 = trunc(_413);
    int _429 = int(_427);
    bool _431 = !_391;
    int _433 = _431 ? 0 : 1;
    bool _435 = !_399;
    int _437 = _435 ? 0 : 1;
    int _439 = abs(_417);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _443 = _441 != 0;
    float _445 = trunc(_421);
    int _447 = int(_445);
    bool _449 = !_425;
    int _451 = _449 ? 0 : 1;
    int _453 = abs(_437);
    int _455 = abs(_433);
    int _457 = _411 * _419;
    int _459 = abs(_451);
    int _461 = _395 * _453;
    int _463 = _461 + _262;
    int _465 = _429 * _439;
    int _467 = _465 + _457;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _471 = _469 != 0;
    float _473 = as_type<float>(_375);
    float _475 = as_type<float>(_467);
    float _477 = _303;
    if (_443)
    {
        float _479 = in.m_63.x;
        _473 = _479;
    }
    float _481 = _473;
    int _483 = ~_230;
    int _485 = _483 + 1;
    int _487 = _463 * _455;
    int _489 = _487 + _467;
    int _491 = as_type<int>(_343) + (-2);
    float _493 = _481;
    if (!_443)
    {
        float _495 = in.m_63.y;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = float(uint(_447));
    int _501 = _395 * _459;
    int _503 = _501 + _489;
    int _505 = ~_266;
    int _507 = _505 + 1;
    int _509 = ~_230;
    int _511 = _509 + 1;
    float _513 = as_type<float>(_491) * _499;
    float _515 = float(uint(_503));
    if (_443)
    {
        _475 = 1.0;
    }
    float _517 = _475;
    float _519 = trunc(_513);
    float _521 = precise::max(_519, 0.0);
    uint _523 = uint(_521);
    float _525 = _517;
    if (!_443)
    {
        _525 = 1.2345600128173828125;
    }
    float _527 = _525;
    float _529 = as_type<float>(_258) * _515;
    float _531 = trunc(_529);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    float _537 = _497 * _527;
    int _539 = _507 * int(_523);
    int _541 = _539 + _447;
    float _543 = floor(_537);
    float _545 = float(uint(_541));
    int _547 = _511 * int(_535);
    int _549 = _547 + _503;
    float _551 = as_type<float>(_491) * _545;
    float _553 = float(uint(_463));
    float _555 = float(uint(_549));
    float _557 = trunc(_551);
    float _559 = precise::max(_557, 0.0);
    uint _561 = uint(_559);
    float _563 = as_type<float>(_258) * _553;
    float _565 = as_type<float>(_258) * _555;
    float _567 = -_543;
    float _569 = _537 + _567;
    int _571 = ~_230;
    int _573 = _571 + 1;
    float _575 = trunc(_565);
    float _577 = precise::max(_575, 0.0);
    uint _579 = uint(_577);
    float _581 = trunc(_563);
    float _583 = precise::max(_581, 0.0);
    uint _585 = uint(_583);
    int _587 = int(_523) + int(_561);
    int _589 = ~_266;
    int _591 = _589 + 1;
    int _593 = int(_535) + int(_579);
    int _595 = _591 * _587;
    int _597 = _595 + _447;
    float _599 = float(_266);
    float _601 = float(_447);
    int _603 = _573 * _593;
    int _605 = _603 + _503;
    bool _607 = !_471;
    int _609 = _607 ? 0 : 1;
    float _611 = _569 * _599;
    bool _613 = _601 >= _599;
    bool _615 = isnan(_601);
    bool _617 = _613 || _615;
    bool _619 = isnan(_599);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _403 * _599;
    bool _627 = uint(_597) >= uint(_266);
    bool _629 = uint(_605) >= uint(_230);
    float _631 = trunc(_611);
    int _633 = int(_631);
    int _635 = abs(_609);
    int _637 = _485 * int(_585);
    int _639 = _637 + _463;
    bool _641 = !_627;
    int _643 = _641 ? 0 : (-1);
    bool _645 = !_629;
    int _647 = _645 ? 0 : (-1);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _663 = _661 != 0;
    float _665 = trunc(_623);
    int _667 = int(_665);
    int _669 = ~_587;
    int _671 = _669 + _643;
    int _673 = _671 + 1;
    float _675 = float(uint(_639));
    int _677 = ~_593;
    int _679 = _677 + _647;
    int _681 = _679 + 1;
    int _683 = _266 * _673;
    int _685 = _683 + _447;
    bool _687 = _266 == 0;
    float _689 = as_type<float>(_258) * _675;
    bool _691 = _230 == 0;
    int _693 = _230 * _681;
    int _695 = _693 + _503;
    bool _697 = !_687;
    int _699 = _697 ? _685 : (-1);
    int _701 = _633 * _635;
    int _703 = _701 + _447;
    bool _705 = !_655;
    int _707 = _705 ? 0 : 1;
    float _709 = trunc(_625);
    int _711 = int(_709);
    bool _713 = !_691;
    int _715 = _713 ? _695 : (-1);
    int _717 = ~_667;
    int _719 = _717 + 1;
    int _721 = _719 + 1;
    int _723 = _266 + (-1);
    int _725 = abs(_707);
    int _727 = _699 * _721;
    int _729 = _715 >> 31;
    bool _731 = !_651;
    int _733 = _731 ? 0 : 1;
    int _735 = _667 * _723;
    int _737 = _735 + _727;
    int _739 = _729 & 3;
    int _741 = abs(_733);
    int _743 = _737 * _725;
    bool _745 = !_659;
    int _747 = _745 ? 0 : 1;
    int _749 = _715 + _739;
    int _751 = _711 * _741;
    int _753 = _751 + _743;
    bool _755 = !_663;
    int _757 = _755 ? 0 : 1;
    int _759 = abs(_747);
    int _761 = _749 >> 2;
    int _763 = abs(_757);
    int _765 = _703 * _759;
    int _767 = _765 + _753;
    int _769 = _761 << 4;
    int _771 = _769 + 368;
    float _773 = trunc(_689);
    float _775 = precise::max(_773, 0.0);
    uint _777 = uint(_775);
    uint _779 = uint(int(uint(_771) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[int(_789)][_791];
    int _795 = _715 & 3;
    bool _797 = _795 != 0;
    int _799 = _633 * _763;
    int _801 = _799 + _767;
    int _803 = ~_230;
    int _805 = _803 + 1;
    int _807 = ~_266;
    int _809 = _807 + 1;
    float _811 = float(uint(_801));
    int _813 = ~_266;
    int _815 = _813 + 1;
    float _817 = as_type<float>(_491) * _811;
    int _819 = int(_585) + int(_777);
    int _821 = _715 & 3;
    bool _823 = _821 != 0;
    int _825 = _771 + 8;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = trunc(_817);
    float _845 = precise::max(_843, 0.0);
    uint _847 = uint(_845);
    bool _849 = uint(_821) > 1u;
    int _851 = _805 * _819;
    int _853 = _851 + _463;
    int _855 = _797 ? 0 : 1;
    bool _857 = _305 > 0.5;
    bool _859 = uint(_853) >= uint(_230);
    int _861 = ~_855;
    int _863 = _861 + 1;
    int _865 = _863 + 1;
    bool _867 = !_823;
    int _869 = _867 ? 0 : 1;
    bool _871 = !_859;
    int _873 = _871 ? 0 : (-1);
    int _875 = _865;
    if (!_849)
    {
        int _877 = ~_855;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    int _883 = _809 * int(_847);
    int _885 = _883 + _801;
    bool _887 = _821 != 3;
    int _889 = abs(_881);
    int _891 = abs(_869);
    float _893 = float(uint(_885));
    bool _895 = uint(_821) >= 2u;
    int _897 = ~_889;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = ~_819;
    int _905 = _903 + _873;
    int _907 = _905 + 1;
    float _909 = as_type<float>(_491) * _893;
    int _911 = _895 ? 0 : 1;
    int _913 = _901 * as_type<int>(_793);
    int _915 = ~_891;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    int _921 = _230 * _907;
    int _923 = _921 + _463;
    int _925 = ~_911;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = trunc(_909);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    bool _937 = _821 != 3;
    int _939 = _919 * as_type<int>(_785);
    int _941 = _939 + _913;
    int _943 = _929;
    if (_887)
    {
        int _945 = ~_911;
        int _947 = _945 + 1;
        _943 = _947;
    }
    int _949 = _943;
    float _951 = float(uint(_703));
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _955 = _953 != 0;
    float _957 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _959 = int(_957);
    bool _961 = !_937;
    int _963 = _961 ? 0 : (-1);
    float _965 = as_type<float>(_491) * _951;
    int _967 = abs(_949);
    bool _969 = !_955;
    int _971 = _969 ? 0 : 1;
    int _973 = abs(_963);
    float _975 = trunc(_965);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    int _981 = abs(_971);
    int _983 = ~_967;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    int _989 = ~_973;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    float _995 = float(uint(_959));
    int _997 = _987 * as_type<int>(_833);
    int _999 = _997 + _941;
    int _1001 = abs(_959);
    float _1003 = in.m_53.x;
    float _1005 = in.m_53.y;
    float _1007 = in.m_53.z;
    int _1009 = ~_266;
    int _1011 = _1009 + 1;
    int _1013 = _993 * as_type<int>(_841);
    int _1015 = _1013 + _999;
    int _1017 = ~_981;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = 1.0 / _995;
    float _1025 = float(uint(_1001));
    int _1027 = _1011 * int(_979);
    int _1029 = _1027 + _703;
    bool _1031 = !_691;
    int _1033 = _1031 ? _923 : (-1);
    int _1035 = _1015 * _1021;
    int _1037 = int(_847) + int(_935);
    float _1039 = in.m_65.x;
    float _1041 = in.m_65.y;
    float _1043 = in.m_65.z;
    float _1045 = in.m_65.w;
    float _1047 = float(uint(_1029));
    float _1049 = 1.0 / _1025;
    int _1051 = _1033 * _981;
    int _1053 = _1051 + _1035;
    float _1055 = in.m_67.x;
    float _1057 = in.m_67.y;
    float _1059 = in.m_67.z;
    float _1061 = in.m_67.w;
    int _1063 = _815 * _1037;
    int _1065 = _1063 + _801;
    float _1067 = as_type<float>(_491) * _1047;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1071 = _1069 != 0;
    float _1073 = in.m_69.x;
    float _1075 = in.m_69.y;
    float _1077 = in.m_69.z;
    float _1079 = in.m_69.w;
    float _1081 = float(uint(_1053));
    float _1083 = trunc(_1067);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    int _1089 = as_type<int>(_1023) + (-2);
    int _1091 = abs(_1053);
    bool _1093 = uint(_1065) >= uint(_266);
    float _1095 = as_type<float>(_1089) * _1081;
    float _1097 = float(uint(_1091));
    int _1099 = as_type<int>(_1049) + (-2);
    float _1101 = -_186;
    int _1103 = _857 ? as_type<int>(_1101) : as_type<int>(_186);
    float _1105 = trunc(_1095);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1121 = _1119 != 0;
    float _1123 = as_type<float>(_1099) * _1097;
    float _1125 = _1005 * _1041;
    bool _1127 = !_1093;
    int _1129 = _1127 ? 0 : (-1);
    float _1131 = _1005 * _1057;
    float _1133 = trunc(_1123);
    float _1135 = precise::max(_1133, 0.0);
    uint _1137 = uint(_1135);
    int _1139 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1141 = _1139 != 0;
    float _1143 = _1005 * _1075;
    int _1145 = ~_266;
    int _1147 = _1145 + 1;
    float _1149 = fma(_1003, _1055, _1131);
    int _1151 = int(_979) + int(_1087);
    float _1153 = fma(_1003, _1073, _1143);
    float _1155 = fma(_1003, _1039, _1125);
    int _1157 = ~_959;
    int _1159 = _1157 + 1;
    int _1161 = as_type<int>(_1123);
    float _1163 = as_type<float>(_1001);
    if (_443)
    {
        _1161 = 0;
    }
    int _1165 = _1161;
    int _1167 = _1147 * _1151;
    int _1169 = _1167 + _703;
    int _1171 = _1165;
    if (!_443)
    {
        _1171 = 1;
    }
    int _1173 = _1171;
    int _1175 = _1159 * int(_1109);
    int _1177 = _1175 + _1053;
    int _1179 = ~_1037;
    int _1181 = _1179 + _1129;
    int _1183 = _1181 + 1;
    int _1185 = ~int(_1137);
    int _1187 = _1185 + 1;
    bool _1189 = uint(_1169) >= uint(_266);
    float _1191 = float(uint(_1177));
    int _1193 = _266 * _1183;
    int _1195 = _1193 + _801;
    bool _1197 = !_1189;
    int _1199 = _1197 ? 0 : (-1);
    int _1201 = _1187 * _1001;
    int _1203 = _1201 + _1091;
    float _1205 = as_type<float>(_1089) * _1191;
    bool _1207 = !_687;
    int _1209 = _1207 ? _1195 : (-1);
    float _1211 = float(uint(_1203));
    float _1213 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1215 = _1209 >> 31;
    float _1217 = trunc(_1205);
    float _1219 = precise::max(_1217, 0.0);
    uint _1221 = uint(_1219);
    bool _1223 = !_1113;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = as_type<float>(_1099) * _1211;
    int _1229 = _1209 & 3;
    bool _1231 = _1229 != 0;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1235 = _1209 & 3;
    bool _1237 = _1235 != 0;
    int _1239 = _1215 & 3;
    float _1241 = trunc(_1227);
    float _1243 = precise::max(_1241, 0.0);
    uint _1245 = uint(_1243);
    int _1247 = _1231 ? 0 : 1;
    float _1249 = -_1233;
    float _1251 = fma(_1213, 2.0, _1249);
    int _1253 = ~_1151;
    int _1255 = _1253 + _1199;
    int _1257 = _1255 + 1;
    bool _1259 = uint(_1235) > 1u;
    int _1261 = _1209 + _1239;
    int _1263 = _266 * _1257;
    int _1265 = _1263 + _703;
    int _1267 = int(_1109) + int(_1221);
    float _1269 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1271 = _1261 >> 2;
    bool _1273 = !_687;
    int _1275 = _1273 ? _1265 : (-1);
    int _1277 = _1271 << 4;
    int _1279 = _1277 + 512;
    bool _1281 = _1235 != 3;
    int _1283 = ~_1247;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    uint _1289 = uint(int(uint(_1279) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    int _1305 = _1287;
    if (!_1259)
    {
        int _1307 = ~_1247;
        int _1309 = _1307 + 1;
        _1305 = _1309;
    }
    int _1311 = _1305;
    bool _1313 = uint(_1235) >= 2u;
    int _1315 = int(_1137) + int(_1245);
    int _1317 = _1313 ? 0 : 1;
    int _1319 = ~_1315;
    int _1321 = _1319 + 1;
    int _1323 = ~_1317;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = ~_959;
    int _1331 = _1329 + 1;
    int _1333 = _1321 * _1001;
    int _1335 = _1333 + _1091;
    int _1337 = _1327;
    float _1339 = as_type<float>(_1311);
    if (_1281)
    {
        int _1341 = ~_1317;
        int _1343 = _1341 + 1;
        _1337 = _1343;
    }
    int _1345 = _1337;
    int _1347 = _1279 + 8;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    int _1365 = _1331 * _1267;
    int _1367 = _1365 + _1053;
    bool _1369 = !_1237;
    int _1371 = _1369 ? 0 : 1;
    bool _1373 = _1173 != 1;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1377 = uint(_1367) >= uint(_959);
    float _1379 = fma(_1269, -2.0, _1375);
    bool _1381 = !_1377;
    int _1383 = _1381 ? 0 : (-1);
    bool _1385 = _1235 != 3;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1389 = ~_1267;
    int _1391 = _1389 + _1383;
    int _1393 = _1391 + 1;
    float _1395 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1379);
    bool _1397 = !_1385;
    int _1399 = _1397 ? 0 : (-1);
    float _1401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1387);
    bool _1403 = uint(_1335) >= uint(_1001);
    int _1405 = _959 * _1393;
    int _1407 = _1405 + _1053;
    bool _1409 = _959 == 0;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1413 = int(_1411);
    bool _1415 = !_1403;
    int _1417 = _1415 ? 0 : (-1);
    float _1419 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1401);
    float _1421 = as_type<float>(_1367);
    if (!_1373)
    {
        _1421 = _301;
    }
    float _1423 = _1421;
    float _1425 = _1423;
    if (!_1373)
    {
        _1163 = _301;
    }
    float _1427 = _1163;
    float _1429 = -_1419;
    float _1431 = _1429 + 1.0;
    bool _1433 = _299 > 0.5;
    float _1435 = _1427;
    if (_1373)
    {
        _1425 = _299;
    }
    float _1437 = _1425;
    if (_1373)
    {
        _1435 = _299;
    }
    float _1439 = _1435;
    bool _1441 = !_1409;
    int _1443 = _1441 ? _1407 : (-1);
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1447 = abs(_1311);
    int _1449 = abs(_1371);
    int _1451 = ~_1447;
    int _1453 = _1451 + 1;
    int _1455 = _1453 + 1;
    int _1457 = ~_1449;
    int _1459 = _1457 + 1;
    int _1461 = _1459 + 1;
    int _1463 = _1455 * as_type<int>(_1303);
    float _1465 = fma(_1007, _1043, _1155);
    int _1467 = abs(_1345);
    int _1469 = _1461 * as_type<int>(_1295);
    int _1471 = _1469 + _1463;
    int _1473 = abs(_1399);
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1475;
    int _1479 = ~_1467;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    float _1485 = fma(_1007, _1059, _1149);
    float _1487 = fma(_1007, _1077, _1153);
    int _1489 = abs(_1225);
    int _1491 = _1483 * as_type<int>(_1355);
    int _1493 = _1491 + _1471;
    int _1495 = ~_1473;
    int _1497 = _1495 + 1;
    int _1499 = _1497 + 1;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1503 = abs(_1413);
    float _1505 = _1465 + _1045;
    bool _1507 = _303 > 0.5;
    int _1509 = _1499 * as_type<int>(_1363);
    int _1511 = _1509 + _1493;
    if (!_1373)
    {
        _1339 = _303;
    }
    float _1513 = _1339;
    float _1515 = _1485 + _1061;
    int _1517 = ~_1489;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1505 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1525 = _1513;
    if (_1373)
    {
        _477 = _301;
    }
    float _1527 = _477;
    if (_1373)
    {
        _1525 = _301;
    }
    float _1529 = _1525;
    bool _1531 = _301 > 0.5;
    float _1533 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1501);
    float _1535 = float(uint(_1503));
    float _1537 = 1.0 / _1477;
    float _1539 = float(uint(_1413));
    float _1541 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1533);
    float _1543 = -_1541;
    float _1545 = _1543 + 1.0;
    float _1547 = 1.0 / _1535;
    int _1549 = _1511 * _1521;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1553 = _216 + _1551;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1555;
    float _1559 = float(_1443);
    int _1561 = _1275 * _1489;
    int _1563 = _1561 + _1549;
    bool _1565 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1567 = isnan(_216);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = 1.0 / _1539;
    bool _1579 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1581 = isnan(_216);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1553 * _1537;
    int _1593 = abs(_1563);
    float _1595 = -_1575;
    float _1597 = _1595 + 1.0;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1599;
    float _1603 = fma(_1557, _1591, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1605 = _1589 * _1597;
    int _1607 = as_type<int>(_1547) + (-2);
    float _1609 = _1487 + _1079;
    float _1611 = float(uint(_1593));
    float _1613 = fma(_1601, _1591, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1615 = float(uint(_1563));
    float _1617 = _1603 * _1605;
    float _1619 = -_1589;
    float _1621 = _1619 + 1.0;
    float _1623 = as_type<float>(_1607) * _1611;
    int _1625 = as_type<int>(_1577) + (-2);
    float _1627 = _1613 * _1605;
    float _1629 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1617);
    float _1631 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1633 = as_type<float>(_1625) * _1615;
    float _1635 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1627);
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1641 = ~_1413;
    int _1643 = _1641 + 1;
    float _1645 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1635);
    float _1647 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1629);
    float _1649 = trunc(_1633);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = fma(_1529, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1639);
    float _1657 = _1515 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1659 = _1609 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1661 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1637);
    float _1663 = in.m_71.x;
    float _1665 = in.m_71.y;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1669 = trunc(_1623);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = _1053 ^ _959;
    int _1677 = ~_1417;
    int _1679 = _1315 + _1677;
    int _1681 = _1679 + 1;
    uint _1683 = uint(int(uint(_1675) >> uint(31)));
    bool _1685 = !_1071;
    float _1687 = _1685 ? _186 : as_type<float>(_1103);
    int _1689 = _1643 * int(_1653);
    int _1691 = _1689 + _1563;
    float _1693 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1697 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1699 = ~int(_1683);
    int _1701 = _1699 + 1;
    float _1703 = float(uint(_1691));
    float _1705 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1693);
    int _1707 = ~int(_1673);
    int _1709 = _1707 + 1;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1713 = as_type<float>(_1625) * _1703;
    float _1715 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1705);
    int _1717 = _1709 * _1503;
    int _1719 = _1717 + _1593;
    float _1721 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1667);
    float _1723 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1697);
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1727 = _1715 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1729 = float(uint(_1719));
    float _1731 = trunc(_1713);
    float _1733 = precise::max(_1731, 0.0);
    uint _1735 = uint(_1733);
    float _1737 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1721);
    float _1739 = _1727 * _1631;
    float _1741 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1723);
    float _1743 = as_type<float>(_1607) * _1729;
    float _1745 = _1737 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1747 = fma(_1739, 0.5, 0.5);
    float _1749 = -_1725;
    float _1751 = fma(_1445, 2.0, _1749);
    float _1753 = _1745 * _1695;
    float _1755 = trunc(_1743);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = _1741 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _1763 = ~_1413;
    int _1765 = _1763 + 1;
    float _1767 = _1647 * _1665;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1771 = _1761 * _1711;
    int _1773 = int(_1653) + int(_1735);
    float _1775 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1777 = _1645 * _1663;
    float _1779 = -_148;
    float _1781 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1251);
    float _1783 = -_148;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1751);
    int _1787 = _1765 * _1773;
    int _1789 = _1787 + _1563;
    float _1791 = fma(_1775, -2.0, _1769);
    float _1793 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1661);
    float _1795 = floor(_1747);
    float _1797 = -_182;
    int _1799 = _1433 ? as_type<int>(_1797) : as_type<int>(_182);
    float _1801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _182);
    int _1803 = int(_1673) + int(_1759);
    float _1805 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1655);
    float _1807 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1791);
    bool _1809 = uint(_1789) >= uint(_1413);
    float _1811 = _1777 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1815 = ~_1803;
    int _1817 = _1815 + 1;
    float _1819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _186);
    bool _1821 = !_1809;
    int _1823 = _1821 ? 0 : (-1);
    float _1825 = _1811 * _1801;
    float _1827 = _1767 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1829 = _1817 * _1503;
    int _1831 = _1829 + _1593;
    int _1833 = ~_1773;
    int _1835 = _1833 + _1823;
    int _1837 = _1835 + 1;
    float _1839 = -_1795;
    float _1841 = _1747 + _1839;
    float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1845 = !_1141;
    float _1847 = _1845 ? _182 : as_type<float>(_1799);
    float _1849 = _1827 * _1819;
    bool _1851 = uint(_1831) >= uint(_1503);
    int _1853 = _1413 * _1837;
    int _1855 = _1853 + _1563;
    int _1857 = _1563 ^ _1413;
    float _1859 = fma(_1753, 0.5, 0.5);
    float _1861 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1863 = !_1851;
    int _1865 = _1863 ? 0 : (-1);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1869 = _1413 == 0;
    float _1871 = fma(_1861, _1559, _1781);
    uint _1873 = uint(int(uint(_1857) >> uint(31)));
    float _1875 = fma(_1771, 0.5, 0.5);
    bool _1877 = _959 == 0;
    float _1879 = -_1793;
    float _1881 = _1879 + 1.0;
    bool _1883 = !_1869;
    int _1885 = _1883 ? _1855 : (-1);
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1889 = ~_1865;
    int _1891 = _1803 + _1889;
    int _1893 = _1891 + 1;
    float _1895 = _1687 + (-0.5);
    int _1897 = ~int(_1873);
    int _1899 = _1897 + 1;
    float _1901 = _1847 + 0.5;
    bool _1903 = _1413 == 0;
    float _1905 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1907 = float(_1885);
    float _1909 = fma(_1861, _1901, _1871);
    int _1911 = _1893 ^ _1899;
    float _1913 = floor(_1859);
    int _1915 = _1681 ^ _1701;
    float _1917 = fma(_1905, _1907, _1785);
    int _1919 = ~_1899;
    int _1921 = _1919 + _1911;
    int _1923 = _1921 + 1;
    float _1925 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1927 = ~_1701;
    int _1929 = _1927 + _1915;
    int _1931 = _1929 + 1;
    float _1933 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1935 = !_1903;
    int _1937 = _1935 ? _1923 : (-1);
    float _1939 = floor(_1875);
    bool _1941 = !_1877;
    int _1943 = _1941 ? _1931 : (-1);
    float _1945 = -_1805;
    float _1947 = _1945 + 1.0;
    float _1949 = -_182;
    int _1951 = _1507 ? as_type<int>(_1949) : as_type<int>(_182);
    float _1953 = -_1431;
    float _1955 = fma(_1847, _1953, _1909);
    float _1957 = -_186;
    int _1959 = _1531 ? as_type<int>(_1957) : as_type<int>(_186);
    float _1961 = float(_1937);
    float _1963 = -_1913;
    float _1965 = _1859 + _1963;
    float _1967 = float(_1943);
    bool _1969 = !_1121;
    float _1971 = _1969 ? _182 : as_type<float>(_1951);
    float _1973 = -_1807;
    float _1975 = fma(_1933, _1961, _1973);
    bool _1977 = !_1117;
    float _1979 = _1977 ? _186 : as_type<float>(_1959);
    float _1981 = -_1395;
    float _1983 = fma(_1925, _1967, _1981);
    float _1985 = _186 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1987 = _1971 + 0.5;
    float _1989 = -_1939;
    float _1991 = _1875 + _1989;
    float _1993 = _1979 + (-0.5);
    float _1995 = fma(_1905, _1987, _1917);
    float _1997 = -_1925;
    float _1999 = fma(_1997, _1993, _1983);
    bool _2001 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(1.0);
    bool _2009 = _2005 || _2007;
    float _2011 = -_1881;
    float _2013 = fma(_1971, _2011, _1995);
    float _2015 = -_1933;
    float _2017 = fma(_2015, _1895, _1975);
    float _2019 = fma(_1979, _1545, _1999);
    float _2021 = fma(_1985, _1985, 1.0);
    float _2023 = fma(_1965, 2.0, -1.0);
    float _2025 = fma(_1991, 2.0, -1.0);
    float _2027 = fma(_1841, 2.0, -1.0);
    float _2029 = rsqrt(_2021);
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2033 = fma(_1687, _1947, _2017);
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _2037 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2041 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2045 = _2025 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2047 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2039);
    float _2049 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2041);
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2043);
    out.m_73.x = _1955;
    out.m_73.y = _2019;
    out.m_73.z = _2013;
    out.m_73.w = _2033;
    float _2053 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2047);
    float _2055 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2051);
    float _2057 = _1985 * _2029;
    float _2059 = _2053 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2061 = _2055 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2063 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2049);
    float _2065 = _2063 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2067 = as_type<float>(_1701);
    float _2069 = as_type<float>(_1701);
    float _2071 = _2027;
    float _2073 = _2023;
    float _2075 = _2035;
    float _2077 = _2025;
    float _2079 = _2021;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c12)._m0[10].x);
    float _2083 = _2051;
    float _2085 = _1813;
    float _2087 = _1825;
    float _2095;
    if (!_2009)
    {
        bool _2089 = _2065 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2091 = !_2089;
        _2093 = _2091;
        if (!_2093)
        {
            _2095 = 0.0;
            _2097 = true;
        }
    }
    if ((!_2097) || _2093)
    {
        bool _2121;
        if (!_2093)
        {
            bool _2099 = _2065 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2101 = isnan(_2065);
            bool _2103 = _2099 || _2101;
            bool _2105 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2107 = _2103 || _2105;
            bool _2109 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2111 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2113 = !_2107;
            bool _2115 = _2111 && _2113;
            if (_2115)
            {
                _2067 = 0.0;
            }
            float _2117 = _2067;
            bool _2119 = !_2107;
            _2121 = _2119 && _2109;
            _2069 = _2117;
            _2095 = _2117;
        }
        if ((!_2121) || _2093)
        {
            _2093 = false;
            float _2123 = _2069;
            bool _2125 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2127 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2131 = _2019;
            float _2133 = _2123;
            if (_2125)
            {
                float _2135 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2131 = _2135;
            }
            float _2137 = _2131;
            if (_2125)
            {
                float _2139 = abs(_2027);
                float _2141 = -_2139;
                float _2143 = _2141 + 1.0;
                _2071 = _2143;
            }
            float _2145 = _2071;
            if (_2127)
            {
                float _2147 = abs(_2023);
                float _2149 = -_2147;
                float _2151 = _2149 + 1.0;
                _2073 = _2151;
            }
            float _2153 = _2073;
            if (!_2125)
            {
                _2075 = 1.0;
            }
            float _2155 = _2075;
            float _2157 = _2155;
            if (_2129)
            {
                float _2159 = abs(_2025);
                float _2161 = -_2159;
                float _2163 = _2161 + 1.0;
                _2077 = _2163;
            }
            float _2165 = _2077;
            if (!_2127)
            {
                _2079 = 1.0;
            }
            float _2167 = _2079;
            float _2169 = _2167;
            if (!_2129)
            {
                _2133 = 1.0;
            }
            float _2171 = _2133;
            float _2173 = _2045;
            float _2175 = _2171;
            if (_2127)
            {
                float _2177 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2173 = _2177;
            }
            float _2179 = _2173;
            float _2181 = _1955;
            if (_2129)
            {
                float _2183 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2181 = _2183;
            }
            float _2185 = _2181;
            if (_2125)
            {
                float _2187 = _2145 * _2137;
                float _2189 = precise::clamp(_2187, 0.0, 1.0);
                _2157 = _2189;
            }
            float _2191 = _2157;
            if (_2127)
            {
                float _2193 = _2153 * _2179;
                float _2195 = precise::clamp(_2193, 0.0, 1.0);
                _2169 = _2195;
            }
            float _2197 = _2169;
            float _2199 = _2191 * _2197;
            if (_2129)
            {
                float _2201 = _2165 * _2185;
                float _2203 = precise::clamp(_2201, 0.0, 1.0);
                _2175 = _2203;
            }
            float _2205 = _2175;
            float _2207 = _2199 * _2205;
            _2095 = _2207;
        }
    }
    _2097 = false;
    float _2209 = _2095;
    float _2211 = _2065 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2213 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2215 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2217 = fma(_2059, 6.2500002968590706586837768554688e-05, 0.5);
    float _2219 = fma(_2061, 6.2500002968590706586837768554688e-05, 0.5);
    float _2221 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2213);
    float _2223 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2215);
    float _2225 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2221);
    float _2227 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2223);
    float _2229 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2231 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2233 = trunc(_2229);
    int _2235 = int(_2233);
    float _2237 = trunc(_2231);
    int _2239 = int(_2237);
    int _2241 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2243 = _2235 + _2241;
    int _2245 = _2243 + 1;
    bool _2247 = _2245 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2249 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2251 = _2239 + _2249;
    int _2253 = _2251 + 1;
    int _2255 = _2245 | _2253;
    bool _2257 = _2255 < 0;
    bool _2259 = _2257 || _2247;
    bool _2261 = _2253 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2263 = _2261 || _2259;
    int _2265 = _2253;
    int _2267 = _2245;
    if (!_2263)
    {
        int _2269 = _2253 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2271 = _2269 + _2245;
        _2081 = _2271;
    }
    int _2273 = _2081;
    float _2275 = as_type<float>(_2255);
    if (!_2263)
    {
        float _2277 = floor(_2231);
        _2275 = _2277;
    }
    float _2279 = _2275;
    if (!_2263)
    {
        int _2281 = _2273 << 2;
        _2265 = _2281;
    }
    int _2283 = _2265;
    int _2285 = _2283;
    if (!_2263)
    {
        uint _2287 = uint(int(uint(_2273) >> uint(2)));
        _2267 = int(_2287);
    }
    int _2289 = _2267;
    if (!_2263)
    {
        int _2291 = 12 & _2283;
        _2285 = _2291;
    }
    int _2293 = _2285;
    float _2295 = as_type<float>(_2293);
    if (!_2263)
    {
        int _2297 = _2289 << 4;
        int _2299 = _2297 + _2293;
        _2295 = as_type<float>(_2299);
    }
    float _2301 = _2295;
    float _2303 = as_type<float>(_2289);
    if (!_2263)
    {
        float _2305 = floor(_2229);
        _2303 = _2305;
    }
    float _2307 = _2303;
    if (!_2263)
    {
        float _2309 = -_2279;
        float _2311 = _2231 + _2309;
        _2083 = _2311;
    }
    float _2313 = _2083;
    float _2315 = _2301;
    if (!_2263)
    {
        int _2317 = as_type<int>(_2301) + 400;
        uint _2319 = uint(int(uint(_2317) >> uint(2)));
        uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
        int _2323 = int(_2319) & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        _2315 = _2325;
    }
    float _2327 = _2315;
    float2 _7201 = float2(_2217, _2219);
    float _2329 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_7201, float2(0.0), isnan(_7201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_7201, float2(0.0), isnan(_7201)), level(0.0)).x;
    if (!_2263)
    {
        float _2331 = -_2307;
        float _2333 = _2229 + _2331;
        _2085 = _2333;
    }
    float _2335 = _2085;
    float _2337 = as_type<float>(_1799);
    if (!_2263)
    {
        float _2339 = rint(_2327);
        float _2341 = precise::max(_2339, 0.0);
        uint _2343 = uint(_2341);
        uint _2345 = clamp(_2343, 0u, 65535u);
        _2337 = as_type<float>(_2345);
    }
    float _2347 = _2337;
    float _2349 = _2313;
    if (!_2263)
    {
        float3 _7248 = float3(_2335, _2313, float(as_type<int>(_2347)));
        float3 _7252 = select(_7248, float3(0.0), isnan(_7248));
        float _2351 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7252.xy, uint(rint(_7252.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7252.xy, uint(rint(_7252.z)), level(0.0)).x;
        _2349 = _2351;
    }
    float _2353 = _2349;
    float _2355 = -_2065;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2359 = -_2059;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2363 = -_2061;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2375 = rsqrt(_2371);
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2381 = -_2373;
    float _2383 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2381);
    float _2385 = -_2377;
    float _2387 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2385);
    float _2389 = -_2379;
    float _2391 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2389);
    float _2393 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2397 = -_2393;
    float _2399 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2397);
    float _2401 = _2361 * _2375;
    float _2403 = _2365 * _2375;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2407 = _2357 * _2375;
    float _2409 = _2401 * _2401;
    float _2411 = fma(_2403, _2403, _2409);
    float _2413 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2415 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2417 = rsqrt(_2411);
    float _2419 = -_2413;
    float _2421 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2419);
    float _2423 = -_2415;
    float _2425 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2423);
    float _2427 = -_2405;
    float _2429 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2427);
    float _2431 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2433 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2435 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2429);
    float _2437 = -_2431;
    float _2439 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2437);
    float _2441 = -_2433;
    float _2443 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2441);
    float _2445 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2439);
    float _2447 = _2403 * _2417;
    float _2449 = _2401 * _2417;
    float _2451 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2443);
    float _2453 = -_2447;
    float _2455 = _2403 * _2453;
    float _2457 = -_2447;
    float _2459 = _2407 * _2457;
    float _2461 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2463 = -_2455;
    float _2465 = fma(_2401, _2449, _2463);
    float _2467 = _2407 * _2449;
    float _2469 = -_2461;
    float _2471 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2469);
    float _2473 = -_2395;
    float _2475 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2473);
    float _2477 = _2465 * _2465;
    float _2479 = fma(_2445, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2471);
    float _2481 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2475);
    float _2483 = fma(_2467, _2467, _2477);
    float _2485 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2487 = -_2481;
    float _2489 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2479);
    float _2491 = fma(_2459, _2459, _2483);
    float _2493 = -_2485;
    float _2495 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2493);
    float _2497 = _2399 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2499 = 1.0 / _2489;
    float _2501 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2495);
    float _2503 = -_2497;
    float _2505 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2503);
    float _2507 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2505);
    float _2509 = rsqrt(_2491);
    float _2511 = fma(_2501, _2499, -1.0);
    float _2513 = _2465 * _2509;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2519 = -_2515;
    float _2521 = _2519 + 1.0;
    float _2523 = -_2517;
    float _2525 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2523);
    float _2527 = _2521 * _2499;
    float _2529 = fma(_2521, _2511, 1.0);
    float _2531 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2525);
    float _2533 = _2507 * _2527;
    float _2535 = _2529 * _2529;
    float _2537 = _2531 * _2527;
    float _2539 = fma(_2533, _2533, _2535);
    float _2541 = fma(_2537, _2537, _2539);
    float _2543 = rsqrt(_2541);
    float _2545 = _2537 * _2543;
    float _2547 = _2529 * _2543;
    float _2549 = _2533 * _2543;
    float _2551 = -_2545;
    float _2553 = _2401 * _2551;
    float _2555 = _2403 * _2547;
    float _2557 = -_2549;
    float _2559 = _2407 * _2557;
    float _2561 = -_2549;
    float _2563 = -_2553;
    float _2565 = fma(_2403, _2561, _2563);
    float _2567 = -_2545;
    float _2569 = -_2555;
    float _2571 = fma(_2407, _2567, _2569);
    float _2573 = -_2559;
    float _2575 = fma(_2401, _2547, _2573);
    float _2577 = _2565 * _2565;
    float _2579 = fma(_2571, _2571, _2577);
    float _2581 = fma(_2575, _2575, _2579);
    float _2583 = rsqrt(_2581);
    float _2585 = _2571 * _2583;
    float _2587 = _2575 * _2583;
    float _2589 = _2565 * _2583;
    float _2591 = _2403 * _2585;
    float _2593 = _2407 * _2587;
    float _2595 = -_2591;
    float _2597 = fma(_2401, _2587, _2595);
    float _2599 = -_2593;
    float _2601 = fma(_2403, _2589, _2599);
    float _2603 = _2401 * _2589;
    float _2605 = _2597 * _2597;
    float _2607 = -_2603;
    float _2609 = fma(_2407, _2585, _2607);
    float _2611 = fma(_2601, _2601, _2605);
    float _2613 = fma(_2609, _2609, _2611);
    float _2615 = rsqrt(_2613);
    float _2617 = _2609 * _2615;
    float _2619 = _2601 * _2615;
    float _2621 = _2597 * _2615;
    float _2623 = _2401 * _2617;
    float _2625 = _2407 * _2619;
    float _2627 = _2403 * _2621;
    float _2629 = _1849 * _2617;
    float _2631 = -_2623;
    float _2633 = fma(_2403, _2619, _2631);
    float _2635 = -_2625;
    float _2637 = fma(_2401, _2621, _2635);
    float _2639 = -_2627;
    float _2641 = fma(_2407, _2617, _2639);
    float _2643 = _2633 * _2633;
    float _2645 = fma(_2641, _2641, _2643);
    float _2647 = fma(_2637, _2637, _2645);
    float _2649 = rsqrt(_2647);
    float _2651 = _2637 * _2649;
    float _2653 = _1849 * _2619;
    float _2655 = _2641 * _2649;
    float _2657 = _2633 * _2649;
    float _2659 = fma(_1825, _2651, _2629);
    float _2661 = _1849 * _2621;
    float _2663 = fma(_1825, _2655, _2653);
    float _2665 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2667 = _2061 + _2659;
    float _2669 = _2059 + _2663;
    float _2671 = fma(_1825, _2657, _2661);
    float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2675 = _2667 + _2673;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2689 = _2669 + _2687;
    float _2691 = _2065 + _2671;
    float _2693 = _2675 * _2675;
    float _2695 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2665);
    float _2697 = fma(_2689, _2689, _2693);
    float _2699 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2695);
    float _2701 = sqrt(_2697);
    bool _2703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.5);
    bool _2711 = _2707 || _2709;
    float _2713 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2715 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2713);
    float _2717 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2715);
    bool _2719 = _2701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2721 = _2671;
    float _2723 = _2715;
    float _2725 = _2689;
    if (!_2719)
    {
        _2721 = _2669;
    }
    float _2727 = _2721;
    float _2729 = _2727;
    if (!_2719)
    {
        _2723 = _2667;
    }
    float _2731 = _2723;
    float _2733 = _2731;
    if (!_2719)
    {
        _2087 = _2691;
    }
    float _2735 = _2087;
    bool _2737 = !_2719;
    float _2739 = _2735;
    float _2741 = _2329;
    if (!_2737)
    {
        float _2743 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2747 = _2701 + _2745;
        float _2749 = rsqrt(_2697);
        float _2751 = _2747 * _2743;
        float _2753 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2755 = _2751 * 0.15915493667125701904296875;
        float _2757 = _2755 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2755 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2759 + (-1.0);
        float _2767 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = fma(_2763, _2753, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2771 = fma(_2691, _2759, _2767);
        float _2773 = _2749 * _2769;
        float _2775 = fma(_2689, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2777 = fma(_2675, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2729 = _2775;
        _2733 = _2777;
        _2739 = _2771;
    }
    float _2779 = _2729;
    float _2781 = _2733;
    float _2783 = _2739;
    float _2785 = _2717 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2787 = _2699 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2789 = _2783;
    float _2791 = _2779;
    float _2793 = _2781;
    if (!_2711)
    {
        float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2797 = _2065 + _2795;
        float _2799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2801 = _2059 + _2799;
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2805 = -_2059;
        float _2807 = _2805 + _2779;
        float _2809 = _2797 * _2797;
        float _2811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2813 = _2061 + _2811;
        float _2815 = -_2061;
        float _2817 = _2815 + _2781;
        float _2819 = fma(_2801, _2801, _2809);
        float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2823 = fma(_2813, _2813, _2819);
        float _2825 = sqrt(_2823);
        float _2827 = _2803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2829 = precise::min(_2825, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2831 = _2829 * _2821;
        float _2833 = -_2065;
        float _2835 = _2833 + _2783;
        float _2837 = _2827 * _2831;
        float _2839 = fma(_2835, _2837, _2065);
        float _2841 = fma(_2807, _2837, _2059);
        float _2843 = fma(_2817, _2837, _2061);
        _2789 = _2839;
        _2791 = _2841;
        _2793 = _2843;
    }
    float _2845 = _2789;
    float _2847 = _2791;
    float _2849 = _2793;
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2853 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2855 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2857 = _2785 + _2787;
    float _2859 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2851);
    float _2861 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2853);
    float _2863 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2865 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2855);
    float _2867 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2859);
    float _2869 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2861);
    float _2871 = 1.0 / _2787;
    float _2873 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2863);
    float _2875 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2877 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2865);
    float _2879 = _2869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2881 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2873);
    float _2883 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2885 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2889 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2891 = _2877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2893 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2883);
    float _2895 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2885);
    float _2897 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2889);
    float _2899 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2887);
    float _2901 = _2881 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2903 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2893);
    float _2905 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2895);
    float _2907 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2897);
    float _2909 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2899);
    float _2911 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2903);
    float _2913 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2905);
    float _2915 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2907);
    float _2917 = _2857 * _2871;
    float _2919 = _2917 * 0.5;
    float _2921 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2909);
    float _2923 = _2879;
    float _2925 = _2897;
    float _2927 = _2919;
    float _2929 = _2913;
    float _2931 = _2911;
    int _2933 = as_type<int>(_2915);
    float _2935 = _2921;
    if (_2685)
    {
        _2923 = 1.0;
    }
    float _2937 = _2923;
    float _2939 = _2937;
    if (!_2685)
    {
        float _2941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2945 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2943);
        float _2947 = _2941 * 0.15915493667125701904296875;
        float _2949 = _2947 * 6.283185482025146484375;
        float _2951 = cos(_2949);
        float _2953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2955 = _2953 * 0.15915493667125701904296875;
        float _2957 = _2947 * 6.283185482025146484375;
        float _2959 = sin(_2957);
        float _2961 = 1.0 / _2951;
        float _2963 = _2955 * 6.283185482025146484375;
        float _2965 = cos(_2963);
        float _2967 = _2959 * _2961;
        float _2969 = 1.0 / _2945;
        float _2971 = _2965 * _2967;
        float _2973 = _2955 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2977;
        float _2981 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2983 = _2969 * _2981;
        float _2985 = 1.0 / _2971;
        float _2987 = 1.0 / _2979;
        float _2989 = _2975 * _2985;
        float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2993 = fma(_2989, _2983, _2991);
        float _2995 = _2993 * _2987;
        float _2997 = precise::clamp(_2995, 0.0, 1.0);
        _2725 = _2961;
        _2925 = _2983;
        _2927 = _2979;
        _2939 = _2997;
    }
    float _2999 = _2725;
    float _3001 = _2925;
    float _3003 = _2927;
    float _3005 = _2939;
    out.gl_Position.x = _2911;
    out.gl_Position.y = _2913;
    out.gl_Position.z = _2915;
    out.gl_Position.w = _2921;
    float _3007 = abs(_2329);
    bool _3009 = _3007 != 0.0;
    bool _3011 = isnan(_3007);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(0.0);
    bool _3017 = _3013 || _3015;
    float _3019 = _3003;
    float _3021 = _3001;
    float _3023 = _2999;
    if (_2685)
    {
        _3019 = 1.0;
    }
    float _3025 = _3019;
    float _3027 = _3025;
    if (_3017)
    {
        _2741 = _2921;
    }
    float _3029 = _2741;
    float _3031 = _3029;
    if (!_3017)
    {
        _3031 = 0.0;
    }
    float _3033 = _3031;
    float _3035 = _3033;
    if (!_2685)
    {
        float _3037 = as_type<float>(in.m_77.w);
        int _3039 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _3041 = _3039 == 4;
        bool _3043 = _3039 == 8;
        bool _3045 = _3039 == 12;
        int _3047 = as_type<int>(_3037) << 16;
        int _3049 = as_type<int>(_3037) << 8;
        int _3051 = as_type<int>(_3037) << 24;
        int _3053 = _3047 >> 24;
        int _3055 = _3049 >> 24;
        int _3057 = as_type<int>(_3037) >> 24;
        int _3059 = _3051 >> 24;
        float _3061 = float(_3053);
        float _3063 = float(_3055);
        float _3065 = float(_3057);
        float _3067 = _3061 * 0.0078740157186985015869140625;
        float _3069 = float(_3059);
        float _3071 = _3063 * 0.0078740157186985015869140625;
        float _3073 = _3065 * 0.0078740157186985015869140625;
        float _3075 = precise::min(_3067, 1.0);
        float _3077 = _3069 * 0.0078740157186985015869140625;
        float _3079 = precise::min(_3071, 1.0);
        float _3081 = precise::min(_3073, 1.0);
        float _3083 = precise::min(_3077, 1.0);
        float _3085 = precise::max(_3075, -1.0);
        float _3087 = precise::max(_3079, -1.0);
        float _3089 = precise::max(_3081, -1.0);
        float _3091 = precise::max(_3083, -1.0);
        float _3093 = _3091;
        _3021 = _3087;
        _3023 = _3089;
        if (_3041)
        {
            _3093 = _3085;
        }
        float _3095 = _3093;
        float _3097 = _3095;
        if (_3043)
        {
            _3097 = _3087;
        }
        float _3099 = _3097;
        float _3101 = _3099;
        if (_3045)
        {
            _3101 = _3089;
        }
        float _3103 = _3101;
        float _3105 = abs(_3103);
        float _3107 = (-0.0) + _3105;
        _3027 = _3107;
    }
    float _3109 = _3021;
    float _3111 = _3023;
    float _3113 = _3027;
    float _3115 = _3111;
    float _3117 = _3109;
    if (!_3017)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_2263)
    {
        int _3119 = _2273 << 4;
        int _3121 = _3119 + 2048;
        uint _3123 = uint(int(uint(_3121) >> uint(2)));
        uint _3125 = uint(int(uint(int(_3123)) >> uint(2)));
        int _3127 = int(_3123) & 3;
        float _3129 = (*spvDescriptorSet0.vp_c15)._m0[int(_3125)][_3127];
        int _3131 = int(_3123) + 1;
        uint _3133 = uint(int(uint(_3131) >> uint(2)));
        int _3135 = _3131 & 3;
        float _3137 = (*spvDescriptorSet0.vp_c15)._m0[int(_3133)][_3135];
        int _3139 = _3121 + 8;
        uint _3141 = uint(int(uint(_3139) >> uint(2)));
        uint _3143 = uint(int(uint(int(_3141)) >> uint(2)));
        int _3145 = int(_3141) & 3;
        float _3147 = (*spvDescriptorSet0.vp_c15)._m0[int(_3143)][_3145];
        int _3149 = int(_3141) + 1;
        uint _3151 = uint(int(uint(_3149) >> uint(2)));
        int _3153 = _3149 & 3;
        float _3155 = (*spvDescriptorSet0.vp_c15)._m0[int(_3151)][_3153];
        float _3157 = _2211 * _3137;
        float _3159 = fma(_2059, _3129, _3157);
        float _3161 = fma(_2061, _3147, _3159);
        float _3163 = _3161 + _3155;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        float _3167 = -_3165;
        float _3169 = _3167 + _2353;
        float _3171 = fma(_3169, 500.0, 1.5);
        float _3173 = exp2(_3171);
        float _3175 = 0.0 + _3173;
        float _3177 = precise::clamp(_3175, 0.0, 1.0);
        bool _3179 = _3177 >= 1.0;
        bool _3181 = isnan(_3177);
        bool _3183 = _3179 || _3181;
        bool _3185 = isnan(1.0);
        bool _3187 = _3183 || _3185;
        _3115 = _3165;
        _3117 = _3147;
        if (!_3187)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_3187)
        {
            _3035 = 0.0;
        }
    }
    float _3189 = _3115;
    float _3191 = _3117;
    float _3193 = _3035;
    float _3195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3197 = _2845 + _3195;
    float _3199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3201 = _2847 + _3199;
    float _3203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3205 = _2849 + _3203;
    float _3207 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3209 = _3197 * _3197;
    float _3211 = fma(_3201, _3201, _3209);
    float _3213 = fma(_3205, _3205, _3211);
    float _3215 = rsqrt(_3213);
    float _3217 = sqrt(_3213);
    float _3219 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3221 = _3201 * _3219;
    float _3223 = _3205 * _3219;
    float _3225 = _3221 * _3221;
    float _3227 = _3223 * _3223;
    float _3229 = _3225 + _3227;
    float _3231 = sqrt(_3229);
    bool _3233 = _3231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3237 = _3231 + _3235;
    float _3239 = _3215;
    float _3241 = _3229;
    float _3243 = _3237;
    float _3245 = _3189;
    float _3247 = _3197;
    float _3249 = _3191;
    if (_3233)
    {
        float _3251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3239 = _3251;
    }
    float _3253 = _3239;
    if (_3233)
    {
        float _3255 = rsqrt(_3229);
        _3241 = _3255;
    }
    float _3257 = _3241;
    float _3259 = _3257;
    if (_3233)
    {
        float _3261 = _3237 * _3253;
        _3243 = _3261;
    }
    float _3263 = _3243;
    if (_3233)
    {
        float _3265 = _3263 * 0.15915493667125701904296875;
        _3245 = _3265;
    }
    float _3267 = _3245;
    float _3269 = _3205;
    if (_3233)
    {
        float _3271 = _3267 * 6.283185482025146484375;
        float _3273 = sin(_3271);
        _3269 = _3273;
    }
    float _3275 = _3269;
    float _3277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3279 = precise::max(0.0, _3277);
    float _3281 = _3253;
    float _3283 = _3279;
    if (_3233)
    {
        float _3285 = _3267 * 6.283185482025146484375;
        float _3287 = cos(_3285);
        _3281 = _3287;
    }
    float _3289 = _3281;
    float _3291 = -_3219;
    float _3293 = -_3279;
    float _3295 = fma(_3197, _3291, _3293);
    if (_3233)
    {
        float _3297 = _3295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3247 = _3297;
    }
    float _3299 = _3247;
    float _3301 = _3275;
    float _3303 = _3299;
    if (_3233)
    {
        float _3305 = fma(_3275, _3299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3249 = _3305;
    }
    float _3307 = _3249;
    float _3309 = _3307;
    if (!_3233)
    {
        _3301 = _3221;
    }
    float _3311 = _3301;
    float _3313 = _3311;
    if (!_3233)
    {
        _3303 = _3295;
    }
    float _3315 = _3303;
    float _3317 = _3315;
    float _3319 = _3289;
    if (_3233)
    {
        float _3321 = _3289 + (-1.0);
        _3283 = _3321;
    }
    float _3323 = _3283;
    float _3325 = _3323;
    if (_3233)
    {
        float _3327 = _3257 * _3307;
        _3309 = _3327;
    }
    float _3329 = _3309;
    if (!_3233)
    {
        _3259 = _3225;
    }
    float _3331 = _3259;
    float _3333 = _3331;
    if (_3233)
    {
        float _3335 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3325 = _3335;
    }
    float _3337 = _3325;
    float _3339 = _3337;
    if (_3233)
    {
        float _3341 = _3221 * _3329;
        _3313 = _3341;
    }
    float _3343 = _3313;
    if (_3233)
    {
        float _3345 = fma(_3295, _3289, _3337);
        _3317 = _3345;
    }
    float _3347 = _3317;
    if (!_3233)
    {
        _3339 = _3223;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3233)
    {
        float _3353 = _3223 * _3329;
        _3351 = _3353;
    }
    float _3355 = _3351;
    if (_3233)
    {
        float _3357 = _3343 * _3343;
        _3333 = _3357;
    }
    float _3359 = _3333;
    if (!_3233)
    {
        _3319 = _3227;
    }
    float _3361 = _3319;
    float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3365 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3363);
    float _3367 = precise::clamp(_3365, 0.0, 1.0);
    float _3369 = _3361;
    if (_3233)
    {
        float _3371 = _3355 * _3355;
        _3369 = _3371;
    }
    float _3373 = _3369;
    float _3375 = fma(_3347, _3347, _3359);
    bool _3377 = _3113 != 0.0;
    bool _3379 = isnan(_3113);
    bool _3381 = _3377 || _3379;
    bool _3383 = isnan(0.0);
    bool _3385 = _3381 || _3383;
    float _3387 = -_3367;
    float _3389 = _3387 + 1.0;
    float _3391 = 1.0 / _3193;
    float _3393 = _3375 + _3373;
    float _3395 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3397 = rsqrt(_3393);
    float _3399 = -_3207;
    float _3401 = fma(_3399, _3395, 1.0);
    if (!_3385)
    {
        _2929 = 0.0;
        _2931 = 0.0;
    }
    float _3403 = _2929;
    float _3405 = _2931;
    float _3407 = abs(_3389);
    float _3409 = log2(_3407);
    float _3411 = _3391 * _3403;
    float _3413 = fma(_3411, -0.5, 0.5);
    float _3415 = _3397 * _3343;
    float _3417 = _3397 * _3347;
    float _3419 = _3397 * _3355;
    float _3421 = log2(_3401);
    float _3423 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3425 = _3417 + 1.0;
    float _3427 = -_3423;
    float _3429 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3427);
    float _3431 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3433 = -_3419;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3429);
    float _3437 = exp2(_3431);
    float _3439 = fma(_3435, -0.5, 0.5);
    float _3441 = fma(_3435, 0.5, 0.5);
    float _3443 = _3391 * _3405;
    float _3445 = _3421 * 0.693147182464599609375;
    float _3447 = fma(_3441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3449 = fma(_3443, 0.5, 0.5);
    float _3451 = sqrt(_3439);
    float _3453 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3455 = fma(_3441, _3447, -0.212114393711090087890625);
    float _3457 = fma(_3441, _3455, 1.570728778839111328125);
    float _3459 = -_3417;
    float _3461 = fma(_3437, _3425, _3459);
    float _3463 = fma(_3461, 0.5, 0.5);
    float _3465 = _3451 * 0.636619746685028076171875;
    float _3467 = -_3457;
    float _3469 = fma(_3465, _3467, 1.0);
    float3 _9012 = float3(_3449, _3413, _3453);
    float _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9012, float3(0.0), isnan(_9012)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9012, float3(0.0), isnan(_9012)), level(0.0)).x;
    float3 _9021 = float3(_3449, _3413, _3453);
    float4 _3474 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9021, float3(0.0), isnan(_9021)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9021, float3(0.0), isnan(_9021)), level(0.0)).xyzw;
    float _3476 = _3474.x;
    float _3478 = _3474.y;
    float _3480 = _3474.z;
    float _3482 = _3474.w;
    float2 _9037 = float2(_3469, _3463);
    float3 _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9037, float2(0.0), isnan(_9037)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9037, float2(0.0), isnan(_9037)), level(0.0)).xyz;
    float _3488 = _3486.x;
    float _3490 = _3486.y;
    float _3492 = _3486.z;
    float _3494 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3496 = -_2401;
    float _3498 = _2057 * _3496;
    float _3500 = -_2407;
    float _3502 = _2057 * _3500;
    float _3504 = -_2403;
    float _3506 = _2057 * _3504;
    out.m_79.x = _2655;
    out.m_79.y = _2657;
    out.m_79.z = _2651;
    float _3508 = fma(_2029, _2619, _3498);
    float _3510 = exp2(_3494);
    float _3512 = fma(_2029, _2621, _3502);
    float _3514 = fma(_2029, _2617, _3506);
    float _3516 = _1985 * _2617;
    float _3518 = _1985 * _2619;
    float _3520 = _1985 * _2621;
    out.m_81.x = _3508;
    out.m_81.y = _3512;
    out.m_81.z = _3514;
    float _3522 = fma(_2037, _2655, _3518);
    float _3524 = _2209 * _3005;
    float _3526 = fma(_2037, _2651, _3516);
    float _3528 = fma(_2037, _2657, _3520);
    float _3530 = _2915 + _2921;
    float _3532 = _2401 + _3522;
    float _3534 = _2403 + _3526;
    float _3536 = _3524 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3538 = -_3510;
    float _3540 = _3538 + 1.0;
    float _3542 = _3530 * 0.5;
    float _3544 = _2407 + _3528;
    out.m_83.x = _2847;
    out.m_83.y = _2845;
    out.m_83.z = _2849;
    float _3546 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3548 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3550 = isnan(_3217);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3556 = _3552 || _3554;
    out.m_85.z = _3542;
    out.m_85.w = _2921;
    float _3558 = _3453;
    float _3560 = _3540;
    float _3562 = 0.0;
    float _3564 = 0.0;
    if (!_3385)
    {
        _3558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3566 = _3558;
    float _3568 = _3536 * _3113;
    out.m_87.x = _3532;
    out.m_87.y = _3544;
    out.m_87.z = _3534;
    float _3570 = _3568;
    if (!_3385)
    {
        _3570 = 0.0;
    }
    float _3572 = _3570;
    if (!_3385)
    {
        float _3574 = _3566 * 5.0;
        _2933 = as_type<int>(_3574);
    }
    int _3576 = _2933;
    float _3578 = as_type<float>(_3576);
    if (!_3385)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9211 = as_type<float>(_3576);
        out.gl_Position.z = _9211;
    }
    if (!_3556)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3580 = _2935;
    float _3582 = _3580;
    float _3584 = _3580;
    if (!_3556)
    {
        _3560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3586 = _3560;
    float _3588 = _3586;
    float _3590 = _3586;
    if (!_3556)
    {
        _3578 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3592 = _3578;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3556)
    {
        _3562 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3598 = _3562;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3556)
    {
        _3564 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3604 = _3564;
    float _3606 = _3546 * _3471;
    float _3608 = -_3546;
    float _3610 = _3608 + 1.0;
    float _3612 = _3482 * _3606;
    float _3614 = _3492 * _3606;
    float _3616 = _3482 * _3610;
    float _3618 = _3610;
    float _3620 = _3604;
    float _3622 = _3604;
    if (!_3556)
    {
        _3618 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3624 = _3618;
    float _3626 = fma(_3488, _3612, _3476);
    float _3628 = fma(_3490, _3612, _3478);
    float _3630 = fma(_3482, _3614, _3480);
    out.m_89.x = _3626;
    out.m_89.y = _3628;
    out.m_89.z = _3630;
    out.m_89.w = _3616;
    bool _3632 = !_3556;
    float _3634 = _3624;
    float _3636 = _3624;
    if (!_3632)
    {
        bool _3638 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3640 = isnan(_3217);
        bool _3642 = _3638 || _3640;
        bool _3644 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3646 = _3642 || _3644;
        if (!_3646)
        {
            float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3650 = _3217 + _3648;
            float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3654 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3652;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3664 = 1.0 / _3654;
            float _3666 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3668 = _3666 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3670 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3672 = _3670 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3676 = _3674 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3678 = _3650 * _3664;
            float _3680 = precise::clamp(_3678, 0.0, 1.0);
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3684 = _3682 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3686 = fma(_3680, _3658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3688 = fma(_3680, _3662, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3690 = fma(_3680, _3684, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3692 = fma(_3680, _3668, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3694 = fma(_3680, _3672, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3696 = fma(_3680, _3676, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3622 = _3686;
            _3584 = _3694;
            _3602 = _3688;
            _3636 = _3692;
            _3590 = _3690;
            _3596 = _3696;
            _3698 = true;
        }
        else
        {
            bool _3700 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3702 = isnan(_3217);
            bool _3704 = _3700 || _3702;
            bool _3706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3708 = _3704 || _3706;
            if (!_3708)
            {
                _3634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3710 = _3634;
            _3636 = _3710;
            if (!_3708)
            {
                _3582 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3712 = _3582;
            _3584 = _3712;
            if (!_3708)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3714 = _3594;
            _3596 = _3714;
            if (!_3708)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3716 = _3600;
            _3602 = _3716;
            if (!_3708)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3718 = _3620;
            _3622 = _3718;
            if (!_3708)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3720 = _3588;
            bool _3722 = !_3708;
            _3590 = _3720;
            if (!_3722)
            {
                bool _3724 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3726 = isnan(_3217);
                bool _3728 = _3724 || _3726;
                bool _3730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3732 = _3728 || _3730;
                if (!_3732)
                {
                    float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3736 = _3217 + _3734;
                    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3738;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3750 = 1.0 / _3740;
                    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3758 = _3756 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3762 = _3760 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3764 = _3736 * _3750;
                    float _3766 = precise::clamp(_3764, 0.0, 1.0);
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3772 = fma(_3766, _3744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3774 = fma(_3766, _3748, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3776 = fma(_3766, _3770, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3778 = fma(_3766, _3754, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3780 = fma(_3766, _3758, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3782 = fma(_3766, _3762, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3622 = _3772;
                    _3584 = _3780;
                    _3602 = _3774;
                    _3636 = _3778;
                    _3590 = _3776;
                    _3596 = _3782;
                    _3698 = true;
                }
                else
                {
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3584 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3698 = false;
    float _3784 = _3622;
    float _3786 = _3584;
    float _3788 = _3602;
    float _3790 = _3636;
    float _3792 = _3590;
    float _3794 = _3596;
    float _3796 = fma(_3544, -0.5, 0.5);
    float _3798 = precise::clamp(_3796, 0.0, 1.0);
    float _3800 = -_3784;
    float _3802 = _3786 + _3800;
    float _3804 = _3572 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3806 = -_3788;
    float _3808 = _3790 + _3806;
    float _3810 = fma(_3798, _3802, _3784);
    out.m_91.w = _3804;
    float _3812 = fma(_3798, _3808, _3788);
    float _3814 = -_3792;
    float _3816 = _3794 + _3814;
    float _3818 = _3810 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    bool _3820 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3822 = fma(_3798, _3816, _3792);
    float _3824 = fma(_3812, 0.298911988735198974609375, _3818);
    bool _3826 = _3005 > 0.0;
    bool _3828 = isnan(_3005);
    bool _3830 = _3826 || _3828;
    bool _3832 = isnan(0.0);
    bool _3834 = _3830 || _3832;
    float _3836 = fma(_3822, 0.114477999508380889892578125, _3824);
    out.m_93.x = 0.0;
    float _3838 = -_3836;
    float _3840 = _3812 + _3838;
    float _3842 = -_3836;
    float _3844 = _3810 + _3842;
    float _3846 = -_3836;
    float _3848 = _3822 + _3846;
    float _3850 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    float _3852 = fma(_3844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    float _3854 = fma(_3848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    bool _3856 = !_3820;
    if (!_3856)
    {
        float _3858 = -_2845;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3862 = -_2847;
        float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3866 = -_2849;
        float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3870 = _3860 * _3860;
        float _3872 = fma(_3864, _3864, _3870);
        float _3874 = fma(_3868, _3868, _3872);
        float _3876 = sqrt(_3874);
        float _3878 = rsqrt(_3874);
        float _3880 = -_3876;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3884 = _3882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3886 = precise::clamp(_3884, 0.0, 1.0);
        float _3888 = _3864 * _3878;
        float _3890 = _3860 * _3878;
        float _3892 = abs(_3886);
        float _3894 = log2(_3892);
        float _3896 = _3868 * _3878;
        float _3898 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3900 = _3544 * _3890;
        float _3902 = -_3890;
        float _3904 = -_3898;
        float _3906 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3904);
        float _3908 = fma(_3532, _3888, _3900);
        float _3910 = -_3896;
        float _3912 = fma(_3910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3906);
        float _3914 = fma(_3534, _3896, _3908);
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3920 = _3912 + _3918;
        float _3922 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3924 = _3920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3926 = precise::clamp(_3924, 0.0, 1.0);
        float _3928 = exp2(_3922);
        float _3930 = _3928 * _3926;
        float _3932 = _3916 * _3930;
        float _3934 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3936 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3934;
        out.m_93.y = _3936;
        out.m_93.z = _3938;
    }
    out.m_95.x = _3850;
    out.m_95.y = _3852;
    out.m_95.z = _3854;
    if (_3834)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _3940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3940;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3698 = false;
    bool _2097 = false;
    bool _2093 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_53.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_56.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3997 = as_type<float>(_130);
        out.gl_Position.z = _3997;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_58.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_56.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4065 = as_type<float>(_166);
        out.gl_Position.z = _4065;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = as_type<float>(int(gl_VertexIndex));
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _172 = as_type<int>(_168) & 1;
    bool _174 = _172 != 0;
    int _176 = as_type<int>(_168) & 2;
    bool _178 = _176 != 0;
    bool _180 = !_174;
    float _182 = _180 ? (-0.5) : 0.5;
    bool _184 = !_178;
    float _186 = _184 ? (-0.5) : 0.5;
    bool _188 = !_170;
    float _206;
    if (!_188)
    {
        float _190 = in.m_63.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        float _210 = float(_114);
        float _212 = 1.0 / _210;
        float _214 = _148 * _212;
        _206 = _214;
    }
    _208 = false;
    float _216 = _206;
    float _218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _220 = int(_218);
    float _222 = float(_114);
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _226 = _224 != 0;
    float _228 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _230 = int(_228);
    float _232 = float(_220);
    float _234 = 1.0 / _222;
    float _236 = float(uint(_230));
    float _238 = 1.0 / _232;
    int _240 = ~_230;
    int _242 = _240 + 1;
    int _244 = ~_230;
    int _246 = _244 + 1;
    bool _248 = _230 == 0;
    float _250 = 1.0 / _236;
    float _252 = _148 * _238;
    float _254 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _256 = int(_254);
    int _258 = as_type<int>(_250) + (-2);
    float _260 = trunc(_252);
    int _262 = int(_260);
    float _264 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _266 = int(_264);
    float _268 = float(uint(_262));
    float _270 = float(_262);
    float _272 = as_type<float>(_258) * _268;
    float _274 = trunc(_272);
    float _276 = precise::max(_274, 0.0);
    uint _279 = uint(_276);
    float _281 = float(_230);
    bool _283 = _270 >= _281;
    bool _285 = isnan(_270);
    bool _287 = _283 || _285;
    bool _289 = isnan(_281);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    int _295 = _242 * int(_279);
    int _297 = _295 + _262;
    float _299 = in.m_63.x;
    float _301 = in.m_63.y;
    float _303 = in.m_63.z;
    float _305 = in.m_63.w;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = float(uint(_297));
    float _313 = as_type<float>(_258) * _311;
    float _315 = _311;
    if (_226)
    {
        _315 = 1.0;
    }
    float _317 = _315;
    float _319 = _317;
    if (!_226)
    {
        _319 = 7.345489978790283203125;
    }
    float _321 = _319;
    float _323 = trunc(_313);
    float _325 = precise::max(_323, 0.0);
    uint _327 = uint(_325);
    float _329 = _321 * _299;
    int _331 = int(_279) + int(_327);
    float _333 = floor(_329);
    int _335 = _246 * _331;
    int _337 = _335 + _262;
    float _339 = float(uint(_266));
    bool _341 = uint(_337) >= uint(_230);
    float _343 = 1.0 / _339;
    bool _345 = !_341;
    int _347 = _345 ? 0 : (-1);
    int _349 = ~_331;
    int _351 = _349 + _347;
    int _353 = _351 + 1;
    float _355 = -_333;
    float _357 = _329 + _355;
    float _359 = float(_256);
    int _361 = ~_309;
    int _363 = _361 + 1;
    int _365 = _363 + 1;
    int _367 = _230 * _353;
    int _369 = _367 + _262;
    float _371 = 1.0 / _359;
    float _373 = _357 * _281;
    int _375 = _230 + (-1);
    bool _377 = !_248;
    int _379 = _377 ? _369 : (-1);
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _391 = _389 != 0;
    float _393 = trunc(_373);
    int _395 = int(_393);
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _399 = _397 != 0;
    int _401 = _379 * _365;
    float _403 = _148 * _234;
    bool _405 = !_387;
    int _407 = _405 ? 0 : 1;
    int _409 = _309 * _375;
    int _411 = _409 + _401;
    float _413 = _403 * _281;
    bool _415 = !_383;
    int _417 = _415 ? 0 : 1;
    int _419 = abs(_407);
    float _421 = _148 * _371;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _425 = _423 != 0;
    float _427 = trunc(_413);
    int _429 = int(_427);
    bool _431 = !_391;
    int _433 = _431 ? 0 : 1;
    bool _435 = !_399;
    int _437 = _435 ? 0 : 1;
    int _439 = abs(_417);
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _443 = _441 != 0;
    float _445 = trunc(_421);
    int _447 = int(_445);
    bool _449 = !_425;
    int _451 = _449 ? 0 : 1;
    int _453 = abs(_437);
    int _455 = abs(_433);
    int _457 = _411 * _419;
    int _459 = abs(_451);
    int _461 = _395 * _453;
    int _463 = _461 + _262;
    int _465 = _429 * _439;
    int _467 = _465 + _457;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _471 = _469 != 0;
    float _473 = as_type<float>(_375);
    float _475 = as_type<float>(_467);
    float _477 = _303;
    if (_443)
    {
        float _479 = in.m_63.x;
        _473 = _479;
    }
    float _481 = _473;
    int _483 = ~_230;
    int _485 = _483 + 1;
    int _487 = _463 * _455;
    int _489 = _487 + _467;
    int _491 = as_type<int>(_343) + (-2);
    float _493 = _481;
    if (!_443)
    {
        float _495 = in.m_63.y;
        _493 = _495;
    }
    float _497 = _493;
    float _499 = float(uint(_447));
    int _501 = _395 * _459;
    int _503 = _501 + _489;
    int _505 = ~_266;
    int _507 = _505 + 1;
    int _509 = ~_230;
    int _511 = _509 + 1;
    float _513 = as_type<float>(_491) * _499;
    float _515 = float(uint(_503));
    if (_443)
    {
        _475 = 1.0;
    }
    float _517 = _475;
    float _519 = trunc(_513);
    float _521 = precise::max(_519, 0.0);
    uint _523 = uint(_521);
    float _525 = _517;
    if (!_443)
    {
        _525 = 1.2345600128173828125;
    }
    float _527 = _525;
    float _529 = as_type<float>(_258) * _515;
    float _531 = trunc(_529);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    float _537 = _497 * _527;
    int _539 = _507 * int(_523);
    int _541 = _539 + _447;
    float _543 = floor(_537);
    float _545 = float(uint(_541));
    int _547 = _511 * int(_535);
    int _549 = _547 + _503;
    float _551 = as_type<float>(_491) * _545;
    float _553 = float(uint(_463));
    float _555 = float(uint(_549));
    float _557 = trunc(_551);
    float _559 = precise::max(_557, 0.0);
    uint _561 = uint(_559);
    float _563 = as_type<float>(_258) * _553;
    float _565 = as_type<float>(_258) * _555;
    float _567 = -_543;
    float _569 = _537 + _567;
    int _571 = ~_230;
    int _573 = _571 + 1;
    float _575 = trunc(_565);
    float _577 = precise::max(_575, 0.0);
    uint _579 = uint(_577);
    float _581 = trunc(_563);
    float _583 = precise::max(_581, 0.0);
    uint _585 = uint(_583);
    int _587 = int(_523) + int(_561);
    int _589 = ~_266;
    int _591 = _589 + 1;
    int _593 = int(_535) + int(_579);
    int _595 = _591 * _587;
    int _597 = _595 + _447;
    float _599 = float(_266);
    float _601 = float(_447);
    int _603 = _573 * _593;
    int _605 = _603 + _503;
    bool _607 = !_471;
    int _609 = _607 ? 0 : 1;
    float _611 = _569 * _599;
    bool _613 = _601 >= _599;
    bool _615 = isnan(_601);
    bool _617 = _613 || _615;
    bool _619 = isnan(_599);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _403 * _599;
    bool _627 = uint(_597) >= uint(_266);
    bool _629 = uint(_605) >= uint(_230);
    float _631 = trunc(_611);
    int _633 = int(_631);
    int _635 = abs(_609);
    int _637 = _485 * int(_585);
    int _639 = _637 + _463;
    bool _641 = !_627;
    int _643 = _641 ? 0 : (-1);
    bool _645 = !_629;
    int _647 = _645 ? 0 : (-1);
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _651 = _649 != 0;
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _655 = _653 != 0;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _659 = _657 != 0;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _663 = _661 != 0;
    float _665 = trunc(_623);
    int _667 = int(_665);
    int _669 = ~_587;
    int _671 = _669 + _643;
    int _673 = _671 + 1;
    float _675 = float(uint(_639));
    int _677 = ~_593;
    int _679 = _677 + _647;
    int _681 = _679 + 1;
    int _683 = _266 * _673;
    int _685 = _683 + _447;
    bool _687 = _266 == 0;
    float _689 = as_type<float>(_258) * _675;
    bool _691 = _230 == 0;
    int _693 = _230 * _681;
    int _695 = _693 + _503;
    bool _697 = !_687;
    int _699 = _697 ? _685 : (-1);
    int _701 = _633 * _635;
    int _703 = _701 + _447;
    bool _705 = !_655;
    int _707 = _705 ? 0 : 1;
    float _709 = trunc(_625);
    int _711 = int(_709);
    bool _713 = !_691;
    int _715 = _713 ? _695 : (-1);
    int _717 = ~_667;
    int _719 = _717 + 1;
    int _721 = _719 + 1;
    int _723 = _266 + (-1);
    int _725 = abs(_707);
    int _727 = _699 * _721;
    int _729 = _715 >> 31;
    bool _731 = !_651;
    int _733 = _731 ? 0 : 1;
    int _735 = _667 * _723;
    int _737 = _735 + _727;
    int _739 = _729 & 3;
    int _741 = abs(_733);
    int _743 = _737 * _725;
    bool _745 = !_659;
    int _747 = _745 ? 0 : 1;
    int _749 = _715 + _739;
    int _751 = _711 * _741;
    int _753 = _751 + _743;
    bool _755 = !_663;
    int _757 = _755 ? 0 : 1;
    int _759 = abs(_747);
    int _761 = _749 >> 2;
    int _763 = abs(_757);
    int _765 = _703 * _759;
    int _767 = _765 + _753;
    int _769 = _761 << 4;
    int _771 = _769 + 368;
    float _773 = trunc(_689);
    float _775 = precise::max(_773, 0.0);
    uint _777 = uint(_775);
    uint _779 = uint(int(uint(_771) >> uint(2)));
    uint _781 = uint(int(uint(int(_779)) >> uint(2)));
    int _783 = int(_779) & 3;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[int(_781)][_783];
    int _787 = int(_779) + 1;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    int _791 = _787 & 3;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[int(_789)][_791];
    int _795 = _715 & 3;
    bool _797 = _795 != 0;
    int _799 = _633 * _763;
    int _801 = _799 + _767;
    int _803 = ~_230;
    int _805 = _803 + 1;
    int _807 = ~_266;
    int _809 = _807 + 1;
    float _811 = float(uint(_801));
    int _813 = ~_266;
    int _815 = _813 + 1;
    float _817 = as_type<float>(_491) * _811;
    int _819 = int(_585) + int(_777);
    int _821 = _715 & 3;
    bool _823 = _821 != 0;
    int _825 = _771 + 8;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = trunc(_817);
    float _845 = precise::max(_843, 0.0);
    uint _847 = uint(_845);
    bool _849 = uint(_821) > 1u;
    int _851 = _805 * _819;
    int _853 = _851 + _463;
    int _855 = _797 ? 0 : 1;
    bool _857 = _305 > 0.5;
    bool _859 = uint(_853) >= uint(_230);
    int _861 = ~_855;
    int _863 = _861 + 1;
    int _865 = _863 + 1;
    bool _867 = !_823;
    int _869 = _867 ? 0 : 1;
    bool _871 = !_859;
    int _873 = _871 ? 0 : (-1);
    int _875 = _865;
    if (!_849)
    {
        int _877 = ~_855;
        int _879 = _877 + 1;
        _875 = _879;
    }
    int _881 = _875;
    int _883 = _809 * int(_847);
    int _885 = _883 + _801;
    bool _887 = _821 != 3;
    int _889 = abs(_881);
    int _891 = abs(_869);
    float _893 = float(uint(_885));
    bool _895 = uint(_821) >= 2u;
    int _897 = ~_889;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = ~_819;
    int _905 = _903 + _873;
    int _907 = _905 + 1;
    float _909 = as_type<float>(_491) * _893;
    int _911 = _895 ? 0 : 1;
    int _913 = _901 * as_type<int>(_793);
    int _915 = ~_891;
    int _917 = _915 + 1;
    int _919 = _917 + 1;
    int _921 = _230 * _907;
    int _923 = _921 + _463;
    int _925 = ~_911;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = trunc(_909);
    float _933 = precise::max(_931, 0.0);
    uint _935 = uint(_933);
    bool _937 = _821 != 3;
    int _939 = _919 * as_type<int>(_785);
    int _941 = _939 + _913;
    int _943 = _929;
    if (_887)
    {
        int _945 = ~_911;
        int _947 = _945 + 1;
        _943 = _947;
    }
    int _949 = _943;
    float _951 = float(uint(_703));
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _955 = _953 != 0;
    float _957 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _959 = int(_957);
    bool _961 = !_937;
    int _963 = _961 ? 0 : (-1);
    float _965 = as_type<float>(_491) * _951;
    int _967 = abs(_949);
    bool _969 = !_955;
    int _971 = _969 ? 0 : 1;
    int _973 = abs(_963);
    float _975 = trunc(_965);
    float _977 = precise::max(_975, 0.0);
    uint _979 = uint(_977);
    int _981 = abs(_971);
    int _983 = ~_967;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    int _989 = ~_973;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    float _995 = float(uint(_959));
    int _997 = _987 * as_type<int>(_833);
    int _999 = _997 + _941;
    int _1001 = abs(_959);
    float _1003 = in.m_53.x;
    float _1005 = in.m_53.y;
    float _1007 = in.m_53.z;
    int _1009 = ~_266;
    int _1011 = _1009 + 1;
    int _1013 = _993 * as_type<int>(_841);
    int _1015 = _1013 + _999;
    int _1017 = ~_981;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = 1.0 / _995;
    float _1025 = float(uint(_1001));
    int _1027 = _1011 * int(_979);
    int _1029 = _1027 + _703;
    bool _1031 = !_691;
    int _1033 = _1031 ? _923 : (-1);
    int _1035 = _1015 * _1021;
    int _1037 = int(_847) + int(_935);
    float _1039 = in.m_65.x;
    float _1041 = in.m_65.y;
    float _1043 = in.m_65.z;
    float _1045 = in.m_65.w;
    float _1047 = float(uint(_1029));
    float _1049 = 1.0 / _1025;
    int _1051 = _1033 * _981;
    int _1053 = _1051 + _1035;
    float _1055 = in.m_67.x;
    float _1057 = in.m_67.y;
    float _1059 = in.m_67.z;
    float _1061 = in.m_67.w;
    int _1063 = _815 * _1037;
    int _1065 = _1063 + _801;
    float _1067 = as_type<float>(_491) * _1047;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1071 = _1069 != 0;
    float _1073 = in.m_69.x;
    float _1075 = in.m_69.y;
    float _1077 = in.m_69.z;
    float _1079 = in.m_69.w;
    float _1081 = float(uint(_1053));
    float _1083 = trunc(_1067);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    int _1089 = as_type<int>(_1023) + (-2);
    int _1091 = abs(_1053);
    bool _1093 = uint(_1065) >= uint(_266);
    float _1095 = as_type<float>(_1089) * _1081;
    float _1097 = float(uint(_1091));
    int _1099 = as_type<int>(_1049) + (-2);
    float _1101 = -_186;
    int _1103 = _857 ? as_type<int>(_1101) : as_type<int>(_186);
    float _1105 = trunc(_1095);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1121 = _1119 != 0;
    float _1123 = as_type<float>(_1099) * _1097;
    float _1125 = _1005 * _1041;
    bool _1127 = !_1093;
    int _1129 = _1127 ? 0 : (-1);
    float _1131 = _1005 * _1057;
    float _1133 = trunc(_1123);
    float _1135 = precise::max(_1133, 0.0);
    uint _1137 = uint(_1135);
    int _1139 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1141 = _1139 != 0;
    float _1143 = _1005 * _1075;
    int _1145 = ~_266;
    int _1147 = _1145 + 1;
    float _1149 = fma(_1003, _1055, _1131);
    int _1151 = int(_979) + int(_1087);
    float _1153 = fma(_1003, _1073, _1143);
    float _1155 = fma(_1003, _1039, _1125);
    int _1157 = ~_959;
    int _1159 = _1157 + 1;
    int _1161 = as_type<int>(_1123);
    float _1163 = as_type<float>(_1001);
    if (_443)
    {
        _1161 = 0;
    }
    int _1165 = _1161;
    int _1167 = _1147 * _1151;
    int _1169 = _1167 + _703;
    int _1171 = _1165;
    if (!_443)
    {
        _1171 = 1;
    }
    int _1173 = _1171;
    int _1175 = _1159 * int(_1109);
    int _1177 = _1175 + _1053;
    int _1179 = ~_1037;
    int _1181 = _1179 + _1129;
    int _1183 = _1181 + 1;
    int _1185 = ~int(_1137);
    int _1187 = _1185 + 1;
    bool _1189 = uint(_1169) >= uint(_266);
    float _1191 = float(uint(_1177));
    int _1193 = _266 * _1183;
    int _1195 = _1193 + _801;
    bool _1197 = !_1189;
    int _1199 = _1197 ? 0 : (-1);
    int _1201 = _1187 * _1001;
    int _1203 = _1201 + _1091;
    float _1205 = as_type<float>(_1089) * _1191;
    bool _1207 = !_687;
    int _1209 = _1207 ? _1195 : (-1);
    float _1211 = float(uint(_1203));
    float _1213 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1215 = _1209 >> 31;
    float _1217 = trunc(_1205);
    float _1219 = precise::max(_1217, 0.0);
    uint _1221 = uint(_1219);
    bool _1223 = !_1113;
    int _1225 = _1223 ? 0 : 1;
    float _1227 = as_type<float>(_1099) * _1211;
    int _1229 = _1209 & 3;
    bool _1231 = _1229 != 0;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1235 = _1209 & 3;
    bool _1237 = _1235 != 0;
    int _1239 = _1215 & 3;
    float _1241 = trunc(_1227);
    float _1243 = precise::max(_1241, 0.0);
    uint _1245 = uint(_1243);
    int _1247 = _1231 ? 0 : 1;
    float _1249 = -_1233;
    float _1251 = fma(_1213, 2.0, _1249);
    int _1253 = ~_1151;
    int _1255 = _1253 + _1199;
    int _1257 = _1255 + 1;
    bool _1259 = uint(_1235) > 1u;
    int _1261 = _1209 + _1239;
    int _1263 = _266 * _1257;
    int _1265 = _1263 + _703;
    int _1267 = int(_1109) + int(_1221);
    float _1269 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1271 = _1261 >> 2;
    bool _1273 = !_687;
    int _1275 = _1273 ? _1265 : (-1);
    int _1277 = _1271 << 4;
    int _1279 = _1277 + 512;
    bool _1281 = _1235 != 3;
    int _1283 = ~_1247;
    int _1285 = _1283 + 1;
    int _1287 = _1285 + 1;
    uint _1289 = uint(int(uint(_1279) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[int(_1299)][_1301];
    int _1305 = _1287;
    if (!_1259)
    {
        int _1307 = ~_1247;
        int _1309 = _1307 + 1;
        _1305 = _1309;
    }
    int _1311 = _1305;
    bool _1313 = uint(_1235) >= 2u;
    int _1315 = int(_1137) + int(_1245);
    int _1317 = _1313 ? 0 : 1;
    int _1319 = ~_1315;
    int _1321 = _1319 + 1;
    int _1323 = ~_1317;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = ~_959;
    int _1331 = _1329 + 1;
    int _1333 = _1321 * _1001;
    int _1335 = _1333 + _1091;
    int _1337 = _1327;
    float _1339 = as_type<float>(_1311);
    if (_1281)
    {
        int _1341 = ~_1317;
        int _1343 = _1341 + 1;
        _1337 = _1343;
    }
    int _1345 = _1337;
    int _1347 = _1279 + 8;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    int _1365 = _1331 * _1267;
    int _1367 = _1365 + _1053;
    bool _1369 = !_1237;
    int _1371 = _1369 ? 0 : 1;
    bool _1373 = _1173 != 1;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1377 = uint(_1367) >= uint(_959);
    float _1379 = fma(_1269, -2.0, _1375);
    bool _1381 = !_1377;
    int _1383 = _1381 ? 0 : (-1);
    bool _1385 = _1235 != 3;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1389 = ~_1267;
    int _1391 = _1389 + _1383;
    int _1393 = _1391 + 1;
    float _1395 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1379);
    bool _1397 = !_1385;
    int _1399 = _1397 ? 0 : (-1);
    float _1401 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1387);
    bool _1403 = uint(_1335) >= uint(_1001);
    int _1405 = _959 * _1393;
    int _1407 = _1405 + _1053;
    bool _1409 = _959 == 0;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1413 = int(_1411);
    bool _1415 = !_1403;
    int _1417 = _1415 ? 0 : (-1);
    float _1419 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1401);
    float _1421 = as_type<float>(_1367);
    if (!_1373)
    {
        _1421 = _301;
    }
    float _1423 = _1421;
    float _1425 = _1423;
    if (!_1373)
    {
        _1163 = _301;
    }
    float _1427 = _1163;
    float _1429 = -_1419;
    float _1431 = _1429 + 1.0;
    bool _1433 = _299 > 0.5;
    float _1435 = _1427;
    if (_1373)
    {
        _1425 = _299;
    }
    float _1437 = _1425;
    if (_1373)
    {
        _1435 = _299;
    }
    float _1439 = _1435;
    bool _1441 = !_1409;
    int _1443 = _1441 ? _1407 : (-1);
    float _1445 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1447 = abs(_1311);
    int _1449 = abs(_1371);
    int _1451 = ~_1447;
    int _1453 = _1451 + 1;
    int _1455 = _1453 + 1;
    int _1457 = ~_1449;
    int _1459 = _1457 + 1;
    int _1461 = _1459 + 1;
    int _1463 = _1455 * as_type<int>(_1303);
    float _1465 = fma(_1007, _1043, _1155);
    int _1467 = abs(_1345);
    int _1469 = _1461 * as_type<int>(_1295);
    int _1471 = _1469 + _1463;
    int _1473 = abs(_1399);
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1475;
    int _1479 = ~_1467;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    float _1485 = fma(_1007, _1059, _1149);
    float _1487 = fma(_1007, _1077, _1153);
    int _1489 = abs(_1225);
    int _1491 = _1483 * as_type<int>(_1355);
    int _1493 = _1491 + _1471;
    int _1495 = ~_1473;
    int _1497 = _1495 + 1;
    int _1499 = _1497 + 1;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1503 = abs(_1413);
    float _1505 = _1465 + _1045;
    bool _1507 = _303 > 0.5;
    int _1509 = _1499 * as_type<int>(_1363);
    int _1511 = _1509 + _1493;
    if (!_1373)
    {
        _1339 = _303;
    }
    float _1513 = _1339;
    float _1515 = _1485 + _1061;
    int _1517 = ~_1489;
    int _1519 = _1517 + 1;
    int _1521 = _1519 + 1;
    float _1523 = _1505 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1525 = _1513;
    if (_1373)
    {
        _477 = _301;
    }
    float _1527 = _477;
    if (_1373)
    {
        _1525 = _301;
    }
    float _1529 = _1525;
    bool _1531 = _301 > 0.5;
    float _1533 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1501);
    float _1535 = float(uint(_1503));
    float _1537 = 1.0 / _1477;
    float _1539 = float(uint(_1413));
    float _1541 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1533);
    float _1543 = -_1541;
    float _1545 = _1543 + 1.0;
    float _1547 = 1.0 / _1535;
    int _1549 = _1511 * _1521;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1553 = _216 + _1551;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1555;
    float _1559 = float(_1443);
    int _1561 = _1275 * _1489;
    int _1563 = _1561 + _1549;
    bool _1565 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1567 = isnan(_216);
    bool _1569 = _1565 || _1567;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1573 = _1569 || _1571;
    float _1575 = float(_1573);
    float _1577 = 1.0 / _1539;
    bool _1579 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1581 = isnan(_216);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1553 * _1537;
    int _1593 = abs(_1563);
    float _1595 = -_1575;
    float _1597 = _1595 + 1.0;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1599;
    float _1603 = fma(_1557, _1591, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1605 = _1589 * _1597;
    int _1607 = as_type<int>(_1547) + (-2);
    float _1609 = _1487 + _1079;
    float _1611 = float(uint(_1593));
    float _1613 = fma(_1601, _1591, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1615 = float(uint(_1563));
    float _1617 = _1603 * _1605;
    float _1619 = -_1589;
    float _1621 = _1619 + 1.0;
    float _1623 = as_type<float>(_1607) * _1611;
    int _1625 = as_type<int>(_1577) + (-2);
    float _1627 = _1613 * _1605;
    float _1629 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1617);
    float _1631 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1633 = as_type<float>(_1625) * _1615;
    float _1635 = fma(_1621, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1627);
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1641 = ~_1413;
    int _1643 = _1641 + 1;
    float _1645 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1635);
    float _1647 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1629);
    float _1649 = trunc(_1633);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = fma(_1529, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1639);
    float _1657 = _1515 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1659 = _1609 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1661 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1637);
    float _1663 = in.m_71.x;
    float _1665 = in.m_71.y;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1669 = trunc(_1623);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = _1053 ^ _959;
    int _1677 = ~_1417;
    int _1679 = _1315 + _1677;
    int _1681 = _1679 + 1;
    uint _1683 = uint(int(uint(_1675) >> uint(31)));
    bool _1685 = !_1071;
    float _1687 = _1685 ? _186 : as_type<float>(_1103);
    int _1689 = _1643 * int(_1653);
    int _1691 = _1689 + _1563;
    float _1693 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1697 = _1657 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    int _1699 = ~int(_1683);
    int _1701 = _1699 + 1;
    float _1703 = float(uint(_1691));
    float _1705 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1693);
    int _1707 = ~int(_1673);
    int _1709 = _1707 + 1;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1713 = as_type<float>(_1625) * _1703;
    float _1715 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1705);
    int _1717 = _1709 * _1503;
    int _1719 = _1717 + _1593;
    float _1721 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1667);
    float _1723 = fma(_1523, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1697);
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1727 = _1715 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1729 = float(uint(_1719));
    float _1731 = trunc(_1713);
    float _1733 = precise::max(_1731, 0.0);
    uint _1735 = uint(_1733);
    float _1737 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1721);
    float _1739 = _1727 * _1631;
    float _1741 = fma(_1659, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1723);
    float _1743 = as_type<float>(_1607) * _1729;
    float _1745 = _1737 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1747 = fma(_1739, 0.5, 0.5);
    float _1749 = -_1725;
    float _1751 = fma(_1445, 2.0, _1749);
    float _1753 = _1745 * _1695;
    float _1755 = trunc(_1743);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = _1741 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _1763 = ~_1413;
    int _1765 = _1763 + 1;
    float _1767 = _1647 * _1665;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1771 = _1761 * _1711;
    int _1773 = int(_1653) + int(_1735);
    float _1775 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1777 = _1645 * _1663;
    float _1779 = -_148;
    float _1781 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1251);
    float _1783 = -_148;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1751);
    int _1787 = _1765 * _1773;
    int _1789 = _1787 + _1563;
    float _1791 = fma(_1775, -2.0, _1769);
    float _1793 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1661);
    float _1795 = floor(_1747);
    float _1797 = -_182;
    int _1799 = _1433 ? as_type<int>(_1797) : as_type<int>(_182);
    float _1801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _182);
    int _1803 = int(_1673) + int(_1759);
    float _1805 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1655);
    float _1807 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1791);
    bool _1809 = uint(_1789) >= uint(_1413);
    float _1811 = _1777 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1815 = ~_1803;
    int _1817 = _1815 + 1;
    float _1819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _186);
    bool _1821 = !_1809;
    int _1823 = _1821 ? 0 : (-1);
    float _1825 = _1811 * _1801;
    float _1827 = _1767 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1829 = _1817 * _1503;
    int _1831 = _1829 + _1593;
    int _1833 = ~_1773;
    int _1835 = _1833 + _1823;
    int _1837 = _1835 + 1;
    float _1839 = -_1795;
    float _1841 = _1747 + _1839;
    float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1845 = !_1141;
    float _1847 = _1845 ? _182 : as_type<float>(_1799);
    float _1849 = _1827 * _1819;
    bool _1851 = uint(_1831) >= uint(_1503);
    int _1853 = _1413 * _1837;
    int _1855 = _1853 + _1563;
    int _1857 = _1563 ^ _1413;
    float _1859 = fma(_1753, 0.5, 0.5);
    float _1861 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1863 = !_1851;
    int _1865 = _1863 ? 0 : (-1);
    float _1867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1869 = _1413 == 0;
    float _1871 = fma(_1861, _1559, _1781);
    uint _1873 = uint(int(uint(_1857) >> uint(31)));
    float _1875 = fma(_1771, 0.5, 0.5);
    bool _1877 = _959 == 0;
    float _1879 = -_1793;
    float _1881 = _1879 + 1.0;
    bool _1883 = !_1869;
    int _1885 = _1883 ? _1855 : (-1);
    float _1887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1889 = ~_1865;
    int _1891 = _1803 + _1889;
    int _1893 = _1891 + 1;
    float _1895 = _1687 + (-0.5);
    int _1897 = ~int(_1873);
    int _1899 = _1897 + 1;
    float _1901 = _1847 + 0.5;
    bool _1903 = _1413 == 0;
    float _1905 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1907 = float(_1885);
    float _1909 = fma(_1861, _1901, _1871);
    int _1911 = _1893 ^ _1899;
    float _1913 = floor(_1859);
    int _1915 = _1681 ^ _1701;
    float _1917 = fma(_1905, _1907, _1785);
    int _1919 = ~_1899;
    int _1921 = _1919 + _1911;
    int _1923 = _1921 + 1;
    float _1925 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1927 = ~_1701;
    int _1929 = _1927 + _1915;
    int _1931 = _1929 + 1;
    float _1933 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1935 = !_1903;
    int _1937 = _1935 ? _1923 : (-1);
    float _1939 = floor(_1875);
    bool _1941 = !_1877;
    int _1943 = _1941 ? _1931 : (-1);
    float _1945 = -_1805;
    float _1947 = _1945 + 1.0;
    float _1949 = -_182;
    int _1951 = _1507 ? as_type<int>(_1949) : as_type<int>(_182);
    float _1953 = -_1431;
    float _1955 = fma(_1847, _1953, _1909);
    float _1957 = -_186;
    int _1959 = _1531 ? as_type<int>(_1957) : as_type<int>(_186);
    float _1961 = float(_1937);
    float _1963 = -_1913;
    float _1965 = _1859 + _1963;
    float _1967 = float(_1943);
    bool _1969 = !_1121;
    float _1971 = _1969 ? _182 : as_type<float>(_1951);
    float _1973 = -_1807;
    float _1975 = fma(_1933, _1961, _1973);
    bool _1977 = !_1117;
    float _1979 = _1977 ? _186 : as_type<float>(_1959);
    float _1981 = -_1395;
    float _1983 = fma(_1925, _1967, _1981);
    float _1985 = _186 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1987 = _1971 + 0.5;
    float _1989 = -_1939;
    float _1991 = _1875 + _1989;
    float _1993 = _1979 + (-0.5);
    float _1995 = fma(_1905, _1987, _1917);
    float _1997 = -_1925;
    float _1999 = fma(_1997, _1993, _1983);
    bool _2001 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(1.0);
    bool _2009 = _2005 || _2007;
    float _2011 = -_1881;
    float _2013 = fma(_1971, _2011, _1995);
    float _2015 = -_1933;
    float _2017 = fma(_2015, _1895, _1975);
    float _2019 = fma(_1979, _1545, _1999);
    float _2021 = fma(_1985, _1985, 1.0);
    float _2023 = fma(_1965, 2.0, -1.0);
    float _2025 = fma(_1991, 2.0, -1.0);
    float _2027 = fma(_1841, 2.0, -1.0);
    float _2029 = rsqrt(_2021);
    float _2031 = _2023 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _2033 = fma(_1687, _1947, _2017);
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _2037 = _182 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2041 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2045 = _2025 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2047 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2039);
    float _2049 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2041);
    float _2051 = fma(_2035, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2043);
    out.m_73.x = _1955;
    out.m_73.y = _2019;
    out.m_73.z = _2013;
    out.m_73.w = _2033;
    float _2053 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2047);
    float _2055 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2051);
    float _2057 = _1985 * _2029;
    float _2059 = _2053 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2061 = _2055 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2063 = fma(_2045, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2049);
    float _2065 = _2063 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2067 = as_type<float>(_1701);
    float _2069 = as_type<float>(_1701);
    float _2071 = _2027;
    float _2073 = _2023;
    float _2075 = _2035;
    float _2077 = _2025;
    float _2079 = _2021;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c12)._m0[10].x);
    float _2083 = _2051;
    float _2085 = _1813;
    float _2087 = _1825;
    float _2095;
    if (!_2009)
    {
        bool _2089 = _2065 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2091 = !_2089;
        _2093 = _2091;
        if (!_2093)
        {
            _2095 = 0.0;
            _2097 = true;
        }
    }
    if ((!_2097) || _2093)
    {
        bool _2121;
        if (!_2093)
        {
            bool _2099 = _2065 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2101 = isnan(_2065);
            bool _2103 = _2099 || _2101;
            bool _2105 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2107 = _2103 || _2105;
            bool _2109 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2111 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2113 = !_2107;
            bool _2115 = _2111 && _2113;
            if (_2115)
            {
                _2067 = 0.0;
            }
            float _2117 = _2067;
            bool _2119 = !_2107;
            _2121 = _2119 && _2109;
            _2069 = _2117;
            _2095 = _2117;
        }
        if ((!_2121) || _2093)
        {
            _2093 = false;
            float _2123 = _2069;
            bool _2125 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2127 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2129 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2131 = _2019;
            float _2133 = _2123;
            if (_2125)
            {
                float _2135 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2131 = _2135;
            }
            float _2137 = _2131;
            if (_2125)
            {
                float _2139 = abs(_2027);
                float _2141 = -_2139;
                float _2143 = _2141 + 1.0;
                _2071 = _2143;
            }
            float _2145 = _2071;
            if (_2127)
            {
                float _2147 = abs(_2023);
                float _2149 = -_2147;
                float _2151 = _2149 + 1.0;
                _2073 = _2151;
            }
            float _2153 = _2073;
            if (!_2125)
            {
                _2075 = 1.0;
            }
            float _2155 = _2075;
            float _2157 = _2155;
            if (_2129)
            {
                float _2159 = abs(_2025);
                float _2161 = -_2159;
                float _2163 = _2161 + 1.0;
                _2077 = _2163;
            }
            float _2165 = _2077;
            if (!_2127)
            {
                _2079 = 1.0;
            }
            float _2167 = _2079;
            float _2169 = _2167;
            if (!_2129)
            {
                _2133 = 1.0;
            }
            float _2171 = _2133;
            float _2173 = _2045;
            float _2175 = _2171;
            if (_2127)
            {
                float _2177 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2173 = _2177;
            }
            float _2179 = _2173;
            float _2181 = _1955;
            if (_2129)
            {
                float _2183 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2181 = _2183;
            }
            float _2185 = _2181;
            if (_2125)
            {
                float _2187 = _2145 * _2137;
                float _2189 = precise::clamp(_2187, 0.0, 1.0);
                _2157 = _2189;
            }
            float _2191 = _2157;
            if (_2127)
            {
                float _2193 = _2153 * _2179;
                float _2195 = precise::clamp(_2193, 0.0, 1.0);
                _2169 = _2195;
            }
            float _2197 = _2169;
            float _2199 = _2191 * _2197;
            if (_2129)
            {
                float _2201 = _2165 * _2185;
                float _2203 = precise::clamp(_2201, 0.0, 1.0);
                _2175 = _2203;
            }
            float _2205 = _2175;
            float _2207 = _2199 * _2205;
            _2095 = _2207;
        }
    }
    _2097 = false;
    float _2209 = _2095;
    float _2211 = _2065 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2213 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2215 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2217 = fma(_2059, 6.2500002968590706586837768554688e-05, 0.5);
    float _2219 = fma(_2061, 6.2500002968590706586837768554688e-05, 0.5);
    float _2221 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2213);
    float _2223 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2215);
    float _2225 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2221);
    float _2227 = fma(_2061, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2223);
    float _2229 = _2225 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2231 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2233 = trunc(_2229);
    int _2235 = int(_2233);
    float _2237 = trunc(_2231);
    int _2239 = int(_2237);
    int _2241 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2243 = _2235 + _2241;
    int _2245 = _2243 + 1;
    bool _2247 = _2245 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2249 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2251 = _2239 + _2249;
    int _2253 = _2251 + 1;
    int _2255 = _2245 | _2253;
    bool _2257 = _2255 < 0;
    bool _2259 = _2257 || _2247;
    bool _2261 = _2253 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2263 = _2261 || _2259;
    int _2265 = _2253;
    int _2267 = _2245;
    if (!_2263)
    {
        int _2269 = _2253 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2271 = _2269 + _2245;
        _2081 = _2271;
    }
    int _2273 = _2081;
    float _2275 = as_type<float>(_2255);
    if (!_2263)
    {
        float _2277 = floor(_2231);
        _2275 = _2277;
    }
    float _2279 = _2275;
    if (!_2263)
    {
        int _2281 = _2273 << 2;
        _2265 = _2281;
    }
    int _2283 = _2265;
    int _2285 = _2283;
    if (!_2263)
    {
        uint _2287 = uint(int(uint(_2273) >> uint(2)));
        _2267 = int(_2287);
    }
    int _2289 = _2267;
    if (!_2263)
    {
        int _2291 = 12 & _2283;
        _2285 = _2291;
    }
    int _2293 = _2285;
    float _2295 = as_type<float>(_2293);
    if (!_2263)
    {
        int _2297 = _2289 << 4;
        int _2299 = _2297 + _2293;
        _2295 = as_type<float>(_2299);
    }
    float _2301 = _2295;
    float _2303 = as_type<float>(_2289);
    if (!_2263)
    {
        float _2305 = floor(_2229);
        _2303 = _2305;
    }
    float _2307 = _2303;
    if (!_2263)
    {
        float _2309 = -_2279;
        float _2311 = _2231 + _2309;
        _2083 = _2311;
    }
    float _2313 = _2083;
    float _2315 = _2301;
    if (!_2263)
    {
        int _2317 = as_type<int>(_2301) + 400;
        uint _2319 = uint(int(uint(_2317) >> uint(2)));
        uint _2321 = uint(int(uint(int(_2319)) >> uint(2)));
        int _2323 = int(_2319) & 3;
        float _2325 = (*spvDescriptorSet0.vp_c15)._m0[int(_2321)][_2323];
        _2315 = _2325;
    }
    float _2327 = _2315;
    float2 _7201 = float2(_2217, _2219);
    float _2329 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_7201, float2(0.0), isnan(_7201)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_7201, float2(0.0), isnan(_7201)), level(0.0)).x;
    if (!_2263)
    {
        float _2331 = -_2307;
        float _2333 = _2229 + _2331;
        _2085 = _2333;
    }
    float _2335 = _2085;
    float _2337 = as_type<float>(_1799);
    if (!_2263)
    {
        float _2339 = rint(_2327);
        float _2341 = precise::max(_2339, 0.0);
        uint _2343 = uint(_2341);
        uint _2345 = clamp(_2343, 0u, 65535u);
        _2337 = as_type<float>(_2345);
    }
    float _2347 = _2337;
    float _2349 = _2313;
    if (!_2263)
    {
        float3 _7248 = float3(_2335, _2313, float(as_type<int>(_2347)));
        float3 _7252 = select(_7248, float3(0.0), isnan(_7248));
        float _2351 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7252.xy, uint(rint(_7252.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7252.xy, uint(rint(_7252.z)), level(0.0)).x;
        _2349 = _2351;
    }
    float _2353 = _2349;
    float _2355 = -_2065;
    float _2357 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2359 = -_2059;
    float _2361 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2363 = -_2061;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2375 = rsqrt(_2371);
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2381 = -_2373;
    float _2383 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2381);
    float _2385 = -_2377;
    float _2387 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2385);
    float _2389 = -_2379;
    float _2391 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2389);
    float _2393 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2397 = -_2393;
    float _2399 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2397);
    float _2401 = _2361 * _2375;
    float _2403 = _2365 * _2375;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2407 = _2357 * _2375;
    float _2409 = _2401 * _2401;
    float _2411 = fma(_2403, _2403, _2409);
    float _2413 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2415 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2417 = rsqrt(_2411);
    float _2419 = -_2413;
    float _2421 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2419);
    float _2423 = -_2415;
    float _2425 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2423);
    float _2427 = -_2405;
    float _2429 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2427);
    float _2431 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2433 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2435 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2429);
    float _2437 = -_2431;
    float _2439 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2437);
    float _2441 = -_2433;
    float _2443 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2441);
    float _2445 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2439);
    float _2447 = _2403 * _2417;
    float _2449 = _2401 * _2417;
    float _2451 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2443);
    float _2453 = -_2447;
    float _2455 = _2403 * _2453;
    float _2457 = -_2447;
    float _2459 = _2407 * _2457;
    float _2461 = _2451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2463 = -_2455;
    float _2465 = fma(_2401, _2449, _2463);
    float _2467 = _2407 * _2449;
    float _2469 = -_2461;
    float _2471 = fma(_2435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2469);
    float _2473 = -_2395;
    float _2475 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2473);
    float _2477 = _2465 * _2465;
    float _2479 = fma(_2445, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2471);
    float _2481 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2475);
    float _2483 = fma(_2467, _2467, _2477);
    float _2485 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2487 = -_2481;
    float _2489 = fma(_2487, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2479);
    float _2491 = fma(_2459, _2459, _2483);
    float _2493 = -_2485;
    float _2495 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2493);
    float _2497 = _2399 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2499 = 1.0 / _2489;
    float _2501 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2495);
    float _2503 = -_2497;
    float _2505 = fma(_2421, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2503);
    float _2507 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2505);
    float _2509 = rsqrt(_2491);
    float _2511 = fma(_2501, _2499, -1.0);
    float _2513 = _2465 * _2509;
    float _2515 = precise::clamp(_2513, 0.0, 1.0);
    float _2517 = _2425 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2519 = -_2515;
    float _2521 = _2519 + 1.0;
    float _2523 = -_2517;
    float _2525 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2523);
    float _2527 = _2521 * _2499;
    float _2529 = fma(_2521, _2511, 1.0);
    float _2531 = fma(_2391, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2525);
    float _2533 = _2507 * _2527;
    float _2535 = _2529 * _2529;
    float _2537 = _2531 * _2527;
    float _2539 = fma(_2533, _2533, _2535);
    float _2541 = fma(_2537, _2537, _2539);
    float _2543 = rsqrt(_2541);
    float _2545 = _2537 * _2543;
    float _2547 = _2529 * _2543;
    float _2549 = _2533 * _2543;
    float _2551 = -_2545;
    float _2553 = _2401 * _2551;
    float _2555 = _2403 * _2547;
    float _2557 = -_2549;
    float _2559 = _2407 * _2557;
    float _2561 = -_2549;
    float _2563 = -_2553;
    float _2565 = fma(_2403, _2561, _2563);
    float _2567 = -_2545;
    float _2569 = -_2555;
    float _2571 = fma(_2407, _2567, _2569);
    float _2573 = -_2559;
    float _2575 = fma(_2401, _2547, _2573);
    float _2577 = _2565 * _2565;
    float _2579 = fma(_2571, _2571, _2577);
    float _2581 = fma(_2575, _2575, _2579);
    float _2583 = rsqrt(_2581);
    float _2585 = _2571 * _2583;
    float _2587 = _2575 * _2583;
    float _2589 = _2565 * _2583;
    float _2591 = _2403 * _2585;
    float _2593 = _2407 * _2587;
    float _2595 = -_2591;
    float _2597 = fma(_2401, _2587, _2595);
    float _2599 = -_2593;
    float _2601 = fma(_2403, _2589, _2599);
    float _2603 = _2401 * _2589;
    float _2605 = _2597 * _2597;
    float _2607 = -_2603;
    float _2609 = fma(_2407, _2585, _2607);
    float _2611 = fma(_2601, _2601, _2605);
    float _2613 = fma(_2609, _2609, _2611);
    float _2615 = rsqrt(_2613);
    float _2617 = _2609 * _2615;
    float _2619 = _2601 * _2615;
    float _2621 = _2597 * _2615;
    float _2623 = _2401 * _2617;
    float _2625 = _2407 * _2619;
    float _2627 = _2403 * _2621;
    float _2629 = _1849 * _2617;
    float _2631 = -_2623;
    float _2633 = fma(_2403, _2619, _2631);
    float _2635 = -_2625;
    float _2637 = fma(_2401, _2621, _2635);
    float _2639 = -_2627;
    float _2641 = fma(_2407, _2617, _2639);
    float _2643 = _2633 * _2633;
    float _2645 = fma(_2641, _2641, _2643);
    float _2647 = fma(_2637, _2637, _2645);
    float _2649 = rsqrt(_2647);
    float _2651 = _2637 * _2649;
    float _2653 = _1849 * _2619;
    float _2655 = _2641 * _2649;
    float _2657 = _2633 * _2649;
    float _2659 = fma(_1825, _2651, _2629);
    float _2661 = _1849 * _2621;
    float _2663 = fma(_1825, _2655, _2653);
    float _2665 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2667 = _2061 + _2659;
    float _2669 = _2059 + _2663;
    float _2671 = fma(_1825, _2657, _2661);
    float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2675 = _2667 + _2673;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2689 = _2669 + _2687;
    float _2691 = _2065 + _2671;
    float _2693 = _2675 * _2675;
    float _2695 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2665);
    float _2697 = fma(_2689, _2689, _2693);
    float _2699 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2695);
    float _2701 = sqrt(_2697);
    bool _2703 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2705 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(0.5);
    bool _2711 = _2707 || _2709;
    float _2713 = _2065 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2715 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2713);
    float _2717 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2715);
    bool _2719 = _2701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2721 = _2671;
    float _2723 = _2715;
    float _2725 = _2689;
    if (!_2719)
    {
        _2721 = _2669;
    }
    float _2727 = _2721;
    float _2729 = _2727;
    if (!_2719)
    {
        _2723 = _2667;
    }
    float _2731 = _2723;
    float _2733 = _2731;
    if (!_2719)
    {
        _2087 = _2691;
    }
    float _2735 = _2087;
    bool _2737 = !_2719;
    float _2739 = _2735;
    float _2741 = _2329;
    if (!_2737)
    {
        float _2743 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2747 = _2701 + _2745;
        float _2749 = rsqrt(_2697);
        float _2751 = _2747 * _2743;
        float _2753 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2755 = _2751 * 0.15915493667125701904296875;
        float _2757 = _2755 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2755 * 6.283185482025146484375;
        float _2763 = sin(_2761);
        float _2765 = _2759 + (-1.0);
        float _2767 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = fma(_2763, _2753, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2771 = fma(_2691, _2759, _2767);
        float _2773 = _2749 * _2769;
        float _2775 = fma(_2689, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2777 = fma(_2675, _2773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2729 = _2775;
        _2733 = _2777;
        _2739 = _2771;
    }
    float _2779 = _2729;
    float _2781 = _2733;
    float _2783 = _2739;
    float _2785 = _2717 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2787 = _2699 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2789 = _2783;
    float _2791 = _2779;
    float _2793 = _2781;
    if (!_2711)
    {
        float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2797 = _2065 + _2795;
        float _2799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2801 = _2059 + _2799;
        float _2803 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2805 = -_2059;
        float _2807 = _2805 + _2779;
        float _2809 = _2797 * _2797;
        float _2811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2813 = _2061 + _2811;
        float _2815 = -_2061;
        float _2817 = _2815 + _2781;
        float _2819 = fma(_2801, _2801, _2809);
        float _2821 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2823 = fma(_2813, _2813, _2819);
        float _2825 = sqrt(_2823);
        float _2827 = _2803 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2829 = precise::min(_2825, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2831 = _2829 * _2821;
        float _2833 = -_2065;
        float _2835 = _2833 + _2783;
        float _2837 = _2827 * _2831;
        float _2839 = fma(_2835, _2837, _2065);
        float _2841 = fma(_2807, _2837, _2059);
        float _2843 = fma(_2817, _2837, _2061);
        _2789 = _2839;
        _2791 = _2841;
        _2793 = _2843;
    }
    float _2845 = _2789;
    float _2847 = _2791;
    float _2849 = _2793;
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2853 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2855 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2857 = _2785 + _2787;
    float _2859 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2851);
    float _2861 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2853);
    float _2863 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2865 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2855);
    float _2867 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2859);
    float _2869 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2861);
    float _2871 = 1.0 / _2787;
    float _2873 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2863);
    float _2875 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2877 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2865);
    float _2879 = _2869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2881 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2873);
    float _2883 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2885 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2889 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2891 = _2877 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2893 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2883);
    float _2895 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2885);
    float _2897 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2889);
    float _2899 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2887);
    float _2901 = _2881 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2903 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2893);
    float _2905 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2895);
    float _2907 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2897);
    float _2909 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2899);
    float _2911 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2903);
    float _2913 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2905);
    float _2915 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2907);
    float _2917 = _2857 * _2871;
    float _2919 = _2917 * 0.5;
    float _2921 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2909);
    float _2923 = _2879;
    float _2925 = _2897;
    float _2927 = _2919;
    float _2929 = _2913;
    float _2931 = _2911;
    int _2933 = as_type<int>(_2915);
    float _2935 = _2921;
    if (_2685)
    {
        _2923 = 1.0;
    }
    float _2937 = _2923;
    float _2939 = _2937;
    if (!_2685)
    {
        float _2941 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2943 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2945 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2943);
        float _2947 = _2941 * 0.15915493667125701904296875;
        float _2949 = _2947 * 6.283185482025146484375;
        float _2951 = cos(_2949);
        float _2953 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2955 = _2953 * 0.15915493667125701904296875;
        float _2957 = _2947 * 6.283185482025146484375;
        float _2959 = sin(_2957);
        float _2961 = 1.0 / _2951;
        float _2963 = _2955 * 6.283185482025146484375;
        float _2965 = cos(_2963);
        float _2967 = _2959 * _2961;
        float _2969 = 1.0 / _2945;
        float _2971 = _2965 * _2967;
        float _2973 = _2955 * 6.283185482025146484375;
        float _2975 = sin(_2973);
        float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2977;
        float _2981 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2983 = _2969 * _2981;
        float _2985 = 1.0 / _2971;
        float _2987 = 1.0 / _2979;
        float _2989 = _2975 * _2985;
        float _2991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2993 = fma(_2989, _2983, _2991);
        float _2995 = _2993 * _2987;
        float _2997 = precise::clamp(_2995, 0.0, 1.0);
        _2725 = _2961;
        _2925 = _2983;
        _2927 = _2979;
        _2939 = _2997;
    }
    float _2999 = _2725;
    float _3001 = _2925;
    float _3003 = _2927;
    float _3005 = _2939;
    out.gl_Position.x = _2911;
    out.gl_Position.y = _2913;
    out.gl_Position.z = _2915;
    out.gl_Position.w = _2921;
    float _3007 = abs(_2329);
    bool _3009 = _3007 != 0.0;
    bool _3011 = isnan(_3007);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(0.0);
    bool _3017 = _3013 || _3015;
    float _3019 = _3003;
    float _3021 = _3001;
    float _3023 = _2999;
    if (_2685)
    {
        _3019 = 1.0;
    }
    float _3025 = _3019;
    float _3027 = _3025;
    if (_3017)
    {
        _2741 = _2921;
    }
    float _3029 = _2741;
    float _3031 = _3029;
    if (!_3017)
    {
        _3031 = 0.0;
    }
    float _3033 = _3031;
    float _3035 = _3033;
    if (!_2685)
    {
        float _3037 = as_type<float>(in.m_77.w);
        int _3039 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _3041 = _3039 == 4;
        bool _3043 = _3039 == 8;
        bool _3045 = _3039 == 12;
        int _3047 = as_type<int>(_3037) << 16;
        int _3049 = as_type<int>(_3037) << 8;
        int _3051 = as_type<int>(_3037) << 24;
        int _3053 = _3047 >> 24;
        int _3055 = _3049 >> 24;
        int _3057 = as_type<int>(_3037) >> 24;
        int _3059 = _3051 >> 24;
        float _3061 = float(_3053);
        float _3063 = float(_3055);
        float _3065 = float(_3057);
        float _3067 = _3061 * 0.0078740157186985015869140625;
        float _3069 = float(_3059);
        float _3071 = _3063 * 0.0078740157186985015869140625;
        float _3073 = _3065 * 0.0078740157186985015869140625;
        float _3075 = precise::min(_3067, 1.0);
        float _3077 = _3069 * 0.0078740157186985015869140625;
        float _3079 = precise::min(_3071, 1.0);
        float _3081 = precise::min(_3073, 1.0);
        float _3083 = precise::min(_3077, 1.0);
        float _3085 = precise::max(_3075, -1.0);
        float _3087 = precise::max(_3079, -1.0);
        float _3089 = precise::max(_3081, -1.0);
        float _3091 = precise::max(_3083, -1.0);
        float _3093 = _3091;
        _3021 = _3087;
        _3023 = _3089;
        if (_3041)
        {
            _3093 = _3085;
        }
        float _3095 = _3093;
        float _3097 = _3095;
        if (_3043)
        {
            _3097 = _3087;
        }
        float _3099 = _3097;
        float _3101 = _3099;
        if (_3045)
        {
            _3101 = _3089;
        }
        float _3103 = _3101;
        float _3105 = abs(_3103);
        float _3107 = (-0.0) + _3105;
        _3027 = _3107;
    }
    float _3109 = _3021;
    float _3111 = _3023;
    float _3113 = _3027;
    float _3115 = _3111;
    float _3117 = _3109;
    if (!_3017)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_2263)
    {
        int _3119 = _2273 << 4;
        int _3121 = _3119 + 2048;
        uint _3123 = uint(int(uint(_3121) >> uint(2)));
        uint _3125 = uint(int(uint(int(_3123)) >> uint(2)));
        int _3127 = int(_3123) & 3;
        float _3129 = (*spvDescriptorSet0.vp_c15)._m0[int(_3125)][_3127];
        int _3131 = int(_3123) + 1;
        uint _3133 = uint(int(uint(_3131) >> uint(2)));
        int _3135 = _3131 & 3;
        float _3137 = (*spvDescriptorSet0.vp_c15)._m0[int(_3133)][_3135];
        int _3139 = _3121 + 8;
        uint _3141 = uint(int(uint(_3139) >> uint(2)));
        uint _3143 = uint(int(uint(int(_3141)) >> uint(2)));
        int _3145 = int(_3141) & 3;
        float _3147 = (*spvDescriptorSet0.vp_c15)._m0[int(_3143)][_3145];
        int _3149 = int(_3141) + 1;
        uint _3151 = uint(int(uint(_3149) >> uint(2)));
        int _3153 = _3149 & 3;
        float _3155 = (*spvDescriptorSet0.vp_c15)._m0[int(_3151)][_3153];
        float _3157 = _2211 * _3137;
        float _3159 = fma(_2059, _3129, _3157);
        float _3161 = fma(_2061, _3147, _3159);
        float _3163 = _3161 + _3155;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        float _3167 = -_3165;
        float _3169 = _3167 + _2353;
        float _3171 = fma(_3169, 500.0, 1.5);
        float _3173 = exp2(_3171);
        float _3175 = 0.0 + _3173;
        float _3177 = precise::clamp(_3175, 0.0, 1.0);
        bool _3179 = _3177 >= 1.0;
        bool _3181 = isnan(_3177);
        bool _3183 = _3179 || _3181;
        bool _3185 = isnan(1.0);
        bool _3187 = _3183 || _3185;
        _3115 = _3165;
        _3117 = _3147;
        if (!_3187)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_3187)
        {
            _3035 = 0.0;
        }
    }
    float _3189 = _3115;
    float _3191 = _3117;
    float _3193 = _3035;
    float _3195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3197 = _2845 + _3195;
    float _3199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3201 = _2847 + _3199;
    float _3203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3205 = _2849 + _3203;
    float _3207 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3209 = _3197 * _3197;
    float _3211 = fma(_3201, _3201, _3209);
    float _3213 = fma(_3205, _3205, _3211);
    float _3215 = rsqrt(_3213);
    float _3217 = sqrt(_3213);
    float _3219 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3221 = _3201 * _3219;
    float _3223 = _3205 * _3219;
    float _3225 = _3221 * _3221;
    float _3227 = _3223 * _3223;
    float _3229 = _3225 + _3227;
    float _3231 = sqrt(_3229);
    bool _3233 = _3231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3237 = _3231 + _3235;
    float _3239 = _3215;
    float _3241 = _3229;
    float _3243 = _3237;
    float _3245 = _3189;
    float _3247 = _3197;
    float _3249 = _3191;
    if (_3233)
    {
        float _3251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3239 = _3251;
    }
    float _3253 = _3239;
    if (_3233)
    {
        float _3255 = rsqrt(_3229);
        _3241 = _3255;
    }
    float _3257 = _3241;
    float _3259 = _3257;
    if (_3233)
    {
        float _3261 = _3237 * _3253;
        _3243 = _3261;
    }
    float _3263 = _3243;
    if (_3233)
    {
        float _3265 = _3263 * 0.15915493667125701904296875;
        _3245 = _3265;
    }
    float _3267 = _3245;
    float _3269 = _3205;
    if (_3233)
    {
        float _3271 = _3267 * 6.283185482025146484375;
        float _3273 = sin(_3271);
        _3269 = _3273;
    }
    float _3275 = _3269;
    float _3277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3279 = precise::max(0.0, _3277);
    float _3281 = _3253;
    float _3283 = _3279;
    if (_3233)
    {
        float _3285 = _3267 * 6.283185482025146484375;
        float _3287 = cos(_3285);
        _3281 = _3287;
    }
    float _3289 = _3281;
    float _3291 = -_3219;
    float _3293 = -_3279;
    float _3295 = fma(_3197, _3291, _3293);
    if (_3233)
    {
        float _3297 = _3295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3247 = _3297;
    }
    float _3299 = _3247;
    float _3301 = _3275;
    float _3303 = _3299;
    if (_3233)
    {
        float _3305 = fma(_3275, _3299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3249 = _3305;
    }
    float _3307 = _3249;
    float _3309 = _3307;
    if (!_3233)
    {
        _3301 = _3221;
    }
    float _3311 = _3301;
    float _3313 = _3311;
    if (!_3233)
    {
        _3303 = _3295;
    }
    float _3315 = _3303;
    float _3317 = _3315;
    float _3319 = _3289;
    if (_3233)
    {
        float _3321 = _3289 + (-1.0);
        _3283 = _3321;
    }
    float _3323 = _3283;
    float _3325 = _3323;
    if (_3233)
    {
        float _3327 = _3257 * _3307;
        _3309 = _3327;
    }
    float _3329 = _3309;
    if (!_3233)
    {
        _3259 = _3225;
    }
    float _3331 = _3259;
    float _3333 = _3331;
    if (_3233)
    {
        float _3335 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3325 = _3335;
    }
    float _3337 = _3325;
    float _3339 = _3337;
    if (_3233)
    {
        float _3341 = _3221 * _3329;
        _3313 = _3341;
    }
    float _3343 = _3313;
    if (_3233)
    {
        float _3345 = fma(_3295, _3289, _3337);
        _3317 = _3345;
    }
    float _3347 = _3317;
    if (!_3233)
    {
        _3339 = _3223;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3233)
    {
        float _3353 = _3223 * _3329;
        _3351 = _3353;
    }
    float _3355 = _3351;
    if (_3233)
    {
        float _3357 = _3343 * _3343;
        _3333 = _3357;
    }
    float _3359 = _3333;
    if (!_3233)
    {
        _3319 = _3227;
    }
    float _3361 = _3319;
    float _3363 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3365 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3363);
    float _3367 = precise::clamp(_3365, 0.0, 1.0);
    float _3369 = _3361;
    if (_3233)
    {
        float _3371 = _3355 * _3355;
        _3369 = _3371;
    }
    float _3373 = _3369;
    float _3375 = fma(_3347, _3347, _3359);
    bool _3377 = _3113 != 0.0;
    bool _3379 = isnan(_3113);
    bool _3381 = _3377 || _3379;
    bool _3383 = isnan(0.0);
    bool _3385 = _3381 || _3383;
    float _3387 = -_3367;
    float _3389 = _3387 + 1.0;
    float _3391 = 1.0 / _3193;
    float _3393 = _3375 + _3373;
    float _3395 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3397 = rsqrt(_3393);
    float _3399 = -_3207;
    float _3401 = fma(_3399, _3395, 1.0);
    if (!_3385)
    {
        _2929 = 0.0;
        _2931 = 0.0;
    }
    float _3403 = _2929;
    float _3405 = _2931;
    float _3407 = abs(_3389);
    float _3409 = log2(_3407);
    float _3411 = _3391 * _3403;
    float _3413 = fma(_3411, -0.5, 0.5);
    float _3415 = _3397 * _3343;
    float _3417 = _3397 * _3347;
    float _3419 = _3397 * _3355;
    float _3421 = log2(_3401);
    float _3423 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3425 = _3417 + 1.0;
    float _3427 = -_3423;
    float _3429 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3427);
    float _3431 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3433 = -_3419;
    float _3435 = fma(_3433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3429);
    float _3437 = exp2(_3431);
    float _3439 = fma(_3435, -0.5, 0.5);
    float _3441 = fma(_3435, 0.5, 0.5);
    float _3443 = _3391 * _3405;
    float _3445 = _3421 * 0.693147182464599609375;
    float _3447 = fma(_3441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3449 = fma(_3443, 0.5, 0.5);
    float _3451 = sqrt(_3439);
    float _3453 = _3445 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3455 = fma(_3441, _3447, -0.212114393711090087890625);
    float _3457 = fma(_3441, _3455, 1.570728778839111328125);
    float _3459 = -_3417;
    float _3461 = fma(_3437, _3425, _3459);
    float _3463 = fma(_3461, 0.5, 0.5);
    float _3465 = _3451 * 0.636619746685028076171875;
    float _3467 = -_3457;
    float _3469 = fma(_3465, _3467, 1.0);
    float3 _9012 = float3(_3449, _3413, _3453);
    float _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9012, float3(0.0), isnan(_9012)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9012, float3(0.0), isnan(_9012)), level(0.0)).x;
    float3 _9021 = float3(_3449, _3413, _3453);
    float4 _3474 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9021, float3(0.0), isnan(_9021)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9021, float3(0.0), isnan(_9021)), level(0.0)).xyzw;
    float _3476 = _3474.x;
    float _3478 = _3474.y;
    float _3480 = _3474.z;
    float _3482 = _3474.w;
    float2 _9037 = float2(_3469, _3463);
    float3 _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9037, float2(0.0), isnan(_9037)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9037, float2(0.0), isnan(_9037)), level(0.0)).xyz;
    float _3488 = _3486.x;
    float _3490 = _3486.y;
    float _3492 = _3486.z;
    float _3494 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3496 = -_2401;
    float _3498 = _2057 * _3496;
    float _3500 = -_2407;
    float _3502 = _2057 * _3500;
    float _3504 = -_2403;
    float _3506 = _2057 * _3504;
    out.m_79.x = _2655;
    out.m_79.y = _2657;
    out.m_79.z = _2651;
    float _3508 = fma(_2029, _2619, _3498);
    float _3510 = exp2(_3494);
    float _3512 = fma(_2029, _2621, _3502);
    float _3514 = fma(_2029, _2617, _3506);
    float _3516 = _1985 * _2617;
    float _3518 = _1985 * _2619;
    float _3520 = _1985 * _2621;
    out.m_81.x = _3508;
    out.m_81.y = _3512;
    out.m_81.z = _3514;
    float _3522 = fma(_2037, _2655, _3518);
    float _3524 = _2209 * _3005;
    float _3526 = fma(_2037, _2651, _3516);
    float _3528 = fma(_2037, _2657, _3520);
    float _3530 = _2915 + _2921;
    float _3532 = _2401 + _3522;
    float _3534 = _2403 + _3526;
    float _3536 = _3524 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3538 = -_3510;
    float _3540 = _3538 + 1.0;
    float _3542 = _3530 * 0.5;
    float _3544 = _2407 + _3528;
    out.m_83.x = _2847;
    out.m_83.y = _2845;
    out.m_83.z = _2849;
    float _3546 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3548 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3550 = isnan(_3217);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3556 = _3552 || _3554;
    out.m_85.z = _3542;
    out.m_85.w = _2921;
    float _3558 = _3453;
    float _3560 = _3540;
    float _3562 = 0.0;
    float _3564 = 0.0;
    if (!_3385)
    {
        _3558 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3566 = _3558;
    float _3568 = _3536 * _3113;
    out.m_87.x = _3532;
    out.m_87.y = _3544;
    out.m_87.z = _3534;
    float _3570 = _3568;
    if (!_3385)
    {
        _3570 = 0.0;
    }
    float _3572 = _3570;
    if (!_3385)
    {
        float _3574 = _3566 * 5.0;
        _2933 = as_type<int>(_3574);
    }
    int _3576 = _2933;
    float _3578 = as_type<float>(_3576);
    if (!_3385)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9211 = as_type<float>(_3576);
        out.gl_Position.z = _9211;
    }
    if (!_3556)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3580 = _2935;
    float _3582 = _3580;
    float _3584 = _3580;
    if (!_3556)
    {
        _3560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3586 = _3560;
    float _3588 = _3586;
    float _3590 = _3586;
    if (!_3556)
    {
        _3578 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3592 = _3578;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3556)
    {
        _3562 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3598 = _3562;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3556)
    {
        _3564 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3604 = _3564;
    float _3606 = _3546 * _3471;
    float _3608 = -_3546;
    float _3610 = _3608 + 1.0;
    float _3612 = _3482 * _3606;
    float _3614 = _3492 * _3606;
    float _3616 = _3482 * _3610;
    float _3618 = _3610;
    float _3620 = _3604;
    float _3622 = _3604;
    if (!_3556)
    {
        _3618 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3624 = _3618;
    float _3626 = fma(_3488, _3612, _3476);
    float _3628 = fma(_3490, _3612, _3478);
    float _3630 = fma(_3482, _3614, _3480);
    out.m_89.x = _3626;
    out.m_89.y = _3628;
    out.m_89.z = _3630;
    out.m_89.w = _3616;
    bool _3632 = !_3556;
    float _3634 = _3624;
    float _3636 = _3624;
    if (!_3632)
    {
        bool _3638 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3640 = isnan(_3217);
        bool _3642 = _3638 || _3640;
        bool _3644 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3646 = _3642 || _3644;
        if (!_3646)
        {
            float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3650 = _3217 + _3648;
            float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3654 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3652;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3664 = 1.0 / _3654;
            float _3666 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3668 = _3666 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3670 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3672 = _3670 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3676 = _3674 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3678 = _3650 * _3664;
            float _3680 = precise::clamp(_3678, 0.0, 1.0);
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3684 = _3682 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3686 = fma(_3680, _3658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3688 = fma(_3680, _3662, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3690 = fma(_3680, _3684, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3692 = fma(_3680, _3668, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3694 = fma(_3680, _3672, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3696 = fma(_3680, _3676, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3622 = _3686;
            _3584 = _3694;
            _3602 = _3688;
            _3636 = _3692;
            _3590 = _3690;
            _3596 = _3696;
            _3698 = true;
        }
        else
        {
            bool _3700 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3702 = isnan(_3217);
            bool _3704 = _3700 || _3702;
            bool _3706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3708 = _3704 || _3706;
            if (!_3708)
            {
                _3634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3710 = _3634;
            _3636 = _3710;
            if (!_3708)
            {
                _3582 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3712 = _3582;
            _3584 = _3712;
            if (!_3708)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3714 = _3594;
            _3596 = _3714;
            if (!_3708)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3716 = _3600;
            _3602 = _3716;
            if (!_3708)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3718 = _3620;
            _3622 = _3718;
            if (!_3708)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3720 = _3588;
            bool _3722 = !_3708;
            _3590 = _3720;
            if (!_3722)
            {
                bool _3724 = _3217 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3726 = isnan(_3217);
                bool _3728 = _3724 || _3726;
                bool _3730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3732 = _3728 || _3730;
                if (!_3732)
                {
                    float _3734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3736 = _3217 + _3734;
                    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3738;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3750 = 1.0 / _3740;
                    float _3752 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3756 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3758 = _3756 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3762 = _3760 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3764 = _3736 * _3750;
                    float _3766 = precise::clamp(_3764, 0.0, 1.0);
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3772 = fma(_3766, _3744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3774 = fma(_3766, _3748, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3776 = fma(_3766, _3770, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3778 = fma(_3766, _3754, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3780 = fma(_3766, _3758, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3782 = fma(_3766, _3762, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3622 = _3772;
                    _3584 = _3780;
                    _3602 = _3774;
                    _3636 = _3778;
                    _3590 = _3776;
                    _3596 = _3782;
                    _3698 = true;
                }
                else
                {
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3584 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3698 = false;
    float _3784 = _3622;
    float _3786 = _3584;
    float _3788 = _3602;
    float _3790 = _3636;
    float _3792 = _3590;
    float _3794 = _3596;
    float _3796 = fma(_3544, -0.5, 0.5);
    float _3798 = precise::clamp(_3796, 0.0, 1.0);
    float _3800 = -_3784;
    float _3802 = _3786 + _3800;
    float _3804 = _3572 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3806 = -_3788;
    float _3808 = _3790 + _3806;
    float _3810 = fma(_3798, _3802, _3784);
    out.m_91.w = _3804;
    float _3812 = fma(_3798, _3808, _3788);
    float _3814 = -_3792;
    float _3816 = _3794 + _3814;
    float _3818 = _3810 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    bool _3820 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3822 = fma(_3798, _3816, _3792);
    float _3824 = fma(_3812, 0.298911988735198974609375, _3818);
    bool _3826 = _3005 > 0.0;
    bool _3828 = isnan(_3005);
    bool _3830 = _3826 || _3828;
    bool _3832 = isnan(0.0);
    bool _3834 = _3830 || _3832;
    float _3836 = fma(_3822, 0.114477999508380889892578125, _3824);
    out.m_93.x = 0.0;
    float _3838 = -_3836;
    float _3840 = _3812 + _3838;
    float _3842 = -_3836;
    float _3844 = _3810 + _3842;
    float _3846 = -_3836;
    float _3848 = _3822 + _3846;
    float _3850 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    float _3852 = fma(_3844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    float _3854 = fma(_3848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3836);
    bool _3856 = !_3820;
    if (!_3856)
    {
        float _3858 = -_2845;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3862 = -_2847;
        float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3866 = -_2849;
        float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3870 = _3860 * _3860;
        float _3872 = fma(_3864, _3864, _3870);
        float _3874 = fma(_3868, _3868, _3872);
        float _3876 = sqrt(_3874);
        float _3878 = rsqrt(_3874);
        float _3880 = -_3876;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3884 = _3882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3886 = precise::clamp(_3884, 0.0, 1.0);
        float _3888 = _3864 * _3878;
        float _3890 = _3860 * _3878;
        float _3892 = abs(_3886);
        float _3894 = log2(_3892);
        float _3896 = _3868 * _3878;
        float _3898 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3900 = _3544 * _3890;
        float _3902 = -_3890;
        float _3904 = -_3898;
        float _3906 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3904);
        float _3908 = fma(_3532, _3888, _3900);
        float _3910 = -_3896;
        float _3912 = fma(_3910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3906);
        float _3914 = fma(_3534, _3896, _3908);
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3920 = _3912 + _3918;
        float _3922 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3924 = _3920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3926 = precise::clamp(_3924, 0.0, 1.0);
        float _3928 = exp2(_3922);
        float _3930 = _3928 * _3926;
        float _3932 = _3916 * _3930;
        float _3934 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3936 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3934;
        out.m_93.y = _3936;
        out.m_93.z = _3938;
    }
    out.m_95.x = _3850;
    out.m_95.y = _3852;
    out.m_95.z = _3854;
    if (_3834)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _3940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

