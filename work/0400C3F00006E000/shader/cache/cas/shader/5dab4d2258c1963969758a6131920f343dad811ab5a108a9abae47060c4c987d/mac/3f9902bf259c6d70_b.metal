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
    texture2d_array<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    sampler fp_t_tcb_CSmplr_w [[id(3)]];
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
    float _41 = in.m_29.w;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _169 = float3(_65, _63, float(int(_74)));
    float3 _173 = select(_169, float3(0.0), isnan(_169));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _173.xy, uint(rint(_173.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _173.xy, uint(rint(_173.z))).w;
    float _78 = in.m_29.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = _59 * _82;
    float _86 = -_84;
    float _88 = _86 + _76;
    bool _92 = _88 >= (*spvDescriptorSet0.fp_c11)._m0[24].x;
    bool _94 = isnan(_88);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.fp_c11)._m0[24].x);
    bool _100 = _96 || _98;
    if (!_100)
    {
        discard_fragment();
    }
    if (!_100)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    bool _102 = _76 >= (*spvDescriptorSet0.fp_c11)._m0[24].x;
    bool _104 = isnan(_76);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.fp_c11)._m0[24].x);
    bool _110 = _106 || _108;
    if (!_110)
    {
        discard_fragment();
    }
    if (!_110)
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
    float _41 = in.m_29.w;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _169 = float3(_65, _63, float(int(_74)));
    float3 _173 = select(_169, float3(0.0), isnan(_169));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _173.xy, uint(rint(_173.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _173.xy, uint(rint(_173.z))).w;
    float _78 = in.m_29.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = _59 * _82;
    float _86 = -_84;
    float _88 = _86 + _76;
    bool _92 = _88 >= (*spvDescriptorSet0.fp_c11)._m0[24].x;
    bool _94 = isnan(_88);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.fp_c11)._m0[24].x);
    bool _100 = _96 || _98;
    if (!_100)
    {
        discard_fragment();
    }
    if (!_100)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    bool _102 = _76 >= (*spvDescriptorSet0.fp_c11)._m0[24].x;
    bool _104 = isnan(_76);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.fp_c11)._m0[24].x);
    bool _110 = _106 || _108;
    if (!_110)
    {
        discard_fragment();
    }
    if (!_110)
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

