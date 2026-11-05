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
    float2 _272 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _78 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _78);
    float _88 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _90 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _98 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _100 = 1.0 / _92;
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _90);
    float _104 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _74);
    float _106 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _98);
    float _108 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _82);
    float _110 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _112 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _104);
    float _114 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _106);
    float _116 = 1.0 / _96;
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _120 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _108);
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = _112 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _126 = _120 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _128 = _94 * _100;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _122 * _100;
    float _134 = _118 * _100;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _138 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _136, _132);
    float _140 = rint(_130);
    float _142 = precise::max(_140, 0.0);
    uint _145 = uint(_142);
    uint _147 = clamp(_145, 0u, 65535u);
    float _149 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _134);
    float _151 = _124 * _116;
    float _153 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _132);
    float _155 = _126 * _116;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _159 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _157, _134);
    float3 _503 = float3(_132, _149, float(int(_147)));
    float3 _507 = select(_503, float3(0.0), isnan(_503));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _507.xy, uint(rint(_507.z)), 1.0);
    float3 _515 = float3(_153, _149, float(int(_147)));
    float3 _517 = select(_515, float3(0.0), isnan(_515));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _517.xy, uint(rint(_517.z)), 1.0);
    float3 _525 = float3(_138, _149, float(int(_147)));
    float3 _527 = select(_525, float3(0.0), isnan(_525));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _527.xy, uint(rint(_527.z)), 1.0);
    float3 _535 = float3(_153, _134, float(int(_147)));
    float3 _537 = select(_535, float3(0.0), isnan(_535));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _537.xy, uint(rint(_537.z)), 1.0);
    float3 _545 = float3(_132, _134, float(int(_147)));
    float3 _547 = select(_545, float3(0.0), isnan(_545));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _547.xy, uint(rint(_547.z)), 1.0);
    float2 _552 = float2(_155, _151);
    float2 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_552, float2(0.0), isnan(_552))).xy;
    float _175 = _173.x;
    float _177 = _173.y;
    float3 _567 = float3(_138, _134, float(int(_147)));
    float3 _569 = select(_567, float3(0.0), isnan(_567));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _569.xy, uint(rint(_569.z)), 1.0);
    float3 _577 = float3(_153, _159, float(int(_147)));
    float3 _579 = select(_577, float3(0.0), isnan(_577));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _579.xy, uint(rint(_579.z)), 1.0);
    float3 _587 = float3(_132, _159, float(int(_147)));
    float3 _589 = select(_587, float3(0.0), isnan(_587));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _589.xy, uint(rint(_589.z)), 1.0);
    float3 _597 = float3(_138, _159, float(int(_147)));
    float3 _599 = select(_597, float3(0.0), isnan(_597));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _599.xy, uint(rint(_599.z)), 1.0);
    float2 _604 = float2(_48, _50);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_604, float2(0.0), isnan(_604))).x;
    float _189 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _191 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _189);
    float _193 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _191);
    float _195 = _193 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _197 = precise::min(_195, 1.0);
    float _199 = -_62;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _203 = _199 + _201;
    float _205 = -_62;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _209 = _205 + _207;
    float _211 = _203 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _209 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _163 + _161;
    float _221 = -_175;
    float _223 = fma(_221, _175, _177);
    float _225 = -_175;
    float _227 = _197 + _225;
    float _229 = _219 + _165;
    float _231 = fma(_227, _227, _223);
    float _233 = _229 + _167;
    bool _237 = _227 <= 0.001000000047497451305389404296875;
    float _239 = float(_237);
    float _241 = _233 + _169;
    float _243 = 1.0 / _231;
    float _245 = _241 + _179;
    float _247 = _245 + _181;
    float _249 = _247 + _183;
    float _251 = _249 + _185;
    float _253 = _223 * _243;
    float _255 = fma(_251, 0.111111111938953399658203125, _213);
    float _257 = precise::max(_253, _239);
    float _259 = precise::min(_257, 1.0);
    float _261 = _217 + _259;
    out.m_41.x = _187;
    out.m_41.y = _255;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _261;
    return out;
}

