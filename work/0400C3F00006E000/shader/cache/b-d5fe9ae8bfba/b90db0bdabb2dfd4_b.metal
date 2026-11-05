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
    float2 _145 = float2(_43, _45);
    float _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_145, float2(0.0), isnan(_145))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_145, float2(0.0), isnan(_145))).x;
    float2 _157 = float2(_43, _45);
    float3 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_157, float2(0.0), isnan(_157))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_157, float2(0.0), isnan(_157))).xyz;
    float _53 = _51.x;
    float _55 = _51.y;
    float _57 = _51.z;
    float _59 = in.m_33.y;
    float _61 = in.m_33.x;
    float _63 = in.m_33.z;
    float _65 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _67 = fma(_53, 2.0, -1.0);
    float _69 = fma(_57, 2.0, -1.0);
    float _71 = -_65;
    float _73 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _75 = fma(_71, _59, _73);
    float _77 = -_65;
    float _79 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _81 = fma(_77, _61, _79);
    float _83 = -_65;
    float _85 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _87 = fma(_83, _63, _85);
    float _89 = _75 * _75;
    float _91 = fma(_81, _81, _89);
    float _93 = fma(_87, _87, _91);
    float _95 = sqrt(_93);
    float _97 = -_95;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = fma(_55, 2.0, -1.0);
    float _105 = rsqrt(_93);
    float _107 = _103 * _75;
    float _109 = fma(_67, _81, _107);
    float _111 = abs(_101);
    float _113 = log2(_111);
    float _115 = fma(_69, _87, _109);
    float _117 = -_105;
    float _119 = fma(_117, _115, 0.0);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = _113 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _125 = exp2(_123);
    float _127 = _125 * _121;
    float _129 = _127 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _131 = _127 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _133 = _127 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_36.x = _129;
    out.m_36.y = _131;
    out.m_36.z = _133;
    return out;
}

