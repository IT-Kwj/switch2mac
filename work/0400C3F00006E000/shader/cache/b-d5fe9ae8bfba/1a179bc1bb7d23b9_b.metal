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
    float2 _194 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194))).x;
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
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _70);
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _78);
    float _86 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _88 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _82);
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = 1.0 / _88;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = _92 * _96;
    float _104 = _100 * _96;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _98 * _96;
    float _110 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = fma(_106, _110, _102);
    float _116 = -_110;
    float _118 = fma(_106, _116, _102);
    float _120 = fma(_106, _112, _108);
    float _122 = -_112;
    float _124 = fma(_106, _122, _108);
    float3 _355 = float3(_114, _120, float(0));
    float3 _359 = select(_355, float3(0.0), isnan(_355));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _359.xy, uint(rint(_359.z)), _106);
    float3 _366 = float3(_102, _120, float(0));
    float3 _368 = select(_366, float3(0.0), isnan(_366));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _368.xy, uint(rint(_368.z)), _106);
    float3 _375 = float3(_118, _120, float(0));
    float3 _377 = select(_375, float3(0.0), isnan(_375));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _377.xy, uint(rint(_377.z)), _106);
    float3 _384 = float3(_114, _108, float(0));
    float3 _386 = select(_384, float3(0.0), isnan(_384));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _386.xy, uint(rint(_386.z)), _106);
    float3 _393 = float3(_102, _108, float(0));
    float3 _395 = select(_393, float3(0.0), isnan(_393));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _395.xy, uint(rint(_395.z)), _106);
    float3 _402 = float3(_118, _108, float(0));
    float3 _404 = select(_402, float3(0.0), isnan(_402));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _404.xy, uint(rint(_404.z)), _106);
    float3 _411 = float3(_114, _124, float(0));
    float3 _413 = select(_411, float3(0.0), isnan(_411));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _413.xy, uint(rint(_413.z)), _106);
    float3 _420 = float3(_102, _124, float(0));
    float3 _422 = select(_420, float3(0.0), isnan(_420));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _422.xy, uint(rint(_422.z)), _106);
    float3 _429 = float3(_118, _124, float(0));
    float3 _431 = select(_429, float3(0.0), isnan(_429));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _431.xy, uint(rint(_431.z)), _106);
    float _144 = -_62;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _148 = _144 + _146;
    float _150 = _148 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _156 = _126 + _128;
    float _158 = _156 + _130;
    float _160 = _158 + _132;
    float _162 = _160 + _134;
    float _164 = _162 + _136;
    float _166 = _164 + _138;
    float _168 = -_62;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _172 = _168 + _170;
    float _174 = _172 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _166 + _140;
    float _180 = _178 + _142;
    float _182 = fma(_180, 0.111111111938953399658203125, _176);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _182;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _154;
    return out;
}

