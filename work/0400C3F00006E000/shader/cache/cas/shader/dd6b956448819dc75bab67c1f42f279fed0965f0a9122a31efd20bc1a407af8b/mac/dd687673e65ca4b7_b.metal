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
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1439 = false;
    bool _851 = false;
    bool _545 = false;
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
        float _2369 = as_type<float>(_107);
        out.gl_Position.z = _2369;
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
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2438 = as_type<float>(_143);
        out.gl_Position.z = _2438;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_56.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = _149 * _147;
    float _175 = 0.0;
    float _177 = _153;
    if (!_165)
    {
        float _179 = _153 * _153;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _187 = in.m_49.x;
    float _189 = in.m_49.y;
    float _191 = in.m_49.z;
    float _193 = _183;
    if (!_165)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _185 * 6.283185482025146484375;
    float _201 = floor(_185);
    int _203 = as_type<int>(_151) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_151) & 2;
    bool _209 = _207 != 0;
    float _211 = _199 * 0.15915493667125701904296875;
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    bool _217 = !_205;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _211 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_209;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = -_201;
    float _231 = _185 + _229;
    bool _233 = !_165;
    float _235 = _197;
    float _237 = _167;
    float _239 = _169;
    if (!_233)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _153 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _153);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
    }
    float _271 = _235;
    bool _273 = !_165;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _153 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _177 = _293;
    }
    float _295 = _177;
    float _297 = in.m_58.x;
    float _299 = in.m_58.y;
    float _301 = in.m_58.z;
    float _303 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _305 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _307 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _309 = in.m_60.x;
    float _311 = in.m_60.y;
    float _313 = in.m_60.z;
    float _315 = fma(_295, _187, _303);
    float _317 = fma(_295, _189, _305);
    float _319 = in.m_62.x;
    float _321 = in.m_62.y;
    float _323 = in.m_62.z;
    bool _325 = _231 < 0.5;
    float _327 = float(_325);
    float _329 = fma(_315, _155, _167);
    float _331 = fma(_223, 0.5, 0.5);
    float _333 = fma(_295, _191, _307);
    if (!_165)
    {
        float _335 = _125 * _125;
        float _337 = _335 * 0.5;
        _237 = _337;
    }
    float _339 = _237;
    float _341 = fma(_317, _155, _169);
    float _343 = -_231;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _347 = -_327;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _351 = -_331;
    float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _355 = fma(_333, _155, _171);
    float _357 = _339;
    if (!_165)
    {
        float _359 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (!_165)
    {
        _239 = _125;
    }
    float _365 = _239;
    bool _367 = !_215;
    int _369 = _367 ? 0 : 1;
    bool _371 = !_165;
    float _373 = _365;
    float _375 = _301;
    float _377 = _297;
    float _379 = _313;
    if (!_371)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = _125 * _383;
        float _393 = 1.0 / _387;
        float _395 = _389 * 0.693147182464599609375;
        float _397 = exp2(_391);
        float _399 = 1.0 / _395;
        float _401 = _397 + (-1.0);
        float _403 = -_401;
        float _405 = fma(_403, _399, _125);
        float _407 = _405 * _393;
        float _409 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _409;
    }
    float _411 = _363;
    bool _413 = !_165;
    if (!_413)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = 1.0 / _421;
        float _425 = _125 * _417;
        float _427 = exp2(_425);
        float _429 = -_427;
        float _431 = _429 + 1.0;
        float _433 = _431 * _423;
        _373 = _433;
    }
    float _435 = _373;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _443 = _441 != 0;
    float _445 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _447 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _449 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _451 = abs(_369);
    float _453 = fma(_435, _189, _445);
    bool _455 = !_439;
    int _457 = _455 ? 0 : 1;
    float _459 = fma(_435, _187, _447);
    float _461 = fma(_435, _191, _449);
    bool _463 = !_443;
    int _465 = _463 ? 0 : 1;
    float _467 = -_453;
    float _469 = _317 + _467;
    float _471 = -_459;
    float _473 = _315 + _471;
    int _475 = abs(_457);
    float _477 = _469 * _299;
    int _479 = abs(_465);
    float _481 = _469 * _311;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _485 = _469 * _321;
    float _487 = float(_475);
    float _489 = fma(_473, _297, _477);
    float _491 = fma(_473, _309, _481);
    float _493 = fma(_473, _319, _485);
    float _495 = float(_451);
    float _497 = abs(_345);
    float _499 = _487 * _497;
    float _501 = -_461;
    float _503 = _333 + _501;
    float _505 = fma(_495, _353, _499);
    float _507 = float(_479);
    float _509 = fma(_503, _301, _489);
    float _511 = fma(_503, _313, _491);
    float _513 = fma(_503, _323, _493);
    float _515 = abs(_349);
    float _517 = fma(_507, _515, _505);
    bool _519 = !_483;
    float _521 = _511;
    float _523 = _511;
    float _525 = _509;
    float _527 = _513;
    float _543;
    if (!_519)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _531 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_91);
        float _549 = 1.0 / _547;
        float _551 = _125 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _567;
    float _571 = 1.0 / _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = 1.0 / _565;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _587 = _553 + _585;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _591 = 1.0 / _569;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _597 = _587 * _571;
    bool _599 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _601 = isnan(_553);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _613 = _553 + _611;
    float _615 = 1.0 / _575;
    bool _617 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _619 = isnan(_553);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _557;
    float _631 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _635 = _553 + _633;
    float _637 = _635 * _579;
    bool _639 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _641 = isnan(_553);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _553 + _651;
    float _655 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _659 = _553 + _657;
    float _661 = _613 * _615;
    float _663 = -_649;
    float _665 = _663 + 1.0;
    out.m_64.x = _631;
    out.m_64.y = _655;
    out.m_64.z = _583;
    out.m_64.w = _595;
    float _667 = _659 * _591;
    float _669 = _653 * _629;
    bool _671 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _673 = isnan(_553);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_627;
    float _685 = _683 + 1.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = _609 * _685;
    float _697 = -_609;
    float _699 = _697 + 1.0;
    float _701 = fma(_693, _637, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _703 = -_681;
    float _705 = _703 + 1.0;
    float _707 = _649 * _699;
    bool _709 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _711 = isnan(_553);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_689, _637, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _723 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_553);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _681 * _665;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _741 = -_719;
    float _743 = _741 + 1.0;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _749 = _719 * _705;
    float _751 = _733 * _743;
    float _753 = fma(_739, _661, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _755 = fma(_747, _661, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _757 = -_733;
    float _759 = _757 + 1.0;
    float _761 = _721 * _751;
    float _763 = _701 * _751;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _765;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _769;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[143].x, _761);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _777 = fma(_767, _669, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _779 = fma(_771, _669, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _789 = in.m_56.x;
    float _791 = in.m_56.y;
    float _793 = fma(_753, _749, _773);
    float _795 = fma(_755, _749, _775);
    float _797 = fma(_783, _597, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _799 = fma(_787, _597, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _801;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _805;
    float _809 = fma(_777, _735, _793);
    float _811 = fma(_779, _735, _795);
    float _813 = fma(_803, _667, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _815 = fma(_807, _667, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _817 = fma(_797, _707, _809);
    float _819 = fma(_799, _707, _811);
    float _821 = fma(_813, _695, _817);
    float _823 = fma(_815, _695, _819);
    float _825 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[148].x, _821);
    float _827 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[148].y, _823);
    float _829 = _825 * _789;
    float _831 = _827 * _791;
    bool _833 = !_589;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _837 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_91);
        float _855 = 1.0 / _853;
        float _857 = _125 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    float _861 = in.m_51.y;
    float _863 = _517 * _829;
    float _865 = _517 * _831;
    bool _867 = _145 > 0.5;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _885 = _341 * _299;
    float _887 = 1.0 / _871;
    float _889 = _341 * _311;
    float _891 = _341 * _321;
    float _893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _895 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    float _901 = fma(_329, _297, _885);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _905 = _903 != 0;
    float _907 = 1.0 / _879;
    float _909 = -_219;
    int _911 = _867 ? as_type<int>(_909) : as_type<int>(_219);
    float _913 = fma(_329, _309, _889);
    float _915 = fma(_329, _319, _891);
    bool _917 = _861 > 0.5;
    float _919 = _895 * _893;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _923 = _859 + _921;
    float _925 = 1.0 / _875;
    bool _927 = !_899;
    float _929 = _927 ? _219 : as_type<float>(_911);
    float _931 = fma(_355, _301, _901);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _933;
    float _937 = fma(_355, _313, _913);
    float _939 = fma(_355, _323, _915);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _943 = _859 + _941;
    float _945 = _923 * _887;
    float _947 = 1.0 / _883;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _951 = _859 + _949;
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _955 = _943 * _907;
    float _957 = -_227;
    int _959 = _917 ? as_type<int>(_957) : as_type<int>(_227);
    float _961 = _951 * _925;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _965 = _859 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _975;
    bool _979 = !_905;
    float _981 = _979 ? _227 : as_type<float>(_959);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _987 = _965 * _947;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _997 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _999 = 1.0 / _935;
    float _1001 = fma(_985, _961, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1003 = fma(_991, _961, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1005 = fma(_995, _961, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1015;
    float _1019 = _997 * _953;
    float _1021 = fma(_1009, _955, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1023 = fma(_1013, _955, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1025 = fma(_1017, _955, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1029 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = fma(_969, _945, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1033 = fma(_973, _945, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1035 = fma(_977, _945, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1027);
    float _1053 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = _859 + _1055;
    float _1059 = fma(_1039, _987, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1061 = fma(_1043, _987, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1063 = fma(_1047, _987, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1051);
    float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1053);
    float _1069 = _1057 * _999;
    bool _1071 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1073 = isnan(_859);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _931 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1085 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1087 = isnan(_859);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1099 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1101 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1103 = -_1081;
    float _1105 = _1103 + 1.0;
    bool _1107 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1109 = isnan(_859);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = -_1095;
    float _1121 = _1119 + 1.0;
    float _1123 = _1083 + _1099;
    float _1125 = _1097 + _1101;
    bool _1127 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1129 = isnan(_859);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1135 = _1131 || _1133;
    float _1137 = float(_1135);
    float _1139 = _1095 * _1105;
    bool _1141 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1143 = isnan(_859);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = _1117 * _1121;
    bool _1155 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1157 = isnan(_859);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1123 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1125 + _1171;
    float _1175 = -_1117;
    float _1177 = _1175 + 1.0;
    float _1179 = _1169 * _1169;
    float _1181 = _1173 * _1173;
    float _1183 = -_1165;
    float _1185 = _1183 + 1.0;
    float _1187 = _1165 * _1177;
    float _1189 = _1179 + _1181;
    float _1191 = _1151 * _1185;
    float _1193 = -_1151;
    float _1195 = _1193 + 1.0;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1197;
    float _1201 = sqrt(_1189);
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1207;
    float _1211 = _1137 * _1195;
    float _1213 = fma(_1199, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1215 = fma(_1205, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1217 = fma(_1209, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1219 = -_1137;
    float _1221 = _1219 + 1.0;
    float _1223 = _1031 * _1211;
    float _1225 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = _1033 * _1211;
    float _1229 = _1035 * _1211;
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1223);
    float _1233 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1227);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1229);
    float _1239 = fma(_1001, _1191, _1231);
    bool _1241 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1243 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1233);
    float _1245 = fma(_1005, _1191, _1237);
    float _1247 = fma(_1021, _1187, _1239);
    float _1249 = fma(_1003, _1191, _1235);
    float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1253 = _937 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1255 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1257 = fma(_1023, _1187, _1249);
    float _1259 = fma(_1025, _1187, _1245);
    float _1261 = fma(_1059, _1153, _1247);
    float _1263 = _1253 + _1255;
    bool _1265 = !_1241;
    float _1267 = _1263;
    float _1269 = _1179;
    float _1271 = _1181;
    float _1273 = _1123;
    float _1275 = _1125;
    float _1277 = _1173;
    float _1279 = _1153;
    if (!_1265)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1285 = _1201 + _1283;
        float _1287 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = rsqrt(_1189);
        float _1291 = _1285 * _1281;
        float _1293 = _1291 * 0.15915493667125701904296875;
        float _1295 = _1293 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = _1293 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = fma(_1297, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1305 = _1289 * _1303;
        float _1307 = _1301 + (-1.0);
        float _1309 = fma(_1169, _1305, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1311 = fma(_1173, _1305, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1313 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1317 = _1309 + _1315;
        float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1321 = _1311 + _1319;
        float _1323 = fma(_1263, _1301, _1313);
        float _1325 = _1317 * _1317;
        float _1327 = _1321 * _1321;
        _1267 = _1323;
        _1269 = _1325;
        _1271 = _1327;
        _1273 = _1309;
        _1275 = _1311;
    }
    float _1329 = _1267;
    float _1331 = _1269;
    float _1333 = _1271;
    float _1335 = _1273;
    float _1337 = _1275;
    float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1341 = _1329 + _1339;
    float _1343 = fma(_1061, _1153, _1257);
    float _1345 = fma(_1063, _1153, _1259);
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1349 = fma(_1341, _1341, _1331);
    float _1351 = _929 + 0.5;
    float _1353 = fma(_1213, _1139, _1261);
    float _1355 = fma(_1215, _1139, _1343);
    float _1357 = fma(_1217, _1139, _1345);
    float _1359 = _1349 + _1333;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = -_981;
    float _1365 = _1363 + 0.5;
    float _1367 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1353);
    float _1369 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1355);
    float _1371 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1357);
    float _1373 = sqrt(_1359);
    float _1375 = _1361 * _1251;
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1381 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1385 = _1377 * _1347;
    float _1387 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1375;
    out.m_66.y = _1385;
    out.m_68.x = _1387;
    out.m_68.y = _1389;
    out.m_68.z = _1391;
    bool _1393 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1395 = isnan(_1373);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1401 = _1397 || _1399;
    float _1403 = _1371;
    if (!_1401)
    {
        _1403 = 1.0;
    }
    float _1405 = _1403;
    bool _1407 = !_1401;
    float _1409 = _1405;
    if (!_1407)
    {
        bool _1411 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1413 = isnan(_1373);
        bool _1415 = _1411 || _1413;
        bool _1417 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1419 = _1415 || _1417;
        if (!_1419)
        {
            float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1423 = _1373 + _1421;
            float _1425 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1427 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1425;
            float _1429 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1431 = _1429 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1433 = 1.0 / _1427;
            float _1435 = _1423 * _1433;
            float _1437 = fma(_1435, _1431, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1409 = _1437;
            _1439 = true;
        }
        else
        {
            bool _1441 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1443 = isnan(_1373);
            bool _1445 = _1441 || _1443;
            bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1449 = _1445 || _1447;
            if (!_1449)
            {
                float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1453 = _1373 + _1451;
                float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1457 = _1455 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1461 = _1459 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1463 = 1.0 / _1457;
                float _1465 = _1453 * _1463;
                float _1467 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1409 = _1467;
                _1439 = true;
            }
            else
            {
                _1409 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1439 = false;
    float _1469 = _1409;
    float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1473 = _1329 + _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1477 = _1335 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1481 = _1337 + _1479;
    float _1483 = fma(_1473, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1485 = fma(_1477, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1487 = fma(_1481, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = -_1253;
    float _1491 = _1489 + _1483;
    float _1493 = -_1083;
    float _1495 = _1493 + _1485;
    float _1497 = -_1097;
    float _1499 = _1497 + _1487;
    float _1501 = _1491 * _1491;
    float _1503 = fma(_1495, _1495, _1501);
    float _1505 = fma(_1499, _1499, _1503);
    float _1507 = sqrt(_1505);
    bool _1509 = _1507 > 0.0;
    bool _1511 = !_1509;
    float _1513 = _1507;
    float _1515 = _1485;
    float _1517 = _1483;
    float _1519 = _1487;
    if (!_1511)
    {
        bool _1521 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1523 = _1347;
        if (_1521)
        {
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1523 = _1525;
        }
        float _1527 = _1523;
        if (_1521)
        {
            float _1529 = _509 * _1527;
            _1277 = _1529;
        }
        float _1531 = _1277;
        float _1533 = _1531;
        if (_1521)
        {
            float _1535 = _511 * _1527;
            _1513 = _1535;
        }
        float _1537 = _1513;
        float _1539 = _1537;
        if (_1521)
        {
            float _1541 = _513 * _1527;
            _1279 = _1541;
        }
        float _1543 = _1279;
        float _1545 = _1543;
        if (!_1521)
        {
            float _1547 = _125 + 1.0;
            float _1549 = _1547;
            if (!_165)
            {
                float _1551 = _1547 * _1547;
                float _1553 = _1551 * 0.5;
                _521 = _1553;
            }
            float _1555 = _521;
            float _1557 = _1555;
            if (!_165)
            {
                float _1559 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1557 = _1559;
            }
            float _1561 = _1557;
            bool _1563 = !_165;
            float _1565 = _1561;
            if (!_1563)
            {
                float _1567 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1569 = log2(_1567);
                float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1573 = _1571 + 1.0;
                float _1575 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1577 = _1569 * _1547;
                float _1579 = 1.0 / _1573;
                float _1581 = _1575 * 0.693147182464599609375;
                float _1583 = exp2(_1577);
                float _1585 = 1.0 / _1581;
                float _1587 = _1583 + (-1.0);
                float _1589 = -_1587;
                float _1591 = fma(_1589, _1585, _1547);
                float _1593 = _1591 * _1579;
                float _1595 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1565 = _1595;
            }
            float _1597 = _1565;
            float _1599 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1601 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1603 = !_165;
            if (!_1603)
            {
                float _1605 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1607 = log2(_1605);
                float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1611 = _1609 + 1.0;
                float _1613 = 1.0 / _1611;
                float _1615 = _1607 * _1547;
                float _1617 = exp2(_1615);
                float _1619 = -_1617;
                float _1621 = _1619 + 1.0;
                float _1623 = _1621 * _1613;
                _1549 = _1623;
            }
            float _1625 = _1549;
            float _1627 = fma(_1625, _189, _1601);
            float _1629 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1631 = fma(_1625, _187, _1599);
            float _1633 = -_453;
            float _1635 = _1633 + _1627;
            float _1637 = fma(_1625, _191, _1629);
            float _1639 = -_459;
            float _1641 = _1639 + _1631;
            float _1643 = _1635 * _299;
            float _1645 = _1635 * _311;
            float _1647 = _1635 * _321;
            float _1649 = -_461;
            float _1651 = _1649 + _1637;
            float _1653 = fma(_1641, _297, _1643);
            float _1655 = fma(_1641, _309, _1645);
            float _1657 = fma(_1641, _319, _1647);
            float _1659 = fma(_1651, _301, _1653);
            float _1661 = fma(_1651, _313, _1655);
            float _1663 = fma(_1651, _323, _1657);
            _523 = _1661;
            _525 = _1659;
            _527 = _1663;
            _1533 = _1659;
            _1539 = _1661;
            _1545 = _1663;
        }
        float _1665 = _523;
        float _1667 = _525;
        float _1669 = _527;
        float _1671 = _1533;
        float _1673 = _1539;
        float _1675 = _1545;
        float _1677 = _1665 * _1665;
        float _1679 = rsqrt(_1505);
        float _1681 = fma(_1667, _1667, _1677);
        float _1683 = fma(_1669, _1669, _1681);
        float _1685 = sqrt(_1683);
        float _1687 = _1495 * _1679;
        float _1689 = _1491 * _1679;
        float _1691 = _1499 * _1679;
        bool _1693 = _1685 > 0.0;
        bool _1695 = !_1693;
        _375 = _1683;
        _377 = _1691;
        if (!_1695)
        {
            float _1697 = rsqrt(_1683);
            float _1699 = _1697 * _1665;
            float _1701 = _1697 * _1667;
            float _1703 = _1697 * _1669;
            float _1705 = _1689 * _1699;
            float _1707 = fma(_1687, _1701, _1705);
            float _1709 = fma(_1691, _1703, _1707);
            float _1711 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1713 = fma(_1671, _1711, _1485);
            float _1715 = fma(_1673, _1711, _1483);
            float _1717 = fma(_1675, _1711, _1487);
            _1515 = _1713;
            _1517 = _1715;
            _1519 = _1717;
        }
    }
    float _1719 = _1515;
    float _1721 = _1517;
    float _1723 = _1519;
    float _1725 = _375;
    float _1727 = _377;
    float _1729 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1731 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1729);
    float _1733 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1735 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    float _1745 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1731);
    float _1747 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1733);
    float _1749 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1751 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    bool _1753 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(0.5);
    bool _1761 = _1757 || _1759;
    float _1763 = 1.0 / _1749;
    float _1765 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1769 = _1725;
    float _1771 = _1765;
    float _1773 = _1721;
    float _1775 = _1727;
    if (_1743)
    {
        _1767 = _1719;
    }
    float _1777 = _1767;
    float _1779 = _1765 + _1749;
    float _1781 = _1777;
    if (_1743)
    {
        _1769 = _1721;
    }
    float _1783 = _1769;
    float _1785 = _1783;
    if (_1743)
    {
        _1771 = _1723;
    }
    float _1787 = _1771;
    float _1789 = _1787;
    if (!_1743)
    {
        float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1793 = _1253 + _1791;
        float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1797 = _1083 + _1795;
        float _1799 = -_1083;
        float _1801 = _1799 + _1719;
        float _1803 = -_1253;
        float _1805 = _1803 + _1721;
        float _1807 = _1793 * _1793;
        float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1811 = _1097 + _1809;
        float _1813 = fma(_1797, _1797, _1807);
        float _1815 = fma(_1811, _1811, _1813);
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = sqrt(_1815);
        float _1821 = precise::min(_1819, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1823 = _1821 * _1817;
        float _1825 = -_1097;
        float _1827 = _1825 + _1723;
        float _1829 = fma(_1801, _1823, _1083);
        float _1831 = fma(_1805, _1823, _1253);
        float _1833 = fma(_1827, _1823, _1097);
        _1785 = _1831;
        _1781 = _1829;
        _1789 = _1833;
        _1773 = _1805;
        _1775 = _1823;
    }
    float _1835 = _1785;
    float _1837 = _1781;
    float _1839 = _1789;
    float _1841 = _1773;
    float _1843 = _1775;
    float _1845 = _1843;
    float _1847 = _1841;
    if (_1761)
    {
        _1845 = 1.0;
    }
    float _1849 = _1845;
    float _1851 = _1779 * _1763;
    float _1853 = _1851 * 0.5;
    float _1855 = _1849;
    if (!_1761)
    {
        float _1857 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1859);
        float _1863 = _1857 * 0.15915493667125701904296875;
        float _1865 = _1863 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1863 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = 1.0 / _1867;
        float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1879;
        float _1883 = _1871 * 6.283185482025146484375;
        float _1885 = cos(_1883);
        float _1887 = _1875 * _1877;
        float _1889 = 1.0 / _1861;
        float _1891 = _1885 * _1887;
        float _1893 = _1871 * 6.283185482025146484375;
        float _1895 = sin(_1893);
        float _1897 = 1.0 / _1891;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = _1889 * _1899;
        float _1903 = 1.0 / _1881;
        float _1905 = _1895 * _1897;
        float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1909 = fma(_1905, _1901, _1907);
        float _1911 = _1909 * _1903;
        float _1913 = precise::clamp(_1911, 0.0, 1.0);
        float _1915 = -_1913;
        float _1917 = _1915 + 1.0;
        _379 = _1871;
        _1855 = _1917;
    }
    float _1919 = _379;
    float _1921 = _1855;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1925 = _1835 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1929 = _1837 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1933 = _1839 + _1931;
    float _1935 = _1925 * _1925;
    float _1937 = fma(_1929, _1929, _1935);
    float _1939 = fma(_1933, _1933, _1937);
    float _1941 = rsqrt(_1939);
    float _1943 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1945 = _1929 * _1943;
    float _1947 = _1933 * _1943;
    float _1949 = _1945 * _1945;
    float _1951 = _1947 * _1947;
    float _1953 = _1949 + _1951;
    float _1955 = sqrt(_1953);
    bool _1957 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1961 = _1955 + _1959;
    float _1963 = _1933;
    float _1965 = _1937;
    float _1967 = _1961;
    float _1969 = _1919;
    float _1971 = _1925;
    float _1973 = _1945;
    if (_1957)
    {
        float _1975 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1963 = _1975;
    }
    float _1977 = _1963;
    if (_1957)
    {
        float _1979 = rsqrt(_1953);
        _1965 = _1979;
    }
    float _1981 = _1965;
    float _1983 = _1981;
    if (_1957)
    {
        float _1985 = _1961 * _1977;
        _1967 = _1985;
    }
    float _1987 = _1967;
    if (_1957)
    {
        float _1989 = _1987 * 0.15915493667125701904296875;
        _1969 = _1989;
    }
    float _1991 = _1969;
    float _1993 = _1977;
    if (_1957)
    {
        float _1995 = _1991 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2003 = precise::max(0.0, _2001);
    float _2005 = _1941;
    float _2007 = _2003;
    if (_1957)
    {
        float _2009 = _1991 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        _2005 = _2011;
    }
    float _2013 = _2005;
    float _2015 = -_1943;
    float _2017 = -_2003;
    float _2019 = fma(_1925, _2015, _2017);
    if (!_1957)
    {
        _1971 = _1947;
    }
    float _2021 = _1971;
    float _2023 = _2021;
    if (_1957)
    {
        float _2025 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2007 = _2025;
    }
    float _2027 = _2007;
    float _2029 = sqrt(_1939);
    float _2031 = _1999;
    float _2033 = _2027;
    if (_1957)
    {
        float _2035 = fma(_1999, _2027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = _2037;
    if (_1957)
    {
        float _2041 = _2013 + (-1.0);
        _2033 = _2041;
    }
    float _2043 = _2033;
    float _2045 = _2043;
    if (_1957)
    {
        float _2047 = _1981 * _2037;
        _1847 = _2047;
    }
    float _2049 = _1847;
    if (!_1957)
    {
        _1983 = _2019;
    }
    float _2051 = _1983;
    float _2053 = _2051;
    if (_1957)
    {
        float _2055 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2045 = _2055;
    }
    float _2057 = _2045;
    float _2059 = _2057;
    if (_1957)
    {
        float _2061 = _1945 * _2049;
        _1973 = _2061;
    }
    float _2063 = _1973;
    if (!_1957)
    {
        _2039 = _1949;
    }
    float _2065 = _2039;
    float _2067 = _2065;
    if (_1957)
    {
        float _2069 = _1947 * _2049;
        _2023 = _2069;
    }
    float _2071 = _2023;
    if (_1957)
    {
        float _2073 = fma(_2019, _2013, _2057);
        _2053 = _2073;
    }
    float _2075 = _2053;
    if (_1957)
    {
        float _2077 = _2063 * _2063;
        _2067 = _2077;
    }
    float _2079 = _2067;
    if (!_1957)
    {
        _2059 = _1951;
    }
    float _2081 = _2059;
    float _2083 = _2081;
    if (_1957)
    {
        float _2085 = _2071 * _2071;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2089 + _2087;
    float _2095 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2105 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2107 = rsqrt(_2093);
    float _2109 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2111 = -_2101;
    float _2113 = _2111 + 1.0;
    float _2115 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2117 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2119 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2109);
    float _2121 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2123 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2117);
    float _2125 = abs(_2113);
    float _2127 = log2(_2125);
    float _2129 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2119);
    float _2131 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2135 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2123);
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2139 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2131);
    float _2141 = _2107 * _2063;
    float _2143 = -_2133;
    float _2145 = fma(_2143, _2103, 1.0);
    float _2147 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2149 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2151 = _2107 * _2075;
    float _2153 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2149);
    float _2159 = _2107 * _2071;
    float _2161 = -_2153;
    float _2163 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2161);
    float _2165 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2167 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2157);
    float _2169 = log2(_2145);
    float _2171 = -_2159;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2163);
    float _2175 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2177 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2167);
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2181 = fma(_2173, -0.5, 0.5);
    float _2183 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2175);
    float _2185 = fma(_2173, 0.5, 0.5);
    float _2187 = exp2(_2165);
    float _2189 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2179);
    float _2191 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2183);
    float _2193 = _2151 + 1.0;
    float _2195 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2197 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2189);
    float _2199 = 1.0 / _2177;
    float _2201 = fma(_2185, _2195, -0.212114393711090087890625);
    float _2203 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2197);
    float _2205 = _2169 * 0.693147182464599609375;
    float _2207 = fma(_2185, _2201, 1.570728778839111328125);
    float _2209 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = sqrt(_2181);
    float _2213 = -_2151;
    float _2215 = fma(_2187, _2193, _2213);
    float _2217 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2191);
    float _2219 = fma(_2215, 0.5, 0.5);
    float _2221 = _2217 * _2199;
    float _2223 = _2203 * _2199;
    float _2225 = fma(_2221, 0.5, 0.5);
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _5729 = float3(_2225, _2227, _2209);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5729, float3(0.0), isnan(_5729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5729, float3(0.0), isnan(_5729)), level(0.0)).x;
    float _2233 = -_2207;
    float _2235 = fma(_2229, _2233, 1.0);
    float3 _5745 = float3(_2225, _2227, _2209);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5745, float3(0.0), isnan(_5745)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5745, float3(0.0), isnan(_5745)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float2 _5762 = float2(_2235, _2219);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5762, float2(0.0), isnan(_5762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5762, float2(0.0), isnan(_5762)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2260 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _1921 > 0.0;
    bool _2264 = isnan(_1921);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    float _2272 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2274 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    float _2276 = exp2(_2258);
    float _2278 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2280 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2278);
    float _2282 = _2280 + _2177;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2280;
    out.gl_Position.w = _2177;
    float _2284 = _2282 * 0.5;
    float _2286 = -_2276;
    float _2288 = _2286 + 1.0;
    float _2290 = _2272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2284;
    out.m_70.w = _2177;
    float _2294 = -_2292;
    float _2296 = _2294 + 1.0;
    out.m_47.x = _2290;
    float _2298 = _2292 * _2231;
    float _2300 = _2246 * _2298;
    float _2302 = _2246 * _2296;
    float _2304 = _2256 * _2298;
    float _2306 = fma(_2252, _2300, _2240);
    float _2308 = fma(_2254, _2300, _2242);
    float _2310 = fma(_2246, _2304, _2244);
    out.m_72.x = _2306;
    out.m_72.y = _2308;
    out.m_72.z = _2310;
    out.m_72.w = _2302;
    if (_2270)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2312 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2312;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1439 = false;
    bool _851 = false;
    bool _545 = false;
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
        float _2369 = as_type<float>(_107);
        out.gl_Position.z = _2369;
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
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2438 = as_type<float>(_143);
        out.gl_Position.z = _2438;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_56.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = _149 * _147;
    float _175 = 0.0;
    float _177 = _153;
    if (!_165)
    {
        float _179 = _153 * _153;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _187 = in.m_49.x;
    float _189 = in.m_49.y;
    float _191 = in.m_49.z;
    float _193 = _183;
    if (!_165)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _185 * 6.283185482025146484375;
    float _201 = floor(_185);
    int _203 = as_type<int>(_151) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_151) & 2;
    bool _209 = _207 != 0;
    float _211 = _199 * 0.15915493667125701904296875;
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    bool _217 = !_205;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _211 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_209;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = -_201;
    float _231 = _185 + _229;
    bool _233 = !_165;
    float _235 = _197;
    float _237 = _167;
    float _239 = _169;
    if (!_233)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _153 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _153);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
    }
    float _271 = _235;
    bool _273 = !_165;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _153 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _177 = _293;
    }
    float _295 = _177;
    float _297 = in.m_58.x;
    float _299 = in.m_58.y;
    float _301 = in.m_58.z;
    float _303 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _305 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _307 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _309 = in.m_60.x;
    float _311 = in.m_60.y;
    float _313 = in.m_60.z;
    float _315 = fma(_295, _187, _303);
    float _317 = fma(_295, _189, _305);
    float _319 = in.m_62.x;
    float _321 = in.m_62.y;
    float _323 = in.m_62.z;
    bool _325 = _231 < 0.5;
    float _327 = float(_325);
    float _329 = fma(_315, _155, _167);
    float _331 = fma(_223, 0.5, 0.5);
    float _333 = fma(_295, _191, _307);
    if (!_165)
    {
        float _335 = _125 * _125;
        float _337 = _335 * 0.5;
        _237 = _337;
    }
    float _339 = _237;
    float _341 = fma(_317, _155, _169);
    float _343 = -_231;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _347 = -_327;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _351 = -_331;
    float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _355 = fma(_333, _155, _171);
    float _357 = _339;
    if (!_165)
    {
        float _359 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (!_165)
    {
        _239 = _125;
    }
    float _365 = _239;
    bool _367 = !_215;
    int _369 = _367 ? 0 : 1;
    bool _371 = !_165;
    float _373 = _365;
    float _375 = _301;
    float _377 = _297;
    float _379 = _313;
    if (!_371)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = _125 * _383;
        float _393 = 1.0 / _387;
        float _395 = _389 * 0.693147182464599609375;
        float _397 = exp2(_391);
        float _399 = 1.0 / _395;
        float _401 = _397 + (-1.0);
        float _403 = -_401;
        float _405 = fma(_403, _399, _125);
        float _407 = _405 * _393;
        float _409 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _409;
    }
    float _411 = _363;
    bool _413 = !_165;
    if (!_413)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = 1.0 / _421;
        float _425 = _125 * _417;
        float _427 = exp2(_425);
        float _429 = -_427;
        float _431 = _429 + 1.0;
        float _433 = _431 * _423;
        _373 = _433;
    }
    float _435 = _373;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _443 = _441 != 0;
    float _445 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _447 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _449 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _451 = abs(_369);
    float _453 = fma(_435, _189, _445);
    bool _455 = !_439;
    int _457 = _455 ? 0 : 1;
    float _459 = fma(_435, _187, _447);
    float _461 = fma(_435, _191, _449);
    bool _463 = !_443;
    int _465 = _463 ? 0 : 1;
    float _467 = -_453;
    float _469 = _317 + _467;
    float _471 = -_459;
    float _473 = _315 + _471;
    int _475 = abs(_457);
    float _477 = _469 * _299;
    int _479 = abs(_465);
    float _481 = _469 * _311;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _485 = _469 * _321;
    float _487 = float(_475);
    float _489 = fma(_473, _297, _477);
    float _491 = fma(_473, _309, _481);
    float _493 = fma(_473, _319, _485);
    float _495 = float(_451);
    float _497 = abs(_345);
    float _499 = _487 * _497;
    float _501 = -_461;
    float _503 = _333 + _501;
    float _505 = fma(_495, _353, _499);
    float _507 = float(_479);
    float _509 = fma(_503, _301, _489);
    float _511 = fma(_503, _313, _491);
    float _513 = fma(_503, _323, _493);
    float _515 = abs(_349);
    float _517 = fma(_507, _515, _505);
    bool _519 = !_483;
    float _521 = _511;
    float _523 = _511;
    float _525 = _509;
    float _527 = _513;
    float _543;
    if (!_519)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _531 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_91);
        float _549 = 1.0 / _547;
        float _551 = _125 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _567;
    float _571 = 1.0 / _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = 1.0 / _565;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _587 = _553 + _585;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _591 = 1.0 / _569;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _597 = _587 * _571;
    bool _599 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _601 = isnan(_553);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _613 = _553 + _611;
    float _615 = 1.0 / _575;
    bool _617 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _619 = isnan(_553);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _557;
    float _631 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _635 = _553 + _633;
    float _637 = _635 * _579;
    bool _639 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _641 = isnan(_553);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _553 + _651;
    float _655 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _659 = _553 + _657;
    float _661 = _613 * _615;
    float _663 = -_649;
    float _665 = _663 + 1.0;
    out.m_64.x = _631;
    out.m_64.y = _655;
    out.m_64.z = _583;
    out.m_64.w = _595;
    float _667 = _659 * _591;
    float _669 = _653 * _629;
    bool _671 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _673 = isnan(_553);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_627;
    float _685 = _683 + 1.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = _609 * _685;
    float _697 = -_609;
    float _699 = _697 + 1.0;
    float _701 = fma(_693, _637, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _703 = -_681;
    float _705 = _703 + 1.0;
    float _707 = _649 * _699;
    bool _709 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _711 = isnan(_553);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_689, _637, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _723 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_553);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _681 * _665;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _741 = -_719;
    float _743 = _741 + 1.0;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _749 = _719 * _705;
    float _751 = _733 * _743;
    float _753 = fma(_739, _661, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _755 = fma(_747, _661, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _757 = -_733;
    float _759 = _757 + 1.0;
    float _761 = _721 * _751;
    float _763 = _701 * _751;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _765;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _769;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[143].x, _761);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _777 = fma(_767, _669, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _779 = fma(_771, _669, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _789 = in.m_56.x;
    float _791 = in.m_56.y;
    float _793 = fma(_753, _749, _773);
    float _795 = fma(_755, _749, _775);
    float _797 = fma(_783, _597, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _799 = fma(_787, _597, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _801;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _805;
    float _809 = fma(_777, _735, _793);
    float _811 = fma(_779, _735, _795);
    float _813 = fma(_803, _667, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _815 = fma(_807, _667, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _817 = fma(_797, _707, _809);
    float _819 = fma(_799, _707, _811);
    float _821 = fma(_813, _695, _817);
    float _823 = fma(_815, _695, _819);
    float _825 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[148].x, _821);
    float _827 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[148].y, _823);
    float _829 = _825 * _789;
    float _831 = _827 * _791;
    bool _833 = !_589;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _837 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_91);
        float _855 = 1.0 / _853;
        float _857 = _125 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    float _861 = in.m_51.y;
    float _863 = _517 * _829;
    float _865 = _517 * _831;
    bool _867 = _145 > 0.5;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _885 = _341 * _299;
    float _887 = 1.0 / _871;
    float _889 = _341 * _311;
    float _891 = _341 * _321;
    float _893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _895 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    float _901 = fma(_329, _297, _885);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _905 = _903 != 0;
    float _907 = 1.0 / _879;
    float _909 = -_219;
    int _911 = _867 ? as_type<int>(_909) : as_type<int>(_219);
    float _913 = fma(_329, _309, _889);
    float _915 = fma(_329, _319, _891);
    bool _917 = _861 > 0.5;
    float _919 = _895 * _893;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _923 = _859 + _921;
    float _925 = 1.0 / _875;
    bool _927 = !_899;
    float _929 = _927 ? _219 : as_type<float>(_911);
    float _931 = fma(_355, _301, _901);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _933;
    float _937 = fma(_355, _313, _913);
    float _939 = fma(_355, _323, _915);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _943 = _859 + _941;
    float _945 = _923 * _887;
    float _947 = 1.0 / _883;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _951 = _859 + _949;
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _955 = _943 * _907;
    float _957 = -_227;
    int _959 = _917 ? as_type<int>(_957) : as_type<int>(_227);
    float _961 = _951 * _925;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _965 = _859 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _975;
    bool _979 = !_905;
    float _981 = _979 ? _227 : as_type<float>(_959);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _987 = _965 * _947;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _997 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _999 = 1.0 / _935;
    float _1001 = fma(_985, _961, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1003 = fma(_991, _961, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1005 = fma(_995, _961, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1015;
    float _1019 = _997 * _953;
    float _1021 = fma(_1009, _955, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1023 = fma(_1013, _955, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1025 = fma(_1017, _955, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1029 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = fma(_969, _945, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1033 = fma(_973, _945, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1035 = fma(_977, _945, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1027);
    float _1053 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = _859 + _1055;
    float _1059 = fma(_1039, _987, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1061 = fma(_1043, _987, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1063 = fma(_1047, _987, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1051);
    float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1053);
    float _1069 = _1057 * _999;
    bool _1071 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1073 = isnan(_859);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _931 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1085 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1087 = isnan(_859);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1099 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1101 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1103 = -_1081;
    float _1105 = _1103 + 1.0;
    bool _1107 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1109 = isnan(_859);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = -_1095;
    float _1121 = _1119 + 1.0;
    float _1123 = _1083 + _1099;
    float _1125 = _1097 + _1101;
    bool _1127 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1129 = isnan(_859);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1135 = _1131 || _1133;
    float _1137 = float(_1135);
    float _1139 = _1095 * _1105;
    bool _1141 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1143 = isnan(_859);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = _1117 * _1121;
    bool _1155 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1157 = isnan(_859);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1123 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1125 + _1171;
    float _1175 = -_1117;
    float _1177 = _1175 + 1.0;
    float _1179 = _1169 * _1169;
    float _1181 = _1173 * _1173;
    float _1183 = -_1165;
    float _1185 = _1183 + 1.0;
    float _1187 = _1165 * _1177;
    float _1189 = _1179 + _1181;
    float _1191 = _1151 * _1185;
    float _1193 = -_1151;
    float _1195 = _1193 + 1.0;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1197;
    float _1201 = sqrt(_1189);
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1207;
    float _1211 = _1137 * _1195;
    float _1213 = fma(_1199, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1215 = fma(_1205, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1217 = fma(_1209, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1219 = -_1137;
    float _1221 = _1219 + 1.0;
    float _1223 = _1031 * _1211;
    float _1225 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = _1033 * _1211;
    float _1229 = _1035 * _1211;
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1223);
    float _1233 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1227);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1229);
    float _1239 = fma(_1001, _1191, _1231);
    bool _1241 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1243 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1233);
    float _1245 = fma(_1005, _1191, _1237);
    float _1247 = fma(_1021, _1187, _1239);
    float _1249 = fma(_1003, _1191, _1235);
    float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1253 = _937 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1255 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1257 = fma(_1023, _1187, _1249);
    float _1259 = fma(_1025, _1187, _1245);
    float _1261 = fma(_1059, _1153, _1247);
    float _1263 = _1253 + _1255;
    bool _1265 = !_1241;
    float _1267 = _1263;
    float _1269 = _1179;
    float _1271 = _1181;
    float _1273 = _1123;
    float _1275 = _1125;
    float _1277 = _1173;
    float _1279 = _1153;
    if (!_1265)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1285 = _1201 + _1283;
        float _1287 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = rsqrt(_1189);
        float _1291 = _1285 * _1281;
        float _1293 = _1291 * 0.15915493667125701904296875;
        float _1295 = _1293 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = _1293 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = fma(_1297, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1305 = _1289 * _1303;
        float _1307 = _1301 + (-1.0);
        float _1309 = fma(_1169, _1305, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1311 = fma(_1173, _1305, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1313 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1317 = _1309 + _1315;
        float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1321 = _1311 + _1319;
        float _1323 = fma(_1263, _1301, _1313);
        float _1325 = _1317 * _1317;
        float _1327 = _1321 * _1321;
        _1267 = _1323;
        _1269 = _1325;
        _1271 = _1327;
        _1273 = _1309;
        _1275 = _1311;
    }
    float _1329 = _1267;
    float _1331 = _1269;
    float _1333 = _1271;
    float _1335 = _1273;
    float _1337 = _1275;
    float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1341 = _1329 + _1339;
    float _1343 = fma(_1061, _1153, _1257);
    float _1345 = fma(_1063, _1153, _1259);
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1349 = fma(_1341, _1341, _1331);
    float _1351 = _929 + 0.5;
    float _1353 = fma(_1213, _1139, _1261);
    float _1355 = fma(_1215, _1139, _1343);
    float _1357 = fma(_1217, _1139, _1345);
    float _1359 = _1349 + _1333;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = -_981;
    float _1365 = _1363 + 0.5;
    float _1367 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1353);
    float _1369 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1355);
    float _1371 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1357);
    float _1373 = sqrt(_1359);
    float _1375 = _1361 * _1251;
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1381 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1385 = _1377 * _1347;
    float _1387 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1375;
    out.m_66.y = _1385;
    out.m_68.x = _1387;
    out.m_68.y = _1389;
    out.m_68.z = _1391;
    bool _1393 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1395 = isnan(_1373);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1401 = _1397 || _1399;
    float _1403 = _1371;
    if (!_1401)
    {
        _1403 = 1.0;
    }
    float _1405 = _1403;
    bool _1407 = !_1401;
    float _1409 = _1405;
    if (!_1407)
    {
        bool _1411 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1413 = isnan(_1373);
        bool _1415 = _1411 || _1413;
        bool _1417 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1419 = _1415 || _1417;
        if (!_1419)
        {
            float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1423 = _1373 + _1421;
            float _1425 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1427 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1425;
            float _1429 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1431 = _1429 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1433 = 1.0 / _1427;
            float _1435 = _1423 * _1433;
            float _1437 = fma(_1435, _1431, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1409 = _1437;
            _1439 = true;
        }
        else
        {
            bool _1441 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1443 = isnan(_1373);
            bool _1445 = _1441 || _1443;
            bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1449 = _1445 || _1447;
            if (!_1449)
            {
                float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1453 = _1373 + _1451;
                float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1457 = _1455 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1461 = _1459 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1463 = 1.0 / _1457;
                float _1465 = _1453 * _1463;
                float _1467 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1409 = _1467;
                _1439 = true;
            }
            else
            {
                _1409 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1439 = false;
    float _1469 = _1409;
    float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1473 = _1329 + _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1477 = _1335 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1481 = _1337 + _1479;
    float _1483 = fma(_1473, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1485 = fma(_1477, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1487 = fma(_1481, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = -_1253;
    float _1491 = _1489 + _1483;
    float _1493 = -_1083;
    float _1495 = _1493 + _1485;
    float _1497 = -_1097;
    float _1499 = _1497 + _1487;
    float _1501 = _1491 * _1491;
    float _1503 = fma(_1495, _1495, _1501);
    float _1505 = fma(_1499, _1499, _1503);
    float _1507 = sqrt(_1505);
    bool _1509 = _1507 > 0.0;
    bool _1511 = !_1509;
    float _1513 = _1507;
    float _1515 = _1485;
    float _1517 = _1483;
    float _1519 = _1487;
    if (!_1511)
    {
        bool _1521 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1523 = _1347;
        if (_1521)
        {
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1523 = _1525;
        }
        float _1527 = _1523;
        if (_1521)
        {
            float _1529 = _509 * _1527;
            _1277 = _1529;
        }
        float _1531 = _1277;
        float _1533 = _1531;
        if (_1521)
        {
            float _1535 = _511 * _1527;
            _1513 = _1535;
        }
        float _1537 = _1513;
        float _1539 = _1537;
        if (_1521)
        {
            float _1541 = _513 * _1527;
            _1279 = _1541;
        }
        float _1543 = _1279;
        float _1545 = _1543;
        if (!_1521)
        {
            float _1547 = _125 + 1.0;
            float _1549 = _1547;
            if (!_165)
            {
                float _1551 = _1547 * _1547;
                float _1553 = _1551 * 0.5;
                _521 = _1553;
            }
            float _1555 = _521;
            float _1557 = _1555;
            if (!_165)
            {
                float _1559 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1557 = _1559;
            }
            float _1561 = _1557;
            bool _1563 = !_165;
            float _1565 = _1561;
            if (!_1563)
            {
                float _1567 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1569 = log2(_1567);
                float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1573 = _1571 + 1.0;
                float _1575 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1577 = _1569 * _1547;
                float _1579 = 1.0 / _1573;
                float _1581 = _1575 * 0.693147182464599609375;
                float _1583 = exp2(_1577);
                float _1585 = 1.0 / _1581;
                float _1587 = _1583 + (-1.0);
                float _1589 = -_1587;
                float _1591 = fma(_1589, _1585, _1547);
                float _1593 = _1591 * _1579;
                float _1595 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1565 = _1595;
            }
            float _1597 = _1565;
            float _1599 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1601 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1603 = !_165;
            if (!_1603)
            {
                float _1605 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1607 = log2(_1605);
                float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1611 = _1609 + 1.0;
                float _1613 = 1.0 / _1611;
                float _1615 = _1607 * _1547;
                float _1617 = exp2(_1615);
                float _1619 = -_1617;
                float _1621 = _1619 + 1.0;
                float _1623 = _1621 * _1613;
                _1549 = _1623;
            }
            float _1625 = _1549;
            float _1627 = fma(_1625, _189, _1601);
            float _1629 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1631 = fma(_1625, _187, _1599);
            float _1633 = -_453;
            float _1635 = _1633 + _1627;
            float _1637 = fma(_1625, _191, _1629);
            float _1639 = -_459;
            float _1641 = _1639 + _1631;
            float _1643 = _1635 * _299;
            float _1645 = _1635 * _311;
            float _1647 = _1635 * _321;
            float _1649 = -_461;
            float _1651 = _1649 + _1637;
            float _1653 = fma(_1641, _297, _1643);
            float _1655 = fma(_1641, _309, _1645);
            float _1657 = fma(_1641, _319, _1647);
            float _1659 = fma(_1651, _301, _1653);
            float _1661 = fma(_1651, _313, _1655);
            float _1663 = fma(_1651, _323, _1657);
            _523 = _1661;
            _525 = _1659;
            _527 = _1663;
            _1533 = _1659;
            _1539 = _1661;
            _1545 = _1663;
        }
        float _1665 = _523;
        float _1667 = _525;
        float _1669 = _527;
        float _1671 = _1533;
        float _1673 = _1539;
        float _1675 = _1545;
        float _1677 = _1665 * _1665;
        float _1679 = rsqrt(_1505);
        float _1681 = fma(_1667, _1667, _1677);
        float _1683 = fma(_1669, _1669, _1681);
        float _1685 = sqrt(_1683);
        float _1687 = _1495 * _1679;
        float _1689 = _1491 * _1679;
        float _1691 = _1499 * _1679;
        bool _1693 = _1685 > 0.0;
        bool _1695 = !_1693;
        _375 = _1683;
        _377 = _1691;
        if (!_1695)
        {
            float _1697 = rsqrt(_1683);
            float _1699 = _1697 * _1665;
            float _1701 = _1697 * _1667;
            float _1703 = _1697 * _1669;
            float _1705 = _1689 * _1699;
            float _1707 = fma(_1687, _1701, _1705);
            float _1709 = fma(_1691, _1703, _1707);
            float _1711 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1713 = fma(_1671, _1711, _1485);
            float _1715 = fma(_1673, _1711, _1483);
            float _1717 = fma(_1675, _1711, _1487);
            _1515 = _1713;
            _1517 = _1715;
            _1519 = _1717;
        }
    }
    float _1719 = _1515;
    float _1721 = _1517;
    float _1723 = _1519;
    float _1725 = _375;
    float _1727 = _377;
    float _1729 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1731 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1729);
    float _1733 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1735 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    float _1745 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1731);
    float _1747 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1733);
    float _1749 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1751 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    bool _1753 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(0.5);
    bool _1761 = _1757 || _1759;
    float _1763 = 1.0 / _1749;
    float _1765 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1769 = _1725;
    float _1771 = _1765;
    float _1773 = _1721;
    float _1775 = _1727;
    if (_1743)
    {
        _1767 = _1719;
    }
    float _1777 = _1767;
    float _1779 = _1765 + _1749;
    float _1781 = _1777;
    if (_1743)
    {
        _1769 = _1721;
    }
    float _1783 = _1769;
    float _1785 = _1783;
    if (_1743)
    {
        _1771 = _1723;
    }
    float _1787 = _1771;
    float _1789 = _1787;
    if (!_1743)
    {
        float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1793 = _1253 + _1791;
        float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1797 = _1083 + _1795;
        float _1799 = -_1083;
        float _1801 = _1799 + _1719;
        float _1803 = -_1253;
        float _1805 = _1803 + _1721;
        float _1807 = _1793 * _1793;
        float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1811 = _1097 + _1809;
        float _1813 = fma(_1797, _1797, _1807);
        float _1815 = fma(_1811, _1811, _1813);
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = sqrt(_1815);
        float _1821 = precise::min(_1819, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1823 = _1821 * _1817;
        float _1825 = -_1097;
        float _1827 = _1825 + _1723;
        float _1829 = fma(_1801, _1823, _1083);
        float _1831 = fma(_1805, _1823, _1253);
        float _1833 = fma(_1827, _1823, _1097);
        _1785 = _1831;
        _1781 = _1829;
        _1789 = _1833;
        _1773 = _1805;
        _1775 = _1823;
    }
    float _1835 = _1785;
    float _1837 = _1781;
    float _1839 = _1789;
    float _1841 = _1773;
    float _1843 = _1775;
    float _1845 = _1843;
    float _1847 = _1841;
    if (_1761)
    {
        _1845 = 1.0;
    }
    float _1849 = _1845;
    float _1851 = _1779 * _1763;
    float _1853 = _1851 * 0.5;
    float _1855 = _1849;
    if (!_1761)
    {
        float _1857 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1859);
        float _1863 = _1857 * 0.15915493667125701904296875;
        float _1865 = _1863 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1863 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = 1.0 / _1867;
        float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1879;
        float _1883 = _1871 * 6.283185482025146484375;
        float _1885 = cos(_1883);
        float _1887 = _1875 * _1877;
        float _1889 = 1.0 / _1861;
        float _1891 = _1885 * _1887;
        float _1893 = _1871 * 6.283185482025146484375;
        float _1895 = sin(_1893);
        float _1897 = 1.0 / _1891;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = _1889 * _1899;
        float _1903 = 1.0 / _1881;
        float _1905 = _1895 * _1897;
        float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1909 = fma(_1905, _1901, _1907);
        float _1911 = _1909 * _1903;
        float _1913 = precise::clamp(_1911, 0.0, 1.0);
        float _1915 = -_1913;
        float _1917 = _1915 + 1.0;
        _379 = _1871;
        _1855 = _1917;
    }
    float _1919 = _379;
    float _1921 = _1855;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1925 = _1835 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1929 = _1837 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1933 = _1839 + _1931;
    float _1935 = _1925 * _1925;
    float _1937 = fma(_1929, _1929, _1935);
    float _1939 = fma(_1933, _1933, _1937);
    float _1941 = rsqrt(_1939);
    float _1943 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1945 = _1929 * _1943;
    float _1947 = _1933 * _1943;
    float _1949 = _1945 * _1945;
    float _1951 = _1947 * _1947;
    float _1953 = _1949 + _1951;
    float _1955 = sqrt(_1953);
    bool _1957 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1961 = _1955 + _1959;
    float _1963 = _1933;
    float _1965 = _1937;
    float _1967 = _1961;
    float _1969 = _1919;
    float _1971 = _1925;
    float _1973 = _1945;
    if (_1957)
    {
        float _1975 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1963 = _1975;
    }
    float _1977 = _1963;
    if (_1957)
    {
        float _1979 = rsqrt(_1953);
        _1965 = _1979;
    }
    float _1981 = _1965;
    float _1983 = _1981;
    if (_1957)
    {
        float _1985 = _1961 * _1977;
        _1967 = _1985;
    }
    float _1987 = _1967;
    if (_1957)
    {
        float _1989 = _1987 * 0.15915493667125701904296875;
        _1969 = _1989;
    }
    float _1991 = _1969;
    float _1993 = _1977;
    if (_1957)
    {
        float _1995 = _1991 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2003 = precise::max(0.0, _2001);
    float _2005 = _1941;
    float _2007 = _2003;
    if (_1957)
    {
        float _2009 = _1991 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        _2005 = _2011;
    }
    float _2013 = _2005;
    float _2015 = -_1943;
    float _2017 = -_2003;
    float _2019 = fma(_1925, _2015, _2017);
    if (!_1957)
    {
        _1971 = _1947;
    }
    float _2021 = _1971;
    float _2023 = _2021;
    if (_1957)
    {
        float _2025 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2007 = _2025;
    }
    float _2027 = _2007;
    float _2029 = sqrt(_1939);
    float _2031 = _1999;
    float _2033 = _2027;
    if (_1957)
    {
        float _2035 = fma(_1999, _2027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = _2037;
    if (_1957)
    {
        float _2041 = _2013 + (-1.0);
        _2033 = _2041;
    }
    float _2043 = _2033;
    float _2045 = _2043;
    if (_1957)
    {
        float _2047 = _1981 * _2037;
        _1847 = _2047;
    }
    float _2049 = _1847;
    if (!_1957)
    {
        _1983 = _2019;
    }
    float _2051 = _1983;
    float _2053 = _2051;
    if (_1957)
    {
        float _2055 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2045 = _2055;
    }
    float _2057 = _2045;
    float _2059 = _2057;
    if (_1957)
    {
        float _2061 = _1945 * _2049;
        _1973 = _2061;
    }
    float _2063 = _1973;
    if (!_1957)
    {
        _2039 = _1949;
    }
    float _2065 = _2039;
    float _2067 = _2065;
    if (_1957)
    {
        float _2069 = _1947 * _2049;
        _2023 = _2069;
    }
    float _2071 = _2023;
    if (_1957)
    {
        float _2073 = fma(_2019, _2013, _2057);
        _2053 = _2073;
    }
    float _2075 = _2053;
    if (_1957)
    {
        float _2077 = _2063 * _2063;
        _2067 = _2077;
    }
    float _2079 = _2067;
    if (!_1957)
    {
        _2059 = _1951;
    }
    float _2081 = _2059;
    float _2083 = _2081;
    if (_1957)
    {
        float _2085 = _2071 * _2071;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2089 + _2087;
    float _2095 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2105 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2107 = rsqrt(_2093);
    float _2109 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2111 = -_2101;
    float _2113 = _2111 + 1.0;
    float _2115 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2117 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2119 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2109);
    float _2121 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2123 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2117);
    float _2125 = abs(_2113);
    float _2127 = log2(_2125);
    float _2129 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2119);
    float _2131 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2135 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2123);
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2139 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2131);
    float _2141 = _2107 * _2063;
    float _2143 = -_2133;
    float _2145 = fma(_2143, _2103, 1.0);
    float _2147 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2149 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2151 = _2107 * _2075;
    float _2153 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2149);
    float _2159 = _2107 * _2071;
    float _2161 = -_2153;
    float _2163 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2161);
    float _2165 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2167 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2157);
    float _2169 = log2(_2145);
    float _2171 = -_2159;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2163);
    float _2175 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2177 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2167);
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2181 = fma(_2173, -0.5, 0.5);
    float _2183 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2175);
    float _2185 = fma(_2173, 0.5, 0.5);
    float _2187 = exp2(_2165);
    float _2189 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2179);
    float _2191 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2183);
    float _2193 = _2151 + 1.0;
    float _2195 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2197 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2189);
    float _2199 = 1.0 / _2177;
    float _2201 = fma(_2185, _2195, -0.212114393711090087890625);
    float _2203 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2197);
    float _2205 = _2169 * 0.693147182464599609375;
    float _2207 = fma(_2185, _2201, 1.570728778839111328125);
    float _2209 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = sqrt(_2181);
    float _2213 = -_2151;
    float _2215 = fma(_2187, _2193, _2213);
    float _2217 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2191);
    float _2219 = fma(_2215, 0.5, 0.5);
    float _2221 = _2217 * _2199;
    float _2223 = _2203 * _2199;
    float _2225 = fma(_2221, 0.5, 0.5);
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _5729 = float3(_2225, _2227, _2209);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5729, float3(0.0), isnan(_5729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5729, float3(0.0), isnan(_5729)), level(0.0)).x;
    float _2233 = -_2207;
    float _2235 = fma(_2229, _2233, 1.0);
    float3 _5745 = float3(_2225, _2227, _2209);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5745, float3(0.0), isnan(_5745)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5745, float3(0.0), isnan(_5745)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float2 _5762 = float2(_2235, _2219);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5762, float2(0.0), isnan(_5762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5762, float2(0.0), isnan(_5762)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2260 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _1921 > 0.0;
    bool _2264 = isnan(_1921);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    float _2272 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2274 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    float _2276 = exp2(_2258);
    float _2278 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2280 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2278);
    float _2282 = _2280 + _2177;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2280;
    out.gl_Position.w = _2177;
    float _2284 = _2282 * 0.5;
    float _2286 = -_2276;
    float _2288 = _2286 + 1.0;
    float _2290 = _2272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2284;
    out.m_70.w = _2177;
    float _2294 = -_2292;
    float _2296 = _2294 + 1.0;
    out.m_47.x = _2290;
    float _2298 = _2292 * _2231;
    float _2300 = _2246 * _2298;
    float _2302 = _2246 * _2296;
    float _2304 = _2256 * _2298;
    float _2306 = fma(_2252, _2300, _2240);
    float _2308 = fma(_2254, _2300, _2242);
    float _2310 = fma(_2246, _2304, _2244);
    out.m_72.x = _2306;
    out.m_72.y = _2308;
    out.m_72.z = _2310;
    out.m_72.w = _2302;
    if (_2270)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2312 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2312;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1439 = false;
    bool _851 = false;
    bool _545 = false;
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
        float _2369 = as_type<float>(_107);
        out.gl_Position.z = _2369;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2438 = as_type<float>(_143);
        out.gl_Position.z = _2438;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_56.w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = _149 * _147;
    float _175 = 0.0;
    float _177 = _153;
    if (!_165)
    {
        float _179 = _153 * _153;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _187 = in.m_49.x;
    float _189 = in.m_49.y;
    float _191 = in.m_49.z;
    float _193 = _183;
    if (!_165)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _185 * 6.283185482025146484375;
    float _201 = floor(_185);
    int _203 = as_type<int>(_151) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_151) & 2;
    bool _209 = _207 != 0;
    float _211 = _199 * 0.15915493667125701904296875;
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    bool _217 = !_205;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _211 * 6.283185482025146484375;
    float _223 = cos(_221);
    bool _225 = !_209;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = -_201;
    float _231 = _185 + _229;
    bool _233 = !_165;
    float _235 = _197;
    float _237 = _167;
    float _239 = _169;
    if (!_233)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _153 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _153);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
    }
    float _271 = _235;
    bool _273 = !_165;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _153 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _177 = _293;
    }
    float _295 = _177;
    float _297 = in.m_58.x;
    float _299 = in.m_58.y;
    float _301 = in.m_58.z;
    float _303 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _305 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _307 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _309 = in.m_60.x;
    float _311 = in.m_60.y;
    float _313 = in.m_60.z;
    float _315 = fma(_295, _187, _303);
    float _317 = fma(_295, _189, _305);
    float _319 = in.m_62.x;
    float _321 = in.m_62.y;
    float _323 = in.m_62.z;
    bool _325 = _231 < 0.5;
    float _327 = float(_325);
    float _329 = fma(_315, _155, _167);
    float _331 = fma(_223, 0.5, 0.5);
    float _333 = fma(_295, _191, _307);
    if (!_165)
    {
        float _335 = _125 * _125;
        float _337 = _335 * 0.5;
        _237 = _337;
    }
    float _339 = _237;
    float _341 = fma(_317, _155, _169);
    float _343 = -_231;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _347 = -_327;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _351 = -_331;
    float _353 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _355 = fma(_333, _155, _171);
    float _357 = _339;
    if (!_165)
    {
        float _359 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (!_165)
    {
        _239 = _125;
    }
    float _365 = _239;
    bool _367 = !_215;
    int _369 = _367 ? 0 : 1;
    bool _371 = !_165;
    float _373 = _365;
    float _375 = _301;
    float _377 = _297;
    float _379 = _313;
    if (!_371)
    {
        float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _383 = log2(_381);
        float _385 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _387 = _385 + 1.0;
        float _389 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = _125 * _383;
        float _393 = 1.0 / _387;
        float _395 = _389 * 0.693147182464599609375;
        float _397 = exp2(_391);
        float _399 = 1.0 / _395;
        float _401 = _397 + (-1.0);
        float _403 = -_401;
        float _405 = fma(_403, _399, _125);
        float _407 = _405 * _393;
        float _409 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _409;
    }
    float _411 = _363;
    bool _413 = !_165;
    if (!_413)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = 1.0 / _421;
        float _425 = _125 * _417;
        float _427 = exp2(_425);
        float _429 = -_427;
        float _431 = _429 + 1.0;
        float _433 = _431 * _423;
        _373 = _433;
    }
    float _435 = _373;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _443 = _441 != 0;
    float _445 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _447 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _449 = _411 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _451 = abs(_369);
    float _453 = fma(_435, _189, _445);
    bool _455 = !_439;
    int _457 = _455 ? 0 : 1;
    float _459 = fma(_435, _187, _447);
    float _461 = fma(_435, _191, _449);
    bool _463 = !_443;
    int _465 = _463 ? 0 : 1;
    float _467 = -_453;
    float _469 = _317 + _467;
    float _471 = -_459;
    float _473 = _315 + _471;
    int _475 = abs(_457);
    float _477 = _469 * _299;
    int _479 = abs(_465);
    float _481 = _469 * _311;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _485 = _469 * _321;
    float _487 = float(_475);
    float _489 = fma(_473, _297, _477);
    float _491 = fma(_473, _309, _481);
    float _493 = fma(_473, _319, _485);
    float _495 = float(_451);
    float _497 = abs(_345);
    float _499 = _487 * _497;
    float _501 = -_461;
    float _503 = _333 + _501;
    float _505 = fma(_495, _353, _499);
    float _507 = float(_479);
    float _509 = fma(_503, _301, _489);
    float _511 = fma(_503, _313, _491);
    float _513 = fma(_503, _323, _493);
    float _515 = abs(_349);
    float _517 = fma(_507, _515, _505);
    bool _519 = !_483;
    float _521 = _511;
    float _523 = _511;
    float _525 = _509;
    float _527 = _513;
    float _543;
    if (!_519)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _531 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_91);
        float _549 = 1.0 / _547;
        float _551 = _125 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _567;
    float _571 = 1.0 / _561;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _579 = 1.0 / _565;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _587 = _553 + _585;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _591 = 1.0 / _569;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _597 = _587 * _571;
    bool _599 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _601 = isnan(_553);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _613 = _553 + _611;
    float _615 = 1.0 / _575;
    bool _617 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _619 = isnan(_553);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = 1.0 / _557;
    float _631 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _635 = _553 + _633;
    float _637 = _635 * _579;
    bool _639 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _641 = isnan(_553);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _553 + _651;
    float _655 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _659 = _553 + _657;
    float _661 = _613 * _615;
    float _663 = -_649;
    float _665 = _663 + 1.0;
    out.m_64.x = _631;
    out.m_64.y = _655;
    out.m_64.z = _583;
    out.m_64.w = _595;
    float _667 = _659 * _591;
    float _669 = _653 * _629;
    bool _671 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _673 = isnan(_553);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_627;
    float _685 = _683 + 1.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _691;
    float _695 = _609 * _685;
    float _697 = -_609;
    float _699 = _697 + 1.0;
    float _701 = fma(_693, _637, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _703 = -_681;
    float _705 = _703 + 1.0;
    float _707 = _649 * _699;
    bool _709 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _711 = isnan(_553);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_689, _637, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _723 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_553);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _681 * _665;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _741 = -_719;
    float _743 = _741 + 1.0;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _749 = _719 * _705;
    float _751 = _733 * _743;
    float _753 = fma(_739, _661, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _755 = fma(_747, _661, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _757 = -_733;
    float _759 = _757 + 1.0;
    float _761 = _721 * _751;
    float _763 = _701 * _751;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _765;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _769;
    float _773 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[143].x, _761);
    float _775 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[143].y, _763);
    float _777 = fma(_767, _669, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _779 = fma(_771, _669, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _789 = in.m_56.x;
    float _791 = in.m_56.y;
    float _793 = fma(_753, _749, _773);
    float _795 = fma(_755, _749, _775);
    float _797 = fma(_783, _597, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _799 = fma(_787, _597, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _801;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _805;
    float _809 = fma(_777, _735, _793);
    float _811 = fma(_779, _735, _795);
    float _813 = fma(_803, _667, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _815 = fma(_807, _667, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _817 = fma(_797, _707, _809);
    float _819 = fma(_799, _707, _811);
    float _821 = fma(_813, _695, _817);
    float _823 = fma(_815, _695, _819);
    float _825 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[148].x, _821);
    float _827 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[148].y, _823);
    float _829 = _825 * _789;
    float _831 = _827 * _791;
    bool _833 = !_589;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _837 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_91);
        float _855 = 1.0 / _853;
        float _857 = _125 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    float _861 = in.m_51.y;
    float _863 = _517 * _829;
    float _865 = _517 * _831;
    bool _867 = _145 > 0.5;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _885 = _341 * _299;
    float _887 = 1.0 / _871;
    float _889 = _341 * _311;
    float _891 = _341 * _321;
    float _893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _895 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    float _901 = fma(_329, _297, _885);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _905 = _903 != 0;
    float _907 = 1.0 / _879;
    float _909 = -_219;
    int _911 = _867 ? as_type<int>(_909) : as_type<int>(_219);
    float _913 = fma(_329, _309, _889);
    float _915 = fma(_329, _319, _891);
    bool _917 = _861 > 0.5;
    float _919 = _895 * _893;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _923 = _859 + _921;
    float _925 = 1.0 / _875;
    bool _927 = !_899;
    float _929 = _927 ? _219 : as_type<float>(_911);
    float _931 = fma(_355, _301, _901);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _933;
    float _937 = fma(_355, _313, _913);
    float _939 = fma(_355, _323, _915);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _943 = _859 + _941;
    float _945 = _923 * _887;
    float _947 = 1.0 / _883;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _951 = _859 + _949;
    float _953 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _955 = _943 * _907;
    float _957 = -_227;
    int _959 = _917 ? as_type<int>(_957) : as_type<int>(_227);
    float _961 = _951 * _925;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _965 = _859 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _971;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _975;
    bool _979 = !_905;
    float _981 = _979 ? _227 : as_type<float>(_959);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _987 = _965 * _947;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _997 = _865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _999 = 1.0 / _935;
    float _1001 = fma(_985, _961, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1003 = fma(_991, _961, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1005 = fma(_995, _961, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1007;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1015;
    float _1019 = _997 * _953;
    float _1021 = fma(_1009, _955, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1023 = fma(_1013, _955, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1025 = fma(_1017, _955, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1029 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = fma(_969, _945, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1033 = fma(_973, _945, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1035 = fma(_977, _945, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1049 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1051 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1027);
    float _1053 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1057 = _859 + _1055;
    float _1059 = fma(_1039, _987, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1061 = fma(_1043, _987, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1063 = fma(_1047, _987, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1051);
    float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1053);
    float _1069 = _1057 * _999;
    bool _1071 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1073 = isnan(_859);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _931 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1085 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1087 = isnan(_859);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1099 = _1065 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1101 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1103 = -_1081;
    float _1105 = _1103 + 1.0;
    bool _1107 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1109 = isnan(_859);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = -_1095;
    float _1121 = _1119 + 1.0;
    float _1123 = _1083 + _1099;
    float _1125 = _1097 + _1101;
    bool _1127 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1129 = isnan(_859);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1135 = _1131 || _1133;
    float _1137 = float(_1135);
    float _1139 = _1095 * _1105;
    bool _1141 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1143 = isnan(_859);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = _1117 * _1121;
    bool _1155 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1157 = isnan(_859);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1169 = _1123 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1125 + _1171;
    float _1175 = -_1117;
    float _1177 = _1175 + 1.0;
    float _1179 = _1169 * _1169;
    float _1181 = _1173 * _1173;
    float _1183 = -_1165;
    float _1185 = _1183 + 1.0;
    float _1187 = _1165 * _1177;
    float _1189 = _1179 + _1181;
    float _1191 = _1151 * _1185;
    float _1193 = -_1151;
    float _1195 = _1193 + 1.0;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1197;
    float _1201 = sqrt(_1189);
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1207;
    float _1211 = _1137 * _1195;
    float _1213 = fma(_1199, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1215 = fma(_1205, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1217 = fma(_1209, _1069, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1219 = -_1137;
    float _1221 = _1219 + 1.0;
    float _1223 = _1031 * _1211;
    float _1225 = _1019 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1227 = _1033 * _1211;
    float _1229 = _1035 * _1211;
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1223);
    float _1233 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1225);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1227);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1229);
    float _1239 = fma(_1001, _1191, _1231);
    bool _1241 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1243 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1233);
    float _1245 = fma(_1005, _1191, _1237);
    float _1247 = fma(_1021, _1187, _1239);
    float _1249 = fma(_1003, _1191, _1235);
    float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1253 = _937 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1255 = _1243 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1257 = fma(_1023, _1187, _1249);
    float _1259 = fma(_1025, _1187, _1245);
    float _1261 = fma(_1059, _1153, _1247);
    float _1263 = _1253 + _1255;
    bool _1265 = !_1241;
    float _1267 = _1263;
    float _1269 = _1179;
    float _1271 = _1181;
    float _1273 = _1123;
    float _1275 = _1125;
    float _1277 = _1173;
    float _1279 = _1153;
    if (!_1265)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1285 = _1201 + _1283;
        float _1287 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1289 = rsqrt(_1189);
        float _1291 = _1285 * _1281;
        float _1293 = _1291 * 0.15915493667125701904296875;
        float _1295 = _1293 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = _1293 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = fma(_1297, _1287, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1305 = _1289 * _1303;
        float _1307 = _1301 + (-1.0);
        float _1309 = fma(_1169, _1305, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1311 = fma(_1173, _1305, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1313 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1317 = _1309 + _1315;
        float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1321 = _1311 + _1319;
        float _1323 = fma(_1263, _1301, _1313);
        float _1325 = _1317 * _1317;
        float _1327 = _1321 * _1321;
        _1267 = _1323;
        _1269 = _1325;
        _1271 = _1327;
        _1273 = _1309;
        _1275 = _1311;
    }
    float _1329 = _1267;
    float _1331 = _1269;
    float _1333 = _1271;
    float _1335 = _1273;
    float _1337 = _1275;
    float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1341 = _1329 + _1339;
    float _1343 = fma(_1061, _1153, _1257);
    float _1345 = fma(_1063, _1153, _1259);
    float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1349 = fma(_1341, _1341, _1331);
    float _1351 = _929 + 0.5;
    float _1353 = fma(_1213, _1139, _1261);
    float _1355 = fma(_1215, _1139, _1343);
    float _1357 = fma(_1217, _1139, _1345);
    float _1359 = _1349 + _1333;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = -_981;
    float _1365 = _1363 + 0.5;
    float _1367 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1353);
    float _1369 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1355);
    float _1371 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1357);
    float _1373 = sqrt(_1359);
    float _1375 = _1361 * _1251;
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1381 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1383 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1385 = _1377 * _1347;
    float _1387 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1375;
    out.m_66.y = _1385;
    out.m_68.x = _1387;
    out.m_68.y = _1389;
    out.m_68.z = _1391;
    bool _1393 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1395 = isnan(_1373);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1401 = _1397 || _1399;
    float _1403 = _1371;
    if (!_1401)
    {
        _1403 = 1.0;
    }
    float _1405 = _1403;
    bool _1407 = !_1401;
    float _1409 = _1405;
    if (!_1407)
    {
        bool _1411 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1413 = isnan(_1373);
        bool _1415 = _1411 || _1413;
        bool _1417 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1419 = _1415 || _1417;
        if (!_1419)
        {
            float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1423 = _1373 + _1421;
            float _1425 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1427 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1425;
            float _1429 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1431 = _1429 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1433 = 1.0 / _1427;
            float _1435 = _1423 * _1433;
            float _1437 = fma(_1435, _1431, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1409 = _1437;
            _1439 = true;
        }
        else
        {
            bool _1441 = _1373 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1443 = isnan(_1373);
            bool _1445 = _1441 || _1443;
            bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1449 = _1445 || _1447;
            if (!_1449)
            {
                float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1453 = _1373 + _1451;
                float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1457 = _1455 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1461 = _1459 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1463 = 1.0 / _1457;
                float _1465 = _1453 * _1463;
                float _1467 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1409 = _1467;
                _1439 = true;
            }
            else
            {
                _1409 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1439 = false;
    float _1469 = _1409;
    float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1473 = _1329 + _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1477 = _1335 + _1475;
    float _1479 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1481 = _1337 + _1479;
    float _1483 = fma(_1473, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1485 = fma(_1477, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1487 = fma(_1481, _1469, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1489 = -_1253;
    float _1491 = _1489 + _1483;
    float _1493 = -_1083;
    float _1495 = _1493 + _1485;
    float _1497 = -_1097;
    float _1499 = _1497 + _1487;
    float _1501 = _1491 * _1491;
    float _1503 = fma(_1495, _1495, _1501);
    float _1505 = fma(_1499, _1499, _1503);
    float _1507 = sqrt(_1505);
    bool _1509 = _1507 > 0.0;
    bool _1511 = !_1509;
    float _1513 = _1507;
    float _1515 = _1485;
    float _1517 = _1483;
    float _1519 = _1487;
    if (!_1511)
    {
        bool _1521 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1523 = _1347;
        if (_1521)
        {
            float _1525 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1523 = _1525;
        }
        float _1527 = _1523;
        if (_1521)
        {
            float _1529 = _509 * _1527;
            _1277 = _1529;
        }
        float _1531 = _1277;
        float _1533 = _1531;
        if (_1521)
        {
            float _1535 = _511 * _1527;
            _1513 = _1535;
        }
        float _1537 = _1513;
        float _1539 = _1537;
        if (_1521)
        {
            float _1541 = _513 * _1527;
            _1279 = _1541;
        }
        float _1543 = _1279;
        float _1545 = _1543;
        if (!_1521)
        {
            float _1547 = _125 + 1.0;
            float _1549 = _1547;
            if (!_165)
            {
                float _1551 = _1547 * _1547;
                float _1553 = _1551 * 0.5;
                _521 = _1553;
            }
            float _1555 = _521;
            float _1557 = _1555;
            if (!_165)
            {
                float _1559 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1557 = _1559;
            }
            float _1561 = _1557;
            bool _1563 = !_165;
            float _1565 = _1561;
            if (!_1563)
            {
                float _1567 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1569 = log2(_1567);
                float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1573 = _1571 + 1.0;
                float _1575 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1577 = _1569 * _1547;
                float _1579 = 1.0 / _1573;
                float _1581 = _1575 * 0.693147182464599609375;
                float _1583 = exp2(_1577);
                float _1585 = 1.0 / _1581;
                float _1587 = _1583 + (-1.0);
                float _1589 = -_1587;
                float _1591 = fma(_1589, _1585, _1547);
                float _1593 = _1591 * _1579;
                float _1595 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1565 = _1595;
            }
            float _1597 = _1565;
            float _1599 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1601 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1603 = !_165;
            if (!_1603)
            {
                float _1605 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1607 = log2(_1605);
                float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1611 = _1609 + 1.0;
                float _1613 = 1.0 / _1611;
                float _1615 = _1607 * _1547;
                float _1617 = exp2(_1615);
                float _1619 = -_1617;
                float _1621 = _1619 + 1.0;
                float _1623 = _1621 * _1613;
                _1549 = _1623;
            }
            float _1625 = _1549;
            float _1627 = fma(_1625, _189, _1601);
            float _1629 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1631 = fma(_1625, _187, _1599);
            float _1633 = -_453;
            float _1635 = _1633 + _1627;
            float _1637 = fma(_1625, _191, _1629);
            float _1639 = -_459;
            float _1641 = _1639 + _1631;
            float _1643 = _1635 * _299;
            float _1645 = _1635 * _311;
            float _1647 = _1635 * _321;
            float _1649 = -_461;
            float _1651 = _1649 + _1637;
            float _1653 = fma(_1641, _297, _1643);
            float _1655 = fma(_1641, _309, _1645);
            float _1657 = fma(_1641, _319, _1647);
            float _1659 = fma(_1651, _301, _1653);
            float _1661 = fma(_1651, _313, _1655);
            float _1663 = fma(_1651, _323, _1657);
            _523 = _1661;
            _525 = _1659;
            _527 = _1663;
            _1533 = _1659;
            _1539 = _1661;
            _1545 = _1663;
        }
        float _1665 = _523;
        float _1667 = _525;
        float _1669 = _527;
        float _1671 = _1533;
        float _1673 = _1539;
        float _1675 = _1545;
        float _1677 = _1665 * _1665;
        float _1679 = rsqrt(_1505);
        float _1681 = fma(_1667, _1667, _1677);
        float _1683 = fma(_1669, _1669, _1681);
        float _1685 = sqrt(_1683);
        float _1687 = _1495 * _1679;
        float _1689 = _1491 * _1679;
        float _1691 = _1499 * _1679;
        bool _1693 = _1685 > 0.0;
        bool _1695 = !_1693;
        _375 = _1683;
        _377 = _1691;
        if (!_1695)
        {
            float _1697 = rsqrt(_1683);
            float _1699 = _1697 * _1665;
            float _1701 = _1697 * _1667;
            float _1703 = _1697 * _1669;
            float _1705 = _1689 * _1699;
            float _1707 = fma(_1687, _1701, _1705);
            float _1709 = fma(_1691, _1703, _1707);
            float _1711 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1713 = fma(_1671, _1711, _1485);
            float _1715 = fma(_1673, _1711, _1483);
            float _1717 = fma(_1675, _1711, _1487);
            _1515 = _1713;
            _1517 = _1715;
            _1519 = _1717;
        }
    }
    float _1719 = _1515;
    float _1721 = _1517;
    float _1723 = _1519;
    float _1725 = _375;
    float _1727 = _377;
    float _1729 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1731 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1729);
    float _1733 = _1253 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1735 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    float _1745 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1731);
    float _1747 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1733);
    float _1749 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1751 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    bool _1753 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(0.5);
    bool _1761 = _1757 || _1759;
    float _1763 = 1.0 / _1749;
    float _1765 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1769 = _1725;
    float _1771 = _1765;
    float _1773 = _1721;
    float _1775 = _1727;
    if (_1743)
    {
        _1767 = _1719;
    }
    float _1777 = _1767;
    float _1779 = _1765 + _1749;
    float _1781 = _1777;
    if (_1743)
    {
        _1769 = _1721;
    }
    float _1783 = _1769;
    float _1785 = _1783;
    if (_1743)
    {
        _1771 = _1723;
    }
    float _1787 = _1771;
    float _1789 = _1787;
    if (!_1743)
    {
        float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1793 = _1253 + _1791;
        float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1797 = _1083 + _1795;
        float _1799 = -_1083;
        float _1801 = _1799 + _1719;
        float _1803 = -_1253;
        float _1805 = _1803 + _1721;
        float _1807 = _1793 * _1793;
        float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1811 = _1097 + _1809;
        float _1813 = fma(_1797, _1797, _1807);
        float _1815 = fma(_1811, _1811, _1813);
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1819 = sqrt(_1815);
        float _1821 = precise::min(_1819, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1823 = _1821 * _1817;
        float _1825 = -_1097;
        float _1827 = _1825 + _1723;
        float _1829 = fma(_1801, _1823, _1083);
        float _1831 = fma(_1805, _1823, _1253);
        float _1833 = fma(_1827, _1823, _1097);
        _1785 = _1831;
        _1781 = _1829;
        _1789 = _1833;
        _1773 = _1805;
        _1775 = _1823;
    }
    float _1835 = _1785;
    float _1837 = _1781;
    float _1839 = _1789;
    float _1841 = _1773;
    float _1843 = _1775;
    float _1845 = _1843;
    float _1847 = _1841;
    if (_1761)
    {
        _1845 = 1.0;
    }
    float _1849 = _1845;
    float _1851 = _1779 * _1763;
    float _1853 = _1851 * 0.5;
    float _1855 = _1849;
    if (!_1761)
    {
        float _1857 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1859);
        float _1863 = _1857 * 0.15915493667125701904296875;
        float _1865 = _1863 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1863 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = 1.0 / _1867;
        float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1879;
        float _1883 = _1871 * 6.283185482025146484375;
        float _1885 = cos(_1883);
        float _1887 = _1875 * _1877;
        float _1889 = 1.0 / _1861;
        float _1891 = _1885 * _1887;
        float _1893 = _1871 * 6.283185482025146484375;
        float _1895 = sin(_1893);
        float _1897 = 1.0 / _1891;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = _1889 * _1899;
        float _1903 = 1.0 / _1881;
        float _1905 = _1895 * _1897;
        float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1909 = fma(_1905, _1901, _1907);
        float _1911 = _1909 * _1903;
        float _1913 = precise::clamp(_1911, 0.0, 1.0);
        float _1915 = -_1913;
        float _1917 = _1915 + 1.0;
        _379 = _1871;
        _1855 = _1917;
    }
    float _1919 = _379;
    float _1921 = _1855;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1925 = _1835 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1929 = _1837 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1933 = _1839 + _1931;
    float _1935 = _1925 * _1925;
    float _1937 = fma(_1929, _1929, _1935);
    float _1939 = fma(_1933, _1933, _1937);
    float _1941 = rsqrt(_1939);
    float _1943 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1945 = _1929 * _1943;
    float _1947 = _1933 * _1943;
    float _1949 = _1945 * _1945;
    float _1951 = _1947 * _1947;
    float _1953 = _1949 + _1951;
    float _1955 = sqrt(_1953);
    bool _1957 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1961 = _1955 + _1959;
    float _1963 = _1933;
    float _1965 = _1937;
    float _1967 = _1961;
    float _1969 = _1919;
    float _1971 = _1925;
    float _1973 = _1945;
    if (_1957)
    {
        float _1975 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1963 = _1975;
    }
    float _1977 = _1963;
    if (_1957)
    {
        float _1979 = rsqrt(_1953);
        _1965 = _1979;
    }
    float _1981 = _1965;
    float _1983 = _1981;
    if (_1957)
    {
        float _1985 = _1961 * _1977;
        _1967 = _1985;
    }
    float _1987 = _1967;
    if (_1957)
    {
        float _1989 = _1987 * 0.15915493667125701904296875;
        _1969 = _1989;
    }
    float _1991 = _1969;
    float _1993 = _1977;
    if (_1957)
    {
        float _1995 = _1991 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2003 = precise::max(0.0, _2001);
    float _2005 = _1941;
    float _2007 = _2003;
    if (_1957)
    {
        float _2009 = _1991 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        _2005 = _2011;
    }
    float _2013 = _2005;
    float _2015 = -_1943;
    float _2017 = -_2003;
    float _2019 = fma(_1925, _2015, _2017);
    if (!_1957)
    {
        _1971 = _1947;
    }
    float _2021 = _1971;
    float _2023 = _2021;
    if (_1957)
    {
        float _2025 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2007 = _2025;
    }
    float _2027 = _2007;
    float _2029 = sqrt(_1939);
    float _2031 = _1999;
    float _2033 = _2027;
    if (_1957)
    {
        float _2035 = fma(_1999, _2027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = _2037;
    if (_1957)
    {
        float _2041 = _2013 + (-1.0);
        _2033 = _2041;
    }
    float _2043 = _2033;
    float _2045 = _2043;
    if (_1957)
    {
        float _2047 = _1981 * _2037;
        _1847 = _2047;
    }
    float _2049 = _1847;
    if (!_1957)
    {
        _1983 = _2019;
    }
    float _2051 = _1983;
    float _2053 = _2051;
    if (_1957)
    {
        float _2055 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2045 = _2055;
    }
    float _2057 = _2045;
    float _2059 = _2057;
    if (_1957)
    {
        float _2061 = _1945 * _2049;
        _1973 = _2061;
    }
    float _2063 = _1973;
    if (!_1957)
    {
        _2039 = _1949;
    }
    float _2065 = _2039;
    float _2067 = _2065;
    if (_1957)
    {
        float _2069 = _1947 * _2049;
        _2023 = _2069;
    }
    float _2071 = _2023;
    if (_1957)
    {
        float _2073 = fma(_2019, _2013, _2057);
        _2053 = _2073;
    }
    float _2075 = _2053;
    if (_1957)
    {
        float _2077 = _2063 * _2063;
        _2067 = _2077;
    }
    float _2079 = _2067;
    if (!_1957)
    {
        _2059 = _1951;
    }
    float _2081 = _2059;
    float _2083 = _2081;
    if (_1957)
    {
        float _2085 = _2071 * _2071;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2089 + _2087;
    float _2095 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2105 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2107 = rsqrt(_2093);
    float _2109 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2111 = -_2101;
    float _2113 = _2111 + 1.0;
    float _2115 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2117 = _1835 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2119 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2109);
    float _2121 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2123 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2117);
    float _2125 = abs(_2113);
    float _2127 = log2(_2125);
    float _2129 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2119);
    float _2131 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2135 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2123);
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2139 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2131);
    float _2141 = _2107 * _2063;
    float _2143 = -_2133;
    float _2145 = fma(_2143, _2103, 1.0);
    float _2147 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2149 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2151 = _2107 * _2075;
    float _2153 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2155 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2157 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2149);
    float _2159 = _2107 * _2071;
    float _2161 = -_2153;
    float _2163 = fma(_2151, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2161);
    float _2165 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2167 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2157);
    float _2169 = log2(_2145);
    float _2171 = -_2159;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2163);
    float _2175 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2177 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2167);
    float _2179 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2181 = fma(_2173, -0.5, 0.5);
    float _2183 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2175);
    float _2185 = fma(_2173, 0.5, 0.5);
    float _2187 = exp2(_2165);
    float _2189 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2179);
    float _2191 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2183);
    float _2193 = _2151 + 1.0;
    float _2195 = fma(_2185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2197 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2189);
    float _2199 = 1.0 / _2177;
    float _2201 = fma(_2185, _2195, -0.212114393711090087890625);
    float _2203 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2197);
    float _2205 = _2169 * 0.693147182464599609375;
    float _2207 = fma(_2185, _2201, 1.570728778839111328125);
    float _2209 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2211 = sqrt(_2181);
    float _2213 = -_2151;
    float _2215 = fma(_2187, _2193, _2213);
    float _2217 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2191);
    float _2219 = fma(_2215, 0.5, 0.5);
    float _2221 = _2217 * _2199;
    float _2223 = _2203 * _2199;
    float _2225 = fma(_2221, 0.5, 0.5);
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _5729 = float3(_2225, _2227, _2209);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5729, float3(0.0), isnan(_5729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5729, float3(0.0), isnan(_5729)), level(0.0)).x;
    float _2233 = -_2207;
    float _2235 = fma(_2229, _2233, 1.0);
    float3 _5745 = float3(_2225, _2227, _2209);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5745, float3(0.0), isnan(_5745)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5745, float3(0.0), isnan(_5745)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float2 _5762 = float2(_2235, _2219);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5762, float2(0.0), isnan(_5762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5762, float2(0.0), isnan(_5762)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2260 = _2137 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2262 = _1921 > 0.0;
    bool _2264 = isnan(_1921);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan(0.0);
    bool _2270 = _2266 || _2268;
    float _2272 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2274 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2260);
    float _2276 = exp2(_2258);
    float _2278 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2280 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2278);
    float _2282 = _2280 + _2177;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2203;
    out.gl_Position.z = _2280;
    out.gl_Position.w = _2177;
    float _2284 = _2282 * 0.5;
    float _2286 = -_2276;
    float _2288 = _2286 + 1.0;
    float _2290 = _2272 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2284;
    out.m_70.w = _2177;
    float _2294 = -_2292;
    float _2296 = _2294 + 1.0;
    out.m_47.x = _2290;
    float _2298 = _2292 * _2231;
    float _2300 = _2246 * _2298;
    float _2302 = _2246 * _2296;
    float _2304 = _2256 * _2298;
    float _2306 = fma(_2252, _2300, _2240);
    float _2308 = fma(_2254, _2300, _2242);
    float _2310 = fma(_2246, _2304, _2244);
    out.m_72.x = _2306;
    out.m_72.y = _2308;
    out.m_72.z = _2310;
    out.m_72.w = _2302;
    if (_2270)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2312 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2312;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

