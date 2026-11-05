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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_53 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_51 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _710 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710))).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float _103 = in.m_42.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_44.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_40.z;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _86 * _107;
    float _123 = _86 * _113;
    float _125 = _86 * _119;
    float _127 = _101 * _121;
    float _129 = 0.0 + _127;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _131 * _123;
    bool _137 = _133 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _145 = _141 || _143;
    float _147 = in.m_40.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    if (!_145)
    {
        discard_fragment();
    }
    float _153 = _86 * _151;
    float2 _802 = float2(_125, _153);
    float2 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_802, float2(0.0), isnan(_802))).xy;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = in.m_46.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_46.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_46.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_42.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_42.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_42.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _95 * _95;
    float _201 = _97 * _97;
    float _203 = _99 * _99;
    float _205 = -_201;
    float _207 = _205 + 1.0;
    float _209 = -_203;
    float _211 = _209 + 1.0;
    float _213 = _86 * _167;
    float _215 = _86 * _173;
    float _217 = _86 * _179;
    float _219 = -_199;
    float _221 = _219 + 1.0;
    float _223 = _215 * _207;
    float _225 = _217 * _211;
    float _227 = _213 * _221;
    float _229 = _86 * _185;
    float _231 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _86 * _191;
    float _237 = _86 * _197;
    float _239 = fma(_201, _229, _223);
    float _241 = fma(_233, -0.5, 1.0);
    float _243 = fma(_199, _235, _227);
    float _245 = fma(_203, _237, _225);
    float _247 = _239 * _241;
    float _249 = _243 * _241;
    float _251 = _245 * _241;
    if (!_145)
    {
        out.m_49.x = _249;
        out.m_49.y = _247;
        out.m_49.z = _251;
        out.m_49.w = _127;
        return out;
    }
    float _253 = in.m_51.w;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _86 * _257;
    bool _261 = _259 != 1.0;
    bool _263 = isnan(_259);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    bool _271 = !_269;
    if (!_271)
    {
        float _273 = gl_FragCoord.x;
        float _275 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _277 = _273 / _275;
        float _279 = gl_FragCoord.y;
        float _281 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _283 = _279 / _281;
        float _285 = _259 * 256.0;
        float _287 = trunc(_285);
        int _290 = int(_287);
        uint _293 = uint(int(uint(_290) >> uint(7)));
        int _295 = int(_293) + _290;
        float _297 = trunc(_277);
        int _299 = int(_297);
        float _301 = trunc(_283);
        int _303 = int(_301);
        int _305 = _299 + 2;
        int _307 = _305 >> 1;
        uint _309 = uint(int(uint(_303) >> uint(1)));
        int _311 = _307 ^ int(_309);
        int _313 = _311 << 16;
        int _315 = _313 ^ _307;
        int _317 = 983055 & _315;
        int _319 = _317 << 6;
        int _321 = _319 + _317;
        int _323 = _321 & 13369548;
        uint _325 = uint(int(uint(_323) >> uint(3)));
        int _327 = _323 | int(_325);
        int _329 = _327 & 5570560;
        int _331 = _327 & 85;
        uint _333 = uint(int(uint(_329) >> uint(15)));
        int _335 = int(_333) + _331;
        bool _337 = uint(_295) > uint(_335);
        if (!_337)
        {
            discard_fragment();
        }
        if (!_337)
        {
            out.m_49.x = _249;
            out.m_49.y = _247;
            out.m_49.z = _251;
            out.m_49.w = _133;
            return out;
        }
    }
    float _339 = in.m_53.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_55.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_53.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_55.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_53.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_55.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_57.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_57.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_57.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = _161 * _161;
    float _395 = fma(_159, _159, _393);
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = -_397;
    float _401 = _399 + 1.0;
    float _403 = sqrt(_401);
    float _405 = _86 * _343;
    float _407 = _86 * _349;
    float _409 = _86 * _355;
    float _411 = _86 * _361;
    float _413 = _405 * _405;
    float _415 = _86 * _367;
    float _417 = _86 * _373;
    float _419 = _411 * _411;
    float _421 = fma(_409, _409, _413);
    float _423 = _86 * _379;
    float _425 = _86 * _385;
    float _427 = fma(_417, _417, _419);
    float _429 = fma(_415, _415, _421);
    float _431 = _423 * _423;
    float _433 = _86 * _391;
    float _435 = fma(_407, _407, _427);
    float _437 = fma(_425, _425, _431);
    float _439 = rsqrt(_429);
    float _441 = fma(_433, _433, _437);
    float _443 = rsqrt(_435);
    float _445 = rsqrt(_441);
    float _447 = _439 * _161;
    float _449 = _405 * _447;
    float _451 = _443 * _159;
    float _453 = _409 * _447;
    float _455 = fma(_411, _451, _449);
    float _457 = fma(_417, _451, _453);
    float _459 = _445 * _403;
    float _461 = _415 * _447;
    float _463 = fma(_423, _459, _455);
    float _465 = fma(_407, _451, _461);
    float _467 = fma(_425, _459, _457);
    float _469 = in.m_51.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = _463 * _463;
    float _477 = fma(_433, _459, _465);
    float _479 = fma(_467, _467, _475);
    float _481 = fma(_477, _477, _479);
    float _483 = rsqrt(_481);
    float _485 = _467 * _483;
    float _487 = _463 * _483;
    float _489 = _477 * _483;
    float _491 = abs(_485);
    float _493 = abs(_487);
    float _495 = precise::max(_491, _493);
    float _497 = abs(_489);
    float _499 = precise::max(_497, _495);
    float _501 = _86 * _473;
    float _503 = 1.0 / _499;
    float _505 = precise::min(_501, 1.0);
    float _507 = _485 * _503;
    float _509 = _487 * _503;
    float _511 = -_503;
    float _513 = _489 * _511;
    float3 _1328 = float3(_507, _509, _513);
    float3 _517 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1328, float3(0.0), isnan(_1328)), level(_505)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1328, float3(0.0), isnan(_1328)), level(_505)).xyz;
    float _519 = _517.x;
    float _521 = _517.y;
    float _523 = _517.z;
    float _525 = in.m_59.x;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_59.y;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_59.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_61.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_61.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_61.z;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_63.x;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_63.y;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_63.z;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_65.x;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_65.w;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_65.y;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_65.z;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _605 = _603 + 1.0;
    float _607 = _86 * _529;
    float _609 = _86 * _535;
    float _611 = _86 * _541;
    float _613 = fma(_607, (*spvDescriptorSet0.fp_c13)._m0[0].y, _605);
    float _615 = fma(_609, (*spvDescriptorSet0.fp_c13)._m0[0].y, _605);
    float _617 = fma(_611, (*spvDescriptorSet0.fp_c13)._m0[0].y, _605);
    float _619 = _86 * _553;
    float _621 = _249 * _613;
    float _623 = precise::clamp(_621, 0.0, 1.0);
    float _625 = _86 * _547;
    float _627 = _86 * _559;
    float _629 = _251 * _617;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    float _633 = _86 * _565;
    float _635 = _86 * _577;
    float _637 = _247 * _615;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    float _641 = _86 * _583;
    float _643 = _86 * _601;
    float _645 = fma(_519, 0.20999999344348907470703125, _625);
    float _647 = fma(_521, 0.20999999344348907470703125, _619);
    float _649 = fma(_523, 0.20999999344348907470703125, _627);
    float _651 = _86 * _571;
    float _653 = _645 + _633;
    float _655 = _86 * _595;
    float _657 = _649 + _635;
    float _659 = _647 + _651;
    float _661 = _86 * _589;
    float _663 = _623 * _653;
    float _665 = _631 * _657;
    float _667 = _639 * _659;
    float _669 = fma(_663, _661, _641);
    float _671 = fma(_665, _661, _643);
    float _673 = fma(_667, _661, _655);
    float _675 = 0.0 + _133;
    float _677 = precise::clamp(_675, 0.0, 1.0);
    out.m_49.x = _669;
    out.m_49.y = _673;
    out.m_49.z = _671;
    out.m_49.w = _677;
    return out;
}

