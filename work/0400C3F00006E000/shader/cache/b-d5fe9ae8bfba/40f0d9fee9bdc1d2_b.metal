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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_44 [[user(locn7), flat]];
    float4 m_59 [[user(locn8)]];
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
    float _82 = in.m_42.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.x;
    float _96 = in.m_46.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_46.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_46.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = 1.0 / _74;
    float _122 = fma(_94, -4.0, 5.0);
    float _124 = _120 * _80;
    float _126 = _120 * _86;
    float _128 = _120 * _92;
    float _130 = _120 * _100;
    float _132 = 1.0 / _124;
    float _134 = _130 * _122;
    float _136 = _120 * _118;
    float _138 = _120 * _112;
    float _140 = _126 * _132;
    float _142 = _128 * _132;
    float _144 = _120 * _106;
    float2 _656 = float2(_140, _142);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_656, float2(0.0), isnan(_656))).x;
    float2 _667 = float2(_144, _138);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_667, float2(0.0), isnan(_667))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_667, float2(0.0), isnan(_667))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float2 _683 = float2(_136, _134);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_683, float2(0.0), isnan(_683))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_683, float2(0.0), isnan(_683))).w;
    float _161 = in.m_42.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_48.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_50.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_52.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _187 = _120 * _165;
    float _189 = _187 * _132;
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _193 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[30].w, _191);
    float _195 = 1.0 / _193;
    float _197 = _120 * _171;
    float _199 = _120 * _183;
    float _201 = in.m_48.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_48.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_54.w;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _221 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
    float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _225 = _195 * _223;
    float _227 = -_197;
    float _229 = fma(_157, _159, _227);
    float _231 = 1.0 / _221;
    float _233 = _120 * _177;
    float _235 = _233 * _229;
    float _237 = 0.0 + _235;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _243 = -_225;
    float _245 = fma(_231, _241, _243);
    float _247 = _245 * _185;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _239 * _249;
    float _253 = _251 * _199;
    bool _257 = _253 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _259 = isnan(_253);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _265 = _261 || _263;
    float _267 = in.m_50.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_50.y;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_50.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_48.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = _225;
    if (!_265)
    {
        discard_fragment();
    }
    float _293 = _153 * _153;
    float _295 = _151 * _151;
    float _297 = _155 * _155;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    float _303 = _120 * _271;
    float _305 = _120 * _277;
    float _307 = -_295;
    float _309 = _307 + 1.0;
    float _311 = _120 * _283;
    float _313 = -_297;
    float _315 = _313 + 1.0;
    float _317 = _305 * _301;
    float _319 = _303 * _309;
    float _321 = _120 * _289;
    float _323 = _311 * _315;
    float _325 = _120 * _211;
    float _327 = _120 * _205;
    float _329 = fma(_295, _321, _319);
    float _331 = _120 * _217;
    float _333 = fma(_293, _325, _317);
    float _335 = fma(_297, _327, _323);
    float _337 = _329 * _331;
    float _339 = _333 * _331;
    float _341 = _335 * _331;
    if (!_265)
    {
        out.m_57.x = _337;
        out.m_57.y = _339;
        out.m_57.z = _341;
        out.m_57.w = _235;
        return out;
    }
    float _343 = in.m_59.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_59.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_59.z;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = _120 * _347;
    float _363 = _120 * _353;
    float _365 = _120 * _359;
    float _367 = _361 * _361;
    float _369 = in.m_61.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = fma(_363, _363, _367);
    float _377 = fma(_365, _365, _375);
    float _379 = rsqrt(_377);
    float _381 = _363 * _379;
    float _383 = _361 * _379;
    float _385 = _365 * _379;
    float _387 = _120 * _373;
    float _389 = abs(_381);
    float _391 = abs(_383);
    float _393 = precise::max(_389, _391);
    float _395 = precise::min(_387, 1.0);
    float _397 = abs(_385);
    float _399 = precise::max(_397, _393);
    float _401 = 1.0 / _399;
    float _403 = -_401;
    float _405 = _385 * _403;
    float _407 = _381 * _401;
    float _409 = _383 * _401;
    float3 _1044 = float3(_407, _409, _405);
    float3 _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1044, float3(0.0), isnan(_1044)), level(_395)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1044, float3(0.0), isnan(_1044)), level(_395)).xyz;
    float _415 = _413.x;
    float _417 = _413.y;
    float _419 = _413.z;
    float _421 = in.m_63.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_63.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_63.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_65.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_65.x;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_65.y;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_67.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_67.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_67.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_67.w;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    bool _481 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_481)
    {
        float _483 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _485 = _225 + _483;
        _291 = _485;
    }
    float _487 = _291;
    float _489 = _487;
    if (_481)
    {
        float _491 = _487 * 8.0;
        float _493 = precise::clamp(_491, 0.0, 1.0);
        _489 = _493;
    }
    float _495 = _489;
    float _497 = _120 * _425;
    float _499 = _120 * _431;
    float _501 = _120 * _443;
    float _503 = _120 * _449;
    float _505 = _120 * _455;
    float _507 = _120 * _467;
    float _509 = fma(_415, 0.20999999344348907470703125, _497);
    float _511 = _120 * _437;
    float _513 = fma(_419, 0.20999999344348907470703125, _499);
    float _515 = _120 * _461;
    float _517 = _509 + _503;
    float _519 = fma(_417, 0.20999999344348907470703125, _511);
    float _521 = _513 + _501;
    float _523 = 0.0 + _253;
    float _525 = precise::clamp(_523, 0.0, 1.0);
    float _527 = _120 * _473;
    float _529 = _519 + _505;
    float _531 = _120 * _479;
    float _533 = _337 * _517;
    float _535 = _341 * _521;
    float _537 = _339 * _529;
    float _539 = _525;
    if (_481)
    {
        float _541 = _525 * _495;
        _539 = _541;
    }
    float _543 = _539;
    float _545 = fma(_533, _531, _515);
    float _547 = fma(_535, _531, _527);
    float _549 = fma(_537, _531, _507);
    float _551 = 0.0 + _543;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    out.m_57.x = _545;
    out.m_57.y = _549;
    out.m_57.z = _547;
    out.m_57.w = _553;
    return out;
}

