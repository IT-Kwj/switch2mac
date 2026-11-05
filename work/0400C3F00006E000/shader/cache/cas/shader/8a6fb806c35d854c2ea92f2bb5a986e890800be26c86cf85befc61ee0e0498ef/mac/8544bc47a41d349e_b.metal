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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_1ESmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_63 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_73 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
    float4 m_75 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_46.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_46.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_48.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_48.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _82;
    float _116 = _114 * _88;
    float _118 = _114 * _94;
    float _120 = _114 * _100;
    float _122 = _114 * _106;
    float _124 = 1.0 / _116;
    float _126 = _114 * _112;
    float _128 = _118 * _124;
    float _130 = _120 * _124;
    float2 _792 = float2(_128, _130);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_792, float2(0.0), isnan(_792))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_792, float2(0.0), isnan(_792))).x;
    float2 _803 = float2(_122, _126);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_803, float2(0.0), isnan(_803))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_803, float2(0.0), isnan(_803))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float _145 = in.m_46.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_50.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_52.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_54.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_56.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _177 = _114 * _149;
    float _179 = _177 * _124;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = _114 * _155;
    float _187 = _114 * _173;
    float _189 = 1.0 / _183;
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _193 = _189 * _191;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = _114 * _161;
    float _201 = 1.0 / _197;
    float _203 = -_185;
    float _205 = fma(_143, _199, _203);
    float _207 = _114 * _167;
    float _209 = _207 * _205;
    float _211 = 0.0 + _209;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = -_193;
    float _219 = fma(_201, _215, _217);
    float _221 = _219 * _175;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _213 * _223;
    float _227 = _225 * _187;
    bool _231 = _227 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _233 = isnan(_227);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _239 = _235 || _237;
    float _241 = in.m_48.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_48.w;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = _193;
    if (!_239)
    {
        discard_fragment();
    }
    float _255 = _114 * _245;
    float _257 = _114 * _251;
    float2 _980 = float2(_255, _257);
    float2 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_980, float2(0.0), isnan(_980))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_980, float2(0.0), isnan(_980))).xy;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = in.m_54.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_54.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_54.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_50.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_50.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_50.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _137 * _137;
    float _305 = _139 * _139;
    float _307 = _141 * _141;
    float _309 = -_305;
    float _311 = _309 + 1.0;
    float _313 = _114 * _271;
    float _315 = _114 * _277;
    float _317 = _114 * _283;
    float _319 = -_303;
    float _321 = _319 + 1.0;
    float _323 = -_307;
    float _325 = _323 + 1.0;
    float _327 = _315 * _311;
    float _329 = _114 * _289;
    float _331 = _313 * _321;
    float _333 = _317 * _325;
    float _335 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _114 * _295;
    float _341 = _114 * _301;
    float _343 = fma(_303, _329, _331);
    float _345 = fma(_337, -0.5, 1.0);
    float _347 = fma(_305, _339, _327);
    float _349 = fma(_307, _341, _333);
    float _351 = _343 * _345;
    float _353 = _347 * _345;
    float _355 = _349 * _345;
    if (!_239)
    {
        out.m_59.x = _351;
        out.m_59.y = _353;
        out.m_59.z = _355;
        out.m_59.w = _209;
        return out;
    }
    float _357 = in.m_61.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_61.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_63.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_63.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_61.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_63.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_65.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_65.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_65.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _265 * _265;
    float _413 = fma(_263, _263, _411);
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = -_415;
    float _419 = _417 + 1.0;
    float _421 = sqrt(_419);
    float _423 = _114 * _361;
    float _425 = _114 * _367;
    float _427 = _114 * _373;
    float _429 = _114 * _379;
    float _431 = _423 * _423;
    float _433 = _114 * _385;
    float _435 = _427 * _427;
    float _437 = _114 * _391;
    float _439 = fma(_425, _425, _431);
    float _441 = _114 * _397;
    float _443 = fma(_429, _429, _435);
    float _445 = _114 * _403;
    float _447 = fma(_433, _433, _439);
    float _449 = _441 * _441;
    float _451 = fma(_437, _437, _443);
    float _453 = _114 * _409;
    float _455 = fma(_445, _445, _449);
    float _457 = rsqrt(_447);
    float _459 = fma(_453, _453, _455);
    float _461 = rsqrt(_451);
    float _463 = rsqrt(_459);
    float _465 = _265 * _461;
    float _467 = _263 * _457;
    float _469 = _427 * _465;
    float _471 = _429 * _465;
    float _473 = _437 * _465;
    float _475 = _421 * _463;
    float _477 = fma(_423, _467, _469);
    float _479 = fma(_425, _467, _471);
    float _481 = fma(_433, _467, _473);
    float _483 = fma(_441, _475, _477);
    float _485 = fma(_445, _475, _479);
    float _487 = fma(_453, _475, _481);
    float _489 = _483 * _483;
    float _491 = fma(_485, _485, _489);
    float _493 = in.m_67.x;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = fma(_487, _487, _491);
    float _501 = rsqrt(_499);
    float _503 = _485 * _501;
    float _505 = _483 * _501;
    float _507 = _487 * _501;
    float _509 = abs(_503);
    float _511 = abs(_505);
    float _513 = precise::max(_509, _511);
    float _515 = _114 * _497;
    float _517 = abs(_507);
    float _519 = precise::max(_517, _513);
    float _521 = 1.0 / _519;
    float _523 = _503 * _521;
    float _525 = _505 * _521;
    float _527 = -_521;
    float _529 = _507 * _527;
    float _531 = precise::min(_515, 1.0);
    float3 _1370 = float3(_523, _525, _529);
    float3 _535 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1370, float3(0.0), isnan(_1370)), level(_531)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1370, float3(0.0), isnan(_1370)), level(_531)).xyz;
    float _537 = _535.x;
    float _539 = _535.y;
    float _541 = _535.z;
    float _543 = in.m_69.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_69.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_69.z;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_71.x;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_71.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_71.y;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_73.z;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_73.x;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_73.y;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_75.x;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = in.m_75.y;
    float _605 = gl_FragCoord.w;
    float _607 = _603 * _605;
    float _609 = in.m_75.z;
    float _611 = gl_FragCoord.w;
    float _613 = _609 * _611;
    bool _615 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _617 = in.m_75.w;
    float _619 = gl_FragCoord.w;
    float _621 = _617 * _619;
    if (_615)
    {
        float _623 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _625 = _193 + _623;
        _253 = _625;
    }
    float _627 = _253;
    float _629 = _627;
    if (_615)
    {
        float _631 = _627 * 8.0;
        float _633 = precise::clamp(_631, 0.0, 1.0);
        _629 = _633;
    }
    float _635 = _629;
    float _637 = _114 * _547;
    float _639 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _641 = _639 + 1.0;
    float _643 = _114 * _553;
    float _645 = _114 * _559;
    float _647 = _114 * _565;
    float _649 = fma(_637, (*spvDescriptorSet0.fp_c13)._m0[0].y, _641);
    float _651 = fma(_643, (*spvDescriptorSet0.fp_c13)._m0[0].y, _641);
    float _653 = fma(_645, (*spvDescriptorSet0.fp_c13)._m0[0].y, _641);
    float _655 = _114 * _583;
    float _657 = _114 * _589;
    float _659 = _353 * _651;
    float _661 = precise::clamp(_659, 0.0, 1.0);
    float _663 = _114 * _571;
    float _665 = _355 * _653;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    float _669 = _114 * _595;
    float _671 = _351 * _649;
    float _673 = precise::clamp(_671, 0.0, 1.0);
    float _675 = _114 * _601;
    float _677 = _114 * _607;
    float _679 = _114 * _613;
    float _681 = fma(_537, 0.20999999344348907470703125, _647);
    float _683 = _114 * _577;
    float _685 = fma(_541, 0.20999999344348907470703125, _663);
    float _687 = _114 * _621;
    float _689 = _681 + _657;
    float _691 = fma(_539, 0.20999999344348907470703125, _683);
    float _693 = _685 + _655;
    float _695 = 0.0 + _227;
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = _673 * _689;
    float _701 = _691 + _669;
    float _703 = _667 * _693;
    float _705 = _697;
    if (_615)
    {
        float _707 = _697 * _635;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = fma(_699, _687, _675);
    float _713 = _661 * _701;
    float _715 = fma(_703, _687, _679);
    float _717 = 0.0 + _709;
    float _719 = precise::clamp(_717, 0.0, 1.0);
    float _721 = fma(_713, _687, _677);
    out.m_59.x = _711;
    out.m_59.y = _721;
    out.m_59.z = _715;
    out.m_59.w = _719;
    return out;
}

