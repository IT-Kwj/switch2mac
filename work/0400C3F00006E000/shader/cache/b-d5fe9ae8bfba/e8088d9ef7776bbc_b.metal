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
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
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
    float2 _696 = float2(_92, _94);
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_696, float2(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_696, float2(0.0), isnan(_696))).xyzw;
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
    float _155 = _90 * _111;
    float _157 = _90 * _117;
    float _159 = _90 * _123;
    float _161 = _90 * _129;
    float _163 = _155 * _155;
    float _165 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _167 = _165 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _169 = _90 * _135;
    float _171 = fma(_157, _157, _163);
    float _173 = 1.0 / _167;
    float _175 = fma(_159, _159, _171);
    float _177 = rsqrt(_175);
    float _179 = _155 * _177;
    float _181 = _157 * _177;
    float _183 = _159 * _177;
    float _185 = _161 * _179;
    float _187 = in.m_50.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = fma(_169, _181, _185);
    float _195 = _90 * _141;
    float _197 = fma(_195, _183, _193);
    float _199 = abs(_197);
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _203 = _199 + _201;
    float _205 = _203 * _173;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_207, -2.0, 3.0);
    float _211 = _207 * _207;
    float _213 = _90 * _147;
    float _215 = _209 * _211;
    float _217 = _90 * _191;
    float _219 = _105 * _213;
    float _221 = _90 * _153;
    float _223 = _221 * _219;
    float _225 = 0.0 + _223;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _227 * _215;
    float _231 = _229 * _217;
    bool _235 = _231 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _237 = isnan(_231);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _243 = _239 || _241;
    float _245 = in.m_40.z;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_40.w;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    if (!_243)
    {
        discard_fragment();
    }
    float _257 = _90 * _249;
    float _259 = _90 * _255;
    float2 _930 = float2(_257, _259);
    float2 _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_930, float2(0.0), isnan(_930))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_930, float2(0.0), isnan(_930))).xy;
    float _265 = _263.x;
    float _267 = _263.y;
    float _269 = in.m_48.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_48.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_52.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_52.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_48.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_52.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _99 * _99;
    float _307 = _101 * _101;
    float _309 = _103 * _103;
    float _311 = _90 * _273;
    float _313 = _90 * _279;
    float _315 = _90 * _285;
    float _317 = _90 * _291;
    float _319 = _90 * _297;
    float _321 = _90 * _303;
    float _323 = -_315;
    float _325 = _311 + _323;
    float _327 = -_317;
    float _329 = _313 + _327;
    float _331 = -_321;
    float _333 = _319 + _331;
    float _335 = fma(_305, _325, _315);
    float _337 = fma(_307, _329, _317);
    float _339 = fma(_309, _333, _321);
    if (!_243)
    {
        out.m_55.x = _335;
        out.m_55.y = _337;
        out.m_55.z = _339;
        out.m_55.w = _223;
        return out;
    }
    float _341 = in.m_57.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_57.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_59.y;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_57.z;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = in.m_59.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = in.m_59.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = _267 * _267;
    float _379 = fma(_265, _265, _377);
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _90 * _345;
    float _385 = _90 * _351;
    float _387 = _90 * _357;
    float _389 = -_381;
    float _391 = _389 + 1.0;
    float _393 = _383 * _383;
    float _395 = _90 * _363;
    float _397 = _387 * _387;
    float _399 = fma(_385, _385, _393);
    float _401 = _90 * _369;
    float _403 = _90 * _375;
    float _405 = sqrt(_391);
    float _407 = fma(_395, _395, _399);
    float _409 = fma(_401, _401, _397);
    float _411 = _161 * _161;
    float _413 = fma(_403, _403, _409);
    float _415 = fma(_169, _169, _411);
    float _417 = rsqrt(_407);
    float _419 = fma(_195, _195, _415);
    float _421 = rsqrt(_413);
    float _423 = rsqrt(_419);
    float _425 = _417 * _265;
    float _427 = _421 * _267;
    float _429 = _387 * _427;
    float _431 = _401 * _427;
    float _433 = _403 * _427;
    float _435 = _423 * _405;
    float _437 = fma(_383, _425, _429);
    float _439 = fma(_385, _425, _431);
    float _441 = fma(_395, _425, _433);
    float _443 = fma(_161, _435, _437);
    float _445 = fma(_169, _435, _439);
    float _447 = fma(_195, _435, _441);
    float _449 = _443 * _443;
    float _451 = in.m_61.x;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = fma(_445, _445, _449);
    float _459 = fma(_447, _447, _457);
    float _461 = rsqrt(_459);
    float _463 = _445 * _461;
    float _465 = _443 * _461;
    float _467 = _447 * _461;
    float _469 = _90 * _455;
    float _471 = abs(_463);
    float _473 = abs(_465);
    float _475 = precise::max(_471, _473);
    float _477 = precise::min(_469, 1.0);
    float _479 = abs(_467);
    float _481 = precise::max(_479, _475);
    float _483 = 1.0 / _481;
    float _485 = _463 * _483;
    float _487 = _465 * _483;
    float _489 = -_483;
    float _491 = _467 * _489;
    float3 _1267 = float3(_485, _487, _491);
    float3 _495 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1267, float3(0.0), isnan(_1267)), level(_477)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1267, float3(0.0), isnan(_1267)), level(_477)).xyz;
    float _497 = _495.x;
    float _499 = _495.y;
    float _501 = _495.z;
    float _503 = in.m_63.x;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_63.z;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_63.y;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_65.x;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_65.z;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_65.y;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = in.m_67.x;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_67.w;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = in.m_67.y;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_67.z;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = 0.0 + _231;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    bool _567 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _569 = _90 * _507;
    float _571 = _90 * _513;
    float _573 = _90 * _519;
    float _575 = fma(_497, 0.20999999344348907470703125, _569);
    float _577 = fma(_501, 0.20999999344348907470703125, _571);
    float _579 = _90 * _525;
    float _581 = _90 * _531;
    float _583 = fma(_499, 0.20999999344348907470703125, _573);
    float _585 = _90 * _537;
    float _587 = _575 + _579;
    float _589 = _577 + _581;
    float _591 = _90 * _555;
    float _593 = _583 + _585;
    float _595 = _335 * _587;
    float _597 = _339 * _589;
    float _599 = _90 * _543;
    float _601 = _90 * _549;
    float _603 = _337 * _593;
    float _605 = _90 * _561;
    float _607 = fma(_595, _601, _599);
    float _609 = fma(_603, _601, _591);
    float _611 = fma(_597, _601, _605);
    float _613 = _599;
    if (!_567)
    {
        _613 = _565;
    }
    float _615 = _613;
    bool _617 = !_567;
    float _619 = _615;
    if (!_617)
    {
        float _621 = in.m_69.w;
        float _623 = gl_FragCoord.w;
        float _625 = _621 * _623;
        float _627 = in.m_69.z;
        float _629 = gl_FragCoord.w;
        float _631 = _627 * _629;
        float _633 = _90 * _625;
        float _635 = _90 * _631;
        float _637 = 1.0 / _633;
        float _639 = _635 * _637;
        float _641 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _643 = fma(_639, (*spvDescriptorSet0.fp_c8)._m0[30].w, _641);
        float _645 = 1.0 / _643;
        float _647 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _649 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _651 = fma(_645, _647, _649);
        float _653 = _651 * 8.0;
        float _655 = precise::clamp(_653, 0.0, 1.0);
        float _657 = _565 * _655;
        _619 = _657;
    }
    float _659 = _619;
    float _661 = 0.0 + _659;
    float _663 = precise::clamp(_661, 0.0, 1.0);
    out.m_55.x = _607;
    out.m_55.y = _609;
    out.m_55.z = _611;
    out.m_55.w = _663;
    return out;
}

