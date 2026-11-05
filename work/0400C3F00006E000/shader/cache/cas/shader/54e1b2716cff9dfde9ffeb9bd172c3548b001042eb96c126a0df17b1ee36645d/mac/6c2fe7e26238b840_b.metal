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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _70;
    float _116 = _114 * _76;
    float _118 = _114 * _82;
    float _120 = _114 * _88;
    float _122 = _114 * _94;
    float _124 = 1.0 / _116;
    float _126 = _114 * _100;
    float _128 = _114 * _106;
    float _130 = _114 * _112;
    float _132 = _118 * _124;
    float _134 = _120 * _124;
    float2 _614 = float2(_132, _134);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_614, float2(0.0), isnan(_614))).x;
    float2 _625 = float2(_122, _126);
    float4 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_625, float2(0.0), isnan(_625))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_625, float2(0.0), isnan(_625))).xyzw;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _139.w;
    float2 _641 = float2(_128, _130);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_641, float2(0.0), isnan(_641))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float _159 = in.m_42.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_46.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _173 = _114 * _163;
    float _175 = _173 * _124;
    float _177 = in.m_48.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _185 = fma(_175, (*spvDescriptorSet0.fp_c8)._m0[30].w, _183);
    float _187 = _114 * _169;
    float _189 = 1.0 / _185;
    float _191 = in.m_50.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_50.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_46.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_50.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = 1.0 / _217;
    float _221 = _147 * _157;
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _225 = _189 * _223;
    float _227 = _114 * _181;
    float _229 = _221 * _187;
    float _231 = 0.0 + _229;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _237 = -_225;
    float _239 = fma(_219, _235, _237);
    float _241 = _239 * _171;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _233 * _243;
    float _247 = _245 * _227;
    bool _251 = _247 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _253 = isnan(_247);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _259 = _255 || _257;
    float _261 = in.m_46.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_46.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    if (!_259)
    {
        discard_fragment();
    }
    float _273 = _141 * _151;
    float _275 = _143 * _153;
    float _277 = _114 * _195;
    float _279 = _114 * _201;
    float _281 = _114 * _207;
    float _283 = _114 * _213;
    float _285 = _145 * _155;
    float _287 = -_283;
    float _289 = _281 + _287;
    float _291 = fma(_285, _289, _283);
    float _293 = _114 * _265;
    float _295 = _114 * _271;
    float _297 = -_277;
    float _299 = _293 + _297;
    float _301 = -_279;
    float _303 = _295 + _301;
    float _305 = fma(_273, _299, _277);
    float _307 = fma(_275, _303, _279);
    if (!_259)
    {
        out.m_53.x = _305;
        out.m_53.y = _307;
        out.m_53.z = _291;
        out.m_53.w = _229;
        return out;
    }
    float _309 = in.m_55.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_55.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_55.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = _114 * _313;
    float _329 = _114 * _319;
    float _331 = _114 * _325;
    float _333 = _327 * _327;
    float _335 = in.m_57.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = fma(_329, _329, _333);
    float _343 = fma(_331, _331, _341);
    float _345 = rsqrt(_343);
    float _347 = _329 * _345;
    float _349 = _327 * _345;
    float _351 = _331 * _345;
    float _353 = _114 * _339;
    float _355 = abs(_347);
    float _357 = abs(_349);
    float _359 = precise::max(_355, _357);
    float _361 = abs(_351);
    float _363 = precise::max(_361, _359);
    float _365 = 1.0 / _363;
    float _367 = _347 * _365;
    float _369 = _349 * _365;
    float _371 = -_365;
    float _373 = _351 * _371;
    float _375 = precise::min(_353, 1.0);
    float3 _972 = float3(_367, _369, _373);
    float3 _379 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_972, float3(0.0), isnan(_972)), level(_375)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_972, float3(0.0), isnan(_972)), level(_375)).xyz;
    float _381 = _379.x;
    float _383 = _379.y;
    float _385 = _379.z;
    float _387 = in.m_59.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_59.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.y;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_61.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_61.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_61.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_63.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_63.y;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_63.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_63.w;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    bool _447 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _449 = _114 * _391;
    float _451 = _114 * _403;
    float _453 = _114 * _409;
    float _455 = _114 * _415;
    float _457 = _114 * _421;
    float _459 = _114 * _433;
    float _461 = _114 * _439;
    float _463 = fma(_381, 0.20999999344348907470703125, _449);
    float _465 = _114 * _397;
    float _467 = fma(_383, 0.20999999344348907470703125, _451);
    float _469 = _114 * _427;
    float _471 = _463 + _455;
    float _473 = fma(_385, 0.20999999344348907470703125, _465);
    float _475 = _465;
    if (_447)
    {
        float _477 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _479 = _225 + _477;
        _475 = _479;
    }
    float _481 = _475;
    float _483 = _467 + _457;
    float _485 = _114 * _445;
    float _487 = _473 + _453;
    float _489 = 0.0 + _247;
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = _481;
    float _495 = _491;
    if (_447)
    {
        float _497 = _481 * 8.0;
        float _499 = precise::clamp(_497, 0.0, 1.0);
        _493 = _499;
    }
    float _501 = _493;
    float _503 = _305 * _471;
    float _505 = _307 * _483;
    float _507 = _291 * _487;
    if (_447)
    {
        float _509 = _491 * _501;
        _495 = _509;
    }
    float _511 = _495;
    float _513 = fma(_503, _485, _469);
    float _515 = fma(_505, _485, _459);
    float _517 = fma(_507, _485, _461);
    float _519 = 0.0 + _511;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    out.m_53.x = _513;
    out.m_53.y = _515;
    out.m_53.z = _517;
    out.m_53.w = _521;
    return out;
}

