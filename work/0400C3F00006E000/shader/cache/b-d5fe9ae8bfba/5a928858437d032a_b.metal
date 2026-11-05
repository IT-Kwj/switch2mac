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
    float _49 = fma(_41, _41, _47);
    float _51 = rsqrt(_49);
    float _53 = _51 * _41;
    float _55 = _51 * _39;
    float _57 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _59 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float _61 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[1].w, _57);
    float _63 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[1].w, _59);
    float2 _147 = float2(_43, _45);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_147, float2(0.0), isnan(_147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_147, float2(0.0), isnan(_147))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float2 _165 = float2(_61, _63);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_165, float2(0.0), isnan(_165))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_165, float2(0.0), isnan(_165))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[1].x, _69);
    float _85 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[1].y, _71);
    float _87 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[1].z, _73);
    float _89 = _83 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _91 = _85 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _93 = _87 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _89;
    out.m_32.y = _91;
    out.m_32.z = _93;
    return out;
}

