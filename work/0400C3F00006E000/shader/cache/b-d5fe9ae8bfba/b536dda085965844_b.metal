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
    float2 _179 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_179, float2(0.0), isnan(_179))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_179, float2(0.0), isnan(_179))).x;
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
    float _82 = 1.0 / _76;
    float _84 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _78);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _68);
    float _90 = _84 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _94 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _96 = _92 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = _90 * _82;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _96 * _82;
    float _106 = _98 * _82;
    float _108 = rint(_102);
    float _110 = precise::max(_108, 0.0);
    uint _113 = uint(_110);
    uint _115 = clamp(_113, 0u, 65535u);
    float _117 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _119 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _121 = fma(_117, 0.5, _104);
    float _123 = fma(_119, 0.5, _106);
    float _125 = fma(_117, -0.5, _104);
    float _127 = fma(_119, -0.5, _106);
    float3 _342 = float3(_121, _123, float(int(_115)));
    float3 _346 = select(_342, float3(0.0), isnan(_342));
    float _129 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _346.xy, uint(rint(_346.z)), 1.0);
    float3 _354 = float3(_125, _123, float(int(_115)));
    float3 _356 = select(_354, float3(0.0), isnan(_354));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _356.xy, uint(rint(_356.z)), 1.0);
    float3 _364 = float3(_121, _127, float(int(_115)));
    float3 _366 = select(_364, float3(0.0), isnan(_364));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _366.xy, uint(rint(_366.z)), 1.0);
    float3 _374 = float3(_125, _127, float(int(_115)));
    float3 _376 = select(_374, float3(0.0), isnan(_374));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _376.xy, uint(rint(_376.z)), 1.0);
    float2 _381 = float2(_46, _48);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float _139 = _129 + _131;
    float _141 = -_60;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _145 = _141 + _143;
    float _147 = _139 + _133;
    float _149 = -_60;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _153 = _149 + _151;
    float _155 = _147 + _135;
    float _157 = _153 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _145 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_155, 0.25, _159);
    float _167 = _163 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _137;
    out.m_39.y = _165;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _167;
    return out;
}

