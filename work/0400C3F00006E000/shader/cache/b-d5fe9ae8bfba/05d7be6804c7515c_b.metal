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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
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
    float2 _180 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_180, float2(0.0), isnan(_180))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_180, float2(0.0), isnan(_180))).x;
    float2 _192 = float2(_59, _61);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_192, float2(0.0), isnan(_192))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_192, float2(0.0), isnan(_192))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = -_63;
    float _78 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _80 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = 1.0 / _78;
    float _86 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _88 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _86);
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _94 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[4].y, _92);
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _106 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _96);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _100 * _100;
    float _112 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _118 = fma(_110, _104, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _120 = _114 * _114;
    float _122 = _80 * _116;
    float _124 = _108 * _118;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _82 * _116;
    float _130 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[3].z, _126);
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _88 * _116;
    float _136 = _74 * _116;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _140 = _82 * _138;
    float _142 = _80 * _138;
    float _144 = _88 * _138;
    float _146 = _74 * _138;
    out.m_34.x = _140;
    out.m_34.y = _142;
    out.m_34.z = _144;
    out.m_34.w = _146;
    out.m_36.x = _128;
    out.m_36.y = _122;
    out.m_36.z = _134;
    out.m_36.w = _136;
    return out;
}

