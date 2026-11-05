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
    float _47 = _39 + _41;
    float _49 = _41 * 2.0;
    float _51 = _43 + _45;
    float _53 = _45 * 2.0;
    float _55 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _47);
    float _57 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _47);
    float _59 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[2].z, _51);
    float _61 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _47);
    float _63 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[2].x, _51);
    float _65 = _49 + _39;
    float _67 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[2].y, _51);
    float _69 = _53 + _43;
    float2 _183 = float2(_55, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_183, float2(0.0), isnan(_183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_183, float2(0.0), isnan(_183))).z;
    float2 _195 = float2(_39, _43);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_195, float2(0.0), isnan(_195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_195, float2(0.0), isnan(_195))).z;
    float2 _203 = float2(_57, _63);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float2(0.0), isnan(_203))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float2(0.0), isnan(_203))).x;
    float2 _211 = float2(_39, _43);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_211, float2(0.0), isnan(_211))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_211, float2(0.0), isnan(_211))).x;
    float2 _219 = float2(_39, _43);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).y;
    float2 _227 = float2(_61, _67);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_227, float2(0.0), isnan(_227))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_227, float2(0.0), isnan(_227))).y;
    float _83 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _65);
    float _85 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _65);
    float _87 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _65);
    float _89 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].x, _69);
    float _91 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].y, _69);
    float _93 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].z, _69);
    float2 _265 = float2(_83, _89);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float2 _273 = float2(_85, _91);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_273, float2(0.0), isnan(_273))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_273, float2(0.0), isnan(_273))).y;
    float2 _281 = float2(_87, _93);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).z;
    float _101 = _73 + _71;
    float _103 = _77 + _75;
    float _105 = _79 + _81;
    float _107 = _95 + _103;
    float _109 = _97 + _105;
    float _111 = _99 + _101;
    float _113 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _115 = _109 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _117 = _111 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _113;
    out.m_32.y = _115;
    out.m_32.z = _117;
    return out;
}

