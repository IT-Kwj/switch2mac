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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_63 [[user(locn3), flat]];
    float4 m_71 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_52 [[user(locn11)]];
    float4 m_50 [[user(locn12)]];
    float4 m_65 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _635 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).xyzw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = _99.w;
    float _109 = in.m_44.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_46.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_48.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_50.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _92 * _113;
    float _135 = _92 * _119;
    float _137 = _92 * _125;
    float _139 = -_133;
    float _141 = fma(_107, _135, _139);
    float _143 = _92 * _131;
    float _145 = _137 * _141;
    float _147 = 0.0 + _145;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = _149 * _143;
    bool _155 = _151 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _157 = isnan(_151);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _163 = _159 || _161;
    float _165 = in.m_52.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    if (!_163)
    {
        discard_fragment();
    }
    float _171 = in.m_52.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _92 * _169;
    float _185 = 1.0 / _183;
    float _187 = _92 * _175;
    float _189 = _92 * _181;
    float _191 = _187 * _185;
    float _193 = _189 * _185;
    float2 _771 = float2(_191, _193);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float _197 = in.m_48.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_48.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_48.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_44.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_44.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_44.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = -_101;
    float _235 = _233 + 1.0;
    float _237 = -_103;
    float _239 = _237 + 1.0;
    float _241 = -_105;
    float _243 = _241 + 1.0;
    float _245 = _92 * _201;
    float _247 = _92 * _207;
    float _249 = _92 * _213;
    float _251 = _245 * _235;
    float _253 = _247 * _239;
    float _255 = _92 * _219;
    float _257 = _249 * _243;
    float _259 = _92 * _225;
    float _261 = _92 * _231;
    float _263 = fma(_103, _255, _253);
    float _265 = fma(_101, _259, _251);
    float _267 = fma(_105, _261, _257);
    if (!_163)
    {
        out.m_55.x = _265;
        out.m_55.y = _263;
        out.m_55.z = _267;
        out.m_55.w = _145;
        return out;
    }
    float _269 = in.m_57.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_57.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_57.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_59.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = _92 * _273;
    float _295 = _92 * _279;
    float _297 = _92 * _285;
    float _299 = _92 * _291;
    float _301 = _293 * _293;
    float _303 = _299 + 1.0;
    float _305 = fma(_295, _295, _301);
    float _307 = fma(_297, _297, _305);
    float _309 = precise::min(_303, 1.0);
    float _311 = rsqrt(_307);
    float _313 = _295 * _311;
    float _315 = _293 * _311;
    float _317 = _297 * _311;
    float _319 = abs(_313);
    float _321 = abs(_315);
    float _323 = precise::max(_319, _321);
    float _325 = abs(_317);
    float _327 = precise::max(_325, _323);
    float _329 = 1.0 / _327;
    float _331 = -_329;
    float _333 = _317 * _331;
    float _335 = _313 * _329;
    float _337 = _315 * _329;
    float3 _977 = float3(_335, _337, _333);
    float3 _341 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_977, float3(0.0), isnan(_977)), level(_309)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_977, float3(0.0), isnan(_977)), level(_309)).xyz;
    float _343 = _341.x;
    float _345 = _341.y;
    float _347 = _341.z;
    float _349 = in.m_61.y;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_61.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_63.y;
    float _363 = in.m_61.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_63.x;
    float _371 = in.m_52.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_63.z;
    float _379 = in.m_65.x;
    float _381 = in.m_67.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_67.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_67.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_69.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_69.w;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_69.y;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_71.w;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_69.z;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _431 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _429);
    float _433 = _92 * _353;
    float _435 = _92 * _359;
    float _437 = -_361;
    float _439 = _433 + _437;
    float _441 = _92 * _367;
    float _443 = -_369;
    float _445 = _435 + _443;
    float _447 = _92 * _375;
    float _449 = _439 * _439;
    float _451 = -_377;
    float _453 = _441 + _451;
    float _455 = _379 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _457 = _447 * _185;
    float _459 = fma(_445, _445, _449);
    float _461 = 1.0 / _431;
    float _463 = in.m_71.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _471 = fma(_457, (*spvDescriptorSet0.fp_c8)._m0[30].w, _469);
    float _473 = fma(_453, _453, _459);
    float _475 = in.m_71.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = _92 * _385;
    float _483 = -_473;
    float _485 = fma(_455, _455, _483);
    float _487 = 1.0 / _471;
    float _489 = in.m_71.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = precise::max(0.0, _485);
    float _497 = sqrt(_495);
    float _499 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _501 = _487 * _499;
    float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _505 = -_501;
    float _507 = fma(_461, _503, _505);
    float _509 = _92 * _403;
    float _511 = _92 * _467;
    float _513 = _497 + _507;
    float _515 = _92 * _421;
    float _517 = _92 * _479;
    float _519 = _92 * _391;
    float _521 = _92 * _397;
    float _523 = -_515;
    float _525 = _523 + _513;
    float _527 = _92 * _493;
    float _529 = _92 * _409;
    float _531 = _525 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _533 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _535 = _92 * _415;
    float _537 = _92 * _427;
    float _539 = _531 * (-1.44269502162933349609375);
    float _541 = exp2(_539);
    float _543 = _501;
    if (_533)
    {
        float _545 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _547 = _501 + _545;
        _543 = _547;
    }
    float _549 = _543;
    float _551 = _549;
    if (_533)
    {
        float _553 = _549 * 8.0;
        float _555 = precise::clamp(_553, 0.0, 1.0);
        _551 = _555;
    }
    float _557 = _551;
    float _559 = -_541;
    float _561 = _559 + 1.0;
    float _563 = precise::clamp(_561, 0.0, 1.0);
    float _565 = _151 * _563;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    float _569 = _567;
    if (_533)
    {
        float _571 = _567 * _557;
        _569 = _571;
    }
    float _573 = _569;
    float _575 = 0.0 + _573;
    float _577 = precise::clamp(_575, 0.0, 1.0);
    float _579 = fma(_343, 0.20999999344348907470703125, _527);
    float _581 = fma(_345, 0.20999999344348907470703125, _511);
    float _583 = fma(_347, 0.20999999344348907470703125, _517);
    float _585 = _579 + _481;
    float _587 = _581 + _519;
    float _589 = _583 + _521;
    float _591 = _265 * _585;
    float _593 = _263 * _587;
    float _595 = _267 * _589;
    float _597 = fma(_591, _529, _509);
    float _599 = fma(_593, _529, _535);
    float _601 = fma(_595, _529, _537);
    out.m_55.x = _597;
    out.m_55.y = _599;
    out.m_55.z = _601;
    out.m_55.w = _577;
    return out;
}

