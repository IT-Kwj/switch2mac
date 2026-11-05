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
    float2 _193 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_193, float2(0.0), isnan(_193))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_193, float2(0.0), isnan(_193))).x;
    float2 _205 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_205, float2(0.0), isnan(_205))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_205, float2(0.0), isnan(_205))).xy;
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
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _82 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _90 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _94 = 1.0 / _86;
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _106 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _108 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _100 * _94;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _108 * _94;
    float _116 = _106 * _94;
    float _118 = _112 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _120 = fma(_58, 2.0, -1.0);
    float _122 = fma(_60, 2.0, -1.0);
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _126 = _118 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _128 = _120 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _130 = _122 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _132 = fma(_124, 0.5, _116);
    float _134 = fma(_124, -0.5, _116);
    float _136 = fma(_128, 2.0, _48);
    float _138 = fma(_126, 0.5, _114);
    float _140 = fma(_130, 2.0, _50);
    float _142 = fma(_126, -0.5, _114);
    float3 _379 = float3(_132, _138, float(0));
    float3 _383 = select(_379, float3(0.0), isnan(_379));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _383.xy, uint(rint(_383.z)), _112);
    float3 _390 = float3(_134, _138, float(0));
    float3 _392 = select(_390, float3(0.0), isnan(_390));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _392.xy, uint(rint(_392.z)), _112);
    float3 _399 = float3(_132, _142, float(0));
    float3 _401 = select(_399, float3(0.0), isnan(_399));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _401.xy, uint(rint(_401.z)), _112);
    float3 _408 = float3(_134, _142, float(0));
    float3 _410 = select(_408, float3(0.0), isnan(_408));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _410.xy, uint(rint(_410.z)), _112);
    float2 _416 = float2(_136, _140);
    float _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float _154 = -_70;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _158 = _154 + _156;
    float _160 = _144 + _146;
    float _162 = _158 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _168 = _160 + _148;
    float _170 = -_70;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _174 = _170 + _172;
    float _176 = _168 + _150;
    float _178 = _174 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = fma(_176, 0.25, _180);
    out.m_41.x = _152;
    out.m_41.y = _182;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _166;
    return out;
}

