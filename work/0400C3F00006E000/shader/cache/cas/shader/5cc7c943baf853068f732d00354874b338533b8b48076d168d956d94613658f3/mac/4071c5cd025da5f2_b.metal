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
    float2 _172 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_172, float2(0.0), isnan(_172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_172, float2(0.0), isnan(_172))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _70);
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _80 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _82 = 1.0 / _76;
    float _84 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _78);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _68);
    float _90 = _84 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _94 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _96 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = _90 * _82;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _96 * _82;
    float _106 = _98 * _82;
    float _108 = _102 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _110 = _108 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _112 = _108 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = fma(_110, 0.5, _104);
    float _116 = fma(_112, 0.5, _106);
    float _118 = fma(_110, -0.5, _104);
    float _120 = fma(_112, -0.5, _106);
    float3 _325 = float3(_114, _116, float(0));
    float3 _329 = select(_325, float3(0.0), isnan(_325));
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _329.xy, uint(rint(_329.z)), _102);
    float3 _336 = float3(_118, _116, float(0));
    float3 _338 = select(_336, float3(0.0), isnan(_336));
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _338.xy, uint(rint(_338.z)), _102);
    float3 _345 = float3(_114, _120, float(0));
    float3 _347 = select(_345, float3(0.0), isnan(_345));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _347.xy, uint(rint(_347.z)), _102);
    float3 _354 = float3(_118, _120, float(0));
    float3 _356 = select(_354, float3(0.0), isnan(_354));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _356.xy, uint(rint(_356.z)), _102);
    float2 _362 = float2(_46, _48);
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_362, float2(0.0), isnan(_362))).x;
    float _132 = -_60;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _136 = _132 + _134;
    float _138 = _122 + _124;
    float _140 = _138 + _126;
    float _142 = -_60;
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _146 = _142 + _144;
    float _148 = _136 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _140 + _128;
    float _154 = _146 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = fma(_152, 0.25, _150);
    float _160 = _156 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _130;
    out.m_39.y = _158;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _160;
    return out;
}

