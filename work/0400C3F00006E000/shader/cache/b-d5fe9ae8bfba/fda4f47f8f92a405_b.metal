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
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_60 [[user(locn3), flat]];
    float4 m_64 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_39 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_47 [[user(locn11)]];
    float4 m_45 [[user(locn12)]];
    float4 m_62 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float2 _712 = float2(_89, _91);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_712, float2(0.0), isnan(_712))).xzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = in.m_41.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_43.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_45.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _87 * _107;
    float _123 = _87 * _113;
    float _125 = in.m_39.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_47.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = -_121;
    float _151 = _97 + _149;
    float _153 = _151 * _123;
    float _155 = _87 * _119;
    float _157 = 0.0 + _153;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _159 * _155;
    bool _165 = _161 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _167 = isnan(_161);
    bool _169 = _165 || _167;
    bool _171 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _173 = _169 || _171;
    float _175 = in.m_39.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    if (!_173)
    {
        discard_fragment();
    }
    float _181 = _87 * _135;
    float _183 = _87 * _141;
    float _185 = _87 * _147;
    float _187 = 1.0 / _181;
    float _189 = _87 * _179;
    float _191 = _87 * _129;
    float2 _849 = float2(_189, _191);
    float2 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_849, float2(0.0), isnan(_849))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_849, float2(0.0), isnan(_849))).xy;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _183 * _187;
    float _203 = _185 * _187;
    float2 _867 = float2(_201, _203);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_867, float2(0.0), isnan(_867))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_867, float2(0.0), isnan(_867))).x;
    float _207 = in.m_49.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_49.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_49.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_41.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_43.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_51.y;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_53.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_51.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_43.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_41.y;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_41.z;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_43.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_53.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = -_99;
    float _287 = _285 + 1.0;
    float _289 = precise::max(_287, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _291 = precise::min(_289, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _293 = _87 * _211;
    float _295 = _87 * _217;
    float _297 = in.m_51.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _87 * _223;
    float _305 = _293 * _293;
    float _307 = in.m_53.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _87 * _235;
    float _315 = _87 * _247;
    float _317 = fma(_295, _295, _305);
    float _319 = _87 * _229;
    float _321 = _87 * _241;
    float _323 = _315 * _315;
    float _325 = fma(_303, _303, _317);
    float _327 = -_313;
    float _329 = _319 + _327;
    float _331 = _321 * _321;
    float _333 = _87 * _259;
    float _335 = _87 * _265;
    float _337 = _87 * _271;
    float _339 = rsqrt(_325);
    float _341 = _87 * _283;
    float _343 = -_333;
    float _345 = _335 + _343;
    float _347 = fma(_101, _345, _333);
    float _349 = _295 * _339;
    float _351 = _293 * _339;
    float _353 = _303 * _339;
    float _355 = fma(_101, _329, _313);
    float _357 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _359 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _357;
    float _361 = _87 * _301;
    float _363 = _87 * _311;
    float _365 = _87 * _253;
    float _367 = fma(_361, _361, _331);
    float _369 = fma(_363, _363, _323);
    float _371 = 1.0 / _359;
    float _373 = _351 * _351;
    float _375 = fma(_365, _365, _367);
    float _377 = _87 * _277;
    float _379 = fma(_341, _341, _369);
    float _381 = fma(_349, _349, _373);
    float _383 = -_377;
    float _385 = _337 + _383;
    float _387 = rsqrt(_375);
    float _389 = fma(_353, _353, _381);
    float _391 = fma(_101, _385, _377);
    float _393 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _395 = _291 + _393;
    float _397 = rsqrt(_379);
    float _399 = _395 * _371;
    float _401 = rsqrt(_389);
    float _403 = _341 * _397;
    float _405 = _199 * _199;
    float _407 = _199 * _397;
    float _409 = fma(_197, _197, _405);
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = _197 * _387;
    float _415 = -_411;
    float _417 = _415 + 1.0;
    float _419 = sqrt(_417);
    if (!_173)
    {
        out.m_56.x = 0.0;
        out.m_56.y = 0.0;
        out.m_56.z = 0.0;
        out.m_56.w = _153;
        return out;
    }
    float _421 = in.m_58.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = _315 * _407;
    float _429 = in.m_58.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_60.y;
    float _437 = _363 * _407;
    float _439 = fma(_321, _413, _427);
    float _441 = in.m_60.x;
    float _443 = in.m_58.z;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = _199 * _403;
    float _451 = _401 * _419;
    float _453 = in.m_47.z;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_60.z;
    float _461 = fma(_361, _413, _437);
    float _463 = fma(_351, _451, _439);
    float _465 = fma(_365, _413, _449);
    float _467 = in.m_62.x;
    float _469 = fma(_349, _451, _461);
    float _471 = _463 * _463;
    float _473 = fma(_353, _451, _465);
    float _475 = fma(_469, _469, _471);
    float _477 = in.m_64.w;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = fma(_473, _473, _475);
    float _485 = _87 * _425;
    float _487 = rsqrt(_483);
    float _489 = _87 * _433;
    float _491 = -_435;
    float _493 = _485 + _491;
    float _495 = -_441;
    float _497 = _489 + _495;
    float _499 = _87 * _447;
    float _501 = _493 * _493;
    float _503 = _87 * _457;
    float _505 = -_459;
    float _507 = _499 + _505;
    float _509 = fma(_497, _497, _501);
    float _511 = _503 * _187;
    float _513 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _515 = fma(_205, (*spvDescriptorSet0.fp_c8)._m0[30].w, _513);
    float _517 = fma(_507, _507, _509);
    float _519 = _467 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _521 = _463 * _487;
    float _523 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _525 = fma(_511, (*spvDescriptorSet0.fp_c8)._m0[30].w, _523);
    float _527 = _473 * _487;
    float _529 = -_517;
    float _531 = fma(_519, _519, _529);
    float _533 = _521 * (-0.816474258899688720703125);
    float _535 = 1.0 / _525;
    float _537 = _87 * _481;
    float _539 = -_533;
    float _541 = fma(_527, 0.577381789684295654296875, _539);
    float _543 = precise::max(0.0, _531);
    float _545 = in.m_66.y;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = in.m_66.z;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = fma(_541, 0.5, 0.5);
    float _559 = precise::clamp(_557, 0.0, 1.0);
    float _561 = 1.0 / _515;
    float _563 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _565 = _563 + (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _567 = in.m_66.w;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = fma(_559, _565, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _575 = sqrt(_543);
    float _577 = _573 * _399;
    float _579 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _581 = _535 * _579;
    float _583 = _347 * _577;
    float _585 = _355 * _577;
    float _587 = _391 * _577;
    float _589 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _591 = -_581;
    float _593 = fma(_561, _589, _591);
    float _595 = _583 * 0.715200006961822509765625;
    float _597 = fma(_585, 0.2125999927520751953125, _595);
    float _599 = _575 + _593;
    float _601 = fma(_587, 0.072200000286102294921875, _597);
    float _603 = -_537;
    float _605 = _599 + _603;
    float _607 = in.m_66.x;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = 1.0 / _601;
    float _615 = _605 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _617 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _619 = _87 * _571;
    float _621 = _615 * (-1.44269502162933349609375);
    float _623 = exp2(_621);
    float _625 = _613 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    float _629 = fma(_627, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _631 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_617)
    {
        float _633 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _635 = _581 + _633;
        _631 = _635;
    }
    float _637 = _631;
    float _639 = _629 * _619;
    float _641 = _87 * _549;
    float _643 = _87 * _555;
    float _645 = -_623;
    float _647 = _645 + 1.0;
    float _649 = precise::clamp(_647, 0.0, 1.0);
    float _651 = _623;
    if (_617)
    {
        float _653 = _637 * 8.0;
        float _655 = precise::clamp(_653, 0.0, 1.0);
        _651 = _655;
    }
    float _657 = _651;
    float _659 = fma(_583, _639, _641);
    float _661 = fma(_587, _639, _643);
    float _663 = _161 * _649;
    float _665 = precise::clamp(_663, 0.0, 1.0);
    float _667 = _87 * _611;
    float _669 = _665;
    if (_617)
    {
        float _671 = _665 * _657;
        _669 = _671;
    }
    float _673 = _669;
    float _675 = fma(_585, _639, _667);
    float _677 = 0.0 + _673;
    float _679 = precise::clamp(_677, 0.0, 1.0);
    out.m_56.x = _675;
    out.m_56.y = _659;
    out.m_56.z = _661;
    out.m_56.w = _679;
    return out;
}

