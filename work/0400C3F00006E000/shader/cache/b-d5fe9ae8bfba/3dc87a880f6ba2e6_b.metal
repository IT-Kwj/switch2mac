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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _68;
    float _102 = _100 * _74;
    float _104 = _100 * _80;
    float _106 = _100 * _86;
    float _108 = _100 * _92;
    float _110 = 1.0 / _102;
    float _112 = _100 * _98;
    float _114 = _104 * _110;
    float _116 = _106 * _110;
    float2 _597 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _608 = float2(_108, _112);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_608, float2(0.0), isnan(_608))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_608, float2(0.0), isnan(_608))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_40.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_44.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_48.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _157 = _100 * _135;
    float _159 = _157 * _110;
    float _161 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[30].w, _161);
    float _165 = _100 * _141;
    float _167 = _100 * _153;
    float _169 = 1.0 / _163;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = _169 * _171;
    float _175 = in.m_50.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_46.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_44.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_44.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_44.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _100 * _185;
    float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _215 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _213);
    float _217 = -_165;
    float _219 = _129 + _217;
    float _221 = _100 * _147;
    float _223 = 1.0 / _215;
    float _225 = _221 * _219;
    float _227 = 0.0 + _225;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _233 = -_173;
    float _235 = fma(_223, _231, _233);
    float _237 = _235 * _155;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _229 * _239;
    float _243 = _241 * _167;
    bool _247 = _243 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _249 = isnan(_243);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _255 = _251 || _253;
    float _257 = in.m_50.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_50.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = _173;
    if (!_255)
    {
        discard_fragment();
    }
    float _271 = in.m_46.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _100 * _179;
    float _279 = _127 * _127;
    float _281 = -_279;
    float _283 = _281 + 1.0;
    float _285 = _100 * _261;
    float _287 = _100 * _267;
    float _289 = _285 * _285;
    float _291 = fma(_277, _277, _289);
    float _293 = _125 * _125;
    float _295 = fma(_287, _287, _291);
    float _297 = _123 * _123;
    float _299 = _100 * _191;
    float _301 = -_293;
    float _303 = _301 + 1.0;
    float _305 = _100 * _275;
    float _307 = rsqrt(_295);
    float _309 = -_297;
    float _311 = _309 + 1.0;
    float _313 = _211 * _303;
    float _315 = _299 * _283;
    float _317 = _100 * _197;
    float _319 = _305 * _311;
    float _321 = _100 * _203;
    float _323 = _100 * _209;
    float _325 = fma(_297, _317, _319);
    float _327 = fma(_293, _321, _313);
    float _329 = fma(_279, _323, _315);
    float _331 = _277 * _307;
    float _333 = _285 * _307;
    float _335 = _287 * _307;
    if (!_255)
    {
        out.m_53.x = _325;
        out.m_53.y = _327;
        out.m_53.z = _329;
        out.m_53.w = _225;
        return out;
    }
    float _337 = in.m_55.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = _333 * _333;
    float _345 = fma(_331, _331, _343);
    float _347 = fma(_335, _335, _345);
    float _349 = abs(_331);
    float _351 = abs(_333);
    float _353 = precise::max(_349, _351);
    float _355 = abs(_335);
    float _357 = precise::max(_355, _353);
    float _359 = rsqrt(_347);
    float _361 = 1.0 / _357;
    float _363 = -_333;
    float _365 = fma(_363, _359, 0.0);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _100 * _341;
    float _371 = _367 + _369;
    float _373 = _331 * _361;
    float _375 = _333 * _361;
    float _377 = -_361;
    float _379 = _335 * _377;
    float _381 = precise::min(_371, 1.0);
    float3 _982 = float3(_373, _375, _379);
    float3 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_982, float3(0.0), isnan(_982)), level(_381)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_982, float3(0.0), isnan(_982)), level(_381)).xyz;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _385.z;
    float _393 = in.m_57.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_57.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_57.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_59.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_59.x;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_59.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_61.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = in.m_61.y;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_61.z;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = in.m_61.w;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    bool _453 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_453)
    {
        float _455 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _457 = _173 + _455;
        _269 = _457;
    }
    float _459 = _269;
    float _461 = _100 * _397;
    float _463 = _100 * _415;
    float _465 = _100 * _421;
    float _467 = _100 * _427;
    float _469 = _459;
    if (_453)
    {
        float _471 = _459 * 8.0;
        float _473 = precise::clamp(_471, 0.0, 1.0);
        _469 = _473;
    }
    float _475 = _469;
    float _477 = _100 * _433;
    float _479 = _100 * _439;
    float _481 = fma(_387, 0.20999999344348907470703125, _461);
    float _483 = _100 * _403;
    float _485 = _100 * _409;
    float _487 = _100 * _445;
    float _489 = _481 + _465;
    float _491 = fma(_391, 0.20999999344348907470703125, _483);
    float _493 = fma(_389, 0.20999999344348907470703125, _485);
    float _495 = _100 * _451;
    float _497 = _325 * _489;
    float _499 = _491 + _463;
    float _501 = _493 + _467;
    float _503 = 0.0 + _243;
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = fma(_497, _495, _477);
    float _509 = _329 * _499;
    float _511 = _327 * _501;
    float _513 = _505;
    if (_453)
    {
        float _515 = _505 * _475;
        _513 = _515;
    }
    float _517 = _513;
    float _519 = fma(_509, _495, _487);
    float _521 = fma(_511, _495, _479);
    float _523 = 0.0 + _517;
    float _525 = precise::clamp(_523, 0.0, 1.0);
    out.m_53.x = _507;
    out.m_53.y = _521;
    out.m_53.z = _519;
    out.m_53.w = _525;
    return out;
}

