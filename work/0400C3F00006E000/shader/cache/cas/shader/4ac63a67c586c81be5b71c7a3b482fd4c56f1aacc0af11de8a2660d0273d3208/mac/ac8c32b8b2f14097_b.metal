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
    float2 _159 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_159, float2(0.0), isnan(_159))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_159, float2(0.0), isnan(_159))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = abs(_65);
    float _71 = log2(_69);
    float _73 = abs(_63);
    float _75 = log2(_73);
    float _77 = abs(_67);
    float _79 = log2(_77);
    float _81 = _71 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _83 = _75 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _85 = exp2(_81);
    float _87 = _79 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _89 = exp2(_83);
    float _91 = exp2(_87);
    float _93 = _85 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _95 = _85 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _97 = _85 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _99 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[5].x, _93);
    float _101 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[4].x, _95);
    float _103 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].x, _97);
    float _105 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _107 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[5].z, _99);
    float _109 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[4].z, _101);
    float _111 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[6].z, _103);
    float _113 = _107 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _115 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[7].x, _113);
    float _117 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[7].z, _115);
    float _119 = abs(_117);
    float _121 = log2(_119);
    float _123 = _121 * _105;
    float _125 = exp2(_123);
    out.m_32.x = _125;
    out.m_32.y = _125;
    out.m_32.z = _125;
    out.m_32.w = 1.0;
    return out;
}

