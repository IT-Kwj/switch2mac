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
    constant _16* fp_c13 [[id(2)]];
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
    float2 _657 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_657, float2(0.0), isnan(_657))).xyzw;
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
    float _139 = -_133;
    float _141 = fma(_107, _135, _139);
    float _143 = _92 * _131;
    float _145 = _137 * _141;
    float _147 = 0.0 + _145;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = _149 * _143;
    bool _155 = _151 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _157 = isnan(_151);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _163 = _159 || _161;
    float _165 = in.m_52.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    if (!_163)
    {
        discard_fragment();
    }
    float _171 = in.m_52.y;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _92 * _169;
    float _185 = 1.0 / _183;
    float _187 = _92 * _175;
    float _189 = _92 * _181;
    float _191 = _187 * _185;
    float _193 = _189 * _185;
    float2 _793 = float2(_193, _191);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_793, float2(0.0), isnan(_793))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_793, float2(0.0), isnan(_793))).x;
    float _197 = in.m_44.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_48.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_44.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_48.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_44.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_48.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_46.x;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_46.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_46.z;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _92 * _201;
    float _253 = _92 * _207;
    float _255 = _92 * _213;
    float _257 = _92 * _219;
    float _259 = _92 * _225;
    float _261 = _92 * _231;
    float _263 = -_253;
    float _265 = _251 + _263;
    float _267 = -_257;
    float _269 = _255 + _267;
    float _271 = -_261;
    float _273 = _259 + _271;
    float _275 = fma(_101, _265, _253);
    float _277 = fma(_103, _269, _257);
    float _279 = _92 * _237;
    float _281 = fma(_105, _273, _261);
    float _283 = _92 * _243;
    float _285 = _92 * _249;
    float _287 = _275 * _279;
    float _289 = _277 * _283;
    float _291 = _281 * _285;
    if (!_163)
    {
        out.m_55.x = _287;
        out.m_55.y = _289;
        out.m_55.z = _291;
        out.m_55.w = _145;
        return out;
    }
    float _293 = in.m_57.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_57.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_57.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_59.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = _92 * _297;
    float _319 = _92 * _303;
    float _321 = _92 * _309;
    float _323 = _92 * _315;
    float _325 = _317 * _317;
    float _327 = fma(_319, _319, _325);
    float _329 = precise::min(_323, 1.0);
    float _331 = fma(_321, _321, _327);
    float _333 = rsqrt(_331);
    float _335 = _319 * _333;
    float _337 = _317 * _333;
    float _339 = _321 * _333;
    float _341 = abs(_335);
    float _343 = abs(_337);
    float _345 = precise::max(_341, _343);
    float _347 = abs(_339);
    float _349 = precise::max(_347, _345);
    float _351 = 1.0 / _349;
    float _353 = -_351;
    float _355 = _339 * _353;
    float _357 = _335 * _351;
    float _359 = _337 * _351;
    float3 _1030 = float3(_357, _359, _355);
    float3 _363 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1030, float3(0.0), isnan(_1030)), level(_329)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1030, float3(0.0), isnan(_1030)), level(_329)).xyz;
    float _365 = _363.x;
    float _367 = _363.y;
    float _369 = _363.z;
    float _371 = in.m_61.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_61.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_63.y;
    float _385 = in.m_61.z;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_63.x;
    float _393 = in.m_52.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_63.z;
    float _401 = in.m_65.x;
    float _403 = in.m_67.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_67.y;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_67.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_69.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_69.w;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_69.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_71.w;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_69.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _453 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _451);
    float _455 = _92 * _375;
    float _457 = _92 * _381;
    float _459 = -_383;
    float _461 = _455 + _459;
    float _463 = _92 * _389;
    float _465 = -_391;
    float _467 = _457 + _465;
    float _469 = _92 * _397;
    float _471 = _461 * _461;
    float _473 = -_399;
    float _475 = _463 + _473;
    float _477 = _401 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _479 = _469 * _185;
    float _481 = fma(_467, _467, _471);
    float _483 = 1.0 / _453;
    float _485 = in.m_71.y;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _493 = fma(_479, (*spvDescriptorSet0.fp_c8)._m0[30].w, _491);
    float _495 = fma(_475, _475, _481);
    float _497 = in.m_71.z;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = _92 * _407;
    float _505 = -_495;
    float _507 = fma(_477, _477, _505);
    float _509 = 1.0 / _493;
    float _511 = in.m_71.x;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = precise::max(0.0, _507);
    float _519 = sqrt(_517);
    float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _523 = _509 * _521;
    float _525 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _527 = -_523;
    float _529 = fma(_483, _525, _527);
    float _531 = _92 * _425;
    float _533 = _92 * _489;
    float _535 = _519 + _529;
    float _537 = _92 * _443;
    float _539 = _92 * _501;
    float _541 = _92 * _413;
    float _543 = _92 * _419;
    float _545 = -_537;
    float _547 = _545 + _535;
    float _549 = _92 * _515;
    float _551 = _92 * _431;
    float _553 = _547 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _555 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _557 = _92 * _437;
    float _559 = _92 * _449;
    float _561 = _553 * (-1.44269502162933349609375);
    float _563 = exp2(_561);
    float _565 = _523;
    if (_555)
    {
        float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _569 = _523 + _567;
        _565 = _569;
    }
    float _571 = _565;
    float _573 = _571;
    if (_555)
    {
        float _575 = _571 * 8.0;
        float _577 = precise::clamp(_575, 0.0, 1.0);
        _573 = _577;
    }
    float _579 = _573;
    float _581 = -_563;
    float _583 = _581 + 1.0;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _151 * _585;
    float _589 = precise::clamp(_587, 0.0, 1.0);
    float _591 = _589;
    if (_555)
    {
        float _593 = _589 * _579;
        _591 = _593;
    }
    float _595 = _591;
    float _597 = 0.0 + _595;
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = fma(_365, 0.20999999344348907470703125, _549);
    float _603 = fma(_367, 0.20999999344348907470703125, _533);
    float _605 = fma(_369, 0.20999999344348907470703125, _539);
    float _607 = _601 + _503;
    float _609 = _603 + _541;
    float _611 = _605 + _543;
    float _613 = _287 * _607;
    float _615 = _289 * _609;
    float _617 = _291 * _611;
    float _619 = fma(_613, _551, _531);
    float _621 = fma(_615, _551, _557);
    float _623 = fma(_617, _551, _559);
    out.m_55.x = _619;
    out.m_55.y = _621;
    out.m_55.z = _623;
    out.m_55.w = _599;
    return out;
}

