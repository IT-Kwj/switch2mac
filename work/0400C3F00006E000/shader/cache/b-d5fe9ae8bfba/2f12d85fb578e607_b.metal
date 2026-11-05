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
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _138 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_138, float2(0.0), isnan(_138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_138, float2(0.0), isnan(_138))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float2 _158 = float2(_57, _59);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_158, float2(0.0), isnan(_158))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_158, float2(0.0), isnan(_158))).x;
    float _74 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _76 = precise::min(_64, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _78 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _80 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _82 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _80);
    float _84 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _86 = _72 + (-0.5);
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].w, _84);
    float _90 = precise::clamp(_88, 0.0, 1.0);
    float _92 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[5].x, _90);
    float _94 = precise::max(0.0, _92);
    float _96 = _94 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _98 = _76 * _96;
    float _100 = _74 * _96;
    float _102 = _78 * _96;
    float _104 = _70 * _96;
    out.m_34.x = _98;
    out.m_34.y = _100;
    out.m_34.z = _102;
    out.m_34.w = _104;
    return out;
}

