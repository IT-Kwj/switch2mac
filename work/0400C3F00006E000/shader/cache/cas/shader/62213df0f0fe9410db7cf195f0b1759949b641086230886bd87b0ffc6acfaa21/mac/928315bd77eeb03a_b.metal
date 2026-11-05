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
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _212 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_212, float2(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_212, float2(0.0), isnan(_212))).x;
    float _58 = in.m_38.w;
    float _60 = in.m_38.x;
    float _62 = in.m_38.y;
    float _64 = in.m_38.z;
    float _66 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _68 = -_66;
    float _70 = fma(_68, _58, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _72 = -_66;
    float _74 = fma(_72, _60, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _76 = -_66;
    float _78 = fma(_76, _62, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _80 = -_66;
    float _82 = fma(_80, _64, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _84 = 1.0 / _70;
    float _86 = _74 * _84;
    float _88 = _78 * _84;
    float2 _282 = float2(_52, _54);
    float3 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_282, float2(0.0), isnan(_282))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_282, float2(0.0), isnan(_282))).xyz;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _82 * _84;
    float2 _299 = float2(_86, _88);
    float _102 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299)), _100);
    float _104 = in.m_40.w;
    float _106 = in.m_42.y;
    float _108 = -_66;
    float _110 = fma(_108, _104, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _112 = in.m_42.x;
    float _114 = -_110;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _118 = in.m_42.z;
    bool _122 = _116 <= 1.0;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan(1.0);
    bool _130 = _126 || _128;
    float _132 = float(_130);
    float _134 = _116 * _132;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = -_66;
    float _140 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _142 = fma(_138, _106, _140);
    float _144 = _142 * _142;
    float _146 = abs(_136);
    float _148 = log2(_146);
    float _150 = -_66;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _154 = fma(_150, _112, _152);
    float _156 = _148 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _158 = -_66;
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _162 = fma(_158, _118, _160);
    float _164 = fma(_154, _154, _144);
    float _166 = exp2(_156);
    float _168 = fma(_162, _162, _164);
    float _170 = rsqrt(_168);
    float _172 = fma(_96, 2.0, -1.0);
    float _174 = fma(_94, 2.0, -1.0);
    float _176 = fma(_98, 2.0, -1.0);
    float _178 = _172 * _142;
    float _180 = _166 * _102;
    float _182 = fma(_174, _154, _178);
    float _184 = fma(_176, _162, _182);
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _188 = -_170;
    float _190 = fma(_188, _184, 0.0);
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = _186 * _192;
    float _196 = _194 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _198 = _194 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _200 = _194 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_45.x = _196;
    out.m_45.y = _198;
    out.m_45.z = _200;
    out.m_45.w = 0.0;
    return out;
}

