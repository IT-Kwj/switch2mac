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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
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
    float4 m_46 [[user(locn4), flat]];
    float4 m_42 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _555 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).w;
    float _92 = in.m_44.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.x;
    float _112 = in.m_42.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_42.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _84 * _96;
    float _126 = _84 * _102;
    float _128 = _84 * _108;
    float _130 = 1.0 / _124;
    float _132 = _126 * _130;
    float _134 = _128 * _130;
    float2 _621 = float2(_134, _132);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_621, float2(0.0), isnan(_621))).x;
    float _138 = _110 * _90;
    float _140 = _84 * _116;
    float _142 = _84 * _122;
    float _144 = fma(_138, (*spvDescriptorSet0.fp_c9)._m0[21].y, _140);
    float _146 = fma(_138, (*spvDescriptorSet0.fp_c9)._m0[21].x, _142);
    float2 _651 = float2(_146, _144);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_651, float2(0.0), isnan(_651))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_651, float2(0.0), isnan(_651))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float _159 = in.m_44.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_48.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_50.w;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_52.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = _84 * _163;
    float _185 = _183 * _130;
    float _187 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _191 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[30].w, _189);
    float _193 = 1.0 / _191;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _197 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _195);
    float _199 = _84 * _169;
    float _201 = _84 * _175;
    float _203 = 1.0 / _197;
    float _205 = in.m_48.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_50.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_50.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = _84 * _215;
    float _225 = -_199;
    float _227 = _157 + _225;
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _231 = _193 * _229;
    float _233 = _84 * _181;
    float _235 = _201 * _227;
    float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _239 = -_231;
    float _241 = fma(_203, _237, _239);
    float _243 = 0.0 + _235;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _241 * _187;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _245 * _249;
    float _253 = _251 * _233;
    bool _257 = _253 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _259 = isnan(_253);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _265 = _261 || _263;
    float _267 = in.m_48.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = in.m_50.x;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = in.m_48.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    if (!_265)
    {
        discard_fragment();
    }
    float _285 = _84 * _271;
    float _287 = _84 * _209;
    float _289 = _84 * _277;
    float _291 = _84 * _283;
    float _293 = _84 * _221;
    float _295 = -_223;
    float _297 = _287 + _295;
    float _299 = -_289;
    float _301 = _285 + _299;
    float _303 = _151 * _151;
    float _305 = -_293;
    float _307 = _291 + _305;
    float _309 = _153 * _153;
    float _311 = _155 * _155;
    float _313 = fma(_303, _301, _289);
    float _315 = fma(_309, _297, _223);
    float _317 = fma(_311, _307, _293);
    if (!_265)
    {
        out.m_55.x = _313;
        out.m_55.y = _315;
        out.m_55.z = _317;
        out.m_55.w = _235;
        return out;
    }
    float _319 = in.m_57.y;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_57.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_57.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = _84 * _323;
    float _339 = _84 * _329;
    float _341 = _84 * _335;
    float _343 = _337 * _337;
    float _345 = fma(_339, _339, _343);
    float _347 = fma(_341, _341, _345);
    float _349 = rsqrt(_347);
    float _351 = _339 * _349;
    float _353 = _337 * _349;
    float _355 = _341 * _349;
    float _357 = abs(_351);
    float _359 = abs(_353);
    float _361 = precise::max(_357, _359);
    float _363 = abs(_355);
    float _365 = precise::max(_363, _361);
    float _367 = 1.0 / _365;
    float _369 = -_367;
    float _371 = _355 * _369;
    float _373 = _351 * _367;
    float _375 = _353 * _367;
    float3 _980 = float3(_373, _375, _371);
    float3 _379 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_980, float3(0.0), isnan(_980)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_980, float3(0.0), isnan(_980)), level(0.0)).xyz;
    float _381 = _379.x;
    float _383 = _379.y;
    float _385 = _379.z;
    float _387 = in.m_59.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_59.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.y;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_61.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_61.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_61.y;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_63.x;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_63.y;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_63.z;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_63.w;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    bool _447 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _449 = _84 * _391;
    float _451 = _84 * _403;
    float _453 = _84 * _409;
    float _455 = _84 * _415;
    float _457 = _84 * _421;
    float _459 = _84 * _433;
    float _461 = fma(_381, 0.20999999344348907470703125, _449);
    float _463 = _84 * _397;
    float _465 = fma(_383, 0.20999999344348907470703125, _451);
    float _467 = _84 * _427;
    float _469 = _461 + _455;
    float _471 = fma(_385, 0.20999999344348907470703125, _463);
    float _473 = _463;
    if (_447)
    {
        float _475 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _477 = _231 + _475;
        _473 = _477;
    }
    float _479 = _473;
    float _481 = _465 + _457;
    float _483 = _84 * _439;
    float _485 = _471 + _453;
    float _487 = 0.0 + _253;
    float _489 = precise::clamp(_487, 0.0, 1.0);
    float _491 = _479;
    float _493 = _489;
    if (_447)
    {
        float _495 = _479 * 8.0;
        float _497 = precise::clamp(_495, 0.0, 1.0);
        _491 = _497;
    }
    float _499 = _491;
    float _501 = _84 * _445;
    float _503 = _313 * _469;
    float _505 = _315 * _481;
    float _507 = _317 * _485;
    if (_447)
    {
        float _509 = _489 * _499;
        _493 = _509;
    }
    float _511 = _493;
    float _513 = fma(_503, _501, _467);
    float _515 = fma(_505, _501, _459);
    float _517 = fma(_507, _501, _483);
    float _519 = 0.0 + _511;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    out.m_55.x = _513;
    out.m_55.y = _515;
    out.m_55.z = _517;
    out.m_55.w = _521;
    return out;
}

