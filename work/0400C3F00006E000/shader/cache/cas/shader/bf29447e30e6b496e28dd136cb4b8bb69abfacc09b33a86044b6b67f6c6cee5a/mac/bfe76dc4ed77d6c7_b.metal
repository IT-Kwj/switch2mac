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
    float2 _272 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _96 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _98 = _88 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _90);
    float _102 = 1.0 / _94;
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _106 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _108 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _100);
    float _110 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _112 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _104);
    float _114 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _76);
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _118 = 1.0 / _98;
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _122 = _106 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _126 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _114);
    float _128 = _120 * _102;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _122 * _102;
    float _134 = _124 * _102;
    float _136 = _126 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _138 = rint(_130);
    float _140 = precise::max(_138, 0.0);
    uint _143 = uint(_140);
    uint _145 = clamp(_143, 0u, 65535u);
    float _147 = _116 * _118;
    float _149 = _136 * _118;
    float _151 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _134);
    float _153 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _132);
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _157 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _155, _132);
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _161 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _159, _134);
    float3 _507 = float3(_132, _151, float(int(_145)));
    float3 _511 = select(_507, float3(0.0), isnan(_507));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _511.xy, uint(rint(_511.z)), 1.0);
    float3 _519 = float3(_153, _151, float(int(_145)));
    float3 _521 = select(_519, float3(0.0), isnan(_519));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _521.xy, uint(rint(_521.z)), 1.0);
    float3 _529 = float3(_157, _151, float(int(_145)));
    float3 _531 = select(_529, float3(0.0), isnan(_529));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _531.xy, uint(rint(_531.z)), 1.0);
    float3 _539 = float3(_153, _134, float(int(_145)));
    float3 _541 = select(_539, float3(0.0), isnan(_539));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _541.xy, uint(rint(_541.z)), 1.0);
    float2 _546 = float2(_147, _149);
    float2 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_546, float2(0.0), isnan(_546))).xy;
    float _175 = _173.x;
    float _177 = _173.y;
    float3 _561 = float3(_132, _134, float(int(_145)));
    float3 _563 = select(_561, float3(0.0), isnan(_561));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _563.xy, uint(rint(_563.z)), 1.0);
    float3 _571 = float3(_157, _134, float(int(_145)));
    float3 _573 = select(_571, float3(0.0), isnan(_571));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _573.xy, uint(rint(_573.z)), 1.0);
    float3 _581 = float3(_153, _161, float(int(_145)));
    float3 _583 = select(_581, float3(0.0), isnan(_581));
    float _183 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _583.xy, uint(rint(_583.z)), 1.0);
    float3 _591 = float3(_132, _161, float(int(_145)));
    float3 _593 = select(_591, float3(0.0), isnan(_591));
    float _185 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _593.xy, uint(rint(_593.z)), 1.0);
    float3 _601 = float3(_157, _161, float(int(_145)));
    float3 _603 = select(_601, float3(0.0), isnan(_601));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _603.xy, uint(rint(_603.z)), 1.0);
    float _189 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _191 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _189);
    float _193 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _191);
    float _195 = _193 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _197 = precise::min(_195, 1.0);
    float _199 = -_175;
    float _201 = fma(_199, _175, _177);
    float _203 = -_175;
    float _205 = _197 + _203;
    float _207 = _165 + _163;
    float _209 = -_64;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _213 = _209 + _211;
    float _215 = fma(_205, _205, _201);
    float _217 = _207 + _167;
    bool _221 = _205 <= 0.001000000047497451305389404296875;
    float _223 = float(_221);
    float _225 = _213 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = _217 + _169;
    float _231 = 1.0 / _215;
    float _233 = _229 + _179;
    float _235 = _233 + _181;
    float _237 = _235 + _183;
    float _239 = -_64;
    float _241 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _243 = _239 + _241;
    float _245 = _201 * _231;
    float _247 = _237 + _185;
    float _249 = _243 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = precise::max(_245, _223);
    float _255 = _247 + _187;
    float _257 = precise::min(_253, 1.0);
    float _259 = fma(_255, 0.111111111938953399658203125, _227);
    float _261 = _251 + _257;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _259;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _261;
    return out;
}

