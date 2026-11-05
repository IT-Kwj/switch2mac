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
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
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
    float _37 = in.m_25.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_25.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _111 = float2(_51, _53);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_111, float2(0.0), isnan(_111))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_111, float2(0.0), isnan(_111))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _129 = float2(_51, _53);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_129, float2(0.0), isnan(_129))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_129, float2(0.0), isnan(_129))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _63 + _71;
    float _75 = _59 + _67;
    float _77 = _61 + _69;
    out.m_28.x = _75;
    out.m_28.y = _77;
    out.m_28.z = _73;
    out.m_28.w = 1.0;
    return out;
}

