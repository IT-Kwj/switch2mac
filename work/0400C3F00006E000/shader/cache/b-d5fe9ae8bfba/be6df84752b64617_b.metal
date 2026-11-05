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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1239 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1961 = as_type<float>(_107);
        out.gl_Position.z = _1961;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2031 = as_type<float>(_145);
        out.gl_Position.z = _2031;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_54.w;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    float _175 = 0.0;
    float _177 = _149;
    if (!_159)
    {
        float _179 = _149 * _149;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _149 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _149);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _259 = as_type<int>(_147) & 1;
    bool _261 = _259 != 0;
    float _263 = fma(_249, _163, _253);
    float _265 = fma(_249, _165, _255);
    float _267 = fma(_249, _167, _257);
    int _269 = as_type<int>(_147) & 2;
    bool _271 = _269 != 0;
    float _273 = fma(_263, _161, _169);
    float _275 = fma(_265, _161, _171);
    float _277 = fma(_267, _161, _173);
    bool _279 = !_261;
    float _281 = _279 ? (-0.5) : 0.5;
    bool _283 = !_271;
    float _285 = _283 ? (-0.5) : 0.5;
    bool _287 = !_251;
    float _305;
    if (!_287)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_91);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = in.m_58.x;
    float _323 = in.m_58.y;
    float _325 = in.m_58.z;
    bool _327 = _285 > 0.0;
    float _329 = in.m_60.x;
    float _331 = in.m_60.y;
    float _333 = in.m_60.z;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = in.m_62.x;
    float _341 = in.m_62.y;
    float _343 = in.m_62.z;
    bool _345 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _353 = _349 || _351;
    float _355 = 1.0 / _337;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _359 = 1.0 + _357;
    float _361 = in.m_56.z;
    float _363 = _319 * _125;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = 1.0 / _359;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _377 = _375 != 0;
    float _379 = _275 * _323;
    int _381 = _271 ? 0 : 1;
    float _383 = exp2(_363);
    float _385 = _275 * _331;
    float _387 = fma(_273, _321, _379);
    float _389 = _275 * _341;
    float _391 = fma(_273, _329, _385);
    int _393 = ~_381;
    int _395 = _393 + 1;
    int _397 = _395 + 1;
    float _399 = _361 * 2.0;
    int _401 = _397;
    float _403 = _325;
    if (!_327)
    {
        int _405 = ~_381;
        int _407 = _405 + 1;
        _401 = _407;
    }
    int _409 = _401;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _425 = _423 != 0;
    float _427 = _365 * 2.0;
    float _429 = floor(_399);
    float _431 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _433 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    float _443 = _367 * 2.0;
    float _445 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _447 = -_431;
    float _449 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _447);
    float _451 = float(_409);
    float _453 = floor(_427);
    float _455 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _457 = -_383;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _463 = _315 + _461;
    float _465 = -_445;
    float _467 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _465);
    float _469 = -_455;
    float _471 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _469);
    float _473 = _463 * _355;
    float _475 = _441 ? _459 : 0.0;
    float _477 = fma(_273, _339, _389);
    bool _479 = _429 >= 0.0;
    bool _481 = isnan(_429);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = 1.0 / _413;
    float _491 = _367 + _361;
    if (_353)
    {
        float _493 = _475 * _369;
        _127 = _493;
    }
    float _495 = _127;
    int _497 = _487 ? 0 : 1;
    float _499 = _361 + _365;
    bool _501 = _453 >= 0.0;
    bool _503 = isnan(_453);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _315 + _511;
    bool _515 = _429 > 0.0;
    float _517 = floor(_443);
    float _519 = _367 + _365;
    int _521 = _509 ? 0 : 1;
    float _523 = _491 + (-1.0);
    bool _525 = _453 > 0.0;
    float _527 = _519 + (-1.0);
    float _529 = _499 + (-1.0);
    float _531 = _513 * _489;
    float _533 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _535 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _537 = _467 * _467;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _541 = _361 + (-0.5);
    float _543 = fma(_449, _449, _537);
    int _545 = ~_497;
    int _547 = _545 + 1;
    int _549 = _547 + 1;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _551;
    int _555 = _549;
    if (!_515)
    {
        int _557 = ~_497;
        int _559 = _557 + 1;
        _555 = _559;
    }
    int _561 = _555;
    float _563 = fma(_471, _471, _543);
    bool _565 = _517 > 0.0;
    float _567 = fma(_553, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _569 = ~_521;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _579 = _573;
    if (!_525)
    {
        int _581 = ~_521;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = _517 >= 0.0;
    bool _593 = isnan(_517);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = rsqrt(_563);
    bool _603 = !_417;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_589, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _609 = _599 ? 0 : 1;
    float _611 = fma(_577, _531, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _613 = abs(_605);
    float _615 = 0.0 + _451;
    float _617 = precise::clamp(_615, 0.0, 1.0);
    int _619 = ~_609;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = fma(_277, _343, _477);
    int _627 = _623;
    if (!_565)
    {
        int _629 = ~_609;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = fma(_277, _333, _391);
    float _637 = float(_613);
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _641 = float(_561);
    float _643 = fma(_277, _325, _387);
    bool _645 = !_421;
    int _647 = _645 ? 0 : 1;
    float _649 = _467 * _601;
    bool _651 = !_425;
    int _653 = _651 ? 0 : 1;
    float _655 = _637 * _641;
    int _657 = abs(_647);
    float _659 = _449 * _601;
    bool _661 = _365 > 0.5;
    float _663 = _655 * (-2.0);
    float _665 = _649 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _667 = _365 + (-0.5);
    bool _669 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _671 = isnan(_315);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _471 * _601;
    float _683 = float(_657);
    float _685 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[8].x, _665);
    float _687 = float(_585);
    float _689 = fma(_535, _663, _535);
    int _691 = abs(_653);
    float _693 = -_679;
    float _695 = _693 + 1.0;
    bool _697 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _699 = isnan(_315);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _683 * _687;
    float _711 = float(_691);
    float _713 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[10].x, _685);
    float _715 = float(_633);
    float _717 = _667 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _719 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _721 = isnan(_315);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _707 * _695;
    float _733 = -_707;
    float _735 = _733 + 1.0;
    bool _737 = _367 > 0.5;
    float _739 = _709 * (-2.0);
    float _741 = _367 + (-0.5);
    float _743 = _711 * _715;
    float _745 = fma(_689, _495, _717);
    float _747 = _729 * _735;
    float _749 = fma(_533, _739, _533);
    float _751 = _741 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _753 = _273 * _713;
    float _755 = _743 * (-2.0);
    float _757 = _745 * 0.15915493667125701904296875;
    float _759 = _607 * _747;
    float _761 = fma(_749, _495, _751);
    float _763 = _567 * _747;
    float _765 = _753 * (-1.60000002384185791015625);
    float _767 = fma(_539, _755, _539);
    float _769 = _761 * 0.15915493667125701904296875;
    float _771 = in.m_54.x;
    float _773 = in.m_54.y;
    float _775 = fma(_765, _755, _765);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = -_729;
    float _783 = _781 + 1.0;
    float _785 = _757 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[196].z, _775);
    float _791 = fma(_779, _531, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _759);
    float _795 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _797 = fma(_767, _495, _789);
    float _799 = -_281;
    int _801 = _661 ? as_type<int>(_799) : as_type<int>(_281);
    float _803 = fma(_791, _731, _793);
    float _805 = fma(_611, _731, _795);
    float _807 = _797 * 0.15915493667125701904296875;
    float _809 = _757 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].x, _803);
    float _815 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].y, _805);
    float _817 = _281 * 0.5;
    bool _819 = !_373;
    float _821 = _819 ? _281 : as_type<float>(_801);
    float _823 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _825 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _827 = fma(_817, _617, _817);
    float _829 = _769 * 6.283185482025146484375;
    float _831 = sin(_829);
    float _833 = _821 + 0.5;
    float _835 = _815 * _773;
    float _837 = _813 * _771;
    float _839 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _285);
    float _841 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    float _843 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _845 = _837 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _847 = _769 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _833 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _853 = _843 * _839;
    float _855 = _845 * _841;
    float _857 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _859 = _807 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = _811 * _831;
    float _865 = _787 * _831;
    float _867 = _807 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _787 * _849;
    float _873 = _811 * _849;
    float _875 = _787 * _861;
    float _877 = _811 * _861;
    float _879 = _849 * _861;
    float _881 = _831 * _861;
    float _883 = _875 * _853;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _887 = -_863;
    float _889 = fma(_869, _871, _887);
    float _891 = -_871;
    float _893 = fma(_869, _863, _891);
    float _895 = fma(_869, _873, _865);
    float _897 = _877 * _853;
    float _899 = fma(_869, _865, _873);
    float _901 = -_853;
    float _903 = _869 * _901;
    float _905 = fma(_889, _855, _883);
    float _907 = fma(_895, _855, _897);
    float _909 = fma(_879, _855, _903);
    float _911 = fma(_893, _823, _907);
    float _913 = fma(_881, _823, _909);
    float _915 = fma(_899, _823, _905);
    float _917 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _921 = _851 * _885;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _917);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _919);
    float _927 = _635 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _927 + _939;
    float _949 = _825 + _941;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _953 = -_285;
    int _955 = _737 ? as_type<int>(_953) : as_type<int>(_285);
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _959 = _947 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _949 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _967 = !_377;
    float _969 = _967 ? _285 : as_type<float>(_955);
    float _971 = _959 * _959;
    float _973 = _963 * _963;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _977 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = -_969;
    float _981 = _979 + 0.5;
    float _983 = _971 + _973;
    float _985 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _989 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _991 = sqrt(_983);
    float _993 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _977;
    out.m_64.y = _945;
    out.m_64.z = _985;
    float _995 = _989 * _639;
    float _997 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _987);
    float _999 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _921;
    out.m_66.y = _995;
    float _1003 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _997);
    out.m_68.x = _993;
    out.m_68.y = _999;
    out.m_68.z = _1001;
    out.m_68.w = _975;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1007 = _991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1009 = _857 + _1005;
    float _1011 = _993;
    float _1013 = _999;
    float _1015 = _971;
    float _1017 = _973;
    float _1019 = _921;
    if (!_1007)
    {
        _403 = _947;
    }
    float _1021 = _403;
    float _1023 = _1021;
    if (!_1007)
    {
        _1011 = _949;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (!_1007)
    {
        _1013 = _1009;
    }
    float _1029 = _1013;
    bool _1031 = !_1007;
    float _1033 = _1029;
    if (!_1031)
    {
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1039 = _991 + _1037;
        float _1041 = _1009 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1043 = rsqrt(_983);
        float _1045 = _1039 * _1035;
        float _1047 = _1045 * 0.15915493667125701904296875;
        float _1049 = _1047 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = _1047 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        float _1057 = fma(_1051, _1041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1059 = _1043 * _1057;
        float _1061 = fma(_959, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = _1055 + (-1.0);
        float _1065 = fma(_963, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1069 = _1061 + _1067;
        float _1071 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1075 = _1065 + _1073;
        float _1077 = _1069 * _1069;
        float _1079 = fma(_1009, _1055, _1071);
        float _1081 = _1075 * _1075;
        _1033 = _1079;
        _1015 = _1077;
        _1017 = _1081;
        _1023 = _1061;
        _1027 = _1065;
    }
    float _1083 = _1033;
    float _1085 = _1015;
    float _1087 = _1017;
    float _1089 = _1023;
    float _1091 = _1027;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1095 = _1083 + _1093;
    float _1097 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1099 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1103 = fma(_1095, _1095, _1085);
    float _1105 = -_869;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1097);
    float _1109 = -_869;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1113 = _895 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1115 = _1103 + _1087;
    float _1117 = _895 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1119 = _895 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1121 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1125 = -_869;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1101);
    float _1129 = sqrt(_1115);
    float _1131 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1113);
    float _1133 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1117);
    float _1135 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1119);
    float _1137 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1139 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1123);
    float _1141 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1107);
    float _1143 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1111);
    float _1145 = _285 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1147 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1149 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1127);
    float _1151 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1153 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1155 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1135);
    float _1157 = _1145 * _1141;
    float _1159 = _1145 * _1143;
    bool _1161 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1163 = isnan(_1129);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1169 = _1165 || _1167;
    float _1171 = _827 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1173 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1147);
    float _1175 = _1145 * _1149;
    float _1177 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1137);
    float _1179 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1139);
    float _1181 = fma(_1171, _1151, _1157);
    float _1183 = fma(_1171, _1153, _1159);
    float _1185 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1173);
    float _1187 = fma(_1171, _1155, _1175);
    float _1189 = _1177 + _1181;
    float _1191 = _1179 + _1183;
    float _1193 = _1185 + _1187;
    float _1195 = _1181;
    float _1197 = _1083;
    float _1199 = _1157;
    float _1201 = _1155;
    float _1203 = _1149;
    if (!_1169)
    {
        _1195 = 1.0;
    }
    float _1205 = _1195;
    bool _1207 = !_1169;
    float _1209 = _1205;
    if (!_1207)
    {
        bool _1211 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1213 = isnan(_1129);
        bool _1215 = _1211 || _1213;
        bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1219 = _1215 || _1217;
        if (!_1219)
        {
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = _1129 + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1227 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1225;
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1233 = 1.0 / _1227;
            float _1235 = _1223 * _1233;
            float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1209 = _1237;
            _1239 = true;
        }
        else
        {
            bool _1241 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1243 = isnan(_1129);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1249 = _1245 || _1247;
            if (!_1249)
            {
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1129 + _1251;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1263 = 1.0 / _1257;
                float _1265 = _1253 * _1263;
                float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1209 = _1267;
                _1239 = true;
            }
            else
            {
                _1209 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1239 = false;
    float _1269 = _1209;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1273 = _1089 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1091 + _1275;
    bool _1279 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1291 = _1083 + _1289;
    float _1293 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1295 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1297 = fma(_1291, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1299 = _1277;
    float _1301 = _1273;
    if (_1287)
    {
        _1299 = _1293;
    }
    float _1303 = _1299;
    float _1305 = _1303;
    if (_1287)
    {
        _1197 = _1297;
    }
    float _1307 = _1197;
    float _1309 = _1307;
    if (_1287)
    {
        _1301 = _1295;
    }
    float _1311 = _1301;
    float _1313 = _1311;
    if (!_1287)
    {
        float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1317 = _857 + _1315;
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1321 = _927 + _1319;
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1325 = _1317 * _1317;
        float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1329 = _825 + _1327;
        float _1331 = fma(_1321, _1321, _1325);
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1335 = fma(_1329, _1329, _1331);
        float _1337 = sqrt(_1335);
        float _1339 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1341 = precise::min(_1337, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1343 = _1341 * _1333;
        float _1345 = -_927;
        float _1347 = _1345 + _1293;
        float _1349 = _1339 * _1343;
        float _1351 = -_857;
        float _1353 = _1351 + _1297;
        float _1355 = -_825;
        float _1357 = _1355 + _1295;
        float _1359 = fma(_1347, _1349, _927);
        float _1361 = fma(_1353, _1349, _857);
        float _1363 = fma(_1357, _1349, _825);
        _1309 = _1361;
        _1305 = _1359;
        _1313 = _1363;
        _1199 = _1333;
    }
    float _1365 = _1309;
    float _1367 = _1305;
    float _1369 = _1313;
    float _1371 = _1199;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1367 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1383 = _1369 + _1381;
    float _1385 = _1375 * _1375;
    float _1387 = fma(_1379, _1379, _1385);
    float _1389 = fma(_1383, _1383, _1387);
    float _1391 = rsqrt(_1389);
    float _1393 = _1379 * _1391;
    float _1395 = _1383 * _1391;
    float _1397 = _1375 * _1391;
    float _1399 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1401 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 * _1401;
    float _1407 = _1403 + _1405;
    float _1409 = sqrt(_1407);
    bool _1411 = _1409 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1415 = _1409 + _1413;
    float _1417 = _1293;
    float _1419 = _1407;
    float _1421 = _1415;
    if (_1411)
    {
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1417 = _1423;
    }
    float _1425 = _1417;
    if (_1411)
    {
        float _1427 = rsqrt(_1407);
        _1419 = _1427;
    }
    float _1429 = _1419;
    float _1431 = _1429;
    if (_1411)
    {
        float _1433 = _1415 * _1425;
        _1421 = _1433;
    }
    float _1435 = _1421;
    if (_1411)
    {
        float _1437 = _1435 * 0.15915493667125701904296875;
        _1019 = _1437;
    }
    float _1439 = _1019;
    float _1441 = _1371;
    if (_1411)
    {
        float _1443 = _1439 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1451 = precise::max(0.0, _1449);
    float _1453 = _1425;
    float _1455 = _1451;
    float _1457 = _1449;
    if (_1411)
    {
        float _1459 = _1439 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        _1453 = _1461;
    }
    float _1463 = _1453;
    float _1465 = -_1397;
    float _1467 = -_1451;
    float _1469 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1467);
    if (_1411)
    {
        float _1471 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1471;
    }
    float _1473 = _1455;
    float _1475 = sqrt(_1389);
    float _1477 = _1473;
    float _1479 = _1447;
    if (_1411)
    {
        float _1481 = fma(_1447, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1477 = _1481;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (!_1411)
    {
        _1479 = _1399;
    }
    float _1487 = _1479;
    float _1489 = _1487;
    float _1491 = _1463;
    if (_1411)
    {
        float _1493 = _1463 + (-1.0);
        _1457 = _1493;
    }
    float _1495 = _1457;
    float _1497 = _1495;
    if (_1411)
    {
        float _1499 = _1429 * _1483;
        _1201 = _1499;
    }
    float _1501 = _1201;
    if (!_1411)
    {
        _1485 = _1469;
    }
    float _1503 = _1485;
    float _1505 = _1503;
    if (_1411)
    {
        float _1507 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1203 = _1507;
    }
    float _1509 = _1203;
    if (_1411)
    {
        float _1511 = _1399 * _1501;
        _1489 = _1511;
    }
    float _1513 = _1489;
    if (!_1411)
    {
        _1497 = _1401;
    }
    float _1515 = _1497;
    float _1517 = _1515;
    if (_1411)
    {
        float _1519 = _1401 * _1501;
        _1517 = _1519;
    }
    float _1521 = _1517;
    if (!_1411)
    {
        _1431 = _1403;
    }
    float _1523 = _1431;
    float _1525 = _1523;
    if (_1411)
    {
        float _1527 = fma(_1469, _1463, _1509);
        _1505 = _1527;
    }
    float _1529 = _1505;
    if (_1411)
    {
        float _1531 = _1513 * _1513;
        _1525 = _1531;
    }
    float _1533 = _1525;
    if (!_1411)
    {
        _1491 = _1405;
    }
    float _1535 = _1491;
    float _1537 = _1535;
    if (_1411)
    {
        float _1539 = _1521 * _1521;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_1529, _1529, _1533);
    float _1545 = _1543 + _1541;
    float _1547 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1475, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1557 = rsqrt(_1545);
    float _1559 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1547);
    float _1561 = -_1553;
    float _1563 = _1561 + 1.0;
    float _1565 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1555);
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1569 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1573 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1565);
    float _1575 = abs(_1563);
    float _1577 = log2(_1575);
    float _1579 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1571);
    float _1583 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1585 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1589 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1591 = _1557 * _1513;
    float _1593 = _1557 * _1529;
    float _1595 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1597 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1599 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1601 = _1557 * _1521;
    float _1603 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1587);
    float _1607 = -_1599;
    float _1609 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1607);
    float _1611 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1597);
    float _1613 = -_1603;
    float _1615 = fma(_1613, _1567, 1.0);
    float _1617 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = -_1601;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1609);
    float _1623 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1625 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1627 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1629 = fma(_1621, -0.5, 0.5);
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1623);
    float _1633 = log2(_1615);
    float _1635 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1621, 0.5, 0.5);
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1627);
    float _1641 = _1593 + 1.0;
    float _1643 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1645 = fma(_1637, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1647 = exp2(_1625);
    float _1649 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1643);
    float _1651 = fma(_1637, _1645, -0.212114393711090087890625);
    float _1653 = fma(_1637, _1651, 1.570728778839111328125);
    float _1655 = 1.0 / _1631;
    float _1657 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1639);
    float _1659 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float _1661 = _1633 * 0.693147182464599609375;
    float _1663 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1657);
    float _1665 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1667 = sqrt(_1629);
    float _1669 = -_1593;
    float _1671 = fma(_1647, _1641, _1669);
    float _1673 = fma(_1671, 0.5, 0.5);
    float _1675 = _1663 * _1655;
    float _1677 = _1659 * _1655;
    float _1679 = fma(_1675, 0.5, 0.5);
    float _1681 = fma(_1677, -0.5, 0.5);
    float _1683 = _1667 * 0.636619746685028076171875;
    float _1685 = -_1653;
    float _1687 = fma(_1683, _1685, 1.0);
    float3 _4501 = float3(_1679, _1681, _1665);
    float _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4501, float3(0.0), isnan(_4501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4501, float3(0.0), isnan(_4501)), level(0.0)).x;
    float3 _4512 = float3(_1679, _1681, _1665);
    float4 _1692 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4512, float3(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4512, float3(0.0), isnan(_4512)), level(0.0)).xyzw;
    float _1694 = _1692.x;
    float _1696 = _1692.y;
    float _1698 = _1692.z;
    float _1700 = _1692.w;
    float2 _4529 = float2(_1687, _1673);
    float3 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4529, float2(0.0), isnan(_4529)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4529, float2(0.0), isnan(_4529)), level(0.0)).xyz;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1716 = _1191 * _1397;
    float _1718 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1720;
    float _1724 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1714);
    float _1726 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1718);
    float _1728 = fma(_1189, _1393, _1716);
    float _1730 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1732 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan(0.5);
    bool _1740 = _1736 || _1738;
    float _1742 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1744 = 1.0 / _1722;
    float _1746 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1748 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1724);
    float _1750 = fma(_1193, _1395, _1728);
    float _1752 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1746);
    float _1754 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = abs(_1750);
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1760 = _1756 + _1758;
    float _1762 = 1.0 / _1742;
    float _1764 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1752);
    float _1766 = _1754 + _1742;
    float _1768 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1764);
    float _1770 = exp2(_1730);
    float _1772 = _1760 * _1744;
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = fma(_1774, -2.0, 3.0);
    float _1778 = _1774 * _1774;
    float _1780 = _1766 * _1762;
    float _1782 = _1780 * 0.5;
    float _1784 = _1766;
    if (_1740)
    {
        _1784 = 1.0;
    }
    float _1786 = _1784;
    float _1788 = _1786;
    if (!_1740)
    {
        float _1790 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1792);
        float _1796 = _1790 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1800;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = 1.0 / _1794;
        float _1820 = _1814 * _1816;
        float _1822 = _1804 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1832 = _1818 * _1830;
        float _1834 = 1.0 / _1820;
        float _1836 = 1.0 / _1828;
        float _1838 = _1824 * _1834;
        float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1842 = fma(_1838, _1832, _1840);
        float _1844 = _1842 * _1836;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        _1788 = _1846;
    }
    float _1848 = _1788;
    float _1850 = -_1770;
    float _1852 = _1850 + 1.0;
    float _1854 = _1778 * _1776;
    float _1856 = _1631 * 0.5;
    bool _1858 = _1848 > 0.0;
    bool _1860 = isnan(_1848);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(0.0);
    bool _1866 = _1862 || _1864;
    float _1868 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1870 = _1854 * _1848;
    float _1872 = fma(_1659, -0.5, _1856);
    float _1874 = _1768 + _1631;
    float _1876 = _1868 * _1689;
    float _1878 = _1663 + _1631;
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = _1700 * _1876;
    float _1888 = _1710 * _1876;
    float _1890 = _1874 * 0.5;
    float _1892 = fma(_1706, _1886, _1694);
    float _1894 = _1878 * 0.5;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1898 = fma(_1708, _1886, _1696);
    float _1900 = _1700 * _1884;
    float _1902 = fma(_1700, _1888, _1698);
    out.gl_Position.x = _1663;
    out.gl_Position.y = _1659;
    out.gl_Position.z = _1768;
    out.gl_Position.w = _1631;
    out.m_70.x = _1894;
    out.m_70.y = _1872;
    out.m_70.z = _1890;
    out.m_70.w = _1631;
    out.m_47.x = _1896;
    out.m_72.x = _1892;
    out.m_72.y = _1898;
    out.m_72.z = _1902;
    out.m_72.w = _1900;
    if (_1866)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1904;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1239 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1961 = as_type<float>(_107);
        out.gl_Position.z = _1961;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2031 = as_type<float>(_145);
        out.gl_Position.z = _2031;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_54.w;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    float _175 = 0.0;
    float _177 = _149;
    if (!_159)
    {
        float _179 = _149 * _149;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _149 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _149);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _259 = as_type<int>(_147) & 1;
    bool _261 = _259 != 0;
    float _263 = fma(_249, _163, _253);
    float _265 = fma(_249, _165, _255);
    float _267 = fma(_249, _167, _257);
    int _269 = as_type<int>(_147) & 2;
    bool _271 = _269 != 0;
    float _273 = fma(_263, _161, _169);
    float _275 = fma(_265, _161, _171);
    float _277 = fma(_267, _161, _173);
    bool _279 = !_261;
    float _281 = _279 ? (-0.5) : 0.5;
    bool _283 = !_271;
    float _285 = _283 ? (-0.5) : 0.5;
    bool _287 = !_251;
    float _305;
    if (!_287)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_91);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = in.m_58.x;
    float _323 = in.m_58.y;
    float _325 = in.m_58.z;
    bool _327 = _285 > 0.0;
    float _329 = in.m_60.x;
    float _331 = in.m_60.y;
    float _333 = in.m_60.z;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = in.m_62.x;
    float _341 = in.m_62.y;
    float _343 = in.m_62.z;
    bool _345 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _353 = _349 || _351;
    float _355 = 1.0 / _337;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _359 = 1.0 + _357;
    float _361 = in.m_56.z;
    float _363 = _319 * _125;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = 1.0 / _359;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _377 = _375 != 0;
    float _379 = _275 * _323;
    int _381 = _271 ? 0 : 1;
    float _383 = exp2(_363);
    float _385 = _275 * _331;
    float _387 = fma(_273, _321, _379);
    float _389 = _275 * _341;
    float _391 = fma(_273, _329, _385);
    int _393 = ~_381;
    int _395 = _393 + 1;
    int _397 = _395 + 1;
    float _399 = _361 * 2.0;
    int _401 = _397;
    float _403 = _325;
    if (!_327)
    {
        int _405 = ~_381;
        int _407 = _405 + 1;
        _401 = _407;
    }
    int _409 = _401;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _425 = _423 != 0;
    float _427 = _365 * 2.0;
    float _429 = floor(_399);
    float _431 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _433 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    float _443 = _367 * 2.0;
    float _445 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _447 = -_431;
    float _449 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _447);
    float _451 = float(_409);
    float _453 = floor(_427);
    float _455 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _457 = -_383;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _463 = _315 + _461;
    float _465 = -_445;
    float _467 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _465);
    float _469 = -_455;
    float _471 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _469);
    float _473 = _463 * _355;
    float _475 = _441 ? _459 : 0.0;
    float _477 = fma(_273, _339, _389);
    bool _479 = _429 >= 0.0;
    bool _481 = isnan(_429);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = 1.0 / _413;
    float _491 = _367 + _361;
    if (_353)
    {
        float _493 = _475 * _369;
        _127 = _493;
    }
    float _495 = _127;
    int _497 = _487 ? 0 : 1;
    float _499 = _361 + _365;
    bool _501 = _453 >= 0.0;
    bool _503 = isnan(_453);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _315 + _511;
    bool _515 = _429 > 0.0;
    float _517 = floor(_443);
    float _519 = _367 + _365;
    int _521 = _509 ? 0 : 1;
    float _523 = _491 + (-1.0);
    bool _525 = _453 > 0.0;
    float _527 = _519 + (-1.0);
    float _529 = _499 + (-1.0);
    float _531 = _513 * _489;
    float _533 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _535 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _537 = _467 * _467;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _541 = _361 + (-0.5);
    float _543 = fma(_449, _449, _537);
    int _545 = ~_497;
    int _547 = _545 + 1;
    int _549 = _547 + 1;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _551;
    int _555 = _549;
    if (!_515)
    {
        int _557 = ~_497;
        int _559 = _557 + 1;
        _555 = _559;
    }
    int _561 = _555;
    float _563 = fma(_471, _471, _543);
    bool _565 = _517 > 0.0;
    float _567 = fma(_553, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _569 = ~_521;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _579 = _573;
    if (!_525)
    {
        int _581 = ~_521;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = _517 >= 0.0;
    bool _593 = isnan(_517);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = rsqrt(_563);
    bool _603 = !_417;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_589, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _609 = _599 ? 0 : 1;
    float _611 = fma(_577, _531, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _613 = abs(_605);
    float _615 = 0.0 + _451;
    float _617 = precise::clamp(_615, 0.0, 1.0);
    int _619 = ~_609;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = fma(_277, _343, _477);
    int _627 = _623;
    if (!_565)
    {
        int _629 = ~_609;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = fma(_277, _333, _391);
    float _637 = float(_613);
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _641 = float(_561);
    float _643 = fma(_277, _325, _387);
    bool _645 = !_421;
    int _647 = _645 ? 0 : 1;
    float _649 = _467 * _601;
    bool _651 = !_425;
    int _653 = _651 ? 0 : 1;
    float _655 = _637 * _641;
    int _657 = abs(_647);
    float _659 = _449 * _601;
    bool _661 = _365 > 0.5;
    float _663 = _655 * (-2.0);
    float _665 = _649 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _667 = _365 + (-0.5);
    bool _669 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _671 = isnan(_315);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _471 * _601;
    float _683 = float(_657);
    float _685 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[8].x, _665);
    float _687 = float(_585);
    float _689 = fma(_535, _663, _535);
    int _691 = abs(_653);
    float _693 = -_679;
    float _695 = _693 + 1.0;
    bool _697 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _699 = isnan(_315);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _683 * _687;
    float _711 = float(_691);
    float _713 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[10].x, _685);
    float _715 = float(_633);
    float _717 = _667 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _719 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _721 = isnan(_315);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _707 * _695;
    float _733 = -_707;
    float _735 = _733 + 1.0;
    bool _737 = _367 > 0.5;
    float _739 = _709 * (-2.0);
    float _741 = _367 + (-0.5);
    float _743 = _711 * _715;
    float _745 = fma(_689, _495, _717);
    float _747 = _729 * _735;
    float _749 = fma(_533, _739, _533);
    float _751 = _741 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _753 = _273 * _713;
    float _755 = _743 * (-2.0);
    float _757 = _745 * 0.15915493667125701904296875;
    float _759 = _607 * _747;
    float _761 = fma(_749, _495, _751);
    float _763 = _567 * _747;
    float _765 = _753 * (-1.60000002384185791015625);
    float _767 = fma(_539, _755, _539);
    float _769 = _761 * 0.15915493667125701904296875;
    float _771 = in.m_54.x;
    float _773 = in.m_54.y;
    float _775 = fma(_765, _755, _765);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = -_729;
    float _783 = _781 + 1.0;
    float _785 = _757 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[196].z, _775);
    float _791 = fma(_779, _531, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _759);
    float _795 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _797 = fma(_767, _495, _789);
    float _799 = -_281;
    int _801 = _661 ? as_type<int>(_799) : as_type<int>(_281);
    float _803 = fma(_791, _731, _793);
    float _805 = fma(_611, _731, _795);
    float _807 = _797 * 0.15915493667125701904296875;
    float _809 = _757 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].x, _803);
    float _815 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].y, _805);
    float _817 = _281 * 0.5;
    bool _819 = !_373;
    float _821 = _819 ? _281 : as_type<float>(_801);
    float _823 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _825 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _827 = fma(_817, _617, _817);
    float _829 = _769 * 6.283185482025146484375;
    float _831 = sin(_829);
    float _833 = _821 + 0.5;
    float _835 = _815 * _773;
    float _837 = _813 * _771;
    float _839 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _285);
    float _841 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    float _843 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _845 = _837 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _847 = _769 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _833 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _853 = _843 * _839;
    float _855 = _845 * _841;
    float _857 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _859 = _807 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = _811 * _831;
    float _865 = _787 * _831;
    float _867 = _807 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _787 * _849;
    float _873 = _811 * _849;
    float _875 = _787 * _861;
    float _877 = _811 * _861;
    float _879 = _849 * _861;
    float _881 = _831 * _861;
    float _883 = _875 * _853;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _887 = -_863;
    float _889 = fma(_869, _871, _887);
    float _891 = -_871;
    float _893 = fma(_869, _863, _891);
    float _895 = fma(_869, _873, _865);
    float _897 = _877 * _853;
    float _899 = fma(_869, _865, _873);
    float _901 = -_853;
    float _903 = _869 * _901;
    float _905 = fma(_889, _855, _883);
    float _907 = fma(_895, _855, _897);
    float _909 = fma(_879, _855, _903);
    float _911 = fma(_893, _823, _907);
    float _913 = fma(_881, _823, _909);
    float _915 = fma(_899, _823, _905);
    float _917 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _921 = _851 * _885;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _917);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _919);
    float _927 = _635 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _927 + _939;
    float _949 = _825 + _941;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _953 = -_285;
    int _955 = _737 ? as_type<int>(_953) : as_type<int>(_285);
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _959 = _947 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _949 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _967 = !_377;
    float _969 = _967 ? _285 : as_type<float>(_955);
    float _971 = _959 * _959;
    float _973 = _963 * _963;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _977 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = -_969;
    float _981 = _979 + 0.5;
    float _983 = _971 + _973;
    float _985 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _989 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _991 = sqrt(_983);
    float _993 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _977;
    out.m_64.y = _945;
    out.m_64.z = _985;
    float _995 = _989 * _639;
    float _997 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _987);
    float _999 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _921;
    out.m_66.y = _995;
    float _1003 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _997);
    out.m_68.x = _993;
    out.m_68.y = _999;
    out.m_68.z = _1001;
    out.m_68.w = _975;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1007 = _991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1009 = _857 + _1005;
    float _1011 = _993;
    float _1013 = _999;
    float _1015 = _971;
    float _1017 = _973;
    float _1019 = _921;
    if (!_1007)
    {
        _403 = _947;
    }
    float _1021 = _403;
    float _1023 = _1021;
    if (!_1007)
    {
        _1011 = _949;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (!_1007)
    {
        _1013 = _1009;
    }
    float _1029 = _1013;
    bool _1031 = !_1007;
    float _1033 = _1029;
    if (!_1031)
    {
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1039 = _991 + _1037;
        float _1041 = _1009 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1043 = rsqrt(_983);
        float _1045 = _1039 * _1035;
        float _1047 = _1045 * 0.15915493667125701904296875;
        float _1049 = _1047 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = _1047 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        float _1057 = fma(_1051, _1041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1059 = _1043 * _1057;
        float _1061 = fma(_959, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = _1055 + (-1.0);
        float _1065 = fma(_963, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1069 = _1061 + _1067;
        float _1071 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1075 = _1065 + _1073;
        float _1077 = _1069 * _1069;
        float _1079 = fma(_1009, _1055, _1071);
        float _1081 = _1075 * _1075;
        _1033 = _1079;
        _1015 = _1077;
        _1017 = _1081;
        _1023 = _1061;
        _1027 = _1065;
    }
    float _1083 = _1033;
    float _1085 = _1015;
    float _1087 = _1017;
    float _1089 = _1023;
    float _1091 = _1027;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1095 = _1083 + _1093;
    float _1097 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1099 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1103 = fma(_1095, _1095, _1085);
    float _1105 = -_869;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1097);
    float _1109 = -_869;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1113 = _895 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1115 = _1103 + _1087;
    float _1117 = _895 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1119 = _895 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1121 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1125 = -_869;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1101);
    float _1129 = sqrt(_1115);
    float _1131 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1113);
    float _1133 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1117);
    float _1135 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1119);
    float _1137 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1139 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1123);
    float _1141 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1107);
    float _1143 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1111);
    float _1145 = _285 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1147 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1149 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1127);
    float _1151 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1153 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1155 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1135);
    float _1157 = _1145 * _1141;
    float _1159 = _1145 * _1143;
    bool _1161 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1163 = isnan(_1129);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1169 = _1165 || _1167;
    float _1171 = _827 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1173 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1147);
    float _1175 = _1145 * _1149;
    float _1177 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1137);
    float _1179 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1139);
    float _1181 = fma(_1171, _1151, _1157);
    float _1183 = fma(_1171, _1153, _1159);
    float _1185 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1173);
    float _1187 = fma(_1171, _1155, _1175);
    float _1189 = _1177 + _1181;
    float _1191 = _1179 + _1183;
    float _1193 = _1185 + _1187;
    float _1195 = _1181;
    float _1197 = _1083;
    float _1199 = _1157;
    float _1201 = _1155;
    float _1203 = _1149;
    if (!_1169)
    {
        _1195 = 1.0;
    }
    float _1205 = _1195;
    bool _1207 = !_1169;
    float _1209 = _1205;
    if (!_1207)
    {
        bool _1211 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1213 = isnan(_1129);
        bool _1215 = _1211 || _1213;
        bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1219 = _1215 || _1217;
        if (!_1219)
        {
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = _1129 + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1227 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1225;
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1233 = 1.0 / _1227;
            float _1235 = _1223 * _1233;
            float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1209 = _1237;
            _1239 = true;
        }
        else
        {
            bool _1241 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1243 = isnan(_1129);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1249 = _1245 || _1247;
            if (!_1249)
            {
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1129 + _1251;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1263 = 1.0 / _1257;
                float _1265 = _1253 * _1263;
                float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1209 = _1267;
                _1239 = true;
            }
            else
            {
                _1209 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1239 = false;
    float _1269 = _1209;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1273 = _1089 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1091 + _1275;
    bool _1279 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1291 = _1083 + _1289;
    float _1293 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1295 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1297 = fma(_1291, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1299 = _1277;
    float _1301 = _1273;
    if (_1287)
    {
        _1299 = _1293;
    }
    float _1303 = _1299;
    float _1305 = _1303;
    if (_1287)
    {
        _1197 = _1297;
    }
    float _1307 = _1197;
    float _1309 = _1307;
    if (_1287)
    {
        _1301 = _1295;
    }
    float _1311 = _1301;
    float _1313 = _1311;
    if (!_1287)
    {
        float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1317 = _857 + _1315;
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1321 = _927 + _1319;
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1325 = _1317 * _1317;
        float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1329 = _825 + _1327;
        float _1331 = fma(_1321, _1321, _1325);
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1335 = fma(_1329, _1329, _1331);
        float _1337 = sqrt(_1335);
        float _1339 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1341 = precise::min(_1337, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1343 = _1341 * _1333;
        float _1345 = -_927;
        float _1347 = _1345 + _1293;
        float _1349 = _1339 * _1343;
        float _1351 = -_857;
        float _1353 = _1351 + _1297;
        float _1355 = -_825;
        float _1357 = _1355 + _1295;
        float _1359 = fma(_1347, _1349, _927);
        float _1361 = fma(_1353, _1349, _857);
        float _1363 = fma(_1357, _1349, _825);
        _1309 = _1361;
        _1305 = _1359;
        _1313 = _1363;
        _1199 = _1333;
    }
    float _1365 = _1309;
    float _1367 = _1305;
    float _1369 = _1313;
    float _1371 = _1199;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1367 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1383 = _1369 + _1381;
    float _1385 = _1375 * _1375;
    float _1387 = fma(_1379, _1379, _1385);
    float _1389 = fma(_1383, _1383, _1387);
    float _1391 = rsqrt(_1389);
    float _1393 = _1379 * _1391;
    float _1395 = _1383 * _1391;
    float _1397 = _1375 * _1391;
    float _1399 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1401 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 * _1401;
    float _1407 = _1403 + _1405;
    float _1409 = sqrt(_1407);
    bool _1411 = _1409 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1415 = _1409 + _1413;
    float _1417 = _1293;
    float _1419 = _1407;
    float _1421 = _1415;
    if (_1411)
    {
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1417 = _1423;
    }
    float _1425 = _1417;
    if (_1411)
    {
        float _1427 = rsqrt(_1407);
        _1419 = _1427;
    }
    float _1429 = _1419;
    float _1431 = _1429;
    if (_1411)
    {
        float _1433 = _1415 * _1425;
        _1421 = _1433;
    }
    float _1435 = _1421;
    if (_1411)
    {
        float _1437 = _1435 * 0.15915493667125701904296875;
        _1019 = _1437;
    }
    float _1439 = _1019;
    float _1441 = _1371;
    if (_1411)
    {
        float _1443 = _1439 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1451 = precise::max(0.0, _1449);
    float _1453 = _1425;
    float _1455 = _1451;
    float _1457 = _1449;
    if (_1411)
    {
        float _1459 = _1439 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        _1453 = _1461;
    }
    float _1463 = _1453;
    float _1465 = -_1397;
    float _1467 = -_1451;
    float _1469 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1467);
    if (_1411)
    {
        float _1471 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1471;
    }
    float _1473 = _1455;
    float _1475 = sqrt(_1389);
    float _1477 = _1473;
    float _1479 = _1447;
    if (_1411)
    {
        float _1481 = fma(_1447, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1477 = _1481;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (!_1411)
    {
        _1479 = _1399;
    }
    float _1487 = _1479;
    float _1489 = _1487;
    float _1491 = _1463;
    if (_1411)
    {
        float _1493 = _1463 + (-1.0);
        _1457 = _1493;
    }
    float _1495 = _1457;
    float _1497 = _1495;
    if (_1411)
    {
        float _1499 = _1429 * _1483;
        _1201 = _1499;
    }
    float _1501 = _1201;
    if (!_1411)
    {
        _1485 = _1469;
    }
    float _1503 = _1485;
    float _1505 = _1503;
    if (_1411)
    {
        float _1507 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1203 = _1507;
    }
    float _1509 = _1203;
    if (_1411)
    {
        float _1511 = _1399 * _1501;
        _1489 = _1511;
    }
    float _1513 = _1489;
    if (!_1411)
    {
        _1497 = _1401;
    }
    float _1515 = _1497;
    float _1517 = _1515;
    if (_1411)
    {
        float _1519 = _1401 * _1501;
        _1517 = _1519;
    }
    float _1521 = _1517;
    if (!_1411)
    {
        _1431 = _1403;
    }
    float _1523 = _1431;
    float _1525 = _1523;
    if (_1411)
    {
        float _1527 = fma(_1469, _1463, _1509);
        _1505 = _1527;
    }
    float _1529 = _1505;
    if (_1411)
    {
        float _1531 = _1513 * _1513;
        _1525 = _1531;
    }
    float _1533 = _1525;
    if (!_1411)
    {
        _1491 = _1405;
    }
    float _1535 = _1491;
    float _1537 = _1535;
    if (_1411)
    {
        float _1539 = _1521 * _1521;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_1529, _1529, _1533);
    float _1545 = _1543 + _1541;
    float _1547 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1475, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1557 = rsqrt(_1545);
    float _1559 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1547);
    float _1561 = -_1553;
    float _1563 = _1561 + 1.0;
    float _1565 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1555);
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1569 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1573 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1565);
    float _1575 = abs(_1563);
    float _1577 = log2(_1575);
    float _1579 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1571);
    float _1583 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1585 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1589 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1591 = _1557 * _1513;
    float _1593 = _1557 * _1529;
    float _1595 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1597 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1599 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1601 = _1557 * _1521;
    float _1603 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1587);
    float _1607 = -_1599;
    float _1609 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1607);
    float _1611 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1597);
    float _1613 = -_1603;
    float _1615 = fma(_1613, _1567, 1.0);
    float _1617 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = -_1601;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1609);
    float _1623 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1625 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1627 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1629 = fma(_1621, -0.5, 0.5);
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1623);
    float _1633 = log2(_1615);
    float _1635 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1621, 0.5, 0.5);
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1627);
    float _1641 = _1593 + 1.0;
    float _1643 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1645 = fma(_1637, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1647 = exp2(_1625);
    float _1649 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1643);
    float _1651 = fma(_1637, _1645, -0.212114393711090087890625);
    float _1653 = fma(_1637, _1651, 1.570728778839111328125);
    float _1655 = 1.0 / _1631;
    float _1657 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1639);
    float _1659 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float _1661 = _1633 * 0.693147182464599609375;
    float _1663 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1657);
    float _1665 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1667 = sqrt(_1629);
    float _1669 = -_1593;
    float _1671 = fma(_1647, _1641, _1669);
    float _1673 = fma(_1671, 0.5, 0.5);
    float _1675 = _1663 * _1655;
    float _1677 = _1659 * _1655;
    float _1679 = fma(_1675, 0.5, 0.5);
    float _1681 = fma(_1677, -0.5, 0.5);
    float _1683 = _1667 * 0.636619746685028076171875;
    float _1685 = -_1653;
    float _1687 = fma(_1683, _1685, 1.0);
    float3 _4501 = float3(_1679, _1681, _1665);
    float _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4501, float3(0.0), isnan(_4501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4501, float3(0.0), isnan(_4501)), level(0.0)).x;
    float3 _4512 = float3(_1679, _1681, _1665);
    float4 _1692 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4512, float3(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4512, float3(0.0), isnan(_4512)), level(0.0)).xyzw;
    float _1694 = _1692.x;
    float _1696 = _1692.y;
    float _1698 = _1692.z;
    float _1700 = _1692.w;
    float2 _4529 = float2(_1687, _1673);
    float3 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4529, float2(0.0), isnan(_4529)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4529, float2(0.0), isnan(_4529)), level(0.0)).xyz;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1716 = _1191 * _1397;
    float _1718 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1720;
    float _1724 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1714);
    float _1726 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1718);
    float _1728 = fma(_1189, _1393, _1716);
    float _1730 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1732 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan(0.5);
    bool _1740 = _1736 || _1738;
    float _1742 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1744 = 1.0 / _1722;
    float _1746 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1748 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1724);
    float _1750 = fma(_1193, _1395, _1728);
    float _1752 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1746);
    float _1754 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = abs(_1750);
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1760 = _1756 + _1758;
    float _1762 = 1.0 / _1742;
    float _1764 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1752);
    float _1766 = _1754 + _1742;
    float _1768 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1764);
    float _1770 = exp2(_1730);
    float _1772 = _1760 * _1744;
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = fma(_1774, -2.0, 3.0);
    float _1778 = _1774 * _1774;
    float _1780 = _1766 * _1762;
    float _1782 = _1780 * 0.5;
    float _1784 = _1766;
    if (_1740)
    {
        _1784 = 1.0;
    }
    float _1786 = _1784;
    float _1788 = _1786;
    if (!_1740)
    {
        float _1790 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1792);
        float _1796 = _1790 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1800;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = 1.0 / _1794;
        float _1820 = _1814 * _1816;
        float _1822 = _1804 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1832 = _1818 * _1830;
        float _1834 = 1.0 / _1820;
        float _1836 = 1.0 / _1828;
        float _1838 = _1824 * _1834;
        float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1842 = fma(_1838, _1832, _1840);
        float _1844 = _1842 * _1836;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        _1788 = _1846;
    }
    float _1848 = _1788;
    float _1850 = -_1770;
    float _1852 = _1850 + 1.0;
    float _1854 = _1778 * _1776;
    float _1856 = _1631 * 0.5;
    bool _1858 = _1848 > 0.0;
    bool _1860 = isnan(_1848);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(0.0);
    bool _1866 = _1862 || _1864;
    float _1868 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1870 = _1854 * _1848;
    float _1872 = fma(_1659, -0.5, _1856);
    float _1874 = _1768 + _1631;
    float _1876 = _1868 * _1689;
    float _1878 = _1663 + _1631;
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = _1700 * _1876;
    float _1888 = _1710 * _1876;
    float _1890 = _1874 * 0.5;
    float _1892 = fma(_1706, _1886, _1694);
    float _1894 = _1878 * 0.5;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1898 = fma(_1708, _1886, _1696);
    float _1900 = _1700 * _1884;
    float _1902 = fma(_1700, _1888, _1698);
    out.gl_Position.x = _1663;
    out.gl_Position.y = _1659;
    out.gl_Position.z = _1768;
    out.gl_Position.w = _1631;
    out.m_70.x = _1894;
    out.m_70.y = _1872;
    out.m_70.z = _1890;
    out.m_70.w = _1631;
    out.m_47.x = _1896;
    out.m_72.x = _1892;
    out.m_72.y = _1898;
    out.m_72.z = _1902;
    out.m_72.w = _1900;
    if (_1866)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1904;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1239 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1961 = as_type<float>(_107);
        out.gl_Position.z = _1961;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2031 = as_type<float>(_145);
        out.gl_Position.z = _2031;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_54.w;
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    float _175 = 0.0;
    float _177 = _149;
    if (!_159)
    {
        float _179 = _149 * _149;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_159)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_159;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _149 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _149);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_159;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _259 = as_type<int>(_147) & 1;
    bool _261 = _259 != 0;
    float _263 = fma(_249, _163, _253);
    float _265 = fma(_249, _165, _255);
    float _267 = fma(_249, _167, _257);
    int _269 = as_type<int>(_147) & 2;
    bool _271 = _269 != 0;
    float _273 = fma(_263, _161, _169);
    float _275 = fma(_265, _161, _171);
    float _277 = fma(_267, _161, _173);
    bool _279 = !_261;
    float _281 = _279 ? (-0.5) : 0.5;
    bool _283 = !_271;
    float _285 = _283 ? (-0.5) : 0.5;
    bool _287 = !_251;
    float _305;
    if (!_287)
    {
        float _289 = in.m_56.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_91);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = in.m_58.x;
    float _323 = in.m_58.y;
    float _325 = in.m_58.z;
    bool _327 = _285 > 0.0;
    float _329 = in.m_60.x;
    float _331 = in.m_60.y;
    float _333 = in.m_60.z;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = in.m_62.x;
    float _341 = in.m_62.y;
    float _343 = in.m_62.z;
    bool _345 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _353 = _349 || _351;
    float _355 = 1.0 / _337;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _359 = 1.0 + _357;
    float _361 = in.m_56.z;
    float _363 = _319 * _125;
    float _365 = in.m_56.x;
    float _367 = in.m_56.y;
    float _369 = 1.0 / _359;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _373 = _371 != 0;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _377 = _375 != 0;
    float _379 = _275 * _323;
    int _381 = _271 ? 0 : 1;
    float _383 = exp2(_363);
    float _385 = _275 * _331;
    float _387 = fma(_273, _321, _379);
    float _389 = _275 * _341;
    float _391 = fma(_273, _329, _385);
    int _393 = ~_381;
    int _395 = _393 + 1;
    int _397 = _395 + 1;
    float _399 = _361 * 2.0;
    int _401 = _397;
    float _403 = _325;
    if (!_327)
    {
        int _405 = ~_381;
        int _407 = _405 + 1;
        _401 = _407;
    }
    int _409 = _401;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _425 = _423 != 0;
    float _427 = _365 * 2.0;
    float _429 = floor(_399);
    float _431 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _433 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    float _443 = _367 * 2.0;
    float _445 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _447 = -_431;
    float _449 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _447);
    float _451 = float(_409);
    float _453 = floor(_427);
    float _455 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _457 = -_383;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _463 = _315 + _461;
    float _465 = -_445;
    float _467 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _465);
    float _469 = -_455;
    float _471 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _469);
    float _473 = _463 * _355;
    float _475 = _441 ? _459 : 0.0;
    float _477 = fma(_273, _339, _389);
    bool _479 = _429 >= 0.0;
    bool _481 = isnan(_429);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = 1.0 / _413;
    float _491 = _367 + _361;
    if (_353)
    {
        float _493 = _475 * _369;
        _127 = _493;
    }
    float _495 = _127;
    int _497 = _487 ? 0 : 1;
    float _499 = _361 + _365;
    bool _501 = _453 >= 0.0;
    bool _503 = isnan(_453);
    bool _505 = _501 || _503;
    bool _507 = isnan(0.0);
    bool _509 = _505 || _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _513 = _315 + _511;
    bool _515 = _429 > 0.0;
    float _517 = floor(_443);
    float _519 = _367 + _365;
    int _521 = _509 ? 0 : 1;
    float _523 = _491 + (-1.0);
    bool _525 = _453 > 0.0;
    float _527 = _519 + (-1.0);
    float _529 = _499 + (-1.0);
    float _531 = _513 * _489;
    float _533 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _535 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _537 = _467 * _467;
    float _539 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _541 = _361 + (-0.5);
    float _543 = fma(_449, _449, _537);
    int _545 = ~_497;
    int _547 = _545 + 1;
    int _549 = _547 + 1;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _551;
    int _555 = _549;
    if (!_515)
    {
        int _557 = ~_497;
        int _559 = _557 + 1;
        _555 = _559;
    }
    int _561 = _555;
    float _563 = fma(_471, _471, _543);
    bool _565 = _517 > 0.0;
    float _567 = fma(_553, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _569 = ~_521;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _579 = _573;
    if (!_525)
    {
        int _581 = ~_521;
        int _583 = _581 + 1;
        _579 = _583;
    }
    int _585 = _579;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = _517 >= 0.0;
    bool _593 = isnan(_517);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = rsqrt(_563);
    bool _603 = !_417;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_589, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _609 = _599 ? 0 : 1;
    float _611 = fma(_577, _531, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _613 = abs(_605);
    float _615 = 0.0 + _451;
    float _617 = precise::clamp(_615, 0.0, 1.0);
    int _619 = ~_609;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = fma(_277, _343, _477);
    int _627 = _623;
    if (!_565)
    {
        int _629 = ~_609;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = fma(_277, _333, _391);
    float _637 = float(_613);
    float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _641 = float(_561);
    float _643 = fma(_277, _325, _387);
    bool _645 = !_421;
    int _647 = _645 ? 0 : 1;
    float _649 = _467 * _601;
    bool _651 = !_425;
    int _653 = _651 ? 0 : 1;
    float _655 = _637 * _641;
    int _657 = abs(_647);
    float _659 = _449 * _601;
    bool _661 = _365 > 0.5;
    float _663 = _655 * (-2.0);
    float _665 = _649 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _667 = _365 + (-0.5);
    bool _669 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _671 = isnan(_315);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _471 * _601;
    float _683 = float(_657);
    float _685 = fma(_659, (*spvDescriptorSet0.vp_c10)._m0[8].x, _665);
    float _687 = float(_585);
    float _689 = fma(_535, _663, _535);
    int _691 = abs(_653);
    float _693 = -_679;
    float _695 = _693 + 1.0;
    bool _697 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _699 = isnan(_315);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _683 * _687;
    float _711 = float(_691);
    float _713 = fma(_681, (*spvDescriptorSet0.vp_c10)._m0[10].x, _685);
    float _715 = float(_633);
    float _717 = _667 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _719 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _721 = isnan(_315);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _707 * _695;
    float _733 = -_707;
    float _735 = _733 + 1.0;
    bool _737 = _367 > 0.5;
    float _739 = _709 * (-2.0);
    float _741 = _367 + (-0.5);
    float _743 = _711 * _715;
    float _745 = fma(_689, _495, _717);
    float _747 = _729 * _735;
    float _749 = fma(_533, _739, _533);
    float _751 = _741 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _753 = _273 * _713;
    float _755 = _743 * (-2.0);
    float _757 = _745 * 0.15915493667125701904296875;
    float _759 = _607 * _747;
    float _761 = fma(_749, _495, _751);
    float _763 = _567 * _747;
    float _765 = _753 * (-1.60000002384185791015625);
    float _767 = fma(_539, _755, _539);
    float _769 = _761 * 0.15915493667125701904296875;
    float _771 = in.m_54.x;
    float _773 = in.m_54.y;
    float _775 = fma(_765, _755, _765);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = -_729;
    float _783 = _781 + 1.0;
    float _785 = _757 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[196].z, _775);
    float _791 = fma(_779, _531, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _759);
    float _795 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _797 = fma(_767, _495, _789);
    float _799 = -_281;
    int _801 = _661 ? as_type<int>(_799) : as_type<int>(_281);
    float _803 = fma(_791, _731, _793);
    float _805 = fma(_611, _731, _795);
    float _807 = _797 * 0.15915493667125701904296875;
    float _809 = _757 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].x, _803);
    float _815 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[145].y, _805);
    float _817 = _281 * 0.5;
    bool _819 = !_373;
    float _821 = _819 ? _281 : as_type<float>(_801);
    float _823 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _825 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _827 = fma(_817, _617, _817);
    float _829 = _769 * 6.283185482025146484375;
    float _831 = sin(_829);
    float _833 = _821 + 0.5;
    float _835 = _815 * _773;
    float _837 = _813 * _771;
    float _839 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _285);
    float _841 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _827);
    float _843 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _845 = _837 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _847 = _769 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _833 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _853 = _843 * _839;
    float _855 = _845 * _841;
    float _857 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _859 = _807 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = _811 * _831;
    float _865 = _787 * _831;
    float _867 = _807 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _787 * _849;
    float _873 = _811 * _849;
    float _875 = _787 * _861;
    float _877 = _811 * _861;
    float _879 = _849 * _861;
    float _881 = _831 * _861;
    float _883 = _875 * _853;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _887 = -_863;
    float _889 = fma(_869, _871, _887);
    float _891 = -_871;
    float _893 = fma(_869, _863, _891);
    float _895 = fma(_869, _873, _865);
    float _897 = _877 * _853;
    float _899 = fma(_869, _865, _873);
    float _901 = -_853;
    float _903 = _869 * _901;
    float _905 = fma(_889, _855, _883);
    float _907 = fma(_895, _855, _897);
    float _909 = fma(_879, _855, _903);
    float _911 = fma(_893, _823, _907);
    float _913 = fma(_881, _823, _909);
    float _915 = fma(_899, _823, _905);
    float _917 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _919 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _921 = _851 * _885;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _917);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _919);
    float _927 = _635 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _945 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = _927 + _939;
    float _949 = _825 + _941;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _953 = -_285;
    int _955 = _737 ? as_type<int>(_953) : as_type<int>(_285);
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _959 = _947 + _957;
    float _961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _963 = _949 + _961;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _967 = !_377;
    float _969 = _967 ? _285 : as_type<float>(_955);
    float _971 = _959 * _959;
    float _973 = _963 * _963;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _977 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = -_969;
    float _981 = _979 + 0.5;
    float _983 = _971 + _973;
    float _985 = _943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _989 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _991 = sqrt(_983);
    float _993 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _977;
    out.m_64.y = _945;
    out.m_64.z = _985;
    float _995 = _989 * _639;
    float _997 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _987);
    float _999 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _921;
    out.m_66.y = _995;
    float _1003 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _997);
    out.m_68.x = _993;
    out.m_68.y = _999;
    out.m_68.z = _1001;
    out.m_68.w = _975;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1007 = _991 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1009 = _857 + _1005;
    float _1011 = _993;
    float _1013 = _999;
    float _1015 = _971;
    float _1017 = _973;
    float _1019 = _921;
    if (!_1007)
    {
        _403 = _947;
    }
    float _1021 = _403;
    float _1023 = _1021;
    if (!_1007)
    {
        _1011 = _949;
    }
    float _1025 = _1011;
    float _1027 = _1025;
    if (!_1007)
    {
        _1013 = _1009;
    }
    float _1029 = _1013;
    bool _1031 = !_1007;
    float _1033 = _1029;
    if (!_1031)
    {
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1039 = _991 + _1037;
        float _1041 = _1009 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1043 = rsqrt(_983);
        float _1045 = _1039 * _1035;
        float _1047 = _1045 * 0.15915493667125701904296875;
        float _1049 = _1047 * 6.283185482025146484375;
        float _1051 = sin(_1049);
        float _1053 = _1047 * 6.283185482025146484375;
        float _1055 = cos(_1053);
        float _1057 = fma(_1051, _1041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1059 = _1043 * _1057;
        float _1061 = fma(_959, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = _1055 + (-1.0);
        float _1065 = fma(_963, _1059, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1069 = _1061 + _1067;
        float _1071 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1075 = _1065 + _1073;
        float _1077 = _1069 * _1069;
        float _1079 = fma(_1009, _1055, _1071);
        float _1081 = _1075 * _1075;
        _1033 = _1079;
        _1015 = _1077;
        _1017 = _1081;
        _1023 = _1061;
        _1027 = _1065;
    }
    float _1083 = _1033;
    float _1085 = _1015;
    float _1087 = _1017;
    float _1089 = _1023;
    float _1091 = _1027;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1095 = _1083 + _1093;
    float _1097 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1099 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1103 = fma(_1095, _1095, _1085);
    float _1105 = -_869;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1097);
    float _1109 = -_869;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1113 = _895 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1115 = _1103 + _1087;
    float _1117 = _895 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1119 = _895 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1121 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1123 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1125 = -_869;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1101);
    float _1129 = sqrt(_1115);
    float _1131 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1113);
    float _1133 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1117);
    float _1135 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1119);
    float _1137 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1121);
    float _1139 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1123);
    float _1141 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1107);
    float _1143 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1111);
    float _1145 = _285 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1147 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1149 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1127);
    float _1151 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1153 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1155 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1135);
    float _1157 = _1145 * _1141;
    float _1159 = _1145 * _1143;
    bool _1161 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1163 = isnan(_1129);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1169 = _1165 || _1167;
    float _1171 = _827 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1173 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1147);
    float _1175 = _1145 * _1149;
    float _1177 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1137);
    float _1179 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1139);
    float _1181 = fma(_1171, _1151, _1157);
    float _1183 = fma(_1171, _1153, _1159);
    float _1185 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1173);
    float _1187 = fma(_1171, _1155, _1175);
    float _1189 = _1177 + _1181;
    float _1191 = _1179 + _1183;
    float _1193 = _1185 + _1187;
    float _1195 = _1181;
    float _1197 = _1083;
    float _1199 = _1157;
    float _1201 = _1155;
    float _1203 = _1149;
    if (!_1169)
    {
        _1195 = 1.0;
    }
    float _1205 = _1195;
    bool _1207 = !_1169;
    float _1209 = _1205;
    if (!_1207)
    {
        bool _1211 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1213 = isnan(_1129);
        bool _1215 = _1211 || _1213;
        bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1219 = _1215 || _1217;
        if (!_1219)
        {
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = _1129 + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1227 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1225;
            float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1233 = 1.0 / _1227;
            float _1235 = _1223 * _1233;
            float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1209 = _1237;
            _1239 = true;
        }
        else
        {
            bool _1241 = _1129 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1243 = isnan(_1129);
            bool _1245 = _1241 || _1243;
            bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1249 = _1245 || _1247;
            if (!_1249)
            {
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1129 + _1251;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1263 = 1.0 / _1257;
                float _1265 = _1253 * _1263;
                float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1209 = _1267;
                _1239 = true;
            }
            else
            {
                _1209 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1239 = false;
    float _1269 = _1209;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1273 = _1089 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1277 = _1091 + _1275;
    bool _1279 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1281 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.5);
    bool _1287 = _1283 || _1285;
    float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1291 = _1083 + _1289;
    float _1293 = fma(_1273, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1295 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1297 = fma(_1291, _1269, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1299 = _1277;
    float _1301 = _1273;
    if (_1287)
    {
        _1299 = _1293;
    }
    float _1303 = _1299;
    float _1305 = _1303;
    if (_1287)
    {
        _1197 = _1297;
    }
    float _1307 = _1197;
    float _1309 = _1307;
    if (_1287)
    {
        _1301 = _1295;
    }
    float _1311 = _1301;
    float _1313 = _1311;
    if (!_1287)
    {
        float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1317 = _857 + _1315;
        float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1321 = _927 + _1319;
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1325 = _1317 * _1317;
        float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1329 = _825 + _1327;
        float _1331 = fma(_1321, _1321, _1325);
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1335 = fma(_1329, _1329, _1331);
        float _1337 = sqrt(_1335);
        float _1339 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1341 = precise::min(_1337, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1343 = _1341 * _1333;
        float _1345 = -_927;
        float _1347 = _1345 + _1293;
        float _1349 = _1339 * _1343;
        float _1351 = -_857;
        float _1353 = _1351 + _1297;
        float _1355 = -_825;
        float _1357 = _1355 + _1295;
        float _1359 = fma(_1347, _1349, _927);
        float _1361 = fma(_1353, _1349, _857);
        float _1363 = fma(_1357, _1349, _825);
        _1309 = _1361;
        _1305 = _1359;
        _1313 = _1363;
        _1199 = _1333;
    }
    float _1365 = _1309;
    float _1367 = _1305;
    float _1369 = _1313;
    float _1371 = _1199;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1375 = _1365 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = _1367 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1383 = _1369 + _1381;
    float _1385 = _1375 * _1375;
    float _1387 = fma(_1379, _1379, _1385);
    float _1389 = fma(_1383, _1383, _1387);
    float _1391 = rsqrt(_1389);
    float _1393 = _1379 * _1391;
    float _1395 = _1383 * _1391;
    float _1397 = _1375 * _1391;
    float _1399 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1401 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 * _1401;
    float _1407 = _1403 + _1405;
    float _1409 = sqrt(_1407);
    bool _1411 = _1409 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1415 = _1409 + _1413;
    float _1417 = _1293;
    float _1419 = _1407;
    float _1421 = _1415;
    if (_1411)
    {
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1417 = _1423;
    }
    float _1425 = _1417;
    if (_1411)
    {
        float _1427 = rsqrt(_1407);
        _1419 = _1427;
    }
    float _1429 = _1419;
    float _1431 = _1429;
    if (_1411)
    {
        float _1433 = _1415 * _1425;
        _1421 = _1433;
    }
    float _1435 = _1421;
    if (_1411)
    {
        float _1437 = _1435 * 0.15915493667125701904296875;
        _1019 = _1437;
    }
    float _1439 = _1019;
    float _1441 = _1371;
    if (_1411)
    {
        float _1443 = _1439 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1451 = precise::max(0.0, _1449);
    float _1453 = _1425;
    float _1455 = _1451;
    float _1457 = _1449;
    if (_1411)
    {
        float _1459 = _1439 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        _1453 = _1461;
    }
    float _1463 = _1453;
    float _1465 = -_1397;
    float _1467 = -_1451;
    float _1469 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1467);
    if (_1411)
    {
        float _1471 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1471;
    }
    float _1473 = _1455;
    float _1475 = sqrt(_1389);
    float _1477 = _1473;
    float _1479 = _1447;
    if (_1411)
    {
        float _1481 = fma(_1447, _1473, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1477 = _1481;
    }
    float _1483 = _1477;
    float _1485 = _1483;
    if (!_1411)
    {
        _1479 = _1399;
    }
    float _1487 = _1479;
    float _1489 = _1487;
    float _1491 = _1463;
    if (_1411)
    {
        float _1493 = _1463 + (-1.0);
        _1457 = _1493;
    }
    float _1495 = _1457;
    float _1497 = _1495;
    if (_1411)
    {
        float _1499 = _1429 * _1483;
        _1201 = _1499;
    }
    float _1501 = _1201;
    if (!_1411)
    {
        _1485 = _1469;
    }
    float _1503 = _1485;
    float _1505 = _1503;
    if (_1411)
    {
        float _1507 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1203 = _1507;
    }
    float _1509 = _1203;
    if (_1411)
    {
        float _1511 = _1399 * _1501;
        _1489 = _1511;
    }
    float _1513 = _1489;
    if (!_1411)
    {
        _1497 = _1401;
    }
    float _1515 = _1497;
    float _1517 = _1515;
    if (_1411)
    {
        float _1519 = _1401 * _1501;
        _1517 = _1519;
    }
    float _1521 = _1517;
    if (!_1411)
    {
        _1431 = _1403;
    }
    float _1523 = _1431;
    float _1525 = _1523;
    if (_1411)
    {
        float _1527 = fma(_1469, _1463, _1509);
        _1505 = _1527;
    }
    float _1529 = _1505;
    if (_1411)
    {
        float _1531 = _1513 * _1513;
        _1525 = _1531;
    }
    float _1533 = _1525;
    if (!_1411)
    {
        _1491 = _1405;
    }
    float _1535 = _1491;
    float _1537 = _1535;
    if (_1411)
    {
        float _1539 = _1521 * _1521;
        _1537 = _1539;
    }
    float _1541 = _1537;
    float _1543 = fma(_1529, _1529, _1533);
    float _1545 = _1543 + _1541;
    float _1547 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1551 = fma(_1475, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1549);
    float _1553 = precise::clamp(_1551, 0.0, 1.0);
    float _1555 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1557 = rsqrt(_1545);
    float _1559 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1547);
    float _1561 = -_1553;
    float _1563 = _1561 + 1.0;
    float _1565 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1555);
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1569 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1559);
    float _1571 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1573 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1565);
    float _1575 = abs(_1563);
    float _1577 = log2(_1575);
    float _1579 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1571);
    float _1583 = _1573 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1585 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1589 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1581);
    float _1591 = _1557 * _1513;
    float _1593 = _1557 * _1529;
    float _1595 = _1589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1597 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1599 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1601 = _1557 * _1521;
    float _1603 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1587);
    float _1607 = -_1599;
    float _1609 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1607);
    float _1611 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1597);
    float _1613 = -_1603;
    float _1615 = fma(_1613, _1567, 1.0);
    float _1617 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1619 = -_1601;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1609);
    float _1623 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1611);
    float _1625 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1627 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1629 = fma(_1621, -0.5, 0.5);
    float _1631 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1623);
    float _1633 = log2(_1615);
    float _1635 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1637 = fma(_1621, 0.5, 0.5);
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1627);
    float _1641 = _1593 + 1.0;
    float _1643 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1635);
    float _1645 = fma(_1637, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1647 = exp2(_1625);
    float _1649 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1643);
    float _1651 = fma(_1637, _1645, -0.212114393711090087890625);
    float _1653 = fma(_1637, _1651, 1.570728778839111328125);
    float _1655 = 1.0 / _1631;
    float _1657 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1639);
    float _1659 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1649);
    float _1661 = _1633 * 0.693147182464599609375;
    float _1663 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1657);
    float _1665 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1667 = sqrt(_1629);
    float _1669 = -_1593;
    float _1671 = fma(_1647, _1641, _1669);
    float _1673 = fma(_1671, 0.5, 0.5);
    float _1675 = _1663 * _1655;
    float _1677 = _1659 * _1655;
    float _1679 = fma(_1675, 0.5, 0.5);
    float _1681 = fma(_1677, -0.5, 0.5);
    float _1683 = _1667 * 0.636619746685028076171875;
    float _1685 = -_1653;
    float _1687 = fma(_1683, _1685, 1.0);
    float3 _4501 = float3(_1679, _1681, _1665);
    float _1689 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4501, float3(0.0), isnan(_4501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4501, float3(0.0), isnan(_4501)), level(0.0)).x;
    float3 _4512 = float3(_1679, _1681, _1665);
    float4 _1692 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4512, float3(0.0), isnan(_4512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4512, float3(0.0), isnan(_4512)), level(0.0)).xyzw;
    float _1694 = _1692.x;
    float _1696 = _1692.y;
    float _1698 = _1692.z;
    float _1700 = _1692.w;
    float2 _4529 = float2(_1687, _1673);
    float3 _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4529, float2(0.0), isnan(_4529)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4529, float2(0.0), isnan(_4529)), level(0.0)).xyz;
    float _1706 = _1704.x;
    float _1708 = _1704.y;
    float _1710 = _1704.z;
    float _1712 = _857 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = _857 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1716 = _1191 * _1397;
    float _1718 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1720;
    float _1724 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1714);
    float _1726 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1718);
    float _1728 = fma(_1189, _1393, _1716);
    float _1730 = _1577 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1732 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan(0.5);
    bool _1740 = _1736 || _1738;
    float _1742 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1744 = 1.0 / _1722;
    float _1746 = _1583 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1748 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1724);
    float _1750 = fma(_1193, _1395, _1728);
    float _1752 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1746);
    float _1754 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = abs(_1750);
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1760 = _1756 + _1758;
    float _1762 = 1.0 / _1742;
    float _1764 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1752);
    float _1766 = _1754 + _1742;
    float _1768 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1764);
    float _1770 = exp2(_1730);
    float _1772 = _1760 * _1744;
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = fma(_1774, -2.0, 3.0);
    float _1778 = _1774 * _1774;
    float _1780 = _1766 * _1762;
    float _1782 = _1780 * 0.5;
    float _1784 = _1766;
    if (_1740)
    {
        _1784 = 1.0;
    }
    float _1786 = _1784;
    float _1788 = _1786;
    if (!_1740)
    {
        float _1790 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1792);
        float _1796 = _1790 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1802 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1800;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = 1.0 / _1794;
        float _1820 = _1814 * _1816;
        float _1822 = _1804 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1832 = _1818 * _1830;
        float _1834 = 1.0 / _1820;
        float _1836 = 1.0 / _1828;
        float _1838 = _1824 * _1834;
        float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1842 = fma(_1838, _1832, _1840);
        float _1844 = _1842 * _1836;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        _1788 = _1846;
    }
    float _1848 = _1788;
    float _1850 = -_1770;
    float _1852 = _1850 + 1.0;
    float _1854 = _1778 * _1776;
    float _1856 = _1631 * 0.5;
    bool _1858 = _1848 > 0.0;
    bool _1860 = isnan(_1848);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(0.0);
    bool _1866 = _1862 || _1864;
    float _1868 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1870 = _1854 * _1848;
    float _1872 = fma(_1659, -0.5, _1856);
    float _1874 = _1768 + _1631;
    float _1876 = _1868 * _1689;
    float _1878 = _1663 + _1631;
    float _1880 = _1870 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = _1700 * _1876;
    float _1888 = _1710 * _1876;
    float _1890 = _1874 * 0.5;
    float _1892 = fma(_1706, _1886, _1694);
    float _1894 = _1878 * 0.5;
    float _1896 = _1880 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1898 = fma(_1708, _1886, _1696);
    float _1900 = _1700 * _1884;
    float _1902 = fma(_1700, _1888, _1698);
    out.gl_Position.x = _1663;
    out.gl_Position.y = _1659;
    out.gl_Position.z = _1768;
    out.gl_Position.w = _1631;
    out.m_70.x = _1894;
    out.m_70.y = _1872;
    out.m_70.z = _1890;
    out.m_70.w = _1631;
    out.m_47.x = _1896;
    out.m_72.x = _1892;
    out.m_72.y = _1898;
    out.m_72.z = _1902;
    out.m_72.w = _1900;
    if (_1866)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1904 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1904;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

