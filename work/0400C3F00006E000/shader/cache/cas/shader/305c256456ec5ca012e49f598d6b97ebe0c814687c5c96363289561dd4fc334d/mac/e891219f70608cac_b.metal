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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
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
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_190, float2(0.0), isnan(_190))).x;
    float2 _198 = float2(_59, _61);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_198, float2(0.0), isnan(_198))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_198, float2(0.0), isnan(_198))).x;
    float _78 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _80 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _88 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _90 = -_74;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _94 = 1.0 / _88;
    float _96 = 1.0 / _92;
    float _98 = _76 + (-0.5);
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, _88);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _106 = _94 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = fma(_102, _108, _104);
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _114 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[4].y, _112);
    float _116 = precise::max(0.0, _110);
    float _118 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _120 * _120;
    float _124 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[3].z, _116);
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _126 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _130 = _80 * _128;
    float _132 = _78 * _128;
    float _134 = _82 * _128;
    float _136 = _72 * _128;
    out.m_36.x = _130;
    out.m_36.y = _132;
    out.m_36.z = _134;
    out.m_36.w = _136;
    return out;
}

