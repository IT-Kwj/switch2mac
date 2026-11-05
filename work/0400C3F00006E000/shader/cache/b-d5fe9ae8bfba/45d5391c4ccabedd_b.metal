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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _510;
    _510.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_86, _88));
    _510.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_86, _88));
    float _90 = _510.x;
    float _92 = _90 * 256.0;
    int _95 = int(_92);
    float _97 = float(uint(_95));
    float _99 = _97 * 0.00390625;
    float _101 = precise::min(_99, 2.0);
    float2 _530 = float2(_86, _88);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530)), level(_101)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530)), level(_101)).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_40.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_42.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_40.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = _84 * _118;
    float _134 = _84 * _124;
    float _136 = in.m_44.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_40.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_44.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_40.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_44.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _84 * _130;
    float _168 = _84 * _146;
    float _170 = _84 * _152;
    float _172 = _84 * _158;
    float _174 = _84 * _164;
    float _176 = -_170;
    float _178 = _166 + _176;
    float _180 = -_174;
    float _182 = _172 + _180;
    float _184 = _112 * _132;
    float _186 = 0.0 + _184;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _188 * _134;
    bool _193 = _190 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _195 = isnan(_190);
    bool _197 = _193 || _195;
    bool _199 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _201 = _197 || _199;
    if (!_201)
    {
        discard_fragment();
    }
    float _203 = _84 * _140;
    float _205 = fma(_108, _178, _170);
    float _207 = fma(_110, _182, _174);
    float _209 = -_203;
    float _211 = _168 + _209;
    float _213 = fma(_106, _211, _203);
    if (!_201)
    {
        out.m_47.x = _213;
        out.m_47.y = _205;
        out.m_47.z = _207;
        out.m_47.w = _184;
        return out;
    }
    float _215 = in.m_49.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _223 = in.m_49.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_49.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_55.x;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = _84 * _219;
    bool _243 = as_type<int>(_221) != 0;
    float _245 = _84 * _227;
    bool _247 = !_243;
    float _249 = -_241;
    float _251 = _247 ? _249 : _241;
    float _253 = _84 * _233;
    bool _255 = !_243;
    float _257 = -_245;
    float _259 = _255 ? _257 : _245;
    float _261 = _251 * _251;
    bool _263 = !_243;
    float _265 = -_253;
    float _267 = _263 ? _265 : _253;
    float _269 = fma(_259, _259, _261);
    float _271 = fma(_267, _267, _269);
    float _273 = rsqrt(_271);
    float _275 = _259 * _273;
    float _277 = _251 * _273;
    float _279 = _267 * _273;
    float _281 = abs(_275);
    float _283 = abs(_277);
    float _285 = precise::max(_281, _283);
    float _287 = abs(_279);
    float _289 = precise::max(_287, _285);
    float _291 = _84 * _239;
    float _293 = 1.0 / _289;
    float _295 = precise::min(_291, 1.0);
    float _297 = -_293;
    float _299 = _279 * _297;
    float _301 = _275 * _293;
    float _303 = _277 * _293;
    float3 _823 = float3(_301, _303, _299);
    float3 _307 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_823, float3(0.0), isnan(_823)), level(_295)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_823, float3(0.0), isnan(_823)), level(_295)).xyz;
    float _309 = _307.x;
    float _311 = _307.y;
    float _313 = _307.z;
    float _315 = in.m_57.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_57.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_57.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_59.y;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_59.z;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_59.x;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_61.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_61.w;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_61.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_61.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    bool _375 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _377 = _84 * _319;
    float _379 = _84 * _325;
    float _381 = _84 * _331;
    float _383 = fma(_311, 0.20999999344348907470703125, _379);
    float _385 = fma(_313, 0.20999999344348907470703125, _381);
    float _387 = fma(_309, 0.20999999344348907470703125, _377);
    float _389 = _84 * _337;
    float _391 = _84 * _343;
    float _393 = _84 * _349;
    float _395 = _383 + _389;
    float _397 = _385 + _391;
    float _399 = _387 + _393;
    float _401 = _84 * _361;
    float _403 = _205 * _395;
    float _405 = _207 * _397;
    float _407 = _213 * _399;
    float _409 = 0.0 + _190;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = _84 * _355;
    float _415 = _84 * _367;
    float _417 = _84 * _373;
    float _419 = fma(_407, _401, _413);
    float _421 = fma(_403, _401, _415);
    float _423 = fma(_405, _401, _417);
    float _425 = _413;
    if (!_375)
    {
        _425 = _411;
    }
    float _427 = _425;
    bool _429 = !_375;
    float _431 = _427;
    if (!_429)
    {
        float _433 = in.m_63.w;
        float _435 = gl_FragCoord.w;
        float _437 = _433 * _435;
        float _439 = in.m_63.z;
        float _441 = gl_FragCoord.w;
        float _443 = _439 * _441;
        float _445 = _84 * _437;
        float _447 = _84 * _443;
        float _449 = 1.0 / _445;
        float _451 = _447 * _449;
        float _453 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _455 = fma(_451, (*spvDescriptorSet0.fp_c8)._m0[30].w, _453);
        float _457 = 1.0 / _455;
        float _459 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _461 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _463 = fma(_457, _459, _461);
        float _465 = _463 * 8.0;
        float _467 = precise::clamp(_465, 0.0, 1.0);
        float _469 = _411 * _467;
        _431 = _469;
    }
    float _471 = _431;
    float _473 = 0.0 + _471;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    out.m_47.x = _419;
    out.m_47.y = _421;
    out.m_47.z = _423;
    out.m_47.w = _475;
    return out;
}

