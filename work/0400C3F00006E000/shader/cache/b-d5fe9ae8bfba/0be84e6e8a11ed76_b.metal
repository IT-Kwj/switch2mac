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
    float _51 = fma(_41, 2.0, _43);
    float _53 = fma(_41, _41, _47);
    float _55 = fma(_41, 3.0, _43);
    float _57 = fma(_39, 2.0, _45);
    float _59 = fma(_41, 2.0, _49);
    float _61 = fma(_39, 2.0, _45);
    float _63 = fma(_41, 3.0, _55);
    float _65 = rsqrt(_53);
    float _67 = fma(_39, 2.0, _57);
    float _69 = fma(_39, 3.0, _45);
    float _71 = fma(_39, 3.0, _69);
    float _73 = _65 * _41;
    float _75 = _65 * _39;
    float _77 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _79 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float2 _231 = float2(_43, _45);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _249 = float2(_51, _61);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_249, float2(0.0), isnan(_249))).xyz;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float2 _263 = float2(_59, _67);
    float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).xyz;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[1].w, _77);
    float _109 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[1].w, _79);
    float2 _287 = float2(_63, _71);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _301 = float2(_107, _109);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _87 + _95;
    float _129 = _85 + _93;
    float _131 = _89 + _97;
    float _133 = _127 + _103;
    float _135 = _129 + _101;
    float _137 = _131 + _105;
    float _139 = _115 + _133;
    float _141 = _113 + _135;
    float _143 = _117 + _137;
    float _145 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[1].y, _139);
    float _147 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[1].x, _141);
    float _149 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[1].z, _143);
    float _151 = _145 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _153 = _147 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _155 = _149 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _153;
    out.m_32.y = _151;
    out.m_32.z = _155;
    return out;
}

