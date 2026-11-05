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
    float _33 = in.m_21.w;
    float _35 = in.m_21.y;
    float _37 = in.m_21.z;
    float2 _99 = float2(_33, _31);
    float3 _41 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_99, float2(0.0), isnan(_99))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_99, float2(0.0), isnan(_99))).xyz;
    float _43 = _41.x;
    float _45 = _41.y;
    float _47 = _41.z;
    float2 _117 = float2(_35, _31);
    float3 _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_117, float2(0.0), isnan(_117))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_117, float2(0.0), isnan(_117))).xyz;
    float _51 = _49.x;
    float _53 = _49.y;
    float _55 = _49.z;
    float2 _131 = float2(_37, _31);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_131, float2(0.0), isnan(_131))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_131, float2(0.0), isnan(_131))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float _65 = _43 * 0.375;
    float _67 = _45 * 0.375;
    float _69 = _47 * 0.375;
    float _71 = fma(_51, 0.3125, _65);
    float _73 = fma(_53, 0.3125, _67);
    float _75 = fma(_55, 0.3125, _69);
    float _77 = fma(_59, 0.3125, _71);
    float _79 = fma(_61, 0.3125, _73);
    float _81 = fma(_63, 0.3125, _75);
    out.m_24.x = _77;
    out.m_24.y = _79;
    out.m_24.z = _81;
    return out;
}

