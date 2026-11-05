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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0), center_no_perspective]];
    float4 m_27 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.x;
    float _41 = in.m_29.x;
    float _43 = in.m_27.y;
    float _45 = in.m_29.y;
    float _47 = fma(_41, 2.0, _39);
    float _49 = fma(_41, 3.0, _39);
    float _51 = fma(_41, 4.0, _39);
    float _53 = fma(_41, 2.0, _39);
    float _55 = fma(_41, 2.0, _47);
    float _57 = fma(_41, 3.0, _49);
    float _59 = fma(_41, 4.0, _51);
    float _61 = fma(_45, 2.0, _43);
    float _63 = fma(_45, 3.0, _43);
    float _65 = fma(_45, 4.0, _43);
    float _67 = fma(_45, 2.0, _43);
    float _69 = fma(_45, 2.0, _61);
    float _71 = fma(_45, 3.0, _63);
    float _73 = fma(_45, 4.0, _65);
    float2 _207 = float2(_39, _43);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_207, float2(0.0), isnan(_207))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_207, float2(0.0), isnan(_207))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _225 = float2(_53, _67);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_225, float2(0.0), isnan(_225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_225, float2(0.0), isnan(_225))).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _239 = float2(_55, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _253 = float2(_57, _71);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_253, float2(0.0), isnan(_253))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _267 = float2(_59, _73);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _79 + _87;
    float _119 = _81 + _89;
    float _121 = _83 + _91;
    float _123 = _117 + _95;
    float _125 = _119 + _97;
    float _127 = _121 + _99;
    float _129 = _123 + _103;
    float _131 = _125 + _105;
    float _133 = _127 + _107;
    float _135 = _111 + _129;
    float _137 = _113 + _131;
    float _139 = _115 + _133;
    float _141 = _135 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _143 = _137 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _145 = _139 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _141;
    out.m_32.y = _143;
    out.m_32.z = _145;
    return out;
}

