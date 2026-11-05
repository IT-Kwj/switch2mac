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
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
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
    float2 _605 = float2(_116, _118);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_605, float2(0.0), isnan(_605))).x;
    float2 _616 = float2(_110, _114);
    float4 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).xyzw;
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
    float _151 = in.m_48.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _159 = _102 * _137;
    float _161 = _159 * _112;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_161, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = _102 * _143;
    float _169 = 1.0 / _165;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _169 * _171;
    float _175 = _102 * _155;
    float _177 = in.m_46.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_50.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_50.z;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_44.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_44.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_44.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = _102 * _187;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _217 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[30].w, _215);
    float _219 = _131 * _167;
    float _221 = _102 * _149;
    float _223 = 1.0 / _217;
    float _225 = _221 * _219;
    float _227 = 0.0 + _225;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _233 = -_173;
    float _235 = fma(_223, _231, _233);
    float _237 = _235 * _157;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _229 * _239;
    float _243 = _241 * _175;
    bool _247 = _243 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _249 = isnan(_243);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _255 = _251 || _253;
    float _257 = in.m_46.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_50.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_46.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = _102;
    if (!_255)
    {
        discard_fragment();
    }
    float _277 = _102 * _181;
    float _279 = _125 * _125;
    float _281 = _127 * _127;
    float _283 = _129 * _129;
    float _285 = _102 * _261;
    float _287 = _102 * _267;
    float _289 = _102 * _273;
    float _291 = _102 * _193;
    float _293 = -_287;
    float _295 = _285 + _293;
    float _297 = -_213;
    float _299 = _289 + _297;
    float _301 = -_291;
    float _303 = _277 + _301;
    float _305 = fma(_279, _295, _287);
    float _307 = fma(_281, _299, _213);
    float _309 = fma(_283, _303, _291);
    float _311 = _102 * _199;
    float _313 = _102 * _205;
    float _315 = _102 * _211;
    float _317 = _305 * _311;
    float _319 = _307 * _313;
    float _321 = _309 * _315;
    if (!_255)
    {
        out.m_53.x = _317;
        out.m_53.y = _319;
        out.m_53.z = _321;
        out.m_53.w = _225;
        return out;
    }
    float _323 = in.m_55.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_55.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_55.z;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _102 * _327;
    float _343 = _102 * _333;
    float _345 = _102 * _339;
    float _347 = _341 * _341;
    float _349 = in.m_57.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = fma(_343, _343, _347);
    float _357 = fma(_345, _345, _355);
    float _359 = rsqrt(_357);
    float _361 = _343 * _359;
    float _363 = _341 * _359;
    float _365 = _345 * _359;
    float _367 = _102 * _353;
    float _369 = abs(_361);
    float _371 = abs(_363);
    float _373 = precise::max(_369, _371);
    float _375 = precise::min(_367, 1.0);
    float _377 = abs(_365);
    float _379 = precise::max(_377, _373);
    float _381 = 1.0 / _379;
    float _383 = _361 * _381;
    float _385 = _363 * _381;
    float _387 = -_381;
    float _389 = _365 * _387;
    float3 _998 = float3(_383, _385, _389);
    float3 _393 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_998, float3(0.0), isnan(_998)), level(_375)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_998, float3(0.0), isnan(_998)), level(_375)).xyz;
    float _395 = _393.x;
    float _397 = _393.y;
    float _399 = _393.z;
    float _401 = in.m_59.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_59.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_59.y;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_61.x;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_61.y;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_61.z;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_63.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_63.y;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_63.z;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_63.w;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    bool _461 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _463 = _102 * _405;
    float _465 = _102 * _411;
    float _467 = _102 * _423;
    float _469 = _102 * _429;
    float _471 = _102 * _435;
    float _473 = _102 * _447;
    float _475 = _102 * _459;
    float _477 = fma(_395, 0.20999999344348907470703125, _463);
    float _479 = _102 * _417;
    float _481 = _102 * _441;
    float _483 = _102 * _453;
    float _485 = fma(_399, 0.20999999344348907470703125, _465);
    float _487 = fma(_397, 0.20999999344348907470703125, _479);
    if (_461)
    {
        float _489 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _491 = _173 + _489;
        _275 = _491;
    }
    float _493 = _275;
    float _495 = _477 + _467;
    float _497 = _485 + _471;
    float _499 = _487 + _469;
    float _501 = 0.0 + _243;
    float _503 = precise::clamp(_501, 0.0, 1.0);
    float _505 = _493;
    float _507 = _503;
    if (_461)
    {
        float _509 = _493 * 8.0;
        float _511 = precise::clamp(_509, 0.0, 1.0);
        _505 = _511;
    }
    float _513 = _505;
    float _515 = _317 * _495;
    float _517 = _319 * _499;
    float _519 = _321 * _497;
    if (_461)
    {
        float _521 = _503 * _513;
        _507 = _521;
    }
    float _523 = _507;
    float _525 = fma(_515, _475, _481);
    float _527 = fma(_517, _475, _473);
    float _529 = fma(_519, _475, _483);
    float _531 = 0.0 + _523;
    float _533 = precise::clamp(_531, 0.0, 1.0);
    out.m_53.x = _525;
    out.m_53.y = _527;
    out.m_53.z = _529;
    out.m_53.w = _533;
    return out;
}

