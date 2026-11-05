#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_8 [[id(9)]];
    sampler fp_t_tcb_8Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texturecube<float> fp_t_tcb_1E [[id(15)]];
    sampler fp_t_tcb_1ESmplr [[id(16)]];
    texturecube_array<float> fp_t_tcb_2E [[id(17)]];
    sampler fp_t_tcb_2ESmplr [[id(18)]];
    sampler fp_t_tcb_10Smplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_ASmplr_w [[id(22)]];
    sampler fp_t_tcb_1ESmplr_w [[id(23)]];
    sampler fp_t_tcb_2ESmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_72 [[color(0)]];
};

struct main0_in
{
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
};

static inline __attribute__((always_inline))
int _90(thread const int& _2568, thread const int& _2569, constant _10& support_buffer)
{
    int _2572 = 1 + _2569;
    float _2574 = support_buffer._m5[_2572].x;
    float _2576 = abs(_2574);
    bool _2578 = _2576 == 1.0;
    if (_2578)
    {
        return _2568;
    }
    float _2580 = float(_2568);
    float _2582 = _2580 / _2576;
    int _2584 = int(_2582);
    return _2584;
}

static inline __attribute__((always_inline))
int _92(thread const int& _2607, thread const int& _2608, thread const int& _2609, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _2612 = 1 + _2608;
    float _2614 = support_buffer._m5[_2612].x;
    bool _2616 = _2614 == 1.0;
    if (_2616)
    {
        return _2607;
    }
    bool _2618 = _2614 < 0.0;
    if (_2618)
    {
        float _2620 = -_2614;
        float _2622 = float(_2607);
        float _2624 = _2622 * _2620;
        float _2626 = gl_FragCoord.x;
        float _2628 = gl_FragCoord.y;
        float _2630 = (_2609 != 0) ? _2628 : _2626;
        float _2632 = mod(_2630, _2620);
        float _2634 = _2624 + _2632;
        int _2636 = int(_2634);
        return _2636;
    }
    float _2638 = float(_2607);
    float _2640 = _2638 * _2614;
    int _2642 = int(_2640);
    return _2642;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _96 = gl_FragCoord.w;
    float _98 = in.m_53.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_53.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_53.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_55.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_55.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = 1.0 / _96;
    float _130 = _128 * _102;
    float _132 = _128 * _108;
    float _134 = _128 * _114;
    float _136 = _128 * _120;
    float _138 = 1.0 / _130;
    float _140 = _128 * _126;
    float _142 = _132 * _138;
    float _144 = _134 * _138;
    float2 _1164 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1164, float2(0.0), isnan(_1164))).x;
    float2 _1175 = float2(_136, _140);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1175, float2(0.0), isnan(_1175))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1175, float2(0.0), isnan(_1175))).w;
    float _150 = in.m_53.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_57.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_59.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _128 * _154;
    float _170 = _128 * _160;
    float _172 = _128 * _166;
    float _174 = _168 * _138;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = 1.0 / _178;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = _180 * _182;
    float _186 = in.m_61.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _128 * _190;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _196 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
    float _198 = _170 * _148;
    float _200 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _202 = 0.0 + _198;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = 1.0 / _196;
    float _208 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _210 = -_184;
    float _212 = fma(_206, _208, _210);
    float _214 = _212 * _200;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _204 * _216;
    float _220 = _218 * _172;
    bool _224 = _220 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _226 = isnan(_220);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _232 = _228 || _230;
    float _234 = in.m_61.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    if (!_232)
    {
        discard_fragment();
    }
    float _240 = _128 * _238;
    float2 _1317 = float2(_192, _240);
    float2 _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1317, float2(0.0), isnan(_1317))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1317, float2(0.0), isnan(_1317))).xy;
    float _246 = _244.x;
    float _248 = _244.y;
    float _250 = in.m_63.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_61.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_61.w;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _270 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _268;
    float _272 = _128 * _254;
    float _274 = 1.0 / _270;
    float _276 = precise::max(_272, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _278 = precise::min(_276, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _280 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _282 = _278 + _280;
    float _284 = _282 * _274;
    float _286 = _128 * _260;
    float _288 = _284 * 0.0350000001490116119384765625;
    float _290 = _128 * _266;
    float _292 = fma(_246, _288, _286);
    float _294 = fma(_248, _288, _290);
    float _296 = fma(_246, _288, _142);
    float _298 = fma(_248, _288, _144);
    float2 _1405 = float2(_292, _294);
    float4 _301 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1405, float2(0.0), isnan(_1405))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1405, float2(0.0), isnan(_1405))).xyzw;
    float _303 = _301.x;
    float _305 = _301.y;
    float _307 = _301.z;
    float _309 = _301.w;
    float2 _1421 = float2(_296, _298);
    float _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1421, float2(0.0), isnan(_1421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1421, float2(0.0), isnan(_1421))).x;
    int _313 = int2(spvDescriptorSet0.fp_t_tcb_E.get_width(), spvDescriptorSet0.fp_t_tcb_E.get_height()).x;
    int _315 = _313;
    int _317 = 4;
    int _319 = _90(_315, _317, (*spvDescriptorSet0.support_buffer));
    int _321 = int2(spvDescriptorSet0.fp_t_tcb_E.get_width(), spvDescriptorSet0.fp_t_tcb_E.get_height()).y;
    int _323 = _321;
    int _325 = 4;
    int _327 = _90(_323, _325, (*spvDescriptorSet0.support_buffer));
    float _329 = in.m_65.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_65.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_65.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_67.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_67.y;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_67.z;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_69.w;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = _128 * _333;
    float _373 = _128 * _339;
    float _375 = _128 * _345;
    float _377 = _303 * _303;
    float _379 = _305 * _305;
    float _381 = _307 * _307;
    float _383 = -_377;
    float _385 = _383 + 1.0;
    float _387 = -_379;
    float _389 = _387 + 1.0;
    float _391 = -_381;
    float _393 = _391 + 1.0;
    float _395 = _371 * _385;
    float _397 = _128 * _351;
    float _399 = _373 * _389;
    float _401 = _128 * _357;
    float _403 = _375 * _393;
    float _405 = _128 * _363;
    float _407 = fma(_377, _397, _395);
    float _409 = _309 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _411 = fma(_379, _401, _399);
    float _413 = fma(_381, _405, _403);
    float _415 = _407 * _409;
    float _417 = _411 * _409;
    float _419 = in.m_69.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = _413 * _409;
    if (!_232)
    {
        out.m_72.x = _415;
        out.m_72.y = _417;
        out.m_72.z = _425;
        out.m_72.w = _198;
        return out;
    }
    float _427 = in.m_74.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_74.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_76.x;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_76.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_74.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = _128 * _369;
    float _459 = in.m_76.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = _128 * _423;
    float _467 = 1.0 / _457;
    float _469 = -_465;
    float _471 = fma(_469, _467, _311);
    float _473 = _128 * _431;
    float _475 = _128 * _437;
    float _477 = _128 * _443;
    float _479 = ceil(_471);
    float _481 = _473 * _473;
    float _483 = _128 * _449;
    float _485 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _487 = _477 + _485;
    float _489 = _128 * _455;
    float _491 = fma(_475, _475, _481);
    float _493 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _495 = _483 + _493;
    float _497 = _128 * _463;
    float _499 = float(_319);
    float _501 = fma(_489, _489, _491);
    float _503 = _495 * _495;
    float _505 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _507 = _497 + _505;
    float _509 = fma(_487, _487, _503);
    float _511 = rsqrt(_501);
    float _513 = 0.0 + _479;
    float _515 = precise::clamp(_513, 0.0, 1.0);
    float _517 = fma(_507, _507, _509);
    float _519 = _288 * _515;
    float _521 = rsqrt(_517);
    float _523 = _246 * _519;
    float _525 = fma(_248, _519, _144);
    float _527 = float(_327);
    float _529 = fma(_523, (*spvDescriptorSet0.fp_c15)._m0[630].w, _142);
    int _531 = _327 + (-1);
    float _533 = _475 * _511;
    float _535 = _473 * _511;
    float _537 = _525 * _527;
    float _539 = _489 * _511;
    float _541 = _529 * _499;
    float _543 = abs(_533);
    float _545 = abs(_535);
    float _547 = precise::max(_543, _545);
    float _549 = trunc(_537);
    int _551 = int(_549);
    float _553 = _487 * _521;
    float _555 = abs(_539);
    float _557 = precise::max(_555, _547);
    float _559 = _495 * _521;
    float _561 = _507 * _521;
    float _563 = _533 * _553;
    float _565 = trunc(_541);
    int _567 = int(_565);
    float _569 = fma(_535, _559, _563);
    float _571 = fma(_539, _561, _569);
    float _573 = 1.0 / _557;
    int _575 = max(0, _551);
    float _577 = _571 + _571;
    int _579 = min(_531, _575);
    float _581 = -_577;
    float _583 = fma(_533, _581, _553);
    int _585 = _319 + (-1);
    float _587 = -_577;
    float _589 = fma(_535, _587, _559);
    int _591 = max(0, _567);
    float _593 = -_561;
    float _595 = fma(_539, _577, _593);
    int _597 = min(_585, _591);
    float _599 = abs(_583);
    float _601 = abs(_589);
    float _603 = precise::max(_599, _601);
    float _605 = _533 * _573;
    float _607 = _535 * _573;
    float _609 = -_573;
    float _611 = _539 * _609;
    float _613 = abs(_595);
    float _615 = precise::max(_613, _603);
    float3 _1848 = float3(_605, _607, _611);
    float3 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1848, float3(0.0), isnan(_1848)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1848, float3(0.0), isnan(_1848)), level(0.0)).xyz;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = 1.0 / _615;
    float _629 = _583 * _627;
    float _631 = _589 * _627;
    float _633 = _595 * _627;
    float _635 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 7.0, 1.0);
    float4 _1881 = float4(_629, _631, _633, float(0));
    float4 _1885 = select(_1881, float4(0.0), isnan(_1881));
    float3 _637 = dm_bs(spvDescriptorSet0.fp_t_tcb_2E.sample(spvDescriptorSet0.fp_t_tcb_2ESmplr, _1885.xyz, uint(rint(_1885.w)), level(_635)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_2E, spvDescriptorSet0.fp_t_tcb_2ESmplr_w, _1885.xyz, uint(rint(_1885.w)), level(_635)).xyz;
    float _639 = _637.x;
    float _641 = _637.y;
    float _643 = _637.z;
    int _645 = _597;
    int _647 = 4;
    int _649 = 0;
    int _651 = _92(_645, _647, _649, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _653 = _579;
    int _655 = 4;
    int _657 = 1;
    int _659 = _92(_653, _655, _657, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _661 = spvDescriptorSet0.fp_t_tcb_E.read(uint2(int2(_651, _659)), 0).xyz;
    float _663 = _661.x;
    float _665 = _661.y;
    float _667 = _661.z;
    float _669 = _559 + (*spvDescriptorSet0.fp_c15)._m0[16].y;
    float _671 = _553 + (*spvDescriptorSet0.fp_c15)._m0[16].x;
    float _673 = _561 + (*spvDescriptorSet0.fp_c15)._m0[16].z;
    float _675 = -_559;
    float _677 = -_563;
    float _679 = fma(_535, _675, _677);
    float _681 = _669 * _669;
    float _683 = sqrt(_517);
    float _685 = -_561;
    float _687 = fma(_539, _685, _679);
    float _689 = precise::clamp(_687, 0.0, 1.0);
    float _691 = fma(_671, _671, _681);
    float _693 = _533 * (*spvDescriptorSet0.fp_c15)._m0[16].x;
    float _695 = in.m_78.z;
    float _697 = gl_FragCoord.w;
    float _699 = _695 * _697;
    float _701 = -(*spvDescriptorSet0.fp_c15)._m0[651].x;
    float _703 = (*spvDescriptorSet0.fp_c15)._m0[651].y + _701;
    float _705 = fma(_673, _673, _691);
    float _707 = -_535;
    float _709 = -_693;
    float _711 = fma(_707, (*spvDescriptorSet0.fp_c15)._m0[16].y, _709);
    float _713 = in.m_78.y;
    float _715 = gl_FragCoord.w;
    float _717 = _713 * _715;
    float _719 = 1.0 / _703;
    float _721 = rsqrt(_705);
    float _723 = -(*spvDescriptorSet0.fp_c15)._m0[651].x;
    float _725 = _683 + _723;
    float _727 = _689 * (-9.27999973297119140625);
    float _729 = -(*spvDescriptorSet0.fp_c13)._m0[4].y;
    float _731 = _729 + 1.0;
    float _733 = _731 * _731;
    float _735 = exp2(_727);
    float _737 = _725 * _719;
    float _739 = precise::clamp(_737, 0.0, 1.0);
    float _741 = _671 * _721;
    float _743 = _669 * _721;
    float _745 = _673 * _721;
    float _747 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, -0.572000026702880859375, 1.03999996185302734375);
    float _749 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _751 = _533 * _741;
    float _753 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 0.5, 0.5);
    float _755 = _743 * (*spvDescriptorSet0.fp_c15)._m0[16].y;
    float _757 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _759 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, (*spvDescriptorSet0.fp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _761 = precise::clamp(_759, 0.0, 1.0);
    float _763 = -_743;
    float _765 = -_751;
    float _767 = fma(_535, _763, _765);
    float _769 = fma(_741, (*spvDescriptorSet0.fp_c15)._m0[16].x, _755);
    float _771 = _753 * _753;
    float _773 = _771 * 0.5;
    float _775 = _761 * _761;
    float _777 = -_745;
    float _779 = fma(_539, _777, _767);
    float _781 = precise::clamp(_779, 0.0, 1.0);
    float _783 = fma(_745, (*spvDescriptorSet0.fp_c15)._m0[16].z, _769);
    float _785 = precise::clamp(_783, 0.0, 1.0);
    float _787 = -_539;
    float _789 = fma(_787, (*spvDescriptorSet0.fp_c15)._m0[16].z, _711);
    float _791 = precise::clamp(_789, 0.0, 1.0);
    float _793 = _775 + (-1.0);
    float _795 = _781 * _781;
    float _797 = in.m_78.x;
    float _799 = gl_FragCoord.w;
    float _801 = _797 * _799;
    float _803 = -_773;
    float _805 = _803 + 1.0;
    float _807 = precise::min(_733, _735);
    float _809 = fma(_795, _793, 1.0);
    float _811 = -_785;
    float _813 = _811 + 1.0;
    float _815 = fma(_791, _805, _773);
    float _817 = fma(_689, _805, _773);
    float _819 = _809 * _809;
    float _821 = fma(_731, _807, _757);
    float _823 = _813 * _813;
    float _825 = _817 * _815;
    float _827 = _415 + (-0.039999999105930328369140625);
    float _829 = fma(_821, -1.03999996185302734375, _747);
    float _831 = precise::clamp(_829, 0.0, 1.0);
    float _833 = 1.0 / _819;
    float _835 = _823 * _823;
    float _837 = fma(_821, 1.03999996185302734375, _749);
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = _417 + (-0.039999999105930328369140625);
    float _843 = _425 + (-0.039999999105930328369140625);
    float _845 = _813 * _835;
    float _847 = _128 * _699;
    float _849 = 1.0 / _825;
    float _851 = fma(_827, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.039999999105930328369140625);
    float _853 = -_827;
    float _855 = fma(_853, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.959999978542327880859375);
    float _857 = fma(_841, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.039999999105930328369140625);
    float _859 = fma(_843, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.039999999105930328369140625);
    float _861 = _775 * 0.31830990314483642578125;
    float _863 = fma(_851, _831, _839);
    float _865 = fma(_857, _831, _839);
    float _867 = fma(_859, _831, _839);
    float _869 = _861 * _833;
    float _871 = -_841;
    float _873 = fma(_871, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.959999978542327880859375);
    float _875 = -_843;
    float _877 = fma(_875, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.959999978542327880859375);
    float _879 = fma(_845, _855, _851);
    float _881 = _791 * _869;
    float _883 = _881 * 0.25;
    float _885 = fma(_845, _873, _857);
    float _887 = fma(_845, _877, _859);
    float _889 = _128 * _801;
    float _891 = _883 * _849;
    float _893 = in.m_80.x;
    float _895 = gl_FragCoord.w;
    float _897 = _893 * _895;
    float _899 = in.m_80.y;
    float _901 = gl_FragCoord.w;
    float _903 = _899 * _901;
    float _905 = in.m_80.z;
    float _907 = gl_FragCoord.w;
    float _909 = _905 * _907;
    float _911 = _879 * _891;
    float _913 = _885 * _891;
    float _915 = _887 * _891;
    float _917 = in.m_82.y;
    float _919 = gl_FragCoord.w;
    float _921 = _917 * _919;
    float _923 = in.m_82.z;
    float _925 = gl_FragCoord.w;
    float _927 = _923 * _925;
    float _929 = in.m_84.x;
    float _931 = gl_FragCoord.w;
    float _933 = _929 * _931;
    float _935 = in.m_84.y;
    float _937 = gl_FragCoord.w;
    float _939 = _935 * _937;
    float _941 = in.m_84.z;
    float _943 = gl_FragCoord.w;
    float _945 = _941 * _943;
    float _947 = _128 * _717;
    float _949 = -(*spvDescriptorSet0.fp_c13)._m0[4].z;
    float _951 = _949 + 1.0;
    float _953 = _128 * _897;
    float _955 = _128 * _903;
    float _957 = _128 * _909;
    float _959 = _128 * _921;
    float _961 = _128 * _927;
    float _963 = fma(_621, 0.20999999344348907470703125, _889);
    float _965 = fma(_625, 0.20999999344348907470703125, _847);
    float _967 = in.m_82.x;
    float _969 = gl_FragCoord.w;
    float _971 = _967 * _969;
    float _973 = in.m_84.w;
    float _975 = gl_FragCoord.w;
    float _977 = _973 * _975;
    float _979 = fma(_623, 0.20999999344348907470703125, _947);
    float _981 = _128 * _933;
    float _983 = _128 * _945;
    float _985 = _963 + _953;
    float _987 = _979 + _955;
    float _989 = _415 * _985;
    float _991 = _417 * _987;
    float _993 = -_639;
    float _995 = _993 + (*spvDescriptorSet0.fp_c15)._m0[649].x;
    float _997 = _128 * _971;
    float _999 = _128 * _939;
    float _1001 = _128 * _977;
    float _1003 = _965 + _957;
    float _1005 = -_641;
    float _1007 = _1005 + (*spvDescriptorSet0.fp_c15)._m0[649].y;
    float _1009 = -_643;
    float _1011 = _1009 + (*spvDescriptorSet0.fp_c15)._m0[649].z;
    float _1013 = _425 * _1003;
    bool _1015 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1017 = fma(_739, _995, _639);
    float _1019 = fma(_739, _1007, _641);
    float _1021 = fma(_739, _1011, _643);
    float _1023 = (*spvDescriptorSet0.fp_c15)._m0[21].w * (*spvDescriptorSet0.fp_c15)._m0[22].x;
    float _1025 = (*spvDescriptorSet0.fp_c15)._m0[21].w * (*spvDescriptorSet0.fp_c15)._m0[22].y;
    float _1027 = _863 * _1017;
    float _1029 = (*spvDescriptorSet0.fp_c15)._m0[21].w * (*spvDescriptorSet0.fp_c15)._m0[22].z;
    float _1031 = _865 * _1019;
    float _1033 = _867 * _1021;
    float _1035 = fma(_911, _1023, _1027);
    float _1037 = fma(_913, _1025, _1031);
    float _1039 = fma(_915, _1029, _1033);
    float _1041 = fma(_863, _997, _1035);
    float _1043 = _1031;
    float _1045 = _1041;
    if (_1015)
    {
        float _1047 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1049 = _184 + _1047;
        _1043 = _1049;
    }
    float _1051 = _1043;
    float _1053 = fma(_865, _959, _1037);
    float _1055 = fma(_867, _961, _1039);
    float _1057 = fma(_989, _951, _1041);
    float _1059 = 0.0 + _220;
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = fma(_991, _951, _1053);
    float _1065 = fma(_1013, _951, _1055);
    float _1067 = _1061;
    if (_1015)
    {
        float _1069 = _1051 * 8.0;
        float _1071 = precise::clamp(_1069, 0.0, 1.0);
        _1045 = _1071;
    }
    float _1073 = _1045;
    float _1075 = _663 + _1057;
    float _1077 = _665 + _1063;
    float _1079 = _667 + _1065;
    if (_1015)
    {
        float _1081 = _1061 * _1073;
        _1067 = _1081;
    }
    float _1083 = _1067;
    float _1085 = fma(_1075, _1001, _981);
    float _1087 = fma(_1077, _1001, _999);
    float _1089 = fma(_1079, _1001, _983);
    float _1091 = 0.0 + _1083;
    float _1093 = precise::clamp(_1091, 0.0, 1.0);
    out.m_72.x = _1085;
    out.m_72.y = _1087;
    out.m_72.z = _1089;
    out.m_72.w = _1093;
    return out;
}

