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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_46.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = 1.0 / _74;
    float _120 = _118 * _80;
    float _122 = _118 * _86;
    float _124 = _118 * _92;
    float _126 = _118 * _98;
    float _128 = 1.0 / _120;
    float _130 = _118 * _104;
    float _132 = _118 * _110;
    float _134 = _118 * _116;
    float _136 = _122 * _128;
    float _138 = _124 * _128;
    float2 _679 = float2(_136, _138);
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_679, float2(0.0), isnan(_679))).x;
    float2 _690 = float2(_126, _130);
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float2 _706 = float2(_132, _134);
    float4 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_706, float2(0.0), isnan(_706))).xyzw;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float _161 = _153.w;
    float _163 = in.m_42.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_48.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_50.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_52.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _189 = _118 * _167;
    float _191 = _189 * _128;
    float _193 = in.m_54.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _201 = fma(_191, (*spvDescriptorSet0.fp_c8)._m0[30].w, _199);
    float _203 = 1.0 / _201;
    float _205 = in.m_52.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_52.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_48.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_52.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _231 = fma(_140, (*spvDescriptorSet0.fp_c8)._m0[30].w, _229);
    float _233 = _118 * _173;
    float _235 = 1.0 / _231;
    float _237 = _151 * _161;
    float _239 = _118 * _179;
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = _203 * _241;
    float _245 = -_233;
    float _247 = fma(_237, _239, _245);
    float _249 = _118 * _185;
    float _251 = _118 * _197;
    float _253 = _249 * _247;
    float _255 = 0.0 + _253;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _261 = -_243;
    float _263 = fma(_235, _259, _261);
    float _265 = _263 * _187;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _257 * _267;
    float _271 = _269 * _251;
    bool _275 = _271 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _277 = isnan(_271);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _283 = _279 || _281;
    float _285 = in.m_48.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_48.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_50.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_50.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    if (!_283)
    {
        discard_fragment();
    }
    float _309 = in.m_50.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _147 * _147;
    float _317 = _157 * _157;
    float _319 = _145 * _145;
    float _321 = _155 * _155;
    float _323 = _118 * _209;
    float _325 = _315 * _317;
    float _327 = _159 * _159;
    float _329 = _319 * _321;
    float _331 = _149 * _149;
    float _333 = _118 * _215;
    float _335 = _118 * _221;
    float _337 = _331 * _327;
    float _339 = _118 * _289;
    float _341 = _118 * _295;
    float _343 = _118 * _227;
    float _345 = _118 * _301;
    float _347 = -_323;
    float _349 = _339 + _347;
    float _351 = -_333;
    float _353 = _341 + _351;
    float _355 = -_343;
    float _357 = _335 + _355;
    float _359 = _118 * _307;
    float _361 = fma(_329, _349, _323);
    float _363 = fma(_325, _353, _333);
    float _365 = fma(_337, _357, _343);
    float _367 = _361 * _345;
    float _369 = _118 * _313;
    float _371 = _363 * _359;
    float _373 = _365 * _369;
    if (!_283)
    {
        out.m_57.x = _367;
        out.m_57.y = _371;
        out.m_57.z = _373;
        out.m_57.w = _253;
        return out;
    }
    float _375 = in.m_59.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_59.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = _118 * _379;
    float _395 = _118 * _385;
    float _397 = _118 * _391;
    float _399 = _393 * _393;
    float _401 = in.m_61.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_395, _395, _399);
    float _409 = fma(_397, _397, _407);
    float _411 = rsqrt(_409);
    float _413 = _395 * _411;
    float _415 = _393 * _411;
    float _417 = _397 * _411;
    float _419 = _118 * _405;
    float _421 = abs(_413);
    float _423 = abs(_415);
    float _425 = precise::max(_421, _423);
    float _427 = abs(_417);
    float _429 = precise::max(_427, _425);
    float _431 = 1.0 / _429;
    float _433 = _413 * _431;
    float _435 = _415 * _431;
    float _437 = -_431;
    float _439 = _417 * _437;
    float _441 = precise::min(_419, 1.0);
    float3 _1121 = float3(_433, _435, _439);
    float3 _445 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1121, float3(0.0), isnan(_1121)), level(_441)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1121, float3(0.0), isnan(_1121)), level(_441)).xyz;
    float _447 = _445.x;
    float _449 = _445.y;
    float _451 = _445.z;
    float _453 = in.m_63.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_63.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_63.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_65.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_65.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_65.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_67.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_67.y;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_67.z;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_67.w;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    bool _513 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _515 = _118 * _457;
    float _517 = _118 * _469;
    float _519 = _118 * _475;
    float _521 = _118 * _481;
    float _523 = _118 * _487;
    float _525 = _118 * _499;
    float _527 = _118 * _505;
    float _529 = fma(_447, 0.20999999344348907470703125, _515);
    float _531 = _118 * _463;
    float _533 = fma(_449, 0.20999999344348907470703125, _517);
    float _535 = _118 * _493;
    float _537 = _529 + _521;
    float _539 = fma(_451, 0.20999999344348907470703125, _531);
    float _541 = _531;
    if (_513)
    {
        float _543 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _545 = _243 + _543;
        _541 = _545;
    }
    float _547 = _541;
    float _549 = _533 + _523;
    float _551 = _118 * _511;
    float _553 = _539 + _519;
    float _555 = 0.0 + _271;
    float _557 = precise::clamp(_555, 0.0, 1.0);
    float _559 = _547;
    float _561 = _557;
    if (_513)
    {
        float _563 = _547 * 8.0;
        float _565 = precise::clamp(_563, 0.0, 1.0);
        _559 = _565;
    }
    float _567 = _559;
    float _569 = _367 * _537;
    float _571 = _371 * _549;
    float _573 = _373 * _553;
    if (_513)
    {
        float _575 = _557 * _567;
        _561 = _575;
    }
    float _577 = _561;
    float _579 = fma(_569, _551, _535);
    float _581 = fma(_571, _551, _525);
    float _583 = fma(_573, _551, _527);
    float _585 = 0.0 + _577;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    out.m_57.x = _579;
    out.m_57.y = _581;
    out.m_57.z = _583;
    out.m_57.w = _587;
    return out;
}

