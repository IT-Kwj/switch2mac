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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _125 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_125, float2(0.0), isnan(_125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_125, float2(0.0), isnan(_125))).x;
    float _61 = gl_FragCoord.y;
    float _63 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _65 = _61 / _63;
    float _67 = gl_FragCoord.x;
    float _69 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _71 = _67 / _69;
    float _73 = _65 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _75 = _71 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _77 = fma(_73, 2.0, -1.0);
    float _79 = fma(_75, 2.0, -1.0);
    float _81 = _77 * _77;
    float _83 = fma(_79, _79, _81);
    float _85 = sqrt(_83);
    float _87 = -_85;
    float _89 = _87 + 1.0;
    float _91 = precise::max(0.0, _89);
    out.m_32.x = _59;
    out.m_32.w = _91;
    return out;
}

