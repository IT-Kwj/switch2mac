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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
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
    float2 _252 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _78 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _70);
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _74);
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _78);
    float _88 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _90 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = 1.0 / _92;
    float _102 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _82);
    float _104 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _96);
    float _106 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _108 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _106);
    float _114 = 1.0 / _94;
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _108);
    float _118 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _112);
    float _120 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _116);
    float _122 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = _98 * _100;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _130 = _120 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _132 = _122 * _100;
    float _134 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _136 = rint(_126);
    float _138 = precise::max(_136, 0.0);
    uint _141 = uint(_138);
    uint _143 = clamp(_141, 0u, 65535u);
    float _145 = _130 * _100;
    float _147 = _110 * _114;
    float _149 = _128 * _114;
    float _151 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _153 = fma(_134, 0.5, _132);
    float _155 = fma(_134, -0.5, _132);
    float _157 = fma(_151, 0.5, _145);
    float2 _472 = float2(_147, _149);
    float2 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_472, float2(0.0), isnan(_472))).xy;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = fma(_151, -0.5, _145);
    float3 _491 = float3(_153, _157, float(int(_143)));
    float3 _495 = select(_491, float3(0.0), isnan(_491));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _495.xy, uint(rint(_495.z)), 1.0);
    float3 _503 = float3(_155, _157, float(int(_143)));
    float3 _505 = select(_503, float3(0.0), isnan(_503));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _505.xy, uint(rint(_505.z)), 1.0);
    float3 _513 = float3(_153, _167, float(int(_143)));
    float3 _515 = select(_513, float3(0.0), isnan(_513));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _515.xy, uint(rint(_515.z)), 1.0);
    float3 _523 = float3(_155, _167, float(int(_143)));
    float3 _525 = select(_523, float3(0.0), isnan(_523));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _525.xy, uint(rint(_525.z)), 1.0);
    float2 _530 = float2(_48, _50);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float _179 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _181 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _179);
    float _183 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _181);
    float _185 = _183 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _187 = precise::min(_185, 1.0);
    float _189 = -_62;
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _193 = _189 + _191;
    float _195 = -_62;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _199 = _195 + _197;
    float _201 = _193 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _199 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -_163;
    float _211 = fma(_209, _163, _165);
    float _213 = -_163;
    float _215 = _187 + _213;
    float _217 = fma(_215, _215, _211);
    bool _221 = _215 <= 0.001000000047497451305389404296875;
    float _223 = float(_221);
    float _225 = 1.0 / _217;
    float _227 = _169 + _171;
    float _229 = _211 * _225;
    float _231 = _227 + _173;
    float _233 = precise::max(_229, _223);
    float _235 = _231 + _175;
    float _237 = precise::min(_233, 1.0);
    float _239 = fma(_235, 0.25, _203);
    float _241 = _207 + _237;
    out.m_41.x = _177;
    out.m_41.y = _239;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _241;
    return out;
}

