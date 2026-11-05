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
    float2 _77 = float2(_31, _33);
    float3 _37 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_77, float2(0.0), isnan(_77))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_77, float2(0.0), isnan(_77))).xyz;
    float _39 = _37.x;
    float _41 = _37.y;
    float _43 = _37.z;
    float _45 = fma(_41, 2.0, -1.0);
    float _47 = fma(_39, 2.0, -1.0);
    float _49 = fma(_43, 2.0, -1.0);
    float _51 = _45 * _45;
    float _53 = fma(_47, _47, _51);
    float _55 = fma(_49, _49, _53);
    float _57 = rsqrt(_55);
    float _59 = _57 * 0.5;
    float _61 = fma(_47, _59, 0.5);
    float _63 = fma(_45, _59, 0.5);
    float _65 = fma(_49, _59, 0.5);
    out.m_24.x = _61;
    out.m_24.y = _63;
    out.m_24.z = _65;
    return out;
}

