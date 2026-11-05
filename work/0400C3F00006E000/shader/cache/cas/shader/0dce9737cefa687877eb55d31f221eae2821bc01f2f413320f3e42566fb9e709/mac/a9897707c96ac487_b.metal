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
    float4 m_28 [[color(2)]];
    float4 m_30 [[color(3)]];
};

struct main0_in
{
    float4 m_21 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_21.x;
    float _39 = in.m_21.y;
    float3 _93 = float3(_37, _39, 0.0);
    float4 _42 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_93, float3(0.0), isnan(_93))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_93, float3(0.0), isnan(_93))).xyzw;
    float _44 = _42.x;
    float _46 = _42.y;
    float _48 = _42.z;
    float _50 = _42.w;
    float3 _113 = float3(_37, _39, 0.125);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_113, float3(0.0), isnan(_113))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_113, float3(0.0), isnan(_113))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float3 _130 = float3(_37, _39, 0.25);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_130, float3(0.0), isnan(_130))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_130, float3(0.0), isnan(_130))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float3 _147 = float3(_37, _39, 0.375);
    float4 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_147, float3(0.0), isnan(_147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_147, float3(0.0), isnan(_147))).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    out.m_24.x = _44;
    out.m_24.y = _46;
    out.m_24.z = _48;
    out.m_24.w = _50;
    out.m_26.x = _54;
    out.m_26.y = _56;
    out.m_26.z = _58;
    out.m_26.w = _60;
    out.m_28.x = _64;
    out.m_28.y = _66;
    out.m_28.z = _68;
    out.m_28.w = _70;
    out.m_30.x = _74;
    out.m_30.y = _76;
    out.m_30.z = _78;
    out.m_30.w = _80;
    return out;
}

