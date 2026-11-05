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
    float4 m_43 [[user(locn2), flat]];
    float4 m_64 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_49 [[user(locn7), flat]];
    float4 m_47 [[user(locn8)]];
    float4 m_72 [[user(locn9), flat]];
    float4 m_74 [[user(locn10)]];
    float4 m_59 [[user(locn11)]];
    float4 m_57 [[user(locn12)]];
    float4 m_70 [[user(locn13), flat]];
    float4 m_51 [[user(locn14)]];
    float4 m_76 [[user(locn15)]];
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
    float _109 = rint(_85);
    float _111 = precise::max(_109, 0.0);
    uint _114 = uint(_111);
    uint _116 = clamp(_114, 0u, 65535u);
    float _118 = floor(_107);
    float _120 = _105 * _95;
    float _122 = -_118;
    float _124 = fma(_122, (*spvDescriptorSet0.fp_c9)._m0[22].x, _103);
    float _126 = _105 * _101;
    float _128 = rint(_124);
    float _130 = precise::max(_128, 0.0);
    uint _132 = uint(_130);
    uint _134 = clamp(_132, 0u, 65535u);
    float3 _780 = float3(_120, _126, float(int(_116)));
    float3 _784 = select(_780, float3(0.0), isnan(_780));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _784.xy, uint(rint(_784.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _784.xy, uint(rint(_784.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float3 _801 = float3(_120, _126, float(int(_134)));
    float3 _803 = select(_801, float3(0.0), isnan(_801));
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _803.xy, uint(rint(_803.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _803.xy, uint(rint(_803.z))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float _157 = in.m_49.y;
    float _159 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _161 = in.m_51.y;
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
    float _187 = _105 * _165;
    float _189 = _185 * _159;
    float _191 = abs(_187);
    float _193 = _191 * 2.0;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = floor(_189);
    float _199 = -_195;
    float _201 = _199 + 1.0;
    float _203 = -_197;
    float _205 = fma(_203, (*spvDescriptorSet0.fp_c9)._m0[22].y, _185);
    float _207 = _105 * _171;
    float _209 = _205 + 9.9999997473787516355514526367188e-05;
    float _211 = floor(_209);
    float _213 = -_211;
    float _215 = _209 + _213;
    float _217 = _105 * _183;
    float _219 = in.m_59.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = -_145;
    float _227 = _225 + _155;
    float _229 = fma(_215, _227, _145);
    float _231 = _229 * _207;
    float _233 = _105 * _177;
    float _235 = _201 * _201;
    float _237 = _233 * _231;
    float _239 = _237 * _235;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _241 * _217;
    bool _247 = _243 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _249 = isnan(_243);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _255 = _251 || _253;
    float _257 = in.m_59.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _105;
    if (!_255)
    {
        discard_fragment();
    }
    float _265 = in.m_59.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _105 * _223;
    float _273 = _105 * _261;
    float _275 = 1.0 / _273;
    float _277 = _105 * _269;
    float _279 = _277 * _275;
    float _281 = _271 * _275;
    float2 _985 = float2(_279, _281);
    float _283 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_985, float2(0.0), isnan(_985))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_985, float2(0.0), isnan(_985))).x;
    float _285 = in.m_55.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_55.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_55.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_53.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_53.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_53.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = -_141;
    float _323 = _321 + _151;
    float _325 = -_139;
    float _327 = _325 + _149;
    float _329 = -_143;
    float _331 = _329 + _153;
    float _333 = fma(_215, _323, _141);
    float _335 = fma(_215, _327, _139);
    float _337 = fma(_215, _331, _143);
    float _339 = -_333;
    float _341 = _339 + 1.0;
    float _343 = _105 * _289;
    float _345 = _105 * _295;
    float _347 = _105 * _301;
    float _349 = -_335;
    float _351 = _349 + 1.0;
    float _353 = -_337;
    float _355 = _353 + 1.0;
    float _357 = _345 * _341;
    float _359 = _105 * _307;
    float _361 = _343 * _351;
    float _363 = _347 * _355;
    float _365 = _105 * _313;
    float _367 = _105 * _319;
    float _369 = fma(_335, _359, _361);
    float _371 = fma(_333, _365, _357);
    float _373 = fma(_337, _367, _363);
    if (!_255)
    {
        out.m_62.x = _369;
        out.m_62.y = _371;
        out.m_62.z = _373;
        out.m_62.w = _241;
        return out;
    }
    float _375 = in.m_64.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_64.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_64.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = _105 * _379;
    float _395 = _105 * _385;
    float _397 = _105 * _391;
    float _399 = _393 * _393;
    float _401 = in.m_66.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = fma(_395, _395, _399);
    float _409 = fma(_397, _397, _407);
    float _411 = rsqrt(_409);
    float _413 = _395 * _411;
    float _415 = _393 * _411;
    float _417 = _397 * _411;
    float _419 = _105 * _405;
    float _421 = abs(_413);
    float _423 = abs(_415);
    float _425 = precise::max(_421, _423);
    float _427 = precise::min(_419, 1.0);
    float _429 = abs(_417);
    float _431 = precise::max(_429, _425);
    float _433 = 1.0 / _431;
    float _435 = _413 * _433;
    float _437 = _415 * _433;
    float _439 = -_433;
    float _441 = _417 * _439;
    float3 _1218 = float3(_435, _437, _441);
    float3 _445 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1218, float3(0.0), isnan(_1218)), level(_427)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1218, float3(0.0), isnan(_1218)), level(_427)).xyz;
    float _447 = _445.x;
    float _449 = _445.y;
    float _451 = _445.z;
    float _453 = in.m_68.y;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_68.x;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_70.y;
    float _467 = in.m_70.x;
    float _469 = in.m_68.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_59.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_70.z;
    float _483 = in.m_72.x;
    float _485 = in.m_74.x;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_74.w;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_74.z;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_76.z;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _511 = fma(_283, (*spvDescriptorSet0.fp_c8)._m0[30].w, _509);
    float _513 = _105 * _457;
    float _515 = _105 * _463;
    float _517 = in.m_78.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = -_465;
    float _525 = _513 + _523;
    float _527 = -_467;
    float _529 = _515 + _527;
    float _531 = _105 * _473;
    float _533 = _483 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _535 = _525 * _525;
    float _537 = _105 * _479;
    float _539 = -_481;
    float _541 = _531 + _539;
    float _543 = in.m_78.y;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = fma(_529, _529, _535);
    float _551 = _537 * _275;
    float _553 = in.m_76.w;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = 1.0 / _511;
    float _561 = fma(_541, _541, _549);
    float _563 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _565 = fma(_551, (*spvDescriptorSet0.fp_c8)._m0[30].w, _563);
    float _567 = in.m_76.y;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_78.z;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = -_561;
    float _581 = fma(_533, _533, _579);
    float _583 = _105 * _507;
    float _585 = 1.0 / _565;
    float _587 = in.m_76.x;
    float _589 = gl_FragCoord.w;
    float _591 = _587 * _589;
    float _593 = precise::max(0.0, _581);
    float _595 = sqrt(_593);
    float _597 = _105 * _521;
    float _599 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _601 = _585 * _599;
    float _603 = _105 * _495;
    float _605 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _607 = -_601;
    float _609 = fma(_559, _605, _607);
    float _611 = _105 * _547;
    float _613 = _595 + _609;
    float _615 = _105 * _557;
    float _617 = in.m_74.y;
    float _619 = gl_FragCoord.w;
    float _621 = _617 * _619;
    float _623 = _105 * _577;
    float _625 = -_615;
    float _627 = _625 + _613;
    bool _629 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _631 = _105 * _571;
    float _633 = _105 * _489;
    float _635 = _627 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _637 = _105 * _591;
    float _639 = _635 * (-1.44269502162933349609375);
    float _641 = exp2(_639);
    float _643 = _601;
    if (_629)
    {
        float _645 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _647 = _601 + _645;
        _643 = _647;
    }
    float _649 = _643;
    float _651 = -_641;
    float _653 = _651 + 1.0;
    float _655 = precise::clamp(_653, 0.0, 1.0);
    float _657 = _105 * _621;
    float _659 = _105 * _501;
    if (_629)
    {
        float _661 = _649 * 8.0;
        float _663 = precise::clamp(_661, 0.0, 1.0);
        _263 = _663;
    }
    float _665 = _263;
    float _667 = _243 * _655;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    float _671 = _669;
    if (_629)
    {
        float _673 = _669 * _665;
        _671 = _673;
    }
    float _675 = _671;
    float _677 = 0.0 + _675;
    float _679 = precise::clamp(_677, 0.0, 1.0);
    float _681 = fma(_447, 0.20999999344348907470703125, _637);
    float _683 = fma(_449, 0.20999999344348907470703125, _631);
    float _685 = fma(_451, 0.20999999344348907470703125, _583);
    float _687 = _681 + _597;
    float _689 = _683 + _611;
    float _691 = _685 + _623;
    float _693 = _369 * _687;
    float _695 = _371 * _689;
    float _697 = _373 * _691;
    float _699 = fma(_693, _603, _633);
    float _701 = fma(_695, _603, _657);
    float _703 = fma(_697, _603, _659);
    out.m_62.x = _699;
    out.m_62.y = _701;
    out.m_62.z = _703;
    out.m_62.w = _679;
    return out;
}

