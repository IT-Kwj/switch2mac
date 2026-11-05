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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _252 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252))).x;
    float2 _263 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_263, float2(0.0), isnan(_263))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _72 = 1.0 / _70;
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _76 = _72 * _74;
    float _78 = _76 * _64;
    float _80 = _76 * _66;
    float _82 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _86 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _88 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].x, _82);
    float _90 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _92 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].x, _84);
    float _94 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].z, _88);
    float _98 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].x, _90);
    float _100 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].z, _92);
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _104 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].z, _98);
    float _106 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].x, _86);
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _110 = 1.0 / _102;
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _114 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _106);
    float _116 = fma(_60, 2.0, -1.0);
    float _118 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _120 = _114 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _122 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
    float _124 = 1.0 / _120;
    float _126 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
    float _128 = _112 * _110;
    float _130 = _108 * _110;
    float _132 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _134 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _136 = fma(_62, 2.0, -1.0);
    float _138 = _116 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _140 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
    float2 _433 = float2(_128, _130);
    float2 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_433, float2(0.0), isnan(_433))).xy;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
    float _150 = fma(_138, 2.0, _50);
    float _152 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
    float _154 = _126 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _158 = _136 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _162 = _154 * _124;
    float _164 = _156 * _124;
    float _166 = _160 * _124;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = fma(_158, 2.0, _52);
    float _172 = rint(_168);
    float _174 = precise::max(_172, 0.0);
    uint _177 = uint(_174);
    uint _179 = clamp(_177, 0u, 65535u);
    float3 _502 = float3(_162, _164, float(int(_179)));
    float3 _506 = select(_502, float3(0.0), isnan(_502));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _506.xy, uint(rint(_506.z)), 1.0);
    float2 _511 = float2(_150, _170);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_511, float2(0.0), isnan(_511))).x;
    float _185 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _187 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].x, _185);
    float _189 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].z, _187);
    float _191 = _189 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _193 = precise::min(_191, 1.0);
    float _195 = -_76;
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _199 = _195 + _197;
    float _201 = _199 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = -_144;
    float _207 = fma(_205, _144, _146);
    float _209 = -_144;
    float _211 = _193 + _209;
    float _213 = fma(_211, _211, _207);
    bool _217 = _211 <= 0.001000000047497451305389404296875;
    float _219 = float(_217);
    float _221 = 1.0 / _213;
    float _223 = _207 * _221;
    float _225 = -_76;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _229 = _225 + _227;
    float _231 = precise::max(_223, _219);
    float _233 = _229 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = precise::min(_231, 1.0);
    float _239 = _235 + _181;
    float _241 = _203 + _237;
    out.m_43.x = _183;
    out.m_43.y = _239;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _241;
    return out;
}

