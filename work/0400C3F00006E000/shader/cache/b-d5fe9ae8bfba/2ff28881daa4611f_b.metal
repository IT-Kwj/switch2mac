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
    float _53 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[4].x));
    float _55 = 1.0 / _39;
    float _57 = _55 * _45;
    float _59 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[4].y));
    float _61 = _57 * _53;
    float _63 = _55 * _51;
    float _65 = _63 * _59;
    float _67 = trunc(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    float _74 = trunc(_65);
    float _76 = precise::max(_74, 0.0);
    uint _78 = uint(_76);
    float _80 = float(_72);
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[1].z * 0.5;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (-0.5);
    float _86 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _88 = float(_78);
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _92 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[1].y, _84);
    float2 _204 = float2(_92, _94);
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_204, float2(0.0), isnan(_204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_204, float2(0.0), isnan(_204)), level(0.0)).xyzw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = _97.w;
    out.m_32.x = _99;
    out.m_32.y = _101;
    out.m_32.z = _103;
    out.m_32.w = _105;
    return out;
}

