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
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _135 = float2(_51, _53);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_135, float2(0.0), isnan(_135))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_135, float2(0.0), isnan(_135))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float _65 = in.m_25.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_25.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_25.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_25.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _49 * _69;
    float _91 = _49 * _75;
    float _93 = _49 * _81;
    float _95 = _49 * _87;
    float _97 = _59 * _89;
    float _99 = _61 * _91;
    float _101 = _63 * _93;
    out.m_28.x = _97;
    out.m_28.y = _99;
    out.m_28.z = _101;
    out.m_28.w = _95;
    return out;
}

