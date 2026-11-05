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
    float2 _171 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_171, float2(0.0), isnan(_171))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_171, float2(0.0), isnan(_171))).x;
    float2 _183 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_183, float2(0.0), isnan(_183))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_183, float2(0.0), isnan(_183))).xy;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = in.m_38.y;
    float _64 = in.m_38.x;
    float _66 = -_52;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _70 = 1.0 / _68;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = _70 * _72;
    float _76 = _74 * _62;
    float _78 = _74 * _64;
    float _80 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _88 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _92 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _94 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _88);
    float _96 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _90);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _102 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _96);
    float _106 = fma(_58, 2.0, -1.0);
    float _108 = 1.0 / _100;
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _112 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _114 = _104 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _116 = fma(_60, 2.0, -1.0);
    float _118 = _116 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _120 = fma(_118, 2.0, _50);
    float _122 = _110 * _108;
    float _124 = _112 * _108;
    float _126 = _106 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _128 = _114 * _108;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = fma(_126, 2.0, _48);
    float3 _333 = float3(_122, _124, float(0));
    float3 _337 = select(_333, float3(0.0), isnan(_333));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _337.xy, uint(rint(_337.z)), _130);
    float2 _343 = float2(_132, _120);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_343, float2(0.0), isnan(_343))).x;
    float _138 = -_74;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _142 = _138 + _140;
    float _144 = -_74;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _148 = _144 + _146;
    float _150 = _142 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = _148 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _160 = _152 + _134;
    out.m_41.x = _136;
    out.m_41.y = _160;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _158;
    return out;
}

