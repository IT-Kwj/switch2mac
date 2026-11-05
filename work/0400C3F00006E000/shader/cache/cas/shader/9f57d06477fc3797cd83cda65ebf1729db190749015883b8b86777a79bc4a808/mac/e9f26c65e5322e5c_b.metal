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
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_44.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = 1.0 / _72;
    float _118 = _116 * _78;
    float _120 = _116 * _84;
    float _122 = _116 * _90;
    float _124 = _116 * _96;
    float _126 = _116 * _108;
    float _128 = _116 * _114;
    float _130 = 1.0 / _118;
    float _132 = _120 * _130;
    float _134 = _122 * _130;
    float _136 = _116 * _102;
    float2 _714 = float2(_132, _134);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
    float2 _725 = float2(_124, _136);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_725, float2(0.0), isnan(_725))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float2 _741 = float2(_126, _128);
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_741, float2(0.0), isnan(_741))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_741, float2(0.0), isnan(_741))).xyzw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _151.w;
    float _161 = in.m_46.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_46.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_46.z;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_48.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_48.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_48.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_42.z;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_50.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _211 = _209 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _213 = _116 * _165;
    float _215 = _116 * _171;
    float _217 = _213 * _213;
    float _219 = _116 * _177;
    float _221 = fma(_215, _215, _217);
    float _223 = fma(_219, _219, _221);
    float _225 = _116 * _183;
    float _227 = 1.0 / _211;
    float _229 = rsqrt(_223);
    float _231 = _213 * _229;
    float _233 = _116 * _189;
    float _235 = _215 * _229;
    float _237 = _219 * _229;
    float _239 = _225 * _231;
    float _241 = _116 * _201;
    float _243 = in.m_52.w;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = fma(_233, _235, _239);
    float _251 = _116 * _195;
    float _253 = _241 * _130;
    float _255 = in.m_54.w;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_251, _237, _249);
    float _263 = abs(_261);
    float _265 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _271 = fma(_253, (*spvDescriptorSet0.fp_c8)._m0[30].w, _269);
    float _273 = _267 * _227;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _279 = fma(_275, -2.0, 3.0);
    float _281 = _275 * _275;
    float _283 = _279 * _281;
    float _285 = 1.0 / _271;
    float _287 = in.m_54.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_54.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _301 = fma(_138, (*spvDescriptorSet0.fp_c8)._m0[30].w, _299);
    float _303 = 1.0 / _301;
    float _305 = _149 * _159;
    float _307 = _116 * _259;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _311 = _285 * _309;
    float _313 = _305 * _307;
    float _315 = _116 * _247;
    float _317 = _116 * _207;
    float _319 = _315 * _313;
    float _321 = 0.0 + _319;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _327 = -_311;
    float _329 = fma(_303, _325, _327);
    float _331 = _329 * _277;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = _323 * _333;
    float _337 = _335 * _283;
    float _339 = _337 * _317;
    bool _343 = _339 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _345 = isnan(_339);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _351 = _347 || _349;
    float _353 = in.m_52.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_52.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_56.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_52.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_56.z;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_56.y;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = _311;
    if (!_351)
    {
        discard_fragment();
    }
    float _391 = in.m_54.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = _143 * _153;
    float _399 = _145 * _155;
    float _401 = _147 * _157;
    float _403 = _116 * _357;
    float _405 = _116 * _363;
    float _407 = _116 * _369;
    float _409 = _116 * _375;
    float _411 = _116 * _381;
    float _413 = _116 * _387;
    float _415 = -_407;
    float _417 = _403 + _415;
    float _419 = -_411;
    float _421 = _409 + _419;
    float _423 = -_413;
    float _425 = _405 + _423;
    float _427 = fma(_397, _417, _407);
    float _429 = _116 * _297;
    float _431 = fma(_401, _421, _411);
    float _433 = fma(_399, _425, _413);
    float _435 = _116 * _291;
    float _437 = _116 * _395;
    float _439 = _427 * _435;
    float _441 = _433 * _429;
    float _443 = _431 * _437;
    if (!_351)
    {
        out.m_59.x = _439;
        out.m_59.y = _441;
        out.m_59.z = _443;
        out.m_59.w = _319;
        return out;
    }
    float _445 = _225 * _225;
    float _447 = fma(_233, _233, _445);
    float _449 = fma(_251, _251, _447);
    float _451 = rsqrt(_449);
    float _453 = _233 * _451;
    float _455 = _225 * _451;
    float _457 = _251 * _451;
    float _459 = abs(_453);
    float _461 = abs(_455);
    float _463 = precise::max(_459, _461);
    float _465 = abs(_457);
    float _467 = precise::max(_465, _463);
    float _469 = 1.0 / _467;
    float _471 = -_469;
    float _473 = _457 * _471;
    float _475 = _453 * _469;
    float _477 = _455 * _469;
    float3 _1212 = float3(_475, _477, _473);
    float3 _481 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1212, float3(0.0), isnan(_1212)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1212, float3(0.0), isnan(_1212)), level(0.0)).xyz;
    float _483 = _481.x;
    float _485 = _481.y;
    float _487 = _481.z;
    float _489 = in.m_61.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_61.z;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_61.y;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_63.z;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_63.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_63.y;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_65.x;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_65.y;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_65.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_65.w;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    bool _549 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_549)
    {
        float _551 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _553 = _311 + _551;
        _389 = _553;
    }
    float _555 = _389;
    float _557 = _116 * _493;
    float _559 = _116 * _499;
    float _561 = _116 * _511;
    float _563 = _116 * _517;
    float _565 = _116 * _535;
    float _567 = _116 * _541;
    float _569 = fma(_483, 0.20999999344348907470703125, _557);
    float _571 = _116 * _505;
    float _573 = fma(_487, 0.20999999344348907470703125, _559);
    float _575 = _116 * _523;
    float _577 = _569 + _563;
    float _579 = fma(_485, 0.20999999344348907470703125, _571);
    float _581 = _573 + _561;
    float _583 = 0.0 + _339;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _559;
    float _589 = _585;
    if (_549)
    {
        float _591 = _555 * 8.0;
        float _593 = precise::clamp(_591, 0.0, 1.0);
        _587 = _593;
    }
    float _595 = _587;
    float _597 = _579 + _575;
    float _599 = _116 * _529;
    float _601 = _116 * _547;
    float _603 = _439 * _577;
    float _605 = _441 * _597;
    float _607 = _443 * _581;
    if (_549)
    {
        float _609 = _585 * _595;
        _589 = _609;
    }
    float _611 = _589;
    float _613 = fma(_603, _601, _599);
    float _615 = fma(_605, _601, _565);
    float _617 = fma(_607, _601, _567);
    float _619 = 0.0 + _611;
    float _621 = precise::clamp(_619, 0.0, 1.0);
    out.m_59.x = _613;
    out.m_59.y = _615;
    out.m_59.z = _617;
    out.m_59.w = _621;
    return out;
}

