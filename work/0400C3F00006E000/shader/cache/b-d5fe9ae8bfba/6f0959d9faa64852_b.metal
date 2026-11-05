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
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
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
    float _126 = 1.0 / _118;
    float _128 = _116 * _102;
    float _130 = _116 * _108;
    float _132 = _116 * _114;
    float _134 = _120 * _126;
    float _136 = _122 * _126;
    float2 _678 = float2(_134, _136);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_678, float2(0.0), isnan(_678))).x;
    float2 _689 = float2(_124, _128);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float2 _705 = float2(_130, _132);
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_705, float2(0.0), isnan(_705))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_705, float2(0.0), isnan(_705))).xyzw;
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
    float _179 = in.m_50.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _187 = _116 * _165;
    float _189 = _187 * _126;
    float _191 = in.m_52.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _199 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[30].w, _197);
    float _201 = 1.0 / _199;
    float _203 = in.m_50.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_50.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_46.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_50.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _229 = fma(_138, (*spvDescriptorSet0.fp_c8)._m0[30].w, _227);
    float _231 = _116 * _171;
    float _233 = 1.0 / _229;
    float _235 = _149 * _159;
    float _237 = _116 * _177;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _241 = _201 * _239;
    float _243 = -_231;
    float _245 = fma(_235, _237, _243);
    float _247 = _116 * _183;
    float _249 = _116 * _195;
    float _251 = _247 * _245;
    float _253 = 0.0 + _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _259 = -_241;
    float _261 = fma(_233, _257, _259);
    float _263 = _261 * _185;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _255 * _265;
    float _269 = _267 * _249;
    bool _273 = _269 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _275 = isnan(_269);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _281 = _277 || _279;
    float _283 = in.m_46.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_46.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_48.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_48.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    if (!_281)
    {
        discard_fragment();
    }
    float _307 = in.m_48.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _145 * _145;
    float _315 = _155 * _155;
    float _317 = _143 * _143;
    float _319 = _153 * _153;
    float _321 = _116 * _207;
    float _323 = _313 * _315;
    float _325 = _157 * _157;
    float _327 = _317 * _319;
    float _329 = _147 * _147;
    float _331 = _116 * _213;
    float _333 = _116 * _219;
    float _335 = _329 * _325;
    float _337 = _116 * _287;
    float _339 = _116 * _293;
    float _341 = _116 * _225;
    float _343 = _116 * _299;
    float _345 = -_321;
    float _347 = _337 + _345;
    float _349 = -_331;
    float _351 = _339 + _349;
    float _353 = -_341;
    float _355 = _333 + _353;
    float _357 = _116 * _305;
    float _359 = fma(_327, _347, _321);
    float _361 = fma(_323, _351, _331);
    float _363 = fma(_335, _355, _341);
    float _365 = _359 * _343;
    float _367 = _116 * _311;
    float _369 = _361 * _357;
    float _371 = _363 * _367;
    if (!_281)
    {
        out.m_55.x = _365;
        out.m_55.y = _369;
        out.m_55.z = _371;
        out.m_55.w = _251;
        return out;
    }
    float _373 = in.m_57.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_57.x;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_57.z;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _116 * _377;
    float _393 = _116 * _383;
    float _395 = _116 * _389;
    float _397 = _391 * _391;
    float _399 = in.m_59.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = fma(_393, _393, _397);
    float _407 = fma(_395, _395, _405);
    float _409 = rsqrt(_407);
    float _411 = _393 * _409;
    float _413 = _391 * _409;
    float _415 = _395 * _409;
    float _417 = _116 * _403;
    float _419 = abs(_411);
    float _421 = abs(_413);
    float _423 = precise::max(_419, _421);
    float _425 = abs(_415);
    float _427 = precise::max(_425, _423);
    float _429 = 1.0 / _427;
    float _431 = _411 * _429;
    float _433 = _413 * _429;
    float _435 = -_429;
    float _437 = _415 * _435;
    float _439 = precise::min(_417, 1.0);
    float3 _1119 = float3(_431, _433, _437);
    float3 _443 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1119, float3(0.0), isnan(_1119)), level(_439)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1119, float3(0.0), isnan(_1119)), level(_439)).xyz;
    float _445 = _443.x;
    float _447 = _443.y;
    float _449 = _443.z;
    float _451 = in.m_61.x;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_61.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_61.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_63.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_63.x;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_63.y;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_65.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_65.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_65.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_65.w;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    bool _511 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _513 = _116 * _455;
    float _515 = _116 * _467;
    float _517 = _116 * _473;
    float _519 = _116 * _479;
    float _521 = _116 * _485;
    float _523 = _116 * _497;
    float _525 = _116 * _503;
    float _527 = fma(_445, 0.20999999344348907470703125, _513);
    float _529 = _116 * _461;
    float _531 = fma(_447, 0.20999999344348907470703125, _515);
    float _533 = _116 * _491;
    float _535 = _527 + _519;
    float _537 = fma(_449, 0.20999999344348907470703125, _529);
    float _539 = _529;
    if (_511)
    {
        float _541 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _543 = _241 + _541;
        _539 = _543;
    }
    float _545 = _539;
    float _547 = _531 + _521;
    float _549 = _116 * _509;
    float _551 = _537 + _517;
    float _553 = 0.0 + _269;
    float _555 = precise::clamp(_553, 0.0, 1.0);
    float _557 = _545;
    float _559 = _555;
    if (_511)
    {
        float _561 = _545 * 8.0;
        float _563 = precise::clamp(_561, 0.0, 1.0);
        _557 = _563;
    }
    float _565 = _557;
    float _567 = _365 * _535;
    float _569 = _369 * _547;
    float _571 = _371 * _551;
    if (_511)
    {
        float _573 = _555 * _565;
        _559 = _573;
    }
    float _575 = _559;
    float _577 = fma(_567, _549, _533);
    float _579 = fma(_569, _549, _523);
    float _581 = fma(_571, _549, _525);
    float _583 = 0.0 + _575;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    out.m_55.x = _577;
    out.m_55.y = _579;
    out.m_55.z = _581;
    out.m_55.w = _585;
    return out;
}

