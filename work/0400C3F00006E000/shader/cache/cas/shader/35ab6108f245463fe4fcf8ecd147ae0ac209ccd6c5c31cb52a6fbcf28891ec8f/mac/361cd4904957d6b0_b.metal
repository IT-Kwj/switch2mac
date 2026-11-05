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
    float2 _226 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_226, float2(0.0), isnan(_226))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_226, float2(0.0), isnan(_226))).x;
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
    float _90 = 1.0 / _84;
    float _92 = _82 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _100 = _92 * _90;
    float _102 = _94 * _90;
    float _104 = _96 * _90;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _110 = _106 * _98;
    float _112 = _106 * _108;
    float _114 = fma(_110, 1.5, _100);
    float _116 = fma(_110, 0.5, _100);
    float _118 = fma(_112, 0.5, _102);
    float _120 = fma(_112, 1.5, _102);
    float3 _383 = float3(_114, _120, float(0));
    float3 _387 = select(_383, float3(0.0), isnan(_383));
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _387.xy, uint(rint(_387.z)), _106);
    float3 _394 = float3(_116, _120, float(0));
    float3 _396 = select(_394, float3(0.0), isnan(_394));
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _396.xy, uint(rint(_396.z)), _106);
    float3 _403 = float3(_114, _118, float(0));
    float3 _405 = select(_403, float3(0.0), isnan(_403));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _405.xy, uint(rint(_405.z)), _106);
    float3 _412 = float3(_116, _118, float(0));
    float3 _414 = select(_412, float3(0.0), isnan(_412));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _414.xy, uint(rint(_414.z)), _106);
    float _130 = fma(_110, -0.5, _100);
    float _132 = fma(_110, -1.5, _100);
    float3 _429 = float3(_130, _120, float(0));
    float3 _431 = select(_429, float3(0.0), isnan(_429));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _431.xy, uint(rint(_431.z)), _106);
    float3 _438 = float3(_132, _120, float(0));
    float3 _440 = select(_438, float3(0.0), isnan(_438));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _440.xy, uint(rint(_440.z)), _106);
    float _138 = fma(_112, -0.5, _102);
    float3 _450 = float3(_130, _118, float(0));
    float3 _452 = select(_450, float3(0.0), isnan(_450));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _452.xy, uint(rint(_452.z)), _106);
    float3 _459 = float3(_132, _118, float(0));
    float3 _461 = select(_459, float3(0.0), isnan(_459));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _461.xy, uint(rint(_461.z)), _106);
    float3 _468 = float3(_114, _138, float(0));
    float3 _470 = select(_468, float3(0.0), isnan(_468));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _470.xy, uint(rint(_470.z)), _106);
    float3 _477 = float3(_116, _138, float(0));
    float3 _479 = select(_477, float3(0.0), isnan(_477));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _479.xy, uint(rint(_479.z)), _106);
    float _148 = fma(_112, -1.5, _102);
    float3 _489 = float3(_130, _138, float(0));
    float3 _491 = select(_489, float3(0.0), isnan(_489));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _491.xy, uint(rint(_491.z)), _106);
    float3 _498 = float3(_132, _138, float(0));
    float3 _500 = select(_498, float3(0.0), isnan(_498));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _500.xy, uint(rint(_500.z)), _106);
    float3 _507 = float3(_114, _148, float(0));
    float3 _509 = select(_507, float3(0.0), isnan(_507));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _509.xy, uint(rint(_509.z)), _106);
    float3 _516 = float3(_116, _148, float(0));
    float3 _518 = select(_516, float3(0.0), isnan(_516));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _518.xy, uint(rint(_518.z)), _106);
    float3 _525 = float3(_130, _148, float(0));
    float3 _527 = select(_525, float3(0.0), isnan(_525));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _527.xy, uint(rint(_527.z)), _106);
    float3 _534 = float3(_132, _148, float(0));
    float3 _536 = select(_534, float3(0.0), isnan(_534));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _536.xy, uint(rint(_536.z)), _106);
    float _162 = _122 + _124;
    float _164 = -_58;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _168 = _164 + _166;
    float _170 = _168 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _162 + _134;
    float _176 = _174 + _136;
    float _178 = _176 + _126;
    float _180 = _178 + _128;
    float _182 = -_58;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _186 = _182 + _184;
    float _188 = _180 + _140;
    float _190 = _186 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = _188 + _142;
    float _196 = _192 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _198 = _194 + _144;
    float _200 = _198 + _146;
    float _202 = _200 + _150;
    float _204 = _202 + _152;
    float _206 = _204 + _154;
    float _208 = _206 + _156;
    float _210 = _208 + _158;
    float _212 = _210 + _160;
    float _214 = fma(_212, 0.0625, _172);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _214;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _196;
    return out;
}

