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
    float4 m_30 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.y;
    float _39 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _41 = _37 / _39;
    float _43 = gl_FragCoord.x;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _51 = _49 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _53 = 1.0 / _51;
    float _55 = _41 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _57 = _47 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _59 = fma(_55, _51, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _61 = fma(_57, 420.96923828125, -16.54038238525390625);
    float _63 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _65 = _59 + _63;
    float _67 = log2(_61);
    float _69 = _65 * _53;
    float _71 = sqrt(_69);
    float _73 = _67 * 0.1155245304107666015625;
    float2 _164 = float2(_73, _71);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_164, float2(0.0), isnan(_164))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_164, float2(0.0), isnan(_164))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = fma(_57, 1.2000000476837158203125, -0.20000000298023223876953125);
    float _87 = precise::max(0.0, _85);
    float _89 = _79 * _87;
    float _91 = _81 * _87;
    float _93 = _83 * _87;
    out.m_30.x = _89;
    out.m_30.y = _91;
    out.m_30.z = _93;
    out.m_30.w = 0.0;
    return out;
}

