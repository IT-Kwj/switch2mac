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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_46.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_46.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_48.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_50.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_50.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_48.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = 1.0 / _82;
    float _128 = _126 * _88;
    float _130 = _126 * _94;
    float _132 = _126 * _100;
    float _134 = _126 * _106;
    float _136 = _126 * _112;
    float _138 = _126 * _118;
    float _140 = 1.0 / _128;
    float _142 = _126 * _124;
    float _144 = _130 * _140;
    float _146 = _132 * _140;
    float2 _798 = float2(_146, _144);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_798, float2(0.0), isnan(_798))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_798, float2(0.0), isnan(_798))).x;
    float2 _809 = float2(_134, _142);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_809, float2(0.0), isnan(_809))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_809, float2(0.0), isnan(_809))).w;
    float2 _817 = float2(_136, _138);
    float4 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817))).xyzw;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = _153.z;
    float _161 = _153.w;
    float _163 = in.m_46.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_52.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_54.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_56.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = _126 * _167;
    float _189 = _187 * _140;
    float _191 = _126 * _173;
    float _193 = _126 * _179;
    float _195 = _126 * _185;
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _199 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[30].w, _197);
    float _201 = 1.0 / _199;
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _205 = _201 * _203;
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _209 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _207);
    float _211 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _213 = 1.0 / _209;
    float _215 = -_191;
    float _217 = fma(_161, _150, _215);
    float _219 = _193 * _217;
    float _221 = 0.0 + _219;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _227 = -_205;
    float _229 = fma(_213, _225, _227);
    float _231 = _229 * _211;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _223 * _233;
    float _237 = _235 * _195;
    bool _241 = _237 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _243 = isnan(_237);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _249 = _245 || _247;
    float _251 = in.m_50.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_50.w;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _205;
    if (!_249)
    {
        discard_fragment();
    }
    float _265 = _126 * _255;
    float _267 = _126 * _261;
    float2 _984 = float2(_265, _267);
    float2 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_984, float2(0.0), isnan(_984))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_984, float2(0.0), isnan(_984))).xy;
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = in.m_52.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_52.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_54.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_54.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_52.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_54.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _126 * _281;
    float _315 = _126 * _287;
    float _317 = _126 * _293;
    float _319 = _126 * _299;
    float _321 = _126 * _305;
    float _323 = _126 * _311;
    float _325 = -_317;
    float _327 = _313 + _325;
    float _329 = -_319;
    float _331 = _315 + _329;
    float _333 = -_323;
    float _335 = _321 + _333;
    float _337 = fma(_155, _327, _317);
    float _339 = fma(_157, _331, _319);
    float _341 = fma(_159, _335, _323);
    if (!_249)
    {
        out.m_59.x = _337;
        out.m_59.y = _339;
        out.m_59.z = _341;
        out.m_59.w = _219;
        return out;
    }
    float _343 = in.m_61.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_61.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_63.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_61.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_63.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_65.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_63.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_65.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_65.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = _275 * _275;
    float _399 = fma(_273, _273, _397);
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = _126 * _347;
    float _405 = -_401;
    float _407 = _405 + 1.0;
    float _409 = _126 * _353;
    float _411 = _126 * _359;
    float _413 = _126 * _365;
    float _415 = _126 * _371;
    float _417 = _126 * _377;
    float _419 = _411 * _411;
    float _421 = _413 * _413;
    float _423 = _126 * _383;
    float _425 = _126 * _389;
    float _427 = fma(_415, _415, _419);
    float _429 = _417 * _417;
    float _431 = fma(_403, _403, _421);
    float _433 = _126 * _395;
    float _435 = fma(_423, _423, _427);
    float _437 = fma(_425, _425, _429);
    float _439 = fma(_409, _409, _431);
    float _441 = sqrt(_407);
    float _443 = fma(_433, _433, _437);
    float _445 = rsqrt(_435);
    float _447 = rsqrt(_439);
    float _449 = rsqrt(_443);
    float _451 = _275 * _445;
    float _453 = _411 * _451;
    float _455 = _415 * _451;
    float _457 = _423 * _451;
    float _459 = _273 * _447;
    float _461 = fma(_413, _459, _453);
    float _463 = fma(_403, _459, _455);
    float _465 = fma(_409, _459, _457);
    float _467 = _441 * _449;
    float _469 = in.m_67.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = fma(_417, _467, _461);
    float _477 = fma(_425, _467, _463);
    float _479 = fma(_433, _467, _465);
    float _481 = _475 * _475;
    float _483 = fma(_477, _477, _481);
    float _485 = fma(_479, _479, _483);
    float _487 = rsqrt(_485);
    float _489 = _126 * _473;
    float _491 = _477 * _487;
    float _493 = _475 * _487;
    float _495 = _479 * _487;
    float _497 = precise::min(_489, 1.0);
    float _499 = abs(_491);
    float _501 = abs(_493);
    float _503 = precise::max(_499, _501);
    float _505 = abs(_495);
    float _507 = precise::max(_505, _503);
    float _509 = 1.0 / _507;
    float _511 = _491 * _509;
    float _513 = _493 * _509;
    float _515 = -_509;
    float _517 = _495 * _515;
    float3 _1342 = float3(_511, _513, _517);
    float3 _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1342, float3(0.0), isnan(_1342)), level(_497)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1342, float3(0.0), isnan(_1342)), level(_497)).xyz;
    float _523 = _521.x;
    float _525 = _521.y;
    float _527 = _521.z;
    float _529 = in.m_69.x;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = in.m_69.y;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_69.z;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_71.x;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_71.z;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_71.y;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_73.z;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_73.x;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_73.y;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_75.x;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_75.y;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_75.z;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    float _601 = in.m_75.w;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    bool _607 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_607)
    {
        float _609 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _611 = _205 + _609;
        _263 = _611;
    }
    float _613 = _263;
    float _615 = _126 * _533;
    float _617 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _619 = _617 + 1.0;
    float _621 = _126 * _539;
    float _623 = _126 * _545;
    float _625 = _126 * _551;
    float _627 = fma(_615, (*spvDescriptorSet0.fp_c13)._m0[0].y, _619);
    float _629 = fma(_621, (*spvDescriptorSet0.fp_c13)._m0[0].y, _619);
    float _631 = fma(_623, (*spvDescriptorSet0.fp_c13)._m0[0].y, _619);
    float _633 = _126 * _569;
    float _635 = _126 * _575;
    float _637 = _339 * _629;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    float _641 = _126 * _557;
    float _643 = _341 * _631;
    float _645 = precise::clamp(_643, 0.0, 1.0);
    float _647 = _126 * _581;
    float _649 = _337 * _627;
    float _651 = precise::clamp(_649, 0.0, 1.0);
    float _653 = _613;
    if (_607)
    {
        float _655 = _613 * 8.0;
        float _657 = precise::clamp(_655, 0.0, 1.0);
        _653 = _657;
    }
    float _659 = _653;
    float _661 = _126 * _587;
    float _663 = _126 * _593;
    float _665 = _126 * _599;
    float _667 = fma(_523, 0.20999999344348907470703125, _625);
    float _669 = _126 * _563;
    float _671 = fma(_527, 0.20999999344348907470703125, _641);
    float _673 = _126 * _605;
    float _675 = _667 + _635;
    float _677 = fma(_525, 0.20999999344348907470703125, _669);
    float _679 = _671 + _633;
    float _681 = 0.0 + _237;
    float _683 = precise::clamp(_681, 0.0, 1.0);
    float _685 = _651 * _675;
    float _687 = _677 + _647;
    float _689 = _645 * _679;
    float _691 = _683;
    if (_607)
    {
        float _693 = _683 * _659;
        _691 = _693;
    }
    float _695 = _691;
    float _697 = fma(_685, _673, _661);
    float _699 = _639 * _687;
    float _701 = fma(_689, _673, _665);
    float _703 = 0.0 + _695;
    float _705 = precise::clamp(_703, 0.0, 1.0);
    float _707 = fma(_699, _673, _663);
    out.m_59.x = _697;
    out.m_59.y = _707;
    out.m_59.z = _701;
    out.m_59.w = _705;
    return out;
}

