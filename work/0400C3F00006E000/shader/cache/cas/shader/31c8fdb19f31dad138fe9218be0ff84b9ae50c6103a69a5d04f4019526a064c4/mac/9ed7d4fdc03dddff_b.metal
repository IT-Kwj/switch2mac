#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    float4 m_29 [[user(locn0), center_no_perspective]];
    float4 m_31 [[user(locn1), center_no_perspective]];
    float4 m_27 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_27.x;
    float _43 = in.m_27.y;
    float _45 = in.m_29.x;
    float _47 = in.m_29.y;
    float _49 = in.m_31.x;
    float _51 = in.m_31.y;
    float2 _133 = float2(_41, _43);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_133, float2(0.0), isnan(_133))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_133, float2(0.0), isnan(_133))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _151 = float2(_45, _47);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_151, float2(0.0), isnan(_151))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_151, float2(0.0), isnan(_151))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _165 = float2(_49, _51);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_165, float2(0.0), isnan(_165))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_165, float2(0.0), isnan(_165))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = precise::max(_59, _67);
    float _81 = precise::max(_57, _65);
    float _83 = precise::max(_79, _75);
    float _85 = precise::max(_61, _69);
    float _87 = precise::max(_81, _73);
    float _89 = _83 * 0.586610972881317138671875;
    float _91 = precise::max(_85, _77);
    float _93 = fma(_87, 0.298911988735198974609375, _89);
    float _95 = fma(_91, 0.114477999508380889892578125, _93);
    float _97 = spvFAdd(_95, 0.00999999977648258209228515625);
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _101 = _95 + _99;
    float _103 = 1.0 / _97;
    float _105 = precise::max(0.0, _101);
    float _107 = _105 * _103;
    float _109 = _87 * _107;
    float _111 = _83 * _107;
    float _113 = _91 * _107;
    out.m_34.x = _109;
    out.m_34.y = _111;
    out.m_34.z = _113;
    out.m_34.w = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    return out;
}

