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
    float _49 = fma(_41, 2.0, _43);
    float _51 = fma(_39, 2.0, _45);
    float _53 = fma(_41, _41, _47);
    float _55 = fma(_41, 2.0, _43);
    float _57 = fma(_39, 2.0, _45);
    float _59 = fma(_39, 2.0, _51);
    float _61 = fma(_41, 2.0, _55);
    float _63 = rsqrt(_53);
    float _65 = _63 * _41;
    float _67 = _63 * _39;
    float _69 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _71 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float2 _196 = float2(_43, _45);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_196, float2(0.0), isnan(_196))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_196, float2(0.0), isnan(_196))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float2 _214 = float2(_49, _57);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_214, float2(0.0), isnan(_214))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float _91 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].w, _69);
    float _93 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[1].w, _71);
    float2 _238 = float2(_61, _59);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_238, float2(0.0), isnan(_238))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _252 = float2(_91, _93);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _77 + _85;
    float _113 = _79 + _87;
    float _115 = _81 + _89;
    float _117 = _97 + _111;
    float _119 = _99 + _113;
    float _121 = _101 + _115;
    float _123 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[1].x, _117);
    float _125 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].y, _119);
    float _127 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[1].z, _121);
    float _129 = _123 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _131 = _125 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _133 = _127 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _129;
    out.m_32.y = _131;
    out.m_32.z = _133;
    return out;
}

