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
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_28 [[color(1)]];
    float4 m_30 [[color(5)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_25.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = 1.0 / _37;
    float _53 = _51 * _43;
    float _55 = _51 * _49;
    float2 _110 = float2(_53, _55);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_110, float2(0.0), isnan(_110))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_110, float2(0.0), isnan(_110))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float2 _130 = float2(_53, _55);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_130, float2(0.0), isnan(_130))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_130, float2(0.0), isnan(_130))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    out.m_28.x = _60;
    out.m_28.y = _62;
    out.m_28.z = _64;
    out.m_28.w = _66;
    out.m_30.x = _70;
    out.m_30.y = _72;
    out.m_30.z = _74;
    out.m_30.w = _76;
    return out;
}

