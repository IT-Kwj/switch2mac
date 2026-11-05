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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_42 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _620 = float2(_90, _92);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float _105 = in.m_44.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_46.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _88 * _109;
    float _119 = _103 * _117;
    float _121 = _88 * _115;
    float _123 = 0.0 + _119;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _125 * _121;
    bool _131 = _127 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _139 = _135 || _137;
    float _141 = in.m_42.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_42.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    if (!_139)
    {
        discard_fragment();
    }
    float _153 = _88 * _145;
    float _155 = _88 * _151;
    float2 _712 = float2(_153, _155);
    float2 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_712, float2(0.0), isnan(_712))).xy;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = in.m_44.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_44.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_44.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _88 * _169;
    float _185 = _88 * _175;
    float _187 = _88 * _181;
    float _189 = _99 * _183;
    float _191 = _97 * _185;
    float _193 = _101 * _187;
    if (!_139)
    {
        out.m_49.x = _191;
        out.m_49.y = _189;
        out.m_49.z = _193;
        out.m_49.w = _119;
        return out;
    }
    float _195 = in.m_51.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_51.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_51.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_53.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_53.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_53.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_55.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_55.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_55.z;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _163 * _163;
    float _251 = fma(_161, _161, _249);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = -_253;
    float _257 = _255 + 1.0;
    float _259 = sqrt(_257);
    float _261 = _88 * _199;
    float _263 = _88 * _205;
    float _265 = _88 * _211;
    float _267 = _88 * _217;
    float _269 = _261 * _261;
    float _271 = _88 * _229;
    float _273 = _88 * _235;
    float _275 = _88 * _241;
    float _277 = fma(_263, _263, _269);
    float _279 = _88 * _223;
    float _281 = _267 * _267;
    float _283 = _273 * _273;
    float _285 = fma(_265, _265, _277);
    float _287 = _88 * _247;
    float _289 = fma(_279, _279, _281);
    float _291 = fma(_275, _275, _283);
    float _293 = fma(_271, _271, _289);
    float _295 = fma(_287, _287, _291);
    float _297 = rsqrt(_285);
    float _299 = rsqrt(_293);
    float _301 = rsqrt(_295);
    float _303 = _299 * _163;
    float _305 = _297 * _161;
    float _307 = in.m_57.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _267 * _303;
    float _315 = _279 * _303;
    float _317 = _271 * _303;
    float _319 = _301 * _259;
    float _321 = fma(_261, _305, _313);
    float _323 = fma(_263, _305, _315);
    float _325 = fma(_265, _305, _317);
    float _327 = fma(_273, _319, _321);
    float _329 = fma(_275, _319, _323);
    float _331 = fma(_287, _319, _325);
    float _333 = _327 * _327;
    float _335 = fma(_329, _329, _333);
    float _337 = fma(_331, _331, _335);
    float _339 = rsqrt(_337);
    float _341 = _329 * _339;
    float _343 = _327 * _339;
    float _345 = _331 * _339;
    float _347 = abs(_341);
    float _349 = abs(_343);
    float _351 = precise::max(_347, _349);
    float _353 = abs(_345);
    float _355 = precise::max(_353, _351);
    float _357 = _88 * _311;
    float _359 = 1.0 / _355;
    float _361 = _343 * _359;
    float _363 = _341 * _359;
    float _365 = -_359;
    float _367 = _345 * _365;
    float _369 = precise::min(_357, 1.0);
    float3 _1022 = float3(_363, _361, _367);
    float3 _373 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1022, float3(0.0), isnan(_1022)), level(_369)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1022, float3(0.0), isnan(_1022)), level(_369)).xyz;
    float _375 = _373.x;
    float _377 = _373.y;
    float _379 = _373.z;
    float _381 = in.m_59.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_61.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_61.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_61.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_63.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_63.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_63.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_65.x;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_65.w;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = 0.0 + _127;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = in.m_65.y;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_65.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = _88 * _385;
    float _465 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _467 = _465 + 1.0;
    float _469 = _88 * _391;
    float _471 = _88 * _403;
    float _473 = fma(_463, (*spvDescriptorSet0.fp_c13)._m0[0].y, _467);
    float _475 = fma(_469, (*spvDescriptorSet0.fp_c13)._m0[0].y, _467);
    float _477 = fma(_471, (*spvDescriptorSet0.fp_c13)._m0[0].y, _467);
    float _479 = _88 * _415;
    float _481 = _191 * _473;
    float _483 = precise::clamp(_481, 0.0, 1.0);
    float _485 = _189 * _475;
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = _88 * _397;
    float _491 = _88 * _409;
    float _493 = _193 * _477;
    float _495 = precise::clamp(_493, 0.0, 1.0);
    float _497 = _88 * _421;
    float _499 = _88 * _427;
    float _501 = _88 * _433;
    float _503 = _88 * _439;
    float _505 = _88 * _445;
    float _507 = _88 * _461;
    float _509 = fma(_375, 0.20999999344348907470703125, _489);
    float _511 = fma(_377, 0.20999999344348907470703125, _491);
    float _513 = fma(_379, 0.20999999344348907470703125, _479);
    float _515 = _509 + _497;
    bool _517 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _519 = _511 + _499;
    float _521 = _513 + _501;
    float _523 = _483 * _515;
    float _525 = _88 * _455;
    float _527 = _487 * _519;
    float _529 = _495 * _521;
    float _531 = fma(_523, _505, _503);
    float _533 = fma(_527, _505, _525);
    float _535 = fma(_529, _505, _507);
    float _537 = _503;
    if (!_517)
    {
        _537 = _449;
    }
    float _539 = _537;
    bool _541 = !_517;
    float _543 = _539;
    if (!_541)
    {
        float _545 = in.m_67.w;
        float _547 = gl_FragCoord.w;
        float _549 = _545 * _547;
        float _551 = in.m_67.z;
        float _553 = gl_FragCoord.w;
        float _555 = _551 * _553;
        float _557 = _88 * _549;
        float _559 = _88 * _555;
        float _561 = 1.0 / _557;
        float _563 = _559 * _561;
        float _565 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _567 = fma(_563, (*spvDescriptorSet0.fp_c8)._m0[30].w, _565);
        float _569 = 1.0 / _567;
        float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _573 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _575 = fma(_569, _571, _573);
        float _577 = _575 * 8.0;
        float _579 = precise::clamp(_577, 0.0, 1.0);
        float _581 = _449 * _579;
        _543 = _581;
    }
    float _583 = _543;
    float _585 = 0.0 + _583;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    out.m_49.x = _531;
    out.m_49.y = _533;
    out.m_49.z = _535;
    out.m_49.w = _587;
    return out;
}

