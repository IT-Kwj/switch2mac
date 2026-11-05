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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2638 = false;
    bool _1743 = false;
    bool _305 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2942 = as_type<float>(_119);
        out.gl_Position.z = _2942;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_53.w;
    float _125 = float(_105);
    float _127 = -_123;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_123);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    bool _141 = _129 >= _125;
    bool _143 = !_139;
    bool _145 = _141 || _143;
    float _147 = _123;
    float _149 = _129;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _147;
    if (_145)
    {
        out.m_51.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _121 = as_type<int>(_153);
    }
    int _155 = _121;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3007 = as_type<float>(_155);
        out.gl_Position.z = _3007;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    float _163 = 1.0 / _125;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _129 * _163;
    float _169 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_165;
    float _189 = _183;
    float _207;
    if (!_187)
    {
        float _191 = in.m_57.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        _207 = _167;
    }
    _209 = false;
    float _211 = _207;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    float _303;
    if (!_285)
    {
        float _287 = in.m_57.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _167;
    }
    _305 = false;
    float _307 = _303;
    float _309 = in.m_57.x;
    float _311 = in.m_57.y;
    float _313 = in.m_57.z;
    float _315 = in.m_57.w;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = as_type<float>(int(gl_VertexIndex));
    float _323 = in.m_62.x;
    float _325 = in.m_62.y;
    float _327 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _329 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _347 = _313 * 2.0;
    float _349 = _309 * 2.0;
    float _351 = _311 * 2.0;
    float _353 = 1.0 / _333;
    int _355 = as_type<int>(_321) & 1;
    bool _357 = _355 != 0;
    int _359 = as_type<int>(_321) & 2;
    bool _361 = _359 != 0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _367 = _315 > 0.5;
    float _369 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _371 = _281 * _323;
    float _373 = _283 * _325;
    float _375 = floor(_347);
    bool _377 = !_361;
    float _379 = _377 ? (-0.5) : 0.5;
    float _381 = _311 + _313;
    float _383 = _313 + _309;
    float _385 = _309 + (-0.5);
    float _387 = floor(_349);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _393 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _369);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _399 = _381 + (-1.0);
    float _401 = floor(_351);
    bool _403 = _375 > 0.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _409 = _375 >= 0.0;
    bool _411 = isnan(_375);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _419;
    float _423 = _383 + (-1.0);
    int _425 = _417 ? 0 : 1;
    float _427 = 1.0 / _337;
    bool _429 = _387 > 0.0;
    float _431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _379);
    bool _433 = _387 >= 0.0;
    bool _435 = isnan(_387);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    int _443 = _441 ? 0 : 1;
    float _445 = 1.0 / _341;
    bool _447 = _401 >= 0.0;
    bool _449 = isnan(_401);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    bool _457 = _401 > 0.0;
    int _459 = ~_425;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    int _465 = ~_443;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = 1.0 / _345;
    int _473 = _455 ? 0 : 1;
    int _475 = _463;
    int _477 = _469;
    if (!_403)
    {
        int _479 = ~_425;
        int _481 = _479 + 1;
        _475 = _481;
    }
    int _483 = _475;
    float _485 = _319 * _129;
    if (!_429)
    {
        int _487 = ~_443;
        int _489 = _487 + 1;
        _477 = _489;
    }
    int _491 = _477;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _503 = _501 != 0;
    float _505 = exp2(_485);
    float _507 = in.m_48.x;
    float _509 = in.m_48.y;
    float _511 = in.m_48.z;
    int _513 = ~_473;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    int _519 = _517;
    if (!_457)
    {
        int _521 = ~_473;
        int _523 = _521 + 1;
        _519 = _523;
    }
    int _525 = _519;
    bool _527 = !_357;
    float _529 = _527 ? (-0.5) : 0.5;
    float _531 = 1.0 / _391;
    bool _533 = !_495;
    int _535 = _533 ? 0 : 1;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _547 = _545 != 0;
    float _549 = -_505;
    float _551 = _549 + 1.0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _555 = _553 != 0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _559 = 1.0 + _557;
    bool _561 = !_499;
    int _563 = _561 ? 0 : 1;
    float _565 = 1.0 / _365;
    bool _567 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _575 = _571 || _573;
    float _577 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _579 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _581 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _583 = _575 ? _551 : 0.0;
    float _585 = 1.0 / _559;
    float _587 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].x, _577);
    bool _589 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(1.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].x, _581);
    float _601 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].x, _579);
    float _603 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _587);
    float _605 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _599);
    float _607 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _601);
    float _609 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _611 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _329);
    bool _613 = !_503;
    int _615 = _613 ? 0 : 1;
    float _617 = _607 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _621 = _605 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _623 = _313 + (-0.5);
    float _625 = _617;
    if (_597)
    {
        float _627 = _583 * _585;
        _149 = _627;
    }
    float _629 = _149;
    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _619);
    bool _633 = _313 > 0.5;
    float _635 = _311 + _309;
    float _637 = _311 + (-0.5);
    float _639 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[0].z, _631);
    float _641 = _611 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _643 = -_379;
    int _645 = _367 ? as_type<int>(_643) : as_type<int>(_379);
    float _647 = 1.0 / _397;
    float _649 = _639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _651 = _309 > 0.5;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _657 = _635 + (-1.0);
    bool _659 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _661 = isnan(_307);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _649 >= _641;
    bool _673 = isnan(_649);
    bool _675 = _671 || _673;
    bool _677 = isnan(_641);
    bool _679 = _675 || _677;
    float _681 = 1.0 / _407;
    bool _683 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _685 = isnan(_167);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -_649;
    float _697 = _641 + _695;
    bool _699 = !_679;
    float _701 = _699 ? 1.0 : (-1.0);
    bool _703 = _311 > 0.5;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _713 = 1.0 / _655;
    float _715 = float(_525);
    float _717 = _707 * _353;
    float _719 = _711 * _427;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _725 = _421 * _445;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _735 = _723 * _471;
    float _737 = _729 * _531;
    float _739 = _733 * _565;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _749 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _751;
    float _755 = _743 * _647;
    float _757 = _747 * _713;
    float _759 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _761 = _753 * _681;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _307 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _769 = _307 + _767;
    float _771 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _393);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _775 = _167 + _773;
    float _777 = fma(_717, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _779 = fma(_719, _769, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _783 = _167 + _781;
    float _785 = fma(_725, _775, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _787 = abs(_535);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _791 = _167 + _789;
    float _793 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _795 = fma(_735, _783, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _797 = float(_787);
    float _799 = in.m_64.x;
    float _801 = in.m_64.y;
    float _803 = in.m_64.z;
    float _805 = float(_483);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _809 = _167 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _813 = _167 + _811;
    float _815 = fma(_737, _791, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _819 = _167 + _817;
    float _821 = fma(_755, _809, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _823 = _797 * _805;
    int _825 = abs(_563);
    float _827 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _829 = fma(_757, _813, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _831 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _835 = _167 + _833;
    float _837 = _823 * (-2.0);
    float _839 = fma(_739, _819, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _841 = float(_491);
    float _843 = _831 * _431;
    float _845 = float(_825);
    float _847 = fma(_761, _835, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _849 = fma(_793, _837, _793);
    bool _851 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _853 = isnan(_167);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _529);
    float _865 = _845 * _841;
    bool _867 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _869 = isnan(_307);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_837, _799, _799);
    bool _881 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _883 = isnan(_167);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = rsqrt(_771);
    float _895 = _865 * (-2.0);
    float _897 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[196].x, _879);
    bool _899 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _901 = isnan(_167);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_891;
    float _913 = _911 + 1.0;
    float _915 = fma(_749, _895, _749);
    float _917 = fma(_849, _629, _897);
    float _919 = fma(_895, _801, _801);
    float _921 = _909 * _913;
    float _923 = -_909;
    float _925 = _923 + 1.0;
    bool _927 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _929 = isnan(_167);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = -_861;
    float _941 = _939 + 1.0;
    bool _943 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _945 = isnan(_307);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = _861 * _925;
    bool _957 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _959 = isnan(_167);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -_937;
    float _971 = _969 + 1.0;
    float _973 = _937 * _941;
    float _975 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _977 = _967 * _971;
    float _979 = -_967;
    float _981 = _979 + 1.0;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _983;
    float _987 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _989 = _975 * _975;
    float _991 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _993 = -_953;
    float _995 = _993 + 1.0;
    bool _997 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _999 = isnan(_167);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = fma(_987, _987, _989);
    float _1011 = _693 * _981;
    float _1013 = -_693;
    float _1015 = _1013 + 1.0;
    float _1017 = _669 * _995;
    float _1019 = fma(_991, _991, _1009);
    int _1021 = abs(_615);
    float _1023 = _827 * _863;
    float _1025 = -_669;
    float _1027 = _1025 + 1.0;
    bool _1029 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1031 = isnan(_167);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _1007 * _1015;
    float _1043 = -_1007;
    float _1045 = _1043 + 1.0;
    float _1047 = float(_1021);
    float _1049 = _877 * _1027;
    float _1051 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[196].y, _919);
    float _1053 = _1039 * _1045;
    float _1055 = -_1039;
    float _1057 = _1055 + 1.0;
    float _1059 = _1047 * _715;
    float _1061 = _777 * _1049;
    float _1063 = _785 * _1053;
    float _1065 = -_877;
    float _1067 = _1065 + 1.0;
    float _1069 = _1059 * (-2.0);
    float _1071 = fma(_915, _629, _1051);
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1063);
    float _1075 = 1.0 / _985;
    float _1077 = fma(_1069, _803, _803);
    float _1079 = fma(_759, _1069, _759);
    float _1081 = fma(_795, _1041, _1073);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1061);
    float _1085 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1077);
    float _1087 = -_609;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = fma(_815, _1011, _1081);
    float _1093 = _917 * 0.15915493667125701904296875;
    float _1095 = fma(_1079, _629, _1085);
    float _1097 = -_617;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1101 = _1089 * _1089;
    float _1103 = _1071 * 0.15915493667125701904296875;
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = abs(_697);
    float _1109 = precise::max(_1107, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1111 = fma(_779, _1017, _1083);
    float _1113 = fma(_1099, _1099, _1101);
    float _1115 = rsqrt(_1019);
    float _1117 = -_621;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1123 = fma(_839, _977, _1091);
    float _1125 = fma(_1119, _1119, _1113);
    float _1127 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1111);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1131 = _1121 + _1129;
    float _1133 = _1093 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1141 = fma(_821, _973, _1123);
    float _1143 = _1131 * _1075;
    float _1145 = fma(_167, _1139, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1147 = fma(_829, _955, _1141);
    float _1149 = _701 * _1143;
    float _1151 = _1093 * 6.283185482025146484375;
    float _1153 = cos(_1151);
    float _1155 = _991 * _1115;
    float _1157 = _167 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1159 = _987 * _1115;
    float _1161 = _975 * _1115;
    float _1163 = _609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1165 = fma(_847, _921, _1147);
    float _1167 = _1103 * 6.283185482025146484375;
    float _1169 = sin(_1167);
    float _1171 = _1103 * 6.283185482025146484375;
    float _1173 = cos(_1171);
    float _1175 = _1105 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    float _1179 = _1135 * _1169;
    float _1181 = _1153 * _1169;
    float _1183 = _1105 * 6.283185482025146484375;
    float _1185 = sin(_1183);
    float _1187 = _1153 * _1173;
    float _1189 = _1135 * _1173;
    float _1191 = _1153 * _1177;
    float _1193 = _1135 * _1177;
    float _1195 = _1173 * _1177;
    float _1197 = _1169 * _1177;
    float _1199 = _1191 * _843;
    float _1201 = _1157 * _1149;
    float _1203 = _1193 * _843;
    float _1205 = sqrt(_1125);
    float _1207 = fma(_1185, _1187, _1179);
    float _1209 = -_1181;
    float _1211 = fma(_1185, _1189, _1209);
    float _1213 = -_1189;
    float _1215 = fma(_1185, _1181, _1213);
    float _1217 = -_843;
    float _1219 = _1185 * _1217;
    float _1221 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = fma(_1207, _1023, _1199);
    float _1225 = fma(_1185, _1179, _1187);
    float _1227 = fma(_1195, _1023, _1219);
    float _1229 = fma(_1211, _1023, _1203);
    float _1231 = fma(_1215, _1221, _1223);
    float _1233 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1163);
    float _1235 = fma(_1197, _1221, _1227);
    float _1237 = fma(_1225, _1221, _1229);
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1245 = _1201 * 0.15915493667125701904296875;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1243);
    float _1253 = abs(_1205);
    float _1255 = precise::max(0.0, _1253);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1247);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1249);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1251);
    float _1263 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1233);
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1269 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1271 = _1245 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = _609 + _1265;
    float _1277 = _617 + _1267;
    float _1279 = _621 + _1269;
    float _1281 = precise::min(_1255, 40.0);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1289 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1287);
    float _1297 = fma(_1281, -0.02500000037252902984619140625, 1.0);
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1291);
    float _1301 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1293);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1295);
    float _1305 = -_1273;
    float _1307 = _1305 + 1.0;
    float _1309 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = _1245 * 6.283185482025146484375;
    float _1313 = sin(_1311);
    float _1315 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1317 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = -_1309;
    float _1321 = _1319 + _1289;
    float _1323 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1325 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1329 = fma(_1297, _1321, _1309);
    float _1331 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1325);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1327);
    float _1337 = _1159 * _1307;
    float _1339 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1333);
    float _1343 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1335);
    float _1345 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1347 = _1155 * _1313;
    float _1349 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1353 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1331);
    float _1355 = -_1347;
    float _1357 = fma(_1161, _1337, _1355);
    float _1359 = -_609;
    float _1361 = _1359 + _1349;
    float _1363 = fma(_1159, _1337, _1273);
    float _1365 = -_617;
    float _1367 = _1365 + _1351;
    float _1369 = _1159 * _1313;
    float _1371 = _1357 * _1361;
    float _1373 = _1161 * _1307;
    float _1375 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1353);
    float _1377 = _1161 * _1313;
    float _1379 = fma(_1363, _1367, _1371);
    float _1381 = fma(_1155, _1373, _1369);
    float _1383 = _1155 * _1155;
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1387 = -_1377;
    float _1389 = fma(_1155, _1337, _1387);
    float _1391 = _1381 * _1361;
    float _1393 = fma(_1155, _1337, _1377);
    float _1395 = -_621;
    float _1397 = _1395 + _1385;
    float _1399 = fma(_1307, _1383, _1273);
    float _1401 = fma(_1389, _1367, _1391);
    float _1403 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1165);
    float _1405 = fma(_1393, _1397, _1379);
    float _1407 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1409 = fma(_1399, _1397, _1401);
    float _1411 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1413 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = -_1185;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1407);
    float _1419 = fma(_1405, _1145, _617);
    float _1421 = fma(_1409, _1145, _621);
    float _1423 = -_1185;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1411);
    float _1427 = -_1185;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1431 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1417);
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1435 = _1419 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1439 = _1421 + _1437;
    float _1441 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1425);
    float _1443 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1445 = _1435 * _1435;
    float _1447 = _1439 * _1439;
    float _1449 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1451 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1453 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1455 = _1445 + _1447;
    float _1457 = fma(_1161, _1373, _1273);
    float _1459 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1449);
    float _1461 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1339);
    float _1463 = sqrt(_1455);
    float _1465 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1323);
    float _1467 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1345);
    float _1469 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1451);
    float _1471 = fma(_1161, _1337, _1347);
    float _1473 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1453);
    float _1475 = _1457 * _1361;
    float _1477 = -_379;
    int _1479 = _703 ? as_type<int>(_1477) : as_type<int>(_379);
    float _1481 = -_1369;
    float _1483 = fma(_1155, _1373, _1481);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1487 = fma(_1471, _1367, _1475);
    bool _1489 = !_543;
    float _1491 = _1489 ? _379 : as_type<float>(_1479);
    float _1493 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1459);
    bool _1495 = !_555;
    float _1497 = _1495 ? _379 : as_type<float>(_645);
    float _1499 = fma(_1483, _1397, _1487);
    float _1501 = _379 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1503 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1507 = _609 + _1499;
    float _1509 = _1501 * _1431;
    float _1511 = _1501 * _1441;
    float _1513 = _1501 * _1443;
    float _1515 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1461);
    float _1517 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1519 = -_529;
    int _1521 = _651 ? as_type<int>(_1519) : as_type<int>(_529);
    float _1523 = -_529;
    int _1525 = _633 ? as_type<int>(_1523) : as_type<int>(_529);
    float _1527 = _1499;
    float _1529 = _1501;
    float _1531 = _1483;
    float _1533 = _1445;
    float _1535 = _1447;
    if (!_1503)
    {
        _1527 = _1419;
    }
    float _1537 = _1527;
    float _1539 = _1537;
    if (!_1503)
    {
        _1529 = _1421;
    }
    float _1541 = _1529;
    float _1543 = _1541;
    if (!_1503)
    {
        _1531 = _1507;
    }
    float _1545 = _1531;
    bool _1547 = !_1503;
    float _1549 = _1545;
    if (!_1547)
    {
        float _1551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1555 = _1463 + _1553;
        float _1557 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = rsqrt(_1455);
        float _1561 = _1555 * _1551;
        float _1563 = _1561 * 0.15915493667125701904296875;
        float _1565 = _1563 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = _1563 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = fma(_1567, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1575 = _1559 * _1573;
        float _1577 = fma(_1435, _1575, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1579 = _1571 + (-1.0);
        float _1581 = fma(_1439, _1575, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1585 = _1577 + _1583;
        float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1591 = _1581 + _1589;
        float _1593 = _1585 * _1585;
        float _1595 = fma(_1507, _1571, _1587);
        float _1597 = _1591 * _1591;
        _1549 = _1595;
        _1533 = _1593;
        _1535 = _1597;
        _1539 = _1577;
        _1543 = _1581;
    }
    float _1599 = _1549;
    float _1601 = _1533;
    float _1603 = _1535;
    float _1605 = _1539;
    float _1607 = _1543;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1611 = !_539;
    float _1613 = _1611 ? _529 : as_type<float>(_1521);
    float _1615 = _529 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1617 = !_547;
    float _1619 = _1617 ? _529 : as_type<float>(_1525);
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1623 = _1599 + _1621;
    float _1625 = -_1497;
    float _1627 = _1625 + 0.5;
    float _1629 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1631 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1469);
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1635 = fma(_1623, _1623, _1601);
    float _1637 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1473);
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1635 + _1603;
    float _1643 = _1613 + 0.5;
    float _1645 = _1639 * _1609;
    float _1647 = -_1491;
    float _1649 = _1647 + 0.5;
    float _1651 = _1619 + 0.5;
    float _1653 = fma(_1615, _1493, _1509);
    float _1655 = sqrt(_1641);
    float _1657 = fma(_1615, _1517, _1513);
    float _1659 = fma(_1615, _1515, _1511);
    float _1661 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1665 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1673 = _1629 + _1653;
    float _1675 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1677 = _1661 * _1485;
    float _1679 = _1663 * _1505;
    float _1681 = _1665 * _1633;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1685 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1687 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1689 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1691 = _1631 + _1659;
    float _1693 = _1637 + _1657;
    out.m_66.w = _1683;
    bool _1695 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1697 = isnan(_1655);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1703 = _1699 || _1701;
    out.m_68.x = _1677;
    out.m_68.y = _1679;
    out.m_68.z = _1681;
    out.m_68.w = _1645;
    out.m_70.x = _1685;
    out.m_70.y = _1687;
    out.m_70.z = _1689;
    out.m_70.w = _1675;
    out.m_72.x = _1403;
    float _1705 = _1661;
    float _1707 = _1657;
    if (!_1703)
    {
        _1705 = 1.0;
    }
    float _1709 = _1705;
    out.m_74.x = _1673;
    out.m_74.y = _1691;
    out.m_74.z = _1693;
    bool _1711 = !_1703;
    float _1713 = _1709;
    if (!_1711)
    {
        bool _1715 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1717 = isnan(_1655);
        bool _1719 = _1715 || _1717;
        bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1723 = _1719 || _1721;
        if (!_1723)
        {
            float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1727 = _1655 + _1725;
            float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1731 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1729;
            float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1735 = _1733 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1737 = 1.0 / _1731;
            float _1739 = _1727 * _1737;
            float _1741 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1713 = _1741;
            _1743 = true;
        }
        else
        {
            bool _1745 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1747 = isnan(_1655);
            bool _1749 = _1745 || _1747;
            bool _1751 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1753 = _1749 || _1751;
            if (!_1753)
            {
                float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1757 = _1655 + _1755;
                float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1761 = _1759 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1763 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1765 = _1763 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1767 = 1.0 / _1761;
                float _1769 = _1757 * _1767;
                float _1771 = fma(_1769, _1765, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1713 = _1771;
                _1743 = true;
            }
            else
            {
                _1713 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1743 = false;
    float _1773 = _1713;
    float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1777 = _1599 + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1781 = _1605 + _1779;
    float _1783 = _609 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1785 = fma(_1777, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1787 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1789 = _1607 + _1787;
    float _1791 = fma(_1781, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1793 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1783);
    float _1795 = -_609;
    float _1797 = _1795 + _1785;
    float _1799 = fma(_1789, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1801 = -_617;
    float _1803 = _1801 + _1791;
    float _1805 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1793);
    float _1807 = _1797 * _1797;
    float _1809 = -_621;
    float _1811 = _1809 + _1799;
    float _1813 = _609 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1815 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = fma(_1803, _1803, _1807);
    float _1819 = 1.0 / _1815;
    float _1821 = fma(_1811, _1811, _1817);
    float _1823 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1813);
    float _1825 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1823);
    bool _1827 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.5);
    bool _1835 = _1831 || _1833;
    float _1837 = sqrt(_1821);
    float _1839 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1841 = _1839 + _1815;
    float _1843 = _1841 * _1819;
    float _1845 = _1843 * 0.5;
    float _1847 = _1815;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1851 = _1819;
    float _1853 = _1805;
    float _1855 = _1803;
    float _1857 = _1785;
    if (_1835)
    {
        _1847 = 1.0;
    }
    float _1859 = _1847;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1863 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1861);
    bool _1865 = _1837 > 0.0;
    float _1867 = 1.0 / _1863;
    float _1869 = _1859;
    if (!_1865)
    {
        _1849 = _1791;
    }
    float _1871 = _1849;
    float _1873 = _1871;
    if (!_1865)
    {
        _1851 = _1785;
    }
    float _1875 = _1851;
    float _1877 = _1875;
    float _1879 = _1875;
    if (!_1865)
    {
        _1853 = _1799;
    }
    float _1881 = _1853;
    bool _1883 = !_1865;
    float _1885 = _1881;
    float _1887 = _1881;
    if (!_1883)
    {
        float _1889 = _183 * _183;
        float _1891 = rsqrt(_1821);
        float _1893 = fma(_181, _181, _1889);
        float _1895 = fma(_185, _185, _1893);
        float _1897 = sqrt(_1895);
        float _1899 = _1797 * _1891;
        float _1901 = _1803 * _1891;
        float _1903 = _1811 * _1891;
        bool _1905 = _1897 > 0.0;
        float _1907 = _1897;
        _1855 = _1901;
        if (!_1905)
        {
            _1907 = _1791;
        }
        float _1909 = _1907;
        _1873 = _1909;
        if (!_1905)
        {
            _1877 = _1785;
        }
        float _1911 = _1877;
        _1879 = _1911;
        if (!_1905)
        {
            _1885 = _1799;
        }
        float _1913 = _1885;
        bool _1915 = !_1905;
        _1887 = _1913;
        if (!_1915)
        {
            float _1917 = rsqrt(_1895);
            float _1919 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1921 = _183 * _1917;
            float _1923 = _181 * _1917;
            float _1925 = _1899 * _1921;
            float _1927 = _185 * _1917;
            float _1929 = fma(_1901, _1923, _1925);
            float _1931 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1933 = fma(_1903, _1927, _1929);
            float _1935 = _1933 * _1931;
            float _1937 = fma(_181, _1935, _1791);
            float _1939 = fma(_183, _1935, _1785);
            float _1941 = fma(_185, _1935, _1799);
            _1879 = _1939;
            _1873 = _1937;
            _1887 = _1941;
        }
    }
    float _1943 = _1879;
    float _1945 = _1873;
    float _1947 = _1887;
    float _1949 = _1855;
    if (_1835)
    {
        _189 = 1.0;
    }
    float _1951 = _189;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1955 = _1867 * _1953;
    float _1957 = _1951;
    if (!_1835)
    {
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1961 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1961 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = 1.0 / _1965;
        float _1977 = _1969 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        float _1981 = _1973 * _1975;
        float _1983 = _1969 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = _1979 * _1981;
        float _1989 = 1.0 / _1987;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1993 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1991;
        float _1995 = 1.0 / _1993;
        float _1997 = _1985 * _1989;
        float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2001 = fma(_1955, _1997, _1999);
        float _2003 = _2001 * _1995;
        float _2005 = precise::clamp(_2003, 0.0, 1.0);
        _1857 = _1969;
        _1869 = _2005;
    }
    float _2007 = _1857;
    float _2009 = _1869;
    float _2011 = _2007;
    if (!_1835)
    {
        float _2013 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = _2023 * 6.283185482025146484375;
        float _2039 = sin(_2037);
        float _2041 = _2033 * _2035;
        float _2043 = 1.0 / _2041;
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2045;
        float _2049 = 1.0 / _2047;
        float _2051 = _2039 * _2043;
        float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2055 = fma(_1955, _2051, _2053);
        float _2057 = _2055 * _2049;
        float _2059 = precise::clamp(_2057, 0.0, 1.0);
        float _2061 = -_2059;
        float _2063 = _2061 + 1.0;
        _1957 = _2063;
    }
    float _2065 = _1957;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2069 = _1943 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2073 = _1945 + _2071;
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2077 = _1947 + _2075;
    float _2079 = _2069 * _2069;
    float _2081 = fma(_2073, _2073, _2079);
    float _2083 = fma(_2077, _2077, _2081);
    float _2085 = rsqrt(_2083);
    float _2087 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2089 = _2073 * _2087;
    float _2091 = _2077 * _2087;
    float _2093 = _2089 * _2089;
    float _2095 = _2091 * _2091;
    float _2097 = _2093 + _2095;
    float _2099 = sqrt(_2097);
    bool _2101 = _2099 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2105 = _2099 + _2103;
    float _2107 = _1655;
    float _2109 = _2085;
    float _2111 = _2105;
    float _2113 = _2069;
    float _2115 = _2089;
    if (_2101)
    {
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2107 = _2117;
    }
    float _2119 = _2107;
    if (_2101)
    {
        float _2121 = rsqrt(_2097);
        _2109 = _2121;
    }
    float _2123 = _2109;
    if (_2101)
    {
        float _2125 = _2105 * _2119;
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (_2101)
    {
        float _2129 = _2127 * 0.15915493667125701904296875;
        _2011 = _2129;
    }
    float _2131 = _2011;
    float _2133 = _2077;
    float _2135 = _2131;
    if (_2101)
    {
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        _2133 = _2139;
    }
    float _2141 = _2133;
    float _2143 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2145 = precise::max(0.0, _2143);
    float _2147 = _1949;
    if (_2101)
    {
        float _2149 = _2131 * 6.283185482025146484375;
        float _2151 = cos(_2149);
        _2147 = _2151;
    }
    float _2153 = _2147;
    float _2155 = -_2087;
    float _2157 = -_2145;
    float _2159 = fma(_2069, _2155, _2157);
    if (_2101)
    {
        float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2113 = _2161;
    }
    float _2163 = _2113;
    float _2165 = _2163;
    if (!_2101)
    {
        _2135 = _2159;
    }
    float _2167 = _2135;
    float _2169 = fma(_617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2171 = _2141;
    float _2173 = _2167;
    if (_2101)
    {
        float _2175 = fma(_2141, _2163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2165 = _2175;
    }
    float _2177 = _2165;
    float _2179 = _2177;
    if (!_2101)
    {
        _2171 = _2091;
    }
    float _2181 = _2171;
    float _2183 = _2181;
    if (_2101)
    {
        float _2185 = _2153 + (-1.0);
        _625 = _2185;
    }
    float _2187 = _625;
    float _2189 = _2187;
    if (_2101)
    {
        float _2191 = _2123 * _2177;
        _1707 = _2191;
    }
    float _2193 = _1707;
    float _2195 = sqrt(_2083);
    if (_2101)
    {
        float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2179 = _2197;
    }
    float _2199 = _2179;
    float _2201 = _2199;
    if (_2101)
    {
        float _2203 = _2089 * _2193;
        _2115 = _2203;
    }
    float _2205 = _2115;
    if (!_2101)
    {
        _2189 = _2093;
    }
    float _2207 = _2189;
    float _2209 = _2207;
    if (_2101)
    {
        float _2211 = _2091 * _2193;
        _2183 = _2211;
    }
    float _2213 = _2183;
    if (_2101)
    {
        float _2215 = fma(_2159, _2153, _2199);
        _2173 = _2215;
    }
    float _2217 = _2173;
    if (_2101)
    {
        float _2219 = _2205 * _2205;
        _2209 = _2219;
    }
    float _2221 = _2209;
    float _2223 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2101)
    {
        _2201 = _2095;
    }
    float _2225 = _2201;
    float _2227 = _2225;
    if (_2101)
    {
        float _2229 = _2213 * _2213;
        _2227 = _2229;
    }
    float _2231 = _2227;
    float _2233 = fma(_2217, _2217, _2221);
    float _2235 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2237 = _2233 + _2231;
    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2241 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2239);
    float _2243 = precise::clamp(_2241, 0.0, 1.0);
    float _2245 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2235);
    float _2247 = rsqrt(_2237);
    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2251 = fma(_621, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2253 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2255 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2257 = -_2243;
    float _2259 = _2257 + 1.0;
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2263 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2255);
    float _2265 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2267 = floor(_2169);
    float _2269 = -_2261;
    float _2271 = fma(_2269, _2249, 1.0);
    float _2273 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2275 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2263);
    float _2277 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2265);
    float _2279 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2273);
    float _2281 = _2247 * _2205;
    float _2283 = _2247 * _2217;
    float _2285 = abs(_2259);
    float _2287 = log2(_2285);
    float _2289 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2279);
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2293 = _2247 * _2213;
    float _2295 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2297 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2299 = -_2291;
    float _2301 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2299);
    float _2303 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2277);
    float _2305 = floor(_2251);
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2309 = -_2293;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2301);
    float _2313 = -_2267;
    float _2315 = _2169 + _2313;
    float _2317 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2319 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2307);
    float _2321 = fma(_2311, -0.5, 0.5);
    float _2323 = log2(_2271);
    float _2325 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2319);
    float _2327 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2329 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2317);
    float _2331 = exp2(_2327);
    float _2333 = _2303 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2335 = -_2305;
    float _2337 = _2251 + _2335;
    float _2339 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2325);
    float _2341 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2343 = sqrt(_2321);
    float _2345 = fma(_2311, 0.5, 0.5);
    float _2347 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2341);
    float _2349 = _2283 + 1.0;
    float _2351 = _2323 * 0.693147182464599609375;
    float _2353 = fma(_2345, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2355 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2347);
    float _2357 = 1.0 / _2339;
    float _2359 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2329);
    float _2361 = fma(_2345, _2353, -0.212114393711090087890625);
    float _2363 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2355);
    float2 _6587 = float2(_2315, _2337);
    float _2365 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6587, float2(0.0), isnan(_6587)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6587, float2(0.0), isnan(_6587)), level(0.0)).x;
    float _2367 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2359);
    float _2369 = fma(_2345, _2361, 1.570728778839111328125);
    float _2371 = -_2283;
    float _2373 = fma(_2331, _2349, _2371);
    float _2375 = _2343 * 0.636619746685028076171875;
    float _2377 = -_2369;
    float _2379 = fma(_2375, _2377, 1.0);
    float _2381 = fma(_2373, 0.5, 0.5);
    float _2383 = _2367 * _2357;
    float _2385 = _2363 * _2357;
    float _2387 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2389 = fma(_2383, 0.5, 0.5);
    float _2391 = fma(_2385, -0.5, 0.5);
    float3 _6637 = float3(_2389, _2391, _2387);
    float _2393 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6637, float3(0.0), isnan(_6637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6637, float3(0.0), isnan(_6637)), level(0.0)).x;
    float3 _6648 = float3(_2389, _2391, _2387);
    float4 _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6648, float3(0.0), isnan(_6648)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6648, float3(0.0), isnan(_6648)), level(0.0)).xyzw;
    float _2398 = _2396.x;
    float _2400 = _2396.y;
    float _2402 = _2396.z;
    float _2404 = _2396.w;
    float2 _6664 = float2(_2379, _2381);
    float3 _2408 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6664, float2(0.0), isnan(_6664)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6664, float2(0.0), isnan(_6664)), level(0.0)).xyz;
    float _2410 = _2408.x;
    float _2412 = _2408.y;
    float _2414 = _2408.z;
    float _2416 = abs(_1955);
    float _2418 = log2(_2416);
    float _2420 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2422 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2424 = isnan(_2195);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2430 = _2426 || _2428;
    float _2432 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2420);
    bool _2434 = _1955 <= 8000.0;
    bool _2436 = isnan(_1955);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(8000.0);
    bool _2442 = _2438 || _2440;
    float _2444 = float(_2442);
    float _2446 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2448 = exp2(_2446);
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = fma(_2452, -2.0, 3.0);
    float _2456 = _2452 * _2452;
    float _2458 = _2456 * _2454;
    float _2460 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2462 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2432);
    float _2464 = in.m_76.x;
    float _2466 = -_2458;
    float _2468 = _2466 + 1.0;
    float _2470 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2462);
    float _2472 = exp2(_2460);
    float _2474 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2458);
    float _2476 = _2470 + _2339;
    out.gl_Position.x = _2367;
    out.gl_Position.y = _2363;
    out.gl_Position.z = _2470;
    out.gl_Position.w = _2339;
    float _2478 = _2444 * _2474;
    float _2480 = _2476 * 0.5;
    float _2482 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.z = _2480;
    out.m_78.w = _2339;
    float _2484 = -_2472;
    float _2486 = _2484 + 1.0;
    float _2488 = _2339;
    float _2490 = _2470;
    float _2492 = _2363;
    float _2494 = _2367;
    if (!_2430)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2496 = _2488;
    float _2498 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2430)
    {
        _2490 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2504 = _2490;
    float _2506 = _2504;
    float _2508 = _2504;
    if (!_2430)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2510 = _2492;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2430)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2516 = _2494;
    float _2518 = -_2365;
    float _2520 = _2518 + 1.0;
    float _2522 = _2520 * _2482;
    float _2524 = precise::clamp(_2522, 0.0, 1.0);
    float _2526 = -_2524;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2530 = _2528 * _2464;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2534 = _2498 * _2393;
    float _2536 = -_2498;
    float _2538 = _2536 + 1.0;
    out.m_80.x = _2532;
    float _2540 = _2404 * _2534;
    float _2542 = _2414 * _2534;
    float _2544 = _2404 * _2538;
    float _2546 = fma(_2410, _2540, _2398);
    float _2548 = fma(_2412, _2540, _2400);
    float _2550 = fma(_2404, _2542, _2402);
    float _2552 = _2009 * _2065;
    float _2554 = _2398;
    float _2556 = _2552;
    float _2558 = _2516;
    float _2560 = _2516;
    if (!_2430)
    {
        _2554 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2562 = _2554;
    out.m_82.x = _2546;
    out.m_82.y = _2548;
    out.m_82.z = _2550;
    out.m_82.w = _2544;
    float _2564 = _2552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2566 = _2562;
    float _2568 = _2562;
    if (!_2430)
    {
        _2556 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2570 = _2556;
    bool _2572 = !_2430;
    float _2574 = _2570;
    float _2576 = _2570;
    if (!_2572)
    {
        bool _2578 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2580 = isnan(_2195);
        bool _2582 = _2578 || _2580;
        bool _2584 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2586 = _2582 || _2584;
        if (!_2586)
        {
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2590 = _2195 + _2588;
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2594 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2592;
            float _2596 = 1.0 / _2594;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2618 = _2590 * _2596;
            float _2620 = precise::clamp(_2618, 0.0, 1.0);
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2626 = fma(_2620, _2600, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2628 = fma(_2620, _2624, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2630 = fma(_2620, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2632 = fma(_2620, _2608, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2634 = fma(_2620, _2612, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2636 = fma(_2620, _2616, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2502 = _2628;
            _2560 = _2634;
            _2568 = _2626;
            _2514 = _2632;
            _2508 = _2630;
            _2576 = _2636;
            _2638 = true;
        }
        else
        {
            bool _2640 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2642 = isnan(_2195);
            bool _2644 = _2640 || _2642;
            bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2648 = _2644 || _2646;
            if (!_2648)
            {
                _2566 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2650 = _2566;
            _2568 = _2650;
            if (!_2648)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2652 = _2500;
            _2502 = _2652;
            if (!_2648)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2654 = _2506;
            _2508 = _2654;
            if (!_2648)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2656 = _2512;
            _2514 = _2656;
            if (!_2648)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2658 = _2558;
            _2560 = _2658;
            if (!_2648)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2660 = _2574;
            bool _2662 = !_2648;
            _2576 = _2660;
            if (!_2662)
            {
                bool _2664 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2666 = isnan(_2195);
                bool _2668 = _2664 || _2666;
                bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2672 = _2668 || _2670;
                if (!_2672)
                {
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2676 = _2195 + _2674;
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2680 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2678;
                    float _2682 = 1.0 / _2680;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2704 = _2676 * _2682;
                    float _2706 = precise::clamp(_2704, 0.0, 1.0);
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2712 = fma(_2706, _2686, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2714 = fma(_2706, _2710, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2716 = fma(_2706, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2718 = fma(_2706, _2694, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2720 = fma(_2706, _2698, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2722 = fma(_2706, _2702, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2502 = _2714;
                    _2560 = _2720;
                    _2568 = _2712;
                    _2514 = _2718;
                    _2508 = _2716;
                    _2576 = _2722;
                    _2638 = true;
                }
                else
                {
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2568 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2638 = false;
    float _2724 = _2502;
    float _2726 = _2560;
    float _2728 = _2568;
    float _2730 = _2514;
    float _2732 = _2508;
    float _2734 = _2576;
    float _2736 = fma(_1691, -0.5, 0.5);
    float _2738 = precise::clamp(_2736, 0.0, 1.0);
    float _2740 = -_2724;
    float _2742 = _2740 + _2726;
    float _2744 = _2564 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2746 = -_2728;
    float _2748 = _2746 + _2730;
    float _2750 = fma(_2738, _2742, _2724);
    out.m_84.x = 0.0;
    float _2752 = -_2732;
    float _2754 = _2752 + _2734;
    float _2756 = fma(_2738, _2748, _2728);
    float _2758 = _2750 * 0.586610972881317138671875;
    out.m_51.x = _2744;
    bool _2760 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2762 = fma(_2738, _2754, _2732);
    float _2764 = fma(_2756, 0.298911988735198974609375, _2758);
    bool _2766 = _2009 > 0.0;
    bool _2768 = isnan(_2009);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(0.0);
    bool _2774 = _2770 || _2772;
    float _2776 = fma(_2762, 0.114477999508380889892578125, _2764);
    bool _2778 = _2065 <= 0.0;
    bool _2780 = !_2774;
    bool _2782 = _2778 || _2780;
    float _2784 = -_2776;
    float _2786 = _2756 + _2784;
    float _2788 = -_2776;
    float _2790 = _2750 + _2788;
    float _2792 = -_2776;
    float _2794 = _2762 + _2792;
    float _2796 = fma(_2786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    float _2800 = fma(_2794, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    bool _2802 = !_2760;
    if (!_2802)
    {
        float _2804 = -_1943;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2808 = -_1945;
        float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2812 = -_1947;
        float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2816 = _2806 * _2806;
        float _2818 = fma(_2810, _2810, _2816);
        float _2820 = fma(_2814, _2814, _2818);
        float _2822 = sqrt(_2820);
        float _2824 = rsqrt(_2820);
        float _2826 = -_2822;
        float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2832 = precise::clamp(_2830, 0.0, 1.0);
        float _2834 = _2810 * _2824;
        float _2836 = _2806 * _2824;
        float _2838 = abs(_2832);
        float _2840 = log2(_2838);
        float _2842 = _2814 * _2824;
        float _2844 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2846 = _1691 * _2836;
        float _2848 = -_2836;
        float _2850 = -_2844;
        float _2852 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2850);
        float _2854 = fma(_1673, _2834, _2846);
        float _2856 = -_2842;
        float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2852);
        float _2860 = fma(_1693, _2842, _2854);
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2866 = _2858 + _2864;
        float _2868 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2870 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = exp2(_2868);
        float _2876 = _2874 * _2872;
        float _2878 = _2862 * _2876;
        float _2880 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2880;
        out.m_84.y = _2882;
        out.m_84.z = _2884;
    }
    out.m_86.x = _2796;
    out.m_86.y = _2798;
    out.m_86.z = _2800;
    if (!_2782)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2886;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2638 = false;
    bool _1743 = false;
    bool _305 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2942 = as_type<float>(_119);
        out.gl_Position.z = _2942;
    }
    if (!_109)
    {
        return out;
    }
    float _123 = in.m_53.w;
    float _125 = float(_105);
    float _127 = -_123;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_123);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    bool _141 = _129 >= _125;
    bool _143 = !_139;
    bool _145 = _141 || _143;
    float _147 = _123;
    float _149 = _129;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _147;
    if (_145)
    {
        out.m_51.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _121 = as_type<int>(_153);
    }
    int _155 = _121;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3007 = as_type<float>(_155);
        out.gl_Position.z = _3007;
    }
    if (_145)
    {
        return out;
    }
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    float _163 = 1.0 / _125;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _129 * _163;
    float _169 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_165;
    float _189 = _183;
    float _207;
    if (!_187)
    {
        float _191 = in.m_57.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        _207 = _167;
    }
    _209 = false;
    float _211 = _207;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    float _303;
    if (!_285)
    {
        float _287 = in.m_57.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _167;
    }
    _305 = false;
    float _307 = _303;
    float _309 = in.m_57.x;
    float _311 = in.m_57.y;
    float _313 = in.m_57.z;
    float _315 = in.m_57.w;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = as_type<float>(int(gl_VertexIndex));
    float _323 = in.m_62.x;
    float _325 = in.m_62.y;
    float _327 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _329 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _347 = _313 * 2.0;
    float _349 = _309 * 2.0;
    float _351 = _311 * 2.0;
    float _353 = 1.0 / _333;
    int _355 = as_type<int>(_321) & 1;
    bool _357 = _355 != 0;
    int _359 = as_type<int>(_321) & 2;
    bool _361 = _359 != 0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _367 = _315 > 0.5;
    float _369 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _371 = _281 * _323;
    float _373 = _283 * _325;
    float _375 = floor(_347);
    bool _377 = !_361;
    float _379 = _377 ? (-0.5) : 0.5;
    float _381 = _311 + _313;
    float _383 = _313 + _309;
    float _385 = _309 + (-0.5);
    float _387 = floor(_349);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _393 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _369);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _399 = _381 + (-1.0);
    float _401 = floor(_351);
    bool _403 = _375 > 0.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _409 = _375 >= 0.0;
    bool _411 = isnan(_375);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _419;
    float _423 = _383 + (-1.0);
    int _425 = _417 ? 0 : 1;
    float _427 = 1.0 / _337;
    bool _429 = _387 > 0.0;
    float _431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _379);
    bool _433 = _387 >= 0.0;
    bool _435 = isnan(_387);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    int _443 = _441 ? 0 : 1;
    float _445 = 1.0 / _341;
    bool _447 = _401 >= 0.0;
    bool _449 = isnan(_401);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    bool _457 = _401 > 0.0;
    int _459 = ~_425;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    int _465 = ~_443;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = 1.0 / _345;
    int _473 = _455 ? 0 : 1;
    int _475 = _463;
    int _477 = _469;
    if (!_403)
    {
        int _479 = ~_425;
        int _481 = _479 + 1;
        _475 = _481;
    }
    int _483 = _475;
    float _485 = _319 * _129;
    if (!_429)
    {
        int _487 = ~_443;
        int _489 = _487 + 1;
        _477 = _489;
    }
    int _491 = _477;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _503 = _501 != 0;
    float _505 = exp2(_485);
    float _507 = in.m_48.x;
    float _509 = in.m_48.y;
    float _511 = in.m_48.z;
    int _513 = ~_473;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    int _519 = _517;
    if (!_457)
    {
        int _521 = ~_473;
        int _523 = _521 + 1;
        _519 = _523;
    }
    int _525 = _519;
    bool _527 = !_357;
    float _529 = _527 ? (-0.5) : 0.5;
    float _531 = 1.0 / _391;
    bool _533 = !_495;
    int _535 = _533 ? 0 : 1;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _547 = _545 != 0;
    float _549 = -_505;
    float _551 = _549 + 1.0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _555 = _553 != 0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _559 = 1.0 + _557;
    bool _561 = !_499;
    int _563 = _561 ? 0 : 1;
    float _565 = 1.0 / _365;
    bool _567 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _575 = _571 || _573;
    float _577 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _579 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _581 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _583 = _575 ? _551 : 0.0;
    float _585 = 1.0 / _559;
    float _587 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].x, _577);
    bool _589 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(1.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].x, _581);
    float _601 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].x, _579);
    float _603 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _587);
    float _605 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _599);
    float _607 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _601);
    float _609 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _611 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _329);
    bool _613 = !_503;
    int _615 = _613 ? 0 : 1;
    float _617 = _607 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _621 = _605 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _623 = _313 + (-0.5);
    float _625 = _617;
    if (_597)
    {
        float _627 = _583 * _585;
        _149 = _627;
    }
    float _629 = _149;
    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _619);
    bool _633 = _313 > 0.5;
    float _635 = _311 + _309;
    float _637 = _311 + (-0.5);
    float _639 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[0].z, _631);
    float _641 = _611 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _643 = -_379;
    int _645 = _367 ? as_type<int>(_643) : as_type<int>(_379);
    float _647 = 1.0 / _397;
    float _649 = _639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _651 = _309 > 0.5;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _657 = _635 + (-1.0);
    bool _659 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _661 = isnan(_307);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _649 >= _641;
    bool _673 = isnan(_649);
    bool _675 = _671 || _673;
    bool _677 = isnan(_641);
    bool _679 = _675 || _677;
    float _681 = 1.0 / _407;
    bool _683 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _685 = isnan(_167);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -_649;
    float _697 = _641 + _695;
    bool _699 = !_679;
    float _701 = _699 ? 1.0 : (-1.0);
    bool _703 = _311 > 0.5;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _713 = 1.0 / _655;
    float _715 = float(_525);
    float _717 = _707 * _353;
    float _719 = _711 * _427;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _725 = _421 * _445;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _735 = _723 * _471;
    float _737 = _729 * _531;
    float _739 = _733 * _565;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _749 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _751;
    float _755 = _743 * _647;
    float _757 = _747 * _713;
    float _759 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _761 = _753 * _681;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _307 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _769 = _307 + _767;
    float _771 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _393);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _775 = _167 + _773;
    float _777 = fma(_717, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _779 = fma(_719, _769, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _783 = _167 + _781;
    float _785 = fma(_725, _775, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _787 = abs(_535);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _791 = _167 + _789;
    float _793 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _795 = fma(_735, _783, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _797 = float(_787);
    float _799 = in.m_64.x;
    float _801 = in.m_64.y;
    float _803 = in.m_64.z;
    float _805 = float(_483);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _809 = _167 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _813 = _167 + _811;
    float _815 = fma(_737, _791, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _819 = _167 + _817;
    float _821 = fma(_755, _809, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _823 = _797 * _805;
    int _825 = abs(_563);
    float _827 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _829 = fma(_757, _813, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _831 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _835 = _167 + _833;
    float _837 = _823 * (-2.0);
    float _839 = fma(_739, _819, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _841 = float(_491);
    float _843 = _831 * _431;
    float _845 = float(_825);
    float _847 = fma(_761, _835, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _849 = fma(_793, _837, _793);
    bool _851 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _853 = isnan(_167);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _529);
    float _865 = _845 * _841;
    bool _867 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _869 = isnan(_307);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_837, _799, _799);
    bool _881 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _883 = isnan(_167);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = rsqrt(_771);
    float _895 = _865 * (-2.0);
    float _897 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[196].x, _879);
    bool _899 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _901 = isnan(_167);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_891;
    float _913 = _911 + 1.0;
    float _915 = fma(_749, _895, _749);
    float _917 = fma(_849, _629, _897);
    float _919 = fma(_895, _801, _801);
    float _921 = _909 * _913;
    float _923 = -_909;
    float _925 = _923 + 1.0;
    bool _927 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _929 = isnan(_167);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = -_861;
    float _941 = _939 + 1.0;
    bool _943 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _945 = isnan(_307);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = _861 * _925;
    bool _957 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _959 = isnan(_167);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -_937;
    float _971 = _969 + 1.0;
    float _973 = _937 * _941;
    float _975 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _977 = _967 * _971;
    float _979 = -_967;
    float _981 = _979 + 1.0;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _983;
    float _987 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _989 = _975 * _975;
    float _991 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _993 = -_953;
    float _995 = _993 + 1.0;
    bool _997 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _999 = isnan(_167);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = fma(_987, _987, _989);
    float _1011 = _693 * _981;
    float _1013 = -_693;
    float _1015 = _1013 + 1.0;
    float _1017 = _669 * _995;
    float _1019 = fma(_991, _991, _1009);
    int _1021 = abs(_615);
    float _1023 = _827 * _863;
    float _1025 = -_669;
    float _1027 = _1025 + 1.0;
    bool _1029 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1031 = isnan(_167);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _1007 * _1015;
    float _1043 = -_1007;
    float _1045 = _1043 + 1.0;
    float _1047 = float(_1021);
    float _1049 = _877 * _1027;
    float _1051 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[196].y, _919);
    float _1053 = _1039 * _1045;
    float _1055 = -_1039;
    float _1057 = _1055 + 1.0;
    float _1059 = _1047 * _715;
    float _1061 = _777 * _1049;
    float _1063 = _785 * _1053;
    float _1065 = -_877;
    float _1067 = _1065 + 1.0;
    float _1069 = _1059 * (-2.0);
    float _1071 = fma(_915, _629, _1051);
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1063);
    float _1075 = 1.0 / _985;
    float _1077 = fma(_1069, _803, _803);
    float _1079 = fma(_759, _1069, _759);
    float _1081 = fma(_795, _1041, _1073);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1061);
    float _1085 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1077);
    float _1087 = -_609;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = fma(_815, _1011, _1081);
    float _1093 = _917 * 0.15915493667125701904296875;
    float _1095 = fma(_1079, _629, _1085);
    float _1097 = -_617;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1101 = _1089 * _1089;
    float _1103 = _1071 * 0.15915493667125701904296875;
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = abs(_697);
    float _1109 = precise::max(_1107, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1111 = fma(_779, _1017, _1083);
    float _1113 = fma(_1099, _1099, _1101);
    float _1115 = rsqrt(_1019);
    float _1117 = -_621;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1123 = fma(_839, _977, _1091);
    float _1125 = fma(_1119, _1119, _1113);
    float _1127 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1111);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1131 = _1121 + _1129;
    float _1133 = _1093 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1141 = fma(_821, _973, _1123);
    float _1143 = _1131 * _1075;
    float _1145 = fma(_167, _1139, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1147 = fma(_829, _955, _1141);
    float _1149 = _701 * _1143;
    float _1151 = _1093 * 6.283185482025146484375;
    float _1153 = cos(_1151);
    float _1155 = _991 * _1115;
    float _1157 = _167 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1159 = _987 * _1115;
    float _1161 = _975 * _1115;
    float _1163 = _609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1165 = fma(_847, _921, _1147);
    float _1167 = _1103 * 6.283185482025146484375;
    float _1169 = sin(_1167);
    float _1171 = _1103 * 6.283185482025146484375;
    float _1173 = cos(_1171);
    float _1175 = _1105 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    float _1179 = _1135 * _1169;
    float _1181 = _1153 * _1169;
    float _1183 = _1105 * 6.283185482025146484375;
    float _1185 = sin(_1183);
    float _1187 = _1153 * _1173;
    float _1189 = _1135 * _1173;
    float _1191 = _1153 * _1177;
    float _1193 = _1135 * _1177;
    float _1195 = _1173 * _1177;
    float _1197 = _1169 * _1177;
    float _1199 = _1191 * _843;
    float _1201 = _1157 * _1149;
    float _1203 = _1193 * _843;
    float _1205 = sqrt(_1125);
    float _1207 = fma(_1185, _1187, _1179);
    float _1209 = -_1181;
    float _1211 = fma(_1185, _1189, _1209);
    float _1213 = -_1189;
    float _1215 = fma(_1185, _1181, _1213);
    float _1217 = -_843;
    float _1219 = _1185 * _1217;
    float _1221 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = fma(_1207, _1023, _1199);
    float _1225 = fma(_1185, _1179, _1187);
    float _1227 = fma(_1195, _1023, _1219);
    float _1229 = fma(_1211, _1023, _1203);
    float _1231 = fma(_1215, _1221, _1223);
    float _1233 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1163);
    float _1235 = fma(_1197, _1221, _1227);
    float _1237 = fma(_1225, _1221, _1229);
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1245 = _1201 * 0.15915493667125701904296875;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1243);
    float _1253 = abs(_1205);
    float _1255 = precise::max(0.0, _1253);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1247);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1249);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1251);
    float _1263 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1233);
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1269 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1271 = _1245 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = _609 + _1265;
    float _1277 = _617 + _1267;
    float _1279 = _621 + _1269;
    float _1281 = precise::min(_1255, 40.0);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1289 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1287);
    float _1297 = fma(_1281, -0.02500000037252902984619140625, 1.0);
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1291);
    float _1301 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1293);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1295);
    float _1305 = -_1273;
    float _1307 = _1305 + 1.0;
    float _1309 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = _1245 * 6.283185482025146484375;
    float _1313 = sin(_1311);
    float _1315 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1317 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = -_1309;
    float _1321 = _1319 + _1289;
    float _1323 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1325 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1329 = fma(_1297, _1321, _1309);
    float _1331 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1325);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1327);
    float _1337 = _1159 * _1307;
    float _1339 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1333);
    float _1343 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1335);
    float _1345 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1347 = _1155 * _1313;
    float _1349 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1353 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1331);
    float _1355 = -_1347;
    float _1357 = fma(_1161, _1337, _1355);
    float _1359 = -_609;
    float _1361 = _1359 + _1349;
    float _1363 = fma(_1159, _1337, _1273);
    float _1365 = -_617;
    float _1367 = _1365 + _1351;
    float _1369 = _1159 * _1313;
    float _1371 = _1357 * _1361;
    float _1373 = _1161 * _1307;
    float _1375 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1353);
    float _1377 = _1161 * _1313;
    float _1379 = fma(_1363, _1367, _1371);
    float _1381 = fma(_1155, _1373, _1369);
    float _1383 = _1155 * _1155;
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1387 = -_1377;
    float _1389 = fma(_1155, _1337, _1387);
    float _1391 = _1381 * _1361;
    float _1393 = fma(_1155, _1337, _1377);
    float _1395 = -_621;
    float _1397 = _1395 + _1385;
    float _1399 = fma(_1307, _1383, _1273);
    float _1401 = fma(_1389, _1367, _1391);
    float _1403 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1165);
    float _1405 = fma(_1393, _1397, _1379);
    float _1407 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1409 = fma(_1399, _1397, _1401);
    float _1411 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1413 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = -_1185;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1407);
    float _1419 = fma(_1405, _1145, _617);
    float _1421 = fma(_1409, _1145, _621);
    float _1423 = -_1185;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1411);
    float _1427 = -_1185;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1431 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1417);
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1435 = _1419 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1439 = _1421 + _1437;
    float _1441 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1425);
    float _1443 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1445 = _1435 * _1435;
    float _1447 = _1439 * _1439;
    float _1449 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1451 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1453 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1455 = _1445 + _1447;
    float _1457 = fma(_1161, _1373, _1273);
    float _1459 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1449);
    float _1461 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1339);
    float _1463 = sqrt(_1455);
    float _1465 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1323);
    float _1467 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1345);
    float _1469 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1451);
    float _1471 = fma(_1161, _1337, _1347);
    float _1473 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1453);
    float _1475 = _1457 * _1361;
    float _1477 = -_379;
    int _1479 = _703 ? as_type<int>(_1477) : as_type<int>(_379);
    float _1481 = -_1369;
    float _1483 = fma(_1155, _1373, _1481);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1487 = fma(_1471, _1367, _1475);
    bool _1489 = !_543;
    float _1491 = _1489 ? _379 : as_type<float>(_1479);
    float _1493 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1459);
    bool _1495 = !_555;
    float _1497 = _1495 ? _379 : as_type<float>(_645);
    float _1499 = fma(_1483, _1397, _1487);
    float _1501 = _379 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1503 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1507 = _609 + _1499;
    float _1509 = _1501 * _1431;
    float _1511 = _1501 * _1441;
    float _1513 = _1501 * _1443;
    float _1515 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1461);
    float _1517 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1519 = -_529;
    int _1521 = _651 ? as_type<int>(_1519) : as_type<int>(_529);
    float _1523 = -_529;
    int _1525 = _633 ? as_type<int>(_1523) : as_type<int>(_529);
    float _1527 = _1499;
    float _1529 = _1501;
    float _1531 = _1483;
    float _1533 = _1445;
    float _1535 = _1447;
    if (!_1503)
    {
        _1527 = _1419;
    }
    float _1537 = _1527;
    float _1539 = _1537;
    if (!_1503)
    {
        _1529 = _1421;
    }
    float _1541 = _1529;
    float _1543 = _1541;
    if (!_1503)
    {
        _1531 = _1507;
    }
    float _1545 = _1531;
    bool _1547 = !_1503;
    float _1549 = _1545;
    if (!_1547)
    {
        float _1551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1555 = _1463 + _1553;
        float _1557 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = rsqrt(_1455);
        float _1561 = _1555 * _1551;
        float _1563 = _1561 * 0.15915493667125701904296875;
        float _1565 = _1563 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = _1563 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = fma(_1567, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1575 = _1559 * _1573;
        float _1577 = fma(_1435, _1575, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1579 = _1571 + (-1.0);
        float _1581 = fma(_1439, _1575, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1585 = _1577 + _1583;
        float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1591 = _1581 + _1589;
        float _1593 = _1585 * _1585;
        float _1595 = fma(_1507, _1571, _1587);
        float _1597 = _1591 * _1591;
        _1549 = _1595;
        _1533 = _1593;
        _1535 = _1597;
        _1539 = _1577;
        _1543 = _1581;
    }
    float _1599 = _1549;
    float _1601 = _1533;
    float _1603 = _1535;
    float _1605 = _1539;
    float _1607 = _1543;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1611 = !_539;
    float _1613 = _1611 ? _529 : as_type<float>(_1521);
    float _1615 = _529 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1617 = !_547;
    float _1619 = _1617 ? _529 : as_type<float>(_1525);
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1623 = _1599 + _1621;
    float _1625 = -_1497;
    float _1627 = _1625 + 0.5;
    float _1629 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1631 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1469);
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1635 = fma(_1623, _1623, _1601);
    float _1637 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1473);
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1635 + _1603;
    float _1643 = _1613 + 0.5;
    float _1645 = _1639 * _1609;
    float _1647 = -_1491;
    float _1649 = _1647 + 0.5;
    float _1651 = _1619 + 0.5;
    float _1653 = fma(_1615, _1493, _1509);
    float _1655 = sqrt(_1641);
    float _1657 = fma(_1615, _1517, _1513);
    float _1659 = fma(_1615, _1515, _1511);
    float _1661 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1665 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1673 = _1629 + _1653;
    float _1675 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1677 = _1661 * _1485;
    float _1679 = _1663 * _1505;
    float _1681 = _1665 * _1633;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1685 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1687 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1689 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1691 = _1631 + _1659;
    float _1693 = _1637 + _1657;
    out.m_66.w = _1683;
    bool _1695 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1697 = isnan(_1655);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1703 = _1699 || _1701;
    out.m_68.x = _1677;
    out.m_68.y = _1679;
    out.m_68.z = _1681;
    out.m_68.w = _1645;
    out.m_70.x = _1685;
    out.m_70.y = _1687;
    out.m_70.z = _1689;
    out.m_70.w = _1675;
    out.m_72.x = _1403;
    float _1705 = _1661;
    float _1707 = _1657;
    if (!_1703)
    {
        _1705 = 1.0;
    }
    float _1709 = _1705;
    out.m_74.x = _1673;
    out.m_74.y = _1691;
    out.m_74.z = _1693;
    bool _1711 = !_1703;
    float _1713 = _1709;
    if (!_1711)
    {
        bool _1715 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1717 = isnan(_1655);
        bool _1719 = _1715 || _1717;
        bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1723 = _1719 || _1721;
        if (!_1723)
        {
            float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1727 = _1655 + _1725;
            float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1731 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1729;
            float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1735 = _1733 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1737 = 1.0 / _1731;
            float _1739 = _1727 * _1737;
            float _1741 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1713 = _1741;
            _1743 = true;
        }
        else
        {
            bool _1745 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1747 = isnan(_1655);
            bool _1749 = _1745 || _1747;
            bool _1751 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1753 = _1749 || _1751;
            if (!_1753)
            {
                float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1757 = _1655 + _1755;
                float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1761 = _1759 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1763 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1765 = _1763 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1767 = 1.0 / _1761;
                float _1769 = _1757 * _1767;
                float _1771 = fma(_1769, _1765, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1713 = _1771;
                _1743 = true;
            }
            else
            {
                _1713 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1743 = false;
    float _1773 = _1713;
    float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1777 = _1599 + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1781 = _1605 + _1779;
    float _1783 = _609 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1785 = fma(_1777, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1787 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1789 = _1607 + _1787;
    float _1791 = fma(_1781, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1793 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1783);
    float _1795 = -_609;
    float _1797 = _1795 + _1785;
    float _1799 = fma(_1789, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1801 = -_617;
    float _1803 = _1801 + _1791;
    float _1805 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1793);
    float _1807 = _1797 * _1797;
    float _1809 = -_621;
    float _1811 = _1809 + _1799;
    float _1813 = _609 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1815 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = fma(_1803, _1803, _1807);
    float _1819 = 1.0 / _1815;
    float _1821 = fma(_1811, _1811, _1817);
    float _1823 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1813);
    float _1825 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1823);
    bool _1827 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.5);
    bool _1835 = _1831 || _1833;
    float _1837 = sqrt(_1821);
    float _1839 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1841 = _1839 + _1815;
    float _1843 = _1841 * _1819;
    float _1845 = _1843 * 0.5;
    float _1847 = _1815;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1851 = _1819;
    float _1853 = _1805;
    float _1855 = _1803;
    float _1857 = _1785;
    if (_1835)
    {
        _1847 = 1.0;
    }
    float _1859 = _1847;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1863 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1861);
    bool _1865 = _1837 > 0.0;
    float _1867 = 1.0 / _1863;
    float _1869 = _1859;
    if (!_1865)
    {
        _1849 = _1791;
    }
    float _1871 = _1849;
    float _1873 = _1871;
    if (!_1865)
    {
        _1851 = _1785;
    }
    float _1875 = _1851;
    float _1877 = _1875;
    float _1879 = _1875;
    if (!_1865)
    {
        _1853 = _1799;
    }
    float _1881 = _1853;
    bool _1883 = !_1865;
    float _1885 = _1881;
    float _1887 = _1881;
    if (!_1883)
    {
        float _1889 = _183 * _183;
        float _1891 = rsqrt(_1821);
        float _1893 = fma(_181, _181, _1889);
        float _1895 = fma(_185, _185, _1893);
        float _1897 = sqrt(_1895);
        float _1899 = _1797 * _1891;
        float _1901 = _1803 * _1891;
        float _1903 = _1811 * _1891;
        bool _1905 = _1897 > 0.0;
        float _1907 = _1897;
        _1855 = _1901;
        if (!_1905)
        {
            _1907 = _1791;
        }
        float _1909 = _1907;
        _1873 = _1909;
        if (!_1905)
        {
            _1877 = _1785;
        }
        float _1911 = _1877;
        _1879 = _1911;
        if (!_1905)
        {
            _1885 = _1799;
        }
        float _1913 = _1885;
        bool _1915 = !_1905;
        _1887 = _1913;
        if (!_1915)
        {
            float _1917 = rsqrt(_1895);
            float _1919 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1921 = _183 * _1917;
            float _1923 = _181 * _1917;
            float _1925 = _1899 * _1921;
            float _1927 = _185 * _1917;
            float _1929 = fma(_1901, _1923, _1925);
            float _1931 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1933 = fma(_1903, _1927, _1929);
            float _1935 = _1933 * _1931;
            float _1937 = fma(_181, _1935, _1791);
            float _1939 = fma(_183, _1935, _1785);
            float _1941 = fma(_185, _1935, _1799);
            _1879 = _1939;
            _1873 = _1937;
            _1887 = _1941;
        }
    }
    float _1943 = _1879;
    float _1945 = _1873;
    float _1947 = _1887;
    float _1949 = _1855;
    if (_1835)
    {
        _189 = 1.0;
    }
    float _1951 = _189;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1955 = _1867 * _1953;
    float _1957 = _1951;
    if (!_1835)
    {
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1961 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1961 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = 1.0 / _1965;
        float _1977 = _1969 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        float _1981 = _1973 * _1975;
        float _1983 = _1969 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = _1979 * _1981;
        float _1989 = 1.0 / _1987;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1993 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1991;
        float _1995 = 1.0 / _1993;
        float _1997 = _1985 * _1989;
        float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2001 = fma(_1955, _1997, _1999);
        float _2003 = _2001 * _1995;
        float _2005 = precise::clamp(_2003, 0.0, 1.0);
        _1857 = _1969;
        _1869 = _2005;
    }
    float _2007 = _1857;
    float _2009 = _1869;
    float _2011 = _2007;
    if (!_1835)
    {
        float _2013 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = _2023 * 6.283185482025146484375;
        float _2039 = sin(_2037);
        float _2041 = _2033 * _2035;
        float _2043 = 1.0 / _2041;
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2045;
        float _2049 = 1.0 / _2047;
        float _2051 = _2039 * _2043;
        float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2055 = fma(_1955, _2051, _2053);
        float _2057 = _2055 * _2049;
        float _2059 = precise::clamp(_2057, 0.0, 1.0);
        float _2061 = -_2059;
        float _2063 = _2061 + 1.0;
        _1957 = _2063;
    }
    float _2065 = _1957;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2069 = _1943 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2073 = _1945 + _2071;
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2077 = _1947 + _2075;
    float _2079 = _2069 * _2069;
    float _2081 = fma(_2073, _2073, _2079);
    float _2083 = fma(_2077, _2077, _2081);
    float _2085 = rsqrt(_2083);
    float _2087 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2089 = _2073 * _2087;
    float _2091 = _2077 * _2087;
    float _2093 = _2089 * _2089;
    float _2095 = _2091 * _2091;
    float _2097 = _2093 + _2095;
    float _2099 = sqrt(_2097);
    bool _2101 = _2099 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2105 = _2099 + _2103;
    float _2107 = _1655;
    float _2109 = _2085;
    float _2111 = _2105;
    float _2113 = _2069;
    float _2115 = _2089;
    if (_2101)
    {
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2107 = _2117;
    }
    float _2119 = _2107;
    if (_2101)
    {
        float _2121 = rsqrt(_2097);
        _2109 = _2121;
    }
    float _2123 = _2109;
    if (_2101)
    {
        float _2125 = _2105 * _2119;
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (_2101)
    {
        float _2129 = _2127 * 0.15915493667125701904296875;
        _2011 = _2129;
    }
    float _2131 = _2011;
    float _2133 = _2077;
    float _2135 = _2131;
    if (_2101)
    {
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        _2133 = _2139;
    }
    float _2141 = _2133;
    float _2143 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2145 = precise::max(0.0, _2143);
    float _2147 = _1949;
    if (_2101)
    {
        float _2149 = _2131 * 6.283185482025146484375;
        float _2151 = cos(_2149);
        _2147 = _2151;
    }
    float _2153 = _2147;
    float _2155 = -_2087;
    float _2157 = -_2145;
    float _2159 = fma(_2069, _2155, _2157);
    if (_2101)
    {
        float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2113 = _2161;
    }
    float _2163 = _2113;
    float _2165 = _2163;
    if (!_2101)
    {
        _2135 = _2159;
    }
    float _2167 = _2135;
    float _2169 = fma(_617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2171 = _2141;
    float _2173 = _2167;
    if (_2101)
    {
        float _2175 = fma(_2141, _2163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2165 = _2175;
    }
    float _2177 = _2165;
    float _2179 = _2177;
    if (!_2101)
    {
        _2171 = _2091;
    }
    float _2181 = _2171;
    float _2183 = _2181;
    if (_2101)
    {
        float _2185 = _2153 + (-1.0);
        _625 = _2185;
    }
    float _2187 = _625;
    float _2189 = _2187;
    if (_2101)
    {
        float _2191 = _2123 * _2177;
        _1707 = _2191;
    }
    float _2193 = _1707;
    float _2195 = sqrt(_2083);
    if (_2101)
    {
        float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2179 = _2197;
    }
    float _2199 = _2179;
    float _2201 = _2199;
    if (_2101)
    {
        float _2203 = _2089 * _2193;
        _2115 = _2203;
    }
    float _2205 = _2115;
    if (!_2101)
    {
        _2189 = _2093;
    }
    float _2207 = _2189;
    float _2209 = _2207;
    if (_2101)
    {
        float _2211 = _2091 * _2193;
        _2183 = _2211;
    }
    float _2213 = _2183;
    if (_2101)
    {
        float _2215 = fma(_2159, _2153, _2199);
        _2173 = _2215;
    }
    float _2217 = _2173;
    if (_2101)
    {
        float _2219 = _2205 * _2205;
        _2209 = _2219;
    }
    float _2221 = _2209;
    float _2223 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2101)
    {
        _2201 = _2095;
    }
    float _2225 = _2201;
    float _2227 = _2225;
    if (_2101)
    {
        float _2229 = _2213 * _2213;
        _2227 = _2229;
    }
    float _2231 = _2227;
    float _2233 = fma(_2217, _2217, _2221);
    float _2235 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2237 = _2233 + _2231;
    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2241 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2239);
    float _2243 = precise::clamp(_2241, 0.0, 1.0);
    float _2245 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2235);
    float _2247 = rsqrt(_2237);
    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2251 = fma(_621, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2253 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2255 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2257 = -_2243;
    float _2259 = _2257 + 1.0;
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2263 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2255);
    float _2265 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2267 = floor(_2169);
    float _2269 = -_2261;
    float _2271 = fma(_2269, _2249, 1.0);
    float _2273 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2275 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2263);
    float _2277 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2265);
    float _2279 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2273);
    float _2281 = _2247 * _2205;
    float _2283 = _2247 * _2217;
    float _2285 = abs(_2259);
    float _2287 = log2(_2285);
    float _2289 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2279);
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2293 = _2247 * _2213;
    float _2295 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2297 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2299 = -_2291;
    float _2301 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2299);
    float _2303 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2277);
    float _2305 = floor(_2251);
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2309 = -_2293;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2301);
    float _2313 = -_2267;
    float _2315 = _2169 + _2313;
    float _2317 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2319 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2307);
    float _2321 = fma(_2311, -0.5, 0.5);
    float _2323 = log2(_2271);
    float _2325 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2319);
    float _2327 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2329 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2317);
    float _2331 = exp2(_2327);
    float _2333 = _2303 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2335 = -_2305;
    float _2337 = _2251 + _2335;
    float _2339 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2325);
    float _2341 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2343 = sqrt(_2321);
    float _2345 = fma(_2311, 0.5, 0.5);
    float _2347 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2341);
    float _2349 = _2283 + 1.0;
    float _2351 = _2323 * 0.693147182464599609375;
    float _2353 = fma(_2345, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2355 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2347);
    float _2357 = 1.0 / _2339;
    float _2359 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2329);
    float _2361 = fma(_2345, _2353, -0.212114393711090087890625);
    float _2363 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2355);
    float2 _6587 = float2(_2315, _2337);
    float _2365 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6587, float2(0.0), isnan(_6587)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6587, float2(0.0), isnan(_6587)), level(0.0)).x;
    float _2367 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2359);
    float _2369 = fma(_2345, _2361, 1.570728778839111328125);
    float _2371 = -_2283;
    float _2373 = fma(_2331, _2349, _2371);
    float _2375 = _2343 * 0.636619746685028076171875;
    float _2377 = -_2369;
    float _2379 = fma(_2375, _2377, 1.0);
    float _2381 = fma(_2373, 0.5, 0.5);
    float _2383 = _2367 * _2357;
    float _2385 = _2363 * _2357;
    float _2387 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2389 = fma(_2383, 0.5, 0.5);
    float _2391 = fma(_2385, -0.5, 0.5);
    float3 _6637 = float3(_2389, _2391, _2387);
    float _2393 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6637, float3(0.0), isnan(_6637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6637, float3(0.0), isnan(_6637)), level(0.0)).x;
    float3 _6648 = float3(_2389, _2391, _2387);
    float4 _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6648, float3(0.0), isnan(_6648)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6648, float3(0.0), isnan(_6648)), level(0.0)).xyzw;
    float _2398 = _2396.x;
    float _2400 = _2396.y;
    float _2402 = _2396.z;
    float _2404 = _2396.w;
    float2 _6664 = float2(_2379, _2381);
    float3 _2408 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6664, float2(0.0), isnan(_6664)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6664, float2(0.0), isnan(_6664)), level(0.0)).xyz;
    float _2410 = _2408.x;
    float _2412 = _2408.y;
    float _2414 = _2408.z;
    float _2416 = abs(_1955);
    float _2418 = log2(_2416);
    float _2420 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2422 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2424 = isnan(_2195);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2430 = _2426 || _2428;
    float _2432 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2420);
    bool _2434 = _1955 <= 8000.0;
    bool _2436 = isnan(_1955);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(8000.0);
    bool _2442 = _2438 || _2440;
    float _2444 = float(_2442);
    float _2446 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2448 = exp2(_2446);
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = fma(_2452, -2.0, 3.0);
    float _2456 = _2452 * _2452;
    float _2458 = _2456 * _2454;
    float _2460 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2462 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2432);
    float _2464 = in.m_76.x;
    float _2466 = -_2458;
    float _2468 = _2466 + 1.0;
    float _2470 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2462);
    float _2472 = exp2(_2460);
    float _2474 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2458);
    float _2476 = _2470 + _2339;
    out.gl_Position.x = _2367;
    out.gl_Position.y = _2363;
    out.gl_Position.z = _2470;
    out.gl_Position.w = _2339;
    float _2478 = _2444 * _2474;
    float _2480 = _2476 * 0.5;
    float _2482 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.z = _2480;
    out.m_78.w = _2339;
    float _2484 = -_2472;
    float _2486 = _2484 + 1.0;
    float _2488 = _2339;
    float _2490 = _2470;
    float _2492 = _2363;
    float _2494 = _2367;
    if (!_2430)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2496 = _2488;
    float _2498 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2430)
    {
        _2490 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2504 = _2490;
    float _2506 = _2504;
    float _2508 = _2504;
    if (!_2430)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2510 = _2492;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2430)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2516 = _2494;
    float _2518 = -_2365;
    float _2520 = _2518 + 1.0;
    float _2522 = _2520 * _2482;
    float _2524 = precise::clamp(_2522, 0.0, 1.0);
    float _2526 = -_2524;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2530 = _2528 * _2464;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2534 = _2498 * _2393;
    float _2536 = -_2498;
    float _2538 = _2536 + 1.0;
    out.m_80.x = _2532;
    float _2540 = _2404 * _2534;
    float _2542 = _2414 * _2534;
    float _2544 = _2404 * _2538;
    float _2546 = fma(_2410, _2540, _2398);
    float _2548 = fma(_2412, _2540, _2400);
    float _2550 = fma(_2404, _2542, _2402);
    float _2552 = _2009 * _2065;
    float _2554 = _2398;
    float _2556 = _2552;
    float _2558 = _2516;
    float _2560 = _2516;
    if (!_2430)
    {
        _2554 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2562 = _2554;
    out.m_82.x = _2546;
    out.m_82.y = _2548;
    out.m_82.z = _2550;
    out.m_82.w = _2544;
    float _2564 = _2552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2566 = _2562;
    float _2568 = _2562;
    if (!_2430)
    {
        _2556 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2570 = _2556;
    bool _2572 = !_2430;
    float _2574 = _2570;
    float _2576 = _2570;
    if (!_2572)
    {
        bool _2578 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2580 = isnan(_2195);
        bool _2582 = _2578 || _2580;
        bool _2584 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2586 = _2582 || _2584;
        if (!_2586)
        {
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2590 = _2195 + _2588;
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2594 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2592;
            float _2596 = 1.0 / _2594;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2618 = _2590 * _2596;
            float _2620 = precise::clamp(_2618, 0.0, 1.0);
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2626 = fma(_2620, _2600, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2628 = fma(_2620, _2624, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2630 = fma(_2620, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2632 = fma(_2620, _2608, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2634 = fma(_2620, _2612, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2636 = fma(_2620, _2616, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2502 = _2628;
            _2560 = _2634;
            _2568 = _2626;
            _2514 = _2632;
            _2508 = _2630;
            _2576 = _2636;
            _2638 = true;
        }
        else
        {
            bool _2640 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2642 = isnan(_2195);
            bool _2644 = _2640 || _2642;
            bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2648 = _2644 || _2646;
            if (!_2648)
            {
                _2566 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2650 = _2566;
            _2568 = _2650;
            if (!_2648)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2652 = _2500;
            _2502 = _2652;
            if (!_2648)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2654 = _2506;
            _2508 = _2654;
            if (!_2648)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2656 = _2512;
            _2514 = _2656;
            if (!_2648)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2658 = _2558;
            _2560 = _2658;
            if (!_2648)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2660 = _2574;
            bool _2662 = !_2648;
            _2576 = _2660;
            if (!_2662)
            {
                bool _2664 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2666 = isnan(_2195);
                bool _2668 = _2664 || _2666;
                bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2672 = _2668 || _2670;
                if (!_2672)
                {
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2676 = _2195 + _2674;
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2680 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2678;
                    float _2682 = 1.0 / _2680;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2704 = _2676 * _2682;
                    float _2706 = precise::clamp(_2704, 0.0, 1.0);
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2712 = fma(_2706, _2686, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2714 = fma(_2706, _2710, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2716 = fma(_2706, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2718 = fma(_2706, _2694, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2720 = fma(_2706, _2698, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2722 = fma(_2706, _2702, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2502 = _2714;
                    _2560 = _2720;
                    _2568 = _2712;
                    _2514 = _2718;
                    _2508 = _2716;
                    _2576 = _2722;
                    _2638 = true;
                }
                else
                {
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2568 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2638 = false;
    float _2724 = _2502;
    float _2726 = _2560;
    float _2728 = _2568;
    float _2730 = _2514;
    float _2732 = _2508;
    float _2734 = _2576;
    float _2736 = fma(_1691, -0.5, 0.5);
    float _2738 = precise::clamp(_2736, 0.0, 1.0);
    float _2740 = -_2724;
    float _2742 = _2740 + _2726;
    float _2744 = _2564 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2746 = -_2728;
    float _2748 = _2746 + _2730;
    float _2750 = fma(_2738, _2742, _2724);
    out.m_84.x = 0.0;
    float _2752 = -_2732;
    float _2754 = _2752 + _2734;
    float _2756 = fma(_2738, _2748, _2728);
    float _2758 = _2750 * 0.586610972881317138671875;
    out.m_51.x = _2744;
    bool _2760 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2762 = fma(_2738, _2754, _2732);
    float _2764 = fma(_2756, 0.298911988735198974609375, _2758);
    bool _2766 = _2009 > 0.0;
    bool _2768 = isnan(_2009);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(0.0);
    bool _2774 = _2770 || _2772;
    float _2776 = fma(_2762, 0.114477999508380889892578125, _2764);
    bool _2778 = _2065 <= 0.0;
    bool _2780 = !_2774;
    bool _2782 = _2778 || _2780;
    float _2784 = -_2776;
    float _2786 = _2756 + _2784;
    float _2788 = -_2776;
    float _2790 = _2750 + _2788;
    float _2792 = -_2776;
    float _2794 = _2762 + _2792;
    float _2796 = fma(_2786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    float _2800 = fma(_2794, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    bool _2802 = !_2760;
    if (!_2802)
    {
        float _2804 = -_1943;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2808 = -_1945;
        float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2812 = -_1947;
        float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2816 = _2806 * _2806;
        float _2818 = fma(_2810, _2810, _2816);
        float _2820 = fma(_2814, _2814, _2818);
        float _2822 = sqrt(_2820);
        float _2824 = rsqrt(_2820);
        float _2826 = -_2822;
        float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2832 = precise::clamp(_2830, 0.0, 1.0);
        float _2834 = _2810 * _2824;
        float _2836 = _2806 * _2824;
        float _2838 = abs(_2832);
        float _2840 = log2(_2838);
        float _2842 = _2814 * _2824;
        float _2844 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2846 = _1691 * _2836;
        float _2848 = -_2836;
        float _2850 = -_2844;
        float _2852 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2850);
        float _2854 = fma(_1673, _2834, _2846);
        float _2856 = -_2842;
        float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2852);
        float _2860 = fma(_1693, _2842, _2854);
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2866 = _2858 + _2864;
        float _2868 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2870 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = exp2(_2868);
        float _2876 = _2874 * _2872;
        float _2878 = _2862 * _2876;
        float _2880 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2880;
        out.m_84.y = _2882;
        out.m_84.z = _2884;
    }
    out.m_86.x = _2796;
    out.m_86.y = _2798;
    out.m_86.z = _2800;
    if (!_2782)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2886;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2638 = false;
    bool _1743 = false;
    bool _305 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2942 = as_type<float>(_119);
        out.gl_Position.z = _2942;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_53.w;
    float _125 = float(_105);
    float _127 = -_123;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_123);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    bool _141 = _129 >= _125;
    bool _143 = !_139;
    bool _145 = _141 || _143;
    float _147 = _123;
    float _149 = _129;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _147;
    if (_145)
    {
        out.m_51.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _121 = as_type<int>(_153);
    }
    int _155 = _121;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3007 = as_type<float>(_155);
        out.gl_Position.z = _3007;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    float _163 = 1.0 / _125;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _129 * _163;
    float _169 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _171 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _173 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _173);
    float _181 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _175);
    float _183 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _177);
    float _185 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _179);
    bool _187 = !_165;
    float _189 = _183;
    float _207;
    if (!_187)
    {
        float _191 = in.m_57.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        _207 = _167;
    }
    _209 = false;
    float _211 = _207;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    bool _217 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _219 = isnan(_211);
    bool _221 = _217 || _219;
    bool _223 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _225 = _221 || _223;
    float _227 = float(_225);
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _229;
    float _233 = -_227;
    float _235 = _233 + 1.0;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _231;
    float _257 = _247 * _235;
    float _259 = -_247;
    float _261 = _259 + 1.0;
    float _263 = _215 * _255;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _265;
    float _269 = fma(_251, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_267, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = _269 * _257;
    float _275 = _271 * _257;
    float _277 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].x, _273);
    float _279 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[143].y, _275);
    float _281 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].x, _277);
    float _283 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[144].y, _279);
    bool _285 = !_253;
    float _303;
    if (!_285)
    {
        float _287 = in.m_57.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        _303 = _167;
    }
    _305 = false;
    float _307 = _303;
    float _309 = in.m_57.x;
    float _311 = in.m_57.y;
    float _313 = in.m_57.z;
    float _315 = in.m_57.w;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = as_type<float>(int(gl_VertexIndex));
    float _323 = in.m_62.x;
    float _325 = in.m_62.y;
    float _327 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _329 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _347 = _313 * 2.0;
    float _349 = _309 * 2.0;
    float _351 = _311 * 2.0;
    float _353 = 1.0 / _333;
    int _355 = as_type<int>(_321) & 1;
    bool _357 = _355 != 0;
    int _359 = as_type<int>(_321) & 2;
    bool _361 = _359 != 0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _367 = _315 > 0.5;
    float _369 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _371 = _281 * _323;
    float _373 = _283 * _325;
    float _375 = floor(_347);
    bool _377 = !_361;
    float _379 = _377 ? (-0.5) : 0.5;
    float _381 = _311 + _313;
    float _383 = _313 + _309;
    float _385 = _309 + (-0.5);
    float _387 = floor(_349);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _393 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _369);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _399 = _381 + (-1.0);
    float _401 = floor(_351);
    bool _403 = _375 > 0.0;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _409 = _375 >= 0.0;
    bool _411 = isnan(_375);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _419;
    float _423 = _383 + (-1.0);
    int _425 = _417 ? 0 : 1;
    float _427 = 1.0 / _337;
    bool _429 = _387 > 0.0;
    float _431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _379);
    bool _433 = _387 >= 0.0;
    bool _435 = isnan(_387);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    int _443 = _441 ? 0 : 1;
    float _445 = 1.0 / _341;
    bool _447 = _401 >= 0.0;
    bool _449 = isnan(_401);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    bool _457 = _401 > 0.0;
    int _459 = ~_425;
    int _461 = _459 + 1;
    int _463 = _461 + 1;
    int _465 = ~_443;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = 1.0 / _345;
    int _473 = _455 ? 0 : 1;
    int _475 = _463;
    int _477 = _469;
    if (!_403)
    {
        int _479 = ~_425;
        int _481 = _479 + 1;
        _475 = _481;
    }
    int _483 = _475;
    float _485 = _319 * _129;
    if (!_429)
    {
        int _487 = ~_443;
        int _489 = _487 + 1;
        _477 = _489;
    }
    int _491 = _477;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _503 = _501 != 0;
    float _505 = exp2(_485);
    float _507 = in.m_48.x;
    float _509 = in.m_48.y;
    float _511 = in.m_48.z;
    int _513 = ~_473;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    int _519 = _517;
    if (!_457)
    {
        int _521 = ~_473;
        int _523 = _521 + 1;
        _519 = _523;
    }
    int _525 = _519;
    bool _527 = !_357;
    float _529 = _527 ? (-0.5) : 0.5;
    float _531 = 1.0 / _391;
    bool _533 = !_495;
    int _535 = _533 ? 0 : 1;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _547 = _545 != 0;
    float _549 = -_505;
    float _551 = _549 + 1.0;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _555 = _553 != 0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _559 = 1.0 + _557;
    bool _561 = !_499;
    int _563 = _561 ? 0 : 1;
    float _565 = 1.0 / _365;
    bool _567 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _575 = _571 || _573;
    float _577 = _509 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _579 = _509 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _581 = _509 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _583 = _575 ? _551 : 0.0;
    float _585 = 1.0 / _559;
    float _587 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].x, _577);
    bool _589 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(1.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].x, _581);
    float _601 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].x, _579);
    float _603 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].z, _587);
    float _605 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].z, _599);
    float _607 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].z, _601);
    float _609 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _611 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _329);
    bool _613 = !_503;
    int _615 = _613 ? 0 : 1;
    float _617 = _607 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _621 = _605 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _623 = _313 + (-0.5);
    float _625 = _617;
    if (_597)
    {
        float _627 = _583 * _585;
        _149 = _627;
    }
    float _629 = _149;
    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _619);
    bool _633 = _313 > 0.5;
    float _635 = _311 + _309;
    float _637 = _311 + (-0.5);
    float _639 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[0].z, _631);
    float _641 = _611 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _643 = -_379;
    int _645 = _367 ? as_type<int>(_643) : as_type<int>(_379);
    float _647 = 1.0 / _397;
    float _649 = _639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _651 = _309 > 0.5;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _657 = _635 + (-1.0);
    bool _659 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _661 = isnan(_307);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    bool _671 = _649 >= _641;
    bool _673 = isnan(_649);
    bool _675 = _671 || _673;
    bool _677 = isnan(_641);
    bool _679 = _675 || _677;
    float _681 = 1.0 / _407;
    bool _683 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _685 = isnan(_167);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -_649;
    float _697 = _641 + _695;
    bool _699 = !_679;
    float _701 = _699 ? 1.0 : (-1.0);
    bool _703 = _311 > 0.5;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _713 = 1.0 / _655;
    float _715 = float(_525);
    float _717 = _707 * _353;
    float _719 = _711 * _427;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _725 = _421 * _445;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _735 = _723 * _471;
    float _737 = _729 * _531;
    float _739 = _733 * _565;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _749 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _751;
    float _755 = _743 * _647;
    float _757 = _747 * _713;
    float _759 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _761 = _753 * _681;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _765 = _307 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _769 = _307 + _767;
    float _771 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _393);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _775 = _167 + _773;
    float _777 = fma(_717, _765, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _779 = fma(_719, _769, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _783 = _167 + _781;
    float _785 = fma(_725, _775, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _787 = abs(_535);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _791 = _167 + _789;
    float _793 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _795 = fma(_735, _783, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _797 = float(_787);
    float _799 = in.m_64.x;
    float _801 = in.m_64.y;
    float _803 = in.m_64.z;
    float _805 = float(_483);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _809 = _167 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _813 = _167 + _811;
    float _815 = fma(_737, _791, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _819 = _167 + _817;
    float _821 = fma(_755, _809, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _823 = _797 * _805;
    int _825 = abs(_563);
    float _827 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _829 = fma(_757, _813, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _831 = _373 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _835 = _167 + _833;
    float _837 = _823 * (-2.0);
    float _839 = fma(_739, _819, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _841 = float(_491);
    float _843 = _831 * _431;
    float _845 = float(_825);
    float _847 = fma(_761, _835, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _849 = fma(_793, _837, _793);
    bool _851 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _853 = isnan(_167);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _529);
    float _865 = _845 * _841;
    bool _867 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _869 = isnan(_307);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = fma(_837, _799, _799);
    bool _881 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _883 = isnan(_167);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = rsqrt(_771);
    float _895 = _865 * (-2.0);
    float _897 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[196].x, _879);
    bool _899 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _901 = isnan(_167);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = -_891;
    float _913 = _911 + 1.0;
    float _915 = fma(_749, _895, _749);
    float _917 = fma(_849, _629, _897);
    float _919 = fma(_895, _801, _801);
    float _921 = _909 * _913;
    float _923 = -_909;
    float _925 = _923 + 1.0;
    bool _927 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _929 = isnan(_167);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = -_861;
    float _941 = _939 + 1.0;
    bool _943 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _945 = isnan(_307);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = _861 * _925;
    bool _957 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _959 = isnan(_167);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    float _969 = -_937;
    float _971 = _969 + 1.0;
    float _973 = _937 * _941;
    float _975 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _977 = _967 * _971;
    float _979 = -_967;
    float _981 = _979 + 1.0;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _983;
    float _987 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _989 = _975 * _975;
    float _991 = _893 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _993 = -_953;
    float _995 = _993 + 1.0;
    bool _997 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _999 = isnan(_167);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = fma(_987, _987, _989);
    float _1011 = _693 * _981;
    float _1013 = -_693;
    float _1015 = _1013 + 1.0;
    float _1017 = _669 * _995;
    float _1019 = fma(_991, _991, _1009);
    int _1021 = abs(_615);
    float _1023 = _827 * _863;
    float _1025 = -_669;
    float _1027 = _1025 + 1.0;
    bool _1029 = _167 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1031 = isnan(_167);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = _1007 * _1015;
    float _1043 = -_1007;
    float _1045 = _1043 + 1.0;
    float _1047 = float(_1021);
    float _1049 = _877 * _1027;
    float _1051 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[196].y, _919);
    float _1053 = _1039 * _1045;
    float _1055 = -_1039;
    float _1057 = _1055 + 1.0;
    float _1059 = _1047 * _715;
    float _1061 = _777 * _1049;
    float _1063 = _785 * _1053;
    float _1065 = -_877;
    float _1067 = _1065 + 1.0;
    float _1069 = _1059 * (-2.0);
    float _1071 = fma(_915, _629, _1051);
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1063);
    float _1075 = 1.0 / _985;
    float _1077 = fma(_1069, _803, _803);
    float _1079 = fma(_759, _1069, _759);
    float _1081 = fma(_795, _1041, _1073);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1061);
    float _1085 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1077);
    float _1087 = -_609;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = fma(_815, _1011, _1081);
    float _1093 = _917 * 0.15915493667125701904296875;
    float _1095 = fma(_1079, _629, _1085);
    float _1097 = -_617;
    float _1099 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1101 = _1089 * _1089;
    float _1103 = _1071 * 0.15915493667125701904296875;
    float _1105 = _1095 * 0.15915493667125701904296875;
    float _1107 = abs(_697);
    float _1109 = precise::max(_1107, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1111 = fma(_779, _1017, _1083);
    float _1113 = fma(_1099, _1099, _1101);
    float _1115 = rsqrt(_1019);
    float _1117 = -_621;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = precise::min(_1109, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1123 = fma(_839, _977, _1091);
    float _1125 = fma(_1119, _1119, _1113);
    float _1127 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1111);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1131 = _1121 + _1129;
    float _1133 = _1093 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1141 = fma(_821, _973, _1123);
    float _1143 = _1131 * _1075;
    float _1145 = fma(_167, _1139, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1147 = fma(_829, _955, _1141);
    float _1149 = _701 * _1143;
    float _1151 = _1093 * 6.283185482025146484375;
    float _1153 = cos(_1151);
    float _1155 = _991 * _1115;
    float _1157 = _167 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1159 = _987 * _1115;
    float _1161 = _975 * _1115;
    float _1163 = _609 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1165 = fma(_847, _921, _1147);
    float _1167 = _1103 * 6.283185482025146484375;
    float _1169 = sin(_1167);
    float _1171 = _1103 * 6.283185482025146484375;
    float _1173 = cos(_1171);
    float _1175 = _1105 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    float _1179 = _1135 * _1169;
    float _1181 = _1153 * _1169;
    float _1183 = _1105 * 6.283185482025146484375;
    float _1185 = sin(_1183);
    float _1187 = _1153 * _1173;
    float _1189 = _1135 * _1173;
    float _1191 = _1153 * _1177;
    float _1193 = _1135 * _1177;
    float _1195 = _1173 * _1177;
    float _1197 = _1169 * _1177;
    float _1199 = _1191 * _843;
    float _1201 = _1157 * _1149;
    float _1203 = _1193 * _843;
    float _1205 = sqrt(_1125);
    float _1207 = fma(_1185, _1187, _1179);
    float _1209 = -_1181;
    float _1211 = fma(_1185, _1189, _1209);
    float _1213 = -_1189;
    float _1215 = fma(_1185, _1181, _1213);
    float _1217 = -_843;
    float _1219 = _1185 * _1217;
    float _1221 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1223 = fma(_1207, _1023, _1199);
    float _1225 = fma(_1185, _1179, _1187);
    float _1227 = fma(_1195, _1023, _1219);
    float _1229 = fma(_1211, _1023, _1203);
    float _1231 = fma(_1215, _1221, _1223);
    float _1233 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1163);
    float _1235 = fma(_1197, _1221, _1227);
    float _1237 = fma(_1225, _1221, _1229);
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1245 = _1201 * 0.15915493667125701904296875;
    float _1247 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1239);
    float _1249 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1251 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1243);
    float _1253 = abs(_1205);
    float _1255 = precise::max(0.0, _1253);
    float _1257 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1247);
    float _1259 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1249);
    float _1261 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1251);
    float _1263 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1233);
    float _1265 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1267 = _1259 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1269 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1271 = _1245 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = _609 + _1265;
    float _1277 = _617 + _1267;
    float _1279 = _621 + _1269;
    float _1281 = precise::min(_1255, 40.0);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1289 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1287);
    float _1297 = fma(_1281, -0.02500000037252902984619140625, 1.0);
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1291);
    float _1301 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1293);
    float _1303 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1295);
    float _1305 = -_1273;
    float _1307 = _1305 + 1.0;
    float _1309 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = _1245 * 6.283185482025146484375;
    float _1313 = sin(_1311);
    float _1315 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1317 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = -_1309;
    float _1321 = _1319 + _1289;
    float _1323 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1325 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1327 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1329 = fma(_1297, _1321, _1309);
    float _1331 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1333 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1325);
    float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1327);
    float _1337 = _1159 * _1307;
    float _1339 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1333);
    float _1343 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1335);
    float _1345 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1347 = _1155 * _1313;
    float _1349 = _1341 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _1353 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1331);
    float _1355 = -_1347;
    float _1357 = fma(_1161, _1337, _1355);
    float _1359 = -_609;
    float _1361 = _1359 + _1349;
    float _1363 = fma(_1159, _1337, _1273);
    float _1365 = -_617;
    float _1367 = _1365 + _1351;
    float _1369 = _1159 * _1313;
    float _1371 = _1357 * _1361;
    float _1373 = _1161 * _1307;
    float _1375 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1353);
    float _1377 = _1161 * _1313;
    float _1379 = fma(_1363, _1367, _1371);
    float _1381 = fma(_1155, _1373, _1369);
    float _1383 = _1155 * _1155;
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _1387 = -_1377;
    float _1389 = fma(_1155, _1337, _1387);
    float _1391 = _1381 * _1361;
    float _1393 = fma(_1155, _1337, _1377);
    float _1395 = -_621;
    float _1397 = _1395 + _1385;
    float _1399 = fma(_1307, _1383, _1273);
    float _1401 = fma(_1389, _1367, _1391);
    float _1403 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1165);
    float _1405 = fma(_1393, _1397, _1379);
    float _1407 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1409 = fma(_1399, _1397, _1401);
    float _1411 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1413 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = -_1185;
    float _1417 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1407);
    float _1419 = fma(_1405, _1145, _617);
    float _1421 = fma(_1409, _1145, _621);
    float _1423 = -_1185;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1411);
    float _1427 = -_1185;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1431 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1417);
    float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1435 = _1419 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1439 = _1421 + _1437;
    float _1441 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1425);
    float _1443 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1445 = _1435 * _1435;
    float _1447 = _1439 * _1439;
    float _1449 = _1207 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1451 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1453 = _1215 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1455 = _1445 + _1447;
    float _1457 = fma(_1161, _1373, _1273);
    float _1459 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1449);
    float _1461 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1339);
    float _1463 = sqrt(_1455);
    float _1465 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1323);
    float _1467 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1345);
    float _1469 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1451);
    float _1471 = fma(_1161, _1337, _1347);
    float _1473 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1453);
    float _1475 = _1457 * _1361;
    float _1477 = -_379;
    int _1479 = _703 ? as_type<int>(_1477) : as_type<int>(_379);
    float _1481 = -_1369;
    float _1483 = fma(_1155, _1373, _1481);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1487 = fma(_1471, _1367, _1475);
    bool _1489 = !_543;
    float _1491 = _1489 ? _379 : as_type<float>(_1479);
    float _1493 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1459);
    bool _1495 = !_555;
    float _1497 = _1495 ? _379 : as_type<float>(_645);
    float _1499 = fma(_1483, _1397, _1487);
    float _1501 = _379 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1503 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1507 = _609 + _1499;
    float _1509 = _1501 * _1431;
    float _1511 = _1501 * _1441;
    float _1513 = _1501 * _1443;
    float _1515 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1461);
    float _1517 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1465);
    float _1519 = -_529;
    int _1521 = _651 ? as_type<int>(_1519) : as_type<int>(_529);
    float _1523 = -_529;
    int _1525 = _633 ? as_type<int>(_1523) : as_type<int>(_529);
    float _1527 = _1499;
    float _1529 = _1501;
    float _1531 = _1483;
    float _1533 = _1445;
    float _1535 = _1447;
    if (!_1503)
    {
        _1527 = _1419;
    }
    float _1537 = _1527;
    float _1539 = _1537;
    if (!_1503)
    {
        _1529 = _1421;
    }
    float _1541 = _1529;
    float _1543 = _1541;
    if (!_1503)
    {
        _1531 = _1507;
    }
    float _1545 = _1531;
    bool _1547 = !_1503;
    float _1549 = _1545;
    if (!_1547)
    {
        float _1551 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1555 = _1463 + _1553;
        float _1557 = _1507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = rsqrt(_1455);
        float _1561 = _1555 * _1551;
        float _1563 = _1561 * 0.15915493667125701904296875;
        float _1565 = _1563 * 6.283185482025146484375;
        float _1567 = sin(_1565);
        float _1569 = _1563 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = fma(_1567, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1575 = _1559 * _1573;
        float _1577 = fma(_1435, _1575, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1579 = _1571 + (-1.0);
        float _1581 = fma(_1439, _1575, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1585 = _1577 + _1583;
        float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1591 = _1581 + _1589;
        float _1593 = _1585 * _1585;
        float _1595 = fma(_1507, _1571, _1587);
        float _1597 = _1591 * _1591;
        _1549 = _1595;
        _1533 = _1593;
        _1535 = _1597;
        _1539 = _1577;
        _1543 = _1581;
    }
    float _1599 = _1549;
    float _1601 = _1533;
    float _1603 = _1535;
    float _1605 = _1539;
    float _1607 = _1543;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1611 = !_539;
    float _1613 = _1611 ? _529 : as_type<float>(_1521);
    float _1615 = _529 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1617 = !_547;
    float _1619 = _1617 ? _529 : as_type<float>(_1525);
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1623 = _1599 + _1621;
    float _1625 = -_1497;
    float _1627 = _1625 + 0.5;
    float _1629 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1467);
    float _1631 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1469);
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1635 = fma(_1623, _1623, _1601);
    float _1637 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1473);
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1641 = _1635 + _1603;
    float _1643 = _1613 + 0.5;
    float _1645 = _1639 * _1609;
    float _1647 = -_1491;
    float _1649 = _1647 + 0.5;
    float _1651 = _1619 + 0.5;
    float _1653 = fma(_1615, _1493, _1509);
    float _1655 = sqrt(_1641);
    float _1657 = fma(_1615, _1517, _1513);
    float _1659 = fma(_1615, _1515, _1511);
    float _1661 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1665 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1673 = _1629 + _1653;
    float _1675 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1677 = _1661 * _1485;
    float _1679 = _1663 * _1505;
    float _1681 = _1665 * _1633;
    float _1683 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1685 = _1667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1687 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1689 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1691 = _1631 + _1659;
    float _1693 = _1637 + _1657;
    out.m_66.w = _1683;
    bool _1695 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1697 = isnan(_1655);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1703 = _1699 || _1701;
    out.m_68.x = _1677;
    out.m_68.y = _1679;
    out.m_68.z = _1681;
    out.m_68.w = _1645;
    out.m_70.x = _1685;
    out.m_70.y = _1687;
    out.m_70.z = _1689;
    out.m_70.w = _1675;
    out.m_72.x = _1403;
    float _1705 = _1661;
    float _1707 = _1657;
    if (!_1703)
    {
        _1705 = 1.0;
    }
    float _1709 = _1705;
    out.m_74.x = _1673;
    out.m_74.y = _1691;
    out.m_74.z = _1693;
    bool _1711 = !_1703;
    float _1713 = _1709;
    if (!_1711)
    {
        bool _1715 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1717 = isnan(_1655);
        bool _1719 = _1715 || _1717;
        bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1723 = _1719 || _1721;
        if (!_1723)
        {
            float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1727 = _1655 + _1725;
            float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1731 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1729;
            float _1733 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1735 = _1733 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1737 = 1.0 / _1731;
            float _1739 = _1727 * _1737;
            float _1741 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1713 = _1741;
            _1743 = true;
        }
        else
        {
            bool _1745 = _1655 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1747 = isnan(_1655);
            bool _1749 = _1745 || _1747;
            bool _1751 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1753 = _1749 || _1751;
            if (!_1753)
            {
                float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1757 = _1655 + _1755;
                float _1759 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1761 = _1759 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1763 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1765 = _1763 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1767 = 1.0 / _1761;
                float _1769 = _1757 * _1767;
                float _1771 = fma(_1769, _1765, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1713 = _1771;
                _1743 = true;
            }
            else
            {
                _1713 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1743 = false;
    float _1773 = _1713;
    float _1775 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1777 = _1599 + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1781 = _1605 + _1779;
    float _1783 = _609 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1785 = fma(_1777, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1787 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1789 = _1607 + _1787;
    float _1791 = fma(_1781, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1793 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1783);
    float _1795 = -_609;
    float _1797 = _1795 + _1785;
    float _1799 = fma(_1789, _1773, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1801 = -_617;
    float _1803 = _1801 + _1791;
    float _1805 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1793);
    float _1807 = _1797 * _1797;
    float _1809 = -_621;
    float _1811 = _1809 + _1799;
    float _1813 = _609 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1815 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1817 = fma(_1803, _1803, _1807);
    float _1819 = 1.0 / _1815;
    float _1821 = fma(_1811, _1811, _1817);
    float _1823 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1813);
    float _1825 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1823);
    bool _1827 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(0.5);
    bool _1835 = _1831 || _1833;
    float _1837 = sqrt(_1821);
    float _1839 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1841 = _1839 + _1815;
    float _1843 = _1841 * _1819;
    float _1845 = _1843 * 0.5;
    float _1847 = _1815;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1851 = _1819;
    float _1853 = _1805;
    float _1855 = _1803;
    float _1857 = _1785;
    if (_1835)
    {
        _1847 = 1.0;
    }
    float _1859 = _1847;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1863 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1861);
    bool _1865 = _1837 > 0.0;
    float _1867 = 1.0 / _1863;
    float _1869 = _1859;
    if (!_1865)
    {
        _1849 = _1791;
    }
    float _1871 = _1849;
    float _1873 = _1871;
    if (!_1865)
    {
        _1851 = _1785;
    }
    float _1875 = _1851;
    float _1877 = _1875;
    float _1879 = _1875;
    if (!_1865)
    {
        _1853 = _1799;
    }
    float _1881 = _1853;
    bool _1883 = !_1865;
    float _1885 = _1881;
    float _1887 = _1881;
    if (!_1883)
    {
        float _1889 = _183 * _183;
        float _1891 = rsqrt(_1821);
        float _1893 = fma(_181, _181, _1889);
        float _1895 = fma(_185, _185, _1893);
        float _1897 = sqrt(_1895);
        float _1899 = _1797 * _1891;
        float _1901 = _1803 * _1891;
        float _1903 = _1811 * _1891;
        bool _1905 = _1897 > 0.0;
        float _1907 = _1897;
        _1855 = _1901;
        if (!_1905)
        {
            _1907 = _1791;
        }
        float _1909 = _1907;
        _1873 = _1909;
        if (!_1905)
        {
            _1877 = _1785;
        }
        float _1911 = _1877;
        _1879 = _1911;
        if (!_1905)
        {
            _1885 = _1799;
        }
        float _1913 = _1885;
        bool _1915 = !_1905;
        _1887 = _1913;
        if (!_1915)
        {
            float _1917 = rsqrt(_1895);
            float _1919 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1921 = _183 * _1917;
            float _1923 = _181 * _1917;
            float _1925 = _1899 * _1921;
            float _1927 = _185 * _1917;
            float _1929 = fma(_1901, _1923, _1925);
            float _1931 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1933 = fma(_1903, _1927, _1929);
            float _1935 = _1933 * _1931;
            float _1937 = fma(_181, _1935, _1791);
            float _1939 = fma(_183, _1935, _1785);
            float _1941 = fma(_185, _1935, _1799);
            _1879 = _1939;
            _1873 = _1937;
            _1887 = _1941;
        }
    }
    float _1943 = _1879;
    float _1945 = _1873;
    float _1947 = _1887;
    float _1949 = _1855;
    if (_1835)
    {
        _189 = 1.0;
    }
    float _1951 = _189;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1955 = _1867 * _1953;
    float _1957 = _1951;
    if (!_1835)
    {
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1961 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1961 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = 1.0 / _1965;
        float _1977 = _1969 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        float _1981 = _1973 * _1975;
        float _1983 = _1969 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = _1979 * _1981;
        float _1989 = 1.0 / _1987;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1993 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1991;
        float _1995 = 1.0 / _1993;
        float _1997 = _1985 * _1989;
        float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2001 = fma(_1955, _1997, _1999);
        float _2003 = _2001 * _1995;
        float _2005 = precise::clamp(_2003, 0.0, 1.0);
        _1857 = _1969;
        _1869 = _2005;
    }
    float _2007 = _1857;
    float _2009 = _1869;
    float _2011 = _2007;
    if (!_1835)
    {
        float _2013 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2015 = _2013 * 0.15915493667125701904296875;
        float _2017 = _2015 * 6.283185482025146484375;
        float _2019 = cos(_2017);
        float _2021 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2023 = _2021 * 0.15915493667125701904296875;
        float _2025 = _2015 * 6.283185482025146484375;
        float _2027 = sin(_2025);
        float _2029 = 1.0 / _2019;
        float _2031 = _2023 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = _2027 * _2029;
        float _2037 = _2023 * 6.283185482025146484375;
        float _2039 = sin(_2037);
        float _2041 = _2033 * _2035;
        float _2043 = 1.0 / _2041;
        float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2047 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2045;
        float _2049 = 1.0 / _2047;
        float _2051 = _2039 * _2043;
        float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2055 = fma(_1955, _2051, _2053);
        float _2057 = _2055 * _2049;
        float _2059 = precise::clamp(_2057, 0.0, 1.0);
        float _2061 = -_2059;
        float _2063 = _2061 + 1.0;
        _1957 = _2063;
    }
    float _2065 = _1957;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2069 = _1943 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2073 = _1945 + _2071;
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2077 = _1947 + _2075;
    float _2079 = _2069 * _2069;
    float _2081 = fma(_2073, _2073, _2079);
    float _2083 = fma(_2077, _2077, _2081);
    float _2085 = rsqrt(_2083);
    float _2087 = _2085 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2089 = _2073 * _2087;
    float _2091 = _2077 * _2087;
    float _2093 = _2089 * _2089;
    float _2095 = _2091 * _2091;
    float _2097 = _2093 + _2095;
    float _2099 = sqrt(_2097);
    bool _2101 = _2099 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2105 = _2099 + _2103;
    float _2107 = _1655;
    float _2109 = _2085;
    float _2111 = _2105;
    float _2113 = _2069;
    float _2115 = _2089;
    if (_2101)
    {
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2107 = _2117;
    }
    float _2119 = _2107;
    if (_2101)
    {
        float _2121 = rsqrt(_2097);
        _2109 = _2121;
    }
    float _2123 = _2109;
    if (_2101)
    {
        float _2125 = _2105 * _2119;
        _2111 = _2125;
    }
    float _2127 = _2111;
    if (_2101)
    {
        float _2129 = _2127 * 0.15915493667125701904296875;
        _2011 = _2129;
    }
    float _2131 = _2011;
    float _2133 = _2077;
    float _2135 = _2131;
    if (_2101)
    {
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = sin(_2137);
        _2133 = _2139;
    }
    float _2141 = _2133;
    float _2143 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2145 = precise::max(0.0, _2143);
    float _2147 = _1949;
    if (_2101)
    {
        float _2149 = _2131 * 6.283185482025146484375;
        float _2151 = cos(_2149);
        _2147 = _2151;
    }
    float _2153 = _2147;
    float _2155 = -_2087;
    float _2157 = -_2145;
    float _2159 = fma(_2069, _2155, _2157);
    if (_2101)
    {
        float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2113 = _2161;
    }
    float _2163 = _2113;
    float _2165 = _2163;
    if (!_2101)
    {
        _2135 = _2159;
    }
    float _2167 = _2135;
    float _2169 = fma(_617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2171 = _2141;
    float _2173 = _2167;
    if (_2101)
    {
        float _2175 = fma(_2141, _2163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2165 = _2175;
    }
    float _2177 = _2165;
    float _2179 = _2177;
    if (!_2101)
    {
        _2171 = _2091;
    }
    float _2181 = _2171;
    float _2183 = _2181;
    if (_2101)
    {
        float _2185 = _2153 + (-1.0);
        _625 = _2185;
    }
    float _2187 = _625;
    float _2189 = _2187;
    if (_2101)
    {
        float _2191 = _2123 * _2177;
        _1707 = _2191;
    }
    float _2193 = _1707;
    float _2195 = sqrt(_2083);
    if (_2101)
    {
        float _2197 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2179 = _2197;
    }
    float _2199 = _2179;
    float _2201 = _2199;
    if (_2101)
    {
        float _2203 = _2089 * _2193;
        _2115 = _2203;
    }
    float _2205 = _2115;
    if (!_2101)
    {
        _2189 = _2093;
    }
    float _2207 = _2189;
    float _2209 = _2207;
    if (_2101)
    {
        float _2211 = _2091 * _2193;
        _2183 = _2211;
    }
    float _2213 = _2183;
    if (_2101)
    {
        float _2215 = fma(_2159, _2153, _2199);
        _2173 = _2215;
    }
    float _2217 = _2173;
    if (_2101)
    {
        float _2219 = _2205 * _2205;
        _2209 = _2219;
    }
    float _2221 = _2209;
    float _2223 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2101)
    {
        _2201 = _2095;
    }
    float _2225 = _2201;
    float _2227 = _2225;
    if (_2101)
    {
        float _2229 = _2213 * _2213;
        _2227 = _2229;
    }
    float _2231 = _2227;
    float _2233 = fma(_2217, _2217, _2221);
    float _2235 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2237 = _2233 + _2231;
    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2241 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2239);
    float _2243 = precise::clamp(_2241, 0.0, 1.0);
    float _2245 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2235);
    float _2247 = rsqrt(_2237);
    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2251 = fma(_621, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2253 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2255 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2257 = -_2243;
    float _2259 = _2257 + 1.0;
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2263 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2255);
    float _2265 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2267 = floor(_2169);
    float _2269 = -_2261;
    float _2271 = fma(_2269, _2249, 1.0);
    float _2273 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2275 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2263);
    float _2277 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2265);
    float _2279 = fma(_1945, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2273);
    float _2281 = _2247 * _2205;
    float _2283 = _2247 * _2217;
    float _2285 = abs(_2259);
    float _2287 = log2(_2285);
    float _2289 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2279);
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2293 = _2247 * _2213;
    float _2295 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2297 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2299 = -_2291;
    float _2301 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2299);
    float _2303 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2277);
    float _2305 = floor(_2251);
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2309 = -_2293;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2301);
    float _2313 = -_2267;
    float _2315 = _2169 + _2313;
    float _2317 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2319 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2307);
    float _2321 = fma(_2311, -0.5, 0.5);
    float _2323 = log2(_2271);
    float _2325 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2319);
    float _2327 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2329 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2317);
    float _2331 = exp2(_2327);
    float _2333 = _2303 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2335 = -_2305;
    float _2337 = _2251 + _2335;
    float _2339 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2325);
    float _2341 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2343 = sqrt(_2321);
    float _2345 = fma(_2311, 0.5, 0.5);
    float _2347 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2341);
    float _2349 = _2283 + 1.0;
    float _2351 = _2323 * 0.693147182464599609375;
    float _2353 = fma(_2345, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2355 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2347);
    float _2357 = 1.0 / _2339;
    float _2359 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2329);
    float _2361 = fma(_2345, _2353, -0.212114393711090087890625);
    float _2363 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2355);
    float2 _6587 = float2(_2315, _2337);
    float _2365 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6587, float2(0.0), isnan(_6587)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6587, float2(0.0), isnan(_6587)), level(0.0)).x;
    float _2367 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2359);
    float _2369 = fma(_2345, _2361, 1.570728778839111328125);
    float _2371 = -_2283;
    float _2373 = fma(_2331, _2349, _2371);
    float _2375 = _2343 * 0.636619746685028076171875;
    float _2377 = -_2369;
    float _2379 = fma(_2375, _2377, 1.0);
    float _2381 = fma(_2373, 0.5, 0.5);
    float _2383 = _2367 * _2357;
    float _2385 = _2363 * _2357;
    float _2387 = _2351 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2389 = fma(_2383, 0.5, 0.5);
    float _2391 = fma(_2385, -0.5, 0.5);
    float3 _6637 = float3(_2389, _2391, _2387);
    float _2393 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6637, float3(0.0), isnan(_6637)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6637, float3(0.0), isnan(_6637)), level(0.0)).x;
    float3 _6648 = float3(_2389, _2391, _2387);
    float4 _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6648, float3(0.0), isnan(_6648)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6648, float3(0.0), isnan(_6648)), level(0.0)).xyzw;
    float _2398 = _2396.x;
    float _2400 = _2396.y;
    float _2402 = _2396.z;
    float _2404 = _2396.w;
    float2 _6664 = float2(_2379, _2381);
    float3 _2408 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6664, float2(0.0), isnan(_6664)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6664, float2(0.0), isnan(_6664)), level(0.0)).xyz;
    float _2410 = _2408.x;
    float _2412 = _2408.y;
    float _2414 = _2408.z;
    float _2416 = abs(_1955);
    float _2418 = log2(_2416);
    float _2420 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2422 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2424 = isnan(_2195);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2430 = _2426 || _2428;
    float _2432 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2420);
    bool _2434 = _1955 <= 8000.0;
    bool _2436 = isnan(_1955);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(8000.0);
    bool _2442 = _2438 || _2440;
    float _2444 = float(_2442);
    float _2446 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2448 = exp2(_2446);
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = fma(_2452, -2.0, 3.0);
    float _2456 = _2452 * _2452;
    float _2458 = _2456 * _2454;
    float _2460 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2462 = fma(_2253, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2432);
    float _2464 = in.m_76.x;
    float _2466 = -_2458;
    float _2468 = _2466 + 1.0;
    float _2470 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2462);
    float _2472 = exp2(_2460);
    float _2474 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2458);
    float _2476 = _2470 + _2339;
    out.gl_Position.x = _2367;
    out.gl_Position.y = _2363;
    out.gl_Position.z = _2470;
    out.gl_Position.w = _2339;
    float _2478 = _2444 * _2474;
    float _2480 = _2476 * 0.5;
    float _2482 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.z = _2480;
    out.m_78.w = _2339;
    float _2484 = -_2472;
    float _2486 = _2484 + 1.0;
    float _2488 = _2339;
    float _2490 = _2470;
    float _2492 = _2363;
    float _2494 = _2367;
    if (!_2430)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2496 = _2488;
    float _2498 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2500 = _2496;
    float _2502 = _2496;
    if (!_2430)
    {
        _2490 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2504 = _2490;
    float _2506 = _2504;
    float _2508 = _2504;
    if (!_2430)
    {
        _2492 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2510 = _2492;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2430)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2516 = _2494;
    float _2518 = -_2365;
    float _2520 = _2518 + 1.0;
    float _2522 = _2520 * _2482;
    float _2524 = precise::clamp(_2522, 0.0, 1.0);
    float _2526 = -_2524;
    float _2528 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2530 = _2528 * _2464;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2534 = _2498 * _2393;
    float _2536 = -_2498;
    float _2538 = _2536 + 1.0;
    out.m_80.x = _2532;
    float _2540 = _2404 * _2534;
    float _2542 = _2414 * _2534;
    float _2544 = _2404 * _2538;
    float _2546 = fma(_2410, _2540, _2398);
    float _2548 = fma(_2412, _2540, _2400);
    float _2550 = fma(_2404, _2542, _2402);
    float _2552 = _2009 * _2065;
    float _2554 = _2398;
    float _2556 = _2552;
    float _2558 = _2516;
    float _2560 = _2516;
    if (!_2430)
    {
        _2554 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2562 = _2554;
    out.m_82.x = _2546;
    out.m_82.y = _2548;
    out.m_82.z = _2550;
    out.m_82.w = _2544;
    float _2564 = _2552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2566 = _2562;
    float _2568 = _2562;
    if (!_2430)
    {
        _2556 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2570 = _2556;
    bool _2572 = !_2430;
    float _2574 = _2570;
    float _2576 = _2570;
    if (!_2572)
    {
        bool _2578 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2580 = isnan(_2195);
        bool _2582 = _2578 || _2580;
        bool _2584 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2586 = _2582 || _2584;
        if (!_2586)
        {
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2590 = _2195 + _2588;
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2594 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2592;
            float _2596 = 1.0 / _2594;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2618 = _2590 * _2596;
            float _2620 = precise::clamp(_2618, 0.0, 1.0);
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2626 = fma(_2620, _2600, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2628 = fma(_2620, _2624, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2630 = fma(_2620, _2604, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2632 = fma(_2620, _2608, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2634 = fma(_2620, _2612, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2636 = fma(_2620, _2616, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2502 = _2628;
            _2560 = _2634;
            _2568 = _2626;
            _2514 = _2632;
            _2508 = _2630;
            _2576 = _2636;
            _2638 = true;
        }
        else
        {
            bool _2640 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2642 = isnan(_2195);
            bool _2644 = _2640 || _2642;
            bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2648 = _2644 || _2646;
            if (!_2648)
            {
                _2566 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2650 = _2566;
            _2568 = _2650;
            if (!_2648)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2652 = _2500;
            _2502 = _2652;
            if (!_2648)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2654 = _2506;
            _2508 = _2654;
            if (!_2648)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2656 = _2512;
            _2514 = _2656;
            if (!_2648)
            {
                _2558 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2658 = _2558;
            _2560 = _2658;
            if (!_2648)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2660 = _2574;
            bool _2662 = !_2648;
            _2576 = _2660;
            if (!_2662)
            {
                bool _2664 = _2195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2666 = isnan(_2195);
                bool _2668 = _2664 || _2666;
                bool _2670 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2672 = _2668 || _2670;
                if (!_2672)
                {
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2676 = _2195 + _2674;
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2680 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2678;
                    float _2682 = 1.0 / _2680;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2704 = _2676 * _2682;
                    float _2706 = precise::clamp(_2704, 0.0, 1.0);
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2712 = fma(_2706, _2686, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2714 = fma(_2706, _2710, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2716 = fma(_2706, _2690, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2718 = fma(_2706, _2694, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2720 = fma(_2706, _2698, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2722 = fma(_2706, _2702, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2502 = _2714;
                    _2560 = _2720;
                    _2568 = _2712;
                    _2514 = _2718;
                    _2508 = _2716;
                    _2576 = _2722;
                    _2638 = true;
                }
                else
                {
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2560 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2568 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2638 = false;
    float _2724 = _2502;
    float _2726 = _2560;
    float _2728 = _2568;
    float _2730 = _2514;
    float _2732 = _2508;
    float _2734 = _2576;
    float _2736 = fma(_1691, -0.5, 0.5);
    float _2738 = precise::clamp(_2736, 0.0, 1.0);
    float _2740 = -_2724;
    float _2742 = _2740 + _2726;
    float _2744 = _2564 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2746 = -_2728;
    float _2748 = _2746 + _2730;
    float _2750 = fma(_2738, _2742, _2724);
    out.m_84.x = 0.0;
    float _2752 = -_2732;
    float _2754 = _2752 + _2734;
    float _2756 = fma(_2738, _2748, _2728);
    float _2758 = _2750 * 0.586610972881317138671875;
    out.m_51.x = _2744;
    bool _2760 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2762 = fma(_2738, _2754, _2732);
    float _2764 = fma(_2756, 0.298911988735198974609375, _2758);
    bool _2766 = _2009 > 0.0;
    bool _2768 = isnan(_2009);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(0.0);
    bool _2774 = _2770 || _2772;
    float _2776 = fma(_2762, 0.114477999508380889892578125, _2764);
    bool _2778 = _2065 <= 0.0;
    bool _2780 = !_2774;
    bool _2782 = _2778 || _2780;
    float _2784 = -_2776;
    float _2786 = _2756 + _2784;
    float _2788 = -_2776;
    float _2790 = _2750 + _2788;
    float _2792 = -_2776;
    float _2794 = _2762 + _2792;
    float _2796 = fma(_2786, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    float _2800 = fma(_2794, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2776);
    bool _2802 = !_2760;
    if (!_2802)
    {
        float _2804 = -_1943;
        float _2806 = _2804 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2808 = -_1945;
        float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2812 = -_1947;
        float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2816 = _2806 * _2806;
        float _2818 = fma(_2810, _2810, _2816);
        float _2820 = fma(_2814, _2814, _2818);
        float _2822 = sqrt(_2820);
        float _2824 = rsqrt(_2820);
        float _2826 = -_2822;
        float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2830 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2832 = precise::clamp(_2830, 0.0, 1.0);
        float _2834 = _2810 * _2824;
        float _2836 = _2806 * _2824;
        float _2838 = abs(_2832);
        float _2840 = log2(_2838);
        float _2842 = _2814 * _2824;
        float _2844 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2846 = _1691 * _2836;
        float _2848 = -_2836;
        float _2850 = -_2844;
        float _2852 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2850);
        float _2854 = fma(_1673, _2834, _2846);
        float _2856 = -_2842;
        float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2852);
        float _2860 = fma(_1693, _2842, _2854);
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2866 = _2858 + _2864;
        float _2868 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2870 = _2866 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = exp2(_2868);
        float _2876 = _2874 * _2872;
        float _2878 = _2862 * _2876;
        float _2880 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2880;
        out.m_84.y = _2882;
        out.m_84.z = _2884;
    }
    out.m_86.x = _2796;
    out.m_86.y = _2798;
    out.m_86.z = _2800;
    if (!_2782)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2886 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2886;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

