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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _167 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167))).x;
    float2 _179 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_179, float2(0.0), isnan(_179))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_179, float2(0.0), isnan(_179))).xy;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = in.m_38.y;
    float _64 = in.m_38.x;
    float _66 = -_52;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[46].z, _68);
    float _72 = _70 * _62;
    float _74 = _70 * _64;
    float _76 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _84 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _82);
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _90 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _94 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _96 = 1.0 / _90;
    float _98 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _94);
    float _104 = fma(_58, 2.0, -1.0);
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _112 = fma(_60, 2.0, -1.0);
    float _114 = _104 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _116 = _112 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _118 = fma(_114, 2.0, _48);
    float _120 = _106 * _96;
    float _122 = _108 * _96;
    float _124 = _110 * _96;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = fma(_116, 2.0, _50);
    float3 _325 = float3(_122, _120, float(0));
    float3 _329 = select(_325, float3(0.0), isnan(_325));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _329.xy, uint(rint(_329.z)), _126);
    float2 _335 = float2(_118, _128);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_335, float2(0.0), isnan(_335))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_335, float2(0.0), isnan(_335))).x;
    float _134 = -_70;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _138 = _134 + _136;
    float _140 = -_70;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _144 = _140 + _142;
    float _146 = _138 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = _144 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _156 = _148 + _130;
    out.m_41.x = _132;
    out.m_41.y = _156;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _154;
    return out;
}

