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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
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
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
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
    float _96 = in.m_44.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.y;
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
    float2 _634 = float2(_132, _134);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_634, float2(0.0), isnan(_634))).x;
    float2 _645 = float2(_126, _128);
    float4 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_645, float2(0.0), isnan(_645))).xyzw;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _139.w;
    float2 _661 = float2(_122, _130);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_661, float2(0.0), isnan(_661))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_661, float2(0.0), isnan(_661))).xyzw;
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
    float _171 = in.m_48.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _179 = _114 * _163;
    float _181 = _179 * _124;
    float _183 = in.m_50.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _191 = fma(_181, (*spvDescriptorSet0.fp_c8)._m0[30].w, _189);
    float _193 = 1.0 / _191;
    float _195 = in.m_48.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_48.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _209 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _207);
    float _211 = _147 + (-1.0);
    float _213 = _114 * _169;
    float _215 = _114 * _187;
    float _217 = 1.0 / _209;
    float _219 = _157 + _211;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _223 = _193 * _221;
    float _225 = -_213;
    float _227 = _219 + _225;
    float _229 = _114 * _175;
    float _231 = _229 * _227;
    float _233 = 0.0 + _231;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _239 = -_223;
    float _241 = fma(_217, _237, _239);
    float _243 = _241 * _177;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _235 * _245;
    float _249 = _247 * _215;
    bool _253 = _249 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _255 = isnan(_249);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _261 = _257 || _259;
    float _263 = in.m_46.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_46.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_46.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_48.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _223;
    if (!_261)
    {
        discard_fragment();
    }
    float _289 = _153 * _153;
    float _291 = _151 * _151;
    float _293 = _289 * _143;
    float _295 = _291 * _141;
    float _297 = _155 * _155;
    float _299 = _114 * _199;
    float _301 = _297 * _145;
    float _303 = _114 * _267;
    float _305 = _114 * _273;
    float _307 = _114 * _279;
    float _309 = _114 * _285;
    float _311 = _114 * _205;
    float _313 = -_299;
    float _315 = _305 + _313;
    float _317 = -_309;
    float _319 = _303 + _317;
    float _321 = -_311;
    float _323 = _307 + _321;
    float _325 = fma(_293, _315, _299);
    float _327 = fma(_295, _319, _309);
    float _329 = fma(_301, _323, _311);
    if (!_261)
    {
        out.m_53.x = _327;
        out.m_53.y = _325;
        out.m_53.z = _329;
        out.m_53.w = _231;
        return out;
    }
    float _331 = in.m_55.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_55.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_55.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _114 * _335;
    float _351 = _114 * _341;
    float _353 = _114 * _347;
    float _355 = _349 * _349;
    float _357 = in.m_57.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = fma(_351, _351, _355);
    float _365 = fma(_353, _353, _363);
    float _367 = rsqrt(_365);
    float _369 = _351 * _367;
    float _371 = _349 * _367;
    float _373 = _353 * _367;
    float _375 = _114 * _361;
    float _377 = abs(_369);
    float _379 = abs(_371);
    float _381 = precise::max(_377, _379);
    float _383 = precise::min(_375, 1.0);
    float _385 = abs(_373);
    float _387 = precise::max(_385, _381);
    float _389 = 1.0 / _387;
    float _391 = -_389;
    float _393 = _373 * _391;
    float _395 = _369 * _389;
    float _397 = _371 * _389;
    float3 _1020 = float3(_395, _397, _393);
    float3 _401 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1020, float3(0.0), isnan(_1020)), level(_383)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1020, float3(0.0), isnan(_1020)), level(_383)).xyz;
    float _403 = _401.x;
    float _405 = _401.y;
    float _407 = _401.z;
    float _409 = in.m_59.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_59.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_59.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_61.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_61.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_61.y;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_63.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_63.y;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_63.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_63.w;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    bool _469 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_469)
    {
        float _471 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _473 = _223 + _471;
        _287 = _473;
    }
    float _475 = _287;
    float _477 = _114 * _413;
    float _479 = _114 * _419;
    float _481 = _114 * _431;
    float _483 = _114 * _437;
    float _485 = _114 * _443;
    float _487 = _114 * _455;
    float _489 = fma(_403, 0.20999999344348907470703125, _477);
    float _491 = _114 * _425;
    float _493 = fma(_407, 0.20999999344348907470703125, _479);
    float _495 = _479;
    if (_469)
    {
        float _497 = _475 * 8.0;
        float _499 = precise::clamp(_497, 0.0, 1.0);
        _495 = _499;
    }
    float _501 = _495;
    float _503 = _489 + _481;
    float _505 = fma(_405, 0.20999999344348907470703125, _491);
    float _507 = _493 + _483;
    float _509 = 0.0 + _249;
    float _511 = precise::clamp(_509, 0.0, 1.0);
    float _513 = _114 * _449;
    float _515 = _505 + _485;
    float _517 = _114 * _461;
    float _519 = _114 * _467;
    float _521 = _327 * _503;
    float _523 = _325 * _515;
    float _525 = _329 * _507;
    float _527 = _511;
    if (_469)
    {
        float _529 = _511 * _501;
        _527 = _529;
    }
    float _531 = _527;
    float _533 = fma(_521, _519, _513);
    float _535 = fma(_523, _519, _487);
    float _537 = fma(_525, _519, _517);
    float _539 = 0.0 + _531;
    float _541 = precise::clamp(_539, 0.0, 1.0);
    out.m_53.x = _533;
    out.m_53.y = _535;
    out.m_53.z = _537;
    out.m_53.w = _541;
    return out;
}

