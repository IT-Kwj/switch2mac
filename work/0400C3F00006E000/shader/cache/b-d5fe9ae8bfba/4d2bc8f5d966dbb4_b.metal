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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_68 [[user(locn3), flat]];
    float4 m_74 [[user(locn4)]];
    float4 m_76 [[user(locn5)]];
    float4 m_45 [[user(locn6), flat]];
    float4 m_64 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_66 [[user(locn9)]];
    float4 m_51 [[user(locn10), flat]];
    float4 m_57 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_70 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = in.m_45.x;
    float _85 = gl_FragCoord.w;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _89 = in.m_49.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_49.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_49.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _83 + 1.0;
    float _115 = 1.0 / _85;
    float _117 = _113 * _87;
    float _119 = rint(_83);
    float _121 = precise::max(_119, 0.0);
    uint _124 = uint(_121);
    uint _126 = clamp(_124, 0u, 65535u);
    float _128 = floor(_117);
    float _130 = _115 * _93;
    float _132 = _115 * _105;
    float _134 = _115 * _111;
    float _136 = -_128;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c9)._m0[22].x, _113);
    float _140 = _115 * _99;
    float _142 = rint(_138);
    float _144 = precise::max(_142, 0.0);
    uint _146 = uint(_144);
    uint _148 = clamp(_146, 0u, 65535u);
    float3 _787 = float3(_130, _140, float(int(_126)));
    float3 _791 = select(_787, float3(0.0), isnan(_787));
    float4 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _791.xy, uint(rint(_791.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _791.xy, uint(rint(_791.z))).xyzw;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _151.w;
    float3 _808 = float3(_130, _140, float(int(_148)));
    float3 _810 = select(_808, float3(0.0), isnan(_808));
    float4 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _810.xy, uint(rint(_810.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _810.xy, uint(rint(_810.z))).xyzw;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    float2 _825 = float2(_134, _132);
    float4 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_825, float2(0.0), isnan(_825))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_825, float2(0.0), isnan(_825))).xyzw;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = _171.w;
    float _181 = in.m_51.y;
    float _183 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _185 = in.m_53.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_55.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _181 * _183;
    float _199 = _197 * _183;
    float _201 = floor(_199);
    float _203 = -_201;
    float _205 = fma(_203, (*spvDescriptorSet0.fp_c9)._m0[22].y, _197);
    float _207 = _205 + 9.9999997473787516355514526367188e-05;
    float _209 = floor(_207);
    float _211 = -_209;
    float _213 = _207 + _211;
    float _215 = in.m_57.w;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_57.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = _115 * _219;
    float _229 = 1.0 / _227;
    float _231 = -_159;
    float _233 = _231 + _169;
    float _235 = fma(_213, _233, _159);
    float _237 = _115 * _189;
    float _239 = _235 * _179;
    float _241 = _239 * _237;
    float _243 = _115 * _195;
    float _245 = 0.0 + _241;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _247 * _243;
    bool _253 = _249 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _255 = isnan(_249);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _261 = _257 || _259;
    if (!_261)
    {
        discard_fragment();
    }
    float _263 = in.m_57.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _115 * _225;
    float _271 = _269 * _229;
    float _273 = _115 * _267;
    float _275 = _273 * _229;
    float2 _973 = float2(_271, _275);
    float _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_973, float2(0.0), isnan(_973))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_973, float2(0.0), isnan(_973))).x;
    float _279 = in.m_53.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_59.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_53.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_59.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_53.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_59.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = -_153;
    float _317 = _315 + _163;
    float _319 = -_155;
    float _321 = _319 + _165;
    float _323 = -_157;
    float _325 = _323 + _167;
    float _327 = fma(_213, _317, _153);
    float _329 = fma(_213, _321, _155);
    float _331 = fma(_213, _325, _157);
    float _333 = _327 * _173;
    float _335 = _329 * _175;
    float _337 = _331 * _177;
    float _339 = _115 * _283;
    float _341 = _115 * _289;
    float _343 = _115 * _295;
    float _345 = _115 * _301;
    float _347 = _115 * _307;
    float _349 = _115 * _313;
    float _351 = -_341;
    float _353 = _339 + _351;
    float _355 = -_345;
    float _357 = _343 + _355;
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = fma(_333, _353, _341);
    float _365 = fma(_335, _357, _345);
    float _367 = fma(_337, _361, _349);
    if (!_261)
    {
        out.m_62.x = _363;
        out.m_62.y = _365;
        out.m_62.z = _367;
        out.m_62.w = _241;
        return out;
    }
    float _369 = in.m_64.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_64.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_64.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = _115 * _373;
    float _389 = _115 * _379;
    float _391 = _115 * _385;
    float _393 = _387 * _387;
    float _395 = fma(_389, _389, _393);
    float _397 = fma(_391, _391, _395);
    float _399 = rsqrt(_397);
    float _401 = _389 * _399;
    float _403 = _387 * _399;
    float _405 = _391 * _399;
    float _407 = abs(_401);
    float _409 = abs(_403);
    float _411 = precise::max(_407, _409);
    float _413 = abs(_405);
    float _415 = precise::max(_413, _411);
    float _417 = 1.0 / _415;
    float _419 = -_417;
    float _421 = _405 * _419;
    float _423 = _401 * _417;
    float _425 = _403 * _417;
    float3 _1195 = float3(_423, _425, _421);
    float3 _429 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1195, float3(0.0), isnan(_1195)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1195, float3(0.0), isnan(_1195)), level(0.0)).xyz;
    float _431 = _429.x;
    float _433 = _429.y;
    float _435 = _429.z;
    float _437 = in.m_66.y;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_66.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_68.y;
    float _451 = in.m_68.x;
    float _453 = in.m_66.z;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_57.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_68.z;
    float _467 = in.m_70.x;
    float _469 = in.m_72.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_72.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_72.z;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_74.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_74.w;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = _115 * _441;
    float _501 = _115 * _447;
    float _503 = -_449;
    float _505 = _499 + _503;
    float _507 = -_451;
    float _509 = _501 + _507;
    float _511 = _115 * _457;
    float _513 = _115 * _463;
    float _515 = _505 * _505;
    float _517 = _467 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _519 = -_465;
    float _521 = _511 + _519;
    float _523 = _513 * _229;
    float _525 = fma(_509, _509, _515);
    float _527 = in.m_76.w;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _535 = fma(_277, (*spvDescriptorSet0.fp_c8)._m0[30].w, _533);
    float _537 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _539 = fma(_523, (*spvDescriptorSet0.fp_c8)._m0[30].w, _537);
    float _541 = fma(_521, _521, _525);
    float _543 = in.m_76.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_76.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = 1.0 / _539;
    float _557 = -_541;
    float _559 = fma(_517, _517, _557);
    float _561 = in.m_76.z;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = _115 * _485;
    float _569 = precise::max(0.0, _559);
    float _571 = 1.0 / _535;
    bool _573 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _575 = _115 * _473;
    float _577 = _115 * _491;
    float _579 = sqrt(_569);
    float _581 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _583 = _555 * _581;
    float _585 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _587 = -_583;
    float _589 = fma(_571, _585, _587);
    float _591 = _583;
    if (_573)
    {
        float _593 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _595 = _583 + _593;
        _591 = _595;
    }
    float _597 = _591;
    float _599 = _597;
    if (_573)
    {
        float _601 = _597 * 8.0;
        float _603 = precise::clamp(_601, 0.0, 1.0);
        _599 = _603;
    }
    float _605 = _599;
    float _607 = _115 * _547;
    float _609 = _115 * _553;
    float _611 = _579 + _589;
    float _613 = _115 * _531;
    float _615 = in.m_74.y;
    float _617 = gl_FragCoord.w;
    float _619 = _615 * _617;
    float _621 = in.m_74.z;
    float _623 = gl_FragCoord.w;
    float _625 = _621 * _623;
    float _627 = _115 * _565;
    float _629 = -_613;
    float _631 = _629 + _611;
    float _633 = _115 * _479;
    float _635 = _115 * _497;
    float _637 = _631 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _639 = _637 * (-1.44269502162933349609375);
    float _641 = exp2(_639);
    float _643 = _115 * _619;
    float _645 = -_641;
    float _647 = _645 + 1.0;
    float _649 = precise::clamp(_647, 0.0, 1.0);
    float _651 = _115 * _625;
    float _653 = _249 * _649;
    float _655 = precise::clamp(_653, 0.0, 1.0);
    float _657 = _655;
    if (_573)
    {
        float _659 = _655 * _605;
        _657 = _659;
    }
    float _661 = _657;
    float _663 = 0.0 + _661;
    float _665 = precise::clamp(_663, 0.0, 1.0);
    float _667 = fma(_431, 0.20999999344348907470703125, _607);
    float _669 = fma(_433, 0.20999999344348907470703125, _609);
    float _671 = fma(_435, 0.20999999344348907470703125, _627);
    float _673 = _667 + _575;
    float _675 = _669 + _633;
    float _677 = _671 + _567;
    float _679 = _363 * _673;
    float _681 = _365 * _675;
    float _683 = _367 * _677;
    float _685 = fma(_679, _635, _577);
    float _687 = fma(_681, _635, _643);
    float _689 = fma(_683, _635, _651);
    out.m_62.x = _685;
    out.m_62.y = _687;
    out.m_62.z = _689;
    out.m_62.w = _665;
    return out;
}

