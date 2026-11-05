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
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _172 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_172, float2(0.0), isnan(_172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_172, float2(0.0), isnan(_172))).x;
    float2 _184 = float2(_61, _63);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_184, float2(0.0), isnan(_184))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_184, float2(0.0), isnan(_184))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float2 _200 = float2(_61, _63);
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_200, float2(0.0), isnan(_200))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_200, float2(0.0), isnan(_200))).x;
    float _80 = -_65;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _84 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = _78 + (-0.5);
    float _88 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = precise::min(_74, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _92 = 1.0 / _82;
    float _94 = _84 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].x, _94);
    float _98 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _100 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].w, _98);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _106 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[4].y, _104);
    float _108 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[5].x, _102);
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = precise::max(0.0, _108);
    float _116 = _112 * _112;
    float _118 = _114 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _120 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].z, _114);
    float _122 = _88 * _118;
    float _124 = _120 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _126 = _84 * _118;
    float _128 = _90 * _118;
    float _130 = _76 * _118;
    float _132 = _88 * _124;
    float _134 = _84 * _124;
    float _136 = _90 * _124;
    float _138 = _76 * _124;
    out.m_36.x = _132;
    out.m_36.y = _134;
    out.m_36.z = _136;
    out.m_36.w = _138;
    out.m_38.x = _122;
    out.m_38.y = _126;
    out.m_38.z = _128;
    out.m_38.w = _130;
    return out;
}

