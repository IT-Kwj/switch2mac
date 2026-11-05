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
    float2 _663 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).xyzw;
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
    float _147 = -_133;
    float _149 = fma(_107, _135, _147);
    float _151 = _137 * _149;
    float _153 = 0.0 + _151;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _155 * _139;
    bool _161 = _157 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _163 = isnan(_157);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _169 = _165 || _167;
    float _171 = in.m_52.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    if (!_169)
    {
        discard_fragment();
    }
    float _177 = in.m_52.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _92 * _145;
    float _185 = _92 * _175;
    float _187 = 1.0 / _185;
    float _189 = _92 * _181;
    float _191 = _189 * _187;
    float _193 = _183 * _187;
    float2 _799 = float2(_191, _193);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_799, float2(0.0), isnan(_799))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_799, float2(0.0), isnan(_799))).x;
    float _197 = in.m_44.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_44.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_48.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_48.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_44.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_48.y;
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
    float _251 = _105 * _105;
    float _253 = _101 * _101;
    float _255 = _103 * _103;
    float _257 = _92 * _201;
    float _259 = _92 * _207;
    float _261 = _92 * _213;
    float _263 = _92 * _219;
    float _265 = _92 * _225;
    float _267 = _92 * _231;
    float _269 = -_261;
    float _271 = _259 + _269;
    float _273 = -_263;
    float _275 = _257 + _273;
    float _277 = -_267;
    float _279 = _265 + _277;
    float _281 = fma(_251, _271, _261);
    float _283 = fma(_253, _275, _263);
    float _285 = _92 * _237;
    float _287 = fma(_255, _279, _267);
    float _289 = _92 * _243;
    float _291 = _92 * _249;
    float _293 = _283 * _285;
    float _295 = _287 * _289;
    float _297 = _281 * _291;
    if (!_169)
    {
        out.m_55.x = _293;
        out.m_55.y = _295;
        out.m_55.z = _297;
        out.m_55.w = _151;
        return out;
    }
    float _299 = in.m_57.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_57.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_57.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_59.x;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = _92 * _303;
    float _325 = _92 * _309;
    float _327 = _92 * _315;
    float _329 = _92 * _321;
    float _331 = _323 * _323;
    float _333 = fma(_325, _325, _331);
    float _335 = precise::min(_329, 1.0);
    float _337 = fma(_327, _327, _333);
    float _339 = rsqrt(_337);
    float _341 = _325 * _339;
    float _343 = _323 * _339;
    float _345 = _327 * _339;
    float _347 = abs(_341);
    float _349 = abs(_343);
    float _351 = precise::max(_347, _349);
    float _353 = abs(_345);
    float _355 = precise::max(_353, _351);
    float _357 = 1.0 / _355;
    float _359 = -_357;
    float _361 = _345 * _359;
    float _363 = _341 * _357;
    float _365 = _343 * _357;
    float3 _1045 = float3(_363, _365, _361);
    float3 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1045, float3(0.0), isnan(_1045)), level(_335)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1045, float3(0.0), isnan(_1045)), level(_335)).xyz;
    float _371 = _369.x;
    float _373 = _369.y;
    float _375 = _369.z;
    float _377 = in.m_61.y;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_61.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_63.y;
    float _391 = in.m_61.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_63.x;
    float _399 = in.m_52.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_63.z;
    float _407 = in.m_65.x;
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
    float _439 = in.m_69.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_71.w;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = _92 * _381;
    float _453 = _92 * _387;
    float _455 = -_389;
    float _457 = _451 + _455;
    float _459 = _92 * _395;
    float _461 = -_397;
    float _463 = _453 + _461;
    float _465 = _92 * _403;
    float _467 = _457 * _457;
    float _469 = -_405;
    float _471 = _459 + _469;
    float _473 = _407 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _475 = _465 * _187;
    float _477 = fma(_463, _463, _467);
    float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _481 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _479);
    float _483 = in.m_71.x;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _491 = fma(_475, (*spvDescriptorSet0.fp_c8)._m0[30].w, _489);
    float _493 = fma(_471, _471, _477);
    float _495 = in.m_71.y;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_71.z;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = 1.0 / _481;
    float _509 = -_493;
    float _511 = fma(_473, _473, _509);
    float _513 = in.m_67.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = precise::max(0.0, _511);
    float _521 = 1.0 / _491;
    float _523 = sqrt(_519);
    float _525 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _527 = _521 * _525;
    float _529 = _92 * _487;
    float _531 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _533 = -_527;
    float _535 = fma(_507, _531, _533);
    float _537 = _92 * _425;
    float _539 = _92 * _499;
    float _541 = _92 * _505;
    float _543 = _523 + _535;
    float _545 = _92 * _449;
    float _547 = _92 * _517;
    float _549 = _92 * _413;
    float _551 = _92 * _419;
    float _553 = -_545;
    float _555 = _553 + _543;
    float _557 = _92 * _431;
    float _559 = _555 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _561 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _563 = _92 * _437;
    float _565 = _92 * _443;
    float _567 = _559 * (-1.44269502162933349609375);
    float _569 = exp2(_567);
    float _571 = _527;
    if (_561)
    {
        float _573 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _575 = _527 + _573;
        _571 = _575;
    }
    float _577 = _571;
    float _579 = _577;
    if (_561)
    {
        float _581 = _577 * 8.0;
        float _583 = precise::clamp(_581, 0.0, 1.0);
        _579 = _583;
    }
    float _585 = _579;
    float _587 = -_569;
    float _589 = _587 + 1.0;
    float _591 = precise::clamp(_589, 0.0, 1.0);
    float _593 = _157 * _591;
    float _595 = precise::clamp(_593, 0.0, 1.0);
    float _597 = _595;
    if (_561)
    {
        float _599 = _595 * _585;
        _597 = _599;
    }
    float _601 = _597;
    float _603 = 0.0 + _601;
    float _605 = precise::clamp(_603, 0.0, 1.0);
    float _607 = fma(_371, 0.20999999344348907470703125, _529);
    float _609 = fma(_373, 0.20999999344348907470703125, _539);
    float _611 = fma(_375, 0.20999999344348907470703125, _541);
    float _613 = _607 + _547;
    float _615 = _609 + _549;
    float _617 = _611 + _551;
    float _619 = _293 * _613;
    float _621 = _295 * _615;
    float _623 = _297 * _617;
    float _625 = fma(_619, _557, _537);
    float _627 = fma(_621, _557, _563);
    float _629 = fma(_623, _557, _565);
    out.m_55.x = _625;
    out.m_55.y = _627;
    out.m_55.z = _629;
    out.m_55.w = _605;
    return out;
}

