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
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
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
    float4 m_48 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
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
    float _114 = in.m_50.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_50.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = 1.0 / _82;
    float _128 = _126 * _88;
    float _130 = _126 * _94;
    float _132 = _126 * _100;
    float _134 = _126 * _106;
    float _136 = 1.0 / _128;
    float _138 = _126 * _112;
    float _140 = _126 * _118;
    float _142 = _126 * _124;
    float _144 = _130 * _136;
    float _146 = _132 * _136;
    float2 _812 = float2(_144, _146);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_812, float2(0.0), isnan(_812))).x;
    float2 _823 = float2(_134, _138);
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_823, float2(0.0), isnan(_823))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_823, float2(0.0), isnan(_823))).xyzw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _151.w;
    float2 _839 = float2(_140, _142);
    float4 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_839, float2(0.0), isnan(_839))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_839, float2(0.0), isnan(_839))).xyzw;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    float _171 = in.m_46.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.w;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_54.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_56.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _197 = _126 * _175;
    float _199 = _197 * _136;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_199, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = _126 * _181;
    float _207 = _126 * _193;
    float _209 = 1.0 / _203;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = _209 * _211;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = _126 * _187;
    float _221 = 1.0 / _217;
    float _223 = -_205;
    float _225 = fma(_159, _169, _223);
    float _227 = _219 * _225;
    float _229 = 0.0 + _227;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = -_213;
    float _237 = fma(_221, _233, _235);
    float _239 = _237 * _195;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _231 * _241;
    float _245 = _243 * _207;
    bool _249 = _245 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _251 = isnan(_245);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _257 = _253 || _255;
    float _259 = in.m_48.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_48.w;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _213;
    if (!_257)
    {
        discard_fragment();
    }
    float _273 = _126 * _263;
    float _275 = _126 * _269;
    float2 _1006 = float2(_273, _275);
    float2 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1006, float2(0.0), isnan(_1006))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1006, float2(0.0), isnan(_1006))).xy;
    float _281 = _279.x;
    float _283 = _279.y;
    float _285 = in.m_52.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_52.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_54.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_52.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_54.y;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_54.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _153 * _163;
    float _323 = _155 * _165;
    float _325 = _157 * _167;
    float _327 = _126 * _289;
    float _329 = _126 * _295;
    float _331 = _126 * _301;
    float _333 = _126 * _307;
    float _335 = _126 * _313;
    float _337 = _126 * _319;
    float _339 = -_331;
    float _341 = _329 + _339;
    float _343 = -_335;
    float _345 = _333 + _343;
    float _347 = -_337;
    float _349 = _327 + _347;
    float _351 = fma(_321, _341, _331);
    float _353 = fma(_323, _345, _335);
    float _355 = fma(_325, _349, _337);
    if (!_257)
    {
        out.m_59.x = _351;
        out.m_59.y = _353;
        out.m_59.z = _355;
        out.m_59.w = _227;
        return out;
    }
    float _357 = in.m_61.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_61.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_63.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_61.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_63.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_65.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_63.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_65.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_65.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _283 * _283;
    float _413 = fma(_281, _281, _411);
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _126 * _361;
    float _419 = -_415;
    float _421 = _419 + 1.0;
    float _423 = _126 * _367;
    float _425 = _126 * _373;
    float _427 = _126 * _379;
    float _429 = _126 * _385;
    float _431 = _126 * _391;
    float _433 = _425 * _425;
    float _435 = _427 * _427;
    float _437 = _126 * _397;
    float _439 = _126 * _403;
    float _441 = fma(_429, _429, _433);
    float _443 = _431 * _431;
    float _445 = fma(_417, _417, _435);
    float _447 = _126 * _409;
    float _449 = fma(_437, _437, _441);
    float _451 = fma(_439, _439, _443);
    float _453 = fma(_423, _423, _445);
    float _455 = sqrt(_421);
    float _457 = fma(_447, _447, _451);
    float _459 = rsqrt(_449);
    float _461 = rsqrt(_453);
    float _463 = rsqrt(_457);
    float _465 = _283 * _459;
    float _467 = _425 * _465;
    float _469 = _429 * _465;
    float _471 = _437 * _465;
    float _473 = _281 * _461;
    float _475 = fma(_427, _473, _467);
    float _477 = fma(_417, _473, _469);
    float _479 = fma(_423, _473, _471);
    float _481 = _455 * _463;
    float _483 = in.m_67.x;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = fma(_431, _481, _475);
    float _491 = fma(_439, _481, _477);
    float _493 = fma(_447, _481, _479);
    float _495 = _489 * _489;
    float _497 = fma(_491, _491, _495);
    float _499 = fma(_493, _493, _497);
    float _501 = rsqrt(_499);
    float _503 = _126 * _487;
    float _505 = _491 * _501;
    float _507 = _489 * _501;
    float _509 = _493 * _501;
    float _511 = precise::min(_503, 1.0);
    float _513 = abs(_505);
    float _515 = abs(_507);
    float _517 = precise::max(_513, _515);
    float _519 = abs(_509);
    float _521 = precise::max(_519, _517);
    float _523 = 1.0 / _521;
    float _525 = _505 * _523;
    float _527 = _507 * _523;
    float _529 = -_523;
    float _531 = _509 * _529;
    float3 _1373 = float3(_525, _527, _531);
    float3 _535 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1373, float3(0.0), isnan(_1373)), level(_511)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1373, float3(0.0), isnan(_1373)), level(_511)).xyz;
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
    float _615 = in.m_75.w;
    float _617 = gl_FragCoord.w;
    float _619 = _615 * _617;
    bool _621 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_621)
    {
        float _623 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _625 = _213 + _623;
        _271 = _625;
    }
    float _627 = _271;
    float _629 = _126 * _547;
    float _631 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _633 = _631 + 1.0;
    float _635 = _126 * _553;
    float _637 = _126 * _559;
    float _639 = _126 * _565;
    float _641 = fma(_629, (*spvDescriptorSet0.fp_c13)._m0[0].y, _633);
    float _643 = fma(_635, (*spvDescriptorSet0.fp_c13)._m0[0].y, _633);
    float _645 = fma(_637, (*spvDescriptorSet0.fp_c13)._m0[0].y, _633);
    float _647 = _126 * _583;
    float _649 = _126 * _589;
    float _651 = _353 * _643;
    float _653 = precise::clamp(_651, 0.0, 1.0);
    float _655 = _126 * _571;
    float _657 = _355 * _645;
    float _659 = precise::clamp(_657, 0.0, 1.0);
    float _661 = _126 * _595;
    float _663 = _351 * _641;
    float _665 = precise::clamp(_663, 0.0, 1.0);
    float _667 = _627;
    if (_621)
    {
        float _669 = _627 * 8.0;
        float _671 = precise::clamp(_669, 0.0, 1.0);
        _667 = _671;
    }
    float _673 = _667;
    float _675 = _126 * _601;
    float _677 = _126 * _607;
    float _679 = _126 * _613;
    float _681 = fma(_537, 0.20999999344348907470703125, _639);
    float _683 = _126 * _577;
    float _685 = fma(_541, 0.20999999344348907470703125, _655);
    float _687 = _126 * _619;
    float _689 = _681 + _649;
    float _691 = fma(_539, 0.20999999344348907470703125, _683);
    float _693 = _685 + _647;
    float _695 = 0.0 + _245;
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = _665 * _689;
    float _701 = _691 + _661;
    float _703 = _659 * _693;
    float _705 = _697;
    if (_621)
    {
        float _707 = _697 * _673;
        _705 = _707;
    }
    float _709 = _705;
    float _711 = fma(_699, _687, _675);
    float _713 = _653 * _701;
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

