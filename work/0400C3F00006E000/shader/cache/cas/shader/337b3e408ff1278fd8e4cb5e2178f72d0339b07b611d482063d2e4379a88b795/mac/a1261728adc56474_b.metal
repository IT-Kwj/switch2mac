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
    constant _16* fp_c3 [[id(1)]];
    texture3d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = gl_FragCoord.y;
    float _67 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _69 = _65 / _67;
    float _71 = gl_FragCoord.x;
    float _73 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _75 = _71 / _73;
    float _77 = 1.0 / _39;
    float _79 = _77 * _45;
    float _81 = _77 * _51;
    float _83 = _77 * _57;
    float _85 = _77 * _63;
    float _87 = _69 * _79;
    float _89 = _75 * _81;
    float _91 = _83 * _85;
    float3 _203 = float3(_89, _87, _91);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float3(0.0), isnan(_203))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float3(0.0), isnan(_203))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _75 + (-0.5);
    float _105 = _103 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _107 = floor(_105);
    float _109 = _107 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _111 = fma(_109, 2.0, -1.0);
    float _113 = _111 * _111;
    float _115 = fma(_113, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _117 = 1.0 / _115;
    float _119 = _97 * _117;
    float _121 = _99 * _117;
    float _123 = _101 * _117;
    out.m_32.x = _119;
    out.m_32.y = _121;
    out.m_32.z = _123;
    out.m_32.w = 0.0;
    return out;
}

