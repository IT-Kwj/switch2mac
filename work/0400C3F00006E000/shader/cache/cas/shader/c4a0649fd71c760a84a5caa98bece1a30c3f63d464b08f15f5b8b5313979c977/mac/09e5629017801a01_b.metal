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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _72;
    float _112 = _110 * _78;
    float _114 = _110 * _84;
    float _116 = _110 * _90;
    float _118 = _110 * _96;
    float _120 = _110 * _102;
    float _122 = _110 * _108;
    float2 _632 = float2(_112, _114);
    float4 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_632, float2(0.0), isnan(_632))).xyzw;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float _133 = _125.w;
    float2 _651 = float2(_116, _118);
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_651, float2(0.0), isnan(_651))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_651, float2(0.0), isnan(_651))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float2 _667 = float2(_120, _122);
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_667, float2(0.0), isnan(_667))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_667, float2(0.0), isnan(_667))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float _155 = in.m_46.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_48.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_50.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_52.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _110 * _159;
    float _181 = _110 * _165;
    float _183 = in.m_50.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_50.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_46.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_50.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _133 * _143;
    float _209 = _110 * _171;
    float _211 = _207 * _153;
    float _213 = -_179;
    float _215 = fma(_211, _181, _213);
    float _217 = _209 * _215;
    float _219 = _110 * _177;
    float _221 = 0.0 + _217;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _223 * _219;
    bool _229 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _237 = _233 || _235;
    float _239 = in.m_46.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_46.y;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_48.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_48.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    if (!_237)
    {
        discard_fragment();
    }
    float _263 = in.m_48.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _129 * _139;
    float _271 = _149 * _149;
    float _273 = _127 * _137;
    float _275 = _147 * _147;
    float _277 = _131 * _141;
    float _279 = _269 * _271;
    float _281 = _151 * _151;
    float _283 = _273 * _275;
    float _285 = _110 * _187;
    float _287 = _110 * _193;
    float _289 = _110 * _199;
    float _291 = _277 * _281;
    float _293 = _110 * _243;
    float _295 = _110 * _249;
    float _297 = _110 * _205;
    float _299 = _110 * _255;
    float _301 = -_285;
    float _303 = _293 + _301;
    float _305 = -_287;
    float _307 = _295 + _305;
    float _309 = -_297;
    float _311 = _289 + _309;
    float _313 = _110 * _261;
    float _315 = fma(_283, _303, _285);
    float _317 = fma(_279, _307, _287);
    float _319 = fma(_291, _311, _297);
    float _321 = _315 * _299;
    float _323 = _110 * _267;
    float _325 = _317 * _313;
    float _327 = _319 * _323;
    if (!_237)
    {
        out.m_55.x = _321;
        out.m_55.y = _325;
        out.m_55.z = _327;
        out.m_55.w = _217;
        return out;
    }
    float _329 = in.m_57.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_57.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_57.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _110 * _333;
    float _349 = _110 * _339;
    float _351 = _110 * _345;
    float _353 = _347 * _347;
    float _355 = fma(_349, _349, _353);
    float _357 = fma(_351, _351, _355);
    float _359 = rsqrt(_357);
    float _361 = _349 * _359;
    float _363 = _347 * _359;
    float _365 = _351 * _359;
    float _367 = abs(_361);
    float _369 = abs(_363);
    float _371 = precise::max(_367, _369);
    float _373 = abs(_365);
    float _375 = precise::max(_373, _371);
    float _377 = 1.0 / _375;
    float _379 = -_377;
    float _381 = _365 * _379;
    float _383 = _361 * _377;
    float _385 = _363 * _377;
    float3 _1011 = float3(_383, _385, _381);
    float3 _389 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1011, float3(0.0), isnan(_1011)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1011, float3(0.0), isnan(_1011)), level(0.0)).xyz;
    float _391 = _389.x;
    float _393 = _389.y;
    float _395 = _389.z;
    float _397 = in.m_59.y;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_59.z;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_59.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_61.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_61.z;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_61.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_63.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_63.w;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_63.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_63.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = _110 * _401;
    float _459 = _110 * _407;
    float _461 = _110 * _413;
    bool _463 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _465 = fma(_393, 0.20999999344348907470703125, _457);
    float _467 = fma(_395, 0.20999999344348907470703125, _459);
    float _469 = fma(_391, 0.20999999344348907470703125, _461);
    float _471 = _110 * _419;
    float _473 = _110 * _425;
    float _475 = _110 * _431;
    float _477 = _465 + _471;
    float _479 = _467 + _473;
    float _481 = _469 + _475;
    float _483 = _110 * _443;
    float _485 = _325 * _477;
    float _487 = _327 * _479;
    float _489 = _321 * _481;
    float _491 = 0.0 + _225;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    float _495 = _110 * _437;
    float _497 = _110 * _449;
    float _499 = _110 * _455;
    float _501 = fma(_489, _483, _495);
    float _503 = fma(_485, _483, _497);
    float _505 = fma(_487, _483, _499);
    float _507 = _495;
    if (!_463)
    {
        _507 = _493;
    }
    float _509 = _507;
    bool _511 = !_463;
    float _513 = _509;
    if (!_511)
    {
        float _515 = in.m_65.w;
        float _517 = gl_FragCoord.w;
        float _519 = _515 * _517;
        float _521 = in.m_65.z;
        float _523 = gl_FragCoord.w;
        float _525 = _521 * _523;
        float _527 = _110 * _519;
        float _529 = _110 * _525;
        float _531 = 1.0 / _527;
        float _533 = _529 * _531;
        float _535 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _537 = fma(_533, (*spvDescriptorSet0.fp_c8)._m0[30].w, _535);
        float _539 = 1.0 / _537;
        float _541 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _543 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _545 = fma(_539, _541, _543);
        float _547 = _545 * 8.0;
        float _549 = precise::clamp(_547, 0.0, 1.0);
        float _551 = _493 * _549;
        _513 = _551;
    }
    float _553 = _513;
    float _555 = 0.0 + _553;
    float _557 = precise::clamp(_555, 0.0, 1.0);
    out.m_55.x = _501;
    out.m_55.y = _503;
    out.m_55.z = _505;
    out.m_55.w = _557;
    return out;
}

