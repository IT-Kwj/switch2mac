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
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _142 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_142, float2(0.0), isnan(_142))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_142, float2(0.0), isnan(_142))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].x, _70);
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].x, _72);
    float _82 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].x, _74);
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].x, _76);
    float _86 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _78);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _84);
    float _94 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].w, _86);
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].w, _88);
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].w, _90);
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].w, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    out.m_32.x = _102;
    out.m_32.y = _104;
    out.m_32.z = _106;
    out.m_32.w = _108;
    return out;
}

