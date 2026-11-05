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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_23.z;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_23.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _33;
    float _61 = _59 * _39;
    float _63 = _59 * _45;
    float _65 = _59 * _51;
    float _67 = _59 * _57;
    float2 _180 = float2(_61, _63);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_180, float2(0.0), isnan(_180))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_180, float2(0.0), isnan(_180))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _198 = float2(_65, _63);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_198, float2(0.0), isnan(_198))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_198, float2(0.0), isnan(_198))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _212 = float2(_61, _67);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float2(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float2(0.0), isnan(_212))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _226 = float2(_65, _67);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_226, float2(0.0), isnan(_226))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_226, float2(0.0), isnan(_226))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _73 + _81;
    float _105 = _75 + _83;
    float _107 = _77 + _85;
    float _109 = _103 + _89;
    float _111 = _105 + _91;
    float _113 = _107 + _93;
    float _115 = _109 + _97;
    float _117 = _111 + _99;
    float _119 = _113 + _101;
    float _121 = _115 * 0.25;
    float _123 = _117 * 0.25;
    float _125 = _119 * 0.25;
    out.m_26.x = _121;
    out.m_26.y = _123;
    out.m_26.z = _125;
    out.m_26.w = 0.0;
    return out;
}

