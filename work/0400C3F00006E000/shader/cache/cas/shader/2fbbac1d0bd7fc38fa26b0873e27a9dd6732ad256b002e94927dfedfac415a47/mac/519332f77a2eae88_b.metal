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
    float2 _159 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_159, float2(0.0), isnan(_159))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_159, float2(0.0), isnan(_159))).x;
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
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _88 = 1.0 / _80;
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _94 * _88;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _102 * _88;
    float _110 = _100 * _88;
    float _112 = rint(_106);
    float _114 = precise::max(_112, 0.0);
    uint _117 = uint(_114);
    uint _119 = clamp(_117, 0u, 65535u);
    float3 _300 = float3(_110, _108, float(int(_119)));
    float3 _304 = select(_300, float3(0.0), isnan(_300));
    float _121 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _304.xy, uint(rint(_304.z)), 1.0);
    float2 _309 = float2(_46, _48);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_309, float2(0.0), isnan(_309))).x;
    float _125 = -_64;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _129 = _125 + _127;
    float _131 = -_64;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _135 = _131 + _133;
    float _137 = _129 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _135 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _143 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _147 = _139 + _121;
    out.m_39.x = _123;
    out.m_39.y = _147;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _145;
    return out;
}

