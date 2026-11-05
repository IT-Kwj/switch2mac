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
    float4 m_24 [[color(0)]];
};

struct main0_in
{
    float4 m_21 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _31 = in.m_21.x;
    float _33 = in.m_21.y;
    float _35 = in.m_21.z;
    float2 _80 = float2(_33, _31);
    float3 _39 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_80, float2(0.0), isnan(_80))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_80, float2(0.0), isnan(_80))).xyz;
    float _41 = _39.x;
    float _43 = _39.y;
    float _45 = _39.z;
    float2 _98 = float2(_35, _31);
    float3 _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_98, float2(0.0), isnan(_98))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_98, float2(0.0), isnan(_98))).xyz;
    float _49 = _47.x;
    float _51 = _47.y;
    float _53 = _47.z;
    float _55 = _41 + _49;
    float _57 = _43 + _51;
    float _59 = _45 + _53;
    float _61 = _55 * 0.5;
    float _63 = _57 * 0.5;
    float _65 = _59 * 0.5;
    out.m_24.x = _61;
    out.m_24.y = _63;
    out.m_24.z = _65;
    return out;
}

