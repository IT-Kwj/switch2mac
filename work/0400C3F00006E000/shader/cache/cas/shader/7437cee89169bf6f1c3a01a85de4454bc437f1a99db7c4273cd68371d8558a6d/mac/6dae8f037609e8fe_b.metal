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
    constant _16* fp_c3 [[id(0)]];
    texture3d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
    float4 m_32 [[color(1)]];
    float4 m_34 [[color(2)]];
    float4 m_36 [[color(3)]];
    float4 m_38 [[color(4)]];
    float4 m_40 [[color(5)]];
    float4 m_42 [[color(6)]];
    float4 m_44 [[color(7)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _51 = in.m_27.x;
    float _53 = in.m_27.y;
    float _55 = (*spvDescriptorSet0.fp_c3)._m0[4].x * 0.125;
    float3 _85 = float3(_51, _53, _55);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_85, float3(0.0), isnan(_85))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_85, float3(0.0), isnan(_85))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    out.m_30.x = _60;
    out.m_30.y = _62;
    out.m_30.z = _64;
    out.m_30.w = _66;
    out.m_32.x = _60;
    out.m_32.y = _62;
    out.m_32.z = _64;
    out.m_32.w = _66;
    out.m_34.x = _60;
    out.m_34.y = _62;
    out.m_34.z = _64;
    out.m_34.w = _66;
    out.m_36.x = _60;
    out.m_36.y = _62;
    out.m_36.z = _64;
    out.m_36.w = _66;
    out.m_38.x = _60;
    out.m_38.y = _62;
    out.m_38.z = _64;
    out.m_38.w = _66;
    out.m_40.x = _60;
    out.m_40.y = _62;
    out.m_40.z = _64;
    out.m_40.w = _66;
    out.m_42.x = _60;
    out.m_42.y = _62;
    out.m_42.z = _64;
    out.m_42.w = _66;
    out.m_44.x = _60;
    out.m_44.y = _62;
    out.m_44.z = _64;
    out.m_44.w = _66;
    return out;
}

