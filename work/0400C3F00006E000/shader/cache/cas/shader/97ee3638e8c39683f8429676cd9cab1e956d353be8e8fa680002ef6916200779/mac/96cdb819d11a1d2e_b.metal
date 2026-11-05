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
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
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
    float3 _794 = float3(_120, _126, float(int(_118)));
    float3 _798 = select(_794, float3(0.0), isnan(_794));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _798.xy, uint(rint(_798.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _798.xy, uint(rint(_798.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float3 _815 = float3(_120, _126, float(int(_134)));
    float3 _817 = select(_815, float3(0.0), isnan(_815));
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _817.xy, uint(rint(_817.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _817.xy, uint(rint(_817.z))).xyzw;
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
    float _187 = _105 * _165;
    float _189 = _185 * _159;
    float _191 = floor(_189);
    float _193 = -_191;
    float _195 = fma(_193, (*spvDescriptorSet0.fp_c9)._m0[22].y, _185);
    float _197 = _105 * _177;
    float _199 = _195 + 9.9999997473787516355514526367188e-05;
    float _201 = floor(_199);
    float _203 = -_201;
    float _205 = _199 + _203;
    float _207 = in.m_59.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = -_145;
    float _215 = _213 + _155;
    float _217 = fma(_205, _215, _145);
    float _219 = _105 * _171;
    float _221 = -_187;
    float _223 = fma(_217, _219, _221);
    float _225 = _197 * _223;
    float _227 = _105 * _183;
    float _229 = 0.0 + _225;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _231 * _227;
    bool _237 = _233 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _239 = isnan(_233);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _245 = _241 || _243;
    float _247 = in.m_59.w;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _105;
    if (!_245)
    {
        discard_fragment();
    }
    float _255 = in.m_59.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _105 * _211;
    float _263 = _105 * _251;
    float _265 = 1.0 / _263;
    float _267 = _105 * _259;
    float _269 = _261 * _265;
    float _271 = _267 * _265;
    float2 _987 = float2(_271, _269);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_987, float2(0.0), isnan(_987))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_987, float2(0.0), isnan(_987))).x;
    float _275 = in.m_51.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_55.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_51.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_55.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_51.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_55.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_53.x;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_53.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_53.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = -_139;
    float _331 = _329 + _149;
    float _333 = -_141;
    float _335 = _333 + _151;
    float _337 = -_143;
    float _339 = _337 + _153;
    float _341 = fma(_205, _331, _139);
    float _343 = fma(_205, _335, _141);
    float _345 = fma(_205, _339, _143);
    float _347 = _105 * _279;
    float _349 = _105 * _285;
    float _351 = _105 * _291;
    float _353 = _105 * _297;
    float _355 = _105 * _303;
    float _357 = _105 * _309;
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _105 * _315;
    float _369 = -_357;
    float _371 = _355 + _369;
    float _373 = fma(_341, _361, _349);
    float _375 = fma(_343, _365, _353);
    float _377 = _105 * _321;
    float _379 = fma(_345, _371, _357);
    float _381 = _105 * _327;
    float _383 = _373 * _367;
    float _385 = _375 * _377;
    float _387 = _379 * _381;
    if (!_245)
    {
        out.m_62.x = _383;
        out.m_62.y = _385;
        out.m_62.z = _387;
        out.m_62.w = _225;
        return out;
    }
    float _389 = in.m_64.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_64.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_64.z;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = _105 * _393;
    float _409 = _105 * _399;
    float _411 = _105 * _405;
    float _413 = _407 * _407;
    float _415 = in.m_66.x;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = fma(_409, _409, _413);
    float _423 = fma(_411, _411, _421);
    float _425 = rsqrt(_423);
    float _427 = _409 * _425;
    float _429 = _407 * _425;
    float _431 = _411 * _425;
    float _433 = _105 * _419;
    float _435 = abs(_427);
    float _437 = abs(_429);
    float _439 = precise::max(_435, _437);
    float _441 = precise::min(_433, 1.0);
    float _443 = abs(_431);
    float _445 = precise::max(_443, _439);
    float _447 = 1.0 / _445;
    float _449 = _427 * _447;
    float _451 = _429 * _447;
    float _453 = -_447;
    float _455 = _431 * _453;
    float3 _1253 = float3(_449, _451, _455);
    float3 _459 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1253, float3(0.0), isnan(_1253)), level(_441)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1253, float3(0.0), isnan(_1253)), level(_441)).xyz;
    float _461 = _459.x;
    float _463 = _459.y;
    float _465 = _459.z;
    float _467 = in.m_68.y;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_68.x;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_70.y;
    float _481 = in.m_70.x;
    float _483 = in.m_68.z;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_59.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_70.z;
    float _497 = in.m_72.x;
    float _499 = in.m_74.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_74.w;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_74.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_76.z;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _525 = fma(_273, (*spvDescriptorSet0.fp_c8)._m0[30].w, _523);
    float _527 = _105 * _471;
    float _529 = _105 * _477;
    float _531 = in.m_78.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = -_479;
    float _539 = _527 + _537;
    float _541 = -_481;
    float _543 = _529 + _541;
    float _545 = _105 * _487;
    float _547 = _497 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _549 = _539 * _539;
    float _551 = _105 * _493;
    float _553 = -_495;
    float _555 = _545 + _553;
    float _557 = in.m_78.y;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = fma(_543, _543, _549);
    float _565 = _551 * _265;
    float _567 = in.m_76.w;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = 1.0 / _525;
    float _575 = fma(_555, _555, _563);
    float _577 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _579 = fma(_565, (*spvDescriptorSet0.fp_c8)._m0[30].w, _577);
    float _581 = in.m_76.y;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = in.m_78.z;
    float _589 = gl_FragCoord.w;
    float _591 = _587 * _589;
    float _593 = -_575;
    float _595 = fma(_547, _547, _593);
    float _597 = _105 * _521;
    float _599 = 1.0 / _579;
    float _601 = in.m_76.x;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = precise::max(0.0, _595);
    float _609 = sqrt(_607);
    float _611 = _105 * _535;
    float _613 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _615 = _599 * _613;
    float _617 = _105 * _509;
    float _619 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _621 = -_615;
    float _623 = fma(_573, _619, _621);
    float _625 = _105 * _561;
    float _627 = _609 + _623;
    float _629 = _105 * _571;
    float _631 = in.m_74.y;
    float _633 = gl_FragCoord.w;
    float _635 = _631 * _633;
    float _637 = _105 * _591;
    float _639 = -_629;
    float _641 = _639 + _627;
    bool _643 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _645 = _105 * _585;
    float _647 = _105 * _503;
    float _649 = _641 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _651 = _105 * _605;
    float _653 = _649 * (-1.44269502162933349609375);
    float _655 = exp2(_653);
    float _657 = _615;
    if (_643)
    {
        float _659 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _661 = _615 + _659;
        _657 = _661;
    }
    float _663 = _657;
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    float _671 = _105 * _635;
    float _673 = _105 * _515;
    if (_643)
    {
        float _675 = _663 * 8.0;
        float _677 = precise::clamp(_675, 0.0, 1.0);
        _253 = _677;
    }
    float _679 = _253;
    float _681 = _233 * _669;
    float _683 = precise::clamp(_681, 0.0, 1.0);
    float _685 = _683;
    if (_643)
    {
        float _687 = _683 * _679;
        _685 = _687;
    }
    float _689 = _685;
    float _691 = 0.0 + _689;
    float _693 = precise::clamp(_691, 0.0, 1.0);
    float _695 = fma(_461, 0.20999999344348907470703125, _651);
    float _697 = fma(_463, 0.20999999344348907470703125, _645);
    float _699 = fma(_465, 0.20999999344348907470703125, _597);
    float _701 = _695 + _611;
    float _703 = _697 + _625;
    float _705 = _699 + _637;
    float _707 = _383 * _701;
    float _709 = _385 * _703;
    float _711 = _387 * _705;
    float _713 = fma(_707, _617, _647);
    float _715 = fma(_709, _617, _671);
    float _717 = fma(_711, _617, _673);
    out.m_62.x = _713;
    out.m_62.y = _715;
    out.m_62.z = _717;
    out.m_62.w = _693;
    return out;
}

