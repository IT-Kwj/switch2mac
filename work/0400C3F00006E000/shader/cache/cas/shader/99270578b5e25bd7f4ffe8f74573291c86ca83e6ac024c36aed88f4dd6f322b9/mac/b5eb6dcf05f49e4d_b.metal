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
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_38.x;
    float _54 = in.m_38.y;
    float2 _228 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float _58 = in.m_40.w;
    float _60 = in.m_42.w;
    float _62 = in.m_40.x;
    float _64 = in.m_40.y;
    float _66 = in.m_42.y;
    float _68 = in.m_42.x;
    float _70 = in.m_42.z;
    float _72 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _58, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _78 = -_72;
    float _80 = fma(_78, _60, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _82 = -_72;
    float _84 = fma(_82, _62, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _86 = -_72;
    float _88 = fma(_86, _64, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _90 = 1.0 / _76;
    float _92 = -_72;
    float _94 = fma(_92, _66, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _96 = -_72;
    float _98 = fma(_96, _68, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _100 = -_72;
    float _102 = fma(_100, _70, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _104 = 1.0 / _80;
    float _106 = fma(_84, _90, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _108 = fma(_88, _90, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _110 = _106 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _112 = _108 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _343 = float2(_52, _54);
    float3 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_343, float2(0.0), isnan(_343))).xyz;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _94 * _104;
    float _126 = _102 * _104;
    float _128 = _98 * _104;
    float2 _366 = float2(_128, _124);
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366)), _126);
    float2 _374 = float2(_110, _112);
    float3 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_374, float2(0.0), isnan(_374))).xyz;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = in.m_40.z;
    float _142 = -_72;
    float _144 = fma(_142, _140, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _146 = fma(_144, -0.5, 0.5);
    bool _150 = _146 <= 1.0;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = float(_158);
    float _162 = _146 * _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = abs(_164);
    float _168 = log2(_166);
    float _170 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _172 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _170);
    float _174 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _172);
    float _176 = rsqrt(_174);
    float _178 = _168 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _180 = exp2(_178);
    float _182 = fma(_120, 2.0, -1.0);
    float _184 = fma(_118, 2.0, -1.0);
    float _186 = fma(_122, 2.0, -1.0);
    float _188 = _182 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c4)._m0[15].x, _188);
    float _192 = _180 * _130;
    float _194 = fma(_186, (*spvDescriptorSet0.fp_c4)._m0[15].z, _190);
    float _196 = _192 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _198 = -_176;
    float _200 = fma(_198, _194, 0.0);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _134 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _206 = _136 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _208 = _196 * _202;
    float _210 = _138 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _212 = _204 * _208;
    float _214 = _206 * _208;
    float _216 = _210 * _208;
    out.m_45.x = _212;
    out.m_45.y = _214;
    out.m_45.z = _216;
    out.m_45.w = 0.0;
    return out;
}

