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
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _70;
    float _116 = _114 * _76;
    float _118 = _114 * _82;
    float _120 = _114 * _88;
    float _122 = _114 * _94;
    float _124 = 1.0 / _116;
    float _126 = _114 * _100;
    float _128 = _114 * _106;
    float _130 = _114 * _112;
    float _132 = _118 * _124;
    float _134 = _120 * _124;
    float2 _620 = float2(_134, _132);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float2 _631 = float2(_122, _130);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_631, float2(0.0), isnan(_631))).w;
    float2 _639 = float2(_126, _128);
    float4 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).xyzw;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _141.w;
    float _151 = in.m_42.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_46.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_48.w;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_50.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _114 * _155;
    float _177 = _175 * _124;
    float _179 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = 1.0 / _183;
    float _187 = _114 * _161;
    float _189 = in.m_46.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_48.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = 1.0 / _203;
    float _207 = -_138;
    float _209 = _149 + _207;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = _185 * _211;
    float _215 = _114 * _173;
    float _217 = -_187;
    float _219 = _209 + _217;
    float _221 = _114 * _167;
    float _223 = _221 * _219;
    float _225 = 0.0 + _223;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _231 = -_213;
    float _233 = fma(_205, _229, _231);
    float _235 = _233 * _179;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _227 * _237;
    float _241 = _239 * _215;
    bool _245 = _241 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _247 = isnan(_241);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _253 = _249 || _251;
    float _255 = in.m_46.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_48.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = in.m_48.y;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_46.z;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    if (!_253)
    {
        discard_fragment();
    }
    float _279 = _114 * _259;
    float _281 = _114 * _193;
    float _283 = _114 * _265;
    float _285 = _114 * _271;
    float _287 = _114 * _277;
    float _289 = _114 * _199;
    float _291 = -_283;
    float _293 = _279 + _291;
    float _295 = -_285;
    float _297 = _281 + _295;
    float _299 = _143 * _143;
    float _301 = -_289;
    float _303 = _287 + _301;
    float _305 = _145 * _145;
    float _307 = _147 * _147;
    float _309 = fma(_299, _293, _283);
    float _311 = fma(_305, _297, _285);
    float _313 = fma(_307, _303, _289);
    if (!_253)
    {
        out.m_53.x = _309;
        out.m_53.y = _311;
        out.m_53.z = _313;
        out.m_53.w = _223;
        return out;
    }
    float _315 = in.m_55.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_55.x;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_55.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = _114 * _319;
    float _335 = _114 * _325;
    float _337 = _114 * _331;
    float _339 = _333 * _333;
    float _341 = in.m_57.x;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = fma(_335, _335, _339);
    float _349 = fma(_337, _337, _347);
    float _351 = rsqrt(_349);
    float _353 = _335 * _351;
    float _355 = _333 * _351;
    float _357 = _337 * _351;
    float _359 = _114 * _345;
    float _361 = abs(_353);
    float _363 = abs(_355);
    float _365 = precise::max(_361, _363);
    float _367 = precise::min(_359, 1.0);
    float _369 = abs(_357);
    float _371 = precise::max(_369, _365);
    float _373 = 1.0 / _371;
    float _375 = _353 * _373;
    float _377 = _355 * _373;
    float _379 = -_373;
    float _381 = _357 * _379;
    float3 _987 = float3(_375, _377, _381);
    float3 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_987, float3(0.0), isnan(_987)), level(_367)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_987, float3(0.0), isnan(_987)), level(_367)).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    float _393 = in.m_59.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_59.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_61.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_61.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_61.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_63.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_63.y;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_63.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_63.w;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    bool _453 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _455 = _114 * _397;
    float _457 = _114 * _409;
    float _459 = _114 * _415;
    float _461 = _114 * _421;
    float _463 = _114 * _427;
    float _465 = _114 * _439;
    float _467 = _114 * _445;
    float _469 = fma(_387, 0.20999999344348907470703125, _455);
    float _471 = _114 * _403;
    float _473 = fma(_389, 0.20999999344348907470703125, _457);
    float _475 = _114 * _433;
    float _477 = _469 + _461;
    float _479 = fma(_391, 0.20999999344348907470703125, _471);
    float _481 = _471;
    if (_453)
    {
        float _483 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _485 = _213 + _483;
        _481 = _485;
    }
    float _487 = _481;
    float _489 = _473 + _463;
    float _491 = _114 * _451;
    float _493 = _479 + _459;
    float _495 = 0.0 + _241;
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _487;
    float _501 = _497;
    if (_453)
    {
        float _503 = _487 * 8.0;
        float _505 = precise::clamp(_503, 0.0, 1.0);
        _499 = _505;
    }
    float _507 = _499;
    float _509 = _309 * _477;
    float _511 = _311 * _489;
    float _513 = _313 * _493;
    if (_453)
    {
        float _515 = _497 * _507;
        _501 = _515;
    }
    float _517 = _501;
    float _519 = fma(_509, _491, _475);
    float _521 = fma(_511, _491, _465);
    float _523 = fma(_513, _491, _467);
    float _525 = 0.0 + _517;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    out.m_53.x = _519;
    out.m_53.y = _521;
    out.m_53.z = _523;
    out.m_53.w = _527;
    return out;
}

