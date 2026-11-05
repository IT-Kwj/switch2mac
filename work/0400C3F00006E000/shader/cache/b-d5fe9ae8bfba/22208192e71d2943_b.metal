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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
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
    float2 _163 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_163, float2(0.0), isnan(_163))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_163, float2(0.0), isnan(_163))).x;
    float2 _174 = float2(_59, _61);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_174, float2(0.0), isnan(_174))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_174, float2(0.0), isnan(_174))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _57 * _79;
    float _89 = _57 * _85;
    float _91 = -_63;
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _95 = 1.0 / _93;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _99 = _95 * _97;
    float _101 = _99 * _89;
    float _103 = _99 * _87;
    float _105 = _101 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _107 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[8].x, _105);
    float _109 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[8].z, _107);
    float _111 = _109 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[28].y, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    bool _119 = _63 < 1.0;
    float _121 = float(_119);
    float _123 = -_115;
    float _125 = _123 + 1.0;
    float _127 = _125 * _125;
    float _129 = _121 * _127;
    out.m_36.x = _69;
    out.m_36.y = _71;
    out.m_36.z = _73;
    out.m_36.w = _129;
    return out;
}

