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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_29.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _71 = precise::max(_69, 1.0);
    float _73 = 1.0 / _43;
    float _75 = _73 * _49;
    float _77 = _73 * _55;
    float _79 = _73 * _61;
    float _81 = _73 * _67;
    float _83 = -_77;
    float _85 = fma(_71, _83, _75);
    float _87 = -_79;
    float _89 = fma(_71, _87, _75);
    float _91 = fma(_71, _77, _75);
    float _93 = fma(_71, _79, _75);
    float2 _266 = float2(_81, _89);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_266, float2(0.0), isnan(_266))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_266, float2(0.0), isnan(_266))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float2 _286 = float2(_81, _85);
    float4 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_286, float2(0.0), isnan(_286))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_286, float2(0.0), isnan(_286))).xyzw;
    float _108 = _106.x;
    float _110 = _106.y;
    float _112 = _106.z;
    float _114 = _106.w;
    float2 _302 = float2(_81, _75);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_302, float2(0.0), isnan(_302))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float2 _318 = float2(_81, _91);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _334 = float2(_81, _93);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float _146 = fma(_108, 4.0, _98);
    float _148 = fma(_110, 4.0, _100);
    float _150 = fma(_112, 4.0, _102);
    float _152 = fma(_114, 4.0, _104);
    float _154 = fma(_118, 6.0, _146);
    float _156 = fma(_120, 6.0, _148);
    float _158 = fma(_122, 6.0, _150);
    float _160 = fma(_124, 6.0, _152);
    float _162 = fma(_128, 4.0, _154);
    float _164 = fma(_130, 4.0, _156);
    float _166 = fma(_132, 4.0, _158);
    float _168 = fma(_134, 4.0, _160);
    float _170 = _162 + _138;
    float _172 = _164 + _140;
    float _174 = _166 + _142;
    float _176 = _168 + _144;
    float _178 = _170 * 0.0625;
    float _180 = _172 * 0.0625;
    float _182 = _174 * 0.0625;
    float _184 = _176 * 0.0625;
    out.m_36.x = _178;
    out.m_36.y = _180;
    out.m_36.z = _182;
    out.m_36.w = _184;
    return out;
}

