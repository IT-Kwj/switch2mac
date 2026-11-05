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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_38 [[id(7)]];
    sampler fp_t_tcb_38Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_38Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_44.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_48.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_48.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = 1.0 / _126;
    float _136 = _124 * _110;
    float _138 = _124 * _116;
    float _140 = _124 * _122;
    float _142 = _128 * _134;
    float _144 = _130 * _134;
    float2 _806 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_806, float2(0.0), isnan(_806))).x;
    float2 _817 = float2(_132, _136);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float2 _833 = float2(_138, _140);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_38.sample(spvDescriptorSet0.fp_t_tcb_38Smplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_38, spvDescriptorSet0.fp_t_tcb_38Smplr_w, select(_833, float2(0.0), isnan(_833))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float _169 = in.m_44.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_50.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_52.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_54.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _124 * _173;
    float _195 = _193 * _134;
    float _197 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _199);
    float _203 = 1.0 / _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = _124 * _179;
    float _211 = 1.0 / _207;
    float _213 = _157 * _167;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = _203 * _215;
    float _219 = _124 * _191;
    float _221 = _213 * _209;
    float _223 = _124 * _185;
    float _225 = _223 * _221;
    float _227 = 0.0 + _225;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _233 = -_217;
    float _235 = fma(_211, _231, _233);
    float _237 = _235 * _197;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _229 * _239;
    float _243 = _241 * _219;
    bool _247 = _243 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _249 = isnan(_243);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _255 = _251 || _253;
    float _257 = in.m_46.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_46.w;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _217;
    if (!_255)
    {
        discard_fragment();
    }
    float _271 = _124 * _261;
    float _273 = _124 * _267;
    float2 _1000 = float2(_271, _273);
    float2 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1000, float2(0.0), isnan(_1000))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1000, float2(0.0), isnan(_1000))).xy;
    float _279 = _277.x;
    float _281 = _277.y;
    float _283 = in.m_52.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_56.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_52.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_56.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_52.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_56.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_50.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_50.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_50.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _151 * _151;
    float _339 = _161 * _161;
    float _341 = _153 * _153;
    float _343 = _163 * _163;
    float _345 = _165 * _165;
    float _347 = _337 * _339;
    float _349 = _155 * _155;
    float _351 = _341 * _343;
    float _353 = _349 * _345;
    float _355 = _124 * _287;
    float _357 = _124 * _293;
    float _359 = _124 * _299;
    float _361 = _124 * _305;
    float _363 = _124 * _311;
    float _365 = _124 * _317;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = -_361;
    float _373 = _359 + _371;
    float _375 = _124 * _323;
    float _377 = -_365;
    float _379 = _363 + _377;
    float _381 = fma(_347, _369, _357);
    float _383 = fma(_351, _373, _361);
    float _385 = _124 * _329;
    float _387 = fma(_353, _379, _365);
    float _389 = _124 * _335;
    float _391 = _381 * _375;
    float _393 = _383 * _385;
    float _395 = _387 * _389;
    if (!_255)
    {
        out.m_59.x = _391;
        out.m_59.y = _393;
        out.m_59.z = _395;
        out.m_59.w = _225;
        return out;
    }
    float _397 = in.m_61.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_63.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_61.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_63.x;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_65.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_63.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_61.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_65.x;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_65.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = _281 * _281;
    float _453 = fma(_279, _279, _451);
    float _455 = precise::clamp(_453, 0.0, 1.0);
    float _457 = _124 * _401;
    float _459 = _124 * _407;
    float _461 = _124 * _413;
    float _463 = _124 * _419;
    float _465 = _457 * _457;
    float _467 = -_455;
    float _469 = _467 + 1.0;
    float _471 = _124 * _425;
    float _473 = _124 * _431;
    float _475 = _459 * _459;
    float _477 = _124 * _437;
    float _479 = fma(_461, _461, _465);
    float _481 = _124 * _443;
    float _483 = _471 * _471;
    float _485 = fma(_463, _463, _475);
    float _487 = fma(_477, _477, _479);
    float _489 = _124 * _449;
    float _491 = fma(_481, _481, _483);
    float _493 = fma(_473, _473, _485);
    float _495 = rsqrt(_487);
    float _497 = fma(_489, _489, _491);
    float _499 = rsqrt(_493);
    float _501 = sqrt(_469);
    float _503 = _281 * _495;
    float _505 = _457 * _503;
    float _507 = _461 * _503;
    float _509 = _477 * _503;
    float _511 = rsqrt(_497);
    float _513 = _279 * _499;
    float _515 = fma(_459, _513, _505);
    float _517 = fma(_463, _513, _507);
    float _519 = fma(_473, _513, _509);
    float _521 = _501 * _511;
    float _523 = fma(_471, _521, _515);
    float _525 = fma(_481, _521, _517);
    float _527 = fma(_489, _521, _519);
    float _529 = _523 * _523;
    float _531 = in.m_67.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = fma(_525, _525, _529);
    float _539 = fma(_527, _527, _537);
    float _541 = rsqrt(_539);
    float _543 = _525 * _541;
    float _545 = _523 * _541;
    float _547 = _527 * _541;
    float _549 = _124 * _535;
    float _551 = abs(_543);
    float _553 = abs(_545);
    float _555 = precise::max(_551, _553);
    float _557 = precise::min(_549, 1.0);
    float _559 = abs(_547);
    float _561 = precise::max(_559, _555);
    float _563 = 1.0 / _561;
    float _565 = _543 * _563;
    float _567 = _545 * _563;
    float _569 = -_563;
    float _571 = _547 * _569;
    float3 _1424 = float3(_565, _567, _571);
    float3 _575 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1424, float3(0.0), isnan(_1424)), level(_557)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1424, float3(0.0), isnan(_1424)), level(_557)).xyz;
    float _577 = _575.x;
    float _579 = _575.y;
    float _581 = _575.z;
    float _583 = in.m_69.x;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_69.z;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_69.y;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_71.z;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_71.x;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = in.m_71.y;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = in.m_73.x;
    float _621 = gl_FragCoord.w;
    float _623 = _619 * _621;
    float _625 = in.m_73.y;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = in.m_73.z;
    float _633 = gl_FragCoord.w;
    float _635 = _631 * _633;
    float _637 = in.m_73.w;
    float _639 = gl_FragCoord.w;
    float _641 = _637 * _639;
    bool _643 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_643)
    {
        float _645 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _647 = _217 + _645;
        _269 = _647;
    }
    float _649 = _269;
    float _651 = _124 * _587;
    float _653 = _124 * _593;
    float _655 = _124 * _605;
    float _657 = _124 * _611;
    float _659 = _124 * _617;
    float _661 = _124 * _629;
    float _663 = _124 * _635;
    float _665 = fma(_577, 0.20999999344348907470703125, _651);
    float _667 = _124 * _599;
    float _669 = fma(_581, 0.20999999344348907470703125, _653);
    float _671 = _653;
    if (_643)
    {
        float _673 = _649 * 8.0;
        float _675 = precise::clamp(_673, 0.0, 1.0);
        _671 = _675;
    }
    float _677 = _671;
    float _679 = _665 + _657;
    float _681 = fma(_579, 0.20999999344348907470703125, _667);
    float _683 = _669 + _655;
    float _685 = 0.0 + _243;
    float _687 = precise::clamp(_685, 0.0, 1.0);
    float _689 = _124 * _623;
    float _691 = _681 + _659;
    float _693 = _124 * _641;
    float _695 = _391 * _679;
    float _697 = _395 * _683;
    float _699 = _393 * _691;
    float _701 = _687;
    if (_643)
    {
        float _703 = _687 * _677;
        _701 = _703;
    }
    float _705 = _701;
    float _707 = fma(_695, _693, _689);
    float _709 = fma(_697, _693, _663);
    float _711 = fma(_699, _693, _661);
    float _713 = 0.0 + _705;
    float _715 = precise::clamp(_713, 0.0, 1.0);
    out.m_59.x = _707;
    out.m_59.y = _711;
    out.m_59.z = _709;
    out.m_59.w = _715;
    return out;
}

