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
    float2 _168 = float2(_59, _61);
    float2 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_168, float2(0.0), isnan(_168))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_168, float2(0.0), isnan(_168))).xy;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _67 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _73 = _69 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _75 = -_71;
    float _77 = _59 + _75;
    float _79 = -_73;
    float _81 = _61 + _79;
    float2 _204 = float2(_59, _61);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_204, float2(0.0), isnan(_204))).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _218 = float2(_77, _81);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_218, float2(0.0), isnan(_218))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_218, float2(0.0), isnan(_218))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _73 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _103 = _71 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _105 = _101 * _101;
    float _107 = fma(_103, _103, _105);
    float _109 = sqrt(_107);
    float _111 = -_109;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[5].z, 1.0);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * 0.5;
    float _119 = -_87;
    float _121 = _119 + _95;
    float _123 = -_89;
    float _125 = _123 + _97;
    float _127 = -_91;
    float _129 = _127 + _99;
    float _131 = fma(_117, _121, _87);
    float _133 = fma(_117, _125, _89);
    float _135 = fma(_117, _129, _91);
    out.m_36.x = _131;
    out.m_36.y = _133;
    out.m_36.z = _135;
    out.m_36.w = 0.0;
    return out;
}

