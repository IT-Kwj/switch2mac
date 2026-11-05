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
    float2 _215 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_215, float2(0.0), isnan(_215))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_215, float2(0.0), isnan(_215))).x;
    float2 _227 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_227, float2(0.0), isnan(_227))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_227, float2(0.0), isnan(_227))).xy;
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
    float _88 = fma(_60, 2.0, -1.0);
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _92 = fma(_58, 2.0, -1.0);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _100 = _88 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _106 = 1.0 / _94;
    float _108 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _98);
    float _110 = fma(_100, 2.0, _50);
    float _112 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _114 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _118 = _92 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _120 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _122 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _124 = fma(_118, 2.0, _48);
    float _126 = _112 * _106;
    float _128 = _114 * _106;
    float _130 = _116 * _106;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = fma(_132, _120, _126);
    float _136 = fma(_132, _122, _128);
    float _138 = -_120;
    float _140 = fma(_132, _138, _126);
    float _142 = -_122;
    float _144 = fma(_132, _142, _128);
    float3 _405 = float3(_134, _136, float(0));
    float3 _409 = select(_405, float3(0.0), isnan(_405));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _409.xy, uint(rint(_409.z)), _132);
    float3 _416 = float3(_126, _136, float(0));
    float3 _418 = select(_416, float3(0.0), isnan(_416));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _418.xy, uint(rint(_418.z)), _132);
    float3 _425 = float3(_140, _136, float(0));
    float3 _427 = select(_425, float3(0.0), isnan(_425));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _427.xy, uint(rint(_427.z)), _132);
    float3 _434 = float3(_134, _128, float(0));
    float3 _436 = select(_434, float3(0.0), isnan(_434));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _436.xy, uint(rint(_436.z)), _132);
    float3 _443 = float3(_126, _128, float(0));
    float3 _445 = select(_443, float3(0.0), isnan(_443));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _445.xy, uint(rint(_445.z)), _132);
    float3 _452 = float3(_140, _128, float(0));
    float3 _454 = select(_452, float3(0.0), isnan(_452));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _454.xy, uint(rint(_454.z)), _132);
    float3 _461 = float3(_134, _144, float(0));
    float3 _463 = select(_461, float3(0.0), isnan(_461));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _463.xy, uint(rint(_463.z)), _132);
    float3 _470 = float3(_126, _144, float(0));
    float3 _472 = select(_470, float3(0.0), isnan(_470));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _472.xy, uint(rint(_472.z)), _132);
    float3 _479 = float3(_140, _144, float(0));
    float3 _481 = select(_479, float3(0.0), isnan(_479));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _481.xy, uint(rint(_481.z)), _132);
    float2 _487 = float2(_124, _110);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_487, float2(0.0), isnan(_487))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_487, float2(0.0), isnan(_487))).x;
    float _166 = _146 + _148;
    float _168 = _166 + _150;
    float _170 = _168 + _152;
    float _172 = _170 + _154;
    float _174 = _172 + _156;
    float _176 = _174 + _158;
    float _178 = -_70;
    float _180 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _182 = _178 + _180;
    float _184 = -_70;
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _188 = _184 + _186;
    float _190 = _176 + _160;
    float _192 = _182 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = _188 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _190 + _162;
    float _202 = _198 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _204 = fma(_200, 0.111111111938953399658203125, _194);
    out.m_41.x = _164;
    out.m_41.y = _204;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _202;
    return out;
}

