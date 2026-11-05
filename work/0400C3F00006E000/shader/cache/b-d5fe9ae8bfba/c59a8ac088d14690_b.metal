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
    float4 m_32 [[color(0)]];
    float4 m_34 [[color(1)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
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
    float2 _148 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_148, float2(0.0), isnan(_148))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_148, float2(0.0), isnan(_148))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _74 = precise::min(_64, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _76 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _82 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _80);
    float _84 = 1.0 / _82;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].w, _82);
    float _88 = precise::clamp(_86, 0.0, 1.0);
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _88 * _92;
    float _96 = _94 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _100 = _74 * _96;
    float _102 = _72 * _96;
    float _104 = _76 * _96;
    float _106 = _74 * _98;
    float _108 = _72 * _98;
    float _110 = _76 * _98;
    float _112 = _70 * _96;
    float _114 = _70 * _98;
    out.m_32.x = _100;
    out.m_32.y = _102;
    out.m_32.z = _104;
    out.m_32.w = _112;
    out.m_34.x = _106;
    out.m_34.y = _108;
    out.m_34.z = _110;
    out.m_34.w = _114;
    return out;
}

