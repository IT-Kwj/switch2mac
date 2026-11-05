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
    constant _16* fp_c11 [[id(0)]];
    texture2d<float> fp_t_tcb_16 [[id(1)]];
    sampler fp_t_tcb_16Smplr [[id(2)]];
    sampler fp_t_tcb_16Smplr_w [[id(3)]];
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
    float2 _105 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_105, float2(0.0), isnan(_105))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_105, float2(0.0), isnan(_105))).w;
    bool _63 = _59 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _65 = isnan(_59);
    bool _67 = _63 || _65;
    bool _69 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _71 = _67 || _69;
    if (!_71)
    {
        discard_fragment();
    }
    if (!_71)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    out.m_32.x = 1.0;
    out.m_32.y = 1.0;
    out.m_32.z = 1.0;
    out.m_32.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _105 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_105, float2(0.0), isnan(_105))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_105, float2(0.0), isnan(_105))).w;
    bool _63 = _59 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _65 = isnan(_59);
    bool _67 = _63 || _65;
    bool _69 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _71 = _67 || _69;
    if (!_71)
    {
        discard_fragment();
    }
    if (!_71)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    out.m_32.x = 1.0;
    out.m_32.y = 1.0;
    out.m_32.z = 1.0;
    out.m_32.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

