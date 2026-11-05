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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn2), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _41;
    float _59 = float(as_type<uint>(_43));
    float _61 = rint(_59);
    float _63 = precise::max(_61, 0.0);
    uint _66 = uint(_63);
    uint _68 = clamp(_66, 0u, 65535u);
    float _70 = _57 * _49;
    float _72 = _57 * _55;
    float3 _141 = float3(_72, _70, float(int(_68)));
    float3 _145 = select(_141, float3(0.0), isnan(_141));
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _145.xy, uint(rint(_145.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _145.xy, uint(rint(_145.z))).w;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _86 = _82 || _84;
    if (!_86)
    {
        discard_fragment();
    }
    if (!_86)
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
    float _43 = in.m_29.z;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _41;
    float _59 = float(as_type<uint>(_43));
    float _61 = rint(_59);
    float _63 = precise::max(_61, 0.0);
    uint _66 = uint(_63);
    uint _68 = clamp(_66, 0u, 65535u);
    float _70 = _57 * _49;
    float _72 = _57 * _55;
    float3 _141 = float3(_72, _70, float(int(_68)));
    float3 _145 = select(_141, float3(0.0), isnan(_141));
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _145.xy, uint(rint(_145.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _145.xy, uint(rint(_145.z))).w;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _86 = _82 || _84;
    if (!_86)
    {
        discard_fragment();
    }
    if (!_86)
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

