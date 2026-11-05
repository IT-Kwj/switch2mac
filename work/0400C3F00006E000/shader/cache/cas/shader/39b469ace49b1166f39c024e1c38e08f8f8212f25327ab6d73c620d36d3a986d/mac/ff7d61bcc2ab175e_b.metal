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
    float2 _197 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_197, float2(0.0), isnan(_197))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_197, float2(0.0), isnan(_197))).x;
    float2 _209 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_209, float2(0.0), isnan(_209))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_209, float2(0.0), isnan(_209))).xy;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = in.m_38.y;
    float _64 = in.m_38.x;
    float _66 = -_52;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _70 = 1.0 / _68;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = _70 * _72;
    float _76 = _74 * _62;
    float _78 = _74 * _64;
    float _80 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _86 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _94 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _100 = 1.0 / _90;
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _110 = _104 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _112 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _114 = _106 * _100;
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _112 * _100;
    float _120 = _110 * _100;
    float _122 = _116 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _124 = fma(_58, 2.0, -1.0);
    float _126 = fma(_60, 2.0, -1.0);
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _130 = _122 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _132 = _124 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _134 = _126 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _136 = fma(_128, 0.5, _120);
    float _138 = fma(_128, -0.5, _120);
    float _140 = fma(_132, 2.0, _48);
    float _142 = fma(_130, 0.5, _118);
    float _144 = fma(_134, 2.0, _50);
    float _146 = fma(_130, -0.5, _118);
    float3 _387 = float3(_136, _142, float(0));
    float3 _391 = select(_387, float3(0.0), isnan(_387));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _391.xy, uint(rint(_391.z)), _116);
    float3 _398 = float3(_138, _142, float(0));
    float3 _400 = select(_398, float3(0.0), isnan(_398));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _400.xy, uint(rint(_400.z)), _116);
    float3 _407 = float3(_136, _146, float(0));
    float3 _409 = select(_407, float3(0.0), isnan(_407));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _409.xy, uint(rint(_409.z)), _116);
    float3 _416 = float3(_138, _146, float(0));
    float3 _418 = select(_416, float3(0.0), isnan(_416));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _418.xy, uint(rint(_418.z)), _116);
    float2 _424 = float2(_140, _144);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_424, float2(0.0), isnan(_424))).x;
    float _158 = -_74;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _162 = _158 + _160;
    float _164 = _148 + _150;
    float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _172 = _164 + _152;
    float _174 = -_74;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _178 = _174 + _176;
    float _180 = _172 + _154;
    float _182 = _178 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = fma(_180, 0.25, _184);
    out.m_41.x = _156;
    out.m_41.y = _186;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _170;
    return out;
}

