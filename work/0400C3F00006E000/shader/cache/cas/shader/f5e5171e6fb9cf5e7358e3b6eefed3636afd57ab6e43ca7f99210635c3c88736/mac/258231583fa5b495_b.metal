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
    float2 _158 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_158, float2(0.0), isnan(_158))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_158, float2(0.0), isnan(_158))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _178 = float2(_59, _61);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_178, float2(0.0), isnan(_178))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_178, float2(0.0), isnan(_178))).x;
    float _76 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _78 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _80 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _92 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _94 = _86 * _86;
    float _96 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _98 = fma(_94, _90, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, _96);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _102 * _98;
    float _106 = _102 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _108 = _104 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _110 = _78 * _106;
    float _112 = _76 * _106;
    float _114 = _80 * _106;
    float _116 = _78 * _108;
    float _118 = _76 * _108;
    float _120 = _80 * _108;
    float _122 = _72 * _106;
    float _124 = _72 * _108;
    out.m_34.x = _110;
    out.m_34.y = _112;
    out.m_34.z = _114;
    out.m_34.w = _122;
    out.m_36.x = _116;
    out.m_36.y = _118;
    out.m_36.z = _120;
    out.m_36.w = _124;
    return out;
}

