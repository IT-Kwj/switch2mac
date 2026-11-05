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
    float4 m_76 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_49 [[user(locn9), flat]];
    float4 m_70 [[user(locn10), flat]];
    float4 m_57 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_74 [[user(locn13)]];
    float4 m_68 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = in.m_43.x;
    float _85 = gl_FragCoord.w;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _89 = in.m_47.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _83 + 1.0;
    float _103 = 1.0 / _85;
    float _105 = _101 * _87;
    float _107 = floor(_105);
    float _109 = rint(_83);
    float _111 = precise::max(_109, 0.0);
    uint _114 = uint(_111);
    uint _116 = clamp(_114, 0u, 65535u);
    float _118 = _103 * _93;
    float _120 = -_107;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c9)._m0[22].x, _101);
    float _124 = _103 * _99;
    float _126 = rint(_122);
    float _128 = precise::max(_126, 0.0);
    uint _130 = uint(_128);
    uint _132 = clamp(_130, 0u, 65535u);
    float3 _752 = float3(_118, _124, float(int(_116)));
    float3 _756 = select(_752, float3(0.0), isnan(_752));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _756.xy, uint(rint(_756.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _756.xy, uint(rint(_756.z))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float3 _773 = float3(_118, _124, float(int(_132)));
    float3 _775 = select(_773, float3(0.0), isnan(_773));
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _775.xy, uint(rint(_775.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _775.xy, uint(rint(_775.z))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float _155 = in.m_49.y;
    float _157 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _159 = in.m_51.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_53.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_55.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = _155 * _157;
    float _179 = _177 * _157;
    float _181 = floor(_179);
    float _183 = -_181;
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c9)._m0[22].y, _177);
    float _187 = _103 * _169;
    float _189 = _185 + 9.9999997473787516355514526367188e-05;
    float _191 = floor(_189);
    float _193 = -_191;
    float _195 = _189 + _193;
    float _197 = in.m_57.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = -_143;
    float _205 = _203 + _153;
    float _207 = fma(_195, _205, _143);
    float _209 = _103 * _163;
    float _211 = _207 * _209;
    float _213 = _187 * _211;
    float _215 = _103 * _175;
    float _217 = 0.0 + _213;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _219 * _215;
    bool _225 = _221 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _227 = isnan(_221);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _233 = _229 || _231;
    float _235 = in.m_57.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    if (!_233)
    {
        discard_fragment();
    }
    float _241 = in.m_57.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = _103 * _201;
    float _249 = _103 * _239;
    float _251 = 1.0 / _249;
    float _253 = _103 * _245;
    float _255 = _247 * _251;
    float _257 = _253 * _251;
    float2 _931 = float2(_255, _257);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_931, float2(0.0), isnan(_931))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_931, float2(0.0), isnan(_931))).x;
    float _261 = in.m_51.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_53.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_51.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_53.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_51.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_53.z;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = -_139;
    float _299 = _297 + _149;
    float _301 = -_137;
    float _303 = _301 + _147;
    float _305 = -_141;
    float _307 = _305 + _151;
    float _309 = fma(_195, _299, _139);
    float _311 = fma(_195, _303, _137);
    float _313 = fma(_195, _307, _141);
    float _315 = _103 * _265;
    float _317 = _103 * _271;
    float _319 = _103 * _277;
    float _321 = _103 * _283;
    float _323 = _103 * _289;
    float _325 = _103 * _295;
    float _327 = -_317;
    float _329 = _315 + _327;
    float _331 = -_321;
    float _333 = _319 + _331;
    float _335 = -_325;
    float _337 = _323 + _335;
    float _339 = fma(_311, _329, _317);
    float _341 = fma(_309, _333, _321);
    float _343 = fma(_313, _337, _325);
    if (!_233)
    {
        out.m_60.x = _339;
        out.m_60.y = _341;
        out.m_60.z = _343;
        out.m_60.w = _213;
        return out;
    }
    float _345 = in.m_62.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_62.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_62.z;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_64.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = _103 * _349;
    float _371 = _103 * _355;
    float _373 = _103 * _361;
    float _375 = _103 * _367;
    float _377 = _369 * _369;
    float _379 = fma(_371, _371, _377);
    float _381 = precise::min(_375, 1.0);
    float _383 = fma(_373, _373, _379);
    float _385 = rsqrt(_383);
    float _387 = _371 * _385;
    float _389 = _369 * _385;
    float _391 = _373 * _385;
    float _393 = abs(_387);
    float _395 = abs(_389);
    float _397 = precise::max(_393, _395);
    float _399 = abs(_391);
    float _401 = precise::max(_399, _397);
    float _403 = 1.0 / _401;
    float _405 = -_403;
    float _407 = _391 * _405;
    float _409 = _387 * _403;
    float _411 = _389 * _403;
    float3 _1158 = float3(_409, _411, _407);
    float3 _415 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1158, float3(0.0), isnan(_1158)), level(_381)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1158, float3(0.0), isnan(_1158)), level(_381)).xyz;
    float _417 = _415.x;
    float _419 = _415.y;
    float _421 = _415.z;
    float _423 = in.m_66.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_66.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_68.y;
    float _437 = in.m_68.x;
    float _439 = in.m_66.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_57.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_68.z;
    float _453 = in.m_70.x;
    float _455 = in.m_72.y;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_72.z;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_74.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_74.w;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _481 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[30].w, _479);
    float _483 = 1.0 / _481;
    float _485 = _103 * _427;
    float _487 = _103 * _433;
    float _489 = in.m_76.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = -_435;
    float _497 = _485 + _495;
    float _499 = -_437;
    float _501 = _487 + _499;
    float _503 = _103 * _443;
    float _505 = _103 * _449;
    float _507 = _497 * _497;
    float _509 = _453 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _511 = -_451;
    float _513 = _503 + _511;
    float _515 = _505 * _251;
    float _517 = fma(_501, _501, _507);
    float _519 = in.m_76.w;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_76.x;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _533 = fma(_515, (*spvDescriptorSet0.fp_c8)._m0[30].w, _531);
    float _535 = fma(_513, _513, _517);
    float _537 = in.m_76.y;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_72.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = 1.0 / _533;
    float _551 = -_535;
    float _553 = fma(_509, _509, _551);
    float _555 = _103 * _465;
    float _557 = precise::max(0.0, _553);
    bool _559 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _561 = _103 * _471;
    float _563 = sqrt(_557);
    float _565 = _103 * _493;
    float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _569 = _549 * _567;
    float _571 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _573 = -_569;
    float _575 = fma(_483, _571, _573);
    float _577 = _569;
    if (_559)
    {
        float _579 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _581 = _569 + _579;
        _577 = _581;
    }
    float _583 = _577;
    float _585 = _583;
    if (_559)
    {
        float _587 = _583 * 8.0;
        float _589 = precise::clamp(_587, 0.0, 1.0);
        _585 = _589;
    }
    float _591 = _585;
    float _593 = _103 * _529;
    float _595 = _563 + _575;
    float _597 = _103 * _523;
    float _599 = in.m_74.y;
    float _601 = gl_FragCoord.w;
    float _603 = _599 * _601;
    float _605 = in.m_74.z;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = _103 * _541;
    float _613 = -_597;
    float _615 = _613 + _595;
    float _617 = _103 * _547;
    float _619 = _103 * _459;
    float _621 = _103 * _477;
    float _623 = _615 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _625 = _623 * (-1.44269502162933349609375);
    float _627 = exp2(_625);
    float _629 = _103 * _603;
    float _631 = -_627;
    float _633 = _631 + 1.0;
    float _635 = precise::clamp(_633, 0.0, 1.0);
    float _637 = _103 * _609;
    float _639 = _221 * _635;
    float _641 = precise::clamp(_639, 0.0, 1.0);
    float _643 = _641;
    if (_559)
    {
        float _645 = _641 * _591;
        _643 = _645;
    }
    float _647 = _643;
    float _649 = 0.0 + _647;
    float _651 = precise::clamp(_649, 0.0, 1.0);
    float _653 = fma(_417, 0.20999999344348907470703125, _593);
    float _655 = fma(_419, 0.20999999344348907470703125, _611);
    float _657 = fma(_421, 0.20999999344348907470703125, _565);
    float _659 = _653 + _617;
    float _661 = _655 + _619;
    float _663 = _657 + _555;
    float _665 = _339 * _659;
    float _667 = _341 * _661;
    float _669 = _343 * _663;
    float _671 = fma(_665, _621, _561);
    float _673 = fma(_667, _621, _629);
    float _675 = fma(_669, _621, _637);
    out.m_60.x = _671;
    out.m_60.y = _673;
    out.m_60.z = _675;
    out.m_60.w = _651;
    return out;
}

