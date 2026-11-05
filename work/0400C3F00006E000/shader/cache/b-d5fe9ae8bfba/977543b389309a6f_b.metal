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
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.w;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = 1.0 / _66;
    float _100 = _98 * _72;
    float _102 = _98 * _78;
    float _104 = _98 * _84;
    float _106 = _98 * _90;
    float _108 = 1.0 / _100;
    float _110 = _98 * _96;
    float _112 = _102 * _108;
    float _114 = _104 * _108;
    float2 _557 = float2(_112, _114);
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_557, float2(0.0), isnan(_557))).x;
    float2 _568 = float2(_106, _110);
    float4 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).xyzw;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _119.w;
    float _129 = in.m_40.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_44.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_46.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_48.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _155 = _98 * _133;
    float _157 = _155 * _108;
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _161 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[30].w, _159);
    float _163 = _98 * _139;
    float _165 = 1.0 / _161;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _169 = _165 * _167;
    float _171 = in.m_46.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_44.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_44.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_44.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_116, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = -_163;
    float _201 = _127 + _199;
    float _203 = _98 * _145;
    float _205 = 1.0 / _197;
    float _207 = _203 * _201;
    float _209 = 0.0 + _207;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = -_169;
    float _217 = fma(_205, _213, _215);
    float _219 = _98 * _151;
    float _221 = _217 * _153;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _211 * _223;
    float _227 = _225 * _219;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_50.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_50.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_50.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _169;
    if (!_239)
    {
        discard_fragment();
    }
    float _261 = in.m_46.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_46.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = _98 * _245;
    float _275 = _98 * _251;
    float _277 = _98 * _257;
    float _279 = _273 * _273;
    float _281 = fma(_275, _275, _279);
    float _283 = _123 * _123;
    float _285 = fma(_277, _277, _281);
    float _287 = _121 * _121;
    float _289 = -_283;
    float _291 = _289 + 1.0;
    float _293 = _98 * _175;
    float _295 = rsqrt(_285);
    float _297 = _98 * _265;
    float _299 = _125 * _125;
    float _301 = _98 * _271;
    float _303 = -_287;
    float _305 = _303 + 1.0;
    float _307 = -_299;
    float _309 = _307 + 1.0;
    float _311 = _301 * _291;
    float _313 = _297 * _305;
    float _315 = _98 * _181;
    float _317 = _293 * _309;
    float _319 = _98 * _187;
    float _321 = _98 * _193;
    float _323 = fma(_287, _315, _313);
    float _325 = fma(_283, _319, _311);
    float _327 = fma(_299, _321, _317);
    float _329 = _275 * _295;
    float _331 = _273 * _295;
    float _333 = _277 * _295;
    if (!_239)
    {
        out.m_53.x = _323;
        out.m_53.y = _325;
        out.m_53.z = _327;
        out.m_53.w = _207;
        return out;
    }
    float _335 = in.m_55.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _331 * _331;
    float _343 = fma(_329, _329, _341);
    float _345 = fma(_333, _333, _343);
    float _347 = abs(_329);
    float _349 = abs(_331);
    float _351 = precise::max(_347, _349);
    float _353 = abs(_333);
    float _355 = precise::max(_353, _351);
    float _357 = rsqrt(_345);
    float _359 = 1.0 / _355;
    float _361 = -_331;
    float _363 = fma(_361, _357, 0.0);
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _98 * _339;
    float _369 = _365 + _367;
    float _371 = _329 * _359;
    float _373 = _331 * _359;
    float _375 = -_359;
    float _377 = _333 * _375;
    float _379 = precise::min(_369, 1.0);
    float3 _942 = float3(_371, _373, _377);
    float3 _383 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_942, float3(0.0), isnan(_942)), level(_379)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_942, float3(0.0), isnan(_942)), level(_379)).xyz;
    float _385 = _383.x;
    float _387 = _383.y;
    float _389 = _383.z;
    float _391 = in.m_57.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_57.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_57.z;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_59.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_59.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_59.z;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    bool _427 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_427)
    {
        float _429 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _431 = _169 + _429;
        _259 = _431;
    }
    float _433 = _259;
    float _435 = _433;
    if (_427)
    {
        float _437 = _433 * 8.0;
        float _439 = precise::clamp(_437, 0.0, 1.0);
        _435 = _439;
    }
    float _441 = _435;
    float _443 = _98 * _395;
    float _445 = _98 * _401;
    float _447 = _98 * _407;
    float _449 = _98 * _413;
    float _451 = _98 * _419;
    float _453 = _98 * _425;
    float _455 = fma(_385, 0.20999999344348907470703125, _443);
    float _457 = fma(_387, 0.20999999344348907470703125, _445);
    float _459 = fma(_389, 0.20999999344348907470703125, _447);
    float _461 = 0.0 + _227;
    float _463 = precise::clamp(_461, 0.0, 1.0);
    float _465 = _455 + _449;
    float _467 = _457 + _451;
    float _469 = _459 + _453;
    float _471 = _463;
    if (_427)
    {
        float _473 = _463 * _441;
        _471 = _473;
    }
    float _475 = _471;
    float _477 = _323 * _465;
    float _479 = _325 * _467;
    float _481 = _327 * _469;
    float _483 = 0.0 + _475;
    float _485 = precise::clamp(_483, 0.0, 1.0);
    out.m_53.x = _477;
    out.m_53.y = _479;
    out.m_53.z = _481;
    out.m_53.w = _485;
    return out;
}

