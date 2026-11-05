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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_44.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.z;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_42.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_44.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_44.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = 1.0 / _74;
    float _120 = _118 * _80;
    float _122 = _118 * _86;
    float _124 = _118 * _92;
    float _126 = _118 * _98;
    float _128 = _118 * _104;
    float _130 = _118 * _110;
    float _132 = 1.0 / _120;
    float _134 = _118 * _116;
    float2 _696 = float2(_124, _122);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_696, float2(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_696, float2(0.0), isnan(_696))).w;
    float _138 = _126 * _132;
    float _140 = _128 * _132;
    float2 _713 = float2(_130, _134);
    float4 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_713, float2(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_713, float2(0.0), isnan(_713))).xyzw;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = _143.w;
    float2 _729 = float2(_138, _140);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_729, float2(0.0), isnan(_729))).x;
    float _155 = in.m_46.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_46.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_46.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_48.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_42.z;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_48.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_48.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_50.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _118 * _159;
    float _205 = _118 * _165;
    float _207 = _118 * _171;
    float _209 = _203 * _203;
    float _211 = fma(_205, _205, _209);
    float _213 = fma(_207, _207, _211);
    float _215 = _118 * _177;
    float _217 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _219 = _217 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _221 = _118 * _189;
    float _223 = rsqrt(_213);
    float _225 = 1.0 / _219;
    float _227 = in.m_52.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _203 * _223;
    float _235 = _118 * _183;
    float _237 = _205 * _223;
    float _239 = _207 * _223;
    float _241 = _215 * _233;
    float _243 = _235 * _132;
    float _245 = _118 * _201;
    float _247 = in.m_54.w;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_221, _237, _241);
    float _255 = _118 * _195;
    float _257 = fma(_255, _239, _253);
    float _259 = fma(_245, 2.0, -1.0);
    float _261 = abs(_257);
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _265 = _261 + _263;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _269 = fma(_243, (*spvDescriptorSet0.fp_c8)._m0[30].w, _267);
    float _271 = _265 * _225;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = in.m_56.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = 1.0 / _269;
    float _283 = fma(_273, -2.0, 3.0);
    float _285 = _273 * _273;
    float _287 = _283 * _285;
    float _289 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _291 = _118 * _251;
    float _293 = in.m_50.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = _136 + _259;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _151 * _301;
    float _305 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _307 = _281 * _305;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _311 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[30].w, _309);
    float _313 = precise::max(_303, 0.300000011920928955078125);
    float _315 = precise::min(_313, 0.4000000059604644775390625);
    float _317 = 1.0 / _311;
    float _319 = fma(_315, 10.00000095367431640625, -3.000000476837158203125);
    float _321 = _118 * _231;
    float _323 = _319 * _291;
    float _325 = _321 * _323;
    float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _329 = -_307;
    float _331 = fma(_317, _327, _329);
    float _333 = 0.0 + _325;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _331 * _289;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = _335 * _339;
    float _343 = _118 * _279;
    float _345 = _341 * _287;
    float _347 = _345 * _343;
    bool _351 = _347 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _353 = isnan(_347);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _359 = _355 || _357;
    float _361 = in.m_52.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_50.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_52.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_50.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_52.z;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _307;
    if (!_359)
    {
        discard_fragment();
    }
    float _393 = _118 * _297;
    float _395 = _118 * _365;
    float _397 = _118 * _371;
    float _399 = _118 * _377;
    float _401 = _118 * _383;
    float _403 = _118 * _389;
    float _405 = -_395;
    float _407 = _405 + _397;
    float _409 = -_399;
    float _411 = _409 + _401;
    float _413 = -_403;
    float _415 = _413 + _393;
    float _417 = fma(_145, _407, _395);
    float _419 = fma(_147, _411, _399);
    float _421 = fma(_149, _415, _403);
    if (!_359)
    {
        out.m_59.x = _417;
        out.m_59.y = _419;
        out.m_59.z = _421;
        out.m_59.w = _325;
        return out;
    }
    float _423 = _215 * _215;
    float _425 = fma(_221, _221, _423);
    float _427 = in.m_61.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = fma(_255, _255, _425);
    float _435 = rsqrt(_433);
    float _437 = _221 * _435;
    float _439 = _215 * _435;
    float _441 = _255 * _435;
    float _443 = abs(_437);
    float _445 = abs(_439);
    float _447 = precise::max(_443, _445);
    float _449 = _118 * _431;
    float _451 = abs(_441);
    float _453 = precise::max(_451, _447);
    float _455 = 1.0 / _453;
    float _457 = _437 * _455;
    float _459 = -_455;
    float _461 = _441 * _459;
    float _463 = precise::min(_449, 1.0);
    float _465 = _439 * _455;
    float3 _1185 = float3(_457, _465, _461);
    float3 _469 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1185, float3(0.0), isnan(_1185)), level(_463)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1185, float3(0.0), isnan(_1185)), level(_463)).xyz;
    float _471 = _469.x;
    float _473 = _469.y;
    float _475 = _469.z;
    float _477 = in.m_63.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_63.z;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_63.y;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_65.z;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_65.x;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_65.y;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_67.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_67.y;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_67.z;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_67.w;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    bool _537 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_537)
    {
        float _539 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _541 = _307 + _539;
        _391 = _541;
    }
    float _543 = _391;
    float _545 = _543;
    if (_537)
    {
        float _547 = _543 * 8.0;
        float _549 = precise::clamp(_547, 0.0, 1.0);
        _545 = _549;
    }
    float _551 = _545;
    float _553 = _118 * _481;
    float _555 = _118 * _487;
    float _557 = _118 * _499;
    float _559 = _118 * _505;
    float _561 = _118 * _511;
    float _563 = _118 * _523;
    float _565 = fma(_471, 0.20999999344348907470703125, _553);
    float _567 = _118 * _493;
    float _569 = fma(_475, 0.20999999344348907470703125, _555);
    float _571 = _118 * _517;
    float _573 = _565 + _559;
    float _575 = fma(_473, 0.20999999344348907470703125, _567);
    float _577 = _569 + _557;
    float _579 = 0.0 + _347;
    float _581 = precise::clamp(_579, 0.0, 1.0);
    float _583 = _118 * _529;
    float _585 = _575 + _561;
    float _587 = _118 * _535;
    float _589 = _417 * _573;
    float _591 = _421 * _577;
    float _593 = _419 * _585;
    float _595 = _581;
    if (_537)
    {
        float _597 = _581 * _551;
        _595 = _597;
    }
    float _599 = _595;
    float _601 = fma(_589, _587, _571);
    float _603 = fma(_591, _587, _583);
    float _605 = fma(_593, _587, _563);
    float _607 = 0.0 + _599;
    float _609 = precise::clamp(_607, 0.0, 1.0);
    out.m_59.x = _601;
    out.m_59.y = _605;
    out.m_59.z = _603;
    out.m_59.w = _609;
    return out;
}

