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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = _65 * _77;
    float _81 = _67 * _77;
    float _83 = _69 * _77;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = _79 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _91 = fma(_87, 0.5, 0.5);
    float _93 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _95 = fma(_93, -0.5, 0.5);
    float _97 = fma(_93, 0.5, 0.5);
    float _99 = fma(_97, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _101 = sqrt(_95);
    float _103 = fma(_97, _99, -0.212114393711090087890625);
    float _105 = fma(_97, _103, 1.570728778839111328125);
    float _107 = _101 * 0.636619746685028076171875;
    float _109 = -_105;
    float _111 = fma(_107, _109, 1.0);
    float2 _308 = float2(_111, _91);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = 0.0 + _87;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = in.m_33.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = abs(_126);
    float _136 = log2(_134);
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _140 = _138 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _144 = exp2(_142);
    float _146 = _63 * _132;
    float _148 = fma(_144, _140, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _150 = _148 * _146;
    float _152 = _122 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _158 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _156);
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _162 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
    float _164 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _166 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _164);
    float _168 = fma(_154, _158, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _170 = fma(_154, _162, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _172 = fma(_154, _166, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _174 = -_168;
    float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _178 = -_170;
    float _180 = _178 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _182 = -_172;
    float _184 = _182 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _186 = fma(_150, _176, _168);
    float _188 = fma(_150, _180, _170);
    float _190 = fma(_150, _184, _172);
    out.m_36.x = _188;
    out.m_36.y = _186;
    out.m_36.z = _190;
    out.m_36.w = 1.0;
    return out;
}

