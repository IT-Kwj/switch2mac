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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
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
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
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
    float _126 = _116 * _102;
    float _128 = _116 * _108;
    float _130 = 1.0 / _118;
    float _132 = _116 * _114;
    float _134 = _122 * _130;
    float _136 = _120 * _130;
    float2 _674 = float2(_136, _134);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_674, float2(0.0), isnan(_674))).x;
    float2 _685 = float2(_124, _126);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_685, float2(0.0), isnan(_685))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float2 _701 = float2(_128, _132);
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_701, float2(0.0), isnan(_701))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_701, float2(0.0), isnan(_701))).xyzw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _151.w;
    float _161 = in.m_42.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_46.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_48.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_50.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _116 * _165;
    float _187 = _185 * _130;
    float _189 = _116 * _177;
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _193 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[30].w, _191);
    float _195 = 1.0 / _193;
    float _197 = _116 * _183;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _201 = _195 * _199;
    float _203 = in.m_52.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_52.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_46.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_46.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _229 = fma(_138, (*spvDescriptorSet0.fp_c8)._m0[30].w, _227);
    float _231 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _233 = _149 + _159;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = _116 * _171;
    float _239 = _235 * _235;
    float _241 = 1.0 / _229;
    float _243 = _237 * _239;
    float _245 = _189 * _189;
    float _247 = _243 * _245;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _253 = -_201;
    float _255 = fma(_241, _251, _253);
    float _257 = _255 * _231;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = _249 * _259;
    float _263 = _261 * _197;
    bool _267 = _263 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _269 = isnan(_263);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _275 = _271 || _273;
    float _277 = in.m_52.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_46.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _201;
    if (!_275)
    {
        discard_fragment();
    }
    float _291 = _153 * _153;
    float _293 = _155 * _155;
    float _295 = _157 * _157;
    float _297 = fma(_143, _143, _291);
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = fma(_145, _145, _293);
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = fma(_147, _147, _295);
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = _116 * _207;
    float _311 = _116 * _213;
    float _313 = -_299;
    float _315 = _313 + 1.0;
    float _317 = -_303;
    float _319 = _317 + 1.0;
    float _321 = -_307;
    float _323 = _321 + 1.0;
    float _325 = _309 * _319;
    float _327 = _116 * _281;
    float _329 = _311 * _323;
    float _331 = _116 * _219;
    float _333 = _116 * _225;
    float _335 = _327 * _315;
    float _337 = _116 * _287;
    float _339 = fma(_303, _331, _325);
    float _341 = fma(_307, _333, _329);
    float _343 = fma(_299, _337, _335);
    if (!_275)
    {
        out.m_55.x = _343;
        out.m_55.y = _339;
        out.m_55.z = _341;
        out.m_55.w = _249;
        return out;
    }
    float _345 = in.m_57.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_57.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.z;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = _116 * _349;
    float _365 = _116 * _355;
    float _367 = _116 * _361;
    float _369 = _363 * _363;
    float _371 = in.m_59.x;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_367, _367, _377);
    float _381 = rsqrt(_379);
    float _383 = _365 * _381;
    float _385 = _363 * _381;
    float _387 = _367 * _381;
    float _389 = _116 * _375;
    float _391 = abs(_383);
    float _393 = abs(_385);
    float _395 = precise::max(_391, _393);
    float _397 = abs(_387);
    float _399 = precise::max(_397, _395);
    float _401 = 1.0 / _399;
    float _403 = _385 * _401;
    float _405 = -_401;
    float _407 = _387 * _405;
    float _409 = precise::min(_389, 1.0);
    float _411 = _383 * _401;
    float3 _1076 = float3(_411, _403, _407);
    float3 _415 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1076, float3(0.0), isnan(_1076)), level(_409)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1076, float3(0.0), isnan(_1076)), level(_409)).xyz;
    float _417 = _415.x;
    float _419 = _415.y;
    float _421 = _415.z;
    float _423 = _331 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _425 = in.m_61.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = _337 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _433 = in.m_61.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = _423 * 0.715200006961822509765625;
    float _441 = _333 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _443 = in.m_61.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_63.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = fma(_431, 0.2125999927520751953125, _439);
    float _457 = in.m_63.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_63.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_65.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = fma(_441, 0.072200000286102294921875, _455);
    float _477 = in.m_65.y;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_65.z;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_65.w;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = 1.0 / _475;
    bool _497 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _499 = _116 * _429;
    float _501 = _495 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _503 = precise::clamp(_501, 0.0, 1.0);
    if (_497)
    {
        float _505 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _507 = _201 + _505;
        _289 = _507;
    }
    float _509 = _289;
    float _511 = fma(_503, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _513 = _116 * _437;
    float _515 = _116 * _453;
    float _517 = _116 * _461;
    float _519 = _431 * _511;
    float _521 = _423 * _511;
    float _523 = _441 * _511;
    float _525 = _509;
    if (_497)
    {
        float _527 = _509 * 8.0;
        float _529 = precise::clamp(_527, 0.0, 1.0);
        _525 = _529;
    }
    float _531 = _525;
    float _533 = _116 * _473;
    float _535 = _116 * _481;
    float _537 = _116 * _487;
    float _539 = fma(_417, 0.20999999344348907470703125, _499);
    float _541 = _116 * _447;
    float _543 = fma(_421, 0.20999999344348907470703125, _513);
    float _545 = _116 * _467;
    float _547 = _539 + _517;
    float _549 = fma(_419, 0.20999999344348907470703125, _541);
    float _551 = _543 + _515;
    float _553 = 0.0 + _263;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = _116 * _493;
    float _559 = _549 + _545;
    float _561 = fma(_343, _547, _519);
    float _563 = fma(_341, _551, _523);
    float _565 = _555;
    if (_497)
    {
        float _567 = _555 * _531;
        _565 = _567;
    }
    float _569 = _565;
    float _571 = fma(_339, _559, _521);
    float _573 = fma(_561, _557, _533);
    float _575 = fma(_563, _557, _537);
    float _577 = 0.0 + _569;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = fma(_571, _557, _535);
    out.m_55.x = _573;
    out.m_55.y = _581;
    out.m_55.z = _575;
    out.m_55.w = _579;
    return out;
}

