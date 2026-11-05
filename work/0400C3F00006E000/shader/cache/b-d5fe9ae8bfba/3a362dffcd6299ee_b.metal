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
    constant _16* fp_c9 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _176 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float _74 = in.m_31.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _57 * _78;
    float _88 = in.m_31.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _57 * _92;
    float _96 = _72 * _86;
    float _98 = _57 * _84;
    float _100 = 0.0 + _96;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _102 * _98;
    bool _108 = _104 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _116 = _112 || _114;
    float _118 = in.m_31.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_31.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    if (!_116)
    {
        discard_fragment();
    }
    float _130 = _66 * _94;
    float _132 = _57 * _122;
    float _134 = _57 * _128;
    float _136 = _68 * _132;
    float _138 = _70 * _134;
    if (!_116)
    {
        out.m_36.x = _130;
        out.m_36.y = _136;
        out.m_36.z = _138;
        out.m_36.w = _96;
        return out;
    }
    float _140 = 0.0 + _104;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    out.m_36.x = _130;
    out.m_36.y = _136;
    out.m_36.z = _138;
    out.m_36.w = _142;
    return out;
}

