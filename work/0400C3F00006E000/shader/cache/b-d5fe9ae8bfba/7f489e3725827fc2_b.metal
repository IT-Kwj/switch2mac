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
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_55 [[user(locn3), flat]];
    float4 m_72 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_45 [[user(locn6), flat]];
    float4 m_66 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_51 [[user(locn10), flat]];
    float4 m_47 [[user(locn11)]];
    float4 m_61 [[user(locn12)]];
    float4 m_68 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _81 = gl_FragCoord.w;
    float _83 = in.m_45.x;
    float _85 = in.m_47.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _93 = in.m_47.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_49.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_47.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_49.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = 1.0 / _81;
    float _119 = _83 + 1.0;
    float _121 = _119 * _91;
    float _123 = rint(_83);
    float _125 = precise::max(_123, 0.0);
    uint _128 = uint(_125);
    uint _130 = clamp(_128, 0u, 65535u);
    float _132 = floor(_121);
    float _134 = _117 * _89;
    float _136 = _117 * _103;
    float _138 = _117 * _115;
    float _140 = 1.0 / _134;
    float _142 = -_132;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c9)._m0[22].x, _119);
    float _146 = _117 * _97;
    float _148 = _117 * _109;
    float _150 = rint(_144);
    float _152 = precise::max(_150, 0.0);
    uint _154 = uint(_152);
    uint _156 = clamp(_154, 0u, 65535u);
    float _158 = _146 * _140;
    float _160 = _148 * _140;
    float2 _810 = float2(_158, _160);
    float _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_810, float2(0.0), isnan(_810))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_810, float2(0.0), isnan(_810))).x;
    float3 _823 = float3(_136, _138, float(int(_130)));
    float3 _827 = select(_823, float3(0.0), isnan(_823));
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _827.xy, uint(rint(_827.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _827.xy, uint(rint(_827.z))).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float3 _844 = float3(_136, _138, float(int(_156)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float4 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _846.xy, uint(rint(_846.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _846.xy, uint(rint(_846.z))).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float _185 = in.m_51.y;
    float _187 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _189 = in.m_53.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_47.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_55.y;
    float _203 = in.m_57.w;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_59.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _185 * _187;
    float _217 = _117 * _193;
    float _219 = _117 * _199;
    float _221 = _215 * _187;
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _225 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _223;
    float _227 = -_201;
    float _229 = _217 + _227;
    float _231 = _219 * _140;
    float _233 = floor(_221);
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _237 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[30].w, _235);
    float _239 = 1.0 / _225;
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.fp_c9)._m0[22].y, _215);
    float _245 = precise::max(_229, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _247 = 1.0 / _237;
    float _249 = _243 + 9.9999997473787516355514526367188e-05;
    float _251 = precise::min(_245, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _253 = floor(_249);
    float _255 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _257 = _251 + _255;
    float _259 = -_257;
    float _261 = fma(_259, _239, 1.0);
    float _263 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _265 = -_253;
    float _267 = _249 + _265;
    float _269 = in.m_61.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_59.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_57.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _117 * _273;
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _291 = fma(_162, (*spvDescriptorSet0.fp_c8)._m0[30].w, _289);
    float _293 = 1.0 / _291;
    float _295 = -_173;
    float _297 = _295 + _183;
    float _299 = fma(_267, _297, _173);
    float _301 = _117 * _213;
    float _303 = _299 * _261;
    float _305 = _117 * _207;
    float _307 = _305 * _303;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _311 = _247 * _309;
    float _313 = _301 * _307;
    float _315 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _317 = -_311;
    float _319 = fma(_293, _315, _317);
    float _321 = 0.0 + _313;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _319 * _263;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _323 * _327;
    float _331 = _329 * _287;
    bool _335 = _331 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _337 = isnan(_331);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _343 = _339 || _341;
    float _345 = in.m_59.x;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_59.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_57.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = _311;
    float _371 = _117;
    if (!_343)
    {
        discard_fragment();
    }
    float _373 = -_167;
    float _375 = _373 + _177;
    float _377 = -_169;
    float _379 = _377 + _179;
    float _381 = -_171;
    float _383 = _381 + _181;
    float _385 = _117 * _279;
    float _387 = fma(_267, _375, _167);
    float _389 = fma(_267, _379, _169);
    float _391 = fma(_267, _383, _171);
    float _393 = -_387;
    float _395 = _393 + 1.0;
    float _397 = _117 * _349;
    float _399 = _117 * _355;
    float _401 = -_389;
    float _403 = _401 + 1.0;
    float _405 = -_391;
    float _407 = _405 + 1.0;
    float _409 = _397 * _395;
    float _411 = _117 * _361;
    float _413 = _399 * _403;
    float _415 = _385 * _407;
    float _417 = _117 * _367;
    float _419 = _117 * _285;
    float _421 = fma(_387, _411, _409);
    float _423 = fma(_389, _417, _413);
    float _425 = fma(_391, _419, _415);
    if (!_343)
    {
        out.m_64.x = _421;
        out.m_64.y = _423;
        out.m_64.z = _425;
        out.m_64.w = _313;
        return out;
    }
    float _427 = in.m_66.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_66.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_66.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _117 * _431;
    float _447 = _117 * _437;
    float _449 = _117 * _443;
    float _451 = _445 * _445;
    float _453 = fma(_447, _447, _451);
    float _455 = fma(_449, _449, _453);
    float _457 = rsqrt(_455);
    float _459 = _447 * _457;
    float _461 = _445 * _457;
    float _463 = _449 * _457;
    float _465 = abs(_459);
    float _467 = abs(_461);
    float _469 = precise::max(_465, _467);
    float _471 = abs(_463);
    float _473 = precise::max(_471, _469);
    float _475 = 1.0 / _473;
    float _477 = _459 * _475;
    float _479 = _461 * _475;
    float _481 = -_475;
    float _483 = _463 * _481;
    float3 _1286 = float3(_477, _479, _483);
    float3 _487 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1286, float3(0.0), isnan(_1286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1286, float3(0.0), isnan(_1286)), level(0.0)).xyz;
    float _489 = _487.x;
    float _491 = _487.y;
    float _493 = _487.z;
    float _495 = in.m_53.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_55.x;
    float _503 = in.m_53.z;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_55.z;
    float _511 = in.m_68.x;
    float _513 = _229 * _229;
    float _515 = in.m_70.z;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_70.x;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_72.x;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_72.y;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = in.m_72.z;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_72.w;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = _117 * _499;
    float _553 = -_501;
    float _555 = _551 + _553;
    float _557 = _117 * _507;
    float _559 = _511 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _561 = in.m_70.y;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = fma(_555, _555, _513);
    float _569 = -_509;
    float _571 = _557 + _569;
    float _573 = in.m_74.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = _117 * _525;
    float _581 = _117 * _543;
    float _583 = fma(_571, _571, _567);
    float _585 = in.m_74.w;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = -_583;
    float _593 = fma(_559, _559, _591);
    float _595 = in.m_74.y;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = precise::max(0.0, _593);
    float _603 = sqrt(_601);
    float _605 = _117 * _565;
    float _607 = _117 * _519;
    float _609 = _117 * _577;
    float _611 = _319 + _603;
    float _613 = in.m_74.z;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = _117 * _589;
    bool _621 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _623 = _117 * _537;
    float _625 = -_619;
    float _627 = _625 + _611;
    float _629 = _117 * _599;
    float _631 = _117 * _531;
    float _633 = _117 * _549;
    float _635 = _627 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _637 = _635 * (-1.44269502162933349609375);
    if (_621)
    {
        float _639 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _641 = _311 + _639;
        _369 = _641;
    }
    float _643 = _369;
    float _645 = exp2(_637);
    float _647 = _117 * _617;
    if (_621)
    {
        float _649 = _643 * 8.0;
        float _651 = precise::clamp(_649, 0.0, 1.0);
        _371 = _651;
    }
    float _653 = _371;
    float _655 = -_645;
    float _657 = _655 + 1.0;
    float _659 = precise::clamp(_657, 0.0, 1.0);
    float _661 = _331 * _659;
    float _663 = precise::clamp(_661, 0.0, 1.0);
    float _665 = _663;
    if (_621)
    {
        float _667 = _663 * _653;
        _665 = _667;
    }
    float _669 = _665;
    float _671 = 0.0 + _669;
    float _673 = precise::clamp(_671, 0.0, 1.0);
    float _675 = fma(_489, 0.20999999344348907470703125, _609);
    float _677 = fma(_491, 0.20999999344348907470703125, _629);
    float _679 = fma(_493, 0.20999999344348907470703125, _647);
    float _681 = _675 + _579;
    float _683 = _677 + _605;
    float _685 = _679 + _607;
    float _687 = _421 * _681;
    float _689 = _423 * _683;
    float _691 = _425 * _685;
    float _693 = fma(_687, _633, _631);
    float _695 = fma(_689, _633, _623);
    float _697 = fma(_691, _633, _581);
    out.m_64.x = _693;
    out.m_64.y = _695;
    out.m_64.z = _697;
    out.m_64.w = _673;
    return out;
}

