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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_29.x;
    float _41 = in.m_29.y;
    float2 _95 = float2(_39, _41);
    float3 _45 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_95, float2(0.0), isnan(_95))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_95, float2(0.0), isnan(_95))).xyz;
    float _47 = _45.x;
    float _49 = _45.y;
    float _51 = _45.z;
    float2 _113 = float2(_39, _41);
    float3 _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_113, float2(0.0), isnan(_113))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_113, float2(0.0), isnan(_113))).xyz;
    float _55 = _53.x;
    float _57 = _53.y;
    float _59 = _53.z;
    float _61 = precise::max(_47, _49);
    float _63 = precise::max(_51, _61);
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _67 = _63 + _65;
    float _69 = precise::max(0.0, _67);
    float _71 = precise::min(_69, 10.0);
    float _73 = _71 + (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _75 = 1.0 / _73;
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _79 = _55 * _77;
    float _81 = _57 * _77;
    float _83 = _59 * _77;
    out.m_32.x = _79;
    out.m_32.y = _81;
    out.m_32.z = _83;
    return out;
}

