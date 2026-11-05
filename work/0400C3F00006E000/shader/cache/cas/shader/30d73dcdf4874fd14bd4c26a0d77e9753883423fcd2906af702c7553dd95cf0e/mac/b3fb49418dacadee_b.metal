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
    float4 m_76 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_49 [[user(locn7), flat]];
    float4 m_47 [[user(locn8)]];
    float4 m_72 [[user(locn9), flat]];
    float4 m_74 [[user(locn10)]];
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
    float3 _790 = float3(_120, _126, float(int(_118)));
    float3 _794 = select(_790, float3(0.0), isnan(_790));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _794.xy, uint(rint(_794.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _794.xy, uint(rint(_794.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float3 _811 = float3(_120, _126, float(int(_134)));
    float3 _813 = select(_811, float3(0.0), isnan(_811));
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _813.xy, uint(rint(_813.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _813.xy, uint(rint(_813.z))).xyzw;
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
    float _205 = in.m_59.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _105 * _209;
    float _213 = -_145;
    float _215 = _213 + _155;
    float _217 = fma(_203, _215, _145);
    float _219 = _217 * _195;
    float _221 = _105 * _171;
    float _223 = _105 * _177;
    float _225 = _221 * _219;
    float _227 = _105 * _183;
    float _229 = _223 * _225;
    float _231 = 0.0 + _229;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _233 * _227;
    bool _239 = _235 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _241 = isnan(_235);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _247 = _243 || _245;
    float _249 = in.m_59.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    if (!_247)
    {
        discard_fragment();
    }
    float _255 = in.m_59.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _105 * _253;
    float _263 = 1.0 / _261;
    float _265 = _105 * _259;
    float _267 = _211 * _263;
    float _269 = _265 * _263;
    float2 _982 = float2(_267, _269);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_982, float2(0.0), isnan(_982))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_982, float2(0.0), isnan(_982))).x;
    float _273 = in.m_55.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_55.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_55.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_53.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_53.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_53.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = -_139;
    float _311 = _309 + _149;
    float _313 = -_141;
    float _315 = _313 + _151;
    float _317 = -_143;
    float _319 = _317 + _153;
    float _321 = fma(_203, _311, _139);
    float _323 = fma(_203, _315, _141);
    float _325 = fma(_203, _319, _143);
    float _327 = _321 * _321;
    float _329 = _323 * _323;
    float _331 = _325 * _325;
    float _333 = -_327;
    float _335 = _333 + 1.0;
    float _337 = -_329;
    float _339 = _337 + 1.0;
    float _341 = -_331;
    float _343 = _341 + 1.0;
    float _345 = _105 * _277;
    float _347 = _105 * _283;
    float _349 = _105 * _289;
    float _351 = _345 * _335;
    float _353 = _347 * _339;
    float _355 = _349 * _343;
    float _357 = _105 * _295;
    float _359 = _105 * _301;
    float _361 = _105 * _307;
    float _363 = fma(_327, _357, _351);
    float _365 = fma(_329, _359, _353);
    float _367 = fma(_331, _361, _355);
    if (!_247)
    {
        out.m_62.x = _363;
        out.m_62.y = _365;
        out.m_62.z = _367;
        out.m_62.w = _229;
        return out;
    }
    float _369 = in.m_64.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_64.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_64.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = _105 * _373;
    float _389 = _105 * _379;
    float _391 = _105 * _385;
    float _393 = _387 * _387;
    float _395 = in.m_66.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_391, _391, _401);
    float _405 = rsqrt(_403);
    float _407 = _389 * _405;
    float _409 = _387 * _405;
    float _411 = _391 * _405;
    float _413 = abs(_407);
    float _415 = abs(_409);
    float _417 = precise::max(_413, _415);
    float _419 = abs(_411);
    float _421 = precise::max(_419, _417);
    float _423 = _105 * _399;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _421;
    float _429 = _409 * _427;
    float _431 = -_427;
    float _433 = _411 * _431;
    float _435 = precise::min(_425, 1.0);
    float _437 = _407 * _427;
    float3 _1226 = float3(_437, _429, _433);
    float3 _441 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1226, float3(0.0), isnan(_1226)), level(_435)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1226, float3(0.0), isnan(_1226)), level(_435)).xyz;
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    float _449 = in.m_68.y;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_68.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_70.y;
    float _463 = in.m_68.z;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_70.x;
    float _471 = in.m_59.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_70.z;
    float _479 = in.m_72.x;
    float _481 = in.m_74.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_76.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_76.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_76.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_78.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_78.w;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_78.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = -_423;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _529 = fma(_271, (*spvDescriptorSet0.fp_c8)._m0[30].w, _527);
    float _531 = _525 * 0.02624999918043613433837890625;
    float _533 = _105 * _453;
    float _535 = _105 * _459;
    float _537 = -_461;
    float _539 = _533 + _537;
    float _541 = _105 * _467;
    float _543 = -_469;
    float _545 = _535 + _543;
    float _547 = _105 * _475;
    float _549 = _539 * _539;
    float _551 = -_477;
    float _553 = _541 + _551;
    float _555 = in.m_74.w;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = _547 * _263;
    float _563 = fma(_545, _545, _549);
    float _565 = _479 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _567 = 1.0 / _529;
    float _569 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _571 = fma(_561, (*spvDescriptorSet0.fp_c8)._m0[30].w, _569);
    float _573 = fma(_553, _553, _563);
    float _575 = in.m_74.x;
    float _577 = gl_FragCoord.w;
    float _579 = _575 * _577;
    float _581 = in.m_74.y;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = -_573;
    float _589 = fma(_565, _565, _587);
    float _591 = 1.0 / _571;
    float _593 = precise::max(0.0, _589);
    float _595 = sqrt(_593);
    float _597 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _599 = _591 * _597;
    float _601 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _603 = -_599;
    float _605 = fma(_567, _601, _603);
    float _607 = _105 * _559;
    float _609 = _595 + _605;
    float _611 = in.m_78.z;
    float _613 = gl_FragCoord.w;
    float _615 = _611 * _613;
    float _617 = _105 * _579;
    float _619 = -_607;
    float _621 = _619 + _609;
    float _623 = _105 * _585;
    float _625 = _105 * _485;
    float _627 = _105 * _503;
    float _629 = _621 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _631 = _629 * (-1.44269502162933349609375);
    bool _633 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _635 = exp2(_631);
    float _637 = _599;
    if (_633)
    {
        float _639 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _641 = _599 + _639;
        _637 = _641;
    }
    float _643 = _637;
    float _645 = -_635;
    float _647 = _645 + 1.0;
    float _649 = precise::clamp(_647, 0.0, 1.0);
    float _651 = _105 * _497;
    float _653 = _643;
    if (_633)
    {
        float _655 = _643 * 8.0;
        float _657 = precise::clamp(_655, 0.0, 1.0);
        _653 = _657;
    }
    float _659 = _653;
    float _661 = _235 * _649;
    float _663 = precise::clamp(_661, 0.0, 1.0);
    float _665 = _105 * _515;
    float _667 = _663;
    if (_633)
    {
        float _669 = _663 * _659;
        _667 = _669;
    }
    float _671 = _667;
    float _673 = 0.0 + _671;
    float _675 = precise::clamp(_673, 0.0, 1.0);
    float _677 = fma(_443, 0.20999999344348907470703125, _617);
    float _679 = fma(_445, 0.20999999344348907470703125, _623);
    float _681 = fma(_447, 0.20999999344348907470703125, _625);
    float _683 = _105 * _491;
    float _685 = fma(_531, (*spvDescriptorSet0.fp_c15)._m0[17].x, _677);
    float _687 = fma(_531, (*spvDescriptorSet0.fp_c15)._m0[17].y, _679);
    float _689 = fma(_531, (*spvDescriptorSet0.fp_c15)._m0[17].z, _681);
    float _691 = _105 * _509;
    float _693 = _685 + _683;
    float _695 = _687 + _651;
    float _697 = _689 + _627;
    float _699 = _105 * _521;
    float _701 = _105 * _615;
    float _703 = _363 * _693;
    float _705 = _365 * _695;
    float _707 = _367 * _697;
    float _709 = fma(_703, _665, _691);
    float _711 = fma(_705, _665, _699);
    float _713 = fma(_707, _665, _701);
    out.m_62.x = _709;
    out.m_62.y = _711;
    out.m_62.z = _713;
    out.m_62.w = _675;
    return out;
}

