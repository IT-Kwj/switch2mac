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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0), center_no_perspective]];
    float4 m_32 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _44 = in.m_32.x;
    float _46 = in.m_32.y;
    float2 _142 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_142, float2(0.0), isnan(_142))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_142, float2(0.0), isnan(_142))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _58 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].z, _56);
    float _60 = _58 * _50;
    float _62 = _58 * _52;
    float _64 = _60 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _66 = _60 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _68 = _60 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _70 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].x, _64);
    float _72 = _60 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _66);
    float _76 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[3].z, _70);
    float _78 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].x, _68);
    float _82 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[0].z, _74);
    float _84 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].z, _78);
    float _88 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _92 = 1.0 / _84;
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = _94 * _92;
    float _100 = _90 * _92;
    float _102 = _96 * _92;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float3 _267 = float3(_100, _98, float(0));
    float3 _271 = select(_267, float3(0.0), isnan(_267));
    float _106 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _271.xy, uint(rint(_271.z)), _104);
    float _108 = -_58;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _112 = _108 + _110;
    float _114 = -_58;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _118 = _114 + _116;
    float _120 = _112 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _126 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _130 = _122 + _106;
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _130;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _128;
    return out;
}

