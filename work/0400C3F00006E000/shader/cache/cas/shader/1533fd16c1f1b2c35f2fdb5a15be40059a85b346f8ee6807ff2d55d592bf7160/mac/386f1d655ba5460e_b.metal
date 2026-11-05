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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture3d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture3d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_25.z;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_25.w;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_25.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_25.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = gl_FragCoord.x;
    float _63 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _65 = _61 / _63;
    float _67 = gl_FragCoord.y;
    float _69 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _71 = _67 / _69;
    float _73 = 1.0 / _35;
    float _75 = _73 * _41;
    float _77 = _73 * _47;
    float _79 = _73 * _53;
    float _81 = _73 * _59;
    float _83 = _75 * _77;
    float _85 = _65 * _79;
    float _87 = _71 * _81;
    float3 _179 = float3(_85, _87, _83);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_179, float3(0.0), isnan(_179))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_179, float3(0.0), isnan(_179))).xyz;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float3 _198 = float3(_85, _87, _83);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_198, float3(0.0), isnan(_198))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_198, float3(0.0), isnan(_198))).x;
    out.m_28.x = _93;
    out.m_28.y = _95;
    out.m_28.z = _97;
    out.m_28.w = _99;
    return out;
}

