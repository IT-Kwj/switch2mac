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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
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
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_45 [[user(locn7), flat]];
    float4 m_60 [[user(locn8)]];
    float4 m_66 [[user(locn9)]];
    float4 m_62 [[user(locn10)]];
    float4 m_68 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _75 = gl_FragCoord.w;
    float _77 = in.m_43.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_43.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_43.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_45.x;
    float _97 = in.m_47.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _75;
    float _111 = rint(_95);
    float _113 = precise::max(_111, 0.0);
    uint _116 = uint(_113);
    uint _118 = clamp(_116, 0u, 65535u);
    float _120 = _109 * _81;
    float _122 = _109 * _87;
    float _124 = _109 * _93;
    float _126 = _109 * _101;
    float _128 = _109 * _107;
    float _130 = 1.0 / _120;
    float _132 = _122 * _130;
    float _134 = _124 * _130;
    float2 _639 = float2(_134, _132);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_639, float2(0.0), isnan(_639))).x;
    float3 _652 = float3(_128, _126, float(int(_118)));
    float3 _656 = select(_652, float3(0.0), isnan(_652));
    float4 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _656.xy, uint(rint(_656.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _656.xy, uint(rint(_656.z))).xyzw;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _139.w;
    float _149 = in.m_43.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_49.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_51.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_53.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_55.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _181 = _109 * _153;
    float _183 = _181 * _130;
    float _185 = _109 * _171;
    float _187 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _189 = fma(_183, (*spvDescriptorSet0.fp_c8)._m0[30].w, _187);
    float _191 = _109 * _159;
    float _193 = 1.0 / _189;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _197 = _193 * _195;
    float _199 = in.m_53.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_51.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_49.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_49.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = _109 * _203;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _227 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _225);
    float _229 = 1.0 / _227;
    float _231 = _147 * _191;
    float _233 = _109 * _165;
    float _235 = _233 * _231;
    float _237 = _109 * _177;
    float _239 = _185 * _235;
    float _241 = 0.0 + _239;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _247 = -_197;
    float _249 = fma(_229, _245, _247);
    float _251 = _249 * _179;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _243 * _253;
    float _257 = _255 * _237;
    bool _261 = _257 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _263 = isnan(_257);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _269 = _265 || _267;
    float _271 = in.m_51.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_53.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_51.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_53.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _109;
    if (!_269)
    {
        discard_fragment();
    }
    float _297 = in.m_49.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _109 * _209;
    float _305 = _109 * _275;
    float _307 = _109 * _281;
    float _309 = _109 * _287;
    float _311 = _109 * _293;
    float _313 = -_307;
    float _315 = _305 + _313;
    float _317 = -_223;
    float _319 = _309 + _317;
    float _321 = -_311;
    float _323 = _303 + _321;
    float _325 = fma(_141, _315, _307);
    float _327 = fma(_143, _319, _223);
    float _329 = fma(_145, _323, _311);
    float _331 = _109 * _215;
    float _333 = _109 * _221;
    float _335 = _327 * _331;
    float _337 = _109 * _301;
    float _339 = _329 * _333;
    float _341 = _325 * _337;
    if (!_269)
    {
        out.m_58.x = _341;
        out.m_58.y = _335;
        out.m_58.z = _339;
        out.m_58.w = _239;
        return out;
    }
    float _343 = in.m_60.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_60.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_60.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = _109 * _347;
    float _363 = _109 * _353;
    float _365 = _109 * _359;
    float _367 = _361 * _361;
    float _369 = in.m_62.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = fma(_363, _363, _367);
    float _377 = fma(_365, _365, _375);
    float _379 = rsqrt(_377);
    float _381 = _363 * _379;
    float _383 = _361 * _379;
    float _385 = _365 * _379;
    float _387 = _109 * _373;
    float _389 = abs(_381);
    float _391 = abs(_383);
    float _393 = precise::max(_389, _391);
    float _395 = precise::min(_387, 1.0);
    float _397 = abs(_385);
    float _399 = precise::max(_397, _393);
    float _401 = 1.0 / _399;
    float _403 = _381 * _401;
    float _405 = _383 * _401;
    float _407 = -_401;
    float _409 = _385 * _407;
    float3 _1039 = float3(_403, _405, _409);
    float3 _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1039, float3(0.0), isnan(_1039)), level(_395)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1039, float3(0.0), isnan(_1039)), level(_395)).xyz;
    float _415 = _413.x;
    float _417 = _413.y;
    float _419 = _413.z;
    float _421 = in.m_64.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_64.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_64.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_66.x;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_66.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_66.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_68.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_68.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_68.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_68.w;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    bool _481 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _483 = _109 * _425;
    float _485 = _109 * _431;
    float _487 = _109 * _443;
    float _489 = _109 * _449;
    float _491 = _109 * _455;
    float _493 = _109 * _467;
    float _495 = _109 * _479;
    float _497 = fma(_415, 0.20999999344348907470703125, _483);
    float _499 = _109 * _437;
    float _501 = _109 * _461;
    float _503 = _109 * _473;
    float _505 = fma(_419, 0.20999999344348907470703125, _485);
    float _507 = fma(_417, 0.20999999344348907470703125, _499);
    if (_481)
    {
        float _509 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _511 = _197 + _509;
        _295 = _511;
    }
    float _513 = _295;
    float _515 = _497 + _487;
    float _517 = _505 + _491;
    float _519 = _507 + _489;
    float _521 = 0.0 + _257;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = _513;
    float _527 = _523;
    if (_481)
    {
        float _529 = _513 * 8.0;
        float _531 = precise::clamp(_529, 0.0, 1.0);
        _525 = _531;
    }
    float _533 = _525;
    float _535 = _341 * _515;
    float _537 = _335 * _519;
    float _539 = _339 * _517;
    if (_481)
    {
        float _541 = _523 * _533;
        _527 = _541;
    }
    float _543 = _527;
    float _545 = fma(_535, _495, _501);
    float _547 = fma(_537, _495, _493);
    float _549 = fma(_539, _495, _503);
    float _551 = 0.0 + _543;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    out.m_58.x = _545;
    out.m_58.y = _547;
    out.m_58.z = _549;
    out.m_58.w = _553;
    return out;
}

