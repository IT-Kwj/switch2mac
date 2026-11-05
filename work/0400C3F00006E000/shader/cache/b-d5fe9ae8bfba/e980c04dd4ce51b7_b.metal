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
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_59 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_44.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_46.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = 1.0 / _76;
    float _110 = _108 * _82;
    float _112 = _108 * _88;
    float _114 = _108 * _94;
    float _116 = _108 * _100;
    float _118 = 1.0 / _110;
    float _120 = _108 * _106;
    float _122 = _112 * _118;
    float _124 = _114 * _118;
    float2 _649 = float2(_122, _124);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_649, float2(0.0), isnan(_649))).x;
    float2 _660 = float2(_116, _120);
    float4 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_660, float2(0.0), isnan(_660))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_660, float2(0.0), isnan(_660))).xyzw;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    float _137 = _129.w;
    float _139 = in.m_44.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_48.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_50.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_52.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_54.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _171 = _108 * _143;
    float _173 = _171 * _118;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c8)._m0[30].w, _175);
    float _179 = _108 * _149;
    float _181 = _108 * _167;
    float _183 = 1.0 / _177;
    float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _187 = _183 * _185;
    float _189 = in.m_52.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_48.x;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_48.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_48.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _215 = fma(_126, (*spvDescriptorSet0.fp_c8)._m0[30].w, _213);
    float _217 = _108 * _155;
    float _219 = 1.0 / _215;
    float _221 = -_179;
    float _223 = fma(_137, _217, _221);
    float _225 = _108 * _161;
    float _227 = _225 * _223;
    float _229 = 0.0 + _227;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = -_187;
    float _237 = fma(_219, _233, _235);
    float _239 = _237 * _169;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _231 * _241;
    float _245 = _243 * _181;
    bool _249 = _245 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _251 = isnan(_245);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _257 = _253 || _255;
    float _259 = in.m_52.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_52.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _187;
    if (!_257)
    {
        discard_fragment();
    }
    float _273 = _108 * _193;
    float _275 = -_133;
    float _277 = _275 + 1.0;
    float _279 = _108 * _263;
    float _281 = _108 * _269;
    float _283 = -_131;
    float _285 = _283 + 1.0;
    float _287 = -_135;
    float _289 = _287 + 1.0;
    float _291 = _279 * _277;
    float _293 = _108 * _199;
    float _295 = _273 * _285;
    float _297 = _281 * _289;
    float _299 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _108 * _205;
    float _305 = _108 * _211;
    float _307 = fma(_131, _293, _295);
    float _309 = fma(_301, -0.5, 1.0);
    float _311 = fma(_133, _303, _291);
    float _313 = fma(_135, _305, _297);
    float _315 = _307 * _309;
    float _317 = _311 * _309;
    float _319 = _313 * _309;
    if (!_257)
    {
        out.m_57.x = _315;
        out.m_57.y = _317;
        out.m_57.z = _319;
        out.m_57.w = _227;
        return out;
    }
    float _321 = in.m_59.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_59.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_59.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = _108 * _325;
    float _341 = _108 * _331;
    float _343 = _108 * _337;
    float _345 = _339 * _339;
    float _347 = in.m_61.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = fma(_341, _341, _345);
    float _355 = fma(_343, _343, _353);
    float _357 = rsqrt(_355);
    float _359 = _341 * _357;
    float _361 = _339 * _357;
    float _363 = _343 * _357;
    float _365 = _108 * _351;
    float _367 = abs(_359);
    float _369 = abs(_361);
    float _371 = precise::max(_367, _369);
    float _373 = precise::min(_365, 1.0);
    float _375 = abs(_363);
    float _377 = precise::max(_375, _371);
    float _379 = 1.0 / _377;
    float _381 = -_379;
    float _383 = _363 * _381;
    float _385 = _359 * _379;
    float _387 = _361 * _379;
    float3 _1030 = float3(_385, _387, _383);
    float3 _391 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1030, float3(0.0), isnan(_1030)), level(_373)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1030, float3(0.0), isnan(_1030)), level(_373)).xyz;
    float _393 = _391.x;
    float _395 = _391.y;
    float _397 = _391.z;
    float _399 = in.m_63.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_63.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_63.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_65.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_65.z;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_65.y;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_67.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_67.x;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_67.y;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = in.m_69.x;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_69.y;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_69.w;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_69.z;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    bool _477 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_477)
    {
        float _479 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _481 = _187 + _479;
        _271 = _481;
    }
    float _483 = _271;
    float _485 = _108 * _403;
    float _487 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _489 = _487 + 1.0;
    float _491 = _108 * _409;
    float _493 = _108 * _415;
    float _495 = _108 * _421;
    float _497 = fma(_485, (*spvDescriptorSet0.fp_c13)._m0[0].y, _489);
    float _499 = fma(_491, (*spvDescriptorSet0.fp_c13)._m0[0].y, _489);
    float _501 = fma(_493, (*spvDescriptorSet0.fp_c13)._m0[0].y, _489);
    float _503 = _108 * _439;
    float _505 = _108 * _445;
    float _507 = _317 * _499;
    float _509 = precise::clamp(_507, 0.0, 1.0);
    float _511 = _108 * _427;
    float _513 = _319 * _501;
    float _515 = precise::clamp(_513, 0.0, 1.0);
    float _517 = _108 * _451;
    float _519 = _315 * _497;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    float _523 = _483;
    if (_477)
    {
        float _525 = _483 * 8.0;
        float _527 = precise::clamp(_525, 0.0, 1.0);
        _523 = _527;
    }
    float _529 = _523;
    float _531 = _108 * _457;
    float _533 = _108 * _463;
    float _535 = _108 * _475;
    float _537 = fma(_393, 0.20999999344348907470703125, _495);
    float _539 = _108 * _433;
    float _541 = fma(_397, 0.20999999344348907470703125, _511);
    float _543 = _108 * _469;
    float _545 = _537 + _505;
    float _547 = fma(_395, 0.20999999344348907470703125, _539);
    float _549 = _541 + _503;
    float _551 = 0.0 + _245;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = _521 * _545;
    float _557 = _547 + _517;
    float _559 = _515 * _549;
    float _561 = _553;
    if (_477)
    {
        float _563 = _553 * _529;
        _561 = _563;
    }
    float _565 = _561;
    float _567 = fma(_555, _543, _531);
    float _569 = _509 * _557;
    float _571 = fma(_559, _543, _535);
    float _573 = 0.0 + _565;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    float _577 = fma(_569, _543, _533);
    out.m_57.x = _567;
    out.m_57.y = _577;
    out.m_57.z = _571;
    out.m_57.w = _575;
    return out;
}

