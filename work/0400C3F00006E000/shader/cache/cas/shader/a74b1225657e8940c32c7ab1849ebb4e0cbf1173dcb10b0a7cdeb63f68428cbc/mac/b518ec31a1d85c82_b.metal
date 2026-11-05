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
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
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
    float _112 = 1.0 / _80;
    float _114 = _112 * _86;
    float _116 = _112 * _92;
    float _118 = _112 * _98;
    float _120 = _112 * _104;
    float _122 = 1.0 / _114;
    float _124 = _112 * _110;
    float _126 = _116 * _122;
    float _128 = _118 * _122;
    float2 _796 = float2(_126, _128);
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_796, float2(0.0), isnan(_796))).x;
    float2 _807 = float2(_120, _124);
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_807, float2(0.0), isnan(_807))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_807, float2(0.0), isnan(_807))).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float _143 = in.m_44.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_48.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_50.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_52.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_54.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _175 = _112 * _147;
    float _177 = _175 * _122;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[30].w, _179);
    float _183 = _112 * _153;
    float _185 = _112 * _171;
    float _187 = 1.0 / _181;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _191 = _187 * _189;
    float _193 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _195 = fma(_130, (*spvDescriptorSet0.fp_c8)._m0[30].w, _193);
    float _197 = _112 * _159;
    float _199 = 1.0 / _195;
    float _201 = -_183;
    float _203 = fma(_141, _197, _201);
    float _205 = _112 * _165;
    float _207 = _205 * _203;
    float _209 = 0.0 + _207;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _215 = -_191;
    float _217 = fma(_199, _213, _215);
    float _219 = _217 * _173;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _211 * _221;
    float _225 = _223 * _185;
    bool _229 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _237 = _233 || _235;
    float _239 = in.m_46.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_46.w;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _191;
    if (!_237)
    {
        discard_fragment();
    }
    float _253 = _112 * _243;
    float _255 = _112 * _249;
    float2 _984 = float2(_253, _255);
    float2 _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_984, float2(0.0), isnan(_984))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_984, float2(0.0), isnan(_984))).xy;
    float _261 = _259.x;
    float _263 = _259.y;
    float _265 = in.m_48.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_52.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_48.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_52.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_48.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_52.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_50.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_50.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_50.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _112 * _269;
    float _321 = _112 * _275;
    float _323 = _112 * _281;
    float _325 = _112 * _287;
    float _327 = _112 * _293;
    float _329 = _112 * _299;
    float _331 = -_321;
    float _333 = _319 + _331;
    float _335 = -_325;
    float _337 = _323 + _335;
    float _339 = -_329;
    float _341 = _327 + _339;
    float _343 = fma(_135, _333, _321);
    float _345 = fma(_137, _337, _325);
    float _347 = _112 * _305;
    float _349 = fma(_139, _341, _329);
    float _351 = _112 * _311;
    float _353 = _112 * _317;
    float _355 = _343 * _347;
    float _357 = _345 * _351;
    float _359 = _349 * _353;
    if (!_237)
    {
        out.m_57.x = _355;
        out.m_57.y = _357;
        out.m_57.z = _359;
        out.m_57.w = _207;
        return out;
    }
    float _361 = in.m_59.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_59.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_61.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_59.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_61.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_63.y;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_61.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_63.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_63.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = _263 * _263;
    float _417 = fma(_261, _261, _415);
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _112 * _365;
    float _423 = -_419;
    float _425 = _423 + 1.0;
    float _427 = _112 * _371;
    float _429 = _112 * _377;
    float _431 = _112 * _383;
    float _433 = _112 * _389;
    float _435 = _112 * _395;
    float _437 = _429 * _429;
    float _439 = _431 * _431;
    float _441 = _112 * _401;
    float _443 = _112 * _407;
    float _445 = fma(_433, _433, _437);
    float _447 = _435 * _435;
    float _449 = fma(_421, _421, _439);
    float _451 = _112 * _413;
    float _453 = fma(_441, _441, _445);
    float _455 = fma(_443, _443, _447);
    float _457 = fma(_427, _427, _449);
    float _459 = sqrt(_425);
    float _461 = fma(_451, _451, _455);
    float _463 = rsqrt(_453);
    float _465 = rsqrt(_457);
    float _467 = rsqrt(_461);
    float _469 = _263 * _463;
    float _471 = _429 * _469;
    float _473 = _433 * _469;
    float _475 = _441 * _469;
    float _477 = _261 * _465;
    float _479 = fma(_431, _477, _471);
    float _481 = fma(_421, _477, _473);
    float _483 = fma(_427, _477, _475);
    float _485 = _459 * _467;
    float _487 = in.m_65.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = fma(_435, _485, _479);
    float _495 = fma(_443, _485, _481);
    float _497 = fma(_451, _485, _483);
    float _499 = _493 * _493;
    float _501 = fma(_495, _495, _499);
    float _503 = fma(_497, _497, _501);
    float _505 = rsqrt(_503);
    float _507 = _112 * _491;
    float _509 = _495 * _505;
    float _511 = _493 * _505;
    float _513 = _497 * _505;
    float _515 = precise::min(_507, 1.0);
    float _517 = abs(_509);
    float _519 = abs(_511);
    float _521 = precise::max(_517, _519);
    float _523 = abs(_513);
    float _525 = precise::max(_523, _521);
    float _527 = 1.0 / _525;
    float _529 = _509 * _527;
    float _531 = _511 * _527;
    float _533 = -_527;
    float _535 = _513 * _533;
    float3 _1381 = float3(_529, _531, _535);
    float3 _539 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1381, float3(0.0), isnan(_1381)), level(_515)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1381, float3(0.0), isnan(_1381)), level(_515)).xyz;
    float _541 = _539.x;
    float _543 = _539.y;
    float _545 = _539.z;
    float _547 = in.m_67.x;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_67.y;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_67.z;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_69.x;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_69.z;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_69.y;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_71.z;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_71.x;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_71.y;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_73.x;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = in.m_73.y;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = in.m_73.z;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = in.m_73.w;
    float _621 = gl_FragCoord.w;
    float _623 = _619 * _621;
    bool _625 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_625)
    {
        float _627 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _629 = _191 + _627;
        _251 = _629;
    }
    float _631 = _251;
    float _633 = _112 * _551;
    float _635 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _637 = _635 + 1.0;
    float _639 = _112 * _557;
    float _641 = _112 * _563;
    float _643 = _112 * _569;
    float _645 = fma(_633, (*spvDescriptorSet0.fp_c13)._m0[0].y, _637);
    float _647 = fma(_639, (*spvDescriptorSet0.fp_c13)._m0[0].y, _637);
    float _649 = fma(_641, (*spvDescriptorSet0.fp_c13)._m0[0].y, _637);
    float _651 = _112 * _587;
    float _653 = _112 * _593;
    float _655 = _357 * _647;
    float _657 = precise::clamp(_655, 0.0, 1.0);
    float _659 = _112 * _575;
    float _661 = _359 * _649;
    float _663 = precise::clamp(_661, 0.0, 1.0);
    float _665 = _112 * _599;
    float _667 = _355 * _645;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    float _671 = _631;
    if (_625)
    {
        float _673 = _631 * 8.0;
        float _675 = precise::clamp(_673, 0.0, 1.0);
        _671 = _675;
    }
    float _677 = _671;
    float _679 = _112 * _605;
    float _681 = _112 * _611;
    float _683 = _112 * _617;
    float _685 = fma(_541, 0.20999999344348907470703125, _643);
    float _687 = _112 * _581;
    float _689 = fma(_545, 0.20999999344348907470703125, _659);
    float _691 = _112 * _623;
    float _693 = _685 + _653;
    float _695 = fma(_543, 0.20999999344348907470703125, _687);
    float _697 = _689 + _651;
    float _699 = 0.0 + _225;
    float _701 = precise::clamp(_699, 0.0, 1.0);
    float _703 = _669 * _693;
    float _705 = _695 + _665;
    float _707 = _663 * _697;
    float _709 = _701;
    if (_625)
    {
        float _711 = _701 * _677;
        _709 = _711;
    }
    float _713 = _709;
    float _715 = fma(_703, _691, _679);
    float _717 = _657 * _705;
    float _719 = fma(_707, _691, _683);
    float _721 = 0.0 + _713;
    float _723 = precise::clamp(_721, 0.0, 1.0);
    float _725 = fma(_717, _691, _681);
    out.m_57.x = _715;
    out.m_57.y = _725;
    out.m_57.z = _719;
    out.m_57.w = _723;
    return out;
}

