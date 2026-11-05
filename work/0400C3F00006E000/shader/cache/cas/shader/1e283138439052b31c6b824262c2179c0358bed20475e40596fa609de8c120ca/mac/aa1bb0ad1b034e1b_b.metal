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
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _136 = float2(_57, _55);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_136, float2(0.0), isnan(_136))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_136, float2(0.0), isnan(_136))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = precise::min(_64, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _72 = precise::min(_62, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _74 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _78);
    float _82 = 1.0 / _80;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].w, _80);
    float _86 = precise::clamp(_84, 0.0, 1.0);
    float _88 = _82 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _90 = precise::clamp(_88, 0.0, 1.0);
    float _92 = _86 * _90;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _96 = _72 * _94;
    float _98 = _70 * _94;
    float _100 = _74 * _94;
    float _102 = _68 * _94;
    out.m_32.x = _96;
    out.m_32.y = _98;
    out.m_32.z = _100;
    out.m_32.w = _102;
    return out;
}

