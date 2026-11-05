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
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _68;
    float _102 = _100 * _74;
    float _104 = _100 * _80;
    float _106 = _100 * _86;
    float _108 = _100 * _92;
    float _110 = 1.0 / _102;
    float _112 = _100 * _98;
    float _114 = _104 * _110;
    float _116 = _106 * _110;
    float2 _597 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _608 = float2(_108, _112);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_608, float2(0.0), isnan(_608))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_608, float2(0.0), isnan(_608))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_40.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_44.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_48.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_50.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _163 = _100 * _135;
    float _165 = _163 * _110;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c8)._m0[30].w, _167);
    float _171 = _100 * _141;
    float _173 = 1.0 / _169;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _177 = _173 * _175;
    float _179 = _100 * _159;
    float _181 = in.m_44.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_48.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_46.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_46.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_46.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _213 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _211);
    float _215 = _100 * _147;
    float _217 = 1.0 / _213;
    float _219 = -_171;
    float _221 = fma(_129, _215, _219);
    float _223 = _100 * _153;
    float _225 = _223 * _221;
    float _227 = 0.0 + _225;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _233 = -_177;
    float _235 = fma(_217, _231, _233);
    float _237 = _235 * _161;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _229 * _239;
    float _243 = _241 * _179;
    bool _247 = _243 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _249 = isnan(_243);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _255 = _251 || _253;
    float _257 = in.m_44.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_48.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_48.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_44.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _100;
    if (!_255)
    {
        discard_fragment();
    }
    float _283 = _100 * _261;
    float _285 = _100 * _267;
    float _287 = _100 * _185;
    float _289 = _100 * _273;
    float _291 = _100 * _279;
    float _293 = _100 * _191;
    float _295 = -_285;
    float _297 = _283 + _295;
    float _299 = -_289;
    float _301 = _287 + _299;
    float _303 = -_293;
    float _305 = _291 + _303;
    float _307 = fma(_123, _297, _285);
    float _309 = fma(_125, _301, _289);
    float _311 = _100 * _197;
    float _313 = fma(_127, _305, _293);
    float _315 = _100 * _203;
    float _317 = _100 * _209;
    float _319 = _307 * _311;
    float _321 = _309 * _315;
    float _323 = _313 * _317;
    if (!_255)
    {
        out.m_53.x = _319;
        out.m_53.y = _321;
        out.m_53.z = _323;
        out.m_53.w = _225;
        return out;
    }
    float _325 = in.m_55.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_55.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_55.z;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = _100 * _329;
    float _345 = _100 * _335;
    float _347 = _100 * _341;
    float _349 = _343 * _343;
    float _351 = fma(_345, _345, _349);
    float _353 = fma(_347, _347, _351);
    float _355 = rsqrt(_353);
    float _357 = _345 * _355;
    float _359 = _343 * _355;
    float _361 = _347 * _355;
    float _363 = abs(_357);
    float _365 = abs(_359);
    float _367 = precise::max(_363, _365);
    float _369 = abs(_361);
    float _371 = precise::max(_369, _367);
    float _373 = 1.0 / _371;
    float _375 = -_373;
    float _377 = _361 * _375;
    float _379 = _357 * _373;
    float _381 = _359 * _373;
    float3 _982 = float3(_379, _381, _377);
    float3 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_982, float3(0.0), isnan(_982)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_982, float3(0.0), isnan(_982)), level(0.0)).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    float _393 = in.m_57.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_57.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_57.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_59.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_61.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_61.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_61.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_59.y;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_59.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_59.w;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    bool _453 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _455 = _100 * _397;
    float _457 = _100 * _403;
    float _459 = _100 * _421;
    float _461 = _100 * _427;
    float _463 = _100 * _433;
    float _465 = _100 * _439;
    float _467 = _100 * _451;
    float _469 = fma(_387, 0.20999999344348907470703125, _455);
    float _471 = _100 * _409;
    float _473 = _100 * _415;
    float _475 = _100 * _445;
    float _477 = fma(_391, 0.20999999344348907470703125, _457);
    float _479 = fma(_389, 0.20999999344348907470703125, _471);
    if (_453)
    {
        float _481 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _483 = _177 + _481;
        _281 = _483;
    }
    float _485 = _281;
    float _487 = _469 + _459;
    float _489 = _477 + _463;
    float _491 = _479 + _461;
    float _493 = 0.0 + _243;
    float _495 = precise::clamp(_493, 0.0, 1.0);
    float _497 = _485;
    float _499 = _495;
    if (_453)
    {
        float _501 = _485 * 8.0;
        float _503 = precise::clamp(_501, 0.0, 1.0);
        _497 = _503;
    }
    float _505 = _497;
    float _507 = _319 * _487;
    float _509 = _321 * _491;
    float _511 = _323 * _489;
    if (_453)
    {
        float _513 = _495 * _505;
        _499 = _513;
    }
    float _515 = _499;
    float _517 = fma(_507, _467, _473);
    float _519 = fma(_509, _467, _465);
    float _521 = fma(_511, _467, _475);
    float _523 = 0.0 + _515;
    float _525 = precise::clamp(_523, 0.0, 1.0);
    out.m_53.x = _517;
    out.m_53.y = _519;
    out.m_53.z = _521;
    out.m_53.w = _525;
    return out;
}

