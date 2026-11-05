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
    float4 m_59 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _70;
    float _104 = _102 * _76;
    float _106 = _102 * _82;
    float _108 = _102 * _88;
    float _110 = _102 * _94;
    float _112 = 1.0 / _104;
    float _114 = _102 * _100;
    float _116 = _106 * _112;
    float _118 = _108 * _112;
    float2 _619 = float2(_116, _118);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_619, float2(0.0), isnan(_619))).x;
    float2 _630 = float2(_110, _114);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_630, float2(0.0), isnan(_630))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_630, float2(0.0), isnan(_630))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float _133 = in.m_40.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_44.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_46.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_48.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_50.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _165 = _102 * _137;
    float _167 = _165 * _112;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[30].w, _169);
    float _173 = _102 * _143;
    float _175 = 1.0 / _171;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _179 = _175 * _177;
    float _181 = in.m_44.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_46.y;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_46.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = _102 * _149;
    float _211 = 1.0 / _207;
    float _213 = -_173;
    float _215 = fma(_131, _209, _213);
    float _217 = _102 * _155;
    float _219 = _102 * _161;
    float _221 = _215 * 4.0;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _217 * _223;
    float _227 = 0.0 + _225;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _233 = -_179;
    float _235 = fma(_211, _231, _233);
    float _237 = _235 * _163;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _229 * _239;
    float _243 = _241 * _219;
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
    float _281 = in.m_48.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _102;
    if (!_255)
    {
        discard_fragment();
    }
    float _289 = _125 * _125;
    float _291 = _127 * _127;
    float _293 = _129 * _129;
    float _295 = _102 * _261;
    float _297 = _102 * _267;
    float _299 = _102 * _185;
    float _301 = _102 * _273;
    float _303 = _102 * _279;
    float _305 = _102 * _285;
    float _307 = -_297;
    float _309 = _295 + _307;
    float _311 = -_301;
    float _313 = _299 + _311;
    float _315 = -_305;
    float _317 = _303 + _315;
    float _319 = fma(_289, _309, _297);
    float _321 = fma(_291, _313, _301);
    float _323 = _102 * _191;
    float _325 = fma(_293, _317, _305);
    float _327 = _102 * _197;
    float _329 = _102 * _203;
    float _331 = _319 * _323;
    float _333 = _321 * _327;
    float _335 = _325 * _329;
    if (!_255)
    {
        out.m_53.x = _331;
        out.m_53.y = _333;
        out.m_53.z = _335;
        out.m_53.w = _225;
        return out;
    }
    float _337 = in.m_55.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_55.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_55.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = _102 * _341;
    float _357 = _102 * _347;
    float _359 = _102 * _353;
    float _361 = _355 * _355;
    float _363 = in.m_57.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = fma(_357, _357, _361);
    float _371 = fma(_359, _359, _369);
    float _373 = rsqrt(_371);
    float _375 = _357 * _373;
    float _377 = _355 * _373;
    float _379 = _359 * _373;
    float _381 = _102 * _367;
    float _383 = abs(_375);
    float _385 = abs(_377);
    float _387 = precise::max(_383, _385);
    float _389 = precise::min(_381, 1.0);
    float _391 = abs(_379);
    float _393 = precise::max(_391, _387);
    float _395 = 1.0 / _393;
    float _397 = _375 * _395;
    float _399 = _377 * _395;
    float _401 = -_395;
    float _403 = _379 * _401;
    float3 _1030 = float3(_397, _399, _403);
    float3 _407 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1030, float3(0.0), isnan(_1030)), level(_389)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1030, float3(0.0), isnan(_1030)), level(_389)).xyz;
    float _409 = _407.x;
    float _411 = _407.y;
    float _413 = _407.z;
    float _415 = in.m_59.x;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_59.z;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_59.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_61.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_61.y;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_61.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_63.x;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_63.y;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_63.z;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_63.w;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    bool _475 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _477 = _102 * _419;
    float _479 = _102 * _425;
    float _481 = _102 * _437;
    float _483 = _102 * _443;
    float _485 = _102 * _449;
    float _487 = _102 * _461;
    float _489 = _102 * _473;
    float _491 = fma(_409, 0.20999999344348907470703125, _477);
    float _493 = _102 * _431;
    float _495 = _102 * _455;
    float _497 = _102 * _467;
    float _499 = fma(_413, 0.20999999344348907470703125, _479);
    float _501 = fma(_411, 0.20999999344348907470703125, _493);
    if (_475)
    {
        float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _505 = _179 + _503;
        _287 = _505;
    }
    float _507 = _287;
    float _509 = _491 + _481;
    float _511 = _499 + _485;
    float _513 = _501 + _483;
    float _515 = 0.0 + _243;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    float _519 = _507;
    float _521 = _517;
    if (_475)
    {
        float _523 = _507 * 8.0;
        float _525 = precise::clamp(_523, 0.0, 1.0);
        _519 = _525;
    }
    float _527 = _519;
    float _529 = _331 * _509;
    float _531 = _333 * _513;
    float _533 = _335 * _511;
    if (_475)
    {
        float _535 = _517 * _527;
        _521 = _535;
    }
    float _537 = _521;
    float _539 = fma(_529, _489, _495);
    float _541 = fma(_531, _489, _487);
    float _543 = fma(_533, _489, _497);
    float _545 = 0.0 + _537;
    float _547 = precise::clamp(_545, 0.0, 1.0);
    out.m_53.x = _539;
    out.m_53.y = _541;
    out.m_53.z = _543;
    out.m_53.w = _547;
    return out;
}

