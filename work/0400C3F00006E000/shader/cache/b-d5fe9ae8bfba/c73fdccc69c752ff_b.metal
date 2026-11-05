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
    float2 _248 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _66);
    float _76 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _78 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _74);
    float _84 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _86 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _78);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _86);
    float _96 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _88);
    float _98 = 1.0 / _90;
    float _100 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _102 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _94);
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _106 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _112 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _114 = 1.0 / _92;
    float _116 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _106);
    float _118 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _112);
    float _120 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _116);
    float _122 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = _104 * _98;
    float _126 = _110 * _98;
    float _128 = _120 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _424 = float2(_124, _126);
    float2 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_424, float2(0.0), isnan(_424))).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _108 * _114;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _122 * _114;
    float _144 = _128 * _114;
    float _146 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _148 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _150 = rint(_140);
    float _152 = precise::max(_150, 0.0);
    uint _155 = uint(_152);
    uint _157 = clamp(_155, 0u, 65535u);
    float _159 = fma(_146, 0.5, _142);
    float _161 = fma(_146, -0.5, _142);
    float _163 = fma(_148, 0.5, _144);
    float _165 = fma(_148, -0.5, _144);
    float3 _487 = float3(_159, _163, float(int(_157)));
    float3 _491 = select(_487, float3(0.0), isnan(_487));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _491.xy, uint(rint(_491.z)), 1.0);
    float3 _499 = float3(_161, _163, float(int(_157)));
    float3 _501 = select(_499, float3(0.0), isnan(_499));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _501.xy, uint(rint(_501.z)), 1.0);
    float3 _509 = float3(_159, _165, float(int(_157)));
    float3 _511 = select(_509, float3(0.0), isnan(_509));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _511.xy, uint(rint(_511.z)), 1.0);
    float3 _519 = float3(_161, _165, float(int(_157)));
    float3 _521 = select(_519, float3(0.0), isnan(_519));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _521.xy, uint(rint(_521.z)), 1.0);
    float _175 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _177 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _175);
    float _179 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _177);
    float _181 = _179 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _183 = precise::min(_181, 1.0);
    float _185 = -_134;
    float _187 = fma(_185, _134, _136);
    float _189 = -_134;
    float _191 = _183 + _189;
    float _193 = -_60;
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _197 = _193 + _195;
    float _199 = fma(_191, _191, _187);
    bool _203 = _191 <= 0.001000000047497451305389404296875;
    float _205 = float(_203);
    float _207 = _197 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = 1.0 / _199;
    float _213 = _187 * _211;
    float _215 = _167 + _169;
    float _217 = precise::max(_213, _205);
    float _219 = _215 + _171;
    float _221 = -_60;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _225 = _221 + _223;
    float _227 = precise::min(_217, 1.0);
    float _229 = _219 + _173;
    float _231 = _225 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = fma(_229, 0.25, _209);
    float _237 = _233 + _227;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _235;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _237;
    return out;
}

