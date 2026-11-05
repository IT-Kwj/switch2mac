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
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_25 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_23.z;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_23.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_25.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_25.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_25.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_25.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _35;
    float _87 = _85 * _41;
    float _89 = _85 * _47;
    float _91 = _85 * _53;
    float _93 = _85 * _59;
    float _95 = _85 * _65;
    float _97 = _85 * _71;
    float _99 = _85 * _77;
    float2 _251 = float2(_87, _89);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_251, float2(0.0), isnan(_251))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_251, float2(0.0), isnan(_251))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _85 * _83;
    float2 _272 = float2(_91, _93);
    float3 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).xyz;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = _113.z;
    float2 _286 = float2(_95, _97);
    float3 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_286, float2(0.0), isnan(_286))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_286, float2(0.0), isnan(_286))).xyz;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float2 _300 = float2(_99, _111);
    float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_300, float2(0.0), isnan(_300))).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    float _137 = _105 + _115;
    float _139 = _107 + _117;
    float _141 = _109 + _119;
    float _143 = _137 * 0.25;
    float _145 = _139 * 0.25;
    float _147 = _141 * 0.25;
    float _149 = fma(_123, 0.25, _143);
    float _151 = fma(_125, 0.25, _145);
    float _153 = fma(_127, 0.25, _147);
    float _155 = fma(_131, 0.25, _149);
    float _157 = fma(_133, 0.25, _151);
    float _159 = fma(_135, 0.25, _153);
    out.m_28.x = _155;
    out.m_28.y = _157;
    out.m_28.z = _159;
    out.m_28.w = 1.0;
    return out;
}

