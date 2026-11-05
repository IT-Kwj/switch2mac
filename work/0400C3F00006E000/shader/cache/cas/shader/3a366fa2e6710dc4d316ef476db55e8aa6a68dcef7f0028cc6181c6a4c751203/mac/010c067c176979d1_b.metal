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
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_42 [[user(locn3), flat]];
    float4 m_40 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _564 = float2(_88, _90);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float2(0.0), isnan(_564))).xy;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = in.m_42.x;
    float _102 = in.m_40.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_40.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _100 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _116 = fma(_96, 2.0, -1.0);
    float _118 = _100 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _120 = _86 * _106;
    float _122 = fma(_98, 2.0, -1.0);
    float _124 = _86 * _112;
    float _126 = fma(_114, _116, _120);
    float _128 = fma(_118, _122, _124);
    float2 _627 = float2(_126, _128);
    float4 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_627, float2(0.0), isnan(_627))).xyzw;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float _139 = _131.w;
    float _141 = in.m_44.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_46.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_48.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_50.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _86 * _145;
    float _167 = in.m_48.y;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_48.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_46.z;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_48.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_44.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_44.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_44.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _86 * _171;
    float _211 = _86 * _177;
    float _213 = _86 * _183;
    float _215 = _139 * _165;
    float _217 = _86 * _151;
    float _219 = _86 * _157;
    float _221 = _217 * _215;
    float _223 = _219 * _221;
    float _225 = _86 * _163;
    float _227 = 0.0 + _223;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _229 * _225;
    bool _235 = _231 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _237 = isnan(_231);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _243 = _239 || _241;
    float _245 = in.m_46.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_46.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    if (!_243)
    {
        discard_fragment();
    }
    float _257 = _86 * _249;
    float _259 = _86 * _255;
    float _261 = _86 * _189;
    float _263 = -_211;
    float _265 = _257 + _263;
    float _267 = -_209;
    float _269 = _259 + _267;
    float _271 = -_261;
    float _273 = _213 + _271;
    float _275 = fma(_133, _265, _211);
    float _277 = fma(_135, _269, _209);
    float _279 = fma(_137, _273, _261);
    float _281 = _86 * _195;
    float _283 = _86 * _201;
    float _285 = _86 * _207;
    float _287 = _275 * _281;
    float _289 = _277 * _283;
    float _291 = _279 * _285;
    if (!_243)
    {
        out.m_53.x = _287;
        out.m_53.y = _289;
        out.m_53.z = _291;
        out.m_53.w = _223;
        return out;
    }
    float _293 = in.m_55.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_55.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_55.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _86 * _297;
    float _313 = _86 * _303;
    float _315 = _86 * _309;
    float _317 = _311 * _311;
    float _319 = in.m_57.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = fma(_313, _313, _317);
    float _327 = fma(_315, _315, _325);
    float _329 = rsqrt(_327);
    float _331 = _313 * _329;
    float _333 = _311 * _329;
    float _335 = _315 * _329;
    float _337 = _86 * _323;
    float _339 = abs(_331);
    float _341 = abs(_333);
    float _343 = precise::max(_339, _341);
    float _345 = abs(_335);
    float _347 = precise::max(_345, _343);
    float _349 = 1.0 / _347;
    float _351 = _333 * _349;
    float _353 = -_349;
    float _355 = _335 * _353;
    float _357 = precise::min(_337, 1.0);
    float _359 = _331 * _349;
    float3 _948 = float3(_359, _351, _355);
    float3 _363 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_948, float3(0.0), isnan(_948)), level(_357)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_948, float3(0.0), isnan(_948)), level(_357)).xyz;
    float _365 = _363.x;
    float _367 = _363.y;
    float _369 = _363.z;
    float _371 = in.m_59.y;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = in.m_59.z;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_59.x;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_61.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_61.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_61.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_63.x;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = in.m_63.w;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = in.m_63.y;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_63.z;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = _86 * _375;
    float _433 = _86 * _381;
    float _435 = _86 * _387;
    bool _437 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _439 = fma(_367, 0.20999999344348907470703125, _431);
    float _441 = fma(_369, 0.20999999344348907470703125, _433);
    float _443 = fma(_365, 0.20999999344348907470703125, _435);
    float _445 = _86 * _393;
    float _447 = _86 * _399;
    float _449 = _86 * _405;
    float _451 = _439 + _445;
    float _453 = _441 + _447;
    float _455 = _443 + _449;
    float _457 = _86 * _417;
    float _459 = _289 * _451;
    float _461 = _291 * _453;
    float _463 = _287 * _455;
    float _465 = 0.0 + _231;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = _86 * _411;
    float _471 = _86 * _423;
    float _473 = _86 * _429;
    float _475 = fma(_463, _457, _469);
    float _477 = fma(_459, _457, _471);
    float _479 = fma(_461, _457, _473);
    float _481 = _469;
    if (!_437)
    {
        _481 = _467;
    }
    float _483 = _481;
    bool _485 = !_437;
    float _487 = _483;
    if (!_485)
    {
        float _489 = in.m_65.w;
        float _491 = gl_FragCoord.w;
        float _493 = _489 * _491;
        float _495 = in.m_65.z;
        float _497 = gl_FragCoord.w;
        float _499 = _495 * _497;
        float _501 = _86 * _493;
        float _503 = _86 * _499;
        float _505 = 1.0 / _501;
        float _507 = _503 * _505;
        float _509 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _511 = fma(_507, (*spvDescriptorSet0.fp_c8)._m0[30].w, _509);
        float _513 = 1.0 / _511;
        float _515 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _517 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _519 = fma(_513, _515, _517);
        float _521 = _519 * 8.0;
        float _523 = precise::clamp(_521, 0.0, 1.0);
        float _525 = _467 * _523;
        _487 = _525;
    }
    float _527 = _487;
    float _529 = 0.0 + _527;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    out.m_53.x = _475;
    out.m_53.y = _477;
    out.m_53.z = _479;
    out.m_53.w = _531;
    return out;
}

