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
    constant _16* fp_c11 [[id(0)]];
    texture2d<float> fp_t_tcb_16 [[id(1)]];
    sampler fp_t_tcb_16Smplr [[id(2)]];
    sampler fp_t_tcb_16Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_27 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float2 _51 = float2(0.0, as_type<float>(0x7fffffffu /* nan */));
    float _34 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_51, float2(0.0), isnan(_51))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_51, float2(0.0), isnan(_51))).w;
    bool _38 = _34 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _40 = isnan(_34);
    bool _42 = _38 || _40;
    bool _44 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _46 = _42 || _44;
    if (!_46)
    {
        discard_fragment();
    }
    if (!_46)
    {
        out.m_27.x = 0.0;
        out.m_27.y = 0.0;
        out.m_27.z = 0.0;
        out.m_27.w = 0.0;
        return out;
    }
    out.m_27.x = 1.0;
    out.m_27.y = 1.0;
    out.m_27.z = 1.0;
    out.m_27.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_27 [[color(0)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float2 _51 = float2(0.0, as_type<float>(0x7fffffffu /* nan */));
    float _34 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_51, float2(0.0), isnan(_51))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_51, float2(0.0), isnan(_51))).w;
    bool _38 = _34 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _40 = isnan(_34);
    bool _42 = _38 || _40;
    bool _44 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _46 = _42 || _44;
    if (!_46)
    {
        discard_fragment();
    }
    if (!_46)
    {
        out.m_27.x = 0.0;
        out.m_27.y = 0.0;
        out.m_27.z = 0.0;
        out.m_27.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_27)};
    }
    out.m_27.x = 1.0;
    out.m_27.y = 1.0;
    out.m_27.z = 1.0;
    out.m_27.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_27)};
}

