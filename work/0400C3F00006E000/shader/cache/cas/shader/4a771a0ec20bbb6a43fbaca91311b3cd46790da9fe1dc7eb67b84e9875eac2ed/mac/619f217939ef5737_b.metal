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
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_21 [[user(locn0), center_no_perspective]];
    float4 m_23 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _33 = in.m_21.x;
    float _35 = in.m_21.y;
    float _37 = in.m_23.x;
    float _39 = in.m_23.y;
    float _41 = in.m_21.z;
    float _43 = in.m_23.z;
    float2 _122 = float2(_33, _35);
    float3 _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_122, float2(0.0), isnan(_122))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_122, float2(0.0), isnan(_122))).xyz;
    float _49 = _47.x;
    float _51 = _47.y;
    float _53 = _47.z;
    float2 _140 = float2(_37, _39);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_140, float2(0.0), isnan(_140))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_140, float2(0.0), isnan(_140))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _154 = float2(_33, _41);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_154, float2(0.0), isnan(_154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_154, float2(0.0), isnan(_154))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _168 = float2(_37, _43);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_168, float2(0.0), isnan(_168))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_168, float2(0.0), isnan(_168))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _49 * 0.390625;
    float _81 = _51 * 0.390625;
    float _83 = _53 * 0.390625;
    float _85 = fma(_57, 0.109375, _79);
    float _87 = fma(_59, 0.109375, _81);
    float _89 = fma(_61, 0.109375, _83);
    float _91 = fma(_65, 0.390625, _85);
    float _93 = fma(_67, 0.390625, _87);
    float _95 = fma(_69, 0.390625, _89);
    float _97 = fma(_73, 0.109375, _91);
    float _99 = fma(_75, 0.109375, _93);
    float _101 = fma(_77, 0.109375, _95);
    out.m_26.x = _97;
    out.m_26.y = _99;
    out.m_26.z = _101;
    return out;
}

