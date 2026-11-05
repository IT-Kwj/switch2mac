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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
    float4 m_36 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_36.x;
    float _52 = in.m_36.y;
    float2 _214 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_214, float2(0.0), isnan(_214))).x;
    float _56 = in.m_38.w;
    float _58 = in.m_38.x;
    float _60 = in.m_38.y;
    float _62 = in.m_38.z;
    float _64 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _66 = -_64;
    float _68 = fma(_66, _56, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _70 = -_64;
    float _72 = fma(_70, _58, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _74 = -_64;
    float _76 = fma(_74, _60, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _78 = -_64;
    float _80 = fma(_78, _62, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _82 = 1.0 / _68;
    float _84 = _72 * _82;
    float _86 = _76 * _82;
    float2 _286 = float2(_50, _52);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_286, float2(0.0), isnan(_286))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_286, float2(0.0), isnan(_286))).xyz;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _80 * _82;
    float2 _303 = float2(_84, _86);
    float _100 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303)), _98);
    float _102 = in.m_40.y;
    float _104 = in.m_40.x;
    float _106 = in.m_40.z;
    float _108 = -_64;
    float _110 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _112 = fma(_108, _102, _110);
    float _114 = -_64;
    float _116 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _118 = fma(_114, _104, _116);
    float _120 = -_64;
    float _122 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _124 = fma(_120, _106, _122);
    float _126 = _112 * _112;
    float _128 = fma(_118, _118, _126);
    float _130 = fma(_124, _124, _128);
    float _132 = rsqrt(_130);
    float _134 = _112 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _136 = fma(_118, (*spvDescriptorSet0.fp_c4)._m0[11].x, _134);
    float _138 = sqrt(_130);
    float _140 = fma(_124, (*spvDescriptorSet0.fp_c4)._m0[11].z, _136);
    float _142 = _132 * _140;
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _146 = fma(_142, (*spvDescriptorSet0.fp_c4)._m0[13].y, _144);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = -_138;
    float _152 = fma(_150, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = abs(_148);
    float _158 = log2(_156);
    float _160 = abs(_154);
    float _162 = log2(_160);
    float _164 = _158 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _166 = exp2(_164);
    float _168 = _162 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _170 = exp2(_168);
    float _172 = fma(_94, 2.0, -1.0);
    float _174 = fma(_92, 2.0, -1.0);
    float _176 = fma(_96, 2.0, -1.0);
    float _178 = _172 * _112;
    float _180 = _170 * _166;
    float _182 = fma(_174, _118, _178);
    float _184 = _100 * _180;
    float _186 = fma(_176, _124, _182);
    float _188 = _184 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _190 = -_132;
    float _192 = fma(_190, _186, 0.0);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = _194 * _188;
    float _198 = _196 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _200 = _196 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _202 = _196 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    out.m_43.x = _198;
    out.m_43.y = _200;
    out.m_43.z = _202;
    out.m_43.w = 0.0;
    return out;
}

