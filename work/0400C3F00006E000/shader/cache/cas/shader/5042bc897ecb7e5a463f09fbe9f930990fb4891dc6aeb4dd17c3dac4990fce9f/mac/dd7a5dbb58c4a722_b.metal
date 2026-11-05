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
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
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
    float2 _296 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float2 _307 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_307, float2(0.0), isnan(_307))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_307, float2(0.0), isnan(_307))).xy;
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
    float _86 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _88 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].x, _82);
    float _90 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].x, _84);
    float _92 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].x, _86);
    float _94 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].z, _88);
    float _96 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _98 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].z, _92);
    float _100 = _94 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _102 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].x, _96);
    float _104 = _98 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _106 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _102);
    float _108 = 1.0 / _100;
    float _110 = _106 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _112 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].z, _90);
    float _114 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _116 = 1.0 / _110;
    float _118 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _114);
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _122 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _118);
    float _124 = _104 * _108;
    float _126 = _122 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _128 = _120 * _108;
    float _130 = fma(_60, 2.0, -1.0);
    float _132 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _134 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _136 = fma(_62, 2.0, -1.0);
    float _138 = _126 * _116;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
    float _144 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
    float _146 = _130 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _148 = _136 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _150 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _142);
    float _152 = rint(_140);
    float _154 = precise::max(_152, 0.0);
    uint _157 = uint(_154);
    uint _159 = clamp(_157, 0u, 65535u);
    float _161 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _144);
    float _163 = fma(_146, 2.0, _50);
    float _165 = _150 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _167 = _161 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = _165 * _116;
    float _171 = _167 * _116;
    float _173 = fma(_148, 2.0, _52);
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _177 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _175, _169);
    float _179 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _169);
    float _181 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _171);
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _185 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _183, _171);
    float3 _564 = float3(_169, _181, float(int(_159)));
    float3 _568 = select(_564, float3(0.0), isnan(_564));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _568.xy, uint(rint(_568.z)), 1.0);
    float3 _576 = float3(_179, _181, float(int(_159)));
    float3 _578 = select(_576, float3(0.0), isnan(_576));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _578.xy, uint(rint(_578.z)), 1.0);
    float3 _586 = float3(_177, _181, float(int(_159)));
    float3 _588 = select(_586, float3(0.0), isnan(_586));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _588.xy, uint(rint(_588.z)), 1.0);
    float3 _596 = float3(_179, _171, float(int(_159)));
    float3 _598 = select(_596, float3(0.0), isnan(_596));
    float _193 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _598.xy, uint(rint(_598.z)), 1.0);
    float3 _606 = float3(_169, _171, float(int(_159)));
    float3 _608 = select(_606, float3(0.0), isnan(_606));
    float _195 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _608.xy, uint(rint(_608.z)), 1.0);
    float2 _613 = float2(_124, _128);
    float2 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_613, float2(0.0), isnan(_613))).xy;
    float _199 = _197.x;
    float _201 = _197.y;
    float3 _628 = float3(_177, _171, float(int(_159)));
    float3 _630 = select(_628, float3(0.0), isnan(_628));
    float _203 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _630.xy, uint(rint(_630.z)), 1.0);
    float3 _638 = float3(_179, _185, float(int(_159)));
    float3 _640 = select(_638, float3(0.0), isnan(_638));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _640.xy, uint(rint(_640.z)), 1.0);
    float3 _648 = float3(_169, _185, float(int(_159)));
    float3 _650 = select(_648, float3(0.0), isnan(_648));
    float _207 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _650.xy, uint(rint(_650.z)), 1.0);
    float3 _658 = float3(_177, _185, float(int(_159)));
    float3 _660 = select(_658, float3(0.0), isnan(_658));
    float _209 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _660.xy, uint(rint(_660.z)), 1.0);
    float2 _665 = float2(_163, _173);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_665, float2(0.0), isnan(_665))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_665, float2(0.0), isnan(_665))).x;
    float _213 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _215 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].x, _213);
    float _217 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].z, _215);
    float _219 = _217 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _221 = precise::min(_219, 1.0);
    float _223 = -_76;
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _227 = _223 + _225;
    float _229 = -_76;
    float _231 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _233 = _229 + _231;
    float _235 = _227 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _233 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _189 + _187;
    float _245 = _243 + _191;
    float _247 = -_199;
    float _249 = fma(_247, _199, _201);
    float _251 = -_199;
    float _253 = _221 + _251;
    float _255 = _245 + _193;
    float _257 = fma(_253, _253, _249);
    float _259 = _255 + _195;
    bool _263 = _253 <= 0.001000000047497451305389404296875;
    float _265 = float(_263);
    float _267 = 1.0 / _257;
    float _269 = _259 + _203;
    float _271 = _269 + _205;
    float _273 = _249 * _267;
    float _275 = _271 + _207;
    float _277 = precise::max(_273, _265);
    float _279 = _275 + _209;
    float _281 = precise::min(_277, 1.0);
    float _283 = fma(_279, 0.111111111938953399658203125, _237);
    float _285 = _241 + _281;
    out.m_43.x = _211;
    out.m_43.y = _283;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _285;
    return out;
}

