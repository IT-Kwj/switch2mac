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
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
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
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_66 [[user(locn3), flat]];
    float4 m_72 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_43 [[user(locn6), flat]];
    float4 m_62 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_49 [[user(locn10), flat]];
    float4 m_57 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_68 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _81 = in.m_43.x;
    float _83 = gl_FragCoord.w;
    float _85 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _87 = in.m_47.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_47.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _81 + 1.0;
    float _101 = 1.0 / _83;
    float _103 = _99 * _85;
    float _105 = floor(_103);
    float _107 = rint(_81);
    float _109 = precise::max(_107, 0.0);
    uint _112 = uint(_109);
    uint _114 = clamp(_112, 0u, 65535u);
    float _116 = _101 * _91;
    float _118 = -_105;
    float _120 = fma(_118, (*spvDescriptorSet0.fp_c9)._m0[22].x, _99);
    float _122 = _101 * _97;
    float _124 = rint(_120);
    float _126 = precise::max(_124, 0.0);
    uint _128 = uint(_126);
    uint _130 = clamp(_128, 0u, 65535u);
    float3 _740 = float3(_116, _122, float(int(_114)));
    float3 _744 = select(_740, float3(0.0), isnan(_740));
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _744.xy, uint(rint(_744.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _744.xy, uint(rint(_744.z))).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float3 _761 = float3(_116, _122, float(int(_130)));
    float3 _763 = select(_761, float3(0.0), isnan(_761));
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _763.xy, uint(rint(_763.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _763.xy, uint(rint(_763.z))).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float _153 = in.m_49.y;
    float _155 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _157 = in.m_51.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_53.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_55.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _153 * _155;
    float _177 = _175 * _155;
    float _179 = floor(_177);
    float _181 = -_179;
    float _183 = fma(_181, (*spvDescriptorSet0.fp_c9)._m0[22].y, _175);
    float _185 = _101 * _167;
    float _187 = _183 + 9.9999997473787516355514526367188e-05;
    float _189 = floor(_187);
    float _191 = -_189;
    float _193 = _187 + _191;
    float _195 = in.m_57.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = -_141;
    float _203 = _201 + _151;
    float _205 = fma(_193, _203, _141);
    float _207 = _101 * _161;
    float _209 = _205 * _207;
    float _211 = _185 * _209;
    float _213 = _101 * _173;
    float _215 = 0.0 + _211;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _217 * _213;
    bool _223 = _219 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _225 = isnan(_219);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _231 = _227 || _229;
    float _233 = in.m_57.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    if (!_231)
    {
        discard_fragment();
    }
    float _239 = in.m_57.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _101 * _199;
    float _247 = _101 * _237;
    float _249 = 1.0 / _247;
    float _251 = _101 * _243;
    float _253 = _245 * _249;
    float _255 = _251 * _249;
    float2 _919 = float2(_253, _255);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_919, float2(0.0), isnan(_919))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_919, float2(0.0), isnan(_919))).x;
    float _259 = in.m_51.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_53.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_51.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_53.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_51.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_53.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = -_137;
    float _297 = _295 + _147;
    float _299 = -_135;
    float _301 = _299 + _145;
    float _303 = -_139;
    float _305 = _303 + _149;
    float _307 = fma(_193, _297, _137);
    float _309 = fma(_193, _301, _135);
    float _311 = fma(_193, _305, _139);
    float _313 = _101 * _263;
    float _315 = _101 * _269;
    float _317 = _101 * _275;
    float _319 = _101 * _281;
    float _321 = _101 * _287;
    float _323 = _101 * _293;
    float _325 = -_315;
    float _327 = _313 + _325;
    float _329 = -_319;
    float _331 = _317 + _329;
    float _333 = -_323;
    float _335 = _321 + _333;
    float _337 = fma(_309, _327, _315);
    float _339 = fma(_307, _331, _319);
    float _341 = fma(_311, _335, _323);
    if (!_231)
    {
        out.m_60.x = _337;
        out.m_60.y = _339;
        out.m_60.z = _341;
        out.m_60.w = _211;
        return out;
    }
    float _343 = in.m_62.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_62.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_62.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = _101 * _347;
    float _363 = _101 * _353;
    float _365 = _101 * _359;
    float _367 = _361 * _361;
    float _369 = fma(_363, _363, _367);
    float _371 = fma(_365, _365, _369);
    float _373 = rsqrt(_371);
    float _375 = _363 * _373;
    float _377 = _361 * _373;
    float _379 = _365 * _373;
    float _381 = abs(_375);
    float _383 = abs(_377);
    float _385 = precise::max(_381, _383);
    float _387 = abs(_379);
    float _389 = precise::max(_387, _385);
    float _391 = 1.0 / _389;
    float _393 = -_391;
    float _395 = _379 * _393;
    float _397 = _375 * _391;
    float _399 = _377 * _391;
    float3 _1134 = float3(_397, _399, _395);
    float3 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1134, float3(0.0), isnan(_1134)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1134, float3(0.0), isnan(_1134)), level(0.0)).xyz;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = in.m_64.y;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_64.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_66.y;
    float _425 = in.m_66.x;
    float _427 = in.m_64.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_57.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_66.z;
    float _441 = in.m_68.x;
    float _443 = in.m_70.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_70.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_70.z;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_72.x;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_72.w;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = _101 * _415;
    float _475 = _101 * _421;
    float _477 = -_423;
    float _479 = _473 + _477;
    float _481 = -_425;
    float _483 = _475 + _481;
    float _485 = _101 * _431;
    float _487 = _101 * _437;
    float _489 = _479 * _479;
    float _491 = _441 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _493 = -_439;
    float _495 = _485 + _493;
    float _497 = _487 * _249;
    float _499 = fma(_483, _483, _489);
    float _501 = in.m_74.w;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _509 = fma(_257, (*spvDescriptorSet0.fp_c8)._m0[30].w, _507);
    float _511 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _513 = fma(_497, (*spvDescriptorSet0.fp_c8)._m0[30].w, _511);
    float _515 = fma(_495, _495, _499);
    float _517 = in.m_74.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_74.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = 1.0 / _513;
    float _531 = -_515;
    float _533 = fma(_491, _491, _531);
    float _535 = in.m_74.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = _101 * _459;
    float _543 = precise::max(0.0, _533);
    float _545 = 1.0 / _509;
    bool _547 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _549 = _101 * _447;
    float _551 = _101 * _465;
    float _553 = sqrt(_543);
    float _555 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _557 = _529 * _555;
    float _559 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _561 = -_557;
    float _563 = fma(_545, _559, _561);
    float _565 = _557;
    if (_547)
    {
        float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _569 = _557 + _567;
        _565 = _569;
    }
    float _571 = _565;
    float _573 = _571;
    if (_547)
    {
        float _575 = _571 * 8.0;
        float _577 = precise::clamp(_575, 0.0, 1.0);
        _573 = _577;
    }
    float _579 = _573;
    float _581 = _101 * _521;
    float _583 = _101 * _527;
    float _585 = _553 + _563;
    float _587 = _101 * _505;
    float _589 = in.m_72.y;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_72.z;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = _101 * _539;
    float _603 = -_587;
    float _605 = _603 + _585;
    float _607 = _101 * _453;
    float _609 = _101 * _471;
    float _611 = _605 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _613 = _611 * (-1.44269502162933349609375);
    float _615 = exp2(_613);
    float _617 = _101 * _593;
    float _619 = -_615;
    float _621 = _619 + 1.0;
    float _623 = precise::clamp(_621, 0.0, 1.0);
    float _625 = _101 * _599;
    float _627 = _219 * _623;
    float _629 = precise::clamp(_627, 0.0, 1.0);
    float _631 = _629;
    if (_547)
    {
        float _633 = _629 * _579;
        _631 = _633;
    }
    float _635 = _631;
    float _637 = 0.0 + _635;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    float _641 = fma(_405, 0.20999999344348907470703125, _581);
    float _643 = fma(_407, 0.20999999344348907470703125, _583);
    float _645 = fma(_409, 0.20999999344348907470703125, _601);
    float _647 = _641 + _549;
    float _649 = _643 + _607;
    float _651 = _645 + _541;
    float _653 = _337 * _647;
    float _655 = _339 * _649;
    float _657 = _341 * _651;
    float _659 = fma(_653, _609, _551);
    float _661 = fma(_655, _609, _617);
    float _663 = fma(_657, _609, _625);
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_60.w = _639;
    return out;
}

