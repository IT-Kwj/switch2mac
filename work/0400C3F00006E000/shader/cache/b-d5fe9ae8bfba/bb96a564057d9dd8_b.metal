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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
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
    float4 m_40 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
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
    float2 _694 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_694, float2(0.0), isnan(_694))).xyzw;
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
    float2 _786 = float2(_125, _153);
    float2 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_786, float2(0.0), isnan(_786))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_786, float2(0.0), isnan(_786))).xy;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = in.m_42.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_42.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_46.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_42.z;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_46.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _86 * _167;
    float _201 = _86 * _173;
    float _203 = _86 * _179;
    float _205 = _86 * _185;
    float _207 = _86 * _191;
    float _209 = _86 * _197;
    float _211 = -_203;
    float _213 = _199 + _211;
    float _215 = -_207;
    float _217 = _201 + _215;
    float _219 = -_209;
    float _221 = _205 + _219;
    float _223 = fma(_95, _213, _203);
    float _225 = fma(_97, _217, _207);
    float _227 = fma(_99, _221, _209);
    if (!_145)
    {
        out.m_49.x = _223;
        out.m_49.y = _225;
        out.m_49.z = _227;
        out.m_49.w = _127;
        return out;
    }
    float _229 = in.m_51.w;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = _86 * _233;
    bool _237 = _235 != 1.0;
    bool _239 = isnan(_235);
    bool _241 = _237 || _239;
    bool _243 = isnan(1.0);
    bool _245 = _241 || _243;
    bool _247 = !_245;
    if (!_247)
    {
        float _249 = gl_FragCoord.x;
        float _251 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _253 = _249 / _251;
        float _255 = gl_FragCoord.y;
        float _257 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _259 = _255 / _257;
        float _261 = _235 * 256.0;
        float _263 = trunc(_261);
        int _266 = int(_263);
        uint _269 = uint(int(uint(_266) >> uint(7)));
        int _271 = int(_269) + _266;
        float _273 = trunc(_253);
        int _275 = int(_273);
        float _277 = trunc(_259);
        int _279 = int(_277);
        int _281 = _275 + 2;
        int _283 = _281 >> 1;
        uint _285 = uint(int(uint(_279) >> uint(1)));
        int _287 = _283 ^ int(_285);
        int _289 = _287 << 16;
        int _291 = _289 ^ _283;
        int _293 = 983055 & _291;
        int _295 = _293 << 6;
        int _297 = _295 + _293;
        int _299 = _297 & 13369548;
        uint _301 = uint(int(uint(_299) >> uint(3)));
        int _303 = _299 | int(_301);
        int _305 = _303 & 5570560;
        int _307 = _303 & 85;
        uint _309 = uint(int(uint(_305) >> uint(15)));
        int _311 = int(_309) + _307;
        bool _313 = uint(_271) > uint(_311);
        if (!_313)
        {
            discard_fragment();
        }
        if (!_313)
        {
            out.m_49.x = _223;
            out.m_49.y = _225;
            out.m_49.z = _227;
            out.m_49.w = _133;
            return out;
        }
    }
    float _315 = in.m_53.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_55.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_53.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_55.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_53.z;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_55.x;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_57.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_57.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = _161 * _161;
    float _371 = fma(_159, _159, _369);
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = -_373;
    float _377 = _375 + 1.0;
    float _379 = sqrt(_377);
    float _381 = _86 * _319;
    float _383 = _86 * _325;
    float _385 = _86 * _331;
    float _387 = _86 * _337;
    float _389 = _381 * _381;
    float _391 = _86 * _343;
    float _393 = _86 * _349;
    float _395 = _387 * _387;
    float _397 = fma(_385, _385, _389);
    float _399 = _86 * _355;
    float _401 = _86 * _361;
    float _403 = fma(_393, _393, _395);
    float _405 = fma(_391, _391, _397);
    float _407 = _399 * _399;
    float _409 = _86 * _367;
    float _411 = fma(_383, _383, _403);
    float _413 = fma(_401, _401, _407);
    float _415 = rsqrt(_405);
    float _417 = fma(_409, _409, _413);
    float _419 = rsqrt(_411);
    float _421 = rsqrt(_417);
    float _423 = _415 * _161;
    float _425 = _381 * _423;
    float _427 = _419 * _159;
    float _429 = _385 * _423;
    float _431 = fma(_387, _427, _425);
    float _433 = fma(_393, _427, _429);
    float _435 = _421 * _379;
    float _437 = _391 * _423;
    float _439 = fma(_399, _435, _431);
    float _441 = fma(_383, _427, _437);
    float _443 = fma(_401, _435, _433);
    float _445 = in.m_51.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = _439 * _439;
    float _453 = fma(_409, _435, _441);
    float _455 = fma(_443, _443, _451);
    float _457 = fma(_453, _453, _455);
    float _459 = rsqrt(_457);
    float _461 = _443 * _459;
    float _463 = _439 * _459;
    float _465 = _453 * _459;
    float _467 = abs(_461);
    float _469 = abs(_463);
    float _471 = precise::max(_467, _469);
    float _473 = abs(_465);
    float _475 = precise::max(_473, _471);
    float _477 = _86 * _449;
    float _479 = 1.0 / _475;
    float _481 = precise::min(_477, 1.0);
    float _483 = _461 * _479;
    float _485 = _463 * _479;
    float _487 = -_479;
    float _489 = _465 * _487;
    float3 _1280 = float3(_483, _485, _489);
    float3 _493 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1280, float3(0.0), isnan(_1280)), level(_481)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1280, float3(0.0), isnan(_1280)), level(_481)).xyz;
    float _495 = _493.x;
    float _497 = _493.y;
    float _499 = _493.z;
    float _501 = in.m_59.y;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_61.y;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_59.z;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_59.x;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_61.z;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_61.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_63.x;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_63.w;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_63.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_63.z;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = _86 * _505;
    float _563 = _86 * _517;
    float _565 = _86 * _523;
    float _567 = fma(_497, 0.20999999344348907470703125, _561);
    float _569 = _86 * _511;
    float _571 = fma(_499, 0.20999999344348907470703125, _563);
    float _573 = fma(_495, 0.20999999344348907470703125, _565);
    float _575 = _86 * _529;
    bool _577 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _579 = _86 * _535;
    float _581 = _567 + _569;
    float _583 = _571 + _575;
    float _585 = 0.0 + _133;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    float _589 = _573 + _579;
    float _591 = _86 * _547;
    float _593 = _227 * _583;
    float _595 = _86 * _541;
    float _597 = _223 * _589;
    float _599 = _225 * _581;
    float _601 = _86 * _553;
    float _603 = _86 * _559;
    float _605 = fma(_597, _591, _595);
    float _607 = _595;
    if (!_577)
    {
        _607 = _587;
    }
    float _609 = _607;
    float _611 = fma(_599, _591, _601);
    float _613 = fma(_593, _591, _603);
    bool _615 = !_577;
    float _617 = _609;
    if (!_615)
    {
        float _619 = in.m_65.w;
        float _621 = gl_FragCoord.w;
        float _623 = _619 * _621;
        float _625 = in.m_65.z;
        float _627 = gl_FragCoord.w;
        float _629 = _625 * _627;
        float _631 = _86 * _623;
        float _633 = _86 * _629;
        float _635 = 1.0 / _631;
        float _637 = _633 * _635;
        float _639 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _641 = fma(_637, (*spvDescriptorSet0.fp_c8)._m0[30].w, _639);
        float _643 = 1.0 / _641;
        float _645 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _647 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _649 = fma(_643, _645, _647);
        float _651 = _649 * 8.0;
        float _653 = precise::clamp(_651, 0.0, 1.0);
        float _655 = _587 * _653;
        _617 = _655;
    }
    float _657 = _617;
    float _659 = 0.0 + _657;
    float _661 = precise::clamp(_659, 0.0, 1.0);
    out.m_49.x = _605;
    out.m_49.y = _611;
    out.m_49.z = _613;
    out.m_49.w = _661;
    return out;
}

