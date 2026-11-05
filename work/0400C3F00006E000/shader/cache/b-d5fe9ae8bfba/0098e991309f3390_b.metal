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
    float2 _172 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_172, float2(0.0), isnan(_172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_172, float2(0.0), isnan(_172))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _58 = 1.0 / _56;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _58 * _60;
    float _64 = _62 * _50;
    float _66 = _62 * _52;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _82 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _74);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _86 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _88 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _92 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _86);
    float _96 = 1.0 / _88;
    float _98 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = _94 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = _90 * _96;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _98 * _96;
    float _108 = _100 * _96;
    float _110 = _104 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _112 = _110 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _114 = _110 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _116 = fma(_112, 0.5, _106);
    float _118 = fma(_112, -0.5, _106);
    float _120 = fma(_114, 0.5, _108);
    float _122 = fma(_114, -0.5, _108);
    float3 _329 = float3(_116, _120, float(0));
    float3 _333 = select(_329, float3(0.0), isnan(_329));
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _333.xy, uint(rint(_333.z)), _104);
    float3 _340 = float3(_118, _120, float(0));
    float3 _342 = select(_340, float3(0.0), isnan(_340));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _342.xy, uint(rint(_342.z)), _104);
    float3 _349 = float3(_116, _122, float(0));
    float3 _351 = select(_349, float3(0.0), isnan(_349));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _351.xy, uint(rint(_351.z)), _104);
    float3 _358 = float3(_118, _122, float(0));
    float3 _360 = select(_358, float3(0.0), isnan(_358));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _360.xy, uint(rint(_360.z)), _104);
    float _132 = _124 + _126;
    float _134 = -_62;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _138 = _134 + _136;
    float _140 = _132 + _128;
    float _142 = -_62;
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _146 = _142 + _144;
    float _148 = _138 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _140 + _130;
    float _154 = _146 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = fma(_152, 0.25, _150);
    float _160 = _156 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _158;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _160;
    return out;
}

