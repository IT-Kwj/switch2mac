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
    float2 _190 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_190, float2(0.0), isnan(_190))).x;
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
    float _98 = _90 * _92;
    float _100 = _96 * _92;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _94 * _92;
    float _106 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _108 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _110 = fma(_102, _106, _98);
    float _112 = -_106;
    float _114 = fma(_102, _112, _98);
    float _116 = fma(_102, _108, _104);
    float _118 = -_108;
    float _120 = fma(_102, _118, _104);
    float3 _347 = float3(_110, _116, float(0));
    float3 _351 = select(_347, float3(0.0), isnan(_347));
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _351.xy, uint(rint(_351.z)), _102);
    float3 _358 = float3(_98, _116, float(0));
    float3 _360 = select(_358, float3(0.0), isnan(_358));
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _360.xy, uint(rint(_360.z)), _102);
    float3 _367 = float3(_114, _116, float(0));
    float3 _369 = select(_367, float3(0.0), isnan(_367));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _369.xy, uint(rint(_369.z)), _102);
    float3 _376 = float3(_110, _104, float(0));
    float3 _378 = select(_376, float3(0.0), isnan(_376));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _378.xy, uint(rint(_378.z)), _102);
    float3 _385 = float3(_98, _104, float(0));
    float3 _387 = select(_385, float3(0.0), isnan(_385));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _387.xy, uint(rint(_387.z)), _102);
    float3 _394 = float3(_114, _104, float(0));
    float3 _396 = select(_394, float3(0.0), isnan(_394));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _396.xy, uint(rint(_396.z)), _102);
    float3 _403 = float3(_110, _120, float(0));
    float3 _405 = select(_403, float3(0.0), isnan(_403));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _405.xy, uint(rint(_405.z)), _102);
    float3 _412 = float3(_98, _120, float(0));
    float3 _414 = select(_412, float3(0.0), isnan(_412));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _414.xy, uint(rint(_414.z)), _102);
    float3 _421 = float3(_114, _120, float(0));
    float3 _423 = select(_421, float3(0.0), isnan(_421));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _423.xy, uint(rint(_423.z)), _102);
    float _140 = -_58;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _144 = _140 + _142;
    float _146 = _144 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = _148 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _152 = _122 + _124;
    float _154 = _152 + _126;
    float _156 = _154 + _128;
    float _158 = _156 + _130;
    float _160 = _158 + _132;
    float _162 = _160 + _134;
    float _164 = -_58;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _168 = _164 + _166;
    float _170 = _168 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _162 + _136;
    float _176 = _174 + _138;
    float _178 = fma(_176, 0.111111111938953399658203125, _172);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _178;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _150;
    return out;
}

