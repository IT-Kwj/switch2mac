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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
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
    float2 _199 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_199, float2(0.0), isnan(_199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_199, float2(0.0), isnan(_199))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _70);
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _80 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _78);
    float _84 = 1.0 / _76;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _68);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _94 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _96 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = _90 * _84;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _98 * _84;
    float _106 = _96 * _84;
    float _108 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _104);
    float _110 = rint(_102);
    float _112 = precise::max(_110, 0.0);
    uint _115 = uint(_112);
    uint _117 = clamp(_115, 0u, 65535u);
    float _119 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _106);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _123 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _121, _106);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _127 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _125, _104);
    float3 _366 = float3(_106, _108, float(int(_117)));
    float3 _370 = select(_366, float3(0.0), isnan(_366));
    float _129 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _370.xy, uint(rint(_370.z)), 1.0);
    float3 _378 = float3(_119, _108, float(int(_117)));
    float3 _380 = select(_378, float3(0.0), isnan(_378));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _380.xy, uint(rint(_380.z)), 1.0);
    float3 _388 = float3(_123, _108, float(int(_117)));
    float3 _390 = select(_388, float3(0.0), isnan(_388));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _390.xy, uint(rint(_390.z)), 1.0);
    float3 _398 = float3(_119, _104, float(int(_117)));
    float3 _400 = select(_398, float3(0.0), isnan(_398));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _400.xy, uint(rint(_400.z)), 1.0);
    float3 _408 = float3(_106, _104, float(int(_117)));
    float3 _410 = select(_408, float3(0.0), isnan(_408));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _410.xy, uint(rint(_410.z)), 1.0);
    float3 _418 = float3(_123, _104, float(int(_117)));
    float3 _420 = select(_418, float3(0.0), isnan(_418));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _420.xy, uint(rint(_420.z)), 1.0);
    float3 _428 = float3(_119, _127, float(int(_117)));
    float3 _430 = select(_428, float3(0.0), isnan(_428));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _430.xy, uint(rint(_430.z)), 1.0);
    float3 _438 = float3(_106, _127, float(int(_117)));
    float3 _440 = select(_438, float3(0.0), isnan(_438));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _440.xy, uint(rint(_440.z)), 1.0);
    float3 _448 = float3(_123, _127, float(int(_117)));
    float3 _450 = select(_448, float3(0.0), isnan(_448));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _450.xy, uint(rint(_450.z)), 1.0);
    float2 _455 = float2(_46, _48);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_455, float2(0.0), isnan(_455))).x;
    float _149 = -_60;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _153 = _149 + _151;
    float _155 = -_60;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _159 = _155 + _157;
    float _161 = _153 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _159 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _167 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _171 = _131 + _129;
    float _173 = _171 + _133;
    float _175 = _173 + _135;
    float _177 = _175 + _137;
    float _179 = _177 + _139;
    float _181 = _179 + _141;
    float _183 = _181 + _143;
    float _185 = _183 + _145;
    float _187 = fma(_185, 0.111111111938953399658203125, _163);
    out.m_39.x = _147;
    out.m_39.y = _187;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _169;
    return out;
}

