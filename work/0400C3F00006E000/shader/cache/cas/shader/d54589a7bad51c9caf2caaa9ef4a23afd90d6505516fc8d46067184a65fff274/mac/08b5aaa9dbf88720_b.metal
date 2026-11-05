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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
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
    float2 _276 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _82 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _76);
    float _86 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _94 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _102 = _92 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _106 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _78);
    float _108 = 1.0 / _96;
    float _110 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _100);
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _104);
    float _114 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _86);
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _118 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _110);
    float _120 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _114);
    float _122 = 1.0 / _102;
    float _124 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _126 = _116 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _128 = _120 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _130 = _98 * _108;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _112 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _136 = _124 * _108;
    float _138 = _134 * _108;
    float _140 = rint(_132);
    float _142 = precise::max(_140, 0.0);
    uint _145 = uint(_142);
    uint _147 = clamp(_145, 0u, 65535u);
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _151 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _149, _136);
    float _153 = _126 * _122;
    float _155 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _138);
    float _157 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _136);
    float _159 = _128 * _122;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _163 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _161, _138);
    float3 _511 = float3(_136, _155, float(int(_147)));
    float3 _515 = select(_511, float3(0.0), isnan(_511));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _515.xy, uint(rint(_515.z)), 1.0);
    float3 _523 = float3(_157, _155, float(int(_147)));
    float3 _525 = select(_523, float3(0.0), isnan(_523));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _525.xy, uint(rint(_525.z)), 1.0);
    float3 _533 = float3(_151, _155, float(int(_147)));
    float3 _535 = select(_533, float3(0.0), isnan(_533));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _535.xy, uint(rint(_535.z)), 1.0);
    float3 _543 = float3(_157, _138, float(int(_147)));
    float3 _545 = select(_543, float3(0.0), isnan(_543));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _545.xy, uint(rint(_545.z)), 1.0);
    float3 _553 = float3(_136, _138, float(int(_147)));
    float3 _555 = select(_553, float3(0.0), isnan(_553));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _555.xy, uint(rint(_555.z)), 1.0);
    float2 _560 = float2(_159, _153);
    float2 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_560, float2(0.0), isnan(_560))).xy;
    float _179 = _177.x;
    float _181 = _177.y;
    float3 _575 = float3(_151, _138, float(int(_147)));
    float3 _577 = select(_575, float3(0.0), isnan(_575));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _577.xy, uint(rint(_577.z)), 1.0);
    float3 _585 = float3(_157, _163, float(int(_147)));
    float3 _587 = select(_585, float3(0.0), isnan(_585));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _587.xy, uint(rint(_587.z)), 1.0);
    float3 _595 = float3(_136, _163, float(int(_147)));
    float3 _597 = select(_595, float3(0.0), isnan(_595));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _597.xy, uint(rint(_597.z)), 1.0);
    float3 _605 = float3(_151, _163, float(int(_147)));
    float3 _607 = select(_605, float3(0.0), isnan(_605));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _607.xy, uint(rint(_607.z)), 1.0);
    float2 _612 = float2(_48, _50);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float _193 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _195 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _193);
    float _197 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _195);
    float _199 = _197 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _201 = precise::min(_199, 1.0);
    float _203 = -_66;
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _207 = _203 + _205;
    float _209 = -_66;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _213 = _209 + _211;
    float _215 = _207 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _213 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _167 + _165;
    float _225 = -_179;
    float _227 = fma(_225, _179, _181);
    float _229 = -_179;
    float _231 = _201 + _229;
    float _233 = _223 + _169;
    float _235 = fma(_231, _231, _227);
    float _237 = _233 + _171;
    bool _241 = _231 <= 0.001000000047497451305389404296875;
    float _243 = float(_241);
    float _245 = _237 + _173;
    float _247 = 1.0 / _235;
    float _249 = _245 + _183;
    float _251 = _249 + _185;
    float _253 = _251 + _187;
    float _255 = _253 + _189;
    float _257 = _227 * _247;
    float _259 = fma(_255, 0.111111111938953399658203125, _217);
    float _261 = precise::max(_257, _243);
    float _263 = precise::min(_261, 1.0);
    float _265 = _221 + _263;
    out.m_41.x = _191;
    out.m_41.y = _259;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _265;
    return out;
}

