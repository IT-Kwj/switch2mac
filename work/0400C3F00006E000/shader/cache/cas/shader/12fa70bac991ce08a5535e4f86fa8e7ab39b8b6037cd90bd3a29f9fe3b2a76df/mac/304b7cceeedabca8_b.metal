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
    float2 _744 = float2(_152, _156);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_744, float2(0.0), isnan(_744))).x;
    float3 _757 = float3(_132, _154, float(int(_126)));
    float3 _761 = select(_757, float3(0.0), isnan(_757));
    float4 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _761.xy, uint(rint(_761.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _761.xy, uint(rint(_761.z))).xyzw;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    float3 _778 = float3(_132, _154, float(int(_150)));
    float3 _780 = select(_778, float3(0.0), isnan(_778));
    float4 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _780.xy, uint(rint(_780.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _780.xy, uint(rint(_780.z))).xyzw;
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
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _245 = _233 * _243;
    float _247 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _249 = in.m_55.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_55.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_51.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_51.z;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = _113 * _271;
    float _275 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _277 = fma(_158, (*spvDescriptorSet0.fp_c8)._m0[30].w, _275);
    float _279 = 1.0 / _277;
    float _281 = -_169;
    float _283 = _281 + _179;
    float _285 = fma(_241, _283, _169);
    float _287 = _113 * _195;
    float _289 = _285 * _287;
    float _291 = _113 * _201;
    float _293 = _291 * _289;
    float _295 = _113 * _207;
    float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _299 = -_245;
    float _301 = fma(_279, _297, _299);
    float _303 = _113 * _213;
    float _305 = _295 * _293;
    float _307 = _301 * _247;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = 0.0 + _305;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = _313 * _309;
    float _317 = _315 * _303;
    bool _321 = _317 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _323 = isnan(_317);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _329 = _325 || _327;
    float _331 = in.m_53.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_53.y;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_55.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_53.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = _113;
    if (!_329)
    {
        discard_fragment();
    }
    float _357 = in.m_51.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = -_163;
    float _365 = _363 + _173;
    float _367 = -_165;
    float _369 = _367 + _175;
    float _371 = -_167;
    float _373 = _371 + _177;
    float _375 = fma(_241, _365, _163);
    float _377 = fma(_241, _369, _165);
    float _379 = fma(_241, _373, _167);
    float _381 = _113 * _335;
    float _383 = _113 * _341;
    float _385 = _113 * _347;
    float _387 = _113 * _253;
    float _389 = _113 * _353;
    float _391 = _113 * _259;
    float _393 = -_385;
    float _395 = _381 + _393;
    float _397 = -_387;
    float _399 = _383 + _397;
    float _401 = -_391;
    float _403 = _389 + _401;
    float _405 = fma(_375, _395, _385);
    float _407 = fma(_377, _399, _387);
    float _409 = _113 * _265;
    float _411 = fma(_379, _403, _391);
    float _413 = _405 * _409;
    float _415 = _113 * _361;
    float _417 = _411 * _273;
    float _419 = _407 * _415;
    if (!_329)
    {
        out.m_60.x = _413;
        out.m_60.y = _419;
        out.m_60.z = _417;
        out.m_60.w = _305;
        return out;
    }
    float _421 = in.m_62.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_62.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_62.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = _113 * _425;
    float _441 = _113 * _431;
    float _443 = _113 * _437;
    float _445 = _439 * _439;
    float _447 = in.m_64.x;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = fma(_441, _441, _445);
    float _455 = fma(_443, _443, _453);
    float _457 = rsqrt(_455);
    float _459 = _441 * _457;
    float _461 = _439 * _457;
    float _463 = _443 * _457;
    float _465 = _113 * _451;
    float _467 = abs(_459);
    float _469 = abs(_461);
    float _471 = precise::max(_467, _469);
    float _473 = precise::min(_465, 1.0);
    float _475 = abs(_463);
    float _477 = precise::max(_475, _471);
    float _479 = 1.0 / _477;
    float _481 = _459 * _479;
    float _483 = _461 * _479;
    float _485 = -_479;
    float _487 = _463 * _485;
    float3 _1228 = float3(_481, _483, _487);
    float3 _491 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1228, float3(0.0), isnan(_1228)), level(_473)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1228, float3(0.0), isnan(_1228)), level(_473)).xyz;
    float _493 = _491.x;
    float _495 = _491.y;
    float _497 = _491.z;
    float _499 = in.m_66.x;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_66.z;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_66.y;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = in.m_68.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_68.y;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_68.z;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_70.x;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_70.y;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_70.z;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_70.w;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    bool _559 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _561 = _113 * _503;
    float _563 = _113 * _515;
    float _565 = _113 * _521;
    float _567 = _113 * _527;
    float _569 = _113 * _533;
    float _571 = _113 * _545;
    float _573 = _113 * _551;
    float _575 = _113 * _557;
    float _577 = fma(_493, 0.20999999344348907470703125, _561);
    float _579 = _113 * _509;
    float _581 = _113 * _539;
    float _583 = fma(_495, 0.20999999344348907470703125, _563);
    if (_559)
    {
        float _585 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _587 = _245 + _585;
        _355 = _587;
    }
    float _589 = _355;
    float _591 = fma(_497, 0.20999999344348907470703125, _579);
    float _593 = _577 + _565;
    float _595 = _583 + _567;
    float _597 = _589;
    if (_559)
    {
        float _599 = _589 * 8.0;
        float _601 = precise::clamp(_599, 0.0, 1.0);
        _597 = _601;
    }
    float _603 = _597;
    float _605 = _591 + _569;
    float _607 = 0.0 + _317;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    float _611 = _413 * _593;
    float _613 = _419 * _595;
    float _615 = _417 * _605;
    float _617 = _609;
    if (_559)
    {
        float _619 = _609 * _603;
        _617 = _619;
    }
    float _621 = _617;
    float _623 = fma(_611, _575, _581);
    float _625 = fma(_613, _575, _571);
    float _627 = fma(_615, _575, _573);
    float _629 = 0.0 + _621;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    out.m_60.x = _623;
    out.m_60.y = _625;
    out.m_60.z = _627;
    out.m_60.w = _631;
    return out;
}

