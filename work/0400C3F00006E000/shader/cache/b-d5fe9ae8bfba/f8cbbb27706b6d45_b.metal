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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_69 [[user(locn10), flat]];
    float4 m_56 [[user(locn11)]];
    float4 m_54 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
    float4 m_67 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_44.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_46.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = 1.0 / _82;
    float _110 = _108 * _88;
    float _112 = _108 * _94;
    float _114 = _108 * _100;
    float _116 = _108 * _106;
    float2 _679 = float2(_116, _110);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_679, float2(0.0), isnan(_679))).w;
    float2 _690 = float2(_112, _114);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_48.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_50.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_52.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_54.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _108 * _135;
    float _157 = _108 * _153;
    float _159 = -_129;
    float _161 = fma(_129, _118, _159);
    float _163 = fma(_155, _161, _129);
    float _165 = _108 * _141;
    float _167 = _108 * _147;
    float _169 = _165 * _163;
    float _171 = _169 * _167;
    float _173 = 0.0 + _171;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _175 * _157;
    bool _181 = _177 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _183 = isnan(_177);
    bool _185 = _181 || _183;
    bool _187 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _189 = _185 || _187;
    float _191 = in.m_56.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _177;
    if (!_189)
    {
        discard_fragment();
    }
    float _199 = in.m_56.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_56.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _108 * _195;
    float _213 = 1.0 / _211;
    float _215 = _108 * _203;
    float _217 = _108 * _209;
    float _219 = _215 * _213;
    float _221 = _217 * _213;
    float2 _831 = float2(_221, _219);
    float _223 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_831, float2(0.0), isnan(_831))).x;
    float _225 = in.m_48.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_48.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_48.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_50.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_50.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_50.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = -_123;
    float _263 = _261 + 1.0;
    float _265 = -_127;
    float _267 = _265 + 1.0;
    float _269 = -_125;
    float _271 = _269 + 1.0;
    float _273 = _108 * _229;
    float _275 = _108 * _235;
    float _277 = _108 * _241;
    float _279 = _273 * _271;
    float _281 = _275 * _263;
    float _283 = _277 * _267;
    float _285 = _108 * _247;
    float _287 = _108 * _253;
    float _289 = _108 * _259;
    float _291 = fma(_123, _285, _281);
    float _293 = fma(_125, _287, _279);
    float _295 = fma(_127, _289, _283);
    if (!_189)
    {
        out.m_59.x = _291;
        out.m_59.y = _293;
        out.m_59.z = _295;
        out.m_59.w = _171;
        return out;
    }
    float _297 = in.m_61.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_61.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_61.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_63.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _108 * _301;
    float _323 = _108 * _307;
    float _325 = _108 * _313;
    float _327 = _108 * _319;
    float _329 = _321 * _321;
    float _331 = fma(_323, _323, _329);
    float _333 = precise::min(_327, 1.0);
    float _335 = fma(_325, _325, _331);
    float _337 = rsqrt(_335);
    float _339 = _323 * _337;
    float _341 = _321 * _337;
    float _343 = _325 * _337;
    float _345 = abs(_339);
    float _347 = abs(_341);
    float _349 = precise::max(_345, _347);
    float _351 = abs(_343);
    float _353 = precise::max(_351, _349);
    float _355 = 1.0 / _353;
    float _357 = -_355;
    float _359 = _343 * _357;
    float _361 = _339 * _355;
    float _363 = _341 * _355;
    float3 _1035 = float3(_361, _363, _359);
    float3 _367 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1035, float3(0.0), isnan(_1035)), level(_333)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1035, float3(0.0), isnan(_1035)), level(_333)).xyz;
    float _369 = _367.x;
    float _371 = _367.y;
    float _373 = _367.z;
    float _375 = in.m_65.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_65.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_67.y;
    float _389 = in.m_67.x;
    float _391 = in.m_65.z;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_56.z;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_67.z;
    float _405 = in.m_69.x;
    float _407 = in.m_71.z;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_73.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_73.w;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = _108 * _379;
    float _427 = _108 * _385;
    float _429 = in.m_75.w;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = -_387;
    float _437 = _425 + _435;
    float _439 = -_389;
    float _441 = _427 + _439;
    float _443 = _108 * _395;
    float _445 = _108 * _401;
    float _447 = _437 * _437;
    float _449 = _405 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _451 = -_403;
    float _453 = _443 + _451;
    float _455 = _445 * _213;
    float _457 = fma(_441, _441, _447);
    float _459 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _461 = fma(_223, (*spvDescriptorSet0.fp_c8)._m0[30].w, _459);
    float _463 = in.m_75.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _471 = fma(_455, (*spvDescriptorSet0.fp_c8)._m0[30].w, _469);
    float _473 = fma(_453, _453, _457);
    float _475 = in.m_75.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_71.x;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = 1.0 / _471;
    float _489 = -_473;
    float _491 = fma(_449, _449, _489);
    float _493 = in.m_71.y;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = _108 * _411;
    float _501 = precise::max(0.0, _491);
    float _503 = 1.0 / _461;
    bool _505 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _507 = _108 * _417;
    float _509 = sqrt(_501);
    float _511 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _513 = _487 * _511;
    float _515 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _517 = -_513;
    float _519 = fma(_503, _515, _517);
    float _521 = _513;
    if (_505)
    {
        float _523 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _525 = _513 + _523;
        _521 = _525;
    }
    float _527 = _521;
    float _529 = in.m_75.x;
    float _531 = gl_FragCoord.w;
    float _533 = _529 * _531;
    float _535 = _108 * _479;
    float _537 = _108 * _485;
    float _539 = _509 + _519;
    float _541 = _108 * _433;
    float _543 = in.m_73.y;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_73.z;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = -_541;
    float _557 = _555 + _539;
    float _559 = _108 * _423;
    float _561 = _557 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _563 = _561 * (-1.44269502162933349609375);
    float _565 = exp2(_563);
    float _567 = _108 * _533;
    float _569 = _108 * _467;
    float _571 = _108 * _497;
    float _573 = _108 * _547;
    float _575 = -_565;
    float _577 = _575 + 1.0;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = _108 * _553;
    float _583 = _177 * _579;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _585;
    if (_505)
    {
        float _589 = _527 * 8.0;
        float _591 = precise::clamp(_589, 0.0, 1.0);
        _197 = _591;
    }
    float _593 = _197;
    if (_505)
    {
        float _595 = _585 * _593;
        _587 = _595;
    }
    float _597 = _587;
    float _599 = 0.0 + _597;
    float _601 = precise::clamp(_599, 0.0, 1.0);
    float _603 = fma(_369, 0.20999999344348907470703125, _567);
    float _605 = fma(_371, 0.20999999344348907470703125, _569);
    float _607 = fma(_373, 0.20999999344348907470703125, _535);
    float _609 = _603 + _537;
    float _611 = _605 + _571;
    float _613 = _607 + _499;
    float _615 = _291 * _609;
    float _617 = _293 * _611;
    float _619 = _295 * _613;
    float _621 = fma(_615, _559, _507);
    float _623 = fma(_617, _559, _573);
    float _625 = fma(_619, _559, _581);
    out.m_59.x = _621;
    out.m_59.y = _623;
    out.m_59.z = _625;
    out.m_59.w = _601;
    return out;
}

