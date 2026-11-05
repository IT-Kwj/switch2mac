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
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_63 [[user(locn3), flat]];
    float4 m_71 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_52 [[user(locn11)]];
    float4 m_50 [[user(locn12)]];
    float4 m_65 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _641 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).xyzw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = _99.w;
    float _109 = in.m_44.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_46.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_48.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_50.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _92 * _113;
    float _135 = _92 * _119;
    float _137 = _92 * _125;
    float _139 = _92 * _131;
    float _141 = in.m_52.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _92 * _145;
    float _149 = -_133;
    float _151 = fma(_107, _135, _149);
    float _153 = _137 * _151;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _139;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    float _173 = in.m_52.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    if (!_171)
    {
        discard_fragment();
    }
    float _179 = in.m_52.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _92 * _177;
    float _187 = 1.0 / _185;
    float _189 = _92 * _183;
    float _191 = _189 * _187;
    float _193 = _147 * _187;
    float2 _777 = float2(_191, _193);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_777, float2(0.0), isnan(_777))).x;
    float _197 = in.m_48.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_48.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_48.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_44.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_44.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_44.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _101 * _101;
    float _235 = _103 * _103;
    float _237 = _105 * _105;
    float _239 = -_233;
    float _241 = _239 + 1.0;
    float _243 = -_235;
    float _245 = _243 + 1.0;
    float _247 = -_237;
    float _249 = _247 + 1.0;
    float _251 = _92 * _201;
    float _253 = _92 * _207;
    float _255 = _92 * _213;
    float _257 = _251 * _241;
    float _259 = _253 * _245;
    float _261 = _255 * _249;
    float _263 = _92 * _219;
    float _265 = _92 * _225;
    float _267 = _92 * _231;
    float _269 = fma(_233, _263, _257);
    float _271 = fma(_235, _265, _259);
    float _273 = fma(_237, _267, _261);
    if (!_171)
    {
        out.m_55.x = _269;
        out.m_55.y = _271;
        out.m_55.z = _273;
        out.m_55.w = _153;
        return out;
    }
    float _275 = in.m_57.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_57.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_57.z;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_59.x;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _92 * _279;
    float _301 = _92 * _285;
    float _303 = _92 * _291;
    float _305 = _92 * _297;
    float _307 = _299 * _299;
    float _309 = _305 + 1.0;
    float _311 = fma(_301, _301, _307);
    float _313 = fma(_303, _303, _311);
    float _315 = precise::min(_309, 1.0);
    float _317 = rsqrt(_313);
    float _319 = _301 * _317;
    float _321 = _299 * _317;
    float _323 = _303 * _317;
    float _325 = abs(_319);
    float _327 = abs(_321);
    float _329 = precise::max(_325, _327);
    float _331 = abs(_323);
    float _333 = precise::max(_331, _329);
    float _335 = 1.0 / _333;
    float _337 = -_335;
    float _339 = _323 * _337;
    float _341 = _319 * _335;
    float _343 = _321 * _335;
    float3 _992 = float3(_341, _343, _339);
    float3 _347 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_992, float3(0.0), isnan(_992)), level(_315)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_992, float3(0.0), isnan(_992)), level(_315)).xyz;
    float _349 = _347.x;
    float _351 = _347.y;
    float _353 = _347.z;
    float _355 = in.m_61.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_61.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_63.y;
    float _369 = in.m_61.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_63.x;
    float _377 = in.m_52.z;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_63.z;
    float _385 = in.m_65.x;
    float _387 = in.m_67.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_67.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_69.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_69.w;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_69.y;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_69.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_71.w;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = _92 * _359;
    float _431 = _92 * _365;
    float _433 = -_367;
    float _435 = _429 + _433;
    float _437 = _92 * _373;
    float _439 = -_375;
    float _441 = _431 + _439;
    float _443 = _92 * _381;
    float _445 = _435 * _435;
    float _447 = -_383;
    float _449 = _437 + _447;
    float _451 = _385 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _453 = _443 * _187;
    float _455 = fma(_441, _441, _445);
    float _457 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _459 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _457);
    float _461 = in.m_71.x;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _469 = fma(_453, (*spvDescriptorSet0.fp_c8)._m0[30].w, _467);
    float _471 = fma(_449, _449, _455);
    float _473 = in.m_71.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_71.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = 1.0 / _459;
    float _487 = -_471;
    float _489 = fma(_451, _451, _487);
    float _491 = in.m_67.x;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = precise::max(0.0, _489);
    float _499 = 1.0 / _469;
    float _501 = sqrt(_497);
    float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _505 = _499 * _503;
    float _507 = _92 * _465;
    float _509 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _511 = -_505;
    float _513 = fma(_485, _509, _511);
    float _515 = _92 * _403;
    float _517 = _92 * _477;
    float _519 = _92 * _483;
    float _521 = _501 + _513;
    float _523 = _92 * _427;
    float _525 = _92 * _495;
    float _527 = _92 * _391;
    float _529 = _92 * _397;
    float _531 = -_523;
    float _533 = _531 + _521;
    float _535 = _92 * _409;
    float _537 = _533 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _539 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _541 = _92 * _415;
    float _543 = _92 * _421;
    float _545 = _537 * (-1.44269502162933349609375);
    float _547 = exp2(_545);
    float _549 = _505;
    if (_539)
    {
        float _551 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _553 = _505 + _551;
        _549 = _553;
    }
    float _555 = _549;
    float _557 = _555;
    if (_539)
    {
        float _559 = _555 * 8.0;
        float _561 = precise::clamp(_559, 0.0, 1.0);
        _557 = _561;
    }
    float _563 = _557;
    float _565 = -_547;
    float _567 = _565 + 1.0;
    float _569 = precise::clamp(_567, 0.0, 1.0);
    float _571 = _159 * _569;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = _573;
    if (_539)
    {
        float _577 = _573 * _563;
        _575 = _577;
    }
    float _579 = _575;
    float _581 = 0.0 + _579;
    float _583 = precise::clamp(_581, 0.0, 1.0);
    float _585 = fma(_349, 0.20999999344348907470703125, _507);
    float _587 = fma(_351, 0.20999999344348907470703125, _517);
    float _589 = fma(_353, 0.20999999344348907470703125, _519);
    float _591 = _585 + _525;
    float _593 = _587 + _527;
    float _595 = _589 + _529;
    float _597 = _269 * _591;
    float _599 = _271 * _593;
    float _601 = _273 * _595;
    float _603 = fma(_597, _535, _515);
    float _605 = fma(_599, _535, _541);
    float _607 = fma(_601, _535, _543);
    out.m_55.x = _603;
    out.m_55.y = _605;
    out.m_55.z = _607;
    out.m_55.w = _583;
    return out;
}

