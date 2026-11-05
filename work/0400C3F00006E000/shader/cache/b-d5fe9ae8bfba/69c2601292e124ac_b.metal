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
    float2 _252 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _70);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _74);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _78);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _82);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _98 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _90);
    float _102 = 1.0 / _94;
    float _104 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _92);
    float _106 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _98);
    float _108 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _110 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _114 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _106);
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _118 = 1.0 / _96;
    float _120 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _124 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _110);
    float _126 = _120 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _128 = _124 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _130 = _112 * _102;
    float _132 = _116 * _102;
    float2 _432 = float2(_130, _132);
    float2 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float2(0.0), isnan(_432))).xy;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _122 * _118;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _126 * _118;
    float _148 = _128 * _118;
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _152 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _154 = rint(_144);
    float _156 = precise::max(_154, 0.0);
    uint _159 = uint(_156);
    uint _161 = clamp(_159, 0u, 65535u);
    float _163 = fma(_150, 0.5, _146);
    float _165 = fma(_150, -0.5, _146);
    float _167 = fma(_152, 0.5, _148);
    float _169 = fma(_152, -0.5, _148);
    float3 _495 = float3(_163, _167, float(int(_161)));
    float3 _499 = select(_495, float3(0.0), isnan(_495));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _499.xy, uint(rint(_499.z)), 1.0);
    float3 _507 = float3(_165, _167, float(int(_161)));
    float3 _509 = select(_507, float3(0.0), isnan(_507));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _509.xy, uint(rint(_509.z)), 1.0);
    float3 _517 = float3(_163, _169, float(int(_161)));
    float3 _519 = select(_517, float3(0.0), isnan(_517));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _519.xy, uint(rint(_519.z)), 1.0);
    float3 _527 = float3(_165, _169, float(int(_161)));
    float3 _529 = select(_527, float3(0.0), isnan(_527));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _529.xy, uint(rint(_529.z)), 1.0);
    float _179 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _181 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _179);
    float _183 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _181);
    float _185 = _183 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _187 = precise::min(_185, 1.0);
    float _189 = -_138;
    float _191 = fma(_189, _138, _140);
    float _193 = -_138;
    float _195 = _187 + _193;
    float _197 = -_64;
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _201 = _197 + _199;
    float _203 = fma(_195, _195, _191);
    bool _207 = _195 <= 0.001000000047497451305389404296875;
    float _209 = float(_207);
    float _211 = _201 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = 1.0 / _203;
    float _217 = _191 * _215;
    float _219 = _171 + _173;
    float _221 = precise::max(_217, _209);
    float _223 = _219 + _175;
    float _225 = -_64;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _229 = _225 + _227;
    float _231 = precise::min(_221, 1.0);
    float _233 = _223 + _177;
    float _235 = _229 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_233, 0.25, _213);
    float _241 = _237 + _231;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _239;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _241;
    return out;
}

