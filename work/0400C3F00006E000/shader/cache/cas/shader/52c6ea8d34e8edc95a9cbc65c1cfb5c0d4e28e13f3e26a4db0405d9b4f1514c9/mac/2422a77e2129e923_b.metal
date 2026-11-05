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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2108 = false;
    bool _1255 = false;
    bool _303 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_99);
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2408 = as_type<float>(_115);
        out.gl_Position.z = _2408;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_51.w;
    float _121 = float(_99);
    float _123 = 1.0 / _121;
    float _125 = -_119;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_119);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = _127 * _123;
    bool _141 = _127 >= _121;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    out.m_53.x = _139;
    float _147 = _139;
    float _149 = _127;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _107;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2480 = as_type<float>(_155);
        out.gl_Position.z = _2480;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _171 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    bool _183 = !_163;
    float _185 = _177;
    float _187 = _181;
    float _205;
    if (!_183)
    {
        float _189 = in.m_57.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _139;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _247;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _229;
    float _255 = _245 * _233;
    float _257 = -_245;
    float _259 = _257 + 1.0;
    float _261 = _213 * _253;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = fma(_249, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = fma(_265, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = _267 * _255;
    float _273 = _269 * _255;
    float _275 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_251;
    float _301;
    if (!_283)
    {
        float _285 = in.m_57.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _139;
    }
    _303 = false;
    float _305 = _301;
    float _307 = in.m_59.x;
    float _309 = in.m_59.y;
    bool _311 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _313 = isnan(_305);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _329 = isnan(_305);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _305 + _343;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _353 = 1.0 / _325;
    float _355 = _337 * _349;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = _281 * _309;
    float _363 = _279 * _307;
    float _365 = _341 * _353;
    float _367 = fma(_365, _345, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _371 = _367 * _355;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _375 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _371);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[116].x, _377);
    float _385 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _385;
    out.m_61.y = _381;
    out.m_61.z = _375;
    out.m_61.w = _387;
    bool _389 = !_351;
    if (!_389)
    {
        float _391 = in.m_57.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _147 = _405;
    }
    float _407 = _147;
    float _409 = in.m_57.x;
    float _411 = in.m_57.y;
    float _413 = in.m_57.z;
    float _415 = in.m_57.w;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    float _421 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _423 = as_type<float>(int(gl_VertexIndex));
    bool _425 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _437 = 1.0 + _435;
    bool _439 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(1.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = 1.0 / _437;
    float _451 = _419 * _127;
    float _453 = exp2(_451);
    float _455 = _413 * 2.0;
    float _457 = _409 * 2.0;
    float _459 = _411 * 2.0;
    float _461 = _411 + _409;
    float _463 = _411 + _413;
    float _465 = _413 + _409;
    float _467 = floor(_455);
    float _469 = _461 + (-1.0);
    float _471 = _463 + (-1.0);
    float _473 = _465 + (-1.0);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _477 = floor(_457);
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = _433 ? _481 : 0.0;
    float _485 = floor(_459);
    bool _487 = _467 > 0.0;
    bool _489 = _467 >= 0.0;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    if (_447)
    {
        float _499 = _483 * _449;
        _149 = _499;
    }
    float _501 = _149;
    int _503 = _497 ? 0 : 1;
    bool _505 = _477 > 0.0;
    bool _507 = _477 >= 0.0;
    bool _509 = isnan(_477);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    int _517 = as_type<int>(_423) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_423) & 2;
    bool _523 = _521 != 0;
    bool _525 = _485 > 0.0;
    int _527 = _515 ? 0 : 1;
    bool _529 = _485 >= 0.0;
    bool _531 = isnan(_485);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    int _539 = ~_503;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = ~_527;
    int _547 = _545 + 1;
    int _549 = _547 + 1;
    bool _551 = _415 > 0.5;
    int _553 = _537 ? 0 : 1;
    int _555 = _543;
    int _557 = _549;
    if (!_487)
    {
        int _559 = ~_503;
        int _561 = _559 + 1;
        _555 = _561;
    }
    int _563 = _555;
    if (!_505)
    {
        int _565 = ~_527;
        int _567 = _565 + 1;
        _557 = _567;
    }
    int _569 = _557;
    bool _571 = !_523;
    float _573 = _571 ? (-0.5) : 0.5;
    int _575 = ~_553;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _591 = _589 != 0;
    int _593 = _579;
    if (!_525)
    {
        int _595 = ~_553;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    bool _601 = !_519;
    float _603 = _601 ? (-0.5) : 0.5;
    float _605 = -_573;
    int _607 = _551 ? as_type<int>(_605) : as_type<int>(_573);
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _623 = _621 != 0;
    float _625 = in.m_66.x;
    float _627 = in.m_66.y;
    float _629 = in.m_66.z;
    bool _631 = !_583;
    int _633 = _631 ? 0 : 1;
    float _635 = float(_563);
    int _637 = abs(_633);
    bool _639 = !_587;
    int _641 = _639 ? 0 : 1;
    float _643 = float(_637);
    int _645 = abs(_641);
    float _647 = float(_569);
    float _649 = _643 * _635;
    float _651 = float(_645);
    float _653 = in.m_46.x;
    float _655 = in.m_46.y;
    float _657 = in.m_46.z;
    bool _659 = _409 > 0.5;
    float _661 = _649 * (-2.0);
    float _663 = _409 + (-0.5);
    float _665 = _651 * _647;
    bool _667 = !_591;
    int _669 = _667 ? 0 : 1;
    float _671 = fma(_661, _625, _625);
    float _673 = _665 * (-2.0);
    float _675 = fma(_475, _661, _475);
    float _677 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].x, _671);
    float _681 = fma(_673, _627, _627);
    int _683 = abs(_669);
    float _685 = fma(_675, _501, _679);
    float _687 = float(_599);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _689;
    float _693 = _685 * 0.15915493667125701904296875;
    float _695 = float(_683);
    float _697 = 1.0 / _691;
    bool _699 = _411 > 0.5;
    float _701 = _411 + (-0.5);
    bool _703 = _413 > 0.5;
    float _705 = _695 * _687;
    float _707 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = _413 + (-0.5);
    float _711 = fma(_677, _673, _677);
    float _713 = _705 * (-2.0);
    float _715 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].y, _681);
    float _717 = _655 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _655 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = fma(_713, _629, _629);
    float _723 = _655 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = fma(_707, _713, _707);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _729 = _407 + _727;
    float _731 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[196].z, _721);
    float _733 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _735 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _737 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _739 = fma(_711, _501, _715);
    float _741 = fma(_725, _501, _731);
    float _743 = _729 * _697;
    float _745 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[4].z, _733);
    float _747 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[5].z, _735);
    float _749 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[6].z, _737);
    bool _751 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _753 = isnan(_407);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _693 * 6.283185482025146484375;
    float _765 = sin(_763);
    bool _767 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _769 = isnan(_407);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = _739 * 0.15915493667125701904296875;
    float _781 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = -_777;
    float _785 = _783 + 1.0;
    float _787 = _693 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _791;
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _573);
    float _797 = _745 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _799;
    float _803 = _749 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = _781 * _795;
    bool _807 = !_623;
    float _809 = _807 ? _573 : as_type<float>(_607);
    float _811 = _779 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _741 * 0.15915493667125701904296875;
    float _817 = fma(_801, _743, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _821 = -_603;
    int _823 = _659 ? as_type<int>(_821) : as_type<int>(_603);
    float _825 = -_603;
    int _827 = _703 ? as_type<int>(_825) : as_type<int>(_603);
    float _829 = _421 * _819;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _815 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _839;
    float _843 = _761 * _785;
    float _845 = fma(_793, _743, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _847 = _765 * _813;
    float _849 = fma(_841, _743, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _851 = _817 * _843;
    float _853 = _845 * _843;
    float _855 = _815 * 6.283185482025146484375;
    float _857 = sin(_855);
    float _859 = _765 * _833;
    float _861 = _789 * _833;
    float _863 = _849 * _843;
    float _865 = -_761;
    float _867 = _865 + 1.0;
    float _869 = _765 * _837;
    float _871 = _789 * _813;
    float _873 = _789 * _837;
    float _875 = _833 * _837;
    float _877 = _813 * _837;
    float _879 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _881 = _873 * _805;
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _863);
    float _885 = fma(_857, _861, _847);
    float _887 = -_871;
    float _889 = fma(_857, _859, _887);
    float _891 = -_859;
    float _893 = fma(_857, _871, _891);
    float _895 = -_805;
    float _897 = _857 * _895;
    float _899 = fma(_885, _829, _881);
    float _901 = _869 * _805;
    float _903 = fma(_857, _847, _861);
    float _905 = fma(_875, _829, _897);
    float _907 = fma(_893, _879, _899);
    float _909 = fma(_889, _829, _901);
    float _911 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].z, _883);
    float _913 = fma(_877, _879, _905);
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = fma(_903, _879, _909);
    float _921 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _853);
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _927 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _851);
    float _929 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].x, _921);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].y, _927);
    float _937 = _873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = _873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _945 = _873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = _797 + _939;
    float _949 = _803 + _941;
    float _951 = -_857;
    float _953 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].x, _943);
    float _955 = -_857;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _937);
    float _959 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _961 = _947 + _959;
    float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _965 = _949 + _963;
    float _967 = -_857;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _971 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _953);
    float _973 = _961 * _961;
    float _975 = _965 * _965;
    float _977 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    float _979 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    float _981 = _885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _983 = _973 + _975;
    float _985 = _885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _987 = _885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _989 = -_573;
    int _991 = _699 ? as_type<int>(_989) : as_type<int>(_573);
    float _993 = sqrt(_983);
    float _995 = _907 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _981);
    bool _999 = !_615;
    float _1001 = _999 ? _573 : as_type<float>(_991);
    float _1003 = _573 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1005 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1007 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1011 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    float _1013 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _985);
    float _1015 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _987);
    float _1017 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    float _1019 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1021 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1009);
    float _1023 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1011);
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1027 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1003 * _971;
    float _1031 = _1003 * _977;
    float _1033 = _1003 * _979;
    float _1035 = _747 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1037 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1039 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1043 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1013);
    float _1045 = _1035 + _1037;
    float _1047 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1015);
    float _1049 = _919;
    float _1051 = _973;
    float _1053 = _975;
    float _1055 = _947;
    float _1057 = _949;
    if (!_1027)
    {
        _1049 = _1045;
    }
    float _1059 = _1049;
    bool _1061 = !_1027;
    float _1063 = _1059;
    if (!_1061)
    {
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1069 = _993 + _1067;
        float _1071 = rsqrt(_983);
        float _1073 = _1069 * _1065;
        float _1075 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = _1073 * 0.15915493667125701904296875;
        float _1079 = _1077 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = fma(_1081, _1075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1089 = _1071 * _1087;
        float _1091 = _1085 + (-1.0);
        float _1093 = fma(_961, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1095 = fma(_965, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1097 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1093 + _1099;
        float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1105 = _1095 + _1103;
        float _1107 = fma(_1045, _1085, _1097);
        float _1109 = _1101 * _1101;
        float _1111 = _1105 * _1105;
        _1063 = _1107;
        _1051 = _1109;
        _1053 = _1111;
        _1055 = _1093;
        _1057 = _1095;
    }
    float _1113 = _1063;
    float _1115 = _1051;
    float _1117 = _1053;
    float _1119 = _1055;
    float _1121 = _1057;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_611;
    float _1127 = _1125 ? _603 : as_type<float>(_823);
    float _1129 = _603 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1131 = !_619;
    float _1133 = _1131 ? _603 : as_type<float>(_827);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1137 = _1113 + _1135;
    float _1139 = -_1001;
    float _1141 = _1139 + 0.5;
    float _1143 = _1127 + 0.5;
    float _1145 = fma(_1129, _1047, _1033);
    float _1147 = fma(_1137, _1137, _1115);
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1151 = _1133 + 0.5;
    float _1153 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1017);
    float _1155 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1019);
    float _1157 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1021);
    float _1159 = _1147 + _1117;
    float _1161 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1163 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1165 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1167 = -_809;
    float _1169 = _1167 + 0.5;
    float _1171 = _1161 * _1025;
    float _1173 = _1163 * _1041;
    float _1175 = _1165 * _1123;
    float _1177 = sqrt(_1159);
    float _1179 = fma(_1129, _1039, _1029);
    float _1181 = fma(_1129, _1043, _1031);
    float _1183 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1187 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1189 = _911 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _1185 * _1149;
    float _1195 = _1153 + _1179;
    float _1197 = _1155 + _1181;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1157 + _1145;
    out.m_68.x = _1171;
    out.m_68.y = _1173;
    out.m_68.z = _1175;
    out.m_68.w = _1193;
    bool _1207 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1209 = isnan(_1177);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1215 = _1211 || _1213;
    out.m_70.x = _1201;
    out.m_70.y = _1191;
    out.m_70.z = _1203;
    out.m_70.w = _1199;
    out.m_72.x = _1195;
    out.m_72.y = _1197;
    out.m_72.z = _1205;
    float _1217 = _1187;
    float _1219 = _1175;
    if (!_1215)
    {
        _1217 = 1.0;
    }
    float _1221 = _1217;
    bool _1223 = !_1215;
    float _1225 = _1221;
    if (!_1223)
    {
        bool _1227 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1229 = isnan(_1177);
        bool _1231 = _1227 || _1229;
        bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1235 = _1231 || _1233;
        if (!_1235)
        {
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = _1177 + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1243 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1241;
            float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1249 = 1.0 / _1243;
            float _1251 = _1239 * _1249;
            float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1225 = _1253;
            _1255 = true;
        }
        else
        {
            bool _1257 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1259 = isnan(_1177);
            bool _1261 = _1257 || _1259;
            bool _1263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1265 = _1261 || _1263;
            if (!_1265)
            {
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1177 + _1267;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1277 = _1275 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1279 = 1.0 / _1273;
                float _1281 = _1269 * _1279;
                float _1283 = fma(_1281, _1277, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1225 = _1283;
                _1255 = true;
            }
            else
            {
                _1225 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1255 = false;
    float _1285 = _1225;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1289 = _1113 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1293 = _1119 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1297 = _1121 + _1295;
    float _1299 = fma(_1289, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1301 = fma(_1293, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1303 = fma(_1297, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1305 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1307 = -_1035;
    float _1309 = _1307 + _1299;
    float _1311 = -_797;
    float _1313 = _1311 + _1301;
    float _1315 = -_803;
    float _1317 = _1315 + _1303;
    float _1319 = _1309 * _1309;
    bool _1321 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.5);
    bool _1329 = _1325 || _1327;
    float _1331 = fma(_1313, _1313, _1319);
    float _1333 = fma(_1317, _1317, _1331);
    float _1335 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1305);
    float _1337 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1339 = sqrt(_1333);
    float _1341 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1335);
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1337);
    float _1347 = 1.0 / _1343;
    float _1349 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1345);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1353 = _1339 > 0.0;
    float _1355 = _1351 + _1343;
    bool _1357 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1359 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    float _1367 = _1355 * _1347;
    float _1369 = _1367 * 0.5;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1373 = _1355;
    float _1375 = _1347;
    float _1377 = _1343;
    if (!_1353)
    {
        _1371 = _1301;
    }
    float _1379 = _1371;
    float _1381 = _1379;
    float _1383 = _1379;
    if (!_1353)
    {
        _1373 = _1299;
    }
    float _1385 = _1373;
    float _1387 = _1385;
    if (!_1353)
    {
        _1375 = _1303;
    }
    float _1389 = _1375;
    bool _1391 = !_1353;
    float _1393 = _1389;
    if (!_1391)
    {
        float _1395 = _179 * _179;
        float _1397 = fma(_177, _177, _1395);
        float _1399 = fma(_181, _181, _1397);
        float _1401 = rsqrt(_1333);
        float _1403 = sqrt(_1399);
        float _1405 = _1313 * _1401;
        float _1407 = _1309 * _1401;
        float _1409 = _1317 * _1401;
        bool _1411 = _1403 > 0.0;
        float _1413 = _1401;
        float _1415 = _1403;
        _1219 = _1399;
        if (!_1411)
        {
            _1381 = _1301;
        }
        float _1417 = _1381;
        _1383 = _1417;
        if (!_1411)
        {
            _1413 = _1299;
        }
        float _1419 = _1413;
        _1387 = _1419;
        if (!_1411)
        {
            _1415 = _1303;
        }
        float _1421 = _1415;
        bool _1423 = !_1411;
        _1393 = _1421;
        if (!_1423)
        {
            float _1425 = rsqrt(_1399);
            float _1427 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1429 = _179 * _1425;
            float _1431 = _177 * _1425;
            float _1433 = _1407 * _1429;
            float _1435 = _181 * _1425;
            float _1437 = fma(_1405, _1431, _1433);
            float _1439 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1441 = fma(_1409, _1435, _1437);
            float _1443 = _1441 * _1439;
            float _1445 = fma(_177, _1443, _1301);
            float _1447 = fma(_179, _1443, _1299);
            float _1449 = fma(_181, _1443, _1303);
            _1383 = _1445;
            _1377 = _1443;
            _1387 = _1447;
            _1393 = _1449;
            _1219 = _1425;
        }
    }
    float _1451 = _1383;
    float _1453 = _1377;
    float _1455 = _1387;
    float _1457 = _1393;
    float _1459 = _1219;
    float _1461 = _1459;
    float _1463 = _1455;
    float _1465 = _1457;
    float _1467 = _1453;
    float _1469 = _1451;
    if (_1329)
    {
        _185 = 1.0;
    }
    float _1471 = _185;
    float _1473 = _1471;
    if (_1365)
    {
        _187 = _1451;
    }
    float _1475 = _187;
    float _1477 = _1475;
    if (!_1365)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1035 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _797 + _1483;
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = _1481 * _1481;
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1493 = _803 + _1491;
        float _1495 = fma(_1485, _1485, _1489);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1499 = fma(_1493, _1493, _1495);
        float _1501 = sqrt(_1499);
        float _1503 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = precise::min(_1501, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1497;
        float _1509 = -_797;
        float _1511 = _1509 + _1451;
        float _1513 = _1503 * _1507;
        float _1515 = -_1035;
        float _1517 = _1515 + _1455;
        float _1519 = -_803;
        float _1521 = _1519 + _1457;
        float _1523 = fma(_1511, _1513, _797);
        float _1525 = fma(_1517, _1513, _1035);
        float _1527 = fma(_1521, _1513, _803);
        _1461 = _1501;
        _1463 = _1525;
        _1477 = _1523;
        _1465 = _1527;
        _1467 = _1487;
        _1469 = _1513;
    }
    float _1529 = _1461;
    float _1531 = _1463;
    float _1533 = _1477;
    float _1535 = _1465;
    float _1537 = _1467;
    float _1539 = _1469;
    float _1541 = _1539;
    float _1543 = _1529;
    float _1545 = _1537;
    if (!_1329)
    {
        float _1547 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1557 = _1555 * 0.15915493667125701904296875;
        float _1559 = _1549 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1565 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
        float _1567 = 1.0 / _1553;
        float _1569 = _1557 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1561 * _1567;
        float _1575 = 1.0 / _1565;
        float _1577 = _1571 * _1573;
        float _1579 = _1557 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1589 = _1575 * _1587;
        float _1591 = 1.0 / _1577;
        float _1593 = 1.0 / _1585;
        float _1595 = _1581 * _1591;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = fma(_1595, _1589, _1597);
        float _1601 = _1599 * _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1541 = _1549;
        _1543 = _1593;
        _1473 = _1603;
    }
    float _1605 = _1541;
    float _1607 = _1543;
    float _1609 = _1473;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1531 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1533 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1535 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1629 = fma(_1621, _1621, _1625);
    float _1631 = rsqrt(_1629);
    float _1633 = sqrt(_1629);
    float _1635 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1637 = _1617 * _1635;
    float _1639 = _1621 * _1635;
    float _1641 = _1637 * _1637;
    float _1643 = _1639 * _1639;
    float _1645 = _1641 + _1643;
    float _1647 = sqrt(_1645);
    bool _1649 = _1647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1651 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = _1647 + _1651;
    float _1655 = _1631;
    float _1657 = _1605;
    float _1659 = _1653;
    float _1661 = _1613;
    float _1663 = _1607;
    float _1665 = _1637;
    if (_1649)
    {
        float _1667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1655 = _1667;
    }
    float _1669 = _1655;
    if (_1649)
    {
        float _1671 = rsqrt(_1645);
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = _1673;
    if (_1649)
    {
        float _1677 = _1653 * _1669;
        _1659 = _1677;
    }
    float _1679 = _1659;
    if (_1649)
    {
        float _1681 = _1679 * 0.15915493667125701904296875;
        _1545 = _1681;
    }
    float _1683 = _1545;
    float _1685 = _1669;
    if (_1649)
    {
        float _1687 = _1683 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        _1685 = _1689;
    }
    float _1691 = _1685;
    float _1693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1695 = precise::max(0.0, _1693);
    float _1697 = _1621;
    float _1699 = _1695;
    if (_1649)
    {
        float _1701 = _1683 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        _1697 = _1703;
    }
    float _1705 = _1697;
    float _1707 = -_1635;
    float _1709 = -_1695;
    float _1711 = fma(_1613, _1707, _1709);
    if (!_1649)
    {
        _1661 = _1639;
    }
    float _1713 = _1661;
    float _1715 = _1713;
    if (_1649)
    {
        float _1717 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1699 = _1717;
    }
    float _1719 = _1699;
    float _1721 = _1691;
    float _1723 = _1719;
    if (_1649)
    {
        float _1725 = fma(_1691, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1663 = _1725;
    }
    float _1727 = _1663;
    float _1729 = _1727;
    if (!_1649)
    {
        _1721 = _1711;
    }
    float _1731 = _1721;
    float _1733 = _1731;
    float _1735 = _1705;
    if (_1649)
    {
        float _1737 = _1705 + (-1.0);
        _1723 = _1737;
    }
    float _1739 = _1723;
    float _1741 = _1739;
    if (_1649)
    {
        float _1743 = _1673 * _1727;
        _1729 = _1743;
    }
    float _1745 = _1729;
    if (_1649)
    {
        float _1747 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1747;
    }
    float _1749 = _1675;
    if (_1649)
    {
        float _1751 = _1637 * _1745;
        _1665 = _1751;
    }
    float _1753 = _1665;
    if (!_1649)
    {
        _1741 = _1641;
    }
    float _1755 = _1741;
    float _1757 = _1755;
    if (_1649)
    {
        float _1759 = _1639 * _1745;
        _1715 = _1759;
    }
    float _1761 = _1715;
    if (_1649)
    {
        float _1763 = fma(_1711, _1705, _1749);
        _1733 = _1763;
    }
    float _1765 = _1733;
    if (_1649)
    {
        float _1767 = _1753 * _1753;
        _1757 = _1767;
    }
    float _1769 = _1757;
    if (!_1649)
    {
        _1735 = _1643;
    }
    float _1771 = _1735;
    float _1773 = _1771;
    if (_1649)
    {
        float _1775 = _1761 * _1761;
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1781 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1779);
    float _1783 = precise::clamp(_1781, 0.0, 1.0);
    float _1785 = fma(_1765, _1765, _1769);
    float _1787 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1789 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1791 = -_1783;
    float _1793 = _1791 + 1.0;
    float _1795 = _1785 + _1777;
    float _1797 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1799 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1801 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1803 = rsqrt(_1795);
    float _1805 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1797);
    float _1807 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1809 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1801);
    float _1811 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1789);
    float _1813 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1815 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1809);
    float _1817 = abs(_1793);
    float _1819 = log2(_1817);
    float _1821 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1807);
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1825 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1811);
    float _1827 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1823;
    float _1831 = fma(_1829, _1627, 1.0);
    float _1833 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1835 = _1803 * _1753;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1839 = _1803 * _1765;
    float _1841 = _1803 * _1761;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1837);
    float _1847 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1849 = log2(_1831);
    float _1851 = -_1843;
    float _1853 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1845);
    float _1857 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1861 = -_1841;
    float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1865 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1855);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1869 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1859);
    float _1871 = fma(_1863, -0.5, 0.5);
    float _1873 = exp2(_1857);
    float _1875 = fma(_1863, 0.5, 0.5);
    float _1877 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1867);
    float _1879 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1869);
    float _1881 = _1839 + 1.0;
    float _1883 = fma(_1875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1885 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1877);
    float _1887 = _1849 * 0.693147182464599609375;
    float _1889 = 1.0 / _1865;
    float _1891 = fma(_1875, _1883, -0.212114393711090087890625);
    float _1893 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1885);
    float _1895 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1897 = fma(_1875, _1891, 1.570728778839111328125);
    float _1899 = sqrt(_1871);
    float _1901 = -_1839;
    float _1903 = fma(_1873, _1881, _1901);
    float _1905 = fma(_1903, 0.5, 0.5);
    float _1907 = _1893 * _1889;
    float _1909 = _1895 * _1889;
    float _1911 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1913 = fma(_1907, 0.5, 0.5);
    float _1915 = fma(_1909, -0.5, 0.5);
    float _1917 = _1899 * 0.636619746685028076171875;
    float3 _5322 = float3(_1913, _1915, _1911);
    float _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5322, float3(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5322, float3(0.0), isnan(_5322)), level(0.0)).x;
    float3 _5333 = float3(_1913, _1915, _1911);
    float4 _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5333, float3(0.0), isnan(_5333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5333, float3(0.0), isnan(_5333)), level(0.0)).xyzw;
    float _1924 = _1922.x;
    float _1926 = _1922.y;
    float _1928 = _1922.z;
    float _1930 = _1922.w;
    float _1932 = -_1897;
    float _1934 = fma(_1917, _1932, 1.0);
    float2 _5355 = float2(_1934, _1905);
    float3 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5355, float2(0.0), isnan(_5355)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5355, float2(0.0), isnan(_5355)), level(0.0)).xyz;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1948 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1950 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1952 = isnan(_1633);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1958 = _1954 || _1956;
    float _1960 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1948);
    float _1962 = exp2(_1946);
    float _1964 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1960);
    float _1966 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1964);
    float _1968 = _1966 + _1865;
    out.gl_Position.x = _1893;
    out.gl_Position.y = _1895;
    out.gl_Position.z = _1966;
    out.gl_Position.w = _1865;
    float _1970 = _1968 * 0.5;
    float _1972 = -_1962;
    float _1974 = _1972 + 1.0;
    float _1976 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.z = _1970;
    out.m_74.w = _1865;
    float _1978 = _1865;
    float _1980 = _1966;
    float _1982 = _1895;
    float _1984 = _1970;
    float _1986 = _1893;
    if (!_1958)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1988 = _1978;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1958)
    {
        _1980 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1994 = _1980;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1958)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2000 = _1982;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1958)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2006 = _1984;
    float _2008 = _2006;
    float _2010 = _2006;
    if (!_1958)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2012 = _1986;
    float _2014 = _1976 * _1919;
    float _2016 = -_1976;
    float _2018 = _2016 + 1.0;
    float _2020 = _1930 * _2014;
    float _2022 = _1930 * _2018;
    float _2024 = _1944 * _2014;
    float _2026 = fma(_1940, _2020, _1924);
    float _2028 = fma(_1942, _2020, _1926);
    float _2030 = _2020;
    float _2032 = _2012;
    float _2034 = _2012;
    if (!_1958)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2030;
    float _2038 = fma(_1930, _2024, _1928);
    float _2040 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_76.x = _2026;
    out.m_76.y = _2028;
    out.m_76.z = _2038;
    out.m_76.w = _2022;
    bool _2042 = !_1958;
    float _2044 = _2036;
    float _2046 = _2036;
    if (!_2042)
    {
        bool _2048 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2050 = isnan(_1633);
        bool _2052 = _2048 || _2050;
        bool _2054 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2056 = _2052 || _2054;
        if (!_2056)
        {
            float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2060 = _1633 + _2058;
            float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2064 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2062;
            float _2066 = 1.0 / _2064;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2088 = _2060 * _2066;
            float _2090 = precise::clamp(_2088, 0.0, 1.0);
            float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2096 = fma(_2090, _2070, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2098 = fma(_2090, _2094, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2100 = fma(_2090, _2074, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2102 = fma(_2090, _2078, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2104 = fma(_2090, _2082, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2106 = fma(_2090, _2086, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2010 = _2098;
            _2004 = _2104;
            _2046 = _2096;
            _1998 = _2102;
            _1992 = _2100;
            _2034 = _2106;
            _2108 = true;
        }
        else
        {
            bool _2110 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2112 = isnan(_1633);
            bool _2114 = _2110 || _2112;
            bool _2116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2118 = _2114 || _2116;
            if (!_2118)
            {
                _2044 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2120 = _2044;
            _2046 = _2120;
            if (!_2118)
            {
                _2008 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2122 = _2008;
            _2010 = _2122;
            if (!_2118)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2124 = _1990;
            _1992 = _2124;
            if (!_2118)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2126 = _1996;
            _1998 = _2126;
            if (!_2118)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2128 = _2002;
            _2004 = _2128;
            if (!_2118)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2130 = _2032;
            bool _2132 = !_2118;
            _2034 = _2130;
            if (!_2132)
            {
                bool _2134 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2136 = isnan(_1633);
                bool _2138 = _2134 || _2136;
                bool _2140 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2142 = _2138 || _2140;
                if (!_2142)
                {
                    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2146 = _1633 + _2144;
                    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2150 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2148;
                    float _2152 = 1.0 / _2150;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2174 = _2146 * _2152;
                    float _2176 = precise::clamp(_2174, 0.0, 1.0);
                    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2182 = fma(_2176, _2156, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2184 = fma(_2176, _2180, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2186 = fma(_2176, _2160, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2188 = fma(_2176, _2164, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2190 = fma(_2176, _2168, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2192 = fma(_2176, _2172, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2010 = _2184;
                    _2004 = _2190;
                    _2046 = _2182;
                    _1998 = _2188;
                    _1992 = _2186;
                    _2034 = _2192;
                    _2108 = true;
                }
                else
                {
                    _2010 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2046 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2108 = false;
    float _2194 = _2010;
    float _2196 = _2004;
    float _2198 = _2046;
    float _2200 = _1998;
    float _2202 = _1992;
    float _2204 = _2034;
    float _2206 = fma(_1197, -0.5, 0.5);
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = -_2194;
    float _2212 = _2210 + _2196;
    float _2214 = -_2198;
    float _2216 = _2214 + _2200;
    out.m_78.x = 0.0;
    float _2218 = -_2202;
    float _2220 = _2218 + _2204;
    float _2222 = fma(_2208, _2212, _2194);
    float _2224 = fma(_2208, _2216, _2198);
    bool _2226 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2228 = _2222 * 0.586610972881317138671875;
    float _2230 = fma(_2208, _2220, _2202);
    float _2232 = _2040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = fma(_2224, 0.298911988735198974609375, _2228);
    bool _2236 = _1609 > 0.0;
    bool _2238 = isnan(_1609);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan(0.0);
    bool _2244 = _2240 || _2242;
    float _2246 = fma(_2230, 0.114477999508380889892578125, _2234);
    out.m_49.x = _2232;
    float _2248 = -_2246;
    float _2250 = _2224 + _2248;
    float _2252 = -_2246;
    float _2254 = _2222 + _2252;
    float _2256 = -_2246;
    float _2258 = _2230 + _2256;
    float _2260 = fma(_2250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    float _2262 = fma(_2254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    float _2264 = fma(_2258, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    bool _2266 = !_2226;
    if (!_2266)
    {
        float _2268 = -_1531;
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2272 = -_1533;
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2276 = -_1535;
        float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2280 = _2270 * _2270;
        float _2282 = fma(_2274, _2274, _2280);
        float _2284 = fma(_2278, _2278, _2282);
        float _2286 = sqrt(_2284);
        float _2288 = rsqrt(_2284);
        float _2290 = -_2286;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2294 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        float _2298 = _2274 * _2288;
        float _2300 = _2270 * _2288;
        float _2302 = abs(_2296);
        float _2304 = log2(_2302);
        float _2306 = _2278 * _2288;
        float _2308 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2310 = _1197 * _2300;
        float _2312 = -_2300;
        float _2314 = -_2308;
        float _2316 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2314);
        float _2318 = fma(_1195, _2298, _2310);
        float _2320 = -_2306;
        float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2316);
        float _2324 = fma(_1205, _2306, _2318);
        float _2326 = precise::clamp(_2324, 0.0, 1.0);
        float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2330 = _2322 + _2328;
        float _2332 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2334 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2336 = precise::clamp(_2334, 0.0, 1.0);
        float _2338 = exp2(_2332);
        float _2340 = _2338 * _2336;
        float _2342 = _2326 * _2340;
        float _2344 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2344;
        out.m_78.y = _2346;
        out.m_78.z = _2348;
    }
    out.m_80.x = _2260;
    out.m_80.y = _2262;
    out.m_80.z = _2264;
    if (_2244)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2350 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2350;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2108 = false;
    bool _1255 = false;
    bool _303 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_99);
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2408 = as_type<float>(_115);
        out.gl_Position.z = _2408;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_51.w;
    float _121 = float(_99);
    float _123 = 1.0 / _121;
    float _125 = -_119;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_119);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = _127 * _123;
    bool _141 = _127 >= _121;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    out.m_53.x = _139;
    float _147 = _139;
    float _149 = _127;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _107;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2480 = as_type<float>(_155);
        out.gl_Position.z = _2480;
    }
    if (_145)
    {
        return out;
    }
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _171 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    bool _183 = !_163;
    float _185 = _177;
    float _187 = _181;
    float _205;
    if (!_183)
    {
        float _189 = in.m_57.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _139;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _247;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _229;
    float _255 = _245 * _233;
    float _257 = -_245;
    float _259 = _257 + 1.0;
    float _261 = _213 * _253;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = fma(_249, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = fma(_265, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = _267 * _255;
    float _273 = _269 * _255;
    float _275 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_251;
    float _301;
    if (!_283)
    {
        float _285 = in.m_57.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _139;
    }
    _303 = false;
    float _305 = _301;
    float _307 = in.m_59.x;
    float _309 = in.m_59.y;
    bool _311 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _313 = isnan(_305);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _329 = isnan(_305);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _305 + _343;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _353 = 1.0 / _325;
    float _355 = _337 * _349;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = _281 * _309;
    float _363 = _279 * _307;
    float _365 = _341 * _353;
    float _367 = fma(_365, _345, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _371 = _367 * _355;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _375 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _371);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[116].x, _377);
    float _385 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _385;
    out.m_61.y = _381;
    out.m_61.z = _375;
    out.m_61.w = _387;
    bool _389 = !_351;
    if (!_389)
    {
        float _391 = in.m_57.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _147 = _405;
    }
    float _407 = _147;
    float _409 = in.m_57.x;
    float _411 = in.m_57.y;
    float _413 = in.m_57.z;
    float _415 = in.m_57.w;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    float _421 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _423 = as_type<float>(int(gl_VertexIndex));
    bool _425 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _437 = 1.0 + _435;
    bool _439 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(1.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = 1.0 / _437;
    float _451 = _419 * _127;
    float _453 = exp2(_451);
    float _455 = _413 * 2.0;
    float _457 = _409 * 2.0;
    float _459 = _411 * 2.0;
    float _461 = _411 + _409;
    float _463 = _411 + _413;
    float _465 = _413 + _409;
    float _467 = floor(_455);
    float _469 = _461 + (-1.0);
    float _471 = _463 + (-1.0);
    float _473 = _465 + (-1.0);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _477 = floor(_457);
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = _433 ? _481 : 0.0;
    float _485 = floor(_459);
    bool _487 = _467 > 0.0;
    bool _489 = _467 >= 0.0;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    if (_447)
    {
        float _499 = _483 * _449;
        _149 = _499;
    }
    float _501 = _149;
    int _503 = _497 ? 0 : 1;
    bool _505 = _477 > 0.0;
    bool _507 = _477 >= 0.0;
    bool _509 = isnan(_477);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    int _517 = as_type<int>(_423) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_423) & 2;
    bool _523 = _521 != 0;
    bool _525 = _485 > 0.0;
    int _527 = _515 ? 0 : 1;
    bool _529 = _485 >= 0.0;
    bool _531 = isnan(_485);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    int _539 = ~_503;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = ~_527;
    int _547 = _545 + 1;
    int _549 = _547 + 1;
    bool _551 = _415 > 0.5;
    int _553 = _537 ? 0 : 1;
    int _555 = _543;
    int _557 = _549;
    if (!_487)
    {
        int _559 = ~_503;
        int _561 = _559 + 1;
        _555 = _561;
    }
    int _563 = _555;
    if (!_505)
    {
        int _565 = ~_527;
        int _567 = _565 + 1;
        _557 = _567;
    }
    int _569 = _557;
    bool _571 = !_523;
    float _573 = _571 ? (-0.5) : 0.5;
    int _575 = ~_553;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _591 = _589 != 0;
    int _593 = _579;
    if (!_525)
    {
        int _595 = ~_553;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    bool _601 = !_519;
    float _603 = _601 ? (-0.5) : 0.5;
    float _605 = -_573;
    int _607 = _551 ? as_type<int>(_605) : as_type<int>(_573);
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _623 = _621 != 0;
    float _625 = in.m_66.x;
    float _627 = in.m_66.y;
    float _629 = in.m_66.z;
    bool _631 = !_583;
    int _633 = _631 ? 0 : 1;
    float _635 = float(_563);
    int _637 = abs(_633);
    bool _639 = !_587;
    int _641 = _639 ? 0 : 1;
    float _643 = float(_637);
    int _645 = abs(_641);
    float _647 = float(_569);
    float _649 = _643 * _635;
    float _651 = float(_645);
    float _653 = in.m_46.x;
    float _655 = in.m_46.y;
    float _657 = in.m_46.z;
    bool _659 = _409 > 0.5;
    float _661 = _649 * (-2.0);
    float _663 = _409 + (-0.5);
    float _665 = _651 * _647;
    bool _667 = !_591;
    int _669 = _667 ? 0 : 1;
    float _671 = fma(_661, _625, _625);
    float _673 = _665 * (-2.0);
    float _675 = fma(_475, _661, _475);
    float _677 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].x, _671);
    float _681 = fma(_673, _627, _627);
    int _683 = abs(_669);
    float _685 = fma(_675, _501, _679);
    float _687 = float(_599);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _689;
    float _693 = _685 * 0.15915493667125701904296875;
    float _695 = float(_683);
    float _697 = 1.0 / _691;
    bool _699 = _411 > 0.5;
    float _701 = _411 + (-0.5);
    bool _703 = _413 > 0.5;
    float _705 = _695 * _687;
    float _707 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = _413 + (-0.5);
    float _711 = fma(_677, _673, _677);
    float _713 = _705 * (-2.0);
    float _715 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].y, _681);
    float _717 = _655 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _655 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = fma(_713, _629, _629);
    float _723 = _655 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = fma(_707, _713, _707);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _729 = _407 + _727;
    float _731 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[196].z, _721);
    float _733 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _735 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _737 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _739 = fma(_711, _501, _715);
    float _741 = fma(_725, _501, _731);
    float _743 = _729 * _697;
    float _745 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[4].z, _733);
    float _747 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[5].z, _735);
    float _749 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[6].z, _737);
    bool _751 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _753 = isnan(_407);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _693 * 6.283185482025146484375;
    float _765 = sin(_763);
    bool _767 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _769 = isnan(_407);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = _739 * 0.15915493667125701904296875;
    float _781 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = -_777;
    float _785 = _783 + 1.0;
    float _787 = _693 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _791;
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _573);
    float _797 = _745 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _799;
    float _803 = _749 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = _781 * _795;
    bool _807 = !_623;
    float _809 = _807 ? _573 : as_type<float>(_607);
    float _811 = _779 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _741 * 0.15915493667125701904296875;
    float _817 = fma(_801, _743, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _821 = -_603;
    int _823 = _659 ? as_type<int>(_821) : as_type<int>(_603);
    float _825 = -_603;
    int _827 = _703 ? as_type<int>(_825) : as_type<int>(_603);
    float _829 = _421 * _819;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _815 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _839;
    float _843 = _761 * _785;
    float _845 = fma(_793, _743, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _847 = _765 * _813;
    float _849 = fma(_841, _743, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _851 = _817 * _843;
    float _853 = _845 * _843;
    float _855 = _815 * 6.283185482025146484375;
    float _857 = sin(_855);
    float _859 = _765 * _833;
    float _861 = _789 * _833;
    float _863 = _849 * _843;
    float _865 = -_761;
    float _867 = _865 + 1.0;
    float _869 = _765 * _837;
    float _871 = _789 * _813;
    float _873 = _789 * _837;
    float _875 = _833 * _837;
    float _877 = _813 * _837;
    float _879 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _881 = _873 * _805;
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _863);
    float _885 = fma(_857, _861, _847);
    float _887 = -_871;
    float _889 = fma(_857, _859, _887);
    float _891 = -_859;
    float _893 = fma(_857, _871, _891);
    float _895 = -_805;
    float _897 = _857 * _895;
    float _899 = fma(_885, _829, _881);
    float _901 = _869 * _805;
    float _903 = fma(_857, _847, _861);
    float _905 = fma(_875, _829, _897);
    float _907 = fma(_893, _879, _899);
    float _909 = fma(_889, _829, _901);
    float _911 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].z, _883);
    float _913 = fma(_877, _879, _905);
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = fma(_903, _879, _909);
    float _921 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _853);
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _927 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _851);
    float _929 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].x, _921);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].y, _927);
    float _937 = _873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = _873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _945 = _873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = _797 + _939;
    float _949 = _803 + _941;
    float _951 = -_857;
    float _953 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].x, _943);
    float _955 = -_857;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _937);
    float _959 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _961 = _947 + _959;
    float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _965 = _949 + _963;
    float _967 = -_857;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _971 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _953);
    float _973 = _961 * _961;
    float _975 = _965 * _965;
    float _977 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    float _979 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    float _981 = _885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _983 = _973 + _975;
    float _985 = _885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _987 = _885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _989 = -_573;
    int _991 = _699 ? as_type<int>(_989) : as_type<int>(_573);
    float _993 = sqrt(_983);
    float _995 = _907 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _981);
    bool _999 = !_615;
    float _1001 = _999 ? _573 : as_type<float>(_991);
    float _1003 = _573 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1005 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1007 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1011 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    float _1013 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _985);
    float _1015 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _987);
    float _1017 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    float _1019 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1021 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1009);
    float _1023 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1011);
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1027 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1003 * _971;
    float _1031 = _1003 * _977;
    float _1033 = _1003 * _979;
    float _1035 = _747 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1037 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1039 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1043 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1013);
    float _1045 = _1035 + _1037;
    float _1047 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1015);
    float _1049 = _919;
    float _1051 = _973;
    float _1053 = _975;
    float _1055 = _947;
    float _1057 = _949;
    if (!_1027)
    {
        _1049 = _1045;
    }
    float _1059 = _1049;
    bool _1061 = !_1027;
    float _1063 = _1059;
    if (!_1061)
    {
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1069 = _993 + _1067;
        float _1071 = rsqrt(_983);
        float _1073 = _1069 * _1065;
        float _1075 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = _1073 * 0.15915493667125701904296875;
        float _1079 = _1077 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = fma(_1081, _1075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1089 = _1071 * _1087;
        float _1091 = _1085 + (-1.0);
        float _1093 = fma(_961, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1095 = fma(_965, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1097 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1093 + _1099;
        float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1105 = _1095 + _1103;
        float _1107 = fma(_1045, _1085, _1097);
        float _1109 = _1101 * _1101;
        float _1111 = _1105 * _1105;
        _1063 = _1107;
        _1051 = _1109;
        _1053 = _1111;
        _1055 = _1093;
        _1057 = _1095;
    }
    float _1113 = _1063;
    float _1115 = _1051;
    float _1117 = _1053;
    float _1119 = _1055;
    float _1121 = _1057;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_611;
    float _1127 = _1125 ? _603 : as_type<float>(_823);
    float _1129 = _603 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1131 = !_619;
    float _1133 = _1131 ? _603 : as_type<float>(_827);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1137 = _1113 + _1135;
    float _1139 = -_1001;
    float _1141 = _1139 + 0.5;
    float _1143 = _1127 + 0.5;
    float _1145 = fma(_1129, _1047, _1033);
    float _1147 = fma(_1137, _1137, _1115);
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1151 = _1133 + 0.5;
    float _1153 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1017);
    float _1155 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1019);
    float _1157 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1021);
    float _1159 = _1147 + _1117;
    float _1161 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1163 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1165 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1167 = -_809;
    float _1169 = _1167 + 0.5;
    float _1171 = _1161 * _1025;
    float _1173 = _1163 * _1041;
    float _1175 = _1165 * _1123;
    float _1177 = sqrt(_1159);
    float _1179 = fma(_1129, _1039, _1029);
    float _1181 = fma(_1129, _1043, _1031);
    float _1183 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1187 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1189 = _911 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _1185 * _1149;
    float _1195 = _1153 + _1179;
    float _1197 = _1155 + _1181;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1157 + _1145;
    out.m_68.x = _1171;
    out.m_68.y = _1173;
    out.m_68.z = _1175;
    out.m_68.w = _1193;
    bool _1207 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1209 = isnan(_1177);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1215 = _1211 || _1213;
    out.m_70.x = _1201;
    out.m_70.y = _1191;
    out.m_70.z = _1203;
    out.m_70.w = _1199;
    out.m_72.x = _1195;
    out.m_72.y = _1197;
    out.m_72.z = _1205;
    float _1217 = _1187;
    float _1219 = _1175;
    if (!_1215)
    {
        _1217 = 1.0;
    }
    float _1221 = _1217;
    bool _1223 = !_1215;
    float _1225 = _1221;
    if (!_1223)
    {
        bool _1227 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1229 = isnan(_1177);
        bool _1231 = _1227 || _1229;
        bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1235 = _1231 || _1233;
        if (!_1235)
        {
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = _1177 + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1243 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1241;
            float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1249 = 1.0 / _1243;
            float _1251 = _1239 * _1249;
            float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1225 = _1253;
            _1255 = true;
        }
        else
        {
            bool _1257 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1259 = isnan(_1177);
            bool _1261 = _1257 || _1259;
            bool _1263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1265 = _1261 || _1263;
            if (!_1265)
            {
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1177 + _1267;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1277 = _1275 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1279 = 1.0 / _1273;
                float _1281 = _1269 * _1279;
                float _1283 = fma(_1281, _1277, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1225 = _1283;
                _1255 = true;
            }
            else
            {
                _1225 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1255 = false;
    float _1285 = _1225;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1289 = _1113 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1293 = _1119 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1297 = _1121 + _1295;
    float _1299 = fma(_1289, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1301 = fma(_1293, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1303 = fma(_1297, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1305 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1307 = -_1035;
    float _1309 = _1307 + _1299;
    float _1311 = -_797;
    float _1313 = _1311 + _1301;
    float _1315 = -_803;
    float _1317 = _1315 + _1303;
    float _1319 = _1309 * _1309;
    bool _1321 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.5);
    bool _1329 = _1325 || _1327;
    float _1331 = fma(_1313, _1313, _1319);
    float _1333 = fma(_1317, _1317, _1331);
    float _1335 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1305);
    float _1337 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1339 = sqrt(_1333);
    float _1341 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1335);
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1337);
    float _1347 = 1.0 / _1343;
    float _1349 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1345);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1353 = _1339 > 0.0;
    float _1355 = _1351 + _1343;
    bool _1357 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1359 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    float _1367 = _1355 * _1347;
    float _1369 = _1367 * 0.5;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1373 = _1355;
    float _1375 = _1347;
    float _1377 = _1343;
    if (!_1353)
    {
        _1371 = _1301;
    }
    float _1379 = _1371;
    float _1381 = _1379;
    float _1383 = _1379;
    if (!_1353)
    {
        _1373 = _1299;
    }
    float _1385 = _1373;
    float _1387 = _1385;
    if (!_1353)
    {
        _1375 = _1303;
    }
    float _1389 = _1375;
    bool _1391 = !_1353;
    float _1393 = _1389;
    if (!_1391)
    {
        float _1395 = _179 * _179;
        float _1397 = fma(_177, _177, _1395);
        float _1399 = fma(_181, _181, _1397);
        float _1401 = rsqrt(_1333);
        float _1403 = sqrt(_1399);
        float _1405 = _1313 * _1401;
        float _1407 = _1309 * _1401;
        float _1409 = _1317 * _1401;
        bool _1411 = _1403 > 0.0;
        float _1413 = _1401;
        float _1415 = _1403;
        _1219 = _1399;
        if (!_1411)
        {
            _1381 = _1301;
        }
        float _1417 = _1381;
        _1383 = _1417;
        if (!_1411)
        {
            _1413 = _1299;
        }
        float _1419 = _1413;
        _1387 = _1419;
        if (!_1411)
        {
            _1415 = _1303;
        }
        float _1421 = _1415;
        bool _1423 = !_1411;
        _1393 = _1421;
        if (!_1423)
        {
            float _1425 = rsqrt(_1399);
            float _1427 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1429 = _179 * _1425;
            float _1431 = _177 * _1425;
            float _1433 = _1407 * _1429;
            float _1435 = _181 * _1425;
            float _1437 = fma(_1405, _1431, _1433);
            float _1439 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1441 = fma(_1409, _1435, _1437);
            float _1443 = _1441 * _1439;
            float _1445 = fma(_177, _1443, _1301);
            float _1447 = fma(_179, _1443, _1299);
            float _1449 = fma(_181, _1443, _1303);
            _1383 = _1445;
            _1377 = _1443;
            _1387 = _1447;
            _1393 = _1449;
            _1219 = _1425;
        }
    }
    float _1451 = _1383;
    float _1453 = _1377;
    float _1455 = _1387;
    float _1457 = _1393;
    float _1459 = _1219;
    float _1461 = _1459;
    float _1463 = _1455;
    float _1465 = _1457;
    float _1467 = _1453;
    float _1469 = _1451;
    if (_1329)
    {
        _185 = 1.0;
    }
    float _1471 = _185;
    float _1473 = _1471;
    if (_1365)
    {
        _187 = _1451;
    }
    float _1475 = _187;
    float _1477 = _1475;
    if (!_1365)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1035 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _797 + _1483;
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = _1481 * _1481;
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1493 = _803 + _1491;
        float _1495 = fma(_1485, _1485, _1489);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1499 = fma(_1493, _1493, _1495);
        float _1501 = sqrt(_1499);
        float _1503 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = precise::min(_1501, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1497;
        float _1509 = -_797;
        float _1511 = _1509 + _1451;
        float _1513 = _1503 * _1507;
        float _1515 = -_1035;
        float _1517 = _1515 + _1455;
        float _1519 = -_803;
        float _1521 = _1519 + _1457;
        float _1523 = fma(_1511, _1513, _797);
        float _1525 = fma(_1517, _1513, _1035);
        float _1527 = fma(_1521, _1513, _803);
        _1461 = _1501;
        _1463 = _1525;
        _1477 = _1523;
        _1465 = _1527;
        _1467 = _1487;
        _1469 = _1513;
    }
    float _1529 = _1461;
    float _1531 = _1463;
    float _1533 = _1477;
    float _1535 = _1465;
    float _1537 = _1467;
    float _1539 = _1469;
    float _1541 = _1539;
    float _1543 = _1529;
    float _1545 = _1537;
    if (!_1329)
    {
        float _1547 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1557 = _1555 * 0.15915493667125701904296875;
        float _1559 = _1549 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1565 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
        float _1567 = 1.0 / _1553;
        float _1569 = _1557 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1561 * _1567;
        float _1575 = 1.0 / _1565;
        float _1577 = _1571 * _1573;
        float _1579 = _1557 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1589 = _1575 * _1587;
        float _1591 = 1.0 / _1577;
        float _1593 = 1.0 / _1585;
        float _1595 = _1581 * _1591;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = fma(_1595, _1589, _1597);
        float _1601 = _1599 * _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1541 = _1549;
        _1543 = _1593;
        _1473 = _1603;
    }
    float _1605 = _1541;
    float _1607 = _1543;
    float _1609 = _1473;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1531 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1533 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1535 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1629 = fma(_1621, _1621, _1625);
    float _1631 = rsqrt(_1629);
    float _1633 = sqrt(_1629);
    float _1635 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1637 = _1617 * _1635;
    float _1639 = _1621 * _1635;
    float _1641 = _1637 * _1637;
    float _1643 = _1639 * _1639;
    float _1645 = _1641 + _1643;
    float _1647 = sqrt(_1645);
    bool _1649 = _1647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1651 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = _1647 + _1651;
    float _1655 = _1631;
    float _1657 = _1605;
    float _1659 = _1653;
    float _1661 = _1613;
    float _1663 = _1607;
    float _1665 = _1637;
    if (_1649)
    {
        float _1667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1655 = _1667;
    }
    float _1669 = _1655;
    if (_1649)
    {
        float _1671 = rsqrt(_1645);
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = _1673;
    if (_1649)
    {
        float _1677 = _1653 * _1669;
        _1659 = _1677;
    }
    float _1679 = _1659;
    if (_1649)
    {
        float _1681 = _1679 * 0.15915493667125701904296875;
        _1545 = _1681;
    }
    float _1683 = _1545;
    float _1685 = _1669;
    if (_1649)
    {
        float _1687 = _1683 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        _1685 = _1689;
    }
    float _1691 = _1685;
    float _1693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1695 = precise::max(0.0, _1693);
    float _1697 = _1621;
    float _1699 = _1695;
    if (_1649)
    {
        float _1701 = _1683 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        _1697 = _1703;
    }
    float _1705 = _1697;
    float _1707 = -_1635;
    float _1709 = -_1695;
    float _1711 = fma(_1613, _1707, _1709);
    if (!_1649)
    {
        _1661 = _1639;
    }
    float _1713 = _1661;
    float _1715 = _1713;
    if (_1649)
    {
        float _1717 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1699 = _1717;
    }
    float _1719 = _1699;
    float _1721 = _1691;
    float _1723 = _1719;
    if (_1649)
    {
        float _1725 = fma(_1691, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1663 = _1725;
    }
    float _1727 = _1663;
    float _1729 = _1727;
    if (!_1649)
    {
        _1721 = _1711;
    }
    float _1731 = _1721;
    float _1733 = _1731;
    float _1735 = _1705;
    if (_1649)
    {
        float _1737 = _1705 + (-1.0);
        _1723 = _1737;
    }
    float _1739 = _1723;
    float _1741 = _1739;
    if (_1649)
    {
        float _1743 = _1673 * _1727;
        _1729 = _1743;
    }
    float _1745 = _1729;
    if (_1649)
    {
        float _1747 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1747;
    }
    float _1749 = _1675;
    if (_1649)
    {
        float _1751 = _1637 * _1745;
        _1665 = _1751;
    }
    float _1753 = _1665;
    if (!_1649)
    {
        _1741 = _1641;
    }
    float _1755 = _1741;
    float _1757 = _1755;
    if (_1649)
    {
        float _1759 = _1639 * _1745;
        _1715 = _1759;
    }
    float _1761 = _1715;
    if (_1649)
    {
        float _1763 = fma(_1711, _1705, _1749);
        _1733 = _1763;
    }
    float _1765 = _1733;
    if (_1649)
    {
        float _1767 = _1753 * _1753;
        _1757 = _1767;
    }
    float _1769 = _1757;
    if (!_1649)
    {
        _1735 = _1643;
    }
    float _1771 = _1735;
    float _1773 = _1771;
    if (_1649)
    {
        float _1775 = _1761 * _1761;
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1781 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1779);
    float _1783 = precise::clamp(_1781, 0.0, 1.0);
    float _1785 = fma(_1765, _1765, _1769);
    float _1787 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1789 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1791 = -_1783;
    float _1793 = _1791 + 1.0;
    float _1795 = _1785 + _1777;
    float _1797 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1799 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1801 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1803 = rsqrt(_1795);
    float _1805 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1797);
    float _1807 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1809 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1801);
    float _1811 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1789);
    float _1813 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1815 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1809);
    float _1817 = abs(_1793);
    float _1819 = log2(_1817);
    float _1821 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1807);
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1825 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1811);
    float _1827 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1823;
    float _1831 = fma(_1829, _1627, 1.0);
    float _1833 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1835 = _1803 * _1753;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1839 = _1803 * _1765;
    float _1841 = _1803 * _1761;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1837);
    float _1847 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1849 = log2(_1831);
    float _1851 = -_1843;
    float _1853 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1845);
    float _1857 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1861 = -_1841;
    float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1865 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1855);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1869 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1859);
    float _1871 = fma(_1863, -0.5, 0.5);
    float _1873 = exp2(_1857);
    float _1875 = fma(_1863, 0.5, 0.5);
    float _1877 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1867);
    float _1879 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1869);
    float _1881 = _1839 + 1.0;
    float _1883 = fma(_1875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1885 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1877);
    float _1887 = _1849 * 0.693147182464599609375;
    float _1889 = 1.0 / _1865;
    float _1891 = fma(_1875, _1883, -0.212114393711090087890625);
    float _1893 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1885);
    float _1895 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1897 = fma(_1875, _1891, 1.570728778839111328125);
    float _1899 = sqrt(_1871);
    float _1901 = -_1839;
    float _1903 = fma(_1873, _1881, _1901);
    float _1905 = fma(_1903, 0.5, 0.5);
    float _1907 = _1893 * _1889;
    float _1909 = _1895 * _1889;
    float _1911 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1913 = fma(_1907, 0.5, 0.5);
    float _1915 = fma(_1909, -0.5, 0.5);
    float _1917 = _1899 * 0.636619746685028076171875;
    float3 _5322 = float3(_1913, _1915, _1911);
    float _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5322, float3(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5322, float3(0.0), isnan(_5322)), level(0.0)).x;
    float3 _5333 = float3(_1913, _1915, _1911);
    float4 _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5333, float3(0.0), isnan(_5333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5333, float3(0.0), isnan(_5333)), level(0.0)).xyzw;
    float _1924 = _1922.x;
    float _1926 = _1922.y;
    float _1928 = _1922.z;
    float _1930 = _1922.w;
    float _1932 = -_1897;
    float _1934 = fma(_1917, _1932, 1.0);
    float2 _5355 = float2(_1934, _1905);
    float3 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5355, float2(0.0), isnan(_5355)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5355, float2(0.0), isnan(_5355)), level(0.0)).xyz;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1948 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1950 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1952 = isnan(_1633);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1958 = _1954 || _1956;
    float _1960 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1948);
    float _1962 = exp2(_1946);
    float _1964 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1960);
    float _1966 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1964);
    float _1968 = _1966 + _1865;
    out.gl_Position.x = _1893;
    out.gl_Position.y = _1895;
    out.gl_Position.z = _1966;
    out.gl_Position.w = _1865;
    float _1970 = _1968 * 0.5;
    float _1972 = -_1962;
    float _1974 = _1972 + 1.0;
    float _1976 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.z = _1970;
    out.m_74.w = _1865;
    float _1978 = _1865;
    float _1980 = _1966;
    float _1982 = _1895;
    float _1984 = _1970;
    float _1986 = _1893;
    if (!_1958)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1988 = _1978;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1958)
    {
        _1980 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1994 = _1980;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1958)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2000 = _1982;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1958)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2006 = _1984;
    float _2008 = _2006;
    float _2010 = _2006;
    if (!_1958)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2012 = _1986;
    float _2014 = _1976 * _1919;
    float _2016 = -_1976;
    float _2018 = _2016 + 1.0;
    float _2020 = _1930 * _2014;
    float _2022 = _1930 * _2018;
    float _2024 = _1944 * _2014;
    float _2026 = fma(_1940, _2020, _1924);
    float _2028 = fma(_1942, _2020, _1926);
    float _2030 = _2020;
    float _2032 = _2012;
    float _2034 = _2012;
    if (!_1958)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2030;
    float _2038 = fma(_1930, _2024, _1928);
    float _2040 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_76.x = _2026;
    out.m_76.y = _2028;
    out.m_76.z = _2038;
    out.m_76.w = _2022;
    bool _2042 = !_1958;
    float _2044 = _2036;
    float _2046 = _2036;
    if (!_2042)
    {
        bool _2048 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2050 = isnan(_1633);
        bool _2052 = _2048 || _2050;
        bool _2054 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2056 = _2052 || _2054;
        if (!_2056)
        {
            float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2060 = _1633 + _2058;
            float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2064 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2062;
            float _2066 = 1.0 / _2064;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2088 = _2060 * _2066;
            float _2090 = precise::clamp(_2088, 0.0, 1.0);
            float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2096 = fma(_2090, _2070, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2098 = fma(_2090, _2094, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2100 = fma(_2090, _2074, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2102 = fma(_2090, _2078, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2104 = fma(_2090, _2082, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2106 = fma(_2090, _2086, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2010 = _2098;
            _2004 = _2104;
            _2046 = _2096;
            _1998 = _2102;
            _1992 = _2100;
            _2034 = _2106;
            _2108 = true;
        }
        else
        {
            bool _2110 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2112 = isnan(_1633);
            bool _2114 = _2110 || _2112;
            bool _2116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2118 = _2114 || _2116;
            if (!_2118)
            {
                _2044 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2120 = _2044;
            _2046 = _2120;
            if (!_2118)
            {
                _2008 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2122 = _2008;
            _2010 = _2122;
            if (!_2118)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2124 = _1990;
            _1992 = _2124;
            if (!_2118)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2126 = _1996;
            _1998 = _2126;
            if (!_2118)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2128 = _2002;
            _2004 = _2128;
            if (!_2118)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2130 = _2032;
            bool _2132 = !_2118;
            _2034 = _2130;
            if (!_2132)
            {
                bool _2134 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2136 = isnan(_1633);
                bool _2138 = _2134 || _2136;
                bool _2140 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2142 = _2138 || _2140;
                if (!_2142)
                {
                    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2146 = _1633 + _2144;
                    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2150 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2148;
                    float _2152 = 1.0 / _2150;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2174 = _2146 * _2152;
                    float _2176 = precise::clamp(_2174, 0.0, 1.0);
                    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2182 = fma(_2176, _2156, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2184 = fma(_2176, _2180, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2186 = fma(_2176, _2160, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2188 = fma(_2176, _2164, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2190 = fma(_2176, _2168, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2192 = fma(_2176, _2172, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2010 = _2184;
                    _2004 = _2190;
                    _2046 = _2182;
                    _1998 = _2188;
                    _1992 = _2186;
                    _2034 = _2192;
                    _2108 = true;
                }
                else
                {
                    _2010 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2046 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2108 = false;
    float _2194 = _2010;
    float _2196 = _2004;
    float _2198 = _2046;
    float _2200 = _1998;
    float _2202 = _1992;
    float _2204 = _2034;
    float _2206 = fma(_1197, -0.5, 0.5);
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = -_2194;
    float _2212 = _2210 + _2196;
    float _2214 = -_2198;
    float _2216 = _2214 + _2200;
    out.m_78.x = 0.0;
    float _2218 = -_2202;
    float _2220 = _2218 + _2204;
    float _2222 = fma(_2208, _2212, _2194);
    float _2224 = fma(_2208, _2216, _2198);
    bool _2226 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2228 = _2222 * 0.586610972881317138671875;
    float _2230 = fma(_2208, _2220, _2202);
    float _2232 = _2040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = fma(_2224, 0.298911988735198974609375, _2228);
    bool _2236 = _1609 > 0.0;
    bool _2238 = isnan(_1609);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan(0.0);
    bool _2244 = _2240 || _2242;
    float _2246 = fma(_2230, 0.114477999508380889892578125, _2234);
    out.m_49.x = _2232;
    float _2248 = -_2246;
    float _2250 = _2224 + _2248;
    float _2252 = -_2246;
    float _2254 = _2222 + _2252;
    float _2256 = -_2246;
    float _2258 = _2230 + _2256;
    float _2260 = fma(_2250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    float _2262 = fma(_2254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    float _2264 = fma(_2258, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    bool _2266 = !_2226;
    if (!_2266)
    {
        float _2268 = -_1531;
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2272 = -_1533;
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2276 = -_1535;
        float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2280 = _2270 * _2270;
        float _2282 = fma(_2274, _2274, _2280);
        float _2284 = fma(_2278, _2278, _2282);
        float _2286 = sqrt(_2284);
        float _2288 = rsqrt(_2284);
        float _2290 = -_2286;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2294 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        float _2298 = _2274 * _2288;
        float _2300 = _2270 * _2288;
        float _2302 = abs(_2296);
        float _2304 = log2(_2302);
        float _2306 = _2278 * _2288;
        float _2308 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2310 = _1197 * _2300;
        float _2312 = -_2300;
        float _2314 = -_2308;
        float _2316 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2314);
        float _2318 = fma(_1195, _2298, _2310);
        float _2320 = -_2306;
        float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2316);
        float _2324 = fma(_1205, _2306, _2318);
        float _2326 = precise::clamp(_2324, 0.0, 1.0);
        float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2330 = _2322 + _2328;
        float _2332 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2334 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2336 = precise::clamp(_2334, 0.0, 1.0);
        float _2338 = exp2(_2332);
        float _2340 = _2338 * _2336;
        float _2342 = _2326 * _2340;
        float _2344 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2344;
        out.m_78.y = _2346;
        out.m_78.z = _2348;
    }
    out.m_80.x = _2260;
    out.m_80.y = _2262;
    out.m_80.z = _2264;
    if (_2244)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2350 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2350;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2108 = false;
    bool _1255 = false;
    bool _303 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    float _107 = as_type<float>(_99);
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _105;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2408 = as_type<float>(_115);
        out.gl_Position.z = _2408;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_51.w;
    float _121 = float(_99);
    float _123 = 1.0 / _121;
    float _125 = -_119;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_119);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = _127 * _123;
    bool _141 = _127 >= _121;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    out.m_53.x = _139;
    float _147 = _139;
    float _149 = _127;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _107;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2480 = as_type<float>(_155);
        out.gl_Position.z = _2480;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _165 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _167 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _171 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    float _177 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _171);
    float _179 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    bool _183 = !_163;
    float _185 = _177;
    float _187 = _181;
    float _205;
    if (!_183)
    {
        float _189 = in.m_57.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _139;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _247;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _229;
    float _255 = _245 * _233;
    float _257 = -_245;
    float _259 = _257 + 1.0;
    float _261 = _213 * _253;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = fma(_249, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = fma(_265, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = _267 * _255;
    float _273 = _269 * _255;
    float _275 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_251;
    float _301;
    if (!_283)
    {
        float _285 = in.m_57.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _139;
    }
    _303 = false;
    float _305 = _301;
    float _307 = in.m_59.x;
    float _309 = in.m_59.y;
    bool _311 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _313 = isnan(_305);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _327 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _329 = isnan(_305);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _305 + _343;
    float _347 = -_321;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _353 = 1.0 / _325;
    float _355 = _337 * _349;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = _281 * _309;
    float _363 = _279 * _307;
    float _365 = _341 * _353;
    float _367 = fma(_365, _345, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _371 = _367 * _355;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _375 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _371);
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = _373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _383 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[116].x, _377);
    float _385 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _385;
    out.m_61.y = _381;
    out.m_61.z = _375;
    out.m_61.w = _387;
    bool _389 = !_351;
    if (!_389)
    {
        float _391 = in.m_57.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _147 = _405;
    }
    float _407 = _147;
    float _409 = in.m_57.x;
    float _411 = in.m_57.y;
    float _413 = in.m_57.z;
    float _415 = in.m_57.w;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    float _421 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _423 = as_type<float>(int(gl_VertexIndex));
    bool _425 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _427 = isnan(0.0);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _433 = _429 || _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _437 = 1.0 + _435;
    bool _439 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(1.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = 1.0 / _437;
    float _451 = _419 * _127;
    float _453 = exp2(_451);
    float _455 = _413 * 2.0;
    float _457 = _409 * 2.0;
    float _459 = _411 * 2.0;
    float _461 = _411 + _409;
    float _463 = _411 + _413;
    float _465 = _413 + _409;
    float _467 = floor(_455);
    float _469 = _461 + (-1.0);
    float _471 = _463 + (-1.0);
    float _473 = _465 + (-1.0);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _477 = floor(_457);
    float _479 = -_453;
    float _481 = _479 + 1.0;
    float _483 = _433 ? _481 : 0.0;
    float _485 = floor(_459);
    bool _487 = _467 > 0.0;
    bool _489 = _467 >= 0.0;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    if (_447)
    {
        float _499 = _483 * _449;
        _149 = _499;
    }
    float _501 = _149;
    int _503 = _497 ? 0 : 1;
    bool _505 = _477 > 0.0;
    bool _507 = _477 >= 0.0;
    bool _509 = isnan(_477);
    bool _511 = _507 || _509;
    bool _513 = isnan(0.0);
    bool _515 = _511 || _513;
    int _517 = as_type<int>(_423) & 1;
    bool _519 = _517 != 0;
    int _521 = as_type<int>(_423) & 2;
    bool _523 = _521 != 0;
    bool _525 = _485 > 0.0;
    int _527 = _515 ? 0 : 1;
    bool _529 = _485 >= 0.0;
    bool _531 = isnan(_485);
    bool _533 = _529 || _531;
    bool _535 = isnan(0.0);
    bool _537 = _533 || _535;
    int _539 = ~_503;
    int _541 = _539 + 1;
    int _543 = _541 + 1;
    int _545 = ~_527;
    int _547 = _545 + 1;
    int _549 = _547 + 1;
    bool _551 = _415 > 0.5;
    int _553 = _537 ? 0 : 1;
    int _555 = _543;
    int _557 = _549;
    if (!_487)
    {
        int _559 = ~_503;
        int _561 = _559 + 1;
        _555 = _561;
    }
    int _563 = _555;
    if (!_505)
    {
        int _565 = ~_527;
        int _567 = _565 + 1;
        _557 = _567;
    }
    int _569 = _557;
    bool _571 = !_523;
    float _573 = _571 ? (-0.5) : 0.5;
    int _575 = ~_553;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _591 = _589 != 0;
    int _593 = _579;
    if (!_525)
    {
        int _595 = ~_553;
        int _597 = _595 + 1;
        _593 = _597;
    }
    int _599 = _593;
    bool _601 = !_519;
    float _603 = _601 ? (-0.5) : 0.5;
    float _605 = -_573;
    int _607 = _551 ? as_type<int>(_605) : as_type<int>(_573);
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _623 = _621 != 0;
    float _625 = in.m_66.x;
    float _627 = in.m_66.y;
    float _629 = in.m_66.z;
    bool _631 = !_583;
    int _633 = _631 ? 0 : 1;
    float _635 = float(_563);
    int _637 = abs(_633);
    bool _639 = !_587;
    int _641 = _639 ? 0 : 1;
    float _643 = float(_637);
    int _645 = abs(_641);
    float _647 = float(_569);
    float _649 = _643 * _635;
    float _651 = float(_645);
    float _653 = in.m_46.x;
    float _655 = in.m_46.y;
    float _657 = in.m_46.z;
    bool _659 = _409 > 0.5;
    float _661 = _649 * (-2.0);
    float _663 = _409 + (-0.5);
    float _665 = _651 * _647;
    bool _667 = !_591;
    int _669 = _667 ? 0 : 1;
    float _671 = fma(_661, _625, _625);
    float _673 = _665 * (-2.0);
    float _675 = fma(_475, _661, _475);
    float _677 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[196].x, _671);
    float _681 = fma(_673, _627, _627);
    int _683 = abs(_669);
    float _685 = fma(_675, _501, _679);
    float _687 = float(_599);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _689;
    float _693 = _685 * 0.15915493667125701904296875;
    float _695 = float(_683);
    float _697 = 1.0 / _691;
    bool _699 = _411 > 0.5;
    float _701 = _411 + (-0.5);
    bool _703 = _413 > 0.5;
    float _705 = _695 * _687;
    float _707 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = _413 + (-0.5);
    float _711 = fma(_677, _673, _677);
    float _713 = _705 * (-2.0);
    float _715 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].y, _681);
    float _717 = _655 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _655 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = fma(_713, _629, _629);
    float _723 = _655 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _725 = fma(_707, _713, _707);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _729 = _407 + _727;
    float _731 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[196].z, _721);
    float _733 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _735 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _737 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _739 = fma(_711, _501, _715);
    float _741 = fma(_725, _501, _731);
    float _743 = _729 * _697;
    float _745 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[4].z, _733);
    float _747 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[5].z, _735);
    float _749 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[6].z, _737);
    bool _751 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _753 = isnan(_407);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _693 * 6.283185482025146484375;
    float _765 = sin(_763);
    bool _767 = _407 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _769 = isnan(_407);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = _739 * 0.15915493667125701904296875;
    float _781 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _783 = -_777;
    float _785 = _783 + 1.0;
    float _787 = _693 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _791;
    float _795 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _573);
    float _797 = _745 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _799;
    float _803 = _749 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _805 = _781 * _795;
    bool _807 = !_623;
    float _809 = _807 ? _573 : as_type<float>(_607);
    float _811 = _779 * 6.283185482025146484375;
    float _813 = sin(_811);
    float _815 = _741 * 0.15915493667125701904296875;
    float _817 = fma(_801, _743, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _819 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _603);
    float _821 = -_603;
    int _823 = _659 ? as_type<int>(_821) : as_type<int>(_603);
    float _825 = -_603;
    int _827 = _703 ? as_type<int>(_825) : as_type<int>(_603);
    float _829 = _421 * _819;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _815 * 6.283185482025146484375;
    float _837 = cos(_835);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _839;
    float _843 = _761 * _785;
    float _845 = fma(_793, _743, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _847 = _765 * _813;
    float _849 = fma(_841, _743, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _851 = _817 * _843;
    float _853 = _845 * _843;
    float _855 = _815 * 6.283185482025146484375;
    float _857 = sin(_855);
    float _859 = _765 * _833;
    float _861 = _789 * _833;
    float _863 = _849 * _843;
    float _865 = -_761;
    float _867 = _865 + 1.0;
    float _869 = _765 * _837;
    float _871 = _789 * _813;
    float _873 = _789 * _837;
    float _875 = _833 * _837;
    float _877 = _813 * _837;
    float _879 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _881 = _873 * _805;
    float _883 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].z, _863);
    float _885 = fma(_857, _861, _847);
    float _887 = -_871;
    float _889 = fma(_857, _859, _887);
    float _891 = -_859;
    float _893 = fma(_857, _871, _891);
    float _895 = -_805;
    float _897 = _857 * _895;
    float _899 = fma(_885, _829, _881);
    float _901 = _869 * _805;
    float _903 = fma(_857, _847, _861);
    float _905 = fma(_875, _829, _897);
    float _907 = fma(_893, _879, _899);
    float _909 = fma(_889, _829, _901);
    float _911 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].z, _883);
    float _913 = fma(_877, _879, _905);
    float _915 = _907 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _907 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = fma(_903, _879, _909);
    float _921 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].x, _853);
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _927 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[123].y, _851);
    float _929 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].x, _921);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[24].z, _923);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[26].z, _925);
    float _935 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[124].y, _927);
    float _937 = _873 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = _873 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _945 = _873 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _947 = _797 + _939;
    float _949 = _803 + _941;
    float _951 = -_857;
    float _953 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].x, _943);
    float _955 = -_857;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[25].x, _937);
    float _959 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _961 = _947 + _959;
    float _963 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _965 = _949 + _963;
    float _967 = -_857;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[26].x, _945);
    float _971 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _953);
    float _973 = _961 * _961;
    float _975 = _965 * _965;
    float _977 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _957);
    float _979 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _969);
    float _981 = _885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _983 = _973 + _975;
    float _985 = _885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _987 = _885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _989 = -_573;
    int _991 = _699 ? as_type<int>(_989) : as_type<int>(_573);
    float _993 = sqrt(_983);
    float _995 = _907 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _997 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _981);
    bool _999 = !_615;
    float _1001 = _999 ? _573 : as_type<float>(_991);
    float _1003 = _573 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1005 = _893 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1007 = _893 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1009 = _893 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1011 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _995);
    float _1013 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _985);
    float _1015 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _987);
    float _1017 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    float _1019 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1007);
    float _1021 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1009);
    float _1023 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1011);
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1027 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1003 * _971;
    float _1031 = _1003 * _977;
    float _1033 = _1003 * _979;
    float _1035 = _747 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1037 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1039 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _997);
    float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1043 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1013);
    float _1045 = _1035 + _1037;
    float _1047 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1015);
    float _1049 = _919;
    float _1051 = _973;
    float _1053 = _975;
    float _1055 = _947;
    float _1057 = _949;
    if (!_1027)
    {
        _1049 = _1045;
    }
    float _1059 = _1049;
    bool _1061 = !_1027;
    float _1063 = _1059;
    if (!_1061)
    {
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1069 = _993 + _1067;
        float _1071 = rsqrt(_983);
        float _1073 = _1069 * _1065;
        float _1075 = _1045 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = _1073 * 0.15915493667125701904296875;
        float _1079 = _1077 * 6.283185482025146484375;
        float _1081 = sin(_1079);
        float _1083 = _1077 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = fma(_1081, _1075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1089 = _1071 * _1087;
        float _1091 = _1085 + (-1.0);
        float _1093 = fma(_961, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1095 = fma(_965, _1089, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1097 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1101 = _1093 + _1099;
        float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1105 = _1095 + _1103;
        float _1107 = fma(_1045, _1085, _1097);
        float _1109 = _1101 * _1101;
        float _1111 = _1105 * _1105;
        _1063 = _1107;
        _1051 = _1109;
        _1053 = _1111;
        _1055 = _1093;
        _1057 = _1095;
    }
    float _1113 = _1063;
    float _1115 = _1051;
    float _1117 = _1053;
    float _1119 = _1055;
    float _1121 = _1057;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_611;
    float _1127 = _1125 ? _603 : as_type<float>(_823);
    float _1129 = _603 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1131 = !_619;
    float _1133 = _1131 ? _603 : as_type<float>(_827);
    float _1135 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1137 = _1113 + _1135;
    float _1139 = -_1001;
    float _1141 = _1139 + 0.5;
    float _1143 = _1127 + 0.5;
    float _1145 = fma(_1129, _1047, _1033);
    float _1147 = fma(_1137, _1137, _1115);
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1151 = _1133 + 0.5;
    float _1153 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1017);
    float _1155 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1019);
    float _1157 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1021);
    float _1159 = _1147 + _1117;
    float _1161 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1163 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1165 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1167 = -_809;
    float _1169 = _1167 + 0.5;
    float _1171 = _1161 * _1025;
    float _1173 = _1163 * _1041;
    float _1175 = _1165 * _1123;
    float _1177 = sqrt(_1159);
    float _1179 = fma(_1129, _1039, _1029);
    float _1181 = fma(_1129, _1043, _1031);
    float _1183 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1185 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1187 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1189 = _911 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1193 = _1185 * _1149;
    float _1195 = _1153 + _1179;
    float _1197 = _1155 + _1181;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1157 + _1145;
    out.m_68.x = _1171;
    out.m_68.y = _1173;
    out.m_68.z = _1175;
    out.m_68.w = _1193;
    bool _1207 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1209 = isnan(_1177);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1215 = _1211 || _1213;
    out.m_70.x = _1201;
    out.m_70.y = _1191;
    out.m_70.z = _1203;
    out.m_70.w = _1199;
    out.m_72.x = _1195;
    out.m_72.y = _1197;
    out.m_72.z = _1205;
    float _1217 = _1187;
    float _1219 = _1175;
    if (!_1215)
    {
        _1217 = 1.0;
    }
    float _1221 = _1217;
    bool _1223 = !_1215;
    float _1225 = _1221;
    if (!_1223)
    {
        bool _1227 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1229 = isnan(_1177);
        bool _1231 = _1227 || _1229;
        bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1235 = _1231 || _1233;
        if (!_1235)
        {
            float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1239 = _1177 + _1237;
            float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1243 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1241;
            float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1249 = 1.0 / _1243;
            float _1251 = _1239 * _1249;
            float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1225 = _1253;
            _1255 = true;
        }
        else
        {
            bool _1257 = _1177 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1259 = isnan(_1177);
            bool _1261 = _1257 || _1259;
            bool _1263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1265 = _1261 || _1263;
            if (!_1265)
            {
                float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1269 = _1177 + _1267;
                float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1275 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1277 = _1275 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1279 = 1.0 / _1273;
                float _1281 = _1269 * _1279;
                float _1283 = fma(_1281, _1277, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1225 = _1283;
                _1255 = true;
            }
            else
            {
                _1225 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1255 = false;
    float _1285 = _1225;
    float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1289 = _1113 + _1287;
    float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1293 = _1119 + _1291;
    float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1297 = _1121 + _1295;
    float _1299 = fma(_1289, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1301 = fma(_1293, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1303 = fma(_1297, _1285, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1305 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1307 = -_1035;
    float _1309 = _1307 + _1299;
    float _1311 = -_797;
    float _1313 = _1311 + _1301;
    float _1315 = -_803;
    float _1317 = _1315 + _1303;
    float _1319 = _1309 * _1309;
    bool _1321 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1323 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.5);
    bool _1329 = _1325 || _1327;
    float _1331 = fma(_1313, _1313, _1319);
    float _1333 = fma(_1317, _1317, _1331);
    float _1335 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1305);
    float _1337 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1339 = sqrt(_1333);
    float _1341 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1335);
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1345 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1337);
    float _1347 = 1.0 / _1343;
    float _1349 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1345);
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1353 = _1339 > 0.0;
    float _1355 = _1351 + _1343;
    bool _1357 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1359 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    float _1367 = _1355 * _1347;
    float _1369 = _1367 * 0.5;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1373 = _1355;
    float _1375 = _1347;
    float _1377 = _1343;
    if (!_1353)
    {
        _1371 = _1301;
    }
    float _1379 = _1371;
    float _1381 = _1379;
    float _1383 = _1379;
    if (!_1353)
    {
        _1373 = _1299;
    }
    float _1385 = _1373;
    float _1387 = _1385;
    if (!_1353)
    {
        _1375 = _1303;
    }
    float _1389 = _1375;
    bool _1391 = !_1353;
    float _1393 = _1389;
    if (!_1391)
    {
        float _1395 = _179 * _179;
        float _1397 = fma(_177, _177, _1395);
        float _1399 = fma(_181, _181, _1397);
        float _1401 = rsqrt(_1333);
        float _1403 = sqrt(_1399);
        float _1405 = _1313 * _1401;
        float _1407 = _1309 * _1401;
        float _1409 = _1317 * _1401;
        bool _1411 = _1403 > 0.0;
        float _1413 = _1401;
        float _1415 = _1403;
        _1219 = _1399;
        if (!_1411)
        {
            _1381 = _1301;
        }
        float _1417 = _1381;
        _1383 = _1417;
        if (!_1411)
        {
            _1413 = _1299;
        }
        float _1419 = _1413;
        _1387 = _1419;
        if (!_1411)
        {
            _1415 = _1303;
        }
        float _1421 = _1415;
        bool _1423 = !_1411;
        _1393 = _1421;
        if (!_1423)
        {
            float _1425 = rsqrt(_1399);
            float _1427 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1429 = _179 * _1425;
            float _1431 = _177 * _1425;
            float _1433 = _1407 * _1429;
            float _1435 = _181 * _1425;
            float _1437 = fma(_1405, _1431, _1433);
            float _1439 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1441 = fma(_1409, _1435, _1437);
            float _1443 = _1441 * _1439;
            float _1445 = fma(_177, _1443, _1301);
            float _1447 = fma(_179, _1443, _1299);
            float _1449 = fma(_181, _1443, _1303);
            _1383 = _1445;
            _1377 = _1443;
            _1387 = _1447;
            _1393 = _1449;
            _1219 = _1425;
        }
    }
    float _1451 = _1383;
    float _1453 = _1377;
    float _1455 = _1387;
    float _1457 = _1393;
    float _1459 = _1219;
    float _1461 = _1459;
    float _1463 = _1455;
    float _1465 = _1457;
    float _1467 = _1453;
    float _1469 = _1451;
    if (_1329)
    {
        _185 = 1.0;
    }
    float _1471 = _185;
    float _1473 = _1471;
    if (_1365)
    {
        _187 = _1451;
    }
    float _1475 = _187;
    float _1477 = _1475;
    if (!_1365)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1035 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _797 + _1483;
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = _1481 * _1481;
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1493 = _803 + _1491;
        float _1495 = fma(_1485, _1485, _1489);
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1499 = fma(_1493, _1493, _1495);
        float _1501 = sqrt(_1499);
        float _1503 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1505 = precise::min(_1501, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1507 = _1505 * _1497;
        float _1509 = -_797;
        float _1511 = _1509 + _1451;
        float _1513 = _1503 * _1507;
        float _1515 = -_1035;
        float _1517 = _1515 + _1455;
        float _1519 = -_803;
        float _1521 = _1519 + _1457;
        float _1523 = fma(_1511, _1513, _797);
        float _1525 = fma(_1517, _1513, _1035);
        float _1527 = fma(_1521, _1513, _803);
        _1461 = _1501;
        _1463 = _1525;
        _1477 = _1523;
        _1465 = _1527;
        _1467 = _1487;
        _1469 = _1513;
    }
    float _1529 = _1461;
    float _1531 = _1463;
    float _1533 = _1477;
    float _1535 = _1465;
    float _1537 = _1467;
    float _1539 = _1469;
    float _1541 = _1539;
    float _1543 = _1529;
    float _1545 = _1537;
    if (!_1329)
    {
        float _1547 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1557 = _1555 * 0.15915493667125701904296875;
        float _1559 = _1549 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1565 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
        float _1567 = 1.0 / _1553;
        float _1569 = _1557 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1561 * _1567;
        float _1575 = 1.0 / _1565;
        float _1577 = _1571 * _1573;
        float _1579 = _1557 * 6.283185482025146484375;
        float _1581 = sin(_1579);
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1589 = _1575 * _1587;
        float _1591 = 1.0 / _1577;
        float _1593 = 1.0 / _1585;
        float _1595 = _1581 * _1591;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = fma(_1595, _1589, _1597);
        float _1601 = _1599 * _1593;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1541 = _1549;
        _1543 = _1593;
        _1473 = _1603;
    }
    float _1605 = _1541;
    float _1607 = _1543;
    float _1609 = _1473;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1531 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1533 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1535 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1629 = fma(_1621, _1621, _1625);
    float _1631 = rsqrt(_1629);
    float _1633 = sqrt(_1629);
    float _1635 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1637 = _1617 * _1635;
    float _1639 = _1621 * _1635;
    float _1641 = _1637 * _1637;
    float _1643 = _1639 * _1639;
    float _1645 = _1641 + _1643;
    float _1647 = sqrt(_1645);
    bool _1649 = _1647 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1651 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1653 = _1647 + _1651;
    float _1655 = _1631;
    float _1657 = _1605;
    float _1659 = _1653;
    float _1661 = _1613;
    float _1663 = _1607;
    float _1665 = _1637;
    if (_1649)
    {
        float _1667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1655 = _1667;
    }
    float _1669 = _1655;
    if (_1649)
    {
        float _1671 = rsqrt(_1645);
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = _1673;
    if (_1649)
    {
        float _1677 = _1653 * _1669;
        _1659 = _1677;
    }
    float _1679 = _1659;
    if (_1649)
    {
        float _1681 = _1679 * 0.15915493667125701904296875;
        _1545 = _1681;
    }
    float _1683 = _1545;
    float _1685 = _1669;
    if (_1649)
    {
        float _1687 = _1683 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        _1685 = _1689;
    }
    float _1691 = _1685;
    float _1693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1695 = precise::max(0.0, _1693);
    float _1697 = _1621;
    float _1699 = _1695;
    if (_1649)
    {
        float _1701 = _1683 * 6.283185482025146484375;
        float _1703 = cos(_1701);
        _1697 = _1703;
    }
    float _1705 = _1697;
    float _1707 = -_1635;
    float _1709 = -_1695;
    float _1711 = fma(_1613, _1707, _1709);
    if (!_1649)
    {
        _1661 = _1639;
    }
    float _1713 = _1661;
    float _1715 = _1713;
    if (_1649)
    {
        float _1717 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1699 = _1717;
    }
    float _1719 = _1699;
    float _1721 = _1691;
    float _1723 = _1719;
    if (_1649)
    {
        float _1725 = fma(_1691, _1719, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1663 = _1725;
    }
    float _1727 = _1663;
    float _1729 = _1727;
    if (!_1649)
    {
        _1721 = _1711;
    }
    float _1731 = _1721;
    float _1733 = _1731;
    float _1735 = _1705;
    if (_1649)
    {
        float _1737 = _1705 + (-1.0);
        _1723 = _1737;
    }
    float _1739 = _1723;
    float _1741 = _1739;
    if (_1649)
    {
        float _1743 = _1673 * _1727;
        _1729 = _1743;
    }
    float _1745 = _1729;
    if (_1649)
    {
        float _1747 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1675 = _1747;
    }
    float _1749 = _1675;
    if (_1649)
    {
        float _1751 = _1637 * _1745;
        _1665 = _1751;
    }
    float _1753 = _1665;
    if (!_1649)
    {
        _1741 = _1641;
    }
    float _1755 = _1741;
    float _1757 = _1755;
    if (_1649)
    {
        float _1759 = _1639 * _1745;
        _1715 = _1759;
    }
    float _1761 = _1715;
    if (_1649)
    {
        float _1763 = fma(_1711, _1705, _1749);
        _1733 = _1763;
    }
    float _1765 = _1733;
    if (_1649)
    {
        float _1767 = _1753 * _1753;
        _1757 = _1767;
    }
    float _1769 = _1757;
    if (!_1649)
    {
        _1735 = _1643;
    }
    float _1771 = _1735;
    float _1773 = _1771;
    if (_1649)
    {
        float _1775 = _1761 * _1761;
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1781 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1779);
    float _1783 = precise::clamp(_1781, 0.0, 1.0);
    float _1785 = fma(_1765, _1765, _1769);
    float _1787 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1789 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1791 = -_1783;
    float _1793 = _1791 + 1.0;
    float _1795 = _1785 + _1777;
    float _1797 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1787);
    float _1799 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1801 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1803 = rsqrt(_1795);
    float _1805 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1797);
    float _1807 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1809 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1801);
    float _1811 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1789);
    float _1813 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1815 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1809);
    float _1817 = abs(_1793);
    float _1819 = log2(_1817);
    float _1821 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1807);
    float _1823 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1825 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1811);
    float _1827 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1829 = -_1823;
    float _1831 = fma(_1829, _1627, 1.0);
    float _1833 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1835 = _1803 * _1753;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1839 = _1803 * _1765;
    float _1841 = _1803 * _1761;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1837);
    float _1847 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1849 = log2(_1831);
    float _1851 = -_1843;
    float _1853 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1845);
    float _1857 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1861 = -_1841;
    float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1865 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1855);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1869 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1859);
    float _1871 = fma(_1863, -0.5, 0.5);
    float _1873 = exp2(_1857);
    float _1875 = fma(_1863, 0.5, 0.5);
    float _1877 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1867);
    float _1879 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1869);
    float _1881 = _1839 + 1.0;
    float _1883 = fma(_1875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1885 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1877);
    float _1887 = _1849 * 0.693147182464599609375;
    float _1889 = 1.0 / _1865;
    float _1891 = fma(_1875, _1883, -0.212114393711090087890625);
    float _1893 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1885);
    float _1895 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1879);
    float _1897 = fma(_1875, _1891, 1.570728778839111328125);
    float _1899 = sqrt(_1871);
    float _1901 = -_1839;
    float _1903 = fma(_1873, _1881, _1901);
    float _1905 = fma(_1903, 0.5, 0.5);
    float _1907 = _1893 * _1889;
    float _1909 = _1895 * _1889;
    float _1911 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1913 = fma(_1907, 0.5, 0.5);
    float _1915 = fma(_1909, -0.5, 0.5);
    float _1917 = _1899 * 0.636619746685028076171875;
    float3 _5322 = float3(_1913, _1915, _1911);
    float _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5322, float3(0.0), isnan(_5322)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5322, float3(0.0), isnan(_5322)), level(0.0)).x;
    float3 _5333 = float3(_1913, _1915, _1911);
    float4 _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5333, float3(0.0), isnan(_5333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5333, float3(0.0), isnan(_5333)), level(0.0)).xyzw;
    float _1924 = _1922.x;
    float _1926 = _1922.y;
    float _1928 = _1922.z;
    float _1930 = _1922.w;
    float _1932 = -_1897;
    float _1934 = fma(_1917, _1932, 1.0);
    float2 _5355 = float2(_1934, _1905);
    float3 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5355, float2(0.0), isnan(_5355)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5355, float2(0.0), isnan(_5355)), level(0.0)).xyz;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1948 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1950 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1952 = isnan(_1633);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1958 = _1954 || _1956;
    float _1960 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1948);
    float _1962 = exp2(_1946);
    float _1964 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1960);
    float _1966 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1964);
    float _1968 = _1966 + _1865;
    out.gl_Position.x = _1893;
    out.gl_Position.y = _1895;
    out.gl_Position.z = _1966;
    out.gl_Position.w = _1865;
    float _1970 = _1968 * 0.5;
    float _1972 = -_1962;
    float _1974 = _1972 + 1.0;
    float _1976 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.z = _1970;
    out.m_74.w = _1865;
    float _1978 = _1865;
    float _1980 = _1966;
    float _1982 = _1895;
    float _1984 = _1970;
    float _1986 = _1893;
    if (!_1958)
    {
        _1978 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1988 = _1978;
    float _1990 = _1988;
    float _1992 = _1988;
    if (!_1958)
    {
        _1980 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1994 = _1980;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1958)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2000 = _1982;
    float _2002 = _2000;
    float _2004 = _2000;
    if (!_1958)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2006 = _1984;
    float _2008 = _2006;
    float _2010 = _2006;
    if (!_1958)
    {
        _1986 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2012 = _1986;
    float _2014 = _1976 * _1919;
    float _2016 = -_1976;
    float _2018 = _2016 + 1.0;
    float _2020 = _1930 * _2014;
    float _2022 = _1930 * _2018;
    float _2024 = _1944 * _2014;
    float _2026 = fma(_1940, _2020, _1924);
    float _2028 = fma(_1942, _2020, _1926);
    float _2030 = _2020;
    float _2032 = _2012;
    float _2034 = _2012;
    if (!_1958)
    {
        _2030 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2036 = _2030;
    float _2038 = fma(_1930, _2024, _1928);
    float _2040 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_76.x = _2026;
    out.m_76.y = _2028;
    out.m_76.z = _2038;
    out.m_76.w = _2022;
    bool _2042 = !_1958;
    float _2044 = _2036;
    float _2046 = _2036;
    if (!_2042)
    {
        bool _2048 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2050 = isnan(_1633);
        bool _2052 = _2048 || _2050;
        bool _2054 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2056 = _2052 || _2054;
        if (!_2056)
        {
            float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2060 = _1633 + _2058;
            float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2064 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2062;
            float _2066 = 1.0 / _2064;
            float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2088 = _2060 * _2066;
            float _2090 = precise::clamp(_2088, 0.0, 1.0);
            float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2094 = _2092 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2096 = fma(_2090, _2070, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2098 = fma(_2090, _2094, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2100 = fma(_2090, _2074, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2102 = fma(_2090, _2078, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2104 = fma(_2090, _2082, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2106 = fma(_2090, _2086, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2010 = _2098;
            _2004 = _2104;
            _2046 = _2096;
            _1998 = _2102;
            _1992 = _2100;
            _2034 = _2106;
            _2108 = true;
        }
        else
        {
            bool _2110 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2112 = isnan(_1633);
            bool _2114 = _2110 || _2112;
            bool _2116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2118 = _2114 || _2116;
            if (!_2118)
            {
                _2044 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2120 = _2044;
            _2046 = _2120;
            if (!_2118)
            {
                _2008 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2122 = _2008;
            _2010 = _2122;
            if (!_2118)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2124 = _1990;
            _1992 = _2124;
            if (!_2118)
            {
                _1996 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2126 = _1996;
            _1998 = _2126;
            if (!_2118)
            {
                _2002 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2128 = _2002;
            _2004 = _2128;
            if (!_2118)
            {
                _2032 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2130 = _2032;
            bool _2132 = !_2118;
            _2034 = _2130;
            if (!_2132)
            {
                bool _2134 = _1633 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2136 = isnan(_1633);
                bool _2138 = _2134 || _2136;
                bool _2140 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2142 = _2138 || _2140;
                if (!_2142)
                {
                    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2146 = _1633 + _2144;
                    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2150 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2148;
                    float _2152 = 1.0 / _2150;
                    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2156 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2174 = _2146 * _2152;
                    float _2176 = precise::clamp(_2174, 0.0, 1.0);
                    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2182 = fma(_2176, _2156, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2184 = fma(_2176, _2180, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2186 = fma(_2176, _2160, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2188 = fma(_2176, _2164, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2190 = fma(_2176, _2168, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2192 = fma(_2176, _2172, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2010 = _2184;
                    _2004 = _2190;
                    _2046 = _2182;
                    _1998 = _2188;
                    _1992 = _2186;
                    _2034 = _2192;
                    _2108 = true;
                }
                else
                {
                    _2010 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2004 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2046 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1998 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2034 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2108 = false;
    float _2194 = _2010;
    float _2196 = _2004;
    float _2198 = _2046;
    float _2200 = _1998;
    float _2202 = _1992;
    float _2204 = _2034;
    float _2206 = fma(_1197, -0.5, 0.5);
    float _2208 = precise::clamp(_2206, 0.0, 1.0);
    float _2210 = -_2194;
    float _2212 = _2210 + _2196;
    float _2214 = -_2198;
    float _2216 = _2214 + _2200;
    out.m_78.x = 0.0;
    float _2218 = -_2202;
    float _2220 = _2218 + _2204;
    float _2222 = fma(_2208, _2212, _2194);
    float _2224 = fma(_2208, _2216, _2198);
    bool _2226 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2228 = _2222 * 0.586610972881317138671875;
    float _2230 = fma(_2208, _2220, _2202);
    float _2232 = _2040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = fma(_2224, 0.298911988735198974609375, _2228);
    bool _2236 = _1609 > 0.0;
    bool _2238 = isnan(_1609);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan(0.0);
    bool _2244 = _2240 || _2242;
    float _2246 = fma(_2230, 0.114477999508380889892578125, _2234);
    out.m_49.x = _2232;
    float _2248 = -_2246;
    float _2250 = _2224 + _2248;
    float _2252 = -_2246;
    float _2254 = _2222 + _2252;
    float _2256 = -_2246;
    float _2258 = _2230 + _2256;
    float _2260 = fma(_2250, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    float _2262 = fma(_2254, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    float _2264 = fma(_2258, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2246);
    bool _2266 = !_2226;
    if (!_2266)
    {
        float _2268 = -_1531;
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2272 = -_1533;
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2276 = -_1535;
        float _2278 = _2276 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2280 = _2270 * _2270;
        float _2282 = fma(_2274, _2274, _2280);
        float _2284 = fma(_2278, _2278, _2282);
        float _2286 = sqrt(_2284);
        float _2288 = rsqrt(_2284);
        float _2290 = -_2286;
        float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2294 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        float _2298 = _2274 * _2288;
        float _2300 = _2270 * _2288;
        float _2302 = abs(_2296);
        float _2304 = log2(_2302);
        float _2306 = _2278 * _2288;
        float _2308 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2310 = _1197 * _2300;
        float _2312 = -_2300;
        float _2314 = -_2308;
        float _2316 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2314);
        float _2318 = fma(_1195, _2298, _2310);
        float _2320 = -_2306;
        float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2316);
        float _2324 = fma(_1205, _2306, _2318);
        float _2326 = precise::clamp(_2324, 0.0, 1.0);
        float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2330 = _2322 + _2328;
        float _2332 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2334 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2336 = precise::clamp(_2334, 0.0, 1.0);
        float _2338 = exp2(_2332);
        float _2340 = _2338 * _2336;
        float _2342 = _2326 * _2340;
        float _2344 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2346 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2348 = _2342 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2344;
        out.m_78.y = _2346;
        out.m_78.z = _2348;
    }
    out.m_80.x = _2260;
    out.m_80.y = _2262;
    out.m_80.z = _2264;
    if (_2244)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2350 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2350;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

