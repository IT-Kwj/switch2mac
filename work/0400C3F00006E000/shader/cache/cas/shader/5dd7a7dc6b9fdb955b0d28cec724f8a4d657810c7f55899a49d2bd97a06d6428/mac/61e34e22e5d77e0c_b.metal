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
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
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
    float2 _573 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
    float2 _584 = float2(_108, _112);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_584, float2(0.0), isnan(_584))).xyzw;
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
    float _179 = in.m_48.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _100 * _183;
    float _187 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _189 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _187);
    float _191 = _129 * _171;
    float _193 = _100 * _147;
    float _195 = _100 * _153;
    float _197 = 1.0 / _189;
    float _199 = _193 * _191;
    float _201 = _100 * _159;
    float _203 = _195 * _199;
    float _205 = 0.0 + _203;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _211 = -_177;
    float _213 = fma(_197, _209, _211);
    float _215 = _213 * _161;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _207 * _217;
    float _221 = _219 * _201;
    bool _225 = _221 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _227 = isnan(_221);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _233 = _229 || _231;
    float _235 = in.m_46.x;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_46.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_48.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_46.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_48.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _100;
    if (!_233)
    {
        discard_fragment();
    }
    float _267 = _100 * _239;
    float _269 = _100 * _245;
    float _271 = _100 * _251;
    float _273 = _100 * _257;
    float _275 = _100 * _263;
    float _277 = -_185;
    float _279 = _269 + _277;
    float _281 = -_271;
    float _283 = _267 + _281;
    float _285 = _123 * _123;
    float _287 = -_275;
    float _289 = _273 + _287;
    float _291 = _125 * _125;
    float _293 = _127 * _127;
    float _295 = fma(_285, _283, _271);
    float _297 = fma(_291, _279, _185);
    float _299 = fma(_293, _289, _275);
    if (!_233)
    {
        out.m_53.x = _295;
        out.m_53.y = _297;
        out.m_53.z = _299;
        out.m_53.w = _203;
        return out;
    }
    float _301 = in.m_55.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_55.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_55.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _100 * _305;
    float _321 = _100 * _311;
    float _323 = _100 * _317;
    float _325 = _319 * _319;
    float _327 = fma(_321, _321, _325);
    float _329 = fma(_323, _323, _327);
    float _331 = rsqrt(_329);
    float _333 = _321 * _331;
    float _335 = _319 * _331;
    float _337 = _323 * _331;
    float _339 = abs(_333);
    float _341 = abs(_335);
    float _343 = precise::max(_339, _341);
    float _345 = abs(_337);
    float _347 = precise::max(_345, _343);
    float _349 = 1.0 / _347;
    float _351 = -_349;
    float _353 = _337 * _351;
    float _355 = _333 * _349;
    float _357 = _335 * _349;
    float3 _928 = float3(_355, _357, _353);
    float3 _361 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_928, float3(0.0), isnan(_928)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_928, float3(0.0), isnan(_928)), level(0.0)).xyz;
    float _363 = _361.x;
    float _365 = _361.y;
    float _367 = _361.z;
    float _369 = in.m_57.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_57.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_57.y;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_61.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_61.y;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_61.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_59.y;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_59.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_59.w;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    bool _429 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _431 = _100 * _373;
    float _433 = _100 * _379;
    float _435 = _100 * _397;
    float _437 = _100 * _403;
    float _439 = _100 * _409;
    float _441 = _100 * _415;
    float _443 = _100 * _427;
    float _445 = fma(_363, 0.20999999344348907470703125, _431);
    float _447 = _100 * _385;
    float _449 = _100 * _391;
    float _451 = _100 * _421;
    float _453 = fma(_367, 0.20999999344348907470703125, _433);
    float _455 = fma(_365, 0.20999999344348907470703125, _447);
    if (_429)
    {
        float _457 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _459 = _177 + _457;
        _265 = _459;
    }
    float _461 = _265;
    float _463 = _445 + _435;
    float _465 = _453 + _439;
    float _467 = _455 + _437;
    float _469 = 0.0 + _221;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = _461;
    float _475 = _471;
    if (_429)
    {
        float _477 = _461 * 8.0;
        float _479 = precise::clamp(_477, 0.0, 1.0);
        _473 = _479;
    }
    float _481 = _473;
    float _483 = _295 * _463;
    float _485 = _297 * _467;
    float _487 = _299 * _465;
    if (_429)
    {
        float _489 = _471 * _481;
        _475 = _489;
    }
    float _491 = _475;
    float _493 = fma(_483, _443, _449);
    float _495 = fma(_485, _443, _441);
    float _497 = fma(_487, _443, _451);
    float _499 = 0.0 + _491;
    float _501 = precise::clamp(_499, 0.0, 1.0);
    out.m_53.x = _493;
    out.m_53.y = _495;
    out.m_53.z = _497;
    out.m_53.w = _501;
    return out;
}

