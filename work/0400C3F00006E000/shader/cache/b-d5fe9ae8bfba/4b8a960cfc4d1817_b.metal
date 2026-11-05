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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_44 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_61 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _76;
    float _92 = _90 * _82;
    float _94 = _90 * _88;
    float2 _730 = float2(_92, _94);
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_730, float2(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_730, float2(0.0), isnan(_730))).xyzw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = _97.w;
    float _107 = in.m_42.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_42.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_42.z;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_44.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_44.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_44.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_48.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_50.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _90 * _111;
    float _163 = _90 * _117;
    float _165 = _90 * _123;
    float _167 = _90 * _129;
    float _169 = _161 * _161;
    float _171 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _173 = _171 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _175 = _90 * _135;
    float _177 = fma(_163, _163, _169);
    float _179 = 1.0 / _173;
    float _181 = fma(_165, _165, _177);
    float _183 = rsqrt(_181);
    float _185 = _161 * _183;
    float _187 = _163 * _183;
    float _189 = _165 * _183;
    float _191 = _167 * _185;
    float _193 = fma(_175, _187, _191);
    float _195 = _90 * _141;
    float _197 = in.m_52.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = fma(_195, _189, _193);
    float _205 = abs(_203);
    float _207 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _209 = _205 + _207;
    float _211 = _209 * _179;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _90 * _147;
    float _217 = fma(_213, -2.0, 3.0);
    float _219 = _213 * _213;
    float _221 = _90 * _153;
    float _223 = _217 * _219;
    float _225 = -_215;
    float _227 = fma(_105, _221, _225);
    float _229 = _90 * _159;
    float _231 = _90 * _201;
    float _233 = _229 * _227;
    float _235 = 0.0 + _233;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _237 * _223;
    float _241 = _239 * _231;
    bool _245 = _241 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _247 = isnan(_241);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _253 = _249 || _251;
    float _255 = in.m_40.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_40.w;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    if (!_253)
    {
        discard_fragment();
    }
    float _267 = _90 * _259;
    float _269 = _90 * _265;
    float2 _977 = float2(_267, _269);
    float2 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_977, float2(0.0), isnan(_977))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_977, float2(0.0), isnan(_977))).xy;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = in.m_46.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_46.y;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_46.z;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_50.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_50.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_50.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_48.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_48.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_48.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = _90 * _283;
    float _335 = _90 * _289;
    float _337 = _90 * _295;
    float _339 = _90 * _301;
    float _341 = _90 * _307;
    float _343 = _90 * _313;
    float _345 = -_339;
    float _347 = _333 + _345;
    float _349 = -_341;
    float _351 = _335 + _349;
    float _353 = -_343;
    float _355 = _337 + _353;
    float _357 = fma(_99, _347, _339);
    float _359 = fma(_101, _351, _341);
    float _361 = fma(_103, _355, _343);
    float _363 = _90 * _319;
    float _365 = _90 * _325;
    float _367 = _90 * _331;
    float _369 = _357 * _363;
    float _371 = _359 * _365;
    float _373 = _361 * _367;
    if (!_253)
    {
        out.m_55.x = _369;
        out.m_55.y = _371;
        out.m_55.z = _373;
        out.m_55.w = _233;
        return out;
    }
    float _375 = in.m_57.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_57.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_59.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_57.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_59.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _277 * _277;
    float _413 = fma(_275, _275, _411);
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _90 * _379;
    float _419 = _90 * _385;
    float _421 = _90 * _391;
    float _423 = -_415;
    float _425 = _423 + 1.0;
    float _427 = _417 * _417;
    float _429 = _90 * _397;
    float _431 = _421 * _421;
    float _433 = fma(_419, _419, _427);
    float _435 = _90 * _403;
    float _437 = _90 * _409;
    float _439 = sqrt(_425);
    float _441 = fma(_429, _429, _433);
    float _443 = fma(_435, _435, _431);
    float _445 = _167 * _167;
    float _447 = fma(_437, _437, _443);
    float _449 = fma(_175, _175, _445);
    float _451 = rsqrt(_441);
    float _453 = fma(_195, _195, _449);
    float _455 = rsqrt(_447);
    float _457 = rsqrt(_453);
    float _459 = _451 * _275;
    float _461 = _455 * _277;
    float _463 = _421 * _461;
    float _465 = _435 * _461;
    float _467 = _437 * _461;
    float _469 = _457 * _439;
    float _471 = fma(_417, _459, _463);
    float _473 = fma(_419, _459, _465);
    float _475 = fma(_429, _459, _467);
    float _477 = in.m_61.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = fma(_167, _469, _471);
    float _485 = fma(_175, _469, _473);
    float _487 = fma(_195, _469, _475);
    float _489 = _483 * _483;
    float _491 = fma(_485, _485, _489);
    float _493 = fma(_487, _487, _491);
    float _495 = rsqrt(_493);
    float _497 = _90 * _481;
    float _499 = _485 * _495;
    float _501 = _483 * _495;
    float _503 = _487 * _495;
    float _505 = precise::min(_497, 1.0);
    float _507 = abs(_499);
    float _509 = abs(_501);
    float _511 = precise::max(_507, _509);
    float _513 = abs(_503);
    float _515 = precise::max(_513, _511);
    float _517 = 1.0 / _515;
    float _519 = _499 * _517;
    float _521 = _501 * _517;
    float _523 = -_517;
    float _525 = _503 * _523;
    float3 _1344 = float3(_519, _521, _525);
    float3 _529 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1344, float3(0.0), isnan(_1344)), level(_505)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1344, float3(0.0), isnan(_1344)), level(_505)).xyz;
    float _531 = _529.x;
    float _533 = _529.y;
    float _535 = _529.z;
    float _537 = in.m_63.x;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_63.z;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_63.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_65.x;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_65.z;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_65.y;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_67.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_67.w;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_67.y;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_67.z;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = 0.0 + _241;
    float _599 = precise::clamp(_597, 0.0, 1.0);
    bool _601 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _603 = _90 * _541;
    float _605 = _90 * _547;
    float _607 = _90 * _553;
    float _609 = fma(_531, 0.20999999344348907470703125, _603);
    float _611 = fma(_535, 0.20999999344348907470703125, _605);
    float _613 = _90 * _559;
    float _615 = _90 * _565;
    float _617 = fma(_533, 0.20999999344348907470703125, _607);
    float _619 = _90 * _571;
    float _621 = _609 + _613;
    float _623 = _611 + _615;
    float _625 = _90 * _589;
    float _627 = _617 + _619;
    float _629 = _369 * _621;
    float _631 = _373 * _623;
    float _633 = _90 * _577;
    float _635 = _90 * _583;
    float _637 = _371 * _627;
    float _639 = _90 * _595;
    float _641 = fma(_629, _635, _633);
    float _643 = fma(_637, _635, _625);
    float _645 = fma(_631, _635, _639);
    float _647 = _633;
    if (!_601)
    {
        _647 = _599;
    }
    float _649 = _647;
    bool _651 = !_601;
    float _653 = _649;
    if (!_651)
    {
        float _655 = in.m_69.w;
        float _657 = gl_FragCoord.w;
        float _659 = _655 * _657;
        float _661 = in.m_69.z;
        float _663 = gl_FragCoord.w;
        float _665 = _661 * _663;
        float _667 = _90 * _659;
        float _669 = _90 * _665;
        float _671 = 1.0 / _667;
        float _673 = _669 * _671;
        float _675 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _677 = fma(_673, (*spvDescriptorSet0.fp_c8)._m0[30].w, _675);
        float _679 = 1.0 / _677;
        float _681 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _683 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _685 = fma(_679, _681, _683);
        float _687 = _685 * 8.0;
        float _689 = precise::clamp(_687, 0.0, 1.0);
        float _691 = _599 * _689;
        _653 = _691;
    }
    float _693 = _653;
    float _695 = 0.0 + _693;
    float _697 = precise::clamp(_695, 0.0, 1.0);
    out.m_55.x = _641;
    out.m_55.y = _643;
    out.m_55.z = _645;
    out.m_55.w = _697;
    return out;
}

