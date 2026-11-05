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
    sampler fp_t_tcb_10Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = _77 * _75;
    float _85 = 1.0 / _79;
    float _87 = _81 * _85;
    float _89 = _83 * _85;
    float2 _583 = float2(_87, _89);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_583, float2(0.0), isnan(_583))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_583, float2(0.0), isnan(_583))).x;
    float _93 = in.m_35.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_35.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_37.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_33.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_39.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_41.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _77 * _97;
    float _143 = _77 * _103;
    float _145 = in.m_37.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _77 * _109;
    float _153 = _141 * _141;
    float _155 = fma(_143, _143, _153);
    float _157 = fma(_151, _151, _155);
    float _159 = _77 * _115;
    float _161 = rsqrt(_157);
    float _163 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _165 = _163 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _167 = 1.0 / _165;
    float _169 = _141 * _161;
    float _171 = _77 * _149;
    float _173 = _143 * _161;
    float _175 = _151 * _161;
    float _177 = _159 * _169;
    float _179 = _77 * _121;
    float _181 = fma(_171, _173, _177);
    float _183 = _77 * _139;
    float _185 = fma(_179, _175, _181);
    float _187 = _77 * _127;
    float _189 = abs(_185);
    float _191 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _193 = _189 + _191;
    float _195 = _187 * _85;
    float _197 = _77 * _133;
    float _199 = _193 * _167;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _205 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _203);
    float _207 = -_197;
    float _209 = _207 + 1.0;
    float _211 = fma(_201, -2.0, 3.0);
    float _213 = _201 * _201;
    float _215 = _183 * _209;
    float _217 = 1.0 / _205;
    float _219 = _211 * _213;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _223 = _217 * _221;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _227 = fma(_91, (*spvDescriptorSet0.fp_c8)._m0[30].w, _225);
    float _229 = in.m_43.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _237 = 1.0 / _227;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _241 = -_223;
    float _243 = fma(_237, _239, _241);
    float _245 = _243 * _235;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = 0.0 + _215;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = _77 * _233;
    float _255 = _251 * _247;
    float _257 = _255 * _219;
    float _259 = _257 * _253;
    bool _263 = _259 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _265 = isnan(_259);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _271 = _267 || _269;
    float _273 = _159 * _159;
    float _275 = fma(_171, _171, _273);
    float _277 = _223;
    if (!_271)
    {
        discard_fragment();
    }
    float _279 = fma(_179, _179, _275);
    float _281 = in.m_45.x;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = rsqrt(_279);
    float _289 = _159 * _287;
    float _291 = _171 * _287;
    float _293 = in.m_45.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_45.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _179 * _287;
    float _307 = _77 * _285;
    float _309 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _311 = _307 + _309;
    float _313 = _77 * _297;
    float _315 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _317 = _313 + _315;
    float _319 = _77 * _303;
    float _321 = _317 * _317;
    float _323 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _325 = _319 + _323;
    float _327 = fma(_311, _311, _321);
    float _329 = fma(_325, _325, _327);
    float _331 = rsqrt(_329);
    float _333 = _317 * _331;
    float _335 = _311 * _331;
    float _337 = _325 * _331;
    float _339 = _333 * _333;
    float _341 = fma(_335, _335, _339);
    float _343 = fma(_337, _337, _341);
    float _345 = rsqrt(_343);
    float _347 = _335 * _345;
    float _349 = _333 * _345;
    float _351 = _337 * _345;
    float _353 = _289 * _289;
    float _355 = fma(_291, _291, _353);
    float _357 = fma(_305, _305, _355);
    float _359 = rsqrt(_357);
    float _361 = _289 * _359;
    float _363 = _291 * _359;
    float _365 = _305 * _359;
    float _367 = _361 * _349;
    float _369 = in.m_41.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = fma(_363, _347, _367);
    float _377 = fma(_365, _351, _375);
    float _379 = abs(_377);
    float _381 = 0.0 + _379;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = fma(_383, -2.0, 3.0);
    float _387 = _383 * _383;
    float _389 = in.m_41.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = _385 * _387;
    float _397 = in.m_39.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = -_395;
    float _405 = _403 + 1.0;
    float _407 = _77 * _373;
    float _409 = _407 * _405;
    float _411 = _77 * _393;
    float _413 = _77 * _401;
    float _415 = _411 * _405;
    float _417 = fma(_395, _413, _409);
    float _419 = in.m_39.y;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = _77 * _423;
    float _427 = fma(_395, _425, _415);
    float _429 = in.m_41.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = _77 * _433;
    float _437 = _435 * _405;
    float _439 = in.m_39.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _77 * _443;
    float _447 = fma(_395, _445, _437);
    if (!_271)
    {
        out.m_48.x = _417;
        out.m_48.y = _427;
        out.m_48.z = _447;
        out.m_48.w = _215;
        return out;
    }
    float _449 = _427 * 0.715200006961822509765625;
    float _451 = in.m_50.w;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_50.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_50.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = fma(_417, 0.2125999927520751953125, _449);
    float _471 = in.m_50.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = fma(_447, 0.072200000286102294921875, _469);
    bool _479 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _481 = 1.0 / _477;
    float _483 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_479)
    {
        float _485 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _487 = _223 + _485;
        _277 = _487;
    }
    float _489 = _277;
    float _491 = _481 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    float _495 = fma(_493, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _497 = _77 * _455;
    if (_479)
    {
        float _499 = _489 * 8.0;
        float _501 = precise::clamp(_499, 0.0, 1.0);
        _483 = _501;
    }
    float _503 = _483;
    float _505 = _77 * _461;
    float _507 = _495 * _497;
    float _509 = 0.0 + _259;
    float _511 = precise::clamp(_509, 0.0, 1.0);
    float _513 = _77 * _467;
    float _515 = _77 * _475;
    float _517 = fma(_417, _507, _505);
    float _519 = _511;
    if (_479)
    {
        float _521 = _511 * _503;
        _519 = _521;
    }
    float _523 = _519;
    float _525 = fma(_427, _507, _513);
    float _527 = fma(_447, _507, _515);
    float _529 = 0.0 + _523;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    out.m_48.x = _517;
    out.m_48.y = _525;
    out.m_48.z = _527;
    out.m_48.w = _531;
    return out;
}

