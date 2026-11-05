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
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.x;
    float _39 = in.m_27.y;
    float _41 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _43 = _37 + _41;
    float _45 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _47 = _39 + _45;
    float _49 = fma((*spvDescriptorSet0.fp_c3)._m0[1].x, 2.0, _43);
    float _51 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 2.0, _47);
    float2 _144 = float2(_43, _47);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_144, float2(0.0), isnan(_144))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_144, float2(0.0), isnan(_144))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _162 = float2(_49, _47);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_162, float2(0.0), isnan(_162))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_162, float2(0.0), isnan(_162))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _176 = float2(_43, _51);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _190 = float2(_49, _51);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_190, float2(0.0), isnan(_190))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _57 + _65;
    float _89 = _59 + _67;
    float _91 = _61 + _69;
    float _93 = _87 + _73;
    float _95 = _89 + _75;
    float _97 = _91 + _77;
    float _99 = _93 + _81;
    float _101 = _95 + _83;
    float _103 = _97 + _85;
    float _105 = _99 * 0.25;
    float _107 = _101 * 0.25;
    float _109 = _103 * 0.25;
    out.m_30.x = _105;
    out.m_30.y = _107;
    out.m_30.z = _109;
    return out;
}

