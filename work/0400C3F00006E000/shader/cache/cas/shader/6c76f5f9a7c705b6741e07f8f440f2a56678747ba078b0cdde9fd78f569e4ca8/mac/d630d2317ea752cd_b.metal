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
    float _39 = in.m_27.w;
    float _41 = in.m_27.y;
    float _43 = in.m_27.z;
    float2 _111 = float2(_39, _37);
    float3 _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_111, float2(0.0), isnan(_111))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_111, float2(0.0), isnan(_111))).xyz;
    float _49 = _47.x;
    float _51 = _47.y;
    float _53 = _47.z;
    float2 _129 = float2(_41, _37);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_129, float2(0.0), isnan(_129))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_129, float2(0.0), isnan(_129))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _143 = float2(_43, _37);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_143, float2(0.0), isnan(_143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_143, float2(0.0), isnan(_143))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _49 * 0.375;
    float _73 = _51 * 0.375;
    float _75 = _53 * 0.375;
    float _77 = fma(_57, 0.3125, _71);
    float _79 = fma(_59, 0.3125, _73);
    float _81 = fma(_61, 0.3125, _75);
    float _83 = fma(_65, 0.3125, _77);
    float _85 = fma(_67, 0.3125, _79);
    float _87 = fma(_69, 0.3125, _81);
    float _89 = _83 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _91 = _85 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _93 = _87 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    out.m_30.x = _89;
    out.m_30.y = _91;
    out.m_30.z = _93;
    out.m_30.w = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    return out;
}

