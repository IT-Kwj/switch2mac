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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _70;
    float _104 = _102 * _76;
    float _106 = _102 * _82;
    float _108 = _102 * _88;
    float _110 = _102 * _94;
    float _112 = 1.0 / _104;
    float _114 = _106 * _112;
    float _116 = _108 * _112;
    float _118 = _102 * _100;
    float2 _675 = float2(_114, _116);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_675, float2(0.0), isnan(_675))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_675, float2(0.0), isnan(_675))).x;
    float2 _686 = float2(_110, _118);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float _133 = in.m_44.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_44.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_44.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_46.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_46.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_40.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_48.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _102 * _137;
    float _183 = _102 * _143;
    float _185 = _102 * _149;
    float _187 = _181 * _181;
    float _189 = fma(_183, _183, _187);
    float _191 = fma(_185, _185, _189);
    float _193 = _102 * _155;
    float _195 = rsqrt(_191);
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _201 = _102 * _161;
    float _203 = in.m_50.w;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = 1.0 / _199;
    float _211 = _181 * _195;
    float _213 = _183 * _195;
    float _215 = _185 * _195;
    float _217 = _102 * _167;
    float _219 = _193 * _211;
    float _221 = in.m_52.w;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = fma(_201, _213, _219);
    float _229 = _102 * _173;
    float _231 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _233 = fma(_217, _215, _227);
    float _235 = _229 * _112;
    float _237 = abs(_233);
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _245 = fma(_235, (*spvDescriptorSet0.fp_c8)._m0[30].w, _243);
    float _247 = _241 * _209;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = 1.0 / _245;
    float _253 = fma(_249, -2.0, 3.0);
    float _255 = _249 * _249;
    float _257 = _253 * _255;
    float _259 = _102 * _207;
    float _261 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _263 = _251 * _261;
    float _265 = in.m_50.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _273 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[30].w, _271);
    float _275 = 1.0 / _273;
    float _277 = -_259;
    float _279 = _131 + _277;
    float _281 = _102 * _225;
    float _283 = _281 * _279;
    float _285 = 0.0 + _283;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _291 = -_263;
    float _293 = fma(_275, _289, _291);
    float _295 = _293 * _231;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _287 * _297;
    float _301 = _102 * _179;
    float _303 = _299 * _257;
    float _305 = _303 * _301;
    bool _309 = _305 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _311 = isnan(_305);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _317 = _313 || _315;
    float _319 = in.m_52.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_52.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_52.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    if (!_317)
    {
        discard_fragment();
    }
    float _337 = in.m_50.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_50.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _102 * _323;
    float _351 = _125 * _125;
    float _353 = _127 * _127;
    float _355 = _129 * _129;
    float _357 = _102 * _329;
    float _359 = _102 * _335;
    float _361 = -_351;
    float _363 = _361 + 1.0;
    float _365 = -_353;
    float _367 = _365 + 1.0;
    float _369 = -_355;
    float _371 = _369 + 1.0;
    float _373 = _349 * _363;
    float _375 = _357 * _367;
    float _377 = _359 * _371;
    float _379 = _102 * _269;
    float _381 = _102 * _341;
    float _383 = _102 * _347;
    float _385 = fma(_355, _379, _377);
    float _387 = fma(_351, _381, _373);
    float _389 = fma(_353, _383, _375);
    if (!_317)
    {
        out.m_55.x = _387;
        out.m_55.y = _389;
        out.m_55.z = _385;
        out.m_55.w = _283;
        return out;
    }
    float _391 = _193 * _193;
    float _393 = fma(_201, _201, _391);
    float _395 = fma(_217, _217, _393);
    float _397 = rsqrt(_395);
    float _399 = _201 * _397;
    float _401 = _193 * _397;
    float _403 = _217 * _397;
    float _405 = abs(_399);
    float _407 = abs(_401);
    float _409 = precise::max(_405, _407);
    float _411 = abs(_403);
    float _413 = precise::max(_411, _409);
    float _415 = 1.0 / _413;
    float _417 = -_415;
    float _419 = _403 * _417;
    float _421 = _399 * _415;
    float _423 = _401 * _415;
    float3 _1123 = float3(_421, _423, _419);
    float3 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1123, float3(0.0), isnan(_1123)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1123, float3(0.0), isnan(_1123)), level(0.0)).xyz;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _427.z;
    float _435 = _383 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _437 = _381 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _439 = in.m_57.y;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _379 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _447 = _435 * 0.715200006961822509765625;
    float _449 = in.m_57.x;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_59.x;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_59.y;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_57.z;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = fma(_437, 0.2125999927520751953125, _447);
    float _475 = in.m_59.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_61.x;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_63.y;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_61.w;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_61.y;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_61.z;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = fma(_445, 0.072200000286102294921875, _473);
    bool _513 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _515 = 1.0 / _511;
    float _517 = _102 * _443;
    float _519 = _102 * _453;
    float _521 = _515 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = _102 * _459;
    float _527 = _102 * _465;
    float _529 = _102 * _471;
    float _531 = fma(_523, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _533 = _102 * _479;
    float _535 = _102 * _485;
    float _537 = _102 * _491;
    float _539 = _102 * _497;
    float _541 = _102 * _503;
    float _543 = _102 * _509;
    float _545 = _437 * _531;
    float _547 = _435 * _531;
    float _549 = _445 * _531;
    float _551 = _445;
    if (_513)
    {
        float _553 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _555 = _263 + _553;
        _551 = _555;
    }
    float _557 = _551;
    float _559 = _305 * _537;
    float _561 = precise::clamp(_559, 0.0, 1.0);
    float _563 = _557;
    float _565 = _561;
    if (_513)
    {
        float _567 = _557 * 8.0;
        float _569 = precise::clamp(_567, 0.0, 1.0);
        _563 = _569;
    }
    float _571 = _563;
    if (_513)
    {
        float _573 = _561 * _571;
        _565 = _573;
    }
    float _575 = _565;
    float _577 = fma(_429, 0.20999999344348907470703125, _519);
    float _579 = fma(_431, 0.20999999344348907470703125, _517);
    float _581 = fma(_433, 0.20999999344348907470703125, _529);
    float _583 = _577 + _525;
    float _585 = _579 + _527;
    float _587 = _581 + _533;
    float _589 = fma(_387, _583, _545);
    float _591 = fma(_389, _585, _547);
    float _593 = fma(_385, _587, _549);
    float _595 = fma(_589, _539, _535);
    float _597 = fma(_591, _539, _541);
    float _599 = fma(_593, _539, _543);
    float _601 = 0.0 + _575;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    out.m_55.x = _595;
    out.m_55.y = _597;
    out.m_55.z = _599;
    out.m_55.w = _603;
    return out;
}

