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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1685 = as_type<float>(_107);
        out.gl_Position.z = _1685;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1754 = as_type<float>(_145);
        out.gl_Position.z = _1754;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = float(_205);
    float _219 = fma(_191, 0.5, 0.5);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    float _227 = abs(_215);
    float _229 = _217 * _227;
    bool _231 = _209 < 0.5;
    float _233 = float(_231);
    int _235 = abs(_225);
    float _237 = -_219;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_211);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _229);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_221;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_91);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_42.x;
    float _285 = in.m_42.y;
    float _287 = in.m_42.z;
    float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _291 = log2(_289);
    float _293 = _147 * 2.0;
    float _295 = in.m_54.x;
    float _297 = in.m_54.y;
    float _299 = in.m_54.z;
    float _301 = in.m_54.w;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _313 = _311 != 0;
    bool _315 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _323 = _319 || _321;
    float _325 = in.m_56.x;
    float _327 = in.m_56.y;
    float _329 = in.m_56.z;
    float _331 = in.m_56.w;
    float _333 = floor(_293);
    float _335 = in.m_58.x;
    float _337 = in.m_58.y;
    float _339 = in.m_58.z;
    float _341 = in.m_58.w;
    bool _343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    float _357 = in.m_49.z;
    float _359 = _291 * _125;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    float _365 = in.m_49.y;
    float _367 = 1.0 / _355;
    bool _369 = _333 > 0.0;
    bool _371 = _333 >= 0.0;
    bool _373 = isnan(_333);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = _285 * _297;
    float _383 = exp2(_359);
    float _385 = _285 * _327;
    float _387 = fma(_283, _295, _381);
    float _389 = _285 * _337;
    float _391 = fma(_283, _325, _385);
    float _393 = fma(_287, _299, _387);
    float _395 = 1.0 / _363;
    float _397 = fma(_283, _335, _389);
    float _399 = _357 * 2.0;
    float _401 = fma(_287, _329, _391);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = _281 + _403;
    float _407 = _365 * 2.0;
    float _409 = _147 + _365;
    float _411 = fma(_287, _339, _397);
    float _413 = floor(_399);
    float _415 = _365 + _357;
    float _417 = _409 + (-1.0);
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = _415 + (-1.0);
    float _425 = _405 * _367;
    float _427 = floor(_407);
    float _429 = _351 ? _421 : 0.0;
    float _431 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = _393 + _301;
    float _435 = _411 + _341;
    float _437 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    if (_323)
    {
        float _439 = _429 * _395;
        _129 = _439;
    }
    float _441 = _129;
    float _443 = _401 + _331;
    bool _445 = _413 > 0.0;
    float _447 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _449 = _379 ? 0 : 1;
    bool _451 = !_309;
    int _453 = _451 ? 0 : 1;
    int _455 = ~_449;
    int _457 = _455 + 1;
    int _459 = _457 + 1;
    bool _461 = _427 > 0.0;
    bool _463 = _427 >= 0.0;
    bool _465 = isnan(_427);
    bool _467 = _463 || _465;
    bool _469 = isnan(0.0);
    bool _471 = _467 || _469;
    int _473 = _459;
    if (!_369)
    {
        int _475 = ~_449;
        int _477 = _475 + 1;
        _473 = _477;
    }
    int _479 = _473;
    bool _481 = _413 >= 0.0;
    bool _483 = isnan(_413);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    int _491 = abs(_453);
    float _493 = in.m_60.x;
    float _495 = in.m_60.y;
    float _497 = in.m_60.z;
    bool _499 = !_305;
    int _501 = _499 ? 0 : 1;
    int _503 = _489 ? 0 : 1;
    float _505 = float(_491);
    float _507 = float(_479);
    bool _509 = !_313;
    int _511 = _509 ? 0 : 1;
    int _513 = _471 ? 0 : 1;
    float _515 = _505 * _507;
    int _517 = abs(_501);
    float _519 = _365 + (-0.5);
    int _521 = ~_503;
    int _523 = _521 + 1;
    int _525 = _523 + 1;
    int _527 = _525;
    if (!_445)
    {
        int _529 = ~_503;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    int _535 = abs(_511);
    int _537 = ~_513;
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _147 + _357;
    int _545 = _541;
    if (!_461)
    {
        int _547 = ~_513;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = _515 * (-2.0);
    float _555 = float(_517);
    float _557 = _543 + (-1.0);
    float _559 = float(_533);
    float _561 = float(_535);
    float _563 = fma(_553, _495, _495);
    float _565 = float(_551);
    float _567 = _555 * _559;
    float _569 = fma(_431, _553, _431);
    float _571 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[196].y, _563);
    float _573 = _561 * _565;
    float _575 = _567 * (-2.0);
    float _577 = fma(_569, _441, _571);
    float _579 = _573 * (-2.0);
    float _581 = fma(_447, _575, _447);
    float _583 = fma(_575, _493, _493);
    float _585 = _147 + (-0.5);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    float _591 = _577 * 0.15915493667125701904296875;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _593;
    float _597 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[196].x, _583);
    bool _599 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_281);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_589, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _613 = fma(_579, _497, _497);
    float _615 = fma(_581, _441, _597);
    bool _617 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_281);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = -_609;
    float _635 = _633 + 1.0;
    float _637 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _639 = _357 + (-0.5);
    float _641 = _615 * 0.15915493667125701904296875;
    float _643 = _627 * _635;
    float _645 = fma(_637, _579, _637);
    float _647 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _649 = fma(_595, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _651 = _611 * _643;
    float _653 = fma(_645, _441, _647);
    float _655 = -_627;
    float _657 = _655 + 1.0;
    float _659 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _661 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _659;
    float _663 = _649 * _643;
    float _665 = _591 * 6.283185482025146484375;
    float _667 = sin(_665);
    float _669 = _653 * 0.15915493667125701904296875;
    float _671 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _673 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _671;
    float _675 = _591 * 6.283185482025146484375;
    float _677 = cos(_675);
    float _679 = _641 * 6.283185482025146484375;
    float _681 = sin(_679);
    float _683 = _661 * _661;
    float _685 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _651);
    float _687 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _689 = fma(_673, _673, _683);
    float _691 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[144].x, _685);
    float _693 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[144].y, _687);
    float _695 = _641 * 6.283185482025146484375;
    float _697 = cos(_695);
    float _699 = _691 * _629;
    float _701 = _693 * _631;
    float _703 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _705 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _707 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _705;
    float _709 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _669 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _717 = fma(_707, _707, _689);
    float _719 = _709 * _703;
    float _721 = _681 * _667;
    float _723 = _715 * _437;
    float _725 = _669 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = _697 * _677;
    float _731 = _697 * _667;
    float _733 = _713 * _719;
    float _735 = sqrt(_717);
    float _737 = _667 * _713;
    float _739 = _677 * _713;
    float _741 = _697 * _733;
    float _743 = _681 * _677;
    float _745 = fma(_727, _729, _721);
    float _747 = fma(_727, _721, _729);
    float _749 = fma(_745, _723, _741);
    float _751 = -_719;
    float _753 = _727 * _751;
    float _755 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _757 = -_743;
    float _759 = fma(_727, _731, _757);
    float _761 = -_731;
    float _763 = fma(_727, _743, _761);
    float _765 = fma(_739, _723, _753);
    float _767 = _681 * _733;
    float _769 = fma(_759, _755, _749);
    float _771 = fma(_737, _755, _765);
    float _773 = fma(_763, _723, _767);
    float _775 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _777 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = fma(_735, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _781 = fma(_747, _755, _773);
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _775);
    float _785 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _787 = _435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _789 = precise::max(_779, 1.0);
    float _791 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _793 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _785);
    float _795 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].x, _787);
    float _797 = precise::min(_789, 1.89999997615814208984375);
    float _799 = _791 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _801 = _793 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _803 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[11].z, _795);
    float _805 = _435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _807 = fma(_799, _797, _443);
    float _809 = fma(_801, _797, _433);
    float _811 = _803 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _813 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].x, _805);
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _817 = _807 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _821 = _809 + _819;
    float _823 = 1.0 / _811;
    float _825 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[10].z, _813);
    float _827 = _817 * _817;
    float _829 = _825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _831 = fma(_821, _821, _827);
    bool _833 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _835 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.5);
    bool _841 = _837 || _839;
    float _843 = _829 + _811;
    float _845 = sqrt(_831);
    float _847 = _843 * _823;
    float _849 = _847 * 0.5;
    float _851 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _855 = _433 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _859 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[30].w, _857);
    float _861 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _851);
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _865 = _435 + _863;
    float _867 = 1.0 / _859;
    float _869 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _861);
    bool _871 = _845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _865 * _865;
    bool _875 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _877 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    float _885 = _869 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _887 = fma(_855, _855, _873);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _891 = _443 + _889;
    float _893 = fma(_885, _797, _435);
    float _895 = fma(_891, _891, _887);
    float _897 = _865;
    float _899 = _885;
    float _901 = _887;
    float _903 = _859;
    float _905 = _869;
    float _907 = _893;
    float _909 = _817;
    if (!_871)
    {
        _897 = _809;
    }
    float _911 = _897;
    float _913 = _911;
    if (!_871)
    {
        _899 = _807;
    }
    float _915 = _899;
    float _917 = _915;
    if (!_871)
    {
        _901 = _893;
    }
    float _919 = _901;
    bool _921 = !_871;
    float _923 = _919;
    if (!_921)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _929 = _845 + _927;
        float _931 = rsqrt(_831);
        float _933 = _929 * _925;
        float _935 = _893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _933 * 0.15915493667125701904296875;
        float _939 = _937 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 + (-1.0);
        float _949 = fma(_945, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _951 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _931 * _949;
        float _955 = fma(_893, _941, _951);
        float _957 = fma(_821, _953, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_817, _953, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _913 = _957;
        _923 = _955;
        _917 = _959;
        _903 = _937;
        _905 = _931;
    }
    float _961 = _913;
    float _963 = _923;
    float _965 = _917;
    float _967 = _903;
    float _969 = _905;
    float _971 = _969;
    float _973 = _963;
    float _975 = _961;
    float _977 = _965;
    float _979 = _967;
    if (_883)
    {
        _907 = 1.0;
    }
    float _981 = _907;
    float _983 = _981;
    if (!_841)
    {
        float _985 = sqrt(_895);
        float _987 = -_433;
        float _989 = _987 + _961;
        float _991 = -_435;
        float _993 = _991 + _963;
        float _995 = -_443;
        float _997 = _995 + _965;
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1003 = precise::min(_985, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1005 = _999 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1007 = _1003 * _1001;
        float _1009 = _1005 * _1007;
        float _1011 = fma(_989, _1009, _433);
        float _1013 = fma(_993, _1009, _435);
        float _1015 = fma(_997, _1009, _443);
        _971 = _1007;
        _973 = _1013;
        _975 = _1011;
        _977 = _1015;
        _979 = _1001;
    }
    float _1017 = _971;
    float _1019 = _973;
    float _1021 = _975;
    float _1023 = _977;
    float _1025 = _979;
    float _1027 = _1025;
    float _1029 = _1017;
    if (_883)
    {
        _909 = 1.0;
    }
    float _1031 = _909;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _867 * _1033;
    float _1037 = _1031;
    if (!_883)
    {
        float _1039 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1041 = _1039 * 0.15915493667125701904296875;
        float _1043 = _1041 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1049 = _1047 * 0.15915493667125701904296875;
        float _1051 = _1041 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        float _1055 = 1.0 / _1045;
        float _1057 = _1049 * 6.283185482025146484375;
        float _1059 = cos(_1057);
        float _1061 = _1053 * _1055;
        float _1063 = _1049 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1059 * _1061;
        float _1069 = 1.0 / _1067;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1073 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1071;
        float _1075 = 1.0 / _1073;
        float _1077 = _1065 * _1069;
        float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1081 = fma(_1035, _1077, _1079);
        float _1083 = _1081 * _1075;
        float _1085 = precise::clamp(_1083, 0.0, 1.0);
        _1027 = _1049;
        _1029 = _1055;
        _983 = _1085;
    }
    float _1087 = _1027;
    float _1089 = _1029;
    float _1091 = _983;
    float _1093 = _1087;
    float _1095 = _1089;
    if (!_883)
    {
        float _1097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1099 = _1097 * 0.15915493667125701904296875;
        float _1101 = _1099 * 6.283185482025146484375;
        float _1103 = cos(_1101);
        float _1105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1099 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = 1.0 / _1103;
        float _1115 = _1107 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1111 * _1113;
        float _1121 = _1107 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = _1117 * _1119;
        float _1127 = 1.0 / _1125;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1129;
        float _1133 = 1.0 / _1131;
        float _1135 = _1123 * _1127;
        float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1139 = fma(_1035, _1135, _1137);
        float _1141 = _1139 * _1133;
        float _1143 = precise::clamp(_1141, 0.0, 1.0);
        float _1145 = -_1143;
        float _1147 = _1145 + 1.0;
        _1093 = _1111;
        _1095 = _1099;
        _1037 = _1147;
    }
    float _1149 = _1093;
    float _1151 = _1095;
    float _1153 = _1037;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1157 = _1019 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1161 = _1021 + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = _1023 + _1163;
    float _1167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1169 = _1157 * _1157;
    float _1171 = fma(_1161, _1161, _1169);
    float _1173 = precise::max(0.0, _1167);
    float _1175 = fma(_1165, _1165, _1171);
    float _1177 = rsqrt(_1175);
    float _1179 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1181 = _1161 * _1179;
    float _1183 = _1165 * _1179;
    float _1185 = -_1179;
    float _1187 = -_1173;
    float _1189 = fma(_1157, _1185, _1187);
    float _1191 = _1181 * _1181;
    float _1193 = _1183 * _1183;
    float _1195 = _1191 + _1193;
    float _1197 = sqrt(_1195);
    bool _1199 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1197 + _1201;
    float _1205 = _1149;
    float _1207 = _1157;
    float _1209 = _1151;
    float _1211 = _1203;
    float _1213 = _1173;
    float _1215 = _1181;
    float _1217 = _1179;
    if (_1199)
    {
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1205 = _1219;
    }
    float _1221 = _1205;
    if (_1199)
    {
        float _1223 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1207 = _1223;
    }
    float _1225 = _1207;
    float _1227 = _1225;
    if (_1199)
    {
        float _1229 = rsqrt(_1195);
        _1209 = _1229;
    }
    float _1231 = _1209;
    float _1233 = _1221;
    float _1235 = _1231;
    if (_1199)
    {
        float _1237 = _1203 * _1221;
        _1211 = _1237;
    }
    float _1239 = _1211;
    if (_1199)
    {
        float _1241 = _1239 * 0.15915493667125701904296875;
        _1233 = _1241;
    }
    float _1243 = _1233;
    float _1245 = _1165;
    float _1247 = _1243;
    if (_1199)
    {
        float _1249 = _1243 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        _1245 = _1251;
    }
    float _1253 = _1245;
    float _1255 = _1239;
    if (_1199)
    {
        float _1257 = _1243 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1253;
    if (_1199)
    {
        float _1265 = fma(_1253, _1225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1227 = _1265;
    }
    float _1267 = _1227;
    float _1269 = _1267;
    if (!_1199)
    {
        _1263 = _1189;
    }
    float _1271 = _1263;
    float _1273 = _1271;
    if (!_1199)
    {
        _1247 = _1191;
    }
    float _1275 = _1247;
    float _1277 = _1275;
    if (_1199)
    {
        float _1279 = _1231 * _1267;
        _1235 = _1279;
    }
    float _1281 = _1235;
    if (!_1199)
    {
        _1269 = _1183;
    }
    float _1283 = _1269;
    float _1285 = _1283;
    float _1287 = _1261;
    if (_1199)
    {
        float _1289 = _1261 + (-1.0);
        _1213 = _1289;
    }
    float _1291 = _1213;
    if (_1199)
    {
        float _1293 = _1181 * _1281;
        _1215 = _1293;
    }
    float _1295 = _1215;
    if (_1199)
    {
        float _1297 = _1183 * _1281;
        _1285 = _1297;
    }
    float _1299 = _1285;
    if (_1199)
    {
        float _1301 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1217 = _1301;
    }
    float _1303 = _1217;
    if (_1199)
    {
        float _1305 = _1295 * _1295;
        _1277 = _1305;
    }
    float _1307 = _1277;
    float _1309 = sqrt(_1175);
    if (_1199)
    {
        float _1311 = fma(_1189, _1261, _1303);
        _1273 = _1311;
    }
    float _1313 = _1273;
    if (!_1199)
    {
        _1287 = _1193;
    }
    float _1315 = _1287;
    float _1317 = _1315;
    if (_1199)
    {
        float _1319 = _1299 * _1299;
        _1317 = _1319;
    }
    float _1321 = _1317;
    float _1323 = fma(_1313, _1313, _1307);
    float _1325 = _1323 + _1321;
    float _1327 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1329 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1331 = rsqrt(_1325);
    float _1333 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1327);
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1337 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1335);
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1343 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1345 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1347 = -_1339;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1341);
    float _1353 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1355 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1357 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1333);
    float _1359 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1351);
    float _1361 = abs(_1349);
    float _1363 = log2(_1361);
    float _1365 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1367 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    float _1369 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1371 = _1331 * _1295;
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1331 * _1313;
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1383 = _1331 * _1299;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1387 = -_1379;
    float _1389 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1393 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1385);
    float _1397 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1399 = -_1383;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1403 = -_1391;
    float _1405 = fma(_1403, _1329, 1.0);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1409 = exp2(_1397);
    float _1411 = fma(_1401, -0.5, 0.5);
    float _1413 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1417 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1419 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1415);
    float _1421 = log2(_1405);
    float _1423 = fma(_1401, 0.5, 0.5);
    float _1425 = _1375 + 1.0;
    float _1427 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1417);
    float _1429 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1419);
    float _1431 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1433 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1427);
    float _1435 = 1.0 / _1407;
    float _1437 = -_1375;
    float _1439 = fma(_1409, _1425, _1437);
    float _1441 = fma(_1423, _1431, -0.212114393711090087890625);
    float _1443 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1429);
    float _1445 = fma(_1423, _1441, 1.570728778839111328125);
    float _1447 = sqrt(_1411);
    float _1449 = _1421 * 0.693147182464599609375;
    float _1451 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1453 = _1433 * _1435;
    float _1455 = _1443 * _1435;
    float _1457 = fma(_1439, 0.5, 0.5);
    float _1459 = fma(_1453, 0.5, 0.5);
    float _1461 = fma(_1455, -0.5, 0.5);
    float _1463 = _1447 * 0.636619746685028076171875;
    float3 _3716 = float3(_1459, _1461, _1451);
    float _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3716, float3(0.0), isnan(_3716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3716, float3(0.0), isnan(_3716)), level(0.0)).x;
    float _1467 = -_1445;
    float _1469 = fma(_1463, _1467, 1.0);
    float3 _3732 = float3(_1459, _1461, _1451);
    float4 _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3732, float3(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3732, float3(0.0), isnan(_3732)), level(0.0)).xyzw;
    float _1474 = _1472.x;
    float _1476 = _1472.y;
    float _1478 = _1472.z;
    float _1480 = _1472.w;
    float2 _3749 = float2(_1469, _1457);
    float3 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3749, float2(0.0), isnan(_3749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3749, float2(0.0), isnan(_3749)), level(0.0)).xyz;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    bool _1492 = _147 > 0.5;
    float _1494 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1496 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1498 = _1091 * _1153;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = exp2(_1494);
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1508 = _1506 != 0;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1512 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1496);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1518 = _365 > 0.5;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1522 = -_195;
    int _1524 = _1492 ? as_type<int>(_1522) : as_type<int>(_195);
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1528 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1534 = !_1502;
    float _1536 = _1534 ? _195 : as_type<float>(_1524);
    float _1538 = -_1504;
    float _1540 = _1538 + 1.0;
    float _1542 = -_175;
    int _1544 = _1518 ? as_type<int>(_1542) : as_type<int>(_175);
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_64.x = _1528;
    out.m_64.y = _1514;
    out.m_64.z = _1530;
    out.m_64.w = _1526;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1554 = !_1508;
    float _1556 = _1554 ? _175 : as_type<float>(_1544);
    float _1558 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1566 = _1091 > 0.0;
    bool _1568 = isnan(_1091);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    float _1576 = _1536 + 0.5;
    float _1578 = -_1556;
    float _1580 = _1578 + 0.5;
    bool _1582 = _1153 <= 0.0;
    bool _1584 = !_1574;
    bool _1586 = _1582 || _1584;
    out.m_66.x = _1560;
    out.m_66.y = _1562;
    out.m_66.z = _1564;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1590 = _1498 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1592 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1512);
    float _1594 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1596 = -_1558;
    float _1598 = _1596 + 1.0;
    float _1600 = _253 * _1590;
    float _1602 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1592);
    float _1604 = _1594 * _1532;
    float _1606 = _1588 * _1552;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1610 = _1602 + _1407;
    out.m_45.x = _1608;
    float _1612 = _1610 * 0.5;
    out.m_68.x = _1604;
    out.m_68.y = _1606;
    out.gl_Position.x = _1433;
    out.gl_Position.y = _1443;
    out.gl_Position.z = _1602;
    out.gl_Position.w = _1407;
    out.m_70.z = _1612;
    out.m_70.w = _1407;
    float _1614 = _1558 * _1465;
    float _1616 = _1480 * _1614;
    float _1618 = _1480 * _1598;
    float _1620 = _1490 * _1614;
    float _1622 = fma(_1486, _1616, _1474);
    float _1624 = fma(_1488, _1616, _1476);
    float _1626 = fma(_1480, _1620, _1478);
    out.m_72.x = _1622;
    out.m_72.y = _1624;
    out.m_72.z = _1626;
    out.m_72.w = _1618;
    if (!_1586)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1628;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1685 = as_type<float>(_107);
        out.gl_Position.z = _1685;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1754 = as_type<float>(_145);
        out.gl_Position.z = _1754;
    }
    if (_139)
    {
        return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = float(_205);
    float _219 = fma(_191, 0.5, 0.5);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    float _227 = abs(_215);
    float _229 = _217 * _227;
    bool _231 = _209 < 0.5;
    float _233 = float(_231);
    int _235 = abs(_225);
    float _237 = -_219;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_211);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _229);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_221;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_91);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_42.x;
    float _285 = in.m_42.y;
    float _287 = in.m_42.z;
    float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _291 = log2(_289);
    float _293 = _147 * 2.0;
    float _295 = in.m_54.x;
    float _297 = in.m_54.y;
    float _299 = in.m_54.z;
    float _301 = in.m_54.w;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _313 = _311 != 0;
    bool _315 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _323 = _319 || _321;
    float _325 = in.m_56.x;
    float _327 = in.m_56.y;
    float _329 = in.m_56.z;
    float _331 = in.m_56.w;
    float _333 = floor(_293);
    float _335 = in.m_58.x;
    float _337 = in.m_58.y;
    float _339 = in.m_58.z;
    float _341 = in.m_58.w;
    bool _343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    float _357 = in.m_49.z;
    float _359 = _291 * _125;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    float _365 = in.m_49.y;
    float _367 = 1.0 / _355;
    bool _369 = _333 > 0.0;
    bool _371 = _333 >= 0.0;
    bool _373 = isnan(_333);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = _285 * _297;
    float _383 = exp2(_359);
    float _385 = _285 * _327;
    float _387 = fma(_283, _295, _381);
    float _389 = _285 * _337;
    float _391 = fma(_283, _325, _385);
    float _393 = fma(_287, _299, _387);
    float _395 = 1.0 / _363;
    float _397 = fma(_283, _335, _389);
    float _399 = _357 * 2.0;
    float _401 = fma(_287, _329, _391);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = _281 + _403;
    float _407 = _365 * 2.0;
    float _409 = _147 + _365;
    float _411 = fma(_287, _339, _397);
    float _413 = floor(_399);
    float _415 = _365 + _357;
    float _417 = _409 + (-1.0);
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = _415 + (-1.0);
    float _425 = _405 * _367;
    float _427 = floor(_407);
    float _429 = _351 ? _421 : 0.0;
    float _431 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = _393 + _301;
    float _435 = _411 + _341;
    float _437 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    if (_323)
    {
        float _439 = _429 * _395;
        _129 = _439;
    }
    float _441 = _129;
    float _443 = _401 + _331;
    bool _445 = _413 > 0.0;
    float _447 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _449 = _379 ? 0 : 1;
    bool _451 = !_309;
    int _453 = _451 ? 0 : 1;
    int _455 = ~_449;
    int _457 = _455 + 1;
    int _459 = _457 + 1;
    bool _461 = _427 > 0.0;
    bool _463 = _427 >= 0.0;
    bool _465 = isnan(_427);
    bool _467 = _463 || _465;
    bool _469 = isnan(0.0);
    bool _471 = _467 || _469;
    int _473 = _459;
    if (!_369)
    {
        int _475 = ~_449;
        int _477 = _475 + 1;
        _473 = _477;
    }
    int _479 = _473;
    bool _481 = _413 >= 0.0;
    bool _483 = isnan(_413);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    int _491 = abs(_453);
    float _493 = in.m_60.x;
    float _495 = in.m_60.y;
    float _497 = in.m_60.z;
    bool _499 = !_305;
    int _501 = _499 ? 0 : 1;
    int _503 = _489 ? 0 : 1;
    float _505 = float(_491);
    float _507 = float(_479);
    bool _509 = !_313;
    int _511 = _509 ? 0 : 1;
    int _513 = _471 ? 0 : 1;
    float _515 = _505 * _507;
    int _517 = abs(_501);
    float _519 = _365 + (-0.5);
    int _521 = ~_503;
    int _523 = _521 + 1;
    int _525 = _523 + 1;
    int _527 = _525;
    if (!_445)
    {
        int _529 = ~_503;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    int _535 = abs(_511);
    int _537 = ~_513;
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _147 + _357;
    int _545 = _541;
    if (!_461)
    {
        int _547 = ~_513;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = _515 * (-2.0);
    float _555 = float(_517);
    float _557 = _543 + (-1.0);
    float _559 = float(_533);
    float _561 = float(_535);
    float _563 = fma(_553, _495, _495);
    float _565 = float(_551);
    float _567 = _555 * _559;
    float _569 = fma(_431, _553, _431);
    float _571 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[196].y, _563);
    float _573 = _561 * _565;
    float _575 = _567 * (-2.0);
    float _577 = fma(_569, _441, _571);
    float _579 = _573 * (-2.0);
    float _581 = fma(_447, _575, _447);
    float _583 = fma(_575, _493, _493);
    float _585 = _147 + (-0.5);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    float _591 = _577 * 0.15915493667125701904296875;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _593;
    float _597 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[196].x, _583);
    bool _599 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_281);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_589, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _613 = fma(_579, _497, _497);
    float _615 = fma(_581, _441, _597);
    bool _617 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_281);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = -_609;
    float _635 = _633 + 1.0;
    float _637 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _639 = _357 + (-0.5);
    float _641 = _615 * 0.15915493667125701904296875;
    float _643 = _627 * _635;
    float _645 = fma(_637, _579, _637);
    float _647 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _649 = fma(_595, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _651 = _611 * _643;
    float _653 = fma(_645, _441, _647);
    float _655 = -_627;
    float _657 = _655 + 1.0;
    float _659 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _661 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _659;
    float _663 = _649 * _643;
    float _665 = _591 * 6.283185482025146484375;
    float _667 = sin(_665);
    float _669 = _653 * 0.15915493667125701904296875;
    float _671 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _673 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _671;
    float _675 = _591 * 6.283185482025146484375;
    float _677 = cos(_675);
    float _679 = _641 * 6.283185482025146484375;
    float _681 = sin(_679);
    float _683 = _661 * _661;
    float _685 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _651);
    float _687 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _689 = fma(_673, _673, _683);
    float _691 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[144].x, _685);
    float _693 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[144].y, _687);
    float _695 = _641 * 6.283185482025146484375;
    float _697 = cos(_695);
    float _699 = _691 * _629;
    float _701 = _693 * _631;
    float _703 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _705 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _707 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _705;
    float _709 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _669 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _717 = fma(_707, _707, _689);
    float _719 = _709 * _703;
    float _721 = _681 * _667;
    float _723 = _715 * _437;
    float _725 = _669 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = _697 * _677;
    float _731 = _697 * _667;
    float _733 = _713 * _719;
    float _735 = sqrt(_717);
    float _737 = _667 * _713;
    float _739 = _677 * _713;
    float _741 = _697 * _733;
    float _743 = _681 * _677;
    float _745 = fma(_727, _729, _721);
    float _747 = fma(_727, _721, _729);
    float _749 = fma(_745, _723, _741);
    float _751 = -_719;
    float _753 = _727 * _751;
    float _755 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _757 = -_743;
    float _759 = fma(_727, _731, _757);
    float _761 = -_731;
    float _763 = fma(_727, _743, _761);
    float _765 = fma(_739, _723, _753);
    float _767 = _681 * _733;
    float _769 = fma(_759, _755, _749);
    float _771 = fma(_737, _755, _765);
    float _773 = fma(_763, _723, _767);
    float _775 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _777 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = fma(_735, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _781 = fma(_747, _755, _773);
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _775);
    float _785 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _787 = _435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _789 = precise::max(_779, 1.0);
    float _791 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _793 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _785);
    float _795 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].x, _787);
    float _797 = precise::min(_789, 1.89999997615814208984375);
    float _799 = _791 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _801 = _793 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _803 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[11].z, _795);
    float _805 = _435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _807 = fma(_799, _797, _443);
    float _809 = fma(_801, _797, _433);
    float _811 = _803 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _813 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].x, _805);
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _817 = _807 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _821 = _809 + _819;
    float _823 = 1.0 / _811;
    float _825 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[10].z, _813);
    float _827 = _817 * _817;
    float _829 = _825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _831 = fma(_821, _821, _827);
    bool _833 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _835 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.5);
    bool _841 = _837 || _839;
    float _843 = _829 + _811;
    float _845 = sqrt(_831);
    float _847 = _843 * _823;
    float _849 = _847 * 0.5;
    float _851 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _855 = _433 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _859 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[30].w, _857);
    float _861 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _851);
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _865 = _435 + _863;
    float _867 = 1.0 / _859;
    float _869 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _861);
    bool _871 = _845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _865 * _865;
    bool _875 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _877 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    float _885 = _869 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _887 = fma(_855, _855, _873);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _891 = _443 + _889;
    float _893 = fma(_885, _797, _435);
    float _895 = fma(_891, _891, _887);
    float _897 = _865;
    float _899 = _885;
    float _901 = _887;
    float _903 = _859;
    float _905 = _869;
    float _907 = _893;
    float _909 = _817;
    if (!_871)
    {
        _897 = _809;
    }
    float _911 = _897;
    float _913 = _911;
    if (!_871)
    {
        _899 = _807;
    }
    float _915 = _899;
    float _917 = _915;
    if (!_871)
    {
        _901 = _893;
    }
    float _919 = _901;
    bool _921 = !_871;
    float _923 = _919;
    if (!_921)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _929 = _845 + _927;
        float _931 = rsqrt(_831);
        float _933 = _929 * _925;
        float _935 = _893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _933 * 0.15915493667125701904296875;
        float _939 = _937 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 + (-1.0);
        float _949 = fma(_945, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _951 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _931 * _949;
        float _955 = fma(_893, _941, _951);
        float _957 = fma(_821, _953, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_817, _953, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _913 = _957;
        _923 = _955;
        _917 = _959;
        _903 = _937;
        _905 = _931;
    }
    float _961 = _913;
    float _963 = _923;
    float _965 = _917;
    float _967 = _903;
    float _969 = _905;
    float _971 = _969;
    float _973 = _963;
    float _975 = _961;
    float _977 = _965;
    float _979 = _967;
    if (_883)
    {
        _907 = 1.0;
    }
    float _981 = _907;
    float _983 = _981;
    if (!_841)
    {
        float _985 = sqrt(_895);
        float _987 = -_433;
        float _989 = _987 + _961;
        float _991 = -_435;
        float _993 = _991 + _963;
        float _995 = -_443;
        float _997 = _995 + _965;
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1003 = precise::min(_985, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1005 = _999 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1007 = _1003 * _1001;
        float _1009 = _1005 * _1007;
        float _1011 = fma(_989, _1009, _433);
        float _1013 = fma(_993, _1009, _435);
        float _1015 = fma(_997, _1009, _443);
        _971 = _1007;
        _973 = _1013;
        _975 = _1011;
        _977 = _1015;
        _979 = _1001;
    }
    float _1017 = _971;
    float _1019 = _973;
    float _1021 = _975;
    float _1023 = _977;
    float _1025 = _979;
    float _1027 = _1025;
    float _1029 = _1017;
    if (_883)
    {
        _909 = 1.0;
    }
    float _1031 = _909;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _867 * _1033;
    float _1037 = _1031;
    if (!_883)
    {
        float _1039 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1041 = _1039 * 0.15915493667125701904296875;
        float _1043 = _1041 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1049 = _1047 * 0.15915493667125701904296875;
        float _1051 = _1041 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        float _1055 = 1.0 / _1045;
        float _1057 = _1049 * 6.283185482025146484375;
        float _1059 = cos(_1057);
        float _1061 = _1053 * _1055;
        float _1063 = _1049 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1059 * _1061;
        float _1069 = 1.0 / _1067;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1073 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1071;
        float _1075 = 1.0 / _1073;
        float _1077 = _1065 * _1069;
        float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1081 = fma(_1035, _1077, _1079);
        float _1083 = _1081 * _1075;
        float _1085 = precise::clamp(_1083, 0.0, 1.0);
        _1027 = _1049;
        _1029 = _1055;
        _983 = _1085;
    }
    float _1087 = _1027;
    float _1089 = _1029;
    float _1091 = _983;
    float _1093 = _1087;
    float _1095 = _1089;
    if (!_883)
    {
        float _1097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1099 = _1097 * 0.15915493667125701904296875;
        float _1101 = _1099 * 6.283185482025146484375;
        float _1103 = cos(_1101);
        float _1105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1099 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = 1.0 / _1103;
        float _1115 = _1107 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1111 * _1113;
        float _1121 = _1107 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = _1117 * _1119;
        float _1127 = 1.0 / _1125;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1129;
        float _1133 = 1.0 / _1131;
        float _1135 = _1123 * _1127;
        float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1139 = fma(_1035, _1135, _1137);
        float _1141 = _1139 * _1133;
        float _1143 = precise::clamp(_1141, 0.0, 1.0);
        float _1145 = -_1143;
        float _1147 = _1145 + 1.0;
        _1093 = _1111;
        _1095 = _1099;
        _1037 = _1147;
    }
    float _1149 = _1093;
    float _1151 = _1095;
    float _1153 = _1037;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1157 = _1019 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1161 = _1021 + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = _1023 + _1163;
    float _1167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1169 = _1157 * _1157;
    float _1171 = fma(_1161, _1161, _1169);
    float _1173 = precise::max(0.0, _1167);
    float _1175 = fma(_1165, _1165, _1171);
    float _1177 = rsqrt(_1175);
    float _1179 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1181 = _1161 * _1179;
    float _1183 = _1165 * _1179;
    float _1185 = -_1179;
    float _1187 = -_1173;
    float _1189 = fma(_1157, _1185, _1187);
    float _1191 = _1181 * _1181;
    float _1193 = _1183 * _1183;
    float _1195 = _1191 + _1193;
    float _1197 = sqrt(_1195);
    bool _1199 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1197 + _1201;
    float _1205 = _1149;
    float _1207 = _1157;
    float _1209 = _1151;
    float _1211 = _1203;
    float _1213 = _1173;
    float _1215 = _1181;
    float _1217 = _1179;
    if (_1199)
    {
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1205 = _1219;
    }
    float _1221 = _1205;
    if (_1199)
    {
        float _1223 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1207 = _1223;
    }
    float _1225 = _1207;
    float _1227 = _1225;
    if (_1199)
    {
        float _1229 = rsqrt(_1195);
        _1209 = _1229;
    }
    float _1231 = _1209;
    float _1233 = _1221;
    float _1235 = _1231;
    if (_1199)
    {
        float _1237 = _1203 * _1221;
        _1211 = _1237;
    }
    float _1239 = _1211;
    if (_1199)
    {
        float _1241 = _1239 * 0.15915493667125701904296875;
        _1233 = _1241;
    }
    float _1243 = _1233;
    float _1245 = _1165;
    float _1247 = _1243;
    if (_1199)
    {
        float _1249 = _1243 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        _1245 = _1251;
    }
    float _1253 = _1245;
    float _1255 = _1239;
    if (_1199)
    {
        float _1257 = _1243 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1253;
    if (_1199)
    {
        float _1265 = fma(_1253, _1225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1227 = _1265;
    }
    float _1267 = _1227;
    float _1269 = _1267;
    if (!_1199)
    {
        _1263 = _1189;
    }
    float _1271 = _1263;
    float _1273 = _1271;
    if (!_1199)
    {
        _1247 = _1191;
    }
    float _1275 = _1247;
    float _1277 = _1275;
    if (_1199)
    {
        float _1279 = _1231 * _1267;
        _1235 = _1279;
    }
    float _1281 = _1235;
    if (!_1199)
    {
        _1269 = _1183;
    }
    float _1283 = _1269;
    float _1285 = _1283;
    float _1287 = _1261;
    if (_1199)
    {
        float _1289 = _1261 + (-1.0);
        _1213 = _1289;
    }
    float _1291 = _1213;
    if (_1199)
    {
        float _1293 = _1181 * _1281;
        _1215 = _1293;
    }
    float _1295 = _1215;
    if (_1199)
    {
        float _1297 = _1183 * _1281;
        _1285 = _1297;
    }
    float _1299 = _1285;
    if (_1199)
    {
        float _1301 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1217 = _1301;
    }
    float _1303 = _1217;
    if (_1199)
    {
        float _1305 = _1295 * _1295;
        _1277 = _1305;
    }
    float _1307 = _1277;
    float _1309 = sqrt(_1175);
    if (_1199)
    {
        float _1311 = fma(_1189, _1261, _1303);
        _1273 = _1311;
    }
    float _1313 = _1273;
    if (!_1199)
    {
        _1287 = _1193;
    }
    float _1315 = _1287;
    float _1317 = _1315;
    if (_1199)
    {
        float _1319 = _1299 * _1299;
        _1317 = _1319;
    }
    float _1321 = _1317;
    float _1323 = fma(_1313, _1313, _1307);
    float _1325 = _1323 + _1321;
    float _1327 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1329 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1331 = rsqrt(_1325);
    float _1333 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1327);
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1337 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1335);
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1343 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1345 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1347 = -_1339;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1341);
    float _1353 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1355 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1357 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1333);
    float _1359 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1351);
    float _1361 = abs(_1349);
    float _1363 = log2(_1361);
    float _1365 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1367 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    float _1369 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1371 = _1331 * _1295;
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1331 * _1313;
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1383 = _1331 * _1299;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1387 = -_1379;
    float _1389 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1393 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1385);
    float _1397 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1399 = -_1383;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1403 = -_1391;
    float _1405 = fma(_1403, _1329, 1.0);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1409 = exp2(_1397);
    float _1411 = fma(_1401, -0.5, 0.5);
    float _1413 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1417 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1419 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1415);
    float _1421 = log2(_1405);
    float _1423 = fma(_1401, 0.5, 0.5);
    float _1425 = _1375 + 1.0;
    float _1427 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1417);
    float _1429 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1419);
    float _1431 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1433 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1427);
    float _1435 = 1.0 / _1407;
    float _1437 = -_1375;
    float _1439 = fma(_1409, _1425, _1437);
    float _1441 = fma(_1423, _1431, -0.212114393711090087890625);
    float _1443 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1429);
    float _1445 = fma(_1423, _1441, 1.570728778839111328125);
    float _1447 = sqrt(_1411);
    float _1449 = _1421 * 0.693147182464599609375;
    float _1451 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1453 = _1433 * _1435;
    float _1455 = _1443 * _1435;
    float _1457 = fma(_1439, 0.5, 0.5);
    float _1459 = fma(_1453, 0.5, 0.5);
    float _1461 = fma(_1455, -0.5, 0.5);
    float _1463 = _1447 * 0.636619746685028076171875;
    float3 _3716 = float3(_1459, _1461, _1451);
    float _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3716, float3(0.0), isnan(_3716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3716, float3(0.0), isnan(_3716)), level(0.0)).x;
    float _1467 = -_1445;
    float _1469 = fma(_1463, _1467, 1.0);
    float3 _3732 = float3(_1459, _1461, _1451);
    float4 _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3732, float3(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3732, float3(0.0), isnan(_3732)), level(0.0)).xyzw;
    float _1474 = _1472.x;
    float _1476 = _1472.y;
    float _1478 = _1472.z;
    float _1480 = _1472.w;
    float2 _3749 = float2(_1469, _1457);
    float3 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3749, float2(0.0), isnan(_3749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3749, float2(0.0), isnan(_3749)), level(0.0)).xyz;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    bool _1492 = _147 > 0.5;
    float _1494 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1496 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1498 = _1091 * _1153;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = exp2(_1494);
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1508 = _1506 != 0;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1512 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1496);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1518 = _365 > 0.5;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1522 = -_195;
    int _1524 = _1492 ? as_type<int>(_1522) : as_type<int>(_195);
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1528 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1534 = !_1502;
    float _1536 = _1534 ? _195 : as_type<float>(_1524);
    float _1538 = -_1504;
    float _1540 = _1538 + 1.0;
    float _1542 = -_175;
    int _1544 = _1518 ? as_type<int>(_1542) : as_type<int>(_175);
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_64.x = _1528;
    out.m_64.y = _1514;
    out.m_64.z = _1530;
    out.m_64.w = _1526;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1554 = !_1508;
    float _1556 = _1554 ? _175 : as_type<float>(_1544);
    float _1558 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1566 = _1091 > 0.0;
    bool _1568 = isnan(_1091);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    float _1576 = _1536 + 0.5;
    float _1578 = -_1556;
    float _1580 = _1578 + 0.5;
    bool _1582 = _1153 <= 0.0;
    bool _1584 = !_1574;
    bool _1586 = _1582 || _1584;
    out.m_66.x = _1560;
    out.m_66.y = _1562;
    out.m_66.z = _1564;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1590 = _1498 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1592 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1512);
    float _1594 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1596 = -_1558;
    float _1598 = _1596 + 1.0;
    float _1600 = _253 * _1590;
    float _1602 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1592);
    float _1604 = _1594 * _1532;
    float _1606 = _1588 * _1552;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1610 = _1602 + _1407;
    out.m_45.x = _1608;
    float _1612 = _1610 * 0.5;
    out.m_68.x = _1604;
    out.m_68.y = _1606;
    out.gl_Position.x = _1433;
    out.gl_Position.y = _1443;
    out.gl_Position.z = _1602;
    out.gl_Position.w = _1407;
    out.m_70.z = _1612;
    out.m_70.w = _1407;
    float _1614 = _1558 * _1465;
    float _1616 = _1480 * _1614;
    float _1618 = _1480 * _1598;
    float _1620 = _1490 * _1614;
    float _1622 = fma(_1486, _1616, _1474);
    float _1624 = fma(_1488, _1616, _1476);
    float _1626 = fma(_1480, _1620, _1478);
    out.m_72.x = _1622;
    out.m_72.y = _1624;
    out.m_72.z = _1626;
    out.m_72.w = _1618;
    if (!_1586)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1628;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1685 = as_type<float>(_107);
        out.gl_Position.z = _1685;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1754 = as_type<float>(_145);
        out.gl_Position.z = _1754;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = float(_205);
    float _219 = fma(_191, 0.5, 0.5);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    float _227 = abs(_215);
    float _229 = _217 * _227;
    bool _231 = _209 < 0.5;
    float _233 = float(_231);
    int _235 = abs(_225);
    float _237 = -_219;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_211);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_235);
    float _249 = fma(_241, _239, _229);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_221;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_91);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = in.m_42.x;
    float _285 = in.m_42.y;
    float _287 = in.m_42.z;
    float _289 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _291 = log2(_289);
    float _293 = _147 * 2.0;
    float _295 = in.m_54.x;
    float _297 = in.m_54.y;
    float _299 = in.m_54.z;
    float _301 = in.m_54.w;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _313 = _311 != 0;
    bool _315 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _323 = _319 || _321;
    float _325 = in.m_56.x;
    float _327 = in.m_56.y;
    float _329 = in.m_56.z;
    float _331 = in.m_56.w;
    float _333 = floor(_293);
    float _335 = in.m_58.x;
    float _337 = in.m_58.y;
    float _339 = in.m_58.z;
    float _341 = in.m_58.w;
    bool _343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    float _357 = in.m_49.z;
    float _359 = _291 * _125;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    float _365 = in.m_49.y;
    float _367 = 1.0 / _355;
    bool _369 = _333 > 0.0;
    bool _371 = _333 >= 0.0;
    bool _373 = isnan(_333);
    bool _375 = _371 || _373;
    bool _377 = isnan(0.0);
    bool _379 = _375 || _377;
    float _381 = _285 * _297;
    float _383 = exp2(_359);
    float _385 = _285 * _327;
    float _387 = fma(_283, _295, _381);
    float _389 = _285 * _337;
    float _391 = fma(_283, _325, _385);
    float _393 = fma(_287, _299, _387);
    float _395 = 1.0 / _363;
    float _397 = fma(_283, _335, _389);
    float _399 = _357 * 2.0;
    float _401 = fma(_287, _329, _391);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _405 = _281 + _403;
    float _407 = _365 * 2.0;
    float _409 = _147 + _365;
    float _411 = fma(_287, _339, _397);
    float _413 = floor(_399);
    float _415 = _365 + _357;
    float _417 = _409 + (-1.0);
    float _419 = -_383;
    float _421 = _419 + 1.0;
    float _423 = _415 + (-1.0);
    float _425 = _405 * _367;
    float _427 = floor(_407);
    float _429 = _351 ? _421 : 0.0;
    float _431 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _433 = _393 + _301;
    float _435 = _411 + _341;
    float _437 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    if (_323)
    {
        float _439 = _429 * _395;
        _129 = _439;
    }
    float _441 = _129;
    float _443 = _401 + _331;
    bool _445 = _413 > 0.0;
    float _447 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _449 = _379 ? 0 : 1;
    bool _451 = !_309;
    int _453 = _451 ? 0 : 1;
    int _455 = ~_449;
    int _457 = _455 + 1;
    int _459 = _457 + 1;
    bool _461 = _427 > 0.0;
    bool _463 = _427 >= 0.0;
    bool _465 = isnan(_427);
    bool _467 = _463 || _465;
    bool _469 = isnan(0.0);
    bool _471 = _467 || _469;
    int _473 = _459;
    if (!_369)
    {
        int _475 = ~_449;
        int _477 = _475 + 1;
        _473 = _477;
    }
    int _479 = _473;
    bool _481 = _413 >= 0.0;
    bool _483 = isnan(_413);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    int _491 = abs(_453);
    float _493 = in.m_60.x;
    float _495 = in.m_60.y;
    float _497 = in.m_60.z;
    bool _499 = !_305;
    int _501 = _499 ? 0 : 1;
    int _503 = _489 ? 0 : 1;
    float _505 = float(_491);
    float _507 = float(_479);
    bool _509 = !_313;
    int _511 = _509 ? 0 : 1;
    int _513 = _471 ? 0 : 1;
    float _515 = _505 * _507;
    int _517 = abs(_501);
    float _519 = _365 + (-0.5);
    int _521 = ~_503;
    int _523 = _521 + 1;
    int _525 = _523 + 1;
    int _527 = _525;
    if (!_445)
    {
        int _529 = ~_503;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    int _535 = abs(_511);
    int _537 = ~_513;
    int _539 = _537 + 1;
    int _541 = _539 + 1;
    float _543 = _147 + _357;
    int _545 = _541;
    if (!_461)
    {
        int _547 = ~_513;
        int _549 = _547 + 1;
        _545 = _549;
    }
    int _551 = _545;
    float _553 = _515 * (-2.0);
    float _555 = float(_517);
    float _557 = _543 + (-1.0);
    float _559 = float(_533);
    float _561 = float(_535);
    float _563 = fma(_553, _495, _495);
    float _565 = float(_551);
    float _567 = _555 * _559;
    float _569 = fma(_431, _553, _431);
    float _571 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[196].y, _563);
    float _573 = _561 * _565;
    float _575 = _567 * (-2.0);
    float _577 = fma(_569, _441, _571);
    float _579 = _573 * (-2.0);
    float _581 = fma(_447, _575, _447);
    float _583 = fma(_575, _493, _493);
    float _585 = _147 + (-0.5);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    float _591 = _577 * 0.15915493667125701904296875;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _593;
    float _597 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[196].x, _583);
    bool _599 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _601 = isnan(_281);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_589, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _613 = fma(_579, _497, _497);
    float _615 = fma(_581, _441, _597);
    bool _617 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_281);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = -_609;
    float _635 = _633 + 1.0;
    float _637 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _639 = _357 + (-0.5);
    float _641 = _615 * 0.15915493667125701904296875;
    float _643 = _627 * _635;
    float _645 = fma(_637, _579, _637);
    float _647 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _649 = fma(_595, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _651 = _611 * _643;
    float _653 = fma(_645, _441, _647);
    float _655 = -_627;
    float _657 = _655 + 1.0;
    float _659 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _661 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _659;
    float _663 = _649 * _643;
    float _665 = _591 * 6.283185482025146484375;
    float _667 = sin(_665);
    float _669 = _653 * 0.15915493667125701904296875;
    float _671 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _673 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _671;
    float _675 = _591 * 6.283185482025146484375;
    float _677 = cos(_675);
    float _679 = _641 * 6.283185482025146484375;
    float _681 = sin(_679);
    float _683 = _661 * _661;
    float _685 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].x, _651);
    float _687 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _689 = fma(_673, _673, _683);
    float _691 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[144].x, _685);
    float _693 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[144].y, _687);
    float _695 = _641 * 6.283185482025146484375;
    float _697 = cos(_695);
    float _699 = _691 * _629;
    float _701 = _693 * _631;
    float _703 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _705 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _707 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _705;
    float _709 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _711 = _669 * 6.283185482025146484375;
    float _713 = cos(_711);
    float _715 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _717 = fma(_707, _707, _689);
    float _719 = _709 * _703;
    float _721 = _681 * _667;
    float _723 = _715 * _437;
    float _725 = _669 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = _697 * _677;
    float _731 = _697 * _667;
    float _733 = _713 * _719;
    float _735 = sqrt(_717);
    float _737 = _667 * _713;
    float _739 = _677 * _713;
    float _741 = _697 * _733;
    float _743 = _681 * _677;
    float _745 = fma(_727, _729, _721);
    float _747 = fma(_727, _721, _729);
    float _749 = fma(_745, _723, _741);
    float _751 = -_719;
    float _753 = _727 * _751;
    float _755 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _757 = -_743;
    float _759 = fma(_727, _731, _757);
    float _761 = -_731;
    float _763 = fma(_727, _743, _761);
    float _765 = fma(_739, _723, _753);
    float _767 = _681 * _733;
    float _769 = fma(_759, _755, _749);
    float _771 = fma(_737, _755, _765);
    float _773 = fma(_763, _723, _767);
    float _775 = _769 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _777 = _769 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = fma(_735, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _781 = fma(_747, _755, _773);
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _775);
    float _785 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _787 = _435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _789 = precise::max(_779, 1.0);
    float _791 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[26].z, _783);
    float _793 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[24].z, _785);
    float _795 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[11].x, _787);
    float _797 = precise::min(_789, 1.89999997615814208984375);
    float _799 = _791 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _801 = _793 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _803 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[11].z, _795);
    float _805 = _435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _807 = fma(_799, _797, _443);
    float _809 = fma(_801, _797, _433);
    float _811 = _803 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _813 = fma(_433, (*spvDescriptorSet0.vp_c8)._m0[10].x, _805);
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _817 = _807 + _815;
    float _819 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _821 = _809 + _819;
    float _823 = 1.0 / _811;
    float _825 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[10].z, _813);
    float _827 = _817 * _817;
    float _829 = _825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _831 = fma(_821, _821, _827);
    bool _833 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _835 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.5);
    bool _841 = _837 || _839;
    float _843 = _829 + _811;
    float _845 = sqrt(_831);
    float _847 = _843 * _823;
    float _849 = _847 * 0.5;
    float _851 = _769 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _855 = _433 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _859 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[30].w, _857);
    float _861 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _851);
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _865 = _435 + _863;
    float _867 = 1.0 / _859;
    float _869 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[25].z, _861);
    bool _871 = _845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _873 = _865 * _865;
    bool _875 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _877 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    float _885 = _869 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _887 = fma(_855, _855, _873);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _891 = _443 + _889;
    float _893 = fma(_885, _797, _435);
    float _895 = fma(_891, _891, _887);
    float _897 = _865;
    float _899 = _885;
    float _901 = _887;
    float _903 = _859;
    float _905 = _869;
    float _907 = _893;
    float _909 = _817;
    if (!_871)
    {
        _897 = _809;
    }
    float _911 = _897;
    float _913 = _911;
    if (!_871)
    {
        _899 = _807;
    }
    float _915 = _899;
    float _917 = _915;
    if (!_871)
    {
        _901 = _893;
    }
    float _919 = _901;
    bool _921 = !_871;
    float _923 = _919;
    if (!_921)
    {
        float _925 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _927 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _929 = _845 + _927;
        float _931 = rsqrt(_831);
        float _933 = _929 * _925;
        float _935 = _893 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = _933 * 0.15915493667125701904296875;
        float _939 = _937 * 6.283185482025146484375;
        float _941 = cos(_939);
        float _943 = _937 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = _941 + (-1.0);
        float _949 = fma(_945, _935, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _951 = _947 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _931 * _949;
        float _955 = fma(_893, _941, _951);
        float _957 = fma(_821, _953, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _959 = fma(_817, _953, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _913 = _957;
        _923 = _955;
        _917 = _959;
        _903 = _937;
        _905 = _931;
    }
    float _961 = _913;
    float _963 = _923;
    float _965 = _917;
    float _967 = _903;
    float _969 = _905;
    float _971 = _969;
    float _973 = _963;
    float _975 = _961;
    float _977 = _965;
    float _979 = _967;
    if (_883)
    {
        _907 = 1.0;
    }
    float _981 = _907;
    float _983 = _981;
    if (!_841)
    {
        float _985 = sqrt(_895);
        float _987 = -_433;
        float _989 = _987 + _961;
        float _991 = -_435;
        float _993 = _991 + _963;
        float _995 = -_443;
        float _997 = _995 + _965;
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1003 = precise::min(_985, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1005 = _999 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1007 = _1003 * _1001;
        float _1009 = _1005 * _1007;
        float _1011 = fma(_989, _1009, _433);
        float _1013 = fma(_993, _1009, _435);
        float _1015 = fma(_997, _1009, _443);
        _971 = _1007;
        _973 = _1013;
        _975 = _1011;
        _977 = _1015;
        _979 = _1001;
    }
    float _1017 = _971;
    float _1019 = _973;
    float _1021 = _975;
    float _1023 = _977;
    float _1025 = _979;
    float _1027 = _1025;
    float _1029 = _1017;
    if (_883)
    {
        _909 = 1.0;
    }
    float _1031 = _909;
    float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1035 = _867 * _1033;
    float _1037 = _1031;
    if (!_883)
    {
        float _1039 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1041 = _1039 * 0.15915493667125701904296875;
        float _1043 = _1041 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1049 = _1047 * 0.15915493667125701904296875;
        float _1051 = _1041 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        float _1055 = 1.0 / _1045;
        float _1057 = _1049 * 6.283185482025146484375;
        float _1059 = cos(_1057);
        float _1061 = _1053 * _1055;
        float _1063 = _1049 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1059 * _1061;
        float _1069 = 1.0 / _1067;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1073 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1071;
        float _1075 = 1.0 / _1073;
        float _1077 = _1065 * _1069;
        float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1081 = fma(_1035, _1077, _1079);
        float _1083 = _1081 * _1075;
        float _1085 = precise::clamp(_1083, 0.0, 1.0);
        _1027 = _1049;
        _1029 = _1055;
        _983 = _1085;
    }
    float _1087 = _1027;
    float _1089 = _1029;
    float _1091 = _983;
    float _1093 = _1087;
    float _1095 = _1089;
    if (!_883)
    {
        float _1097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1099 = _1097 * 0.15915493667125701904296875;
        float _1101 = _1099 * 6.283185482025146484375;
        float _1103 = cos(_1101);
        float _1105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1099 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = 1.0 / _1103;
        float _1115 = _1107 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1111 * _1113;
        float _1121 = _1107 * 6.283185482025146484375;
        float _1123 = sin(_1121);
        float _1125 = _1117 * _1119;
        float _1127 = 1.0 / _1125;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1131 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1129;
        float _1133 = 1.0 / _1131;
        float _1135 = _1123 * _1127;
        float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1139 = fma(_1035, _1135, _1137);
        float _1141 = _1139 * _1133;
        float _1143 = precise::clamp(_1141, 0.0, 1.0);
        float _1145 = -_1143;
        float _1147 = _1145 + 1.0;
        _1093 = _1111;
        _1095 = _1099;
        _1037 = _1147;
    }
    float _1149 = _1093;
    float _1151 = _1095;
    float _1153 = _1037;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1157 = _1019 + _1155;
    float _1159 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1161 = _1021 + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = _1023 + _1163;
    float _1167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1169 = _1157 * _1157;
    float _1171 = fma(_1161, _1161, _1169);
    float _1173 = precise::max(0.0, _1167);
    float _1175 = fma(_1165, _1165, _1171);
    float _1177 = rsqrt(_1175);
    float _1179 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1181 = _1161 * _1179;
    float _1183 = _1165 * _1179;
    float _1185 = -_1179;
    float _1187 = -_1173;
    float _1189 = fma(_1157, _1185, _1187);
    float _1191 = _1181 * _1181;
    float _1193 = _1183 * _1183;
    float _1195 = _1191 + _1193;
    float _1197 = sqrt(_1195);
    bool _1199 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1197 + _1201;
    float _1205 = _1149;
    float _1207 = _1157;
    float _1209 = _1151;
    float _1211 = _1203;
    float _1213 = _1173;
    float _1215 = _1181;
    float _1217 = _1179;
    if (_1199)
    {
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1205 = _1219;
    }
    float _1221 = _1205;
    if (_1199)
    {
        float _1223 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1207 = _1223;
    }
    float _1225 = _1207;
    float _1227 = _1225;
    if (_1199)
    {
        float _1229 = rsqrt(_1195);
        _1209 = _1229;
    }
    float _1231 = _1209;
    float _1233 = _1221;
    float _1235 = _1231;
    if (_1199)
    {
        float _1237 = _1203 * _1221;
        _1211 = _1237;
    }
    float _1239 = _1211;
    if (_1199)
    {
        float _1241 = _1239 * 0.15915493667125701904296875;
        _1233 = _1241;
    }
    float _1243 = _1233;
    float _1245 = _1165;
    float _1247 = _1243;
    if (_1199)
    {
        float _1249 = _1243 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        _1245 = _1251;
    }
    float _1253 = _1245;
    float _1255 = _1239;
    if (_1199)
    {
        float _1257 = _1243 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = _1253;
    if (_1199)
    {
        float _1265 = fma(_1253, _1225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1227 = _1265;
    }
    float _1267 = _1227;
    float _1269 = _1267;
    if (!_1199)
    {
        _1263 = _1189;
    }
    float _1271 = _1263;
    float _1273 = _1271;
    if (!_1199)
    {
        _1247 = _1191;
    }
    float _1275 = _1247;
    float _1277 = _1275;
    if (_1199)
    {
        float _1279 = _1231 * _1267;
        _1235 = _1279;
    }
    float _1281 = _1235;
    if (!_1199)
    {
        _1269 = _1183;
    }
    float _1283 = _1269;
    float _1285 = _1283;
    float _1287 = _1261;
    if (_1199)
    {
        float _1289 = _1261 + (-1.0);
        _1213 = _1289;
    }
    float _1291 = _1213;
    if (_1199)
    {
        float _1293 = _1181 * _1281;
        _1215 = _1293;
    }
    float _1295 = _1215;
    if (_1199)
    {
        float _1297 = _1183 * _1281;
        _1285 = _1297;
    }
    float _1299 = _1285;
    if (_1199)
    {
        float _1301 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1217 = _1301;
    }
    float _1303 = _1217;
    if (_1199)
    {
        float _1305 = _1295 * _1295;
        _1277 = _1305;
    }
    float _1307 = _1277;
    float _1309 = sqrt(_1175);
    if (_1199)
    {
        float _1311 = fma(_1189, _1261, _1303);
        _1273 = _1311;
    }
    float _1313 = _1273;
    if (!_1199)
    {
        _1287 = _1193;
    }
    float _1315 = _1287;
    float _1317 = _1315;
    if (_1199)
    {
        float _1319 = _1299 * _1299;
        _1317 = _1319;
    }
    float _1321 = _1317;
    float _1323 = fma(_1313, _1313, _1307);
    float _1325 = _1323 + _1321;
    float _1327 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1329 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1331 = rsqrt(_1325);
    float _1333 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1327);
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1337 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1335);
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1343 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1345 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1347 = -_1339;
    float _1349 = _1347 + 1.0;
    float _1351 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1341);
    float _1353 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1343);
    float _1355 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1357 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1333);
    float _1359 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1351);
    float _1361 = abs(_1349);
    float _1363 = log2(_1361);
    float _1365 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1367 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    float _1369 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1371 = _1331 * _1295;
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1331 * _1313;
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1381 = _1357 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1383 = _1331 * _1299;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1377);
    float _1387 = -_1379;
    float _1389 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1387);
    float _1391 = _1381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1393 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1385);
    float _1397 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1399 = -_1383;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1389);
    float _1403 = -_1391;
    float _1405 = fma(_1403, _1329, 1.0);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1409 = exp2(_1397);
    float _1411 = fma(_1401, -0.5, 0.5);
    float _1413 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1415 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1417 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1413);
    float _1419 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1415);
    float _1421 = log2(_1405);
    float _1423 = fma(_1401, 0.5, 0.5);
    float _1425 = _1375 + 1.0;
    float _1427 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1417);
    float _1429 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1419);
    float _1431 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1433 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1427);
    float _1435 = 1.0 / _1407;
    float _1437 = -_1375;
    float _1439 = fma(_1409, _1425, _1437);
    float _1441 = fma(_1423, _1431, -0.212114393711090087890625);
    float _1443 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1429);
    float _1445 = fma(_1423, _1441, 1.570728778839111328125);
    float _1447 = sqrt(_1411);
    float _1449 = _1421 * 0.693147182464599609375;
    float _1451 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1453 = _1433 * _1435;
    float _1455 = _1443 * _1435;
    float _1457 = fma(_1439, 0.5, 0.5);
    float _1459 = fma(_1453, 0.5, 0.5);
    float _1461 = fma(_1455, -0.5, 0.5);
    float _1463 = _1447 * 0.636619746685028076171875;
    float3 _3716 = float3(_1459, _1461, _1451);
    float _1465 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3716, float3(0.0), isnan(_3716)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3716, float3(0.0), isnan(_3716)), level(0.0)).x;
    float _1467 = -_1445;
    float _1469 = fma(_1463, _1467, 1.0);
    float3 _3732 = float3(_1459, _1461, _1451);
    float4 _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3732, float3(0.0), isnan(_3732)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3732, float3(0.0), isnan(_3732)), level(0.0)).xyzw;
    float _1474 = _1472.x;
    float _1476 = _1472.y;
    float _1478 = _1472.z;
    float _1480 = _1472.w;
    float2 _3749 = float2(_1469, _1457);
    float3 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3749, float2(0.0), isnan(_3749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3749, float2(0.0), isnan(_3749)), level(0.0)).xyz;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    bool _1492 = _147 > 0.5;
    float _1494 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1496 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1498 = _1091 * _1153;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = exp2(_1494);
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1508 = _1506 != 0;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1512 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1496);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1518 = _365 > 0.5;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1522 = -_195;
    int _1524 = _1492 ? as_type<int>(_1522) : as_type<int>(_195);
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1528 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1534 = !_1502;
    float _1536 = _1534 ? _195 : as_type<float>(_1524);
    float _1538 = -_1504;
    float _1540 = _1538 + 1.0;
    float _1542 = -_175;
    int _1544 = _1518 ? as_type<int>(_1542) : as_type<int>(_175);
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_64.x = _1528;
    out.m_64.y = _1514;
    out.m_64.z = _1530;
    out.m_64.w = _1526;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1554 = !_1508;
    float _1556 = _1554 ? _175 : as_type<float>(_1544);
    float _1558 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1560 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1566 = _1091 > 0.0;
    bool _1568 = isnan(_1091);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan(0.0);
    bool _1574 = _1570 || _1572;
    float _1576 = _1536 + 0.5;
    float _1578 = -_1556;
    float _1580 = _1578 + 0.5;
    bool _1582 = _1153 <= 0.0;
    bool _1584 = !_1574;
    bool _1586 = _1582 || _1584;
    out.m_66.x = _1560;
    out.m_66.y = _1562;
    out.m_66.z = _1564;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1590 = _1498 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1592 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1512);
    float _1594 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1596 = -_1558;
    float _1598 = _1596 + 1.0;
    float _1600 = _253 * _1590;
    float _1602 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1592);
    float _1604 = _1594 * _1532;
    float _1606 = _1588 * _1552;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1610 = _1602 + _1407;
    out.m_45.x = _1608;
    float _1612 = _1610 * 0.5;
    out.m_68.x = _1604;
    out.m_68.y = _1606;
    out.gl_Position.x = _1433;
    out.gl_Position.y = _1443;
    out.gl_Position.z = _1602;
    out.gl_Position.w = _1407;
    out.m_70.z = _1612;
    out.m_70.w = _1407;
    float _1614 = _1558 * _1465;
    float _1616 = _1480 * _1614;
    float _1618 = _1480 * _1598;
    float _1620 = _1490 * _1614;
    float _1622 = fma(_1486, _1616, _1474);
    float _1624 = fma(_1488, _1616, _1476);
    float _1626 = fma(_1480, _1620, _1478);
    out.m_72.x = _1622;
    out.m_72.y = _1624;
    out.m_72.z = _1626;
    out.m_72.w = _1618;
    if (!_1586)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1628;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

