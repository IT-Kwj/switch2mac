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
    float4 m_53 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_49 [[user(locn9), flat]];
    float4 m_70 [[user(locn10), flat]];
    float4 m_55 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
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
    float3 _742 = float3(_118, _124, float(int(_116)));
    float3 _746 = select(_742, float3(0.0), isnan(_742));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _746.xy, uint(rint(_746.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _746.xy, uint(rint(_746.z))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float3 _763 = float3(_118, _124, float(int(_132)));
    float3 _765 = select(_763, float3(0.0), isnan(_763));
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _765.xy, uint(rint(_765.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _765.xy, uint(rint(_765.z))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float _155 = in.m_49.y;
    float _157 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _159 = in.m_51.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _155 * _157;
    float _167 = _165 * _157;
    float _169 = in.m_53.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = floor(_167);
    float _177 = -_175;
    float _179 = fma(_177, (*spvDescriptorSet0.fp_c9)._m0[22].y, _165);
    float _181 = _103 * _163;
    float _183 = _179 + 9.9999997473787516355514526367188e-05;
    float _185 = floor(_183);
    float _187 = _103 * _173;
    float _189 = -_185;
    float _191 = _183 + _189;
    float _193 = -_143;
    float _195 = _193 + _153;
    float _197 = fma(_191, _195, _143);
    float _199 = _197 * _187;
    float _201 = 0.0 + _199;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _203 * _181;
    bool _209 = _205 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _211 = isnan(_205);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _217 = _213 || _215;
    float _219 = in.m_55.w;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    if (!_217)
    {
        discard_fragment();
    }
    float _225 = in.m_55.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_55.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _103 * _223;
    float _239 = 1.0 / _237;
    float _241 = _103 * _229;
    float _243 = _103 * _235;
    float _245 = _241 * _239;
    float _247 = _243 * _239;
    float2 _908 = float2(_247, _245);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_908, float2(0.0), isnan(_908))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_908, float2(0.0), isnan(_908))).x;
    float _251 = in.m_53.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_57.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_53.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_57.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_53.z;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_57.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = -_139;
    float _289 = _287 + _149;
    float _291 = -_137;
    float _293 = _291 + _147;
    float _295 = -_141;
    float _297 = _295 + _151;
    float _299 = fma(_191, _289, _139);
    float _301 = fma(_191, _293, _137);
    float _303 = fma(_191, _297, _141);
    float _305 = _103 * _255;
    float _307 = _103 * _261;
    float _309 = _103 * _267;
    float _311 = _103 * _273;
    float _313 = _103 * _279;
    float _315 = _103 * _285;
    float _317 = -_307;
    float _319 = _305 + _317;
    float _321 = -_311;
    float _323 = _309 + _321;
    float _325 = -_315;
    float _327 = _313 + _325;
    float _329 = fma(_301, _319, _307);
    float _331 = fma(_299, _323, _311);
    float _333 = fma(_303, _327, _315);
    if (!_217)
    {
        out.m_60.x = _329;
        out.m_60.y = _331;
        out.m_60.z = _333;
        out.m_60.w = _199;
        return out;
    }
    float _335 = in.m_62.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_62.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_62.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_64.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _103 * _339;
    float _361 = _103 * _345;
    float _363 = _103 * _351;
    float _365 = _103 * _357;
    float _367 = _359 * _359;
    float _369 = fma(_361, _361, _367);
    float _371 = precise::min(_365, 1.0);
    float _373 = fma(_363, _363, _369);
    float _375 = rsqrt(_373);
    float _377 = _361 * _375;
    float _379 = _359 * _375;
    float _381 = _363 * _375;
    float _383 = abs(_377);
    float _385 = abs(_379);
    float _387 = precise::max(_383, _385);
    float _389 = abs(_381);
    float _391 = precise::max(_389, _387);
    float _393 = 1.0 / _391;
    float _395 = -_393;
    float _397 = _381 * _395;
    float _399 = _377 * _393;
    float _401 = _379 * _393;
    float3 _1135 = float3(_399, _401, _397);
    float3 _405 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1135, float3(0.0), isnan(_1135)), level(_371)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1135, float3(0.0), isnan(_1135)), level(_371)).xyz;
    float _407 = _405.x;
    float _409 = _405.y;
    float _411 = _405.z;
    float _413 = in.m_66.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_66.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_68.y;
    float _427 = in.m_68.x;
    float _429 = in.m_66.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_55.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_68.z;
    float _443 = in.m_70.x;
    float _445 = in.m_72.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_72.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_74.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_74.w;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _471 = fma(_249, (*spvDescriptorSet0.fp_c8)._m0[30].w, _469);
    float _473 = 1.0 / _471;
    float _475 = _103 * _417;
    float _477 = _103 * _423;
    float _479 = in.m_76.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = -_425;
    float _487 = _475 + _485;
    float _489 = -_427;
    float _491 = _477 + _489;
    float _493 = _103 * _433;
    float _495 = _103 * _439;
    float _497 = _487 * _487;
    float _499 = _443 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _501 = -_441;
    float _503 = _493 + _501;
    float _505 = _495 * _239;
    float _507 = fma(_491, _491, _497);
    float _509 = in.m_76.w;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_76.x;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _523 = fma(_505, (*spvDescriptorSet0.fp_c8)._m0[30].w, _521);
    float _525 = fma(_503, _503, _507);
    float _527 = in.m_76.y;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_72.x;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = 1.0 / _523;
    float _541 = -_525;
    float _543 = fma(_499, _499, _541);
    float _545 = _103 * _455;
    float _547 = precise::max(0.0, _543);
    bool _549 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _551 = _103 * _461;
    float _553 = sqrt(_547);
    float _555 = _103 * _483;
    float _557 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _559 = _539 * _557;
    float _561 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _563 = -_559;
    float _565 = fma(_473, _561, _563);
    float _567 = _559;
    if (_549)
    {
        float _569 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _571 = _559 + _569;
        _567 = _571;
    }
    float _573 = _567;
    float _575 = _573;
    if (_549)
    {
        float _577 = _573 * 8.0;
        float _579 = precise::clamp(_577, 0.0, 1.0);
        _575 = _579;
    }
    float _581 = _575;
    float _583 = _103 * _519;
    float _585 = _553 + _565;
    float _587 = _103 * _513;
    float _589 = in.m_74.y;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_74.z;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = _103 * _531;
    float _603 = -_587;
    float _605 = _603 + _585;
    float _607 = _103 * _537;
    float _609 = _103 * _449;
    float _611 = _103 * _467;
    float _613 = _605 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _615 = _613 * (-1.44269502162933349609375);
    float _617 = exp2(_615);
    float _619 = _103 * _593;
    float _621 = -_617;
    float _623 = _621 + 1.0;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    float _627 = _103 * _599;
    float _629 = _205 * _625;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    float _633 = _631;
    if (_549)
    {
        float _635 = _631 * _581;
        _633 = _635;
    }
    float _637 = _633;
    float _639 = 0.0 + _637;
    float _641 = precise::clamp(_639, 0.0, 1.0);
    float _643 = fma(_407, 0.20999999344348907470703125, _583);
    float _645 = fma(_409, 0.20999999344348907470703125, _601);
    float _647 = fma(_411, 0.20999999344348907470703125, _555);
    float _649 = _643 + _607;
    float _651 = _645 + _609;
    float _653 = _647 + _545;
    float _655 = _329 * _649;
    float _657 = _331 * _651;
    float _659 = _333 * _653;
    float _661 = fma(_655, _611, _551);
    float _663 = fma(_657, _611, _619);
    float _665 = fma(_659, _611, _627);
    out.m_60.x = _661;
    out.m_60.y = _663;
    out.m_60.z = _665;
    out.m_60.w = _641;
    return out;
}

