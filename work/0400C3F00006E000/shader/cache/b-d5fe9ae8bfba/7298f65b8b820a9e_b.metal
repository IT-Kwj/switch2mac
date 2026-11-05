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
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _552;
    _552.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_88, _90));
    _552.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_88, _90));
    float _92 = _552.x;
    float _94 = _92 * 256.0;
    int _97 = int(_94);
    float _99 = float(uint(_97));
    float _101 = _99 * 0.00390625;
    float _103 = precise::min(_101, 2.0);
    float2 _572 = float2(_88, _90);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572)), level(_103)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572)), level(_103)).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float _116 = in.m_40.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_42.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_44.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _86 * _120;
    float _136 = _86 * _126;
    float _138 = in.m_42.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_46.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_42.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_46.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_46.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_40.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_40.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_40.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = _86 * _142;
    float _188 = _86 * _154;
    float _190 = _86 * _166;
    float _192 = _114 * _134;
    float _194 = _86 * _132;
    float _196 = _136 * _192;
    float _198 = 0.0 + _196;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _200 * _194;
    bool _205 = _202 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _207 = isnan(_202);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _213 = _209 || _211;
    float _215 = in.m_42.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_213)
    {
        discard_fragment();
    }
    float _221 = _86 * _148;
    float _223 = _86 * _160;
    float _225 = -_221;
    float _227 = _186 + _225;
    float _229 = -_223;
    float _231 = _188 + _229;
    float _233 = fma(_108, _227, _221);
    float _235 = fma(_110, _231, _223);
    float _237 = _86 * _172;
    float _239 = _86 * _178;
    float _241 = _86 * _184;
    float _243 = _233 * _237;
    float _245 = _86 * _219;
    float _247 = _235 * _239;
    float _249 = -_190;
    float _251 = _245 + _249;
    float _253 = fma(_112, _251, _190);
    float _255 = _253 * _241;
    if (!_213)
    {
        out.m_49.x = _243;
        out.m_49.y = _247;
        out.m_49.z = _255;
        out.m_49.w = _196;
        return out;
    }
    float _257 = in.m_51.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _265 = in.m_51.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_51.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_57.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = _86 * _261;
    bool _285 = as_type<int>(_263) != 0;
    float _287 = _86 * _269;
    bool _289 = !_285;
    float _291 = -_283;
    float _293 = _289 ? _291 : _283;
    float _295 = _86 * _275;
    bool _297 = !_285;
    float _299 = -_287;
    float _301 = _297 ? _299 : _287;
    float _303 = _293 * _293;
    bool _305 = !_285;
    float _307 = -_295;
    float _309 = _305 ? _307 : _295;
    float _311 = fma(_301, _301, _303);
    float _313 = fma(_309, _309, _311);
    float _315 = rsqrt(_313);
    float _317 = _301 * _315;
    float _319 = _293 * _315;
    float _321 = _309 * _315;
    float _323 = abs(_317);
    float _325 = abs(_319);
    float _327 = precise::max(_323, _325);
    float _329 = abs(_321);
    float _331 = precise::max(_329, _327);
    float _333 = _86 * _281;
    float _335 = 1.0 / _331;
    float _337 = precise::min(_333, 1.0);
    float _339 = -_335;
    float _341 = _321 * _339;
    float _343 = _317 * _335;
    float _345 = _319 * _335;
    float3 _917 = float3(_343, _345, _341);
    float3 _349 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_917, float3(0.0), isnan(_917)), level(_337)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_917, float3(0.0), isnan(_917)), level(_337)).xyz;
    float _351 = _349.x;
    float _353 = _349.y;
    float _355 = _349.z;
    float _357 = in.m_59.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_59.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_59.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_61.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_61.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_61.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_63.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_63.w;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_63.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_63.z;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    bool _417 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _419 = _86 * _361;
    float _421 = _86 * _367;
    float _423 = _86 * _373;
    float _425 = fma(_353, 0.20999999344348907470703125, _421);
    float _427 = fma(_355, 0.20999999344348907470703125, _423);
    float _429 = fma(_351, 0.20999999344348907470703125, _419);
    float _431 = _86 * _379;
    float _433 = _86 * _385;
    float _435 = _86 * _391;
    float _437 = _425 + _431;
    float _439 = _427 + _433;
    float _441 = _429 + _435;
    float _443 = _86 * _403;
    float _445 = _247 * _437;
    float _447 = _255 * _439;
    float _449 = _243 * _441;
    float _451 = 0.0 + _202;
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = _86 * _397;
    float _457 = _86 * _409;
    float _459 = _86 * _415;
    float _461 = fma(_449, _443, _455);
    float _463 = fma(_445, _443, _457);
    float _465 = fma(_447, _443, _459);
    float _467 = _455;
    if (!_417)
    {
        _467 = _453;
    }
    float _469 = _467;
    bool _471 = !_417;
    float _473 = _469;
    if (!_471)
    {
        float _475 = in.m_65.w;
        float _477 = gl_FragCoord.w;
        float _479 = _475 * _477;
        float _481 = in.m_65.z;
        float _483 = gl_FragCoord.w;
        float _485 = _481 * _483;
        float _487 = _86 * _479;
        float _489 = _86 * _485;
        float _491 = 1.0 / _487;
        float _493 = _489 * _491;
        float _495 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _497 = fma(_493, (*spvDescriptorSet0.fp_c8)._m0[30].w, _495);
        float _499 = 1.0 / _497;
        float _501 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _503 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _505 = fma(_499, _501, _503);
        float _507 = _505 * 8.0;
        float _509 = precise::clamp(_507, 0.0, 1.0);
        float _511 = _453 * _509;
        _473 = _511;
    }
    float _513 = _473;
    float _515 = 0.0 + _513;
    float _517 = precise::clamp(_515, 0.0, 1.0);
    out.m_49.x = _461;
    out.m_49.y = _463;
    out.m_49.z = _465;
    out.m_49.w = _517;
    return out;
}

