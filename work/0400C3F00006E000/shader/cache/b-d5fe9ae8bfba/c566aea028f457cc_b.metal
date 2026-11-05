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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
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
    float2 _160 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_160, float2(0.0), isnan(_160))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_160, float2(0.0), isnan(_160))).x;
    float2 _172 = float2(_59, _61);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_172, float2(0.0), isnan(_172))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_172, float2(0.0), isnan(_172))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _188 = float2(_59, _61);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_188, float2(0.0), isnan(_188))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_188, float2(0.0), isnan(_188))).x;
    float _78 = -_63;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _82 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = _76 + (-0.5);
    float _86 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _88 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = 1.0 / _80;
    float _92 = _82 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].x, _92);
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _96);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _104 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[4].y, _102);
    float _106 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[5].x, _100);
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = precise::max(0.0, _106);
    float _114 = _110 * _110;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].z, _112);
    float _118 = _116 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _120 = _86 * _118;
    float _122 = _82 * _118;
    float _124 = _88 * _118;
    float _126 = _74 * _118;
    out.m_36.x = _120;
    out.m_36.y = _122;
    out.m_36.z = _124;
    out.m_36.w = _126;
    return out;
}

