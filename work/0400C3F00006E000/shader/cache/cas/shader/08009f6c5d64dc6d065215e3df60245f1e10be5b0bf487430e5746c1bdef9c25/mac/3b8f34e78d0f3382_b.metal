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
    float2 _176 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _196 = float2(_59, _61);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_196, float2(0.0), isnan(_196))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_196, float2(0.0), isnan(_196))).x;
    float2 _204 = float2(_59, _61);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_204, float2(0.0), isnan(_204))).x;
    float _78 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _80 = -_74;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _84 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _88 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = 1.0 / _82;
    float _92 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[0].x, _88);
    float _94 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _96 = 1.0 / _94;
    float _98 = _76 + (-0.5);
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, _94);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _98 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _108 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[4].y, _106);
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _114 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _116 * _116;
    float _120 = _96 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = fma(_118, _112, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _126 = fma(_102, _122, _104);
    float _128 = precise::max(0.0, _126);
    float _130 = _128 * _124;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _132 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _136 = _84 * _134;
    float _138 = _78 * _134;
    float _140 = _86 * _134;
    float _142 = _72 * _134;
    out.m_36.x = _136;
    out.m_36.y = _138;
    out.m_36.z = _140;
    out.m_36.w = _142;
    return out;
}

