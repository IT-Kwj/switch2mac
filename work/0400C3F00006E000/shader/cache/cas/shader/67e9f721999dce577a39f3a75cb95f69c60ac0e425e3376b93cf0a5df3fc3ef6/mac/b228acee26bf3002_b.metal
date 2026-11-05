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
    float2 _234 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_234, float2(0.0), isnan(_234))).x;
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
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _78 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _84 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = 1.0 / _84;
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _100 = _90 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _108 = _102 * _96;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _100 * _96;
    float _114 = _106 * _96;
    float _116 = _110 * _92;
    float _118 = _110 * _104;
    float _120 = fma(_116, 1.5, _112);
    float _122 = fma(_118, 1.5, _114);
    float _124 = fma(_116, 0.5, _112);
    float _126 = fma(_116, -0.5, _112);
    float _128 = fma(_116, -1.5, _112);
    float3 _400 = float3(_120, _122, float(0));
    float3 _404 = select(_400, float3(0.0), isnan(_400));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _404.xy, uint(rint(_404.z)), _110);
    float3 _411 = float3(_124, _122, float(0));
    float3 _413 = select(_411, float3(0.0), isnan(_411));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _413.xy, uint(rint(_413.z)), _110);
    float3 _420 = float3(_126, _122, float(0));
    float3 _422 = select(_420, float3(0.0), isnan(_420));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _422.xy, uint(rint(_422.z)), _110);
    float3 _429 = float3(_128, _122, float(0));
    float3 _431 = select(_429, float3(0.0), isnan(_429));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _431.xy, uint(rint(_431.z)), _110);
    float _138 = fma(_118, 0.5, _114);
    float3 _441 = float3(_120, _138, float(0));
    float3 _443 = select(_441, float3(0.0), isnan(_441));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _443.xy, uint(rint(_443.z)), _110);
    float3 _450 = float3(_124, _138, float(0));
    float3 _452 = select(_450, float3(0.0), isnan(_450));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _452.xy, uint(rint(_452.z)), _110);
    float3 _459 = float3(_126, _138, float(0));
    float3 _461 = select(_459, float3(0.0), isnan(_459));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _461.xy, uint(rint(_461.z)), _110);
    float _146 = fma(_118, -0.5, _114);
    float3 _471 = float3(_128, _138, float(0));
    float3 _473 = select(_471, float3(0.0), isnan(_471));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _473.xy, uint(rint(_473.z)), _110);
    float3 _480 = float3(_120, _146, float(0));
    float3 _482 = select(_480, float3(0.0), isnan(_480));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _482.xy, uint(rint(_482.z)), _110);
    float3 _489 = float3(_124, _146, float(0));
    float3 _491 = select(_489, float3(0.0), isnan(_489));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _491.xy, uint(rint(_491.z)), _110);
    float3 _498 = float3(_126, _146, float(0));
    float3 _500 = select(_498, float3(0.0), isnan(_498));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _500.xy, uint(rint(_500.z)), _110);
    float3 _507 = float3(_128, _146, float(0));
    float3 _509 = select(_507, float3(0.0), isnan(_507));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _509.xy, uint(rint(_509.z)), _110);
    float _158 = fma(_118, -1.5, _114);
    float3 _519 = float3(_120, _158, float(0));
    float3 _521 = select(_519, float3(0.0), isnan(_519));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _521.xy, uint(rint(_521.z)), _110);
    float3 _528 = float3(_124, _158, float(0));
    float3 _530 = select(_528, float3(0.0), isnan(_528));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _530.xy, uint(rint(_530.z)), _110);
    float3 _537 = float3(_126, _158, float(0));
    float3 _539 = select(_537, float3(0.0), isnan(_537));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _539.xy, uint(rint(_539.z)), _110);
    float3 _546 = float3(_128, _158, float(0));
    float3 _548 = select(_546, float3(0.0), isnan(_546));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _548.xy, uint(rint(_548.z)), _110);
    float2 _554 = float2(_46, _48);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float _170 = -_64;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _174 = _170 + _172;
    float _176 = _174 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _130 + _132;
    float _182 = _180 + _134;
    float _184 = _182 + _136;
    float _186 = _184 + _140;
    float _188 = _186 + _142;
    float _190 = _188 + _144;
    float _192 = _190 + _148;
    float _194 = _192 + _150;
    float _196 = _194 + _152;
    float _198 = _196 + _154;
    float _200 = _198 + _156;
    float _202 = _200 + _160;
    float _204 = _202 + _162;
    float _206 = _204 + _164;
    float _208 = -_64;
    float _210 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _212 = _208 + _210;
    float _214 = _206 + _166;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = fma(_214, 0.0625, _178);
    float _222 = _218 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _168;
    out.m_39.y = _220;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _222;
    return out;
}

