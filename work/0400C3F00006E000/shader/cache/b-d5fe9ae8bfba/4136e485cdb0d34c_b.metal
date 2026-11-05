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
    float2 _272 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float2 _283 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_283, float2(0.0), isnan(_283))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].z, _70);
    float _74 = _72 * _64;
    float _76 = _72 * _66;
    float _78 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _80 = _74 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _84 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _86 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].x, _78);
    float _88 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].x, _80);
    float _90 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _92 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].x, _82);
    float _94 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].z, _88);
    float _98 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _100 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _106 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].x, _98);
    float _108 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _100);
    float _110 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].x, _84);
    float _112 = 1.0 / _104;
    float _114 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _90);
    float _116 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].z, _92);
    float _118 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _120 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _108);
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _110);
    float _124 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _114);
    float _126 = 1.0 / _102;
    float _128 = _116 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _130 = _118 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _132 = _120 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _134 = _122 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _136 = _124 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _138 = _128 * _112;
    float _140 = _130 * _112;
    float _142 = _132 * _126;
    float _144 = _134 * _126;
    float _146 = _136 * _126;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float2 _471 = float2(_138, _140);
    float2 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_471, float2(0.0), isnan(_471))).xy;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = rint(_148);
    float _158 = precise::max(_156, 0.0);
    uint _161 = uint(_158);
    uint _163 = clamp(_161, 0u, 65535u);
    float _165 = fma(_60, 2.0, -1.0);
    float _167 = fma(_62, 2.0, -1.0);
    float _169 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _171 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _173 = _165 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _175 = _167 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _177 = fma(_169, 0.5, _142);
    float _179 = fma(_169, -0.5, _142);
    float _181 = fma(_171, 0.5, _144);
    float _183 = fma(_171, -0.5, _144);
    float _185 = fma(_175, 2.0, _52);
    float _187 = fma(_173, 2.0, _50);
    float3 _544 = float3(_177, _181, float(int(_163)));
    float3 _548 = select(_544, float3(0.0), isnan(_544));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _548.xy, uint(rint(_548.z)), 1.0);
    float3 _556 = float3(_179, _181, float(int(_163)));
    float3 _558 = select(_556, float3(0.0), isnan(_556));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _558.xy, uint(rint(_558.z)), 1.0);
    float3 _566 = float3(_177, _183, float(int(_163)));
    float3 _568 = select(_566, float3(0.0), isnan(_566));
    float _193 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _568.xy, uint(rint(_568.z)), 1.0);
    float3 _576 = float3(_179, _183, float(int(_163)));
    float3 _578 = select(_576, float3(0.0), isnan(_576));
    float _195 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _578.xy, uint(rint(_578.z)), 1.0);
    float2 _583 = float2(_187, _185);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_583, float2(0.0), isnan(_583))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_583, float2(0.0), isnan(_583))).x;
    float _199 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _201 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].x, _199);
    float _203 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].z, _201);
    float _205 = _203 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _207 = precise::min(_205, 1.0);
    float _209 = -_72;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _213 = _209 + _211;
    float _215 = -_72;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _219 = _215 + _217;
    float _221 = _213 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _219 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = -_152;
    float _231 = fma(_229, _152, _154);
    float _233 = -_152;
    float _235 = _207 + _233;
    float _237 = fma(_235, _235, _231);
    bool _241 = _235 <= 0.001000000047497451305389404296875;
    float _243 = float(_241);
    float _245 = 1.0 / _237;
    float _247 = _231 * _245;
    float _249 = _189 + _191;
    float _251 = _249 + _193;
    float _253 = precise::max(_247, _243);
    float _255 = _251 + _195;
    float _257 = precise::min(_253, 1.0);
    float _259 = fma(_255, 0.25, _223);
    float _261 = _227 + _257;
    out.m_43.x = _197;
    out.m_43.y = _259;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _261;
    return out;
}

