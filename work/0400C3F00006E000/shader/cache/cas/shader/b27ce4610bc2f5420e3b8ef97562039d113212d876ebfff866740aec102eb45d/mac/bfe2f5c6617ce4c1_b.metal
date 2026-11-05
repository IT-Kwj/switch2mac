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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _150 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_150, float2(0.0), isnan(_150))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_150, float2(0.0), isnan(_150))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _78 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _80);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = 1.0 / _90;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = _96 * _98;
    float _106 = _100 * _98;
    float _108 = _102 * _98;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float3 _279 = float3(_106, _104, float(0));
    float3 _283 = select(_279, float3(0.0), isnan(_279));
    float _112 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _283.xy, uint(rint(_283.z)), _110);
    float2 _289 = float2(_46, _48);
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_289, float2(0.0), isnan(_289))).x;
    float _116 = -_64;
    float _118 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _120 = _116 + _118;
    float _122 = -_64;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _126 = _122 + _124;
    float _128 = _120 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _134 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _138 = _130 + _112;
    out.m_39.x = _114;
    out.m_39.y = _138;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _136;
    return out;
}

