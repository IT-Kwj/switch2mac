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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
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
    float2 _241 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_241, float2(0.0), isnan(_241))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _76 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _68);
    float _78 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _70);
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _84 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _88 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _94 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _88);
    float _100 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _80);
    float _102 = 1.0 / _90;
    float _104 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _72);
    float _108 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _96);
    float _110 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _112 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _114 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _106);
    float _116 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _108);
    float _118 = 1.0 / _92;
    float _120 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _126 = _104 * _102;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _112 * _102;
    float _132 = _120 * _102;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _136 = _134 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _140 = _122 * _118;
    float _142 = _124 * _118;
    float _144 = fma(_136, 0.5, _130);
    float _146 = fma(_136, -0.5, _130);
    float _148 = fma(_138, 0.5, _132);
    float _150 = fma(_138, -0.5, _132);
    float2 _456 = float2(_140, _142);
    float2 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_456, float2(0.0), isnan(_456))).xy;
    float _156 = _154.x;
    float _158 = _154.y;
    float3 _470 = float3(_144, _148, float(0));
    float3 _474 = select(_470, float3(0.0), isnan(_470));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _474.xy, uint(rint(_474.z)), _128);
    float3 _481 = float3(_146, _148, float(0));
    float3 _483 = select(_481, float3(0.0), isnan(_481));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _483.xy, uint(rint(_483.z)), _128);
    float3 _490 = float3(_144, _150, float(0));
    float3 _492 = select(_490, float3(0.0), isnan(_490));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _492.xy, uint(rint(_492.z)), _128);
    float3 _499 = float3(_146, _150, float(0));
    float3 _501 = select(_499, float3(0.0), isnan(_499));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _501.xy, uint(rint(_501.z)), _128);
    float _168 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _168);
    float _172 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _170);
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _176 = precise::min(_174, 1.0);
    float _178 = -_156;
    float _180 = fma(_178, _156, _158);
    float _182 = -_156;
    float _184 = _176 + _182;
    float _186 = _160 + _162;
    float _188 = -_60;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _192 = _188 + _190;
    float _194 = fma(_184, _184, _180);
    bool _198 = _184 <= 0.001000000047497451305389404296875;
    float _200 = float(_198);
    float _202 = _186 + _164;
    float _204 = -_60;
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _208 = _204 + _206;
    float _210 = _192 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = 1.0 / _194;
    float _216 = _202 + _166;
    float _218 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = fma(_216, 0.25, _212);
    float _224 = _180 * _214;
    float _226 = precise::max(_224, _200);
    float _228 = precise::min(_226, 1.0);
    float _230 = _220 + _228;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _222;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _230;
    return out;
}

