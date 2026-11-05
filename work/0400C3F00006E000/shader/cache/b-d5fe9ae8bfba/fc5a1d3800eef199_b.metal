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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
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
    float2 _160 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_160, float2(0.0), isnan(_160))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_160, float2(0.0), isnan(_160))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _180 = float2(_59, _61);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_180, float2(0.0), isnan(_180))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_180, float2(0.0), isnan(_180))).x;
    float2 _188 = float2(_59, _61);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_188, float2(0.0), isnan(_188))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_188, float2(0.0), isnan(_188))).x;
    float _78 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _80 = _74 + (-0.5);
    float _82 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    float _88 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _94 = _86 * _86;
    float _96 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _98 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _100 = 1.0 / _98;
    float _102 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, _98);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = fma(_104, _108, _92);
    float _112 = precise::max(0.0, _110);
    float _114 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[3].z, _112);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _116 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _120 = _82 * _118;
    float _122 = _78 * _118;
    float _124 = _88 * _118;
    float _126 = _72 * _118;
    out.m_36.x = _120;
    out.m_36.y = _122;
    out.m_36.z = _124;
    out.m_36.w = _126;
    return out;
}

