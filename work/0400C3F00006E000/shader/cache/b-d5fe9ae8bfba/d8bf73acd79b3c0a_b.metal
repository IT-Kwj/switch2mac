#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    float2 _154 = float2(_51, _53);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_154, float2(0.0), isnan(_154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_154, float2(0.0), isnan(_154))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_25.w;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = _49 * _70;
    float _74 = _60 * _72;
    float _76 = _62 * _72;
    float _78 = _58 * _72;
    float _80 = spvFAdd(_74, 1.0);
    float _82 = spvFAdd(_76, 1.0);
    float _84 = spvFAdd(_78, 1.0);
    float _86 = 1.0 / _80;
    float _88 = 1.0 / _82;
    float _90 = 1.0 / _84;
    float _92 = _74 * _86;
    float _94 = _76 * _88;
    float _96 = abs(_92);
    float _98 = log2(_96);
    float _100 = _78 * _90;
    float _102 = abs(_94);
    float _104 = log2(_102);
    float _106 = abs(_100);
    float _108 = log2(_106);
    float _110 = _98 * 2.2000000476837158203125;
    float _112 = _104 * 2.2000000476837158203125;
    float _114 = exp2(_110);
    float _116 = _108 * 2.2000000476837158203125;
    float _118 = exp2(_112);
    float _120 = exp2(_116);
    out.m_28.x = _120;
    out.m_28.y = _114;
    out.m_28.z = _118;
    out.m_28.w = _64;
    return out;
}

