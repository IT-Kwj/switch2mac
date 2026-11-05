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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_44.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_44.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.w;
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
    float _130 = _122 * _128;
    float _132 = _124 * _128;
    float _134 = _118 * _104;
    float _136 = _118 * _110;
    float _138 = _118 * _116;
    float2 _678 = float2(_130, _132);
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_678, float2(0.0), isnan(_678))).x;
    float2 _689 = float2(_126, _134);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_689, float2(0.0), isnan(_689))).w;
    float2 _697 = float2(_136, _138);
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_697, float2(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_697, float2(0.0), isnan(_697))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float _155 = in.m_48.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_44.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_48.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_48.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_50.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _118 * _159;
    float _187 = in.m_52.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _118 * _165;
    float _195 = _118 * _171;
    float _197 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _199 = _185 + _197;
    float _201 = _193 * _128;
    float _203 = _118 * _177;
    float _205 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _207 = _195 + _205;
    float _209 = in.m_54.x;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_201, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = _199 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _221 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _223 = _203 + _221;
    float _225 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _227 = fma(_207, (*spvDescriptorSet0.fp_c10)._m0[8].x, _219);
    float _229 = fma(_223, (*spvDescriptorSet0.fp_c10)._m0[10].x, _227);
    float _231 = 1.0 / _217;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = _231 * _233;
    float _237 = _118 * _213;
    float _239 = in.m_50.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_50.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_50.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _259 = fma(_140, (*spvDescriptorSet0.fp_c8)._m0[30].w, _257);
    float _261 = _142 + (-1.0);
    float _263 = 1.0 / _259;
    float _265 = _153 + _261;
    float _267 = _118 * _183;
    float _269 = -_267;
    float _271 = _269 + _265;
    float _273 = _118 * _191;
    float _275 = _273 * _271;
    float _277 = _229 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _283 = -_235;
    float _285 = fma(_263, _281, _283);
    float _287 = _275 * _279;
    float _289 = _285 * _225;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = 0.0 + _287;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _295 * _291;
    float _299 = _297 * _237;
    bool _303 = _299 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _305 = isnan(_299);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _311 = _307 || _309;
    float _313 = in.m_52.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_52.z;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_52.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = _235;
    if (!_311)
    {
        discard_fragment();
    }
    float _333 = _147 * _147;
    float _335 = _151 * _151;
    float _337 = -_333;
    float _339 = _337 + 1.0;
    float _341 = _118 * _317;
    float _343 = _149 * _149;
    float _345 = _118 * _323;
    float _347 = _118 * _329;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = -_343;
    float _355 = _353 + 1.0;
    float _357 = _347 * _339;
    float _359 = _345 * _351;
    float _361 = _341 * _355;
    float _363 = _118 * _249;
    float _365 = _118 * _243;
    float _367 = _118 * _255;
    float _369 = fma(_333, _363, _357);
    float _371 = fma(_343, _365, _361);
    float _373 = fma(_335, _367, _359);
    if (!_311)
    {
        out.m_57.x = _369;
        out.m_57.y = _371;
        out.m_57.z = _373;
        out.m_57.w = _287;
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
    float _427 = precise::min(_419, 1.0);
    float _429 = abs(_417);
    float _431 = precise::max(_429, _425);
    float _433 = 1.0 / _431;
    float _435 = -_433;
    float _437 = _417 * _435;
    float _439 = _413 * _433;
    float _441 = _415 * _433;
    float3 _1128 = float3(_439, _441, _437);
    float3 _445 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1128, float3(0.0), isnan(_1128)), level(_427)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1128, float3(0.0), isnan(_1128)), level(_427)).xyz;
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
    if (_513)
    {
        float _515 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _517 = _235 + _515;
        _331 = _517;
    }
    float _519 = _331;
    float _521 = _519;
    if (_513)
    {
        float _523 = _519 * 8.0;
        float _525 = precise::clamp(_523, 0.0, 1.0);
        _521 = _525;
    }
    float _527 = _521;
    float _529 = _118 * _457;
    float _531 = _118 * _463;
    float _533 = _118 * _475;
    float _535 = _118 * _481;
    float _537 = _118 * _487;
    float _539 = _118 * _499;
    float _541 = fma(_447, 0.20999999344348907470703125, _529);
    float _543 = _118 * _469;
    float _545 = fma(_451, 0.20999999344348907470703125, _531);
    float _547 = _118 * _493;
    float _549 = _541 + _535;
    float _551 = fma(_449, 0.20999999344348907470703125, _543);
    float _553 = _545 + _533;
    float _555 = 0.0 + _299;
    float _557 = precise::clamp(_555, 0.0, 1.0);
    float _559 = _118 * _505;
    float _561 = _551 + _537;
    float _563 = _118 * _511;
    float _565 = _369 * _549;
    float _567 = _373 * _553;
    float _569 = _371 * _561;
    float _571 = _557;
    if (_513)
    {
        float _573 = _557 * _527;
        _571 = _573;
    }
    float _575 = _571;
    float _577 = fma(_565, _563, _547);
    float _579 = fma(_567, _563, _559);
    float _581 = fma(_569, _563, _539);
    float _583 = 0.0 + _575;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    out.m_57.x = _577;
    out.m_57.y = _581;
    out.m_57.z = _579;
    out.m_57.w = _585;
    return out;
}

