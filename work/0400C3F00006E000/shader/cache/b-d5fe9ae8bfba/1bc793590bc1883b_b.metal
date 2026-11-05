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
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
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
    float _114 = _102 * _100;
    float _116 = _106 * _112;
    float _118 = _108 * _112;
    float2 _609 = float2(_116, _118);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float2 _620 = float2(_110, _114);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).xyzw;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _123.w;
    float _133 = in.m_40.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_44.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_46.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_48.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_50.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _165 = _102 * _137;
    float _167 = _165 * _112;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c8)._m0[30].w, _169);
    float _173 = _102 * _143;
    float _175 = 1.0 / _171;
    float _177 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _179 = _175 * _177;
    float _181 = _102 * _161;
    float _183 = in.m_44.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_48.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_46.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_46.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_46.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _215 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[30].w, _213);
    float _217 = _102 * _149;
    float _219 = 1.0 / _215;
    float _221 = -_173;
    float _223 = fma(_131, _217, _221);
    float _225 = _102 * _155;
    float _227 = _225 * _223;
    float _229 = 0.0 + _227;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = -_179;
    float _237 = fma(_219, _233, _235);
    float _239 = _237 * _163;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _231 * _241;
    float _245 = _243 * _181;
    bool _249 = _245 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _251 = isnan(_245);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _257 = _253 || _255;
    float _259 = in.m_44.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_48.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_48.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_44.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = _102;
    if (!_257)
    {
        discard_fragment();
    }
    float _285 = _102 * _263;
    float _287 = _102 * _269;
    float _289 = _102 * _187;
    float _291 = _102 * _275;
    float _293 = _102 * _281;
    float _295 = _102 * _193;
    float _297 = -_287;
    float _299 = _285 + _297;
    float _301 = -_291;
    float _303 = _289 + _301;
    float _305 = -_295;
    float _307 = _293 + _305;
    float _309 = fma(_125, _299, _287);
    float _311 = fma(_127, _303, _291);
    float _313 = _102 * _199;
    float _315 = fma(_129, _307, _295);
    float _317 = _102 * _205;
    float _319 = _102 * _211;
    float _321 = _309 * _313;
    float _323 = _311 * _317;
    float _325 = _315 * _319;
    if (!_257)
    {
        out.m_53.x = _321;
        out.m_53.y = _323;
        out.m_53.z = _325;
        out.m_53.w = _227;
        return out;
    }
    float _327 = in.m_55.y;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_55.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_55.z;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = _102 * _331;
    float _347 = _102 * _337;
    float _349 = _102 * _343;
    float _351 = _345 * _345;
    float _353 = in.m_57.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = fma(_347, _347, _351);
    float _361 = fma(_349, _349, _359);
    float _363 = rsqrt(_361);
    float _365 = _347 * _363;
    float _367 = _345 * _363;
    float _369 = _349 * _363;
    float _371 = _102 * _357;
    float _373 = abs(_365);
    float _375 = abs(_367);
    float _377 = precise::max(_373, _375);
    float _379 = precise::min(_371, 1.0);
    float _381 = abs(_369);
    float _383 = precise::max(_381, _377);
    float _385 = 1.0 / _383;
    float _387 = _365 * _385;
    float _389 = _367 * _385;
    float _391 = -_385;
    float _393 = _369 * _391;
    float3 _1006 = float3(_387, _389, _393);
    float3 _397 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1006, float3(0.0), isnan(_1006)), level(_379)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1006, float3(0.0), isnan(_1006)), level(_379)).xyz;
    float _399 = _397.x;
    float _401 = _397.y;
    float _403 = _397.z;
    float _405 = in.m_59.x;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_59.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_59.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_61.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_61.y;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_61.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_63.x;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_63.y;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_63.z;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_63.w;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    bool _465 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _467 = _102 * _409;
    float _469 = _102 * _415;
    float _471 = _102 * _427;
    float _473 = _102 * _433;
    float _475 = _102 * _439;
    float _477 = _102 * _451;
    float _479 = _102 * _463;
    float _481 = fma(_399, 0.20999999344348907470703125, _467);
    float _483 = _102 * _421;
    float _485 = _102 * _445;
    float _487 = _102 * _457;
    float _489 = fma(_403, 0.20999999344348907470703125, _469);
    float _491 = fma(_401, 0.20999999344348907470703125, _483);
    if (_465)
    {
        float _493 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _495 = _179 + _493;
        _283 = _495;
    }
    float _497 = _283;
    float _499 = _481 + _471;
    float _501 = _489 + _475;
    float _503 = _491 + _473;
    float _505 = 0.0 + _245;
    float _507 = precise::clamp(_505, 0.0, 1.0);
    float _509 = _497;
    float _511 = _507;
    if (_465)
    {
        float _513 = _497 * 8.0;
        float _515 = precise::clamp(_513, 0.0, 1.0);
        _509 = _515;
    }
    float _517 = _509;
    float _519 = _321 * _499;
    float _521 = _323 * _503;
    float _523 = _325 * _501;
    if (_465)
    {
        float _525 = _507 * _517;
        _511 = _525;
    }
    float _527 = _511;
    float _529 = fma(_519, _479, _485);
    float _531 = fma(_521, _479, _477);
    float _533 = fma(_523, _479, _487);
    float _535 = 0.0 + _527;
    float _537 = precise::clamp(_535, 0.0, 1.0);
    out.m_53.x = _529;
    out.m_53.y = _531;
    out.m_53.z = _533;
    out.m_53.w = _537;
    return out;
}

