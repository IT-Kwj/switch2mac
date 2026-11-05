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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_53 [[user(locn4), flat]];
    float4 m_49 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_47 [[user(locn9), flat]];
    float4 m_66 [[user(locn10)]];
    float4 m_74 [[user(locn11)]];
    float4 m_70 [[user(locn12)]];
    float4 m_68 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = gl_FragCoord.w;
    float _85 = in.m_47.x;
    float _87 = in.m_49.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _95 = in.m_49.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_51.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_51.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = 1.0 / _83;
    float _121 = _85 + 1.0;
    float _123 = _121 * _93;
    float _125 = rint(_85);
    float _127 = precise::max(_125, 0.0);
    uint _130 = uint(_127);
    uint _132 = clamp(_130, 0u, 65535u);
    float _134 = floor(_123);
    float _136 = _119 * _91;
    float _138 = _119 * _111;
    float _140 = 1.0 / _136;
    float _142 = -_134;
    float _144 = fma(_142, (*spvDescriptorSet0.fp_c9)._m0[22].x, _121);
    float _146 = _119 * _99;
    float _148 = _119 * _105;
    float _150 = rint(_144);
    float _152 = precise::max(_150, 0.0);
    uint _154 = uint(_152);
    uint _156 = clamp(_154, 0u, 65535u);
    float _158 = _146 * _140;
    float _160 = _148 * _140;
    float _162 = _119 * _117;
    float2 _790 = float2(_158, _160);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_790, float2(0.0), isnan(_790))).x;
    float3 _803 = float3(_138, _162, float(int(_132)));
    float3 _807 = select(_803, float3(0.0), isnan(_803));
    float4 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _807.xy, uint(rint(_807.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _807.xy, uint(rint(_807.z))).xyzw;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _167.w;
    float3 _824 = float3(_138, _162, float(int(_156)));
    float3 _826 = select(_824, float3(0.0), isnan(_824));
    float4 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _826.xy, uint(rint(_826.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _826.xy, uint(rint(_826.z))).xyzw;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float _185 = _177.w;
    float _187 = in.m_53.y;
    float _189 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _191 = in.m_49.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_55.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_57.w;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_59.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_61.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = _187 * _189;
    float _223 = _221 * _189;
    float _225 = floor(_223);
    float _227 = _119 * _195;
    float _229 = _227 * _140;
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _233 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[30].w, _231);
    float _235 = 1.0 / _233;
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.fp_c9)._m0[22].y, _221);
    float _241 = _239 + 9.9999997473787516355514526367188e-05;
    float _243 = floor(_241);
    float _245 = -_243;
    float _247 = _241 + _245;
    float _249 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _253 = fma(_164, (*spvDescriptorSet0.fp_c8)._m0[30].w, _251);
    float _255 = 1.0 / _253;
    float _257 = -_175;
    float _259 = _257 + _185;
    float _261 = _119 * _207;
    float _263 = fma(_247, _259, _175);
    float _265 = _119 * _201;
    float _267 = -_265;
    float _269 = fma(_263, _261, _267);
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = _235 * _271;
    float _275 = _119 * _213;
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _279 = -_273;
    float _281 = fma(_255, _277, _279);
    float _283 = _275 * _269;
    float _285 = _281 * _249;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = 0.0 + _283;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _119 * _219;
    float _295 = _291 * _287;
    float _297 = _295 * _293;
    bool _301 = _297 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _303 = isnan(_297);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _309 = _305 || _307;
    float _311 = in.m_59.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_59.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_59.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_55.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _273;
    if (!_309)
    {
        discard_fragment();
    }
    float _349 = -_171;
    float _351 = _349 + _181;
    float _353 = -_173;
    float _355 = _353 + _183;
    float _357 = -_169;
    float _359 = _357 + _179;
    float _361 = fma(_247, _351, _171);
    float _363 = fma(_247, _355, _173);
    float _365 = fma(_247, _359, _169);
    float _367 = _361 * _361;
    float _369 = _363 * _363;
    float _371 = _365 * _365;
    float _373 = -_369;
    float _375 = _373 + 1.0;
    float _377 = -_371;
    float _379 = _377 + 1.0;
    float _381 = _119 * _315;
    float _383 = _119 * _321;
    float _385 = _119 * _327;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = _381 * _379;
    float _393 = _119 * _339;
    float _395 = _385 * _375;
    float _397 = _383 * _389;
    float _399 = _119 * _333;
    float _401 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = _119 * _345;
    float _407 = fma(_367, _393, _397);
    float _409 = fma(_371, _399, _391);
    float _411 = fma(_403, -0.5, 1.0);
    float _413 = fma(_369, _405, _395);
    float _415 = _409 * _411;
    float _417 = _407 * _411;
    float _419 = _413 * _411;
    if (!_309)
    {
        out.m_64.x = _415;
        out.m_64.y = _417;
        out.m_64.z = _419;
        out.m_64.w = _283;
        return out;
    }
    float _421 = in.m_66.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_66.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_66.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_68.x;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _119 * _425;
    float _447 = _119 * _431;
    float _449 = _119 * _437;
    float _451 = _445 * _445;
    float _453 = fma(_447, _447, _451);
    float _455 = fma(_449, _449, _453);
    float _457 = rsqrt(_455);
    float _459 = _447 * _457;
    float _461 = _445 * _457;
    float _463 = _449 * _457;
    float _465 = _119 * _443;
    float _467 = abs(_459);
    float _469 = abs(_461);
    float _471 = precise::max(_467, _469);
    float _473 = precise::min(_465, 1.0);
    float _475 = abs(_463);
    float _477 = precise::max(_475, _471);
    float _479 = 1.0 / _477;
    float _481 = -_479;
    float _483 = _463 * _481;
    float _485 = _459 * _479;
    float _487 = _461 * _479;
    float3 _1267 = float3(_485, _487, _483);
    float3 _491 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1267, float3(0.0), isnan(_1267)), level(_473)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1267, float3(0.0), isnan(_1267)), level(_473)).xyz;
    float _493 = _491.x;
    float _495 = _491.y;
    float _497 = _491.z;
    float _499 = in.m_70.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_70.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_70.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_72.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_72.z;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_72.y;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_74.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_74.x;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_74.y;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_76.x;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_76.y;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_76.z;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_76.w;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    bool _577 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _579 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _581 = _579 + 1.0;
    if (_577)
    {
        float _583 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _585 = _273 + _583;
        _347 = _585;
    }
    float _587 = _347;
    float _589 = _119 * _503;
    float _591 = _119 * _509;
    float _593 = _119 * _515;
    float _595 = _119 * _521;
    float _597 = fma(_589, (*spvDescriptorSet0.fp_c13)._m0[0].y, _581);
    float _599 = fma(_591, (*spvDescriptorSet0.fp_c13)._m0[0].y, _581);
    float _601 = fma(_593, (*spvDescriptorSet0.fp_c13)._m0[0].y, _581);
    float _603 = _119 * _527;
    float _605 = _119 * _539;
    float _607 = _417 * _599;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = _419 * _601;
    float _613 = precise::clamp(_611, 0.0, 1.0);
    float _615 = _119 * _545;
    float _617 = _119 * _551;
    float _619 = _415 * _597;
    float _621 = precise::clamp(_619, 0.0, 1.0);
    float _623 = _119 * _557;
    float _625 = _119 * _563;
    float _627 = _119 * _569;
    float _629 = fma(_493, 0.20999999344348907470703125, _595);
    float _631 = _119 * _533;
    float _633 = fma(_497, 0.20999999344348907470703125, _603);
    float _635 = _603;
    if (_577)
    {
        float _637 = _587 * 8.0;
        float _639 = precise::clamp(_637, 0.0, 1.0);
        _635 = _639;
    }
    float _641 = _635;
    float _643 = _629 + _615;
    float _645 = fma(_495, 0.20999999344348907470703125, _631);
    float _647 = _633 + _605;
    float _649 = 0.0 + _297;
    float _651 = precise::clamp(_649, 0.0, 1.0);
    float _653 = _119 * _575;
    float _655 = _645 + _617;
    float _657 = _621 * _643;
    float _659 = _613 * _647;
    float _661 = _651;
    if (_577)
    {
        float _663 = _651 * _641;
        _661 = _663;
    }
    float _665 = _661;
    float _667 = _609 * _655;
    float _669 = fma(_657, _653, _623);
    float _671 = fma(_659, _653, _627);
    float _673 = 0.0 + _665;
    float _675 = precise::clamp(_673, 0.0, 1.0);
    float _677 = fma(_667, _653, _625);
    out.m_64.x = _669;
    out.m_64.y = _677;
    out.m_64.z = _671;
    out.m_64.w = _675;
    return out;
}

