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
    texture3d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_24 [[color(0)]];
    float4 m_26 [[color(1)]];
};

struct main0_in
{
    float4 m_21 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _33 = in.m_21.x;
    float _35 = in.m_21.y;
    float3 _69 = float3(_33, _35, 0.0);
    float4 _38 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_69, float3(0.0), isnan(_69))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_69, float3(0.0), isnan(_69))).xyzw;
    float _40 = _38.x;
    float _42 = _38.y;
    float _44 = _38.z;
    float _46 = _38.w;
    float3 _89 = float3(_33, _35, 0.125);
    float4 _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_89, float3(0.0), isnan(_89))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_89, float3(0.0), isnan(_89))).xyzw;
    float _50 = _48.x;
    float _52 = _48.y;
    float _54 = _48.z;
    float _56 = _48.w;
    out.m_24.x = _40;
    out.m_24.y = _42;
    out.m_24.z = _44;
    out.m_24.w = _46;
    out.m_26.x = _50;
    out.m_26.y = _52;
    out.m_26.z = _54;
    out.m_26.w = _56;
    return out;
}

