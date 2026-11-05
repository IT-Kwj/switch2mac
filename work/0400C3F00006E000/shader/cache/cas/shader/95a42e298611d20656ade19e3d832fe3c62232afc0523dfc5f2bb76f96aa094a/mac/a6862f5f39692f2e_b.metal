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
    float2 _176 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176))).x;
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
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _88 = 1.0 / _80;
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _94 * _88;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _100 * _88;
    float _110 = _102 * _88;
    float _112 = _106 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _114 = _112 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _116 = _112 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _118 = fma(_114, 0.5, _108);
    float _120 = fma(_114, -0.5, _108);
    float _122 = fma(_116, 0.5, _110);
    float _124 = fma(_116, -0.5, _110);
    float3 _333 = float3(_118, _122, float(0));
    float3 _337 = select(_333, float3(0.0), isnan(_333));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _337.xy, uint(rint(_337.z)), _106);
    float3 _344 = float3(_120, _122, float(0));
    float3 _346 = select(_344, float3(0.0), isnan(_344));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _346.xy, uint(rint(_346.z)), _106);
    float3 _353 = float3(_118, _124, float(0));
    float3 _355 = select(_353, float3(0.0), isnan(_353));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _355.xy, uint(rint(_355.z)), _106);
    float3 _362 = float3(_120, _124, float(0));
    float3 _364 = select(_362, float3(0.0), isnan(_362));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _364.xy, uint(rint(_364.z)), _106);
    float2 _370 = float2(_46, _48);
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370))).x;
    float _136 = -_64;
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _140 = _136 + _138;
    float _142 = _126 + _128;
    float _144 = _142 + _130;
    float _146 = -_64;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _150 = _146 + _148;
    float _152 = _140 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _144 + _132;
    float _158 = _150 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = fma(_156, 0.25, _154);
    float _164 = _160 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _134;
    out.m_39.y = _162;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _164;
    return out;
}

