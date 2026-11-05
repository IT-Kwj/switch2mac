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
    float _41 = in.m_27.y;
    float2 _96 = float2(_39, _41);
    float4 _44 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_96, float2(0.0), isnan(_96))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_96, float2(0.0), isnan(_96))).xyzw;
    float _46 = _44.x;
    float _48 = _44.y;
    float _50 = _44.z;
    float _52 = _44.w;
    float _54 = in.m_29.x;
    float _56 = -_54;
    float _58 = _56 + 1.0;
    float _60 = -_58;
    float _62 = _46 + _60;
    float _64 = precise::clamp(_62, 0.0, 1.0);
    float _66 = -_58;
    float _68 = _48 + _66;
    float _70 = precise::clamp(_68, 0.0, 1.0);
    float _72 = -_58;
    float _74 = _50 + _72;
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = _52 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _80 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _82 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    out.m_32.x = _80;
    out.m_32.y = _82;
    out.m_32.z = _84;
    out.m_32.w = _78;
    return out;
}

