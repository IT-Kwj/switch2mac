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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.z;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _70;
    float _116 = _114 * _76;
    float _118 = _114 * _82;
    float _120 = _114 * _88;
    float _122 = _114 * _112;
    float _124 = 1.0 / _116;
    float _126 = _118 * _124;
    float _128 = _120 * _124;
    float _130 = _114 * _94;
    float _132 = _114 * _100;
    float _134 = _114 * _106;
    float2 _626 = float2(_126, _128);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float2 _637 = float2(_122, _130);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_637, float2(0.0), isnan(_637))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_637, float2(0.0), isnan(_637))).w;
    float2 _645 = float2(_132, _134);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_645, float2(0.0), isnan(_645))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float _151 = in.m_42.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_46.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_48.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_50.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_52.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _183 = _114 * _155;
    float _185 = _183 * _124;
    float _187 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _189 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[30].w, _187);
    float _191 = _114 * _161;
    float _193 = _114 * _167;
    float _195 = -_191;
    float _197 = _195 + 1.0;
    float _199 = 1.0 / _189;
    float _201 = _197 * _197;
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _205 = _199 * _203;
    float _207 = in.m_50.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_48.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_48.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _227 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _225);
    float _229 = 1.0 / _227;
    float _231 = -_193;
    float _233 = fma(_149, _138, _231);
    float _235 = _114 * _173;
    float _237 = _235 * _233;
    float _239 = -_201;
    float _241 = fma(_239, _201, 1.0);
    float _243 = _237 * _241;
    float _245 = 0.0 + _243;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _251 = -_205;
    float _253 = fma(_229, _249, _251);
    float _255 = _114 * _179;
    float _257 = _253 * _181;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = _247 * _259;
    float _263 = _261 * _255;
    bool _267 = _263 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _269 = isnan(_263);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _275 = _271 || _273;
    float _277 = in.m_50.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_50.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_48.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _205;
    if (!_275)
    {
        discard_fragment();
    }
    float _297 = -_145;
    float _299 = _297 + 1.0;
    float _301 = -_147;
    float _303 = _301 + 1.0;
    float _305 = _114 * _281;
    float _307 = _114 * _287;
    float _309 = _114 * _211;
    float _311 = -_143;
    float _313 = _311 + 1.0;
    float _315 = _307 * _299;
    float _317 = _309 * _303;
    float _319 = _305 * _313;
    float _321 = _114 * _217;
    float _323 = _114 * _293;
    float _325 = _114 * _223;
    float _327 = fma(_143, _321, _319);
    float _329 = fma(_145, _323, _315);
    float _331 = fma(_147, _325, _317);
    if (!_275)
    {
        out.m_55.x = _327;
        out.m_55.y = _329;
        out.m_55.z = _331;
        out.m_55.w = _243;
        return out;
    }
    float _333 = in.m_57.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_57.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_57.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = _114 * _337;
    float _353 = _114 * _343;
    float _355 = _114 * _349;
    float _357 = _351 * _351;
    float _359 = fma(_353, _353, _357);
    float _361 = fma(_355, _355, _359);
    float _363 = rsqrt(_361);
    float _365 = _353 * _363;
    float _367 = _351 * _363;
    float _369 = _355 * _363;
    float _371 = abs(_365);
    float _373 = abs(_367);
    float _375 = precise::max(_371, _373);
    float _377 = abs(_369);
    float _379 = precise::max(_377, _375);
    float _381 = 1.0 / _379;
    float _383 = _365 * _381;
    float _385 = _367 * _381;
    float _387 = -_381;
    float _389 = _369 * _387;
    float3 _1000 = float3(_383, _385, _389);
    float3 _393 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1000, float3(0.0), isnan(_1000)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1000, float3(0.0), isnan(_1000)), level(0.0)).xyz;
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
    float _419 = in.m_61.z;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_61.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_61.y;
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
    if (_461)
    {
        float _463 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _465 = _205 + _463;
        _295 = _465;
    }
    float _467 = _295;
    float _469 = _467;
    if (_461)
    {
        float _471 = _467 * 8.0;
        float _473 = precise::clamp(_471, 0.0, 1.0);
        _469 = _473;
    }
    float _475 = _469;
    float _477 = _114 * _405;
    float _479 = _114 * _411;
    float _481 = _114 * _423;
    float _483 = _114 * _429;
    float _485 = _114 * _447;
    float _487 = _114 * _453;
    float _489 = fma(_395, 0.20999999344348907470703125, _477);
    float _491 = _114 * _417;
    float _493 = fma(_399, 0.20999999344348907470703125, _479);
    float _495 = _114 * _435;
    float _497 = _489 + _483;
    float _499 = fma(_397, 0.20999999344348907470703125, _491);
    float _501 = _493 + _481;
    float _503 = 0.0 + _263;
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = _114 * _441;
    float _509 = _499 + _495;
    float _511 = _114 * _459;
    float _513 = _327 * _497;
    float _515 = _331 * _501;
    float _517 = _329 * _509;
    float _519 = _505;
    if (_461)
    {
        float _521 = _505 * _475;
        _519 = _521;
    }
    float _523 = _519;
    float _525 = fma(_513, _511, _507);
    float _527 = fma(_515, _511, _487);
    float _529 = fma(_517, _511, _485);
    float _531 = 0.0 + _523;
    float _533 = precise::clamp(_531, 0.0, 1.0);
    out.m_55.x = _525;
    out.m_55.y = _529;
    out.m_55.z = _527;
    out.m_55.w = _533;
    return out;
}

