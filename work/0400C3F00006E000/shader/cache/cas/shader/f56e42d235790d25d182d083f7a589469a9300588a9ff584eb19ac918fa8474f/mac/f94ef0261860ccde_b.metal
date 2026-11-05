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
    constant _16* fp_c7 [[id(0)]];
    constant _16* fp_c11 [[id(1)]];
    texture2d_array<float> fp_t_tcb_E [[id(2)]];
    sampler fp_t_tcb_ESmplr [[id(3)]];
    sampler fp_t_tcb_ESmplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = rint((*spvDescriptorSet0.fp_c7)._m0[9].w);
    float _57 = precise::max(_55, 0.0);
    uint _60 = uint(_57);
    uint _62 = clamp(_60, 0u, 65535u);
    float _64 = 1.0 / _41;
    float _66 = _64 * _47;
    float _68 = _64 * _53;
    float3 _134 = float3(_68, _66, float(int(_62)));
    float3 _138 = select(_134, float3(0.0), isnan(_134));
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _138.xy, uint(rint(_138.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _138.xy, uint(rint(_138.z))).w;
    bool _74 = _70 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _76 = isnan(_70);
    bool _78 = _74 || _76;
    bool _80 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _82 = _78 || _80;
    if (!_82)
    {
        discard_fragment();
    }
    if (!_82)
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
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = rint((*spvDescriptorSet0.fp_c7)._m0[9].w);
    float _57 = precise::max(_55, 0.0);
    uint _60 = uint(_57);
    uint _62 = clamp(_60, 0u, 65535u);
    float _64 = 1.0 / _41;
    float _66 = _64 * _47;
    float _68 = _64 * _53;
    float3 _134 = float3(_68, _66, float(int(_62)));
    float3 _138 = select(_134, float3(0.0), isnan(_134));
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _138.xy, uint(rint(_138.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _138.xy, uint(rint(_138.z))).w;
    bool _74 = _70 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _76 = isnan(_70);
    bool _78 = _74 || _76;
    bool _80 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _82 = _78 || _80;
    if (!_82)
    {
        discard_fragment();
    }
    if (!_82)
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

