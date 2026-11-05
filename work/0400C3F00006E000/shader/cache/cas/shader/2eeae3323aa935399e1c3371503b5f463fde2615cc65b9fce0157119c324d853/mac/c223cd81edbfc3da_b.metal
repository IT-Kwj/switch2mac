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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_57 [[user(locn4), flat]];
    float4 m_51 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_53 [[user(locn8), flat]];
    float4 m_55 [[user(locn9)]];
    float4 m_49 [[user(locn10), flat]];
    float4 m_70 [[user(locn11)]];
    float4 m_76 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _85 = gl_FragCoord.w;
    float _87 = in.m_47.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_47.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _85;
    float _101 = _99 * _91;
    float _103 = _99 * _97;
    float2 _743 = float2(_101, _103);
    float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_743, float2(0.0), isnan(_743))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_743, float2(0.0), isnan(_743))).xy;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = in.m_49.x;
    float _115 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _117 = in.m_51.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_53.x;
    float _125 = in.m_47.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_55.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_55.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_51.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_51.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _113 + 1.0;
    float _163 = rint(_113);
    float _165 = precise::max(_163, 0.0);
    uint _168 = uint(_165);
    uint _170 = clamp(_168, 0u, 65535u);
    float _172 = _123 * 0.25;
    float _174 = _161 * _115;
    float _176 = _99 * _121;
    float _178 = _99 * _135;
    float _180 = _99 * _147;
    float _182 = floor(_174);
    float _184 = 1.0 / _176;
    float _186 = _99 * _153;
    float _188 = -_182;
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c9)._m0[22].x, _161);
    float _192 = _99 * _129;
    float _194 = _99 * _159;
    float _196 = rint(_190);
    float _198 = precise::max(_196, 0.0);
    uint _200 = uint(_198);
    uint _202 = clamp(_200, 0u, 65535u);
    float _204 = _194 * _184;
    float _206 = fma(_109, _172, _192);
    float _208 = fma(_109, _172, _178);
    float _210 = _99 * _141;
    float _212 = fma(_111, _172, _180);
    float _214 = fma(_111, _172, _210);
    float _216 = _186 * _184;
    float3 _902 = float3(_206, _214, float(int(_170)));
    float3 _906 = select(_902, float3(0.0), isnan(_902));
    float4 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _906.xy, uint(rint(_906.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _906.xy, uint(rint(_906.z))).xyzw;
    float _221 = _219.x;
    float _223 = _219.y;
    float _225 = _219.z;
    float _227 = _219.w;
    float3 _923 = float3(_206, _214, float(int(_202)));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float4 _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _925.xy, uint(rint(_925.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _925.xy, uint(rint(_925.z))).xyzw;
    float _231 = _229.x;
    float _233 = _229.y;
    float _235 = _229.z;
    float _237 = _229.w;
    float2 _939 = float2(_216, _204);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_939, float2(0.0), isnan(_939))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_939, float2(0.0), isnan(_939))).x;
    float2 _947 = float2(_208, _212);
    float _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_947, float2(0.0), isnan(_947))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_947, float2(0.0), isnan(_947))).w;
    float _243 = in.m_57.y;
    float _245 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _247 = in.m_51.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_59.w;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_61.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _243 * _245;
    float _267 = _265 * _245;
    float _269 = floor(_267);
    float _271 = -_269;
    float _273 = fma(_271, (*spvDescriptorSet0.fp_c9)._m0[22].y, _265);
    float _275 = _273 + 9.9999997473787516355514526367188e-05;
    float _277 = floor(_275);
    float _279 = _99 * _251;
    float _281 = in.m_63.w;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = _279 * _184;
    float _289 = -_277;
    float _291 = _275 + _289;
    float _293 = in.m_59.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = -_227;
    float _301 = _299 + _237;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _305 = fma(_287, (*spvDescriptorSet0.fp_c8)._m0[30].w, _303);
    float _307 = _99 * _257;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _311 = fma(_239, (*spvDescriptorSet0.fp_c8)._m0[30].w, _309);
    float _313 = fma(_291, _301, _227);
    float _315 = _99 * _263;
    float _317 = fma(_307, 2.0, -1.0);
    float _319 = in.m_65.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = 1.0 / _305;
    float _327 = _313 * _315;
    float _329 = _317 + _241;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _327 * _331;
    float _335 = _99 * _285;
    float _337 = 1.0 / _311;
    float _339 = precise::max(_333, 0.0500000007450580596923828125);
    float _341 = precise::min(_339, 0.699999988079071044921875);
    float _343 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _345 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _347 = _325 * _345;
    float _349 = fma(_341, 1.53846156597137451171875, -0.076923079788684844970703125);
    float _351 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _353 = -_347;
    float _355 = fma(_337, _351, _353);
    float _357 = _335 * _349;
    float _359 = 0.0 + _357;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _99 * _323;
    float _365 = _355 * _343;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _361 * _367;
    float _371 = _369 * _363;
    bool _375 = _371 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _377 = isnan(_371);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _383 = _379 || _381;
    float _385 = in.m_63.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_59.x;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_63.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_59.y;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_63.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = _347;
    if (!_383)
    {
        discard_fragment();
    }
    float _417 = -_223;
    float _419 = _417 + _233;
    float _421 = -_221;
    float _423 = _421 + _231;
    float _425 = -_225;
    float _427 = _425 + _235;
    float _429 = _99 * _297;
    float _431 = fma(_291, _419, _223);
    float _433 = fma(_291, _423, _221);
    float _435 = fma(_291, _427, _225);
    float _437 = _99 * _389;
    float _439 = _99 * _395;
    float _441 = _99 * _401;
    float _443 = _99 * _407;
    float _445 = _99 * _413;
    float _447 = -_437;
    float _449 = _447 + _439;
    float _451 = -_441;
    float _453 = _451 + _443;
    float _455 = -_445;
    float _457 = _455 + _429;
    float _459 = fma(_433, _449, _437);
    float _461 = fma(_431, _453, _441);
    float _463 = fma(_435, _457, _445);
    if (!_383)
    {
        out.m_68.x = _459;
        out.m_68.y = _461;
        out.m_68.z = _463;
        out.m_68.w = _357;
        return out;
    }
    float _465 = in.m_70.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_70.x;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_70.z;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_72.x;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = fma(_433, -1.4285714626312255859375, 1.0);
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = _99 * _469;
    float _495 = _99 * _475;
    float _497 = _99 * _481;
    float _499 = _493 * _493;
    float _501 = fma(_495, _495, _499);
    float _503 = fma(_497, _497, _501);
    float _505 = rsqrt(_503);
    float _507 = _495 * _505;
    float _509 = _493 * _505;
    float _511 = _497 * _505;
    float _513 = _99 * _487;
    float _515 = abs(_507);
    float _517 = abs(_509);
    float _519 = precise::max(_515, _517);
    float _521 = abs(_511);
    float _523 = precise::max(_521, _519);
    float _525 = 1.0 / _523;
    float _527 = fma(_491, -2.0, 3.0);
    float _529 = _491 * _491;
    float _531 = _529 * _527;
    float _533 = fma(_531, 0.800000011920928955078125, _513);
    float _535 = precise::min(_533, 1.0);
    float _537 = _507 * _525;
    float _539 = _509 * _525;
    float _541 = -_525;
    float _543 = _511 * _541;
    float3 _1387 = float3(_537, _539, _543);
    float3 _547 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1387, float3(0.0), isnan(_1387)), level(_535)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1387, float3(0.0), isnan(_1387)), level(_535)).xyz;
    float _549 = _547.x;
    float _551 = _547.y;
    float _553 = _547.z;
    float _555 = in.m_74.x;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_74.y;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_74.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_76.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_76.y;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_76.z;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_78.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_78.y;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = in.m_78.z;
    float _605 = gl_FragCoord.w;
    float _607 = _603 * _605;
    float _609 = in.m_78.w;
    float _611 = gl_FragCoord.w;
    float _613 = _609 * _611;
    float _615 = fma(_341, -1.53846156597137451171875, 1.0769231319427490234375);
    float _617 = _241 * 0.25;
    float _619 = -_513;
    float _621 = _619 + 1.0;
    bool _623 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _625 = _615 * _621;
    float _627 = _625 * 0.02624999918043613433837890625;
    float _629 = _627;
    if (_623)
    {
        float _631 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _633 = _347 + _631;
        _415 = _633;
    }
    float _635 = _415;
    float _637 = _99 * _559;
    float _639 = _99 * _565;
    float _641 = _99 * _571;
    float _643 = _617 * _637;
    float _645 = _617 * _639;
    float _647 = _617 * _641;
    float _649 = _99 * _577;
    float _651 = _99 * _583;
    float _653 = _99 * _589;
    float _655 = fma(_549, 0.20999999344348907470703125, _643);
    float _657 = fma(_551, 0.20999999344348907470703125, _645);
    float _659 = fma(_553, 0.20999999344348907470703125, _647);
    float _661 = _99 * _595;
    float _663 = fma(_627, (*spvDescriptorSet0.fp_c15)._m0[17].x, _655);
    float _665 = fma(_627, (*spvDescriptorSet0.fp_c15)._m0[17].y, _657);
    float _667 = fma(_627, (*spvDescriptorSet0.fp_c15)._m0[17].z, _659);
    float _669 = _99 * _601;
    float _671 = _99 * _607;
    float _673 = _99 * _613;
    float _675 = _663 + _649;
    float _677 = _665 + _651;
    float _679 = _667 + _653;
    float _681 = 0.0 + _371;
    float _683 = precise::clamp(_681, 0.0, 1.0);
    float _685 = _683;
    if (_623)
    {
        float _687 = _635 * 8.0;
        float _689 = precise::clamp(_687, 0.0, 1.0);
        _629 = _689;
    }
    float _691 = _629;
    float _693 = _459 * _675;
    float _695 = _461 * _677;
    float _697 = _463 * _679;
    if (_623)
    {
        float _699 = _683 * _691;
        _685 = _699;
    }
    float _701 = _685;
    float _703 = fma(_693, _673, _661);
    float _705 = fma(_695, _673, _669);
    float _707 = fma(_697, _673, _671);
    float _709 = 0.0 + _701;
    float _711 = precise::clamp(_709, 0.0, 1.0);
    out.m_68.x = _703;
    out.m_68.y = _705;
    out.m_68.z = _707;
    out.m_68.w = _711;
    return out;
}

