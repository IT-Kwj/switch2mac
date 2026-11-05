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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_1ESmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_46.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_46.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_48.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_48.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_50.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_50.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = 1.0 / _126;
    float _136 = _124 * _110;
    float _138 = _124 * _116;
    float _140 = _124 * _122;
    float _142 = _128 * _134;
    float _144 = _130 * _134;
    float2 _719 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_719, float2(0.0), isnan(_719))).x;
    float2 _730 = float2(_132, _136);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_730, float2(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_730, float2(0.0), isnan(_730))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float2 _746 = float2(_138, _140);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_746, float2(0.0), isnan(_746))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float _169 = in.m_46.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_52.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_54.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_56.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_58.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _201 = _124 * _173;
    float _203 = _201 * _134;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_203, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = _124 * _179;
    float _211 = _124 * _197;
    float _213 = 1.0 / _207;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _217 = _213 * _215;
    float _219 = in.m_56.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _227 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _225);
    float _229 = _124 * _185;
    float _231 = 1.0 / _227;
    float _233 = _157 * _167;
    float _235 = -_209;
    float _237 = fma(_233, _229, _235);
    float _239 = _124 * _191;
    float _241 = _239 * _237;
    float _243 = 0.0 + _241;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _249 = -_217;
    float _251 = fma(_231, _247, _249);
    float _253 = _251 * _199;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _245 * _255;
    float _259 = _257 * _211;
    bool _263 = _259 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _265 = isnan(_259);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _271 = _267 || _269;
    float _273 = in.m_56.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_56.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_52.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_52.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_52.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = _217;
    if (!_271)
    {
        discard_fragment();
    }
    float _305 = _153 * _153;
    float _307 = _163 * _163;
    float _309 = _151 * _151;
    float _311 = _161 * _161;
    float _313 = _155 * _155;
    float _315 = _165 * _165;
    float _317 = _305 * _307;
    float _319 = _309 * _311;
    float _321 = _313 * _315;
    float _323 = -_317;
    float _325 = _323 + 1.0;
    float _327 = -_321;
    float _329 = _327 + 1.0;
    float _331 = _124 * _277;
    float _333 = _124 * _283;
    float _335 = -_319;
    float _337 = _335 + 1.0;
    float _339 = _124 * _223;
    float _341 = _331 * _325;
    float _343 = _333 * _337;
    float _345 = _339 * _329;
    float _347 = _124 * _289;
    float _349 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = _124 * _295;
    float _355 = _124 * _301;
    float _357 = fma(_319, _347, _343);
    float _359 = fma(_351, -0.5, 1.0);
    float _361 = fma(_317, _353, _341);
    float _363 = fma(_321, _355, _345);
    float _365 = _357 * _359;
    float _367 = _361 * _359;
    float _369 = _363 * _359;
    if (!_271)
    {
        out.m_61.x = _365;
        out.m_61.y = _367;
        out.m_61.z = _369;
        out.m_61.w = _241;
        return out;
    }
    float _371 = in.m_63.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_63.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_63.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_65.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = _124 * _375;
    float _397 = _124 * _381;
    float _399 = _124 * _387;
    float _401 = _395 * _395;
    float _403 = fma(_397, _397, _401);
    float _405 = fma(_399, _399, _403);
    float _407 = rsqrt(_405);
    float _409 = _397 * _407;
    float _411 = _395 * _407;
    float _413 = _399 * _407;
    float _415 = _124 * _393;
    float _417 = abs(_409);
    float _419 = abs(_411);
    float _421 = precise::max(_417, _419);
    float _423 = precise::min(_415, 1.0);
    float _425 = abs(_413);
    float _427 = precise::max(_425, _421);
    float _429 = 1.0 / _427;
    float _431 = -_429;
    float _433 = _413 * _431;
    float _435 = _409 * _429;
    float _437 = _411 * _429;
    float3 _1146 = float3(_435, _437, _433);
    float3 _441 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1146, float3(0.0), isnan(_1146)), level(_423)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1146, float3(0.0), isnan(_1146)), level(_423)).xyz;
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    float _449 = in.m_67.x;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = in.m_67.y;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = in.m_67.z;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_69.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_69.z;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_69.y;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_71.z;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_71.x;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_71.y;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_73.x;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_73.y;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_73.z;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_73.w;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    bool _527 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _529 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _531 = _529 + 1.0;
    if (_527)
    {
        float _533 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _535 = _217 + _533;
        _303 = _535;
    }
    float _537 = _303;
    float _539 = _537;
    if (_527)
    {
        float _541 = _537 * 8.0;
        float _543 = precise::clamp(_541, 0.0, 1.0);
        _539 = _543;
    }
    float _545 = _539;
    float _547 = _124 * _453;
    float _549 = _124 * _459;
    float _551 = _124 * _465;
    float _553 = _124 * _471;
    float _555 = fma(_547, (*spvDescriptorSet0.fp_c13)._m0[0].y, _531);
    float _557 = fma(_549, (*spvDescriptorSet0.fp_c13)._m0[0].y, _531);
    float _559 = fma(_551, (*spvDescriptorSet0.fp_c13)._m0[0].y, _531);
    float _561 = _124 * _477;
    float _563 = _124 * _489;
    float _565 = _367 * _557;
    float _567 = precise::clamp(_565, 0.0, 1.0);
    float _569 = _369 * _559;
    float _571 = precise::clamp(_569, 0.0, 1.0);
    float _573 = _124 * _495;
    float _575 = _124 * _501;
    float _577 = _365 * _555;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = _124 * _507;
    float _583 = _124 * _513;
    float _585 = _124 * _519;
    float _587 = fma(_443, 0.20999999344348907470703125, _553);
    float _589 = _124 * _483;
    float _591 = fma(_447, 0.20999999344348907470703125, _561);
    float _593 = _124 * _525;
    float _595 = _587 + _573;
    float _597 = fma(_445, 0.20999999344348907470703125, _589);
    float _599 = _591 + _563;
    float _601 = 0.0 + _259;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = _579 * _595;
    float _607 = _597 + _575;
    float _609 = _571 * _599;
    float _611 = _603;
    if (_527)
    {
        float _613 = _603 * _545;
        _611 = _613;
    }
    float _615 = _611;
    float _617 = fma(_605, _593, _581);
    float _619 = _567 * _607;
    float _621 = fma(_609, _593, _585);
    float _623 = 0.0 + _615;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    float _627 = fma(_619, _593, _583);
    out.m_61.x = _617;
    out.m_61.y = _627;
    out.m_61.z = _621;
    out.m_61.w = _625;
    return out;
}

