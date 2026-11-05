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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_38.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_38.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _651 = float2(_84, _86);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_651, float2(0.0), isnan(_651))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_651, float2(0.0), isnan(_651))).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_40.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_42.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_44.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_46.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _82 * _103;
    float _125 = _82 * _109;
    float _127 = _82 * _115;
    float _129 = in.m_48.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = -_123;
    float _137 = fma(_97, _125, _135);
    float _139 = _127 * _137;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _82 * _121;
    float _145 = _141 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _147 * _143;
    bool _153 = _149 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _155 = isnan(_149);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _161 = _157 || _159;
    float _163 = in.m_48.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_48.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    if (!_161)
    {
        discard_fragment();
    }
    float _175 = _82 * _133;
    float _177 = _82 * _167;
    float _179 = _82 * _173;
    float _181 = _177 * _177;
    float _183 = fma(_175, _175, _181);
    float _185 = fma(_179, _179, _183);
    float _187 = rsqrt(_185);
    float _189 = _175 * _187;
    float _191 = _177 * _187;
    float _193 = _179 * _187;
    float _195 = abs(_189);
    float _197 = abs(_191);
    float _199 = precise::max(_195, _197);
    float _201 = abs(_193);
    float _203 = precise::max(_201, _199);
    float _205 = 1.0 / _203;
    float _207 = -_205;
    float _209 = _193 * _207;
    float _211 = _189 * _205;
    float _213 = _191 * _205;
    float3 _832 = float3(_211, _213, _209);
    float3 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_832, float3(0.0), isnan(_832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_832, float3(0.0), isnan(_832)), level(0.0)).xyz;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = _191 * _191;
    float _227 = in.m_50.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_50.x;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_50.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = fma(_189, _189, _225);
    float _247 = in.m_44.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_193, _193, _245);
    float _255 = rsqrt(_253);
    float _257 = _191 * _255;
    float _259 = _189 * _255;
    float _261 = _193 * _255;
    float _263 = _82 * _231;
    float _265 = _257 * _257;
    float _267 = _82 * _237;
    float _269 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _271 = _263 + _269;
    float _273 = fma(_259, _259, _265);
    float _275 = _82 * _243;
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _279 = _267 + _277;
    float _281 = _271 * _271;
    float _283 = fma(_261, _261, _273);
    float _285 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _287 = _275 + _285;
    float _289 = in.m_44.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = fma(_279, _279, _281);
    float _297 = in.m_44.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_40.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = rsqrt(_283);
    float _311 = fma(_287, _287, _295);
    float _313 = _82 * _251;
    float _315 = rsqrt(_311);
    float _317 = _259 * _309;
    float _319 = _257 * _309;
    float _321 = _261 * _309;
    float _323 = in.m_40.z;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_40.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = _321 * 0.577381789684295654296875;
    float _337 = _271 * _315;
    float _339 = _279 * _315;
    float _341 = fma(_319, 0.816474258899688720703125, _335);
    float _343 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _345 = _343 + 1.0;
    float _347 = _319 * _337;
    float _349 = fma(_319, 0.5, 0.5);
    float _351 = 0.0 + _341;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = _287 * _315;
    float _357 = fma(_317, _339, _347);
    float _359 = fma(_349, 0.1500000059604644775390625, 0.5);
    float _361 = fma(_353, _345, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _363 = fma(_349, -0.1500000059604644775390625, 0.5);
    float _365 = fma(_349, 0.25, 0.5);
    float _367 = fma(_349, -0.25, 0.5);
    float _369 = fma(_321, _355, _357);
    float _371 = fma(_341, 0.5, 0.5);
    float _373 = fma(_361, _359, _363);
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = -_91;
    float _379 = _377 + 1.0;
    float _381 = fma(_361, _367, _365);
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = abs(_369);
    float _387 = -_385;
    float _389 = _387 + 1.0;
    float _391 = _82 * _293;
    float _393 = _82 * _301;
    float _395 = -_93;
    float _397 = _395 + 1.0;
    float _399 = -_95;
    float _401 = _399 + 1.0;
    float _403 = _313 * _379;
    float _405 = _389 * _389;
    float _407 = _391 * _397;
    float _409 = _393 * _401;
    float _411 = _82 * _333;
    float _413 = _82 * _307;
    float _415 = _82 * _327;
    float _417 = fma(_349, 0.7000000476837158203125, 0.5);
    float _419 = fma(_349, -0.7000000476837158203125, 0.5);
    float _421 = _405 * _371;
    float _423 = fma(_91, _413, _403);
    float _425 = fma(_93, _411, _407);
    float _427 = fma(_95, _415, _409);
    float _429 = fma(_361, _419, _417);
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = fma(_423, _421, _423);
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = fma(_425, _421, _425);
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = fma(_427, _421, _427);
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _375 * _435;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _383 * _439;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = _431 * _443;
    float _455 = precise::clamp(_453, 0.0, 1.0);
    if (!_161)
    {
        out.m_53.x = _447;
        out.m_53.y = _451;
        out.m_53.z = _455;
        out.m_53.w = _147;
        return out;
    }
    float _457 = in.m_55.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_55.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_55.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_57.x;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_57.y;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = in.m_57.z;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = in.m_59.x;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_59.w;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_59.y;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    float _511 = in.m_59.z;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    bool _517 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _519 = 0.0 + _149;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    float _523 = _82 * _461;
    float _525 = _82 * _467;
    float _527 = _82 * _473;
    float _529 = fma(_219, 0.20999999344348907470703125, _523);
    float _531 = fma(_221, 0.20999999344348907470703125, _525);
    float _533 = _82 * _479;
    float _535 = _82 * _485;
    float _537 = fma(_223, 0.20999999344348907470703125, _527);
    float _539 = _82 * _491;
    float _541 = _529 + _533;
    float _543 = _531 + _535;
    float _545 = _82 * _509;
    float _547 = _537 + _539;
    float _549 = _447 * _541;
    float _551 = _451 * _543;
    float _553 = _82 * _497;
    float _555 = _82 * _503;
    float _557 = _455 * _547;
    float _559 = _82 * _515;
    float _561 = fma(_549, _555, _553);
    float _563 = fma(_551, _555, _545);
    float _565 = fma(_557, _555, _559);
    float _567 = _553;
    if (!_517)
    {
        _567 = _521;
    }
    float _569 = _567;
    bool _571 = !_517;
    float _573 = _569;
    if (!_571)
    {
        float _575 = in.m_61.w;
        float _577 = gl_FragCoord.w;
        float _579 = _575 * _577;
        float _581 = in.m_61.z;
        float _583 = gl_FragCoord.w;
        float _585 = _581 * _583;
        float _587 = _82 * _579;
        float _589 = _82 * _585;
        float _591 = 1.0 / _587;
        float _593 = _589 * _591;
        float _595 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _597 = fma(_593, (*spvDescriptorSet0.fp_c8)._m0[30].w, _595);
        float _599 = 1.0 / _597;
        float _601 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _603 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _605 = fma(_599, _601, _603);
        float _607 = _605 * 8.0;
        float _609 = precise::clamp(_607, 0.0, 1.0);
        float _611 = _521 * _609;
        _573 = _611;
    }
    float _613 = _573;
    float _615 = 0.0 + _613;
    float _617 = precise::clamp(_615, 0.0, 1.0);
    out.m_53.x = _561;
    out.m_53.y = _563;
    out.m_53.z = _565;
    out.m_53.w = _617;
    return out;
}

