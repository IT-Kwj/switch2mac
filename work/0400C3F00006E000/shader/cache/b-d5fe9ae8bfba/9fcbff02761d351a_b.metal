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
    float4 m_55 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
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
    float2 _614 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_614, float2(0.0), isnan(_614))).xyzw;
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
    float _115 = _86 * _107;
    float _117 = _101 * _115;
    float _119 = _86 * _113;
    float _121 = 0.0 + _117;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _123 * _119;
    bool _129 = _125 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _137 = _133 || _135;
    float _139 = in.m_40.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_40.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    if (!_137)
    {
        discard_fragment();
    }
    float _151 = _86 * _143;
    float _153 = _86 * _149;
    float2 _706 = float2(_151, _153);
    float2 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_706, float2(0.0), isnan(_706))).xy;
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
    float _181 = in.m_46.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_42.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_46.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _97 * _97;
    float _201 = _99 * _99;
    float _203 = _95 * _95;
    float _205 = _86 * _167;
    float _207 = _86 * _173;
    float _209 = _86 * _179;
    float _211 = _86 * _185;
    float _213 = _86 * _191;
    float _215 = _86 * _197;
    float _217 = -_209;
    float _219 = _205 + _217;
    float _221 = -_211;
    float _223 = _207 + _221;
    float _225 = -_215;
    float _227 = _213 + _225;
    float _229 = fma(_203, _219, _209);
    float _231 = fma(_199, _223, _211);
    float _233 = fma(_201, _227, _215);
    if (!_137)
    {
        out.m_49.x = _229;
        out.m_49.y = _231;
        out.m_49.z = _233;
        out.m_49.w = _117;
        return out;
    }
    float _235 = in.m_51.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_51.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_51.z;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_53.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_53.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_53.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_55.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_55.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_55.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _161 * _161;
    float _291 = fma(_159, _159, _289);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = -_293;
    float _297 = _295 + 1.0;
    float _299 = sqrt(_297);
    float _301 = _86 * _239;
    float _303 = _86 * _245;
    float _305 = _86 * _251;
    float _307 = _86 * _257;
    float _309 = _301 * _301;
    float _311 = _86 * _269;
    float _313 = _86 * _275;
    float _315 = _86 * _281;
    float _317 = fma(_303, _303, _309);
    float _319 = _86 * _263;
    float _321 = _307 * _307;
    float _323 = _313 * _313;
    float _325 = fma(_305, _305, _317);
    float _327 = _86 * _287;
    float _329 = fma(_319, _319, _321);
    float _331 = fma(_315, _315, _323);
    float _333 = fma(_311, _311, _329);
    float _335 = fma(_327, _327, _331);
    float _337 = rsqrt(_325);
    float _339 = rsqrt(_333);
    float _341 = rsqrt(_335);
    float _343 = _339 * _161;
    float _345 = _337 * _159;
    float _347 = in.m_57.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = _307 * _343;
    float _355 = _319 * _343;
    float _357 = _311 * _343;
    float _359 = _341 * _299;
    float _361 = fma(_301, _345, _353);
    float _363 = fma(_303, _345, _355);
    float _365 = fma(_305, _345, _357);
    float _367 = fma(_313, _359, _361);
    float _369 = fma(_315, _359, _363);
    float _371 = fma(_327, _359, _365);
    float _373 = _367 * _367;
    float _375 = fma(_369, _369, _373);
    float _377 = fma(_371, _371, _375);
    float _379 = rsqrt(_377);
    float _381 = _369 * _379;
    float _383 = _367 * _379;
    float _385 = _371 * _379;
    float _387 = abs(_381);
    float _389 = abs(_383);
    float _391 = precise::max(_387, _389);
    float _393 = abs(_385);
    float _395 = precise::max(_393, _391);
    float _397 = _86 * _351;
    float _399 = 1.0 / _395;
    float _401 = _383 * _399;
    float _403 = _381 * _399;
    float _405 = -_399;
    float _407 = _385 * _405;
    float _409 = precise::min(_397, 1.0);
    float3 _1073 = float3(_403, _401, _407);
    float3 _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1073, float3(0.0), isnan(_1073)), level(_409)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1073, float3(0.0), isnan(_1073)), level(_409)).xyz;
    float _415 = _413.x;
    float _417 = _413.y;
    float _419 = _413.z;
    float _421 = in.m_59.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_59.y;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_59.z;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_61.y;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_61.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_61.x;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_63.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_63.w;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_63.y;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_63.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = _86 * _425;
    float _483 = _86 * _431;
    float _485 = _86 * _437;
    bool _487 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _489 = fma(_417, 0.20999999344348907470703125, _483);
    float _491 = fma(_419, 0.20999999344348907470703125, _485);
    float _493 = _86 * _443;
    float _495 = fma(_415, 0.20999999344348907470703125, _481);
    float _497 = _86 * _449;
    float _499 = _86 * _455;
    float _501 = _489 + _493;
    float _503 = _86 * _479;
    float _505 = _491 + _497;
    float _507 = _495 + _499;
    float _509 = _231 * _501;
    float _511 = 0.0 + _125;
    float _513 = precise::clamp(_511, 0.0, 1.0);
    float _515 = _233 * _505;
    float _517 = _229 * _507;
    float _519 = _86 * _461;
    float _521 = _86 * _467;
    float _523 = _86 * _473;
    float _525 = fma(_517, _521, _519);
    float _527 = fma(_509, _521, _523);
    float _529 = fma(_515, _521, _503);
    float _531 = _519;
    if (!_487)
    {
        _531 = _513;
    }
    float _533 = _531;
    bool _535 = !_487;
    float _537 = _533;
    if (!_535)
    {
        float _539 = in.m_65.w;
        float _541 = gl_FragCoord.w;
        float _543 = _539 * _541;
        float _545 = in.m_65.z;
        float _547 = gl_FragCoord.w;
        float _549 = _545 * _547;
        float _551 = _86 * _543;
        float _553 = _86 * _549;
        float _555 = 1.0 / _551;
        float _557 = _553 * _555;
        float _559 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _561 = fma(_557, (*spvDescriptorSet0.fp_c8)._m0[30].w, _559);
        float _563 = 1.0 / _561;
        float _565 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _569 = fma(_563, _565, _567);
        float _571 = _569 * 8.0;
        float _573 = precise::clamp(_571, 0.0, 1.0);
        float _575 = _513 * _573;
        _537 = _575;
    }
    float _577 = _537;
    float _579 = 0.0 + _577;
    float _581 = precise::clamp(_579, 0.0, 1.0);
    out.m_49.x = _525;
    out.m_49.y = _527;
    out.m_49.z = _529;
    out.m_49.w = _581;
    return out;
}

