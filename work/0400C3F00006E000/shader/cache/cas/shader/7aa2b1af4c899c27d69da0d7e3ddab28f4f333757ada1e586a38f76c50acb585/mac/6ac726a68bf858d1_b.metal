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
    float2 _224 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float _58 = in.m_40.w;
    float _60 = in.m_42.w;
    float _62 = in.m_40.x;
    float _64 = in.m_42.y;
    float _66 = in.m_42.x;
    float _68 = in.m_42.z;
    float _70 = in.m_40.y;
    float _72 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _58, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _78 = -_72;
    float _80 = fma(_78, _60, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _82 = -_72;
    float _84 = fma(_82, _62, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _86 = -_72;
    float _88 = fma(_86, _64, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _90 = 1.0 / _76;
    float _92 = -_72;
    float _94 = fma(_92, _66, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _96 = -_72;
    float _98 = fma(_96, _68, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _100 = -_72;
    float _102 = fma(_100, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _104 = 1.0 / _80;
    float _106 = _84 * _90;
    float _108 = _102 * _90;
    float2 _326 = float2(_52, _54);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_326, float2(0.0), isnan(_326))).xyz;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _88 * _104;
    float _122 = _98 * _104;
    float _124 = _94 * _104;
    float2 _349 = float2(_124, _120);
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349)), _122);
    float2 _357 = float2(_106, _108);
    float3 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_357, float2(0.0), isnan(_357))).xyz;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = in.m_40.z;
    float _138 = -_72;
    float _140 = fma(_138, _136, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _142 = fma(_140, -0.5, 0.5);
    bool _146 = _142 <= 1.0;
    bool _148 = isnan(_142);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = float(_154);
    float _158 = _142 * _156;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = abs(_160);
    float _164 = log2(_162);
    float _166 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _168 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _166);
    float _170 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _168);
    float _172 = rsqrt(_170);
    float _174 = _164 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _176 = exp2(_174);
    float _178 = fma(_116, 2.0, -1.0);
    float _180 = fma(_114, 2.0, -1.0);
    float _182 = fma(_118, 2.0, -1.0);
    float _184 = _178 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _186 = fma(_180, (*spvDescriptorSet0.fp_c4)._m0[15].x, _184);
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c4)._m0[15].z, _186);
    float _190 = _176 * _126;
    float _192 = -_172;
    float _194 = fma(_192, _188, 0.0);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _190 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _200 = _130 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _202 = _132 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _204 = _198 * _196;
    float _206 = _134 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _208 = _200 * _204;
    float _210 = _202 * _204;
    float _212 = _206 * _204;
    out.m_45.x = _208;
    out.m_45.y = _210;
    out.m_45.z = _212;
    out.m_45.w = 0.0;
    return out;
}

