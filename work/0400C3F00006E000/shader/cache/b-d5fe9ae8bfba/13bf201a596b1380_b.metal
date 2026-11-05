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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _156 = float2(_51, _53);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_156, float2(0.0), isnan(_156))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_156, float2(0.0), isnan(_156))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_25.w;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = _49 * _70;
    float _74 = _72 * (-1.44269502162933349609375);
    float _76 = _60 * _74;
    float _78 = _62 * _74;
    float _80 = _58 * _74;
    float _82 = exp2(_76);
    float _84 = exp2(_78);
    float _86 = exp2(_80);
    float _88 = -_82;
    float _90 = _88 + 1.0;
    float _92 = -_84;
    float _94 = _92 + 1.0;
    float _96 = abs(_90);
    float _98 = log2(_96);
    float _100 = -_86;
    float _102 = _100 + 1.0;
    float _104 = abs(_94);
    float _106 = log2(_104);
    float _108 = abs(_102);
    float _110 = log2(_108);
    float _112 = _98 * 0.4545454680919647216796875;
    float _114 = _106 * 0.4545454680919647216796875;
    float _116 = exp2(_112);
    float _118 = _110 * 0.4545454680919647216796875;
    float _120 = exp2(_114);
    float _122 = exp2(_118);
    out.m_28.x = _122;
    out.m_28.y = _116;
    out.m_28.z = _120;
    out.m_28.w = _64;
    return out;
}

