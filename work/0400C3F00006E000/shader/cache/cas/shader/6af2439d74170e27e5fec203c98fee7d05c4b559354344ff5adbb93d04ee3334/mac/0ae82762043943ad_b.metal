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
    float2 _239 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _77 = _75 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _79 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _81 = _79 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _83 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _85 = _83 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _87 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _89 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _91 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _93 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _87);
    float _95 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _89);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _93);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _95);
    float _101 = _73 + (-0.99989998340606689453125);
    float _103 = _91 + (-0.99989998340606689453125);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = abs(_71);
    float _111 = -_109;
    float _113 = _111 + 1.0;
    float _115 = _105 * _105;
    float _117 = _107 + _105;
    float _119 = fma(_115, _101, 1.0);
    float _121 = _107 * _107;
    float _123 = _119 * _119;
    float _125 = fma(_121, _103, 1.0);
    float _127 = _113 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = fma(_91, 0.75, 7.4999996286351233720779418945312e-05);
    float _133 = _73 + 9.9999997473787516355514526367188e-05;
    float _135 = _125 * _125;
    float _137 = 1.0 / _123;
    float _139 = _91 + 9.9999997473787516355514526367188e-05;
    float _141 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _143 = -_131;
    float _145 = _143 + 1.0;
    float _147 = -_141;
    float _149 = _147 + 1.0;
    float _151 = 1.0 / _135;
    float _153 = abs(_129);
    float _155 = log2(_153);
    float _157 = _133 * _137;
    float _159 = _157 * _149;
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _165 = _139 * _151;
    float _167 = fma(_159, _81, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _173 = _165 * _145;
    float _175 = _155 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _177 = fma(_159, _77, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _183 = fma(_159, _85, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _185 = fma(_173, _171, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _187 = fma(_173, _163, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _189 = exp2(_175);
    float _191 = fma(_173, _181, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _193 = _185 + _167;
    float _195 = _191 + _177;
    float _197 = _187 + _183;
    float _199 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].w, _117);
    float _201 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].x, _195);
    float _203 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].y, _193);
    float _205 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].z, _197);
    out.m_36.x = _201;
    out.m_36.y = _203;
    out.m_36.z = _205;
    out.m_36.w = _199;
    return out;
}

