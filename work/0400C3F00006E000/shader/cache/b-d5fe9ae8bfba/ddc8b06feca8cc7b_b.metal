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
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
    float4 m_31 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _43 = in.m_31.x;
    float _45 = in.m_31.y;
    float2 _169 = float2(_43, _45);
    float _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_169, float2(0.0), isnan(_169))).x;
    float2 _181 = float2(_43, _45);
    float3 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_181, float2(0.0), isnan(_181))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_181, float2(0.0), isnan(_181))).xyz;
    float _53 = _51.x;
    float _55 = _51.y;
    float _57 = _51.z;
    float _59 = in.m_33.y;
    float _61 = in.m_33.x;
    float _63 = in.m_33.z;
    float _65 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _67 = -_65;
    float _69 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _71 = fma(_67, _59, _69);
    float _73 = -_65;
    float _75 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _77 = fma(_73, _61, _75);
    float _79 = -_65;
    float _81 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _83 = fma(_79, _63, _81);
    float _85 = _71 * _71;
    float _87 = _71 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _89 = fma(_77, _77, _85);
    float _91 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[11].x, _87);
    float _93 = fma(_83, _83, _89);
    float _95 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[11].z, _91);
    float _97 = rsqrt(_93);
    float _99 = sqrt(_93);
    float _101 = _97 * _95;
    float _103 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _105 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[13].y, _103);
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = -_99;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = abs(_107);
    float _117 = log2(_115);
    float _119 = fma(_55, 2.0, -1.0);
    float _121 = fma(_53, 2.0, -1.0);
    float _123 = abs(_113);
    float _125 = log2(_123);
    float _127 = fma(_57, 2.0, -1.0);
    float _129 = _119 * _71;
    float _131 = fma(_121, _77, _129);
    float _133 = _117 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _135 = fma(_127, _83, _131);
    float _137 = exp2(_133);
    float _139 = -_97;
    float _141 = fma(_139, _135, 0.0);
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _125 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _147 = exp2(_145);
    float _149 = _147 * _137;
    float _151 = _143 * _149;
    float _153 = _151 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _155 = _151 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _157 = _151 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    out.m_36.x = _153;
    out.m_36.y = _155;
    out.m_36.z = _157;
    return out;
}

