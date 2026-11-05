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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_44.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_44.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_46.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_48.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_48.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = 1.0 / _78;
    float _130 = _128 * _84;
    float _132 = _128 * _90;
    float _134 = _128 * _96;
    float _136 = _128 * _102;
    float _138 = _128 * _108;
    float _140 = _128 * _114;
    float _142 = _128 * _120;
    float _144 = _128 * _126;
    float2 _696 = float2(_130, _132);
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_696, float2(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_696, float2(0.0), isnan(_696))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float2 _715 = float2(_134, _136);
    float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_715, float2(0.0), isnan(_715))).xyzw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _157.w;
    float2 _731 = float2(_138, _140);
    float4 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_731, float2(0.0), isnan(_731))).xyzw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _167.w;
    float2 _747 = float2(_142, _144);
    float4 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_747, float2(0.0), isnan(_747))).xyzw;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float _185 = _177.w;
    float _187 = in.m_50.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_52.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_54.w;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_56.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _128 * _191;
    float _213 = _128 * _197;
    float _215 = in.m_54.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_54.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_50.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_54.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _155 * _165;
    float _241 = _128 * _203;
    float _243 = _239 * _175;
    float _245 = _243 * _185;
    float _247 = -_211;
    float _249 = fma(_245, _213, _247);
    float _251 = _241 * _249;
    float _253 = _128 * _209;
    float _255 = 0.0 + _251;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _257 * _253;
    bool _263 = _259 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _265 = isnan(_259);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _271 = _267 || _269;
    float _273 = in.m_50.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_50.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_52.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_52.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    if (!_271)
    {
        discard_fragment();
    }
    float _297 = in.m_52.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _151 * _161;
    float _305 = _149 * _159;
    float _307 = _153 * _163;
    float _309 = _128 * _225;
    float _311 = _303 * _171;
    float _313 = _305 * _169;
    float _315 = _128 * _219;
    float _317 = _307 * _173;
    float _319 = _311 * _181;
    float _321 = _128 * _231;
    float _323 = _128 * _237;
    float _325 = _313 * _179;
    float _327 = _317 * _183;
    float _329 = _128 * _277;
    float _331 = _128 * _283;
    float _333 = -_323;
    float _335 = _321 + _333;
    float _337 = _128 * _289;
    float _339 = -_315;
    float _341 = _329 + _339;
    float _343 = -_309;
    float _345 = _331 + _343;
    float _347 = fma(_327, _335, _323);
    float _349 = _128 * _295;
    float _351 = fma(_325, _341, _315);
    float _353 = fma(_319, _345, _309);
    float _355 = _351 * _337;
    float _357 = _128 * _301;
    float _359 = _353 * _349;
    float _361 = _347 * _357;
    if (!_271)
    {
        out.m_59.x = _355;
        out.m_59.y = _359;
        out.m_59.z = _361;
        out.m_59.w = _251;
        return out;
    }
    float _363 = in.m_61.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_61.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_61.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _128 * _367;
    float _383 = _128 * _373;
    float _385 = _128 * _379;
    float _387 = _381 * _381;
    float _389 = in.m_63.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_383, _383, _387);
    float _397 = fma(_385, _385, _395);
    float _399 = rsqrt(_397);
    float _401 = _383 * _399;
    float _403 = _381 * _399;
    float _405 = _385 * _399;
    float _407 = _128 * _393;
    float _409 = abs(_401);
    float _411 = abs(_403);
    float _413 = precise::max(_409, _411);
    float _415 = abs(_405);
    float _417 = precise::max(_415, _413);
    float _419 = 1.0 / _417;
    float _421 = _403 * _419;
    float _423 = -_419;
    float _425 = _405 * _423;
    float _427 = precise::min(_407, 1.0);
    float _429 = _401 * _419;
    float3 _1106 = float3(_429, _421, _425);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1106, float3(0.0), isnan(_1106)), level(_427)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1106, float3(0.0), isnan(_1106)), level(_427)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = in.m_65.y;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_65.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_65.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_67.y;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_67.z;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_67.x;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_69.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_69.w;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_69.y;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_69.z;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = _128 * _445;
    float _503 = _128 * _451;
    float _505 = _128 * _457;
    bool _507 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _509 = fma(_437, 0.20999999344348907470703125, _501);
    float _511 = fma(_439, 0.20999999344348907470703125, _503);
    float _513 = fma(_435, 0.20999999344348907470703125, _505);
    float _515 = _128 * _463;
    float _517 = _128 * _469;
    float _519 = _128 * _475;
    float _521 = _509 + _515;
    float _523 = _511 + _517;
    float _525 = _513 + _519;
    float _527 = _128 * _487;
    float _529 = _359 * _521;
    float _531 = _361 * _523;
    float _533 = _355 * _525;
    float _535 = 0.0 + _259;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    float _539 = _128 * _481;
    float _541 = _128 * _493;
    float _543 = _128 * _499;
    float _545 = fma(_533, _527, _539);
    float _547 = fma(_529, _527, _541);
    float _549 = fma(_531, _527, _543);
    float _551 = _539;
    if (!_507)
    {
        _551 = _537;
    }
    float _553 = _551;
    bool _555 = !_507;
    float _557 = _553;
    if (!_555)
    {
        float _559 = in.m_71.w;
        float _561 = gl_FragCoord.w;
        float _563 = _559 * _561;
        float _565 = in.m_71.z;
        float _567 = gl_FragCoord.w;
        float _569 = _565 * _567;
        float _571 = _128 * _563;
        float _573 = _128 * _569;
        float _575 = 1.0 / _571;
        float _577 = _573 * _575;
        float _579 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _581 = fma(_577, (*spvDescriptorSet0.fp_c8)._m0[30].w, _579);
        float _583 = 1.0 / _581;
        float _585 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _587 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _589 = fma(_583, _585, _587);
        float _591 = _589 * 8.0;
        float _593 = precise::clamp(_591, 0.0, 1.0);
        float _595 = _537 * _593;
        _557 = _595;
    }
    float _597 = _557;
    float _599 = 0.0 + _597;
    float _601 = precise::clamp(_599, 0.0, 1.0);
    out.m_59.x = _545;
    out.m_59.y = _547;
    out.m_59.z = _549;
    out.m_59.w = _601;
    return out;
}

