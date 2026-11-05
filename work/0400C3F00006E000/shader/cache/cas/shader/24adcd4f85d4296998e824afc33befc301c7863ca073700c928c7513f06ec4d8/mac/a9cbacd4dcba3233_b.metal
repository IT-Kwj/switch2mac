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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_66 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_55 [[user(locn4), flat]];
    float4 m_49 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_53 [[user(locn9), flat]];
    float4 m_47 [[user(locn10), flat]];
    float4 m_68 [[user(locn11)]];
    float4 m_74 [[user(locn12)]];
    float4 m_70 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = gl_FragCoord.w;
    float _85 = in.m_45.z;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_45.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _83;
    float _99 = _97 * _89;
    float _101 = _97 * _95;
    float2 _698 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_698, float2(0.0), isnan(_698))).w;
    float _105 = in.m_47.x;
    float _107 = in.m_49.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _115 = in.m_51.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_49.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_49.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_45.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_53.x;
    float _141 = in.m_45.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _105 + 1.0;
    float _149 = _97 * _111;
    float _151 = rint(_105);
    float _153 = precise::max(_151, 0.0);
    uint _156 = uint(_153);
    uint _158 = clamp(_156, 0u, 65535u);
    float _160 = _97 * _119;
    float _162 = _147 * _113;
    float _164 = floor(_162);
    float _166 = 1.0 / _149;
    float _168 = _97 * _131;
    float _170 = -_164;
    float _172 = fma(_170, (*spvDescriptorSet0.fp_c9)._m0[22].x, _147);
    float _174 = -_160;
    float _176 = _174 + 1.0;
    float _178 = _97 * _125;
    float _180 = _97 * _137;
    float _182 = _178 * _166;
    float _184 = _168 * _166;
    float2 _814 = float2(_182, _184);
    float _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_814, float2(0.0), isnan(_814))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_814, float2(0.0), isnan(_814))).x;
    float _188 = fma(_103, 2.0, -1.0);
    float _190 = rint(_172);
    float _192 = precise::max(_190, 0.0);
    uint _194 = uint(_192);
    uint _196 = clamp(_194, 0u, 65535u);
    float _198 = _188 * _176;
    float _200 = _97 * _145;
    float _202 = fma(_139, _198, _180);
    float _204 = _139 * 0.5;
    float _206 = fma(_204, _198, _200);
    float3 _854 = float3(_202, _206, float(int(_158)));
    float3 _858 = select(_854, float3(0.0), isnan(_854));
    float4 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _858.xy, uint(rint(_858.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _858.xy, uint(rint(_858.z))).xyzw;
    float _211 = _209.x;
    float _213 = _209.y;
    float _215 = _209.z;
    float _217 = _209.w;
    float3 _875 = float3(_202, _206, float(int(_196)));
    float3 _877 = select(_875, float3(0.0), isnan(_875));
    float4 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _877.xy, uint(rint(_877.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _877.xy, uint(rint(_877.z))).xyzw;
    float _221 = _219.x;
    float _223 = _219.y;
    float _225 = _219.z;
    float _227 = _219.w;
    float _229 = in.m_55.y;
    float _231 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _233 = in.m_49.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_57.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_59.w;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_61.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = _229 * _231;
    float _259 = _257 * _231;
    float _261 = floor(_259);
    float _263 = _97 * _237;
    float _265 = _263 * _166;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _269 = fma(_265, (*spvDescriptorSet0.fp_c8)._m0[30].w, _267);
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _273 = fma(_186, (*spvDescriptorSet0.fp_c8)._m0[30].w, _271);
    float _275 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _277 = -_261;
    float _279 = fma(_277, (*spvDescriptorSet0.fp_c9)._m0[22].y, _257);
    float _281 = _279 + 9.9999997473787516355514526367188e-05;
    float _283 = 1.0 / _269;
    float _285 = floor(_281);
    float _287 = 1.0 / _273;
    float _289 = -_285;
    float _291 = _281 + _289;
    float _293 = _97 * _243;
    float _295 = in.m_63.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_57.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = -_217;
    float _309 = _307 + _227;
    float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _313 = _283 * _311;
    float _315 = _97 * _255;
    float _317 = fma(_291, _309, _217);
    float _319 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _321 = -_313;
    float _323 = fma(_287, _319, _321);
    float _325 = _293 * _317;
    float _327 = _97 * _249;
    float _329 = _323 * _275;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _325 * _327;
    float _335 = 0.0 + _333;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _337 * _331;
    float _341 = _339 * _315;
    bool _345 = _341 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _347 = isnan(_341);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _353 = _349 || _351;
    float _355 = in.m_63.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_63.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_57.y;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_57.z;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    if (!_353)
    {
        discard_fragment();
    }
    float _379 = -_213;
    float _381 = _379 + _223;
    float _383 = -_211;
    float _385 = _383 + _221;
    float _387 = fma(_291, _381, _213);
    float _389 = fma(_291, _385, _211);
    float _391 = _97 * _305;
    float _393 = _97 * _359;
    float _395 = -_215;
    float _397 = _395 + _225;
    float _399 = _97 * _365;
    float _401 = _97 * _371;
    float _403 = _97 * _299;
    float _405 = _97 * _377;
    float _407 = fma(_291, _397, _215);
    float _409 = -_393;
    float _411 = _409 + _391;
    float _413 = -_399;
    float _415 = _413 + _401;
    float _417 = -_403;
    float _419 = _417 + _405;
    float _421 = fma(_389, _411, _393);
    float _423 = fma(_387, _415, _399);
    float _425 = fma(_407, _419, _403);
    if (!_353)
    {
        out.m_66.x = _421;
        out.m_66.y = _423;
        out.m_66.z = _425;
        out.m_66.w = _333;
        return out;
    }
    float _427 = in.m_68.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_68.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_68.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_70.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = _97 * _431;
    float _453 = _97 * _437;
    float _455 = _97 * _443;
    float _457 = _451 * _451;
    float _459 = fma(_453, _453, _457);
    float _461 = fma(_455, _455, _459);
    float _463 = rsqrt(_461);
    float _465 = _453 * _463;
    float _467 = _451 * _463;
    float _469 = _455 * _463;
    float _471 = abs(_465);
    float _473 = abs(_467);
    float _475 = precise::max(_471, _473);
    float _477 = fma(_389, -0.699999988079071044921875, 0.699999988079071044921875);
    float _479 = abs(_469);
    float _481 = precise::max(_479, _475);
    float _483 = _97 * _449;
    float _485 = 1.0 / _481;
    float _487 = _477 + _483;
    float _489 = precise::min(_487, 1.0);
    float _491 = _465 * _485;
    float _493 = _467 * _485;
    float _495 = -_485;
    float _497 = _469 * _495;
    float3 _1278 = float3(_491, _493, _497);
    float3 _501 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1278, float3(0.0), isnan(_1278)), level(_489)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1278, float3(0.0), isnan(_1278)), level(_489)).xyz;
    float _503 = _501.x;
    float _505 = _501.y;
    float _507 = _501.z;
    float _509 = -_389;
    float _511 = _509 + 1.0;
    float _513 = in.m_72.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_72.z;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_72.y;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = _325 * _511;
    float _533 = in.m_74.z;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = in.m_74.x;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_74.y;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = in.m_76.x;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_76.z;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = abs(_531);
    float _565 = log2(_563);
    float _567 = in.m_76.w;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_76.y;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    bool _579 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _581 = _565 * 8.0;
    float _583 = exp2(_581);
    float _585 = _97 * _523;
    float _587 = _97 * _537;
    float _589 = fma(_583, -4.0, 1.0);
    float _591 = _97 * _517;
    float _593 = _97 * _529;
    float _595 = _97 * _543;
    float _597 = _585 * _589;
    float _599 = _591 * _589;
    float _601 = _593 * _589;
    float _603 = _97 * _549;
    float _605 = _97 * _577;
    float _607 = _97 * _561;
    float _609 = fma(_507, 0.20999999344348907470703125, _597);
    float _611 = fma(_503, 0.20999999344348907470703125, _599);
    float _613 = fma(_505, 0.20999999344348907470703125, _601);
    float _615 = _597;
    if (_579)
    {
        float _617 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _619 = _313 + _617;
        _615 = _619;
    }
    float _621 = _615;
    float _623 = _609 + _587;
    float _625 = _611 + _595;
    float _627 = _613 + _603;
    float _629 = 0.0 + _341;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    float _633 = _621;
    float _635 = _631;
    if (_579)
    {
        float _637 = _621 * 8.0;
        float _639 = precise::clamp(_637, 0.0, 1.0);
        _633 = _639;
    }
    float _641 = _633;
    float _643 = _97 * _555;
    float _645 = _97 * _571;
    float _647 = _421 * _625;
    float _649 = _423 * _627;
    float _651 = _425 * _623;
    if (_579)
    {
        float _653 = _631 * _641;
        _635 = _653;
    }
    float _655 = _635;
    float _657 = fma(_647, _645, _643);
    float _659 = fma(_649, _645, _605);
    float _661 = fma(_651, _645, _607);
    float _663 = 0.0 + _655;
    float _665 = precise::clamp(_663, 0.0, 1.0);
    out.m_66.x = _657;
    out.m_66.y = _659;
    out.m_66.z = _661;
    out.m_66.w = _665;
    return out;
}

