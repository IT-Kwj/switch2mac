#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    float2 _143 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_143, float2(0.0), isnan(_143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_143, float2(0.0), isnan(_143))).x;
    float _61 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[0].z, -0.5);
    float _63 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _65 = fma((*spvDescriptorSet0.fp_c3)._m0[0].x, 0.5, 0.5);
    float _67 = _57 + _61;
    float _69 = 1.0 / _63;
    float _71 = -_65;
    float _73 = _71 + _55;
    float _75 = _67 * _67;
    float _77 = fma(_73, _73, _75);
    float _79 = sqrt(_77);
    float _81 = _79 * _69;
    float _83 = precise::clamp(_81, 0.0, 1.0);
    float _85 = -_83;
    float _87 = _85 + 1.0;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _91 = _87 + _89;
    float _93 = _91 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _95 = _93 * (-1.44269502162933349609375);
    float _97 = exp2(_95);
    float _99 = spvFAdd(_97, 1.0);
    float _101 = 1.0 / _99;
    float _103 = -_59;
    float _105 = _103 + 1.0;
    float _107 = _105 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _109 = _107 * _101;
    out.m_32.x = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    out.m_32.y = (*spvDescriptorSet0.fp_c3)._m0[2].y;
    out.m_32.z = (*spvDescriptorSet0.fp_c3)._m0[2].z;
    out.m_32.w = _109;
    return out;
}

