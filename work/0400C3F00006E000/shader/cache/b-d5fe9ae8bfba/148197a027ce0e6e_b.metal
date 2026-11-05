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
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_78 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_49 [[user(locn7), flat]];
    float4 m_47 [[user(locn8)]];
    float4 m_72 [[user(locn9), flat]];
    float4 m_76 [[user(locn10)]];
    float4 m_59 [[user(locn11)]];
    float4 m_57 [[user(locn12)]];
    float4 m_70 [[user(locn13), flat]];
    float4 m_43 [[user(locn14), flat]];
    float4 m_64 [[user(locn15)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _85 = in.m_43.x;
    float _87 = gl_FragCoord.w;
    float _89 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _91 = in.m_47.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_47.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _85 + 1.0;
    float _105 = 1.0 / _87;
    float _107 = _103 * _89;
    float _109 = floor(_107);
    float _111 = rint(_85);
    float _113 = precise::max(_111, 0.0);
    uint _116 = uint(_113);
    uint _118 = clamp(_116, 0u, 65535u);
    float _120 = _105 * _95;
    float _122 = -_109;
    float _124 = fma(_122, (*spvDescriptorSet0.fp_c9)._m0[22].x, _103);
    float _126 = _105 * _101;
    float _128 = rint(_124);
    float _130 = precise::max(_128, 0.0);
    uint _132 = uint(_130);
    uint _134 = clamp(_132, 0u, 65535u);
    float3 _800 = float3(_120, _126, float(int(_118)));
    float3 _804 = select(_800, float3(0.0), isnan(_800));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _804.xy, uint(rint(_804.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _804.xy, uint(rint(_804.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float3 _821 = float3(_120, _126, float(int(_134)));
    float3 _823 = select(_821, float3(0.0), isnan(_821));
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _823.xy, uint(rint(_823.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _823.xy, uint(rint(_823.z))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float _157 = in.m_49.y;
    float _159 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _161 = in.m_51.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_53.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_55.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_57.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _157 * _159;
    float _187 = _185 * _159;
    float _189 = floor(_187);
    float _191 = -_189;
    float _193 = fma(_191, (*spvDescriptorSet0.fp_c9)._m0[22].y, _185);
    float _195 = _105 * _165;
    float _197 = _193 + 9.9999997473787516355514526367188e-05;
    float _199 = floor(_197);
    float _201 = -_199;
    float _203 = _197 + _201;
    float _205 = _105 * _183;
    float _207 = -_145;
    float _209 = _207 + _155;
    float _211 = fma(_203, _209, _145);
    float _213 = _211 * _195;
    float _215 = _105 * _171;
    float _217 = _105 * _177;
    float _219 = _215 * _213;
    float _221 = _217 * _219;
    float _223 = 0.0 + _221;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _225 * _205;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_59.w;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = _105;
    if (!_239)
    {
        discard_fragment();
    }
    float _249 = in.m_59.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_59.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _105 * _245;
    float _263 = 1.0 / _261;
    float _265 = _105 * _253;
    float _267 = _105 * _259;
    float _269 = _265 * _263;
    float _271 = _267 * _263;
    float2 _993 = float2(_271, _269);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_993, float2(0.0), isnan(_993))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_993, float2(0.0), isnan(_993))).x;
    float _275 = in.m_53.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_55.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_53.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_55.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_53.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_55.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_51.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_51.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_51.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = -_139;
    float _331 = _329 + _149;
    float _333 = -_141;
    float _335 = _333 + _151;
    float _337 = -_143;
    float _339 = _337 + _153;
    float _341 = fma(_203, _331, _139);
    float _343 = fma(_203, _335, _141);
    float _345 = fma(_203, _339, _143);
    float _347 = _341 * _341;
    float _349 = _343 * _343;
    float _351 = _345 * _345;
    float _353 = _105 * _279;
    float _355 = _105 * _285;
    float _357 = _105 * _291;
    float _359 = _105 * _297;
    float _361 = _105 * _303;
    float _363 = _105 * _309;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = _105 * _315;
    float _375 = -_363;
    float _377 = _361 + _375;
    float _379 = fma(_347, _367, _355);
    float _381 = fma(_349, _371, _359);
    float _383 = _105 * _321;
    float _385 = fma(_351, _377, _363);
    float _387 = _105 * _327;
    float _389 = _379 * _373;
    float _391 = _381 * _383;
    float _393 = _385 * _387;
    if (!_239)
    {
        out.m_62.x = _389;
        out.m_62.y = _391;
        out.m_62.z = _393;
        out.m_62.w = _221;
        return out;
    }
    float _395 = in.m_64.y;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_64.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_64.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = _105 * _399;
    float _415 = _105 * _405;
    float _417 = _105 * _411;
    float _419 = _413 * _413;
    float _421 = in.m_66.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = fma(_415, _415, _419);
    float _429 = fma(_417, _417, _427);
    float _431 = rsqrt(_429);
    float _433 = _415 * _431;
    float _435 = _413 * _431;
    float _437 = _417 * _431;
    float _439 = _105 * _425;
    float _441 = abs(_433);
    float _443 = abs(_435);
    float _445 = precise::max(_441, _443);
    float _447 = precise::min(_439, 1.0);
    float _449 = abs(_437);
    float _451 = precise::max(_449, _445);
    float _453 = 1.0 / _451;
    float _455 = _433 * _453;
    float _457 = _435 * _453;
    float _459 = -_453;
    float _461 = _437 * _459;
    float3 _1268 = float3(_455, _457, _461);
    float3 _465 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1268, float3(0.0), isnan(_1268)), level(_447)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1268, float3(0.0), isnan(_1268)), level(_447)).xyz;
    float _467 = _465.x;
    float _469 = _465.y;
    float _471 = _465.z;
    float _473 = in.m_68.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_68.x;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_70.y;
    float _487 = in.m_70.x;
    float _489 = in.m_68.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_59.z;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_70.z;
    float _503 = in.m_72.x;
    float _505 = in.m_74.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_74.w;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_74.z;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_76.z;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _531 = fma(_273, (*spvDescriptorSet0.fp_c8)._m0[30].w, _529);
    float _533 = _105 * _477;
    float _535 = _105 * _483;
    float _537 = in.m_78.x;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = -_485;
    float _545 = _533 + _543;
    float _547 = -_487;
    float _549 = _535 + _547;
    float _551 = _105 * _493;
    float _553 = _503 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _555 = _545 * _545;
    float _557 = _105 * _499;
    float _559 = -_501;
    float _561 = _551 + _559;
    float _563 = in.m_78.y;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = fma(_549, _549, _555);
    float _571 = _557 * _263;
    float _573 = in.m_76.w;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = 1.0 / _531;
    float _581 = fma(_561, _561, _569);
    float _583 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _585 = fma(_571, (*spvDescriptorSet0.fp_c8)._m0[30].w, _583);
    float _587 = in.m_76.y;
    float _589 = gl_FragCoord.w;
    float _591 = _587 * _589;
    float _593 = in.m_78.z;
    float _595 = gl_FragCoord.w;
    float _597 = _593 * _595;
    float _599 = -_581;
    float _601 = fma(_553, _553, _599);
    float _603 = _105 * _527;
    float _605 = 1.0 / _585;
    float _607 = in.m_76.x;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = precise::max(0.0, _601);
    float _615 = sqrt(_613);
    float _617 = _105 * _541;
    float _619 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _621 = _605 * _619;
    float _623 = _105 * _515;
    float _625 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _627 = -_621;
    float _629 = fma(_579, _625, _627);
    float _631 = _105 * _567;
    float _633 = _615 + _629;
    float _635 = _105 * _577;
    float _637 = in.m_74.y;
    float _639 = gl_FragCoord.w;
    float _641 = _637 * _639;
    float _643 = _105 * _597;
    float _645 = -_635;
    float _647 = _645 + _633;
    bool _649 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _651 = _105 * _591;
    float _653 = _105 * _509;
    float _655 = _647 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _657 = _105 * _611;
    float _659 = _655 * (-1.44269502162933349609375);
    float _661 = exp2(_659);
    float _663 = _621;
    if (_649)
    {
        float _665 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _667 = _621 + _665;
        _663 = _667;
    }
    float _669 = _663;
    float _671 = -_661;
    float _673 = _671 + 1.0;
    float _675 = precise::clamp(_673, 0.0, 1.0);
    float _677 = _105 * _641;
    float _679 = _105 * _521;
    if (_649)
    {
        float _681 = _669 * 8.0;
        float _683 = precise::clamp(_681, 0.0, 1.0);
        _247 = _683;
    }
    float _685 = _247;
    float _687 = _227 * _675;
    float _689 = precise::clamp(_687, 0.0, 1.0);
    float _691 = _689;
    if (_649)
    {
        float _693 = _689 * _685;
        _691 = _693;
    }
    float _695 = _691;
    float _697 = 0.0 + _695;
    float _699 = precise::clamp(_697, 0.0, 1.0);
    float _701 = fma(_467, 0.20999999344348907470703125, _657);
    float _703 = fma(_469, 0.20999999344348907470703125, _651);
    float _705 = fma(_471, 0.20999999344348907470703125, _603);
    float _707 = _701 + _617;
    float _709 = _703 + _631;
    float _711 = _705 + _643;
    float _713 = _389 * _707;
    float _715 = _391 * _709;
    float _717 = _393 * _711;
    float _719 = fma(_713, _623, _653);
    float _721 = fma(_715, _623, _677);
    float _723 = fma(_717, _623, _679);
    out.m_62.x = _719;
    out.m_62.y = _721;
    out.m_62.z = _723;
    out.m_62.w = _699;
    return out;
}

