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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 + (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _69 = 1.0 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _71 = precise::max(_67, 1.0);
    float _73 = precise::max(_69, 1.0);
    float _75 = 1.0 / _41;
    float _77 = _75 * _47;
    float _79 = _75 * _53;
    float _81 = _75 * _59;
    float _83 = _75 * _65;
    float _85 = fma(_71, _77, _81);
    float _87 = fma(_73, _79, _83);
    float _89 = -_79;
    float _91 = fma(_73, _89, _83);
    float _93 = -_77;
    float _95 = fma(_71, _93, _81);
    float2 _256 = float2(_85, _87);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float2 _276 = float2(_85, _91);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float2 _292 = float2(_95, _87);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_292, float2(0.0), isnan(_292))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float2 _308 = float2(_95, _91);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = _100 + _110;
    float _140 = _102 + _112;
    float _142 = _104 + _114;
    float _144 = _106 + _116;
    float _146 = _120 + _138;
    float _148 = _122 + _140;
    float _150 = _124 + _142;
    float _152 = _126 + _144;
    float _154 = _130 + _146;
    float _156 = _132 + _148;
    float _158 = _134 + _150;
    float _160 = _136 + _152;
    float _162 = _154 * 0.25;
    float _164 = _156 * 0.25;
    float _166 = _158 * 0.25;
    float _168 = _160 * 0.25;
    out.m_34.x = _162;
    out.m_34.y = _164;
    out.m_34.z = _166;
    out.m_34.w = _168;
    return out;
}

