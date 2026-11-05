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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _170 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_170, float2(0.0), isnan(_170))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_170, float2(0.0), isnan(_170))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _190 = float2(_59, _61);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_190, float2(0.0), isnan(_190))).x;
    float _76 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _78 = -_74;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _82 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _88 = 1.0 / _80;
    float _90 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _86);
    float _92 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _94 = 1.0 / _92;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _98 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[4].y, _96);
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, _92);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _94 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _102 * _102;
    float _114 = _106 * _110;
    float _116 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].z, _114);
    float _118 = _114 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _120 = _116 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _122 = _82 * _118;
    float _124 = _76 * _118;
    float _126 = _84 * _118;
    float _128 = _82 * _120;
    float _130 = _76 * _120;
    float _132 = _84 * _120;
    float _134 = _72 * _118;
    float _136 = _72 * _120;
    out.m_34.x = _128;
    out.m_34.y = _130;
    out.m_34.z = _132;
    out.m_34.w = _136;
    out.m_36.x = _122;
    out.m_36.y = _124;
    out.m_36.z = _126;
    out.m_36.w = _134;
    return out;
}

