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
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.x;
    float _39 = in.m_27.w;
    float _41 = in.m_27.y;
    float _43 = in.m_27.z;
    float2 _135 = float2(_39, _37);
    float3 _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_135, float2(0.0), isnan(_135))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_135, float2(0.0), isnan(_135))).xyz;
    float _49 = _47.x;
    float _51 = _47.y;
    float _53 = _47.z;
    float2 _153 = float2(_41, _37);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_153, float2(0.0), isnan(_153))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_153, float2(0.0), isnan(_153))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _167 = float2(_43, _37);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _51 * 0.375;
    float _73 = _49 * 0.375;
    float _75 = _53 * 0.375;
    float _77 = fma(_59, 0.3125, _71);
    float _79 = fma(_57, 0.3125, _73);
    float _81 = fma(_61, 0.3125, _75);
    float _83 = fma(_67, 0.3125, _77);
    float _85 = fma(_65, 0.3125, _79);
    float _87 = fma(_69, 0.3125, _81);
    float _89 = _83 * 0.586610972881317138671875;
    float _91 = fma(_85, 0.298911988735198974609375, _89);
    float _93 = fma(_87, 0.114477999508380889892578125, _91);
    float _95 = spvFAdd(_93, 0.00999999977648258209228515625);
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _99 = _93 + _97;
    float _101 = 1.0 / _95;
    float _103 = precise::max(0.0, _99);
    float _105 = _103 * _101;
    float _107 = _85 * _105;
    float _109 = _83 * _105;
    float _111 = _87 * _105;
    float _113 = _107 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _115 = _109 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _117 = _111 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    out.m_30.x = _113;
    out.m_30.y = _115;
    out.m_30.z = _117;
    out.m_30.w = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    return out;
}

