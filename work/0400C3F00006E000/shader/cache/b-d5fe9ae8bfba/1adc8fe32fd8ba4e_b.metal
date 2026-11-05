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
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
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
    float4 m_65 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_44.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_48.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_48.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = 1.0 / _76;
    float _122 = _120 * _82;
    float _124 = _120 * _88;
    float _126 = _120 * _94;
    float _128 = _120 * _100;
    float _130 = 1.0 / _122;
    float _132 = _120 * _106;
    float _134 = _120 * _112;
    float _136 = _120 * _118;
    float _138 = _124 * _130;
    float _140 = _126 * _130;
    float2 _681 = float2(_138, _140);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_681, float2(0.0), isnan(_681))).x;
    float2 _692 = float2(_128, _132);
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_692, float2(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_692, float2(0.0), isnan(_692))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float2 _708 = float2(_134, _136);
    float4 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_708, float2(0.0), isnan(_708))).xyzw;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = _155.w;
    float _165 = in.m_44.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_50.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.w;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_54.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _191 = _120 * _169;
    float _193 = _191 * _130;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_193, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = _120 * _175;
    float _201 = _120 * _187;
    float _203 = 1.0 / _197;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _207 = _203 * _205;
    float _209 = in.m_52.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_52.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_142, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = _120 * _181;
    float _227 = 1.0 / _223;
    float _229 = -_199;
    float _231 = fma(_153, _163, _229);
    float _233 = _225 * _231;
    float _235 = 0.0 + _233;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _241 = -_207;
    float _243 = fma(_227, _239, _241);
    float _245 = _243 * _189;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _237 * _247;
    float _251 = _249 * _201;
    bool _255 = _251 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _257 = isnan(_251);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _263 = _259 || _261;
    float _265 = in.m_50.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_50.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_52.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_50.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _207;
    if (!_263)
    {
        discard_fragment();
    }
    float _291 = _149 * _149;
    float _293 = _147 * _147;
    float _295 = _120 * _213;
    float _297 = _291 * _159;
    float _299 = _293 * _157;
    float _301 = _151 * _151;
    float _303 = _301 * _161;
    float _305 = _120 * _269;
    float _307 = _120 * _275;
    float _309 = _120 * _281;
    float _311 = _120 * _287;
    float _313 = _120 * _219;
    float _315 = -_295;
    float _317 = _307 + _315;
    float _319 = -_309;
    float _321 = _305 + _319;
    float _323 = -_313;
    float _325 = _311 + _323;
    float _327 = fma(_297, _317, _295);
    float _329 = fma(_299, _321, _309);
    float _331 = fma(_303, _325, _313);
    if (!_263)
    {
        out.m_57.x = _329;
        out.m_57.y = _327;
        out.m_57.z = _331;
        out.m_57.w = _233;
        return out;
    }
    float _333 = in.m_59.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_59.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_59.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = _120 * _337;
    float _353 = _120 * _343;
    float _355 = _120 * _349;
    float _357 = _351 * _351;
    float _359 = in.m_61.x;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = fma(_353, _353, _357);
    float _367 = fma(_355, _355, _365);
    float _369 = rsqrt(_367);
    float _371 = _353 * _369;
    float _373 = _351 * _369;
    float _375 = _355 * _369;
    float _377 = _120 * _363;
    float _379 = abs(_371);
    float _381 = abs(_373);
    float _383 = precise::max(_379, _381);
    float _385 = precise::min(_377, 1.0);
    float _387 = abs(_375);
    float _389 = precise::max(_387, _383);
    float _391 = 1.0 / _389;
    float _393 = -_391;
    float _395 = _375 * _393;
    float _397 = _371 * _391;
    float _399 = _373 * _391;
    float3 _1063 = float3(_397, _399, _395);
    float3 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1063, float3(0.0), isnan(_1063)), level(_385)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1063, float3(0.0), isnan(_1063)), level(_385)).xyz;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = in.m_63.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_63.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_63.z;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_65.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_65.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_65.y;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_67.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_67.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_67.y;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_69.x;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_69.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_69.w;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_69.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    bool _489 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _491 = _120 * _415;
    float _493 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _495 = _493 + 1.0;
    float _497 = _120 * _421;
    float _499 = _120 * _427;
    float _501 = _120 * _433;
    float _503 = fma(_491, (*spvDescriptorSet0.fp_c13)._m0[0].y, _495);
    float _505 = fma(_497, (*spvDescriptorSet0.fp_c13)._m0[0].y, _495);
    float _507 = fma(_499, (*spvDescriptorSet0.fp_c13)._m0[0].y, _495);
    float _509 = _120 * _451;
    float _511 = _120 * _457;
    float _513 = _327 * _505;
    float _515 = precise::clamp(_513, 0.0, 1.0);
    float _517 = _120 * _439;
    float _519 = _331 * _507;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    float _523 = _120 * _463;
    if (_489)
    {
        float _525 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _527 = _207 + _525;
        _289 = _527;
    }
    float _529 = _289;
    float _531 = _329 * _503;
    float _533 = precise::clamp(_531, 0.0, 1.0);
    float _535 = _120 * _469;
    float _537 = _120 * _487;
    float _539 = _529;
    if (_489)
    {
        float _541 = _529 * 8.0;
        float _543 = precise::clamp(_541, 0.0, 1.0);
        _539 = _543;
    }
    float _545 = _539;
    float _547 = _120 * _475;
    float _549 = fma(_405, 0.20999999344348907470703125, _501);
    float _551 = _120 * _445;
    float _553 = fma(_409, 0.20999999344348907470703125, _517);
    float _555 = _120 * _481;
    float _557 = _549 + _511;
    float _559 = fma(_407, 0.20999999344348907470703125, _551);
    float _561 = _553 + _509;
    float _563 = 0.0 + _251;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    float _567 = _533 * _557;
    float _569 = _559 + _523;
    float _571 = _521 * _561;
    float _573 = _565;
    if (_489)
    {
        float _575 = _565 * _545;
        _573 = _575;
    }
    float _577 = _573;
    float _579 = fma(_567, _555, _535);
    float _581 = _515 * _569;
    float _583 = fma(_571, _555, _547);
    float _585 = 0.0 + _577;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    float _589 = fma(_581, _555, _537);
    out.m_57.x = _579;
    out.m_57.y = _589;
    out.m_57.z = _583;
    out.m_57.w = _587;
    return out;
}

