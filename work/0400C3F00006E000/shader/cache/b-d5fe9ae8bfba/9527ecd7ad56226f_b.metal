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
    texture2d<float> fp_t_tcb_10 [[id(1)]];
    sampler fp_t_tcb_10Smplr [[id(2)]];
    sampler fp_t_tcb_10Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = -(*spvDescriptorSet0.fp_c11)._m0[21].x;
    float _63 = _61 + (*spvDescriptorSet0.fp_c11)._m0[21].z;
    float _65 = 1.0 / _41;
    float _67 = _65 * _47;
    float _69 = -(*spvDescriptorSet0.fp_c11)._m0[21].y;
    float _71 = _69 + (*spvDescriptorSet0.fp_c11)._m0[21].w;
    float _73 = _65 * _53;
    float _75 = _65 * _59;
    float _77 = fma(_67, _63, (*spvDescriptorSet0.fp_c11)._m0[21].x);
    float _79 = fma(_67, _71, (*spvDescriptorSet0.fp_c11)._m0[21].y);
    float _81 = _73 + _77;
    float _83 = _75 + _79;
    float2 _175 = float2(_81, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_175, float2(0.0), isnan(_175))).w;
    bool _89 = _85 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _91 = isnan(_85);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _97 = _93 || _95;
    if (!_97)
    {
        discard_fragment();
    }
    if (!_97)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = -(*spvDescriptorSet0.fp_c11)._m0[21].x;
    float _63 = _61 + (*spvDescriptorSet0.fp_c11)._m0[21].z;
    float _65 = 1.0 / _41;
    float _67 = _65 * _47;
    float _69 = -(*spvDescriptorSet0.fp_c11)._m0[21].y;
    float _71 = _69 + (*spvDescriptorSet0.fp_c11)._m0[21].w;
    float _73 = _65 * _53;
    float _75 = _65 * _59;
    float _77 = fma(_67, _63, (*spvDescriptorSet0.fp_c11)._m0[21].x);
    float _79 = fma(_67, _71, (*spvDescriptorSet0.fp_c11)._m0[21].y);
    float _81 = _73 + _77;
    float _83 = _75 + _79;
    float2 _175 = float2(_81, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_175, float2(0.0), isnan(_175))).w;
    bool _89 = _85 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _91 = isnan(_85);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _97 = _93 || _95;
    if (!_97)
    {
        discard_fragment();
    }
    if (!_97)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_34)};
}

