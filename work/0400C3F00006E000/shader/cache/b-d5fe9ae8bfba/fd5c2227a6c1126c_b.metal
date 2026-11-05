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
    float2 _194 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _74 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _74);
    float _80 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _68);
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _86 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _78);
    float _88 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _82);
    float _90 = 1.0 / _80;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = _98 * _90;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _94 * _90;
    float _106 = _96 * _90;
    float _108 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _110 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _112 = fma(_102, _108, _104);
    float _114 = fma(_102, _110, _106);
    float _116 = -_108;
    float _118 = fma(_102, _116, _104);
    float _120 = -_110;
    float _122 = fma(_102, _120, _106);
    float3 _351 = float3(_112, _114, float(0));
    float3 _355 = select(_351, float3(0.0), isnan(_351));
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _355.xy, uint(rint(_355.z)), _102);
    float3 _362 = float3(_104, _114, float(0));
    float3 _364 = select(_362, float3(0.0), isnan(_362));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _364.xy, uint(rint(_364.z)), _102);
    float3 _371 = float3(_118, _114, float(0));
    float3 _373 = select(_371, float3(0.0), isnan(_371));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _373.xy, uint(rint(_373.z)), _102);
    float3 _380 = float3(_112, _106, float(0));
    float3 _382 = select(_380, float3(0.0), isnan(_380));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _382.xy, uint(rint(_382.z)), _102);
    float3 _389 = float3(_104, _106, float(0));
    float3 _391 = select(_389, float3(0.0), isnan(_389));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _391.xy, uint(rint(_391.z)), _102);
    float3 _398 = float3(_118, _106, float(0));
    float3 _400 = select(_398, float3(0.0), isnan(_398));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _400.xy, uint(rint(_400.z)), _102);
    float3 _407 = float3(_112, _122, float(0));
    float3 _409 = select(_407, float3(0.0), isnan(_407));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _409.xy, uint(rint(_409.z)), _102);
    float3 _416 = float3(_104, _122, float(0));
    float3 _418 = select(_416, float3(0.0), isnan(_416));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _418.xy, uint(rint(_418.z)), _102);
    float3 _425 = float3(_118, _122, float(0));
    float3 _427 = select(_425, float3(0.0), isnan(_425));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _427.xy, uint(rint(_427.z)), _102);
    float2 _433 = float2(_46, _48);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_433, float2(0.0), isnan(_433))).x;
    float _144 = _124 + _126;
    float _146 = _144 + _128;
    float _148 = _146 + _130;
    float _150 = _148 + _132;
    float _152 = _150 + _134;
    float _154 = _152 + _136;
    float _156 = -_60;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _160 = _156 + _158;
    float _162 = -_60;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _166 = _162 + _164;
    float _168 = _154 + _138;
    float _170 = _160 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _166 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _168 + _140;
    float _180 = _176 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _182 = fma(_178, 0.111111111938953399658203125, _172);
    out.m_39.x = _142;
    out.m_39.y = _182;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _180;
    return out;
}

