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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
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
    float2 _199 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_199, float2(0.0), isnan(_199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_199, float2(0.0), isnan(_199))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = _73 + (-0.99989998340606689453125);
    float _77 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _81 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _83 = abs(_71);
    float _85 = -_83;
    float _87 = _85 + 1.0;
    float _89 = fma(_81, -0.5, 0.5);
    float _91 = _87 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = _89 * _89;
    float _97 = 0.0 + _89;
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = abs(_93);
    float _103 = log2(_101);
    float _105 = fma(_95, _75, 1.0);
    float _107 = _105 * _105;
    float _109 = _73 + 9.9999997473787516355514526367188e-05;
    float _111 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _113 = 1.0 / _107;
    float _115 = -_111;
    float _117 = _115 + 1.0;
    float _119 = _103 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _121 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _123 = _121 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _125 = exp2(_119);
    float _127 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _129 = _127 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _131 = _109 * _113;
    float _133 = _131 * _117;
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _139 = fma(_133, _123, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = fma(_133, _137, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = fma(_133, _129, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[0].w, _99);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[0].y, _141);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[0].x, _145);
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[0].z, _149);
    float _165 = precise::clamp(_163, 0.0, 1.0);
    out.m_36.x = _161;
    out.m_36.y = _157;
    out.m_36.z = _165;
    out.m_36.w = _153;
    return out;
}

