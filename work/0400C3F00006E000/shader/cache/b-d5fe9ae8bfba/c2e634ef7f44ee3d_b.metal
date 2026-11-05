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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_69 [[user(locn10), flat]];
    float4 m_44 [[user(locn11)]];
    float4 m_56 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
    float4 m_67 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_44.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_46.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_48.x;
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
    float _136 = 1.0 / _128;
    float _138 = _126 * _112;
    float _140 = _126 * _118;
    float _142 = _126 * _124;
    float _144 = _130 * _136;
    float _146 = _132 * _136;
    float2 _773 = float2(_144, _146);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_773, float2(0.0), isnan(_773))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_773, float2(0.0), isnan(_773))).x;
    float2 _784 = float2(_134, _138);
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_784, float2(0.0), isnan(_784))).xyzw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _151.w;
    float2 _800 = float2(_140, _142);
    float4 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_800, float2(0.0), isnan(_800))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_800, float2(0.0), isnan(_800))).xyzw;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    float _171 = in.m_44.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_50.w;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_52.w;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_54.w;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_56.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _126 * _175;
    float _203 = _201 * _136;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_203, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = 1.0 / _207;
    float _211 = _126 * _187;
    float _213 = in.m_54.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_50.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_54.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_54.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _126 * _229;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _241 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _239);
    float _243 = _126 * _181;
    float _245 = _159 * _169;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _249 = _209 * _247;
    float _251 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _253 = -_243;
    float _255 = fma(_245, _211, _253);
    float _257 = _126 * _193;
    float _259 = _257 * _255;
    float _261 = 1.0 / _241;
    float _263 = 0.0 + _259;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = -_249;
    float _271 = fma(_261, _267, _269);
    float _273 = _271 * _251;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _126 * _199;
    float _279 = _265 * _275;
    float _281 = _279 * _277;
    bool _285 = _281 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _287 = isnan(_281);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _293 = _289 || _291;
    float _295 = in.m_50.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_50.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_52.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _249;
    if (!_293)
    {
        discard_fragment();
    }
    float _315 = in.m_52.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_52.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = _153 * _153;
    float _329 = _163 * _163;
    float _331 = _155 * _155;
    float _333 = _165 * _165;
    float _335 = _126 * _223;
    float _337 = _327 * _329;
    float _339 = _167 * _167;
    float _341 = _331 * _333;
    float _343 = _157 * _157;
    float _345 = _126 * _217;
    float _347 = _343 * _339;
    float _349 = _126 * _299;
    float _351 = _126 * _305;
    float _353 = _126 * _235;
    float _355 = -_345;
    float _357 = _349 + _355;
    float _359 = -_237;
    float _361 = _351 + _359;
    float _363 = -_353;
    float _365 = _335 + _363;
    float _367 = fma(_347, _357, _345);
    float _369 = fma(_337, _361, _237);
    float _371 = _126 * _311;
    float _373 = fma(_341, _365, _353);
    float _375 = _126 * _319;
    float _377 = _126 * _325;
    float _379 = _369 * _371;
    float _381 = _373 * _375;
    float _383 = _367 * _377;
    if (!_293)
    {
        out.m_59.x = _379;
        out.m_59.y = _381;
        out.m_59.z = _383;
        out.m_59.w = _259;
        return out;
    }
    float _385 = in.m_61.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_61.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_61.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_63.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = _126 * _389;
    float _411 = _126 * _395;
    float _413 = _126 * _401;
    float _415 = _409 * _409;
    float _417 = fma(_411, _411, _415);
    float _419 = fma(_413, _413, _417);
    float _421 = rsqrt(_419);
    float _423 = _411 * _421;
    float _425 = _409 * _421;
    float _427 = _413 * _421;
    float _429 = abs(_423);
    float _431 = abs(_425);
    float _433 = precise::max(_429, _431);
    float _435 = abs(_427);
    float _437 = precise::max(_435, _433);
    float _439 = _126 * _407;
    float _441 = 1.0 / _437;
    float _443 = precise::min(_439, 1.0);
    float _445 = _423 * _441;
    float _447 = _425 * _441;
    float _449 = -_441;
    float _451 = _427 * _449;
    float3 _1216 = float3(_445, _447, _451);
    float3 _455 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1216, float3(0.0), isnan(_1216)), level(_443)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1216, float3(0.0), isnan(_1216)), level(_443)).xyz;
    float _457 = _455.x;
    float _459 = _455.y;
    float _461 = _455.z;
    float _463 = in.m_65.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_65.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_67.y;
    float _477 = in.m_67.x;
    float _479 = in.m_65.z;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_67.z;
    float _487 = in.m_69.x;
    float _489 = in.m_71.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_71.y;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_73.x;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_73.w;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_75.w;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_71.x;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = _126 * _467;
    float _527 = _126 * _473;
    float _529 = in.m_75.z;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = -_475;
    float _537 = _525 + _535;
    float _539 = -_477;
    float _541 = _527 + _539;
    float _543 = _126 * _483;
    float _545 = _487 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _547 = _537 * _537;
    float _549 = in.m_75.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = -_485;
    float _557 = _543 + _555;
    float _559 = fma(_541, _541, _547);
    float _561 = _126 * _493;
    float _563 = in.m_75.x;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    bool _569 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _571 = fma(_557, _557, _559);
    float _573 = _126 * _523;
    float _575 = _126 * _505;
    float _577 = -_571;
    float _579 = fma(_545, _545, _577);
    float _581 = precise::max(0.0, _579);
    if (_569)
    {
        float _583 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _585 = _249 + _583;
        _313 = _585;
    }
    float _587 = _313;
    float _589 = sqrt(_581);
    float _591 = _126 * _533;
    float _593 = in.m_73.y;
    float _595 = gl_FragCoord.w;
    float _597 = _593 * _595;
    float _599 = _271 + _589;
    float _601 = _126 * _517;
    float _603 = _126 * _567;
    float _605 = in.m_73.z;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = _126 * _553;
    float _613 = -_601;
    float _615 = _613 + _599;
    float _617 = _126 * _499;
    float _619 = _126 * _511;
    float _621 = _615 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _623 = _621 * (-1.44269502162933349609375);
    float _625 = exp2(_623);
    float _627 = _126 * _597;
    float _629 = -_625;
    float _631 = _629 + 1.0;
    float _633 = precise::clamp(_631, 0.0, 1.0);
    float _635 = _126 * _609;
    float _637 = _281 * _633;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    float _641 = fma(_461, 0.20999999344348907470703125, _591);
    float _643 = fma(_457, 0.20999999344348907470703125, _603);
    float _645 = fma(_459, 0.20999999344348907470703125, _611);
    float _647 = _641 + _561;
    float _649 = _643 + _573;
    float _651 = _645 + _617;
    float _653 = _641;
    float _655 = _639;
    if (_569)
    {
        float _657 = _587 * 8.0;
        float _659 = precise::clamp(_657, 0.0, 1.0);
        _653 = _659;
    }
    float _661 = _653;
    float _663 = _383 * _647;
    float _665 = _379 * _649;
    float _667 = _381 * _651;
    if (_569)
    {
        float _669 = _639 * _661;
        _655 = _669;
    }
    float _671 = _655;
    float _673 = fma(_663, _619, _635);
    float _675 = fma(_665, _619, _575);
    float _677 = fma(_667, _619, _627);
    float _679 = 0.0 + _671;
    float _681 = precise::clamp(_679, 0.0, 1.0);
    out.m_59.x = _675;
    out.m_59.y = _677;
    out.m_59.z = _673;
    out.m_59.w = _681;
    return out;
}

