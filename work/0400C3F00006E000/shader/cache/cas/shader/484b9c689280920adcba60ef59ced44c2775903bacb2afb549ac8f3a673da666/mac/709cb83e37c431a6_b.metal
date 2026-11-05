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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _244 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_244, float2(0.0), isnan(_244))).x;
    float _60 = in.m_40.w;
    float _62 = in.m_42.w;
    float _64 = in.m_40.x;
    float _66 = in.m_42.z;
    float _68 = in.m_42.x;
    float _70 = in.m_42.y;
    float _72 = in.m_40.y;
    float _74 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _60, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _80 = -_74;
    float _82 = fma(_80, _62, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _84 = -_74;
    float _86 = fma(_84, _64, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _88 = -_74;
    float _90 = fma(_88, _66, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _92 = 1.0 / _78;
    float _94 = -_74;
    float _96 = fma(_94, _68, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _98 = -_74;
    float _100 = fma(_98, _70, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _102 = -_74;
    float _104 = fma(_102, _72, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _106 = 1.0 / _82;
    float _108 = _86 * _92;
    float _110 = _104 * _92;
    float2 _346 = float2(_54, _56);
    float3 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_346, float2(0.0), isnan(_346))).xyz;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _90 * _106;
    float _124 = _96 * _106;
    float _126 = _100 * _106;
    float2 _369 = float2(_124, _126);
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369)), _122);
    float2 _377 = float2(_108, _110);
    float3 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_377, float2(0.0), isnan(_377))).xyz;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = in.m_44.y;
    float _140 = in.m_44.x;
    float _142 = in.m_44.z;
    float _144 = -_78;
    float _146 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
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
    float _170 = -_74;
    float _172 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _174 = fma(_170, _138, _172);
    float _176 = -_74;
    float _178 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _180 = fma(_176, _140, _178);
    float _182 = -_74;
    float _184 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _186 = fma(_182, _142, _184);
    float _188 = _174 * _174;
    float _190 = fma(_180, _180, _188);
    float _192 = fma(_186, _186, _190);
    float _194 = _168 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _196 = rsqrt(_192);
    float _198 = exp2(_194);
    float _200 = fma(_118, 2.0, -1.0);
    float _202 = fma(_116, 2.0, -1.0);
    float _204 = fma(_120, 2.0, -1.0);
    float _206 = _200 * _174;
    float _208 = fma(_202, _180, _206);
    float _210 = fma(_204, _186, _208);
    float _212 = _198 * _128;
    float _214 = -_196;
    float _216 = fma(_214, _210, 0.0);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _132 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _222 = _134 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _224 = _212 * _218;
    float _226 = _136 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _228 = _220 * _224;
    float _230 = _222 * _224;
    float _232 = _226 * _224;
    out.m_47.x = _228;
    out.m_47.y = _230;
    out.m_47.z = _232;
    return out;
}

