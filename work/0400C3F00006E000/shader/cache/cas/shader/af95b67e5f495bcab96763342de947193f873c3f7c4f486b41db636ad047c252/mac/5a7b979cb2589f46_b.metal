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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _268 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_268, float2(0.0), isnan(_268))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_268, float2(0.0), isnan(_268))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _76 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _68);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _70);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _84 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _76);
    float _86 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _96 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _98 = 1.0 / _90;
    float _100 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _78);
    float _102 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _94);
    float _104 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _96);
    float _106 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _80);
    float _108 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _88);
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _112 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _104);
    float _114 = 1.0 / _92;
    float _116 = _100 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _118 = _106 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _122 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _108);
    float _124 = _110 * _98;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _118 * _98;
    float _130 = _120 * _98;
    float _132 = _122 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _134 = rint(_126);
    float _136 = precise::max(_134, 0.0);
    uint _139 = uint(_136);
    uint _141 = clamp(_139, 0u, 65535u);
    float _143 = _116 * _114;
    float _145 = _132 * _114;
    float _147 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _130);
    float _149 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _128);
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _153 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _151, _128);
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _157 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _155, _130);
    float3 _499 = float3(_128, _147, float(int(_141)));
    float3 _503 = select(_499, float3(0.0), isnan(_499));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _503.xy, uint(rint(_503.z)), 1.0);
    float3 _511 = float3(_149, _147, float(int(_141)));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _513.xy, uint(rint(_513.z)), 1.0);
    float3 _521 = float3(_153, _147, float(int(_141)));
    float3 _523 = select(_521, float3(0.0), isnan(_521));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _523.xy, uint(rint(_523.z)), 1.0);
    float3 _531 = float3(_149, _130, float(int(_141)));
    float3 _533 = select(_531, float3(0.0), isnan(_531));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _533.xy, uint(rint(_533.z)), 1.0);
    float2 _538 = float2(_143, _145);
    float2 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_538, float2(0.0), isnan(_538))).xy;
    float _171 = _169.x;
    float _173 = _169.y;
    float3 _553 = float3(_128, _130, float(int(_141)));
    float3 _555 = select(_553, float3(0.0), isnan(_553));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _555.xy, uint(rint(_555.z)), 1.0);
    float3 _563 = float3(_153, _130, float(int(_141)));
    float3 _565 = select(_563, float3(0.0), isnan(_563));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _565.xy, uint(rint(_565.z)), 1.0);
    float3 _573 = float3(_149, _157, float(int(_141)));
    float3 _575 = select(_573, float3(0.0), isnan(_573));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _575.xy, uint(rint(_575.z)), 1.0);
    float3 _583 = float3(_128, _157, float(int(_141)));
    float3 _585 = select(_583, float3(0.0), isnan(_583));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _585.xy, uint(rint(_585.z)), 1.0);
    float3 _593 = float3(_153, _157, float(int(_141)));
    float3 _595 = select(_593, float3(0.0), isnan(_593));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _595.xy, uint(rint(_595.z)), 1.0);
    float _185 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _187 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _185);
    float _189 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _187);
    float _191 = _189 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _193 = precise::min(_191, 1.0);
    float _195 = -_171;
    float _197 = fma(_195, _171, _173);
    float _199 = -_171;
    float _201 = _193 + _199;
    float _203 = _161 + _159;
    float _205 = -_60;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _209 = _205 + _207;
    float _211 = fma(_201, _201, _197);
    float _213 = _203 + _163;
    bool _217 = _201 <= 0.001000000047497451305389404296875;
    float _219 = float(_217);
    float _221 = _209 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _213 + _165;
    float _227 = 1.0 / _211;
    float _229 = _225 + _175;
    float _231 = _229 + _177;
    float _233 = _231 + _179;
    float _235 = -_60;
    float _237 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _239 = _235 + _237;
    float _241 = _197 * _227;
    float _243 = _233 + _181;
    float _245 = _239 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = precise::max(_241, _219);
    float _251 = _243 + _183;
    float _253 = precise::min(_249, 1.0);
    float _255 = fma(_251, 0.111111111938953399658203125, _223);
    float _257 = _247 + _253;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _255;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _257;
    return out;
}

