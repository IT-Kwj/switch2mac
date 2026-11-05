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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.y;
    float _41 = in.m_27.x;
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _39 * _39;
    float _49 = fma(_39, 2.0, _45);
    float _51 = fma(_41, _41, _47);
    float _53 = rsqrt(_51);
    float _55 = _53 * _39;
    float _57 = _53 * _41;
    float _59 = fma(_41, 2.0, _43);
    float _61 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float _63 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float2 _162 = float2(_43, _45);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_162, float2(0.0), isnan(_162))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_162, float2(0.0), isnan(_162))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[1].w, _61);
    float _77 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[1].w, _63);
    float2 _190 = float2(_59, _49);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_190, float2(0.0), isnan(_190))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _204 = float2(_77, _75);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_204, float2(0.0), isnan(_204))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _81 + _69;
    float _97 = _83 + _71;
    float _99 = _85 + _73;
    float _101 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[1].x, _95);
    float _103 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[1].y, _97);
    float _105 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[1].z, _99);
    float _107 = _101 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _109 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _111 = _105 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _107;
    out.m_32.y = _109;
    out.m_32.z = _111;
    return out;
}

