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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_33.x;
    float _47 = in.m_33.y;
    float2 _181 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_181, float2(0.0), isnan(_181))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_181, float2(0.0), isnan(_181))).x;
    float _51 = in.m_35.w;
    float _53 = in.m_35.x;
    float _55 = in.m_35.y;
    float _57 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _59 = -_57;
    float _61 = fma(_59, _51, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _63 = -_57;
    float _65 = fma(_63, _53, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _67 = -_57;
    float _69 = fma(_67, _55, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _71 = 1.0 / _61;
    float _73 = _65 * _71;
    float _75 = _69 * _71;
    float2 _241 = float2(_45, _47);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_241, float2(0.0), isnan(_241))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _255 = float2(_73, _75);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_255, float2(0.0), isnan(_255))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_255, float2(0.0), isnan(_255))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = in.m_35.z;
    float _97 = -_57;
    float _99 = fma(_97, _95, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _101 = fma(_99, -0.5, 0.5);
    bool _105 = _101 <= 1.0;
    bool _107 = isnan(_101);
    bool _109 = _105 || _107;
    bool _111 = isnan(1.0);
    bool _113 = _109 || _111;
    float _115 = float(_113);
    float _117 = _101 * _115;
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = abs(_119);
    float _123 = log2(_121);
    float _125 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _127 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _125);
    float _129 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _127);
    float _131 = rsqrt(_129);
    float _133 = _123 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _135 = exp2(_133);
    float _137 = fma(_83, 2.0, -1.0);
    float _139 = fma(_81, 2.0, -1.0);
    float _141 = fma(_85, 2.0, -1.0);
    float _143 = _137 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _145 = fma(_139, (*spvDescriptorSet0.fp_c4)._m0[15].x, _143);
    float _147 = _135 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _149 = fma(_141, (*spvDescriptorSet0.fp_c4)._m0[15].z, _145);
    float _151 = -_131;
    float _153 = fma(_151, _149, 0.0);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _89 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _159 = _91 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _161 = _147 * _155;
    float _163 = _93 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _165 = _157 * _161;
    float _167 = _159 * _161;
    float _169 = _163 * _161;
    out.m_38.x = _165;
    out.m_38.y = _167;
    out.m_38.z = _169;
    out.m_38.w = 0.0;
    return out;
}

