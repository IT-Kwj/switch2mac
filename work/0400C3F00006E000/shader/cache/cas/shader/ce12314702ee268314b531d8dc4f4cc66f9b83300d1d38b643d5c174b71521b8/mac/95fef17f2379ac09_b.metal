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
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_45 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_43 [[user(locn8), flat]];
    float4 m_62 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_64 [[user(locn11)]];
    float4 m_70 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_43.x;
    float _81 = in.m_45.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _89 = in.m_45.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_47.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_45.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_47.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = 1.0 / _77;
    float _115 = _79 + 1.0;
    float _117 = _115 * _87;
    float _119 = rint(_79);
    float _121 = precise::max(_119, 0.0);
    uint _124 = uint(_121);
    uint _126 = clamp(_124, 0u, 65535u);
    float _128 = floor(_117);
    float _130 = _113 * _85;
    float _132 = _113 * _99;
    float _134 = 1.0 / _130;
    float _136 = -_128;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c9)._m0[22].x, _115);
    float _140 = _113 * _93;
    float _142 = _113 * _105;
    float _144 = rint(_138);
    float _146 = precise::max(_144, 0.0);
    uint _148 = uint(_146);
    uint _150 = clamp(_148, 0u, 65535u);
    float _152 = _140 * _134;
    float _154 = _113 * _111;
    float _156 = _142 * _134;
    float2 _750 = float2(_152, _156);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_750, float2(0.0), isnan(_750))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_750, float2(0.0), isnan(_750))).x;
    float3 _763 = float3(_132, _154, float(int(_126)));
    float3 _767 = select(_763, float3(0.0), isnan(_763));
    float4 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _767.xy, uint(rint(_767.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _767.xy, uint(rint(_767.z))).xyzw;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    float3 _784 = float3(_132, _154, float(int(_150)));
    float3 _786 = select(_784, float3(0.0), isnan(_784));
    float4 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _786.xy, uint(rint(_786.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _786.xy, uint(rint(_786.z))).xyzw;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = _171.w;
    float _181 = in.m_49.y;
    float _183 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _185 = in.m_45.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_51.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_53.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_55.w;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_57.x;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _181 * _183;
    float _217 = _215 * _183;
    float _219 = floor(_217);
    float _221 = _113 * _189;
    float _223 = _221 * _134;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _227 = fma(_223, (*spvDescriptorSet0.fp_c8)._m0[30].w, _225);
    float _229 = -_219;
    float _231 = fma(_229, (*spvDescriptorSet0.fp_c9)._m0[22].y, _215);
    float _233 = 1.0 / _227;
    float _235 = _231 + 9.9999997473787516355514526367188e-05;
    float _237 = floor(_235);
    float _239 = -_237;
    float _241 = _235 + _239;
    float _243 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _245 = in.m_55.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_55.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_55.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _265 = fma(_158, (*spvDescriptorSet0.fp_c8)._m0[30].w, _263);
    float _267 = 1.0 / _265;
    float _269 = -_169;
    float _271 = _269 + _179;
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _275 = _233 * _273;
    float _277 = fma(_241, _271, _169);
    float _279 = _113 * _195;
    float _281 = _277 * _279;
    float _283 = _113 * _201;
    float _285 = _283 * _281;
    float _287 = _113 * _207;
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _291 = -_275;
    float _293 = fma(_267, _289, _291);
    float _295 = _113 * _213;
    float _297 = _287 * _285;
    float _299 = _293 * _243;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = 0.0 + _297;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _305 * _301;
    float _309 = _307 * _295;
    bool _313 = _309 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _315 = isnan(_309);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _321 = _317 || _319;
    float _323 = in.m_53.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_53.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_53.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _113;
    if (!_321)
    {
        discard_fragment();
    }
    float _343 = in.m_51.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_51.y;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_51.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = -_163;
    float _363 = _361 + _173;
    float _365 = -_165;
    float _367 = _365 + _175;
    float _369 = -_167;
    float _371 = _369 + _177;
    float _373 = fma(_241, _363, _163);
    float _375 = fma(_241, _367, _165);
    float _377 = fma(_241, _371, _167);
    float _379 = _373 * _373;
    float _381 = _375 * _375;
    float _383 = _377 * _377;
    float _385 = _113 * _327;
    float _387 = _113 * _249;
    float _389 = _113 * _333;
    float _391 = _113 * _339;
    float _393 = _113 * _255;
    float _395 = _113 * _261;
    float _397 = -_387;
    float _399 = _385 + _397;
    float _401 = -_393;
    float _403 = _389 + _401;
    float _405 = -_395;
    float _407 = _391 + _405;
    float _409 = fma(_379, _399, _387);
    float _411 = fma(_381, _403, _393);
    float _413 = fma(_383, _407, _395);
    float _415 = _113 * _347;
    float _417 = _113 * _353;
    float _419 = _113 * _359;
    float _421 = _409 * _415;
    float _423 = _411 * _417;
    float _425 = _413 * _419;
    if (!_321)
    {
        out.m_60.x = _421;
        out.m_60.y = _423;
        out.m_60.z = _425;
        out.m_60.w = _297;
        return out;
    }
    float _427 = in.m_62.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_62.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_62.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _113 * _431;
    float _447 = _113 * _437;
    float _449 = _113 * _443;
    float _451 = _445 * _445;
    float _453 = in.m_64.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = fma(_447, _447, _451);
    float _461 = fma(_449, _449, _459);
    float _463 = rsqrt(_461);
    float _465 = _447 * _463;
    float _467 = _445 * _463;
    float _469 = _449 * _463;
    float _471 = _113 * _457;
    float _473 = abs(_465);
    float _475 = abs(_467);
    float _477 = precise::max(_473, _475);
    float _479 = precise::min(_471, 1.0);
    float _481 = abs(_469);
    float _483 = precise::max(_481, _477);
    float _485 = 1.0 / _483;
    float _487 = _465 * _485;
    float _489 = _467 * _485;
    float _491 = -_485;
    float _493 = _469 * _491;
    float3 _1243 = float3(_487, _489, _493);
    float3 _497 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1243, float3(0.0), isnan(_1243)), level(_479)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1243, float3(0.0), isnan(_1243)), level(_479)).xyz;
    float _499 = _497.x;
    float _501 = _497.y;
    float _503 = _497.z;
    float _505 = in.m_66.x;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_66.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_66.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_68.x;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_68.y;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_68.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_70.x;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_70.y;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_70.z;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_70.w;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    bool _565 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _567 = _113 * _509;
    float _569 = _113 * _521;
    float _571 = _113 * _527;
    float _573 = _113 * _533;
    float _575 = _113 * _539;
    float _577 = _113 * _551;
    float _579 = _113 * _557;
    float _581 = _113 * _563;
    float _583 = fma(_499, 0.20999999344348907470703125, _567);
    float _585 = _113 * _515;
    float _587 = _113 * _545;
    float _589 = fma(_501, 0.20999999344348907470703125, _569);
    if (_565)
    {
        float _591 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _593 = _275 + _591;
        _341 = _593;
    }
    float _595 = _341;
    float _597 = fma(_503, 0.20999999344348907470703125, _585);
    float _599 = _583 + _571;
    float _601 = _589 + _573;
    float _603 = _595;
    if (_565)
    {
        float _605 = _595 * 8.0;
        float _607 = precise::clamp(_605, 0.0, 1.0);
        _603 = _607;
    }
    float _609 = _603;
    float _611 = _597 + _575;
    float _613 = 0.0 + _309;
    float _615 = precise::clamp(_613, 0.0, 1.0);
    float _617 = _421 * _599;
    float _619 = _423 * _601;
    float _621 = _425 * _611;
    float _623 = _615;
    if (_565)
    {
        float _625 = _615 * _609;
        _623 = _625;
    }
    float _627 = _623;
    float _629 = fma(_617, _581, _587);
    float _631 = fma(_619, _581, _577);
    float _633 = fma(_621, _581, _579);
    float _635 = 0.0 + _627;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    out.m_60.x = _629;
    out.m_60.y = _631;
    out.m_60.z = _633;
    out.m_60.w = _637;
    return out;
}

