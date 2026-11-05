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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    texture2d<float> fp_t_tcb_12 [[id(3)]];
    sampler fp_t_tcb_12Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    sampler fp_t_tcb_12Smplr_w [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.x;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = gl_FragCoord.y;
    float _51 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _53 = _49 / _51;
    float _55 = _47 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _57 = _53 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _115 = float2(_55, _57);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_115, float2(0.0), isnan(_115))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_115, float2(0.0), isnan(_115))).xy;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = fma(_63, 2.0, -1.0);
    float _69 = fma(_65, 2.0, -1.0);
    float _71 = fma(_67, (*spvDescriptorSet0.fp_c9)._m0[983].z, _55);
    float _73 = fma(_69, (*spvDescriptorSet0.fp_c9)._m0[983].w, _57);
    float2 _151 = float2(_71, _73);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_151, float2(0.0), isnan(_151))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_151, float2(0.0), isnan(_151))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    out.m_34.x = _79;
    out.m_34.y = _81;
    out.m_34.z = _83;
    out.m_34.w = as_type<float>(0x7fc00000u /* nan */);
    out.m_36.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
    uint4 m_36 [[color(1)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.x;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = gl_FragCoord.y;
    float _51 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _53 = _49 / _51;
    float _55 = _47 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _57 = _53 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _115 = float2(_55, _57);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_115, float2(0.0), isnan(_115))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_115, float2(0.0), isnan(_115))).xy;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = fma(_63, 2.0, -1.0);
    float _69 = fma(_65, 2.0, -1.0);
    float _71 = fma(_67, (*spvDescriptorSet0.fp_c9)._m0[983].z, _55);
    float _73 = fma(_69, (*spvDescriptorSet0.fp_c9)._m0[983].w, _57);
    float2 _151 = float2(_71, _73);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_151, float2(0.0), isnan(_151))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_151, float2(0.0), isnan(_151))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    out.m_34.x = _79;
    out.m_34.y = _81;
    out.m_34.z = _83;
    out.m_34.w = as_type<float>(0x7fc00000u /* nan */);
    out.m_36.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return main0_out_u{as_type<uint4>(out.m_34), as_type<uint4>(out.m_36)};
}


struct main0_out_m
{
    uint4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

fragment main0_out_m main0_m(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.x;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = gl_FragCoord.y;
    float _51 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _53 = _49 / _51;
    float _55 = _47 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _57 = _53 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _115 = float2(_55, _57);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_115, float2(0.0), isnan(_115))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_115, float2(0.0), isnan(_115))).xy;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = fma(_63, 2.0, -1.0);
    float _69 = fma(_65, 2.0, -1.0);
    float _71 = fma(_67, (*spvDescriptorSet0.fp_c9)._m0[983].z, _55);
    float _73 = fma(_69, (*spvDescriptorSet0.fp_c9)._m0[983].w, _57);
    float2 _151 = float2(_71, _73);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_151, float2(0.0), isnan(_151))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_151, float2(0.0), isnan(_151))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    out.m_34.x = _79;
    out.m_34.y = _81;
    out.m_34.z = _83;
    out.m_34.w = as_type<float>(0x7fc00000u /* nan */);
    out.m_36.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return main0_out_m{as_type<uint4>(out.m_34), out.m_36};
}

