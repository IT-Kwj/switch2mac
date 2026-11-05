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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_53 [[user(locn3), flat]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_66 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_55 [[user(locn9), flat]];
    float4 m_72 [[user(locn10), flat]];
    float4 m_51 [[user(locn11)]];
    float4 m_61 [[user(locn12)]];
    float4 m_78 [[user(locn13)]];
    float4 m_70 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _85 = gl_FragCoord.w;
    float _87 = in.m_47.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_47.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _85;
    float _101 = _99 * _91;
    float _103 = _99 * _97;
    float2 _742 = float2(_101, _103);
    float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_742, float2(0.0), isnan(_742))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_742, float2(0.0), isnan(_742))).xy;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = in.m_49.y;
    float _115 = in.m_51.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[31].x;
    float _123 = in.m_51.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_53.x;
    float _131 = in.m_47.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_51.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_47.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _113 + 1.0;
    float _151 = _99 * _119;
    float _153 = rint(_113);
    float _155 = precise::max(_153, 0.0);
    uint _158 = uint(_155);
    uint _160 = clamp(_158, 0u, 65535u);
    float _162 = _99 * _127;
    float _164 = _149 * _121;
    float _166 = _129 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _168 = _99 * _135;
    float _170 = _99 * _141;
    float _172 = floor(_164);
    float _174 = 1.0 / _151;
    float _176 = -_172;
    float _178 = fma(_176, (*spvDescriptorSet0.fp_c9)._m0[31].x, _149);
    float _180 = rint(_178);
    float _182 = precise::max(_180, 0.0);
    uint _184 = uint(_182);
    uint _186 = clamp(_184, 0u, 65535u);
    float _188 = _162 * _174;
    float _190 = _170 * _174;
    float2 _860 = float2(_188, _190);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_860, float2(0.0), isnan(_860))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_860, float2(0.0), isnan(_860))).x;
    float _194 = fma(_166, _109, _168);
    float _196 = _129 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _198 = _99 * _147;
    float _200 = fma(_196, _111, _198);
    float3 _886 = float3(_194, _200, float(int(_160)));
    float3 _890 = select(_886, float3(0.0), isnan(_886));
    float4 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _890.xy, uint(rint(_890.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _890.xy, uint(rint(_890.z))).xyzw;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = _203.w;
    float3 _907 = float3(_194, _200, float(int(_186)));
    float3 _909 = select(_907, float3(0.0), isnan(_907));
    float4 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _909.xy, uint(rint(_909.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _909.xy, uint(rint(_909.z))).xyzw;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _213.w;
    float _223 = in.m_55.y;
    float _225 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[31].y;
    float _227 = in.m_51.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_57.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_59.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _223 * _225;
    float _247 = _245 * _225;
    float _249 = floor(_247);
    float _251 = _99 * _231;
    float _253 = in.m_61.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _251 * _174;
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _263 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[30].w, _261);
    float _265 = 1.0 / _263;
    float _267 = -_249;
    float _269 = fma(_267, (*spvDescriptorSet0.fp_c9)._m0[31].y, _245);
    float _271 = _269 + 9.9999997473787516355514526367188e-05;
    float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _275 = fma(_192, (*spvDescriptorSet0.fp_c8)._m0[30].w, _273);
    float _277 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _279 = floor(_271);
    float _281 = 1.0 / _275;
    float _283 = -_279;
    float _285 = _271 + _283;
    float _287 = _99 * _257;
    float _289 = in.m_59.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_59.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_59.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = -_211;
    float _309 = _307 + _221;
    float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _313 = _265 * _311;
    float _315 = fma(_285, _309, _211);
    float _317 = _99 * _237;
    float _319 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _321 = -_313;
    float _323 = fma(_281, _319, _321);
    float _325 = _315 * _317;
    float _327 = _99 * _243;
    float _329 = _323 * _277;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _327 * _325;
    float _335 = 0.0 + _333;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _337 * _331;
    float _341 = _339 * _287;
    bool _345 = _341 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _347 = isnan(_341);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _353 = _349 || _351;
    float _355 = in.m_57.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_57.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_57.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = _313;
    if (!_353)
    {
        discard_fragment();
    }
    float _375 = -_207;
    float _377 = _375 + _217;
    float _379 = -_205;
    float _381 = _379 + _215;
    float _383 = _99 * _299;
    float _385 = -_209;
    float _387 = _385 + _219;
    float _389 = fma(_285, _377, _207);
    float _391 = fma(_285, _381, _205);
    float _393 = _99 * _305;
    float _395 = fma(_285, _387, _209);
    float _397 = _99 * _359;
    float _399 = _99 * _365;
    float _401 = _99 * _293;
    float _403 = _99 * _371;
    float _405 = -_383;
    float _407 = _397 + _405;
    float _409 = -_401;
    float _411 = _399 + _409;
    float _413 = -_393;
    float _415 = _403 + _413;
    float _417 = fma(_391, _407, _383);
    float _419 = fma(_389, _411, _401);
    float _421 = fma(_395, _415, _393);
    if (!_353)
    {
        out.m_64.x = _417;
        out.m_64.y = _419;
        out.m_64.z = _421;
        out.m_64.w = _333;
        return out;
    }
    float _423 = in.m_66.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_66.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_66.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = _99 * _427;
    float _443 = _99 * _433;
    float _445 = _99 * _439;
    float _447 = _441 * _441;
    float _449 = fma(_443, _443, _447);
    float _451 = fma(_445, _445, _449);
    float _453 = rsqrt(_451);
    float _455 = _443 * _453;
    float _457 = _441 * _453;
    float _459 = _445 * _453;
    float _461 = abs(_455);
    float _463 = abs(_457);
    float _465 = precise::max(_461, _463);
    float _467 = abs(_459);
    float _469 = precise::max(_467, _465);
    float _471 = 1.0 / _469;
    float _473 = -_471;
    float _475 = _459 * _473;
    float _477 = _455 * _471;
    float _479 = _457 * _471;
    float3 _1292 = float3(_477, _479, _475);
    float3 _483 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1292, float3(0.0), isnan(_1292)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1292, float3(0.0), isnan(_1292)), level(0.0)).xyz;
    float _485 = _483.x;
    float _487 = _483.y;
    float _489 = _483.z;
    float _491 = in.m_68.y;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_68.x;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_70.y;
    float _505 = in.m_70.x;
    float _507 = in.m_68.z;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_70.z;
    float _515 = in.m_72.x;
    float _517 = in.m_74.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_76.x;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_76.y;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_76.z;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_78.x;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_78.w;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = _99 * _495;
    float _555 = _99 * _501;
    float _557 = in.m_74.z;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = -_503;
    float _565 = _553 + _563;
    float _567 = -_505;
    float _569 = _555 + _567;
    float _571 = _99 * _511;
    float _573 = _515 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _575 = _565 * _565;
    float _577 = in.m_74.w;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = -_513;
    float _585 = _571 + _583;
    float _587 = fma(_569, _569, _575);
    float _589 = _99 * _527;
    float _591 = in.m_74.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    bool _597 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _599 = fma(_585, _585, _587);
    float _601 = _99 * _539;
    float _603 = _99 * _545;
    float _605 = -_599;
    float _607 = fma(_573, _573, _605);
    float _609 = precise::max(0.0, _607);
    if (_597)
    {
        float _611 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _613 = _313 + _611;
        _373 = _613;
    }
    float _615 = _373;
    float _617 = sqrt(_609);
    float _619 = _99 * _561;
    float _621 = in.m_78.y;
    float _623 = gl_FragCoord.w;
    float _625 = _621 * _623;
    float _627 = _323 + _617;
    float _629 = _99 * _581;
    float _631 = _99 * _595;
    float _633 = in.m_78.z;
    float _635 = gl_FragCoord.w;
    float _637 = _633 * _635;
    float _639 = _99 * _521;
    float _641 = -_629;
    float _643 = _641 + _627;
    float _645 = _99 * _533;
    float _647 = _99 * _551;
    float _649 = _643 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _651 = _649 * (-1.44269502162933349609375);
    float _653 = exp2(_651);
    float _655 = _99 * _625;
    float _657 = -_653;
    float _659 = _657 + 1.0;
    float _661 = precise::clamp(_659, 0.0, 1.0);
    float _663 = _99 * _637;
    float _665 = _341 * _661;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    float _669 = fma(_485, 0.20999999344348907470703125, _631);
    float _671 = fma(_487, 0.20999999344348907470703125, _639);
    float _673 = fma(_489, 0.20999999344348907470703125, _619);
    float _675 = _669 + _589;
    float _677 = _671 + _645;
    float _679 = _673 + _601;
    float _681 = _669;
    float _683 = _667;
    if (_597)
    {
        float _685 = _615 * 8.0;
        float _687 = precise::clamp(_685, 0.0, 1.0);
        _681 = _687;
    }
    float _689 = _681;
    float _691 = _417 * _675;
    float _693 = _419 * _677;
    float _695 = _421 * _679;
    if (_597)
    {
        float _697 = _667 * _689;
        _683 = _697;
    }
    float _699 = _683;
    float _701 = fma(_691, _647, _603);
    float _703 = fma(_693, _647, _655);
    float _705 = fma(_695, _647, _663);
    float _707 = 0.0 + _699;
    float _709 = precise::clamp(_707, 0.0, 1.0);
    out.m_64.x = _701;
    out.m_64.y = _703;
    out.m_64.z = _705;
    out.m_64.w = _709;
    return out;
}

