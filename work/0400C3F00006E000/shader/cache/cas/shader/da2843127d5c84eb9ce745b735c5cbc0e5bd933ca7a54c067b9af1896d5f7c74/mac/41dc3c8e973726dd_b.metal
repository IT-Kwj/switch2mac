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
    float4 m_29 [[user(locn0), center_no_perspective]];
    float4 m_27 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.y;
    float _41 = in.m_29.y;
    float _43 = in.m_27.x;
    float _45 = in.m_29.x;
    float _47 = fma(_41, 2.0, _39);
    float _49 = fma(_41, 2.0, _39);
    float _51 = fma(_45, 2.0, _43);
    float _53 = fma(_45, 2.0, _43);
    float2 _131 = float2(_43, _39);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_131, float2(0.0), isnan(_131))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_131, float2(0.0), isnan(_131))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float2 _149 = float2(_51, _47);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_149, float2(0.0), isnan(_149))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_149, float2(0.0), isnan(_149))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = fma(_45, 2.0, _53);
    float _75 = fma(_41, 2.0, _49);
    float2 _169 = float2(_73, _75);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_169, float2(0.0), isnan(_169))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _59 + _67;
    float _87 = _61 + _69;
    float _89 = _63 + _71;
    float _91 = _79 + _85;
    float _93 = _81 + _87;
    float _95 = _83 + _89;
    float _97 = _91 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _99 = _93 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _101 = _95 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _97;
    out.m_32.y = _99;
    out.m_32.z = _101;
    return out;
}

