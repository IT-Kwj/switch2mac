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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_45 [[user(locn3), flat]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_51 [[user(locn9), flat]];
    float4 m_72 [[user(locn10), flat]];
    float4 m_59 [[user(locn11)]];
    float4 m_57 [[user(locn12)]];
    float4 m_78 [[user(locn13)]];
    float4 m_70 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _85 = in.m_45.x;
    float _87 = gl_FragCoord.w;
    float _89 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _91 = in.m_49.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_49.y;
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
    float3 _796 = float3(_120, _126, float(int(_118)));
    float3 _800 = select(_796, float3(0.0), isnan(_796));
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _800.xy, uint(rint(_800.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _800.xy, uint(rint(_800.z))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float3 _817 = float3(_120, _126, float(int(_134)));
    float3 _819 = select(_817, float3(0.0), isnan(_817));
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _819.xy, uint(rint(_819.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _819.xy, uint(rint(_819.z))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float _157 = in.m_51.y;
    float _159 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _161 = in.m_53.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_55.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_57.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _157 * _159;
    float _181 = _105 * _165;
    float _183 = _179 * _159;
    float _185 = _105 * _177;
    float _187 = floor(_183);
    float _189 = -_187;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c9)._m0[22].y, _179);
    float _193 = _105 * _171;
    float _195 = _191 + 9.9999997473787516355514526367188e-05;
    float _197 = floor(_195);
    float _199 = -_197;
    float _201 = _195 + _199;
    float _203 = in.m_59.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _105 * _207;
    float _211 = -_145;
    float _213 = _211 + _155;
    float _215 = fma(_201, _213, _145);
    float _217 = _215 * _181;
    float _219 = _193 * _217;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _221 * _185;
    bool _227 = _223 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _229 = isnan(_223);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _235 = _231 || _233;
    float _237 = in.m_59.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    if (!_235)
    {
        discard_fragment();
    }
    float _243 = in.m_59.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = _105 * _241;
    float _251 = 1.0 / _249;
    float _253 = _105 * _247;
    float _255 = _209 * _251;
    float _257 = _253 * _251;
    float2 _973 = float2(_255, _257);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_973, float2(0.0), isnan(_973))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_973, float2(0.0), isnan(_973))).x;
    float _261 = in.m_55.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_55.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_55.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_53.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_53.y;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_53.z;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = -_141;
    float _299 = _297 + _151;
    float _301 = -_139;
    float _303 = _301 + _149;
    float _305 = -_143;
    float _307 = _305 + _153;
    float _309 = fma(_201, _299, _141);
    float _311 = fma(_201, _303, _139);
    float _313 = fma(_201, _307, _143);
    float _315 = -_309;
    float _317 = _315 + 1.0;
    float _319 = _105 * _265;
    float _321 = _105 * _271;
    float _323 = _105 * _277;
    float _325 = -_311;
    float _327 = _325 + 1.0;
    float _329 = -_313;
    float _331 = _329 + 1.0;
    float _333 = _321 * _317;
    float _335 = _105 * _283;
    float _337 = _319 * _327;
    float _339 = _323 * _331;
    float _341 = _105 * _289;
    float _343 = _105 * _295;
    float _345 = fma(_311, _335, _337);
    float _347 = fma(_309, _341, _333);
    float _349 = fma(_313, _343, _339);
    if (!_235)
    {
        out.m_62.x = _345;
        out.m_62.y = _347;
        out.m_62.z = _349;
        out.m_62.w = _221;
        return out;
    }
    float _351 = in.m_64.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_64.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_64.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = _105 * _355;
    float _371 = _105 * _361;
    float _373 = _105 * _367;
    float _375 = _369 * _369;
    float _377 = in.m_66.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_373, _373, _383);
    float _387 = rsqrt(_385);
    float _389 = _371 * _387;
    float _391 = _369 * _387;
    float _393 = _373 * _387;
    float _395 = _105 * _381;
    float _397 = abs(_389);
    float _399 = abs(_391);
    float _401 = precise::max(_397, _399);
    float _403 = precise::min(_395, 1.0);
    float _405 = abs(_393);
    float _407 = precise::max(_405, _401);
    float _409 = 1.0 / _407;
    float _411 = -_409;
    float _413 = _393 * _411;
    float _415 = _389 * _409;
    float _417 = _391 * _409;
    float3 _1206 = float3(_415, _417, _413);
    float3 _421 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1206, float3(0.0), isnan(_1206)), level(_403)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1206, float3(0.0), isnan(_1206)), level(_403)).xyz;
    float _423 = _421.x;
    float _425 = _421.y;
    float _427 = _421.z;
    float _429 = in.m_68.y;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_68.x;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_70.y;
    float _443 = in.m_70.x;
    float _445 = in.m_68.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_59.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_70.z;
    float _459 = in.m_72.x;
    float _461 = in.m_74.w;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_74.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_74.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_74.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_76.x;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_76.z;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = _105 * _433;
    float _499 = _105 * _439;
    float _501 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _503 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[30].w, _501);
    float _505 = -_441;
    float _507 = _497 + _505;
    float _509 = -_443;
    float _511 = _499 + _509;
    float _513 = _105 * _449;
    float _515 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _517 = _497 + _515;
    float _519 = _507 * _507;
    float _521 = _105 * _455;
    float _523 = -_457;
    float _525 = _513 + _523;
    float _527 = _459 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _529 = fma(_511, _511, _519);
    float _531 = _521 * _251;
    float _533 = 1.0 / _517;
    float _535 = in.m_76.y;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = fma(_525, _525, _529);
    float _543 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _545 = fma(_531, (*spvDescriptorSet0.fp_c8)._m0[30].w, _543);
    float _547 = in.m_78.x;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_78.y;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = -_541;
    float _561 = fma(_527, _527, _559);
    float _563 = 1.0 / _503;
    float _565 = _105 * _477;
    float _567 = _105 * _483;
    float _569 = precise::max(0.0, _561);
    bool _571 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _573 = _105 * _489;
    float _575 = 1.0 / _545;
    float _577 = _533 * _533;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = _579 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _583 = sqrt(_569);
    float _585 = _581 * (*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _587 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _589 = _575 * _587;
    float _591 = _581 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _593 = _581 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _595 = _105 * _539;
    float _597 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _599 = -_589;
    float _601 = fma(_563, _597, _599);
    float _603 = _591 * 0.715200006961822509765625;
    float _605 = _105 * _495;
    float _607 = _583 + _601;
    float _609 = fma(_585, 0.2125999927520751953125, _603);
    float _611 = _105 * _465;
    float _613 = in.m_78.w;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = fma(_593, 0.072200000286102294921875, _609);
    float _621 = -_611;
    float _623 = _621 + _607;
    float _625 = in.m_78.z;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = _105 * _471;
    float _633 = _623 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _635 = 1.0 / _619;
    float _637 = _633 * (-1.44269502162933349609375);
    float _639 = exp2(_637);
    float _641 = _635 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _643 = precise::clamp(_641, 0.0, 1.0);
    float _645 = _105 * _557;
    float _647 = fma(_643, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _649 = _105 * _551;
    float _651 = _105 * _617;
    float _653 = -_639;
    float _655 = _653 + 1.0;
    float _657 = precise::clamp(_655, 0.0, 1.0);
    float _659 = _105 * _629;
    float _661 = _585 * _647;
    float _663 = _591 * _647;
    float _665 = _593 * _647;
    float _667 = _223 * _657;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    float _671 = fma(_423, 0.20999999344348907470703125, _631);
    float _673 = fma(_425, 0.20999999344348907470703125, _565);
    float _675 = fma(_427, 0.20999999344348907470703125, _567);
    float _677 = _423;
    float _679 = _669;
    if (_571)
    {
        float _681 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _683 = _589 + _681;
        _677 = _683;
    }
    float _685 = _677;
    float _687 = _671 + _573;
    float _689 = _673 + _595;
    float _691 = _675 + _605;
    float _693 = _685;
    if (_571)
    {
        float _695 = _685 * 8.0;
        float _697 = precise::clamp(_695, 0.0, 1.0);
        _693 = _697;
    }
    float _699 = _693;
    float _701 = fma(_345, _687, _661);
    float _703 = fma(_347, _689, _663);
    float _705 = fma(_349, _691, _665);
    if (_571)
    {
        float _707 = _669 * _699;
        _679 = _707;
    }
    float _709 = _679;
    float _711 = fma(_701, _651, _649);
    float _713 = fma(_703, _651, _645);
    float _715 = fma(_705, _651, _659);
    float _717 = 0.0 + _709;
    float _719 = precise::clamp(_717, 0.0, 1.0);
    out.m_62.x = _711;
    out.m_62.y = _713;
    out.m_62.z = _715;
    out.m_62.w = _719;
    return out;
}

