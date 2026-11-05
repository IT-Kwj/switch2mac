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
    float4 m_32 [[color(4)]];
    float4 m_34 [[color(5)]];
    float4 m_36 [[color(6)]];
    float4 m_38 [[color(7)]];
};

struct main0_in
{
    float4 m_21 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_21.x;
    float _47 = in.m_21.y;
    float3 _141 = float3(_45, _47, 0.0);
    float4 _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_141, float3(0.0), isnan(_141))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_141, float3(0.0), isnan(_141))).xyzw;
    float _52 = _50.x;
    float _54 = _50.y;
    float _56 = _50.z;
    float _58 = _50.w;
    float3 _161 = float3(_45, _47, 0.125);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_161, float3(0.0), isnan(_161))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_161, float3(0.0), isnan(_161))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float3 _178 = float3(_45, _47, 0.25);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_178, float3(0.0), isnan(_178))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_178, float3(0.0), isnan(_178))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float3 _195 = float3(_45, _47, 0.375);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_195, float3(0.0), isnan(_195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_195, float3(0.0), isnan(_195))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float3 _212 = float3(_45, _47, 0.5);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float3(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float3(0.0), isnan(_212))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float3 _229 = float3(_45, _47, 0.625);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_229, float3(0.0), isnan(_229))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_229, float3(0.0), isnan(_229))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float3 _246 = float3(_45, _47, 0.75);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_246, float3(0.0), isnan(_246))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_246, float3(0.0), isnan(_246))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float3 _263 = float3(_45, _47, 0.875);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float3(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float3(0.0), isnan(_263))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    out.m_24.x = _52;
    out.m_24.y = _54;
    out.m_24.z = _56;
    out.m_24.w = _58;
    out.m_26.x = _62;
    out.m_26.y = _64;
    out.m_26.z = _66;
    out.m_26.w = _68;
    out.m_28.x = _72;
    out.m_28.y = _74;
    out.m_28.z = _76;
    out.m_28.w = _78;
    out.m_30.x = _82;
    out.m_30.y = _84;
    out.m_30.z = _86;
    out.m_30.w = _88;
    out.m_32.x = _92;
    out.m_32.y = _94;
    out.m_32.z = _96;
    out.m_32.w = _98;
    out.m_34.x = _102;
    out.m_34.y = _104;
    out.m_34.z = _106;
    out.m_34.w = _108;
    out.m_36.x = _112;
    out.m_36.y = _114;
    out.m_36.z = _116;
    out.m_36.w = _118;
    out.m_38.x = _122;
    out.m_38.y = _124;
    out.m_38.z = _126;
    out.m_38.w = _128;
    return out;
}

