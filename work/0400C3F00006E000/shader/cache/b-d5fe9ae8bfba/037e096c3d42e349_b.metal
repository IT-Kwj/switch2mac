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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_45 [[user(locn6), flat]];
    float4 m_58 [[user(locn7)]];
    float4 m_62 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_43.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_43.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_43.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_45.x;
    float _93 = in.m_47.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_47.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _71;
    float _107 = rint(_91);
    float _109 = precise::max(_107, 0.0);
    uint _112 = uint(_109);
    uint _114 = clamp(_112, 0u, 65535u);
    float _116 = _105 * _77;
    float _118 = _105 * _83;
    float _120 = _105 * _89;
    float _122 = _105 * _97;
    float _124 = 1.0 / _116;
    float _126 = _105 * _103;
    float _128 = _118 * _124;
    float _130 = _120 * _124;
    float2 _581 = float2(_128, _130);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float3 _594 = float3(_126, _122, float(int(_114)));
    float3 _598 = select(_594, float3(0.0), isnan(_594));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _598.xy, uint(rint(_598.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _598.xy, uint(rint(_598.z))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = in.m_43.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_49.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_51.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _165 = _105 * _149;
    float _167 = _105 * _155;
    float _169 = _165 * _124;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _173 = fma(_169, (*spvDescriptorSet0.fp_c8)._m0[30].w, _171);
    float _175 = 1.0 / _173;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _179 = _175 * _177;
    float _181 = in.m_49.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_53.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_53.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _201 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _199);
    float _203 = 1.0 / _201;
    float _205 = _143 * _167;
    float _207 = _105 * _161;
    float _209 = 0.0 + _205;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = -_179;
    float _217 = fma(_203, _213, _215);
    float _219 = _217 * _163;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _211 * _221;
    float _225 = _223 * _207;
    bool _229 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _237 = _233 || _235;
    float _239 = in.m_49.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_53.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_49.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = _179;
    if (!_237)
    {
        discard_fragment();
    }
    float _259 = _105 * _185;
    float _261 = _105 * _191;
    float _263 = _105 * _243;
    float _265 = _105 * _249;
    float _267 = _105 * _255;
    float _269 = _105 * _197;
    float _271 = -_261;
    float _273 = _263 + _271;
    float _275 = -_265;
    float _277 = _259 + _275;
    float _279 = _137 * _137;
    float _281 = -_269;
    float _283 = _267 + _281;
    float _285 = _139 * _139;
    float _287 = _141 * _141;
    float _289 = fma(_279, _277, _265);
    float _291 = fma(_285, _273, _261);
    float _293 = fma(_287, _283, _269);
    if (!_237)
    {
        out.m_56.x = _289;
        out.m_56.y = _291;
        out.m_56.z = _293;
        out.m_56.w = _205;
        return out;
    }
    float _295 = in.m_58.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_58.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_58.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _105 * _299;
    float _315 = _105 * _305;
    float _317 = _105 * _311;
    float _319 = _313 * _313;
    float _321 = fma(_315, _315, _319);
    float _323 = fma(_317, _317, _321);
    float _325 = rsqrt(_323);
    float _327 = _315 * _325;
    float _329 = _313 * _325;
    float _331 = _317 * _325;
    float _333 = abs(_327);
    float _335 = abs(_329);
    float _337 = precise::max(_333, _335);
    float _339 = abs(_331);
    float _341 = precise::max(_339, _337);
    float _343 = 1.0 / _341;
    float _345 = -_343;
    float _347 = _331 * _345;
    float _349 = _327 * _343;
    float _351 = _329 * _343;
    float3 _913 = float3(_349, _351, _347);
    float3 _355 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_913, float3(0.0), isnan(_913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_913, float3(0.0), isnan(_913)), level(0.0)).xyz;
    float _357 = _355.x;
    float _359 = _355.y;
    float _361 = _355.z;
    float _363 = in.m_60.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_60.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_60.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_62.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_62.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_62.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_64.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_64.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_64.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_64.w;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    bool _423 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_423)
    {
        float _425 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _427 = _179 + _425;
        _257 = _427;
    }
    float _429 = _257;
    float _431 = _429;
    if (_423)
    {
        float _433 = _429 * 8.0;
        float _435 = precise::clamp(_433, 0.0, 1.0);
        _431 = _435;
    }
    float _437 = _431;
    float _439 = _105 * _367;
    float _441 = _105 * _379;
    float _443 = _105 * _385;
    float _445 = _105 * _391;
    float _447 = _105 * _397;
    float _449 = _105 * _409;
    float _451 = fma(_357, 0.20999999344348907470703125, _439);
    float _453 = _105 * _373;
    float _455 = fma(_359, 0.20999999344348907470703125, _441);
    float _457 = _105 * _403;
    float _459 = _451 + _445;
    float _461 = fma(_361, 0.20999999344348907470703125, _453);
    float _463 = _455 + _447;
    float _465 = _105 * _415;
    float _467 = _105 * _421;
    float _469 = _461 + _443;
    float _471 = 0.0 + _225;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = _289 * _459;
    float _477 = _291 * _463;
    float _479 = _293 * _469;
    float _481 = _473;
    if (_423)
    {
        float _483 = _473 * _437;
        _481 = _483;
    }
    float _485 = _481;
    float _487 = fma(_475, _467, _457);
    float _489 = fma(_477, _467, _449);
    float _491 = fma(_479, _467, _465);
    float _493 = 0.0 + _485;
    float _495 = precise::clamp(_493, 0.0, 1.0);
    out.m_56.x = _487;
    out.m_56.y = _489;
    out.m_56.z = _491;
    out.m_56.w = _495;
    return out;
}

