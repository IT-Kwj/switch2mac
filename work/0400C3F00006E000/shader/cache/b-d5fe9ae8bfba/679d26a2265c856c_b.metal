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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
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
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _166 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_166, float2(0.0), isnan(_166))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_166, float2(0.0), isnan(_166))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_31.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_31.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_31.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _55 * _82;
    float _98 = _55 * _88;
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _102 = _55 * _76;
    float _104 = _55 * _94;
    float _106 = _100 * _102;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _114 = _108 != 0.0;
    bool _116 = isnan(_108);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _128 = _110 * _96;
    float _130 = _124 * _98;
    float _132 = _126 * _104;
    if (_122)
    {
        out.m_34.x = _128;
        out.m_34.y = _130;
        out.m_34.z = _132;
        out.m_34.w = _108;
        return out;
    }
    discard_fragment();
    return out;
}

