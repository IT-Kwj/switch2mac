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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_55 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_53 [[user(locn8), flat]];
    float4 m_66 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
    float4 m_74 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _81 = gl_FragCoord.w;
    float _83 = in.m_47.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_47.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_49.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_49.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_49.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_51.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_51.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = 1.0 / _81;
    float _127 = _125 * _87;
    float _129 = _125 * _93;
    float _131 = _125 * _99;
    float _133 = _125 * _105;
    float _135 = _125 * _111;
    float _137 = _125 * _117;
    float _139 = _125 * _123;
    float2 _658 = float2(_127, _129);
    float2 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).xy;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = 1.0 / _131;
    float _151 = _133 * _149;
    float _153 = _135 * _149;
    float2 _681 = float2(_151, _153);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_681, float2(0.0), isnan(_681))).x;
    float2 _689 = float2(_139, _137);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_689, float2(0.0), isnan(_689))).w;
    float _159 = in.m_53.y;
    float _161 = in.m_55.x;
    float _163 = in.m_47.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_47.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = rint(_159);
    float _177 = precise::max(_175, 0.0);
    uint _180 = uint(_177);
    uint _182 = clamp(_180, 0u, 65535u);
    float _184 = _161 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _186 = _161 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _188 = _125 * _167;
    float _190 = _125 * _173;
    float _192 = fma(_186, _147, _188);
    float _194 = fma(_184, _145, _190);
    float3 _754 = float3(_194, _192, float(int(_182)));
    float3 _758 = select(_754, float3(0.0), isnan(_754));
    float4 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _758.xy, uint(rint(_758.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _758.xy, uint(rint(_758.z))).xyzw;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = _197.z;
    float _205 = _197.w;
    float _207 = in.m_49.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_57.w;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_59.w;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_61.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = _125 * _211;
    float _233 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _235 = _125 * _217;
    float _237 = _231 * _149;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _241 = fma(_237, (*spvDescriptorSet0.fp_c8)._m0[30].w, _239);
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _245 = fma(_155, (*spvDescriptorSet0.fp_c8)._m0[30].w, _243);
    float _247 = 1.0 / _241;
    float _249 = 1.0 / _245;
    float _251 = in.m_57.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_57.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = _205 + _157;
    float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _267 = _247 * _265;
    float _269 = _125 * _229;
    float _271 = -_235;
    float _273 = _263 + _271;
    float _275 = _125 * _223;
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _279 = -_267;
    float _281 = fma(_249, _277, _279);
    float _283 = _275 * _273;
    float _285 = _281 * _233;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = 0.0 + _283;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _291 * _287;
    float _295 = _293 * _269;
    bool _299 = _295 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _301 = isnan(_295);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _307 = _303 || _305;
    float _309 = in.m_57.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_59.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_59.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_59.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    if (!_307)
    {
        discard_fragment();
    }
    float _333 = _125 * _261;
    float _335 = _125 * _313;
    float _337 = _125 * _255;
    float _339 = _125 * _319;
    float _341 = _125 * _325;
    float _343 = _125 * _331;
    float _345 = -_339;
    float _347 = _335 + _345;
    float _349 = -_341;
    float _351 = _337 + _349;
    float _353 = -_343;
    float _355 = _333 + _353;
    float _357 = fma(_199, _347, _339);
    float _359 = fma(_201, _351, _341);
    float _361 = fma(_203, _355, _343);
    if (!_307)
    {
        out.m_64.x = _357;
        out.m_64.y = _359;
        out.m_64.z = _361;
        out.m_64.w = _283;
        return out;
    }
    float _363 = in.m_66.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_66.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_66.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _125 * _367;
    float _383 = _125 * _373;
    float _385 = _125 * _379;
    float _387 = _381 * _381;
    float _389 = in.m_68.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = fma(_383, _383, _387);
    float _397 = fma(_385, _385, _395);
    float _399 = rsqrt(_397);
    float _401 = _383 * _399;
    float _403 = _381 * _399;
    float _405 = _385 * _399;
    float _407 = _125 * _393;
    float _409 = abs(_401);
    float _411 = abs(_403);
    float _413 = precise::max(_409, _411);
    float _415 = precise::min(_407, 1.0);
    float _417 = abs(_405);
    float _419 = precise::max(_417, _413);
    float _421 = 1.0 / _419;
    float _423 = _401 * _421;
    float _425 = _403 * _421;
    float _427 = -_421;
    float _429 = _405 * _427;
    float3 _1091 = float3(_423, _425, _429);
    float3 _433 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1091, float3(0.0), isnan(_1091)), level(_415)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1091, float3(0.0), isnan(_1091)), level(_415)).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = in.m_70.x;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_70.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_70.y;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_72.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_72.x;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_72.y;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_74.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_74.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_74.z;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_74.w;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    bool _501 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _503 = _125 * _445;
    float _505 = _125 * _457;
    float _507 = _125 * _463;
    float _509 = _125 * _469;
    float _511 = _125 * _475;
    float _513 = _125 * _487;
    float _515 = _125 * _493;
    float _517 = fma(_435, 0.20999999344348907470703125, _503);
    float _519 = _125 * _451;
    float _521 = fma(_437, 0.20999999344348907470703125, _505);
    float _523 = _125 * _481;
    float _525 = _517 + _509;
    float _527 = fma(_439, 0.20999999344348907470703125, _519);
    float _529 = _519;
    if (_501)
    {
        float _531 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _533 = _267 + _531;
        _529 = _533;
    }
    float _535 = _529;
    float _537 = _521 + _511;
    float _539 = _125 * _499;
    float _541 = _527 + _507;
    float _543 = 0.0 + _295;
    float _545 = precise::clamp(_543, 0.0, 1.0);
    float _547 = _535;
    float _549 = _545;
    if (_501)
    {
        float _551 = _535 * 8.0;
        float _553 = precise::clamp(_551, 0.0, 1.0);
        _547 = _553;
    }
    float _555 = _547;
    float _557 = _357 * _525;
    float _559 = _359 * _537;
    float _561 = _361 * _541;
    if (_501)
    {
        float _563 = _545 * _555;
        _549 = _563;
    }
    float _565 = _549;
    float _567 = fma(_557, _539, _523);
    float _569 = fma(_559, _539, _513);
    float _571 = fma(_561, _539, _515);
    float _573 = 0.0 + _565;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    out.m_64.x = _567;
    out.m_64.y = _569;
    out.m_64.z = _571;
    out.m_64.w = _575;
    return out;
}

