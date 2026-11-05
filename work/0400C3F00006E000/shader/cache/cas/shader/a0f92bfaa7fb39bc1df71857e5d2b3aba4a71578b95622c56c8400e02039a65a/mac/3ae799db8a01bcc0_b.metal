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
    float2 _228 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _68);
    float _78 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _70);
    float _80 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _76);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _78);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _90 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _96 = _86 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _98 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _88);
    float _100 = 1.0 / _92;
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _90);
    float _104 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _110 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _112 = 1.0 / _106;
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _72);
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _108);
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _120 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _114);
    float _122 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _116);
    float _124 = _96 * _100;
    float _126 = _120 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _128 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _130 = _126 * _100;
    float _132 = _104 * _112;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float2 _409 = float2(_124, _130);
    float2 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_409, float2(0.0), isnan(_409))).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _128 * _112;
    float _146 = _118 * _112;
    float _148 = rint(_134);
    float _150 = precise::max(_148, 0.0);
    uint _153 = uint(_150);
    uint _155 = clamp(_153, 0u, 65535u);
    float3 _441 = float3(_144, _146, float(int(_155)));
    float3 _445 = select(_441, float3(0.0), isnan(_441));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _445.xy, uint(rint(_445.z)), 1.0);
    float2 _450 = float2(_48, _50);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_450, float2(0.0), isnan(_450))).x;
    float _161 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _163 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _161);
    float _165 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _163);
    float _167 = _165 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _169 = precise::min(_167, 1.0);
    float _171 = -_62;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _175 = _171 + _173;
    float _177 = -_62;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _181 = _177 + _179;
    float _183 = _175 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _181 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = -_140;
    float _193 = fma(_191, _140, _142);
    float _195 = -_140;
    float _197 = _169 + _195;
    float _199 = fma(_197, _197, _193);
    bool _203 = _197 <= 0.001000000047497451305389404296875;
    float _205 = float(_203);
    float _207 = 1.0 / _199;
    float _209 = _185 + _157;
    float _211 = _193 * _207;
    float _213 = precise::max(_211, _205);
    float _215 = precise::min(_213, 1.0);
    float _217 = _189 + _215;
    out.m_41.x = _159;
    out.m_41.y = _209;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _217;
    return out;
}

