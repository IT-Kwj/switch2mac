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
    float4 m_24 [[color(0)]];
};

struct main0_in
{
    float4 m_21 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _31 = in.m_21.x;
    float _33 = in.m_21.y;
    float2 _62 = float2(_31, _33);
    float4 _36 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_62, float2(0.0), isnan(_62))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_62, float2(0.0), isnan(_62))).xyzw;
    float _38 = _36.x;
    float _40 = _36.y;
    float _42 = _36.z;
    float _44 = _36.w;
    float _46 = precise::max(0.0, _38);
    float _48 = precise::max(0.0, _40);
    float _50 = precise::max(0.0, _42);
    out.m_24.x = _46;
    out.m_24.y = _48;
    out.m_24.z = _50;
    out.m_24.w = _44;
    return out;
}

