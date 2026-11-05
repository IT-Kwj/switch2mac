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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
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
    float2 _180 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_180, float2(0.0), isnan(_180))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_180, float2(0.0), isnan(_180))).x;
    float2 _192 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_192, float2(0.0), isnan(_192))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_192, float2(0.0), isnan(_192))).xy;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = in.m_38.y;
    float _64 = in.m_38.x;
    float _66 = -_52;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _70 = 1.0 / _68;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = _70 * _72;
    float _76 = _74 * _62;
    float _78 = _74 * _64;
    float _80 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _86 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _94 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _98 = 1.0 / _90;
    float _100 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _94);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _82);
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _110 = fma(_58, 2.0, -1.0);
    float _112 = fma(_60, 2.0, -1.0);
    float _114 = _106 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _118 = _104 * _98;
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _114 * _98;
    float _124 = _116 * _98;
    float _126 = _110 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _128 = rint(_120);
    float _130 = precise::max(_128, 0.0);
    uint _133 = uint(_130);
    uint _135 = clamp(_133, 0u, 65535u);
    float _137 = _112 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _139 = fma(_126, 2.0, _48);
    float _141 = fma(_137, 2.0, _50);
    float3 _354 = float3(_122, _124, float(int(_135)));
    float3 _358 = select(_354, float3(0.0), isnan(_354));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _358.xy, uint(rint(_358.z)), 1.0);
    float2 _363 = float2(_139, _141);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_363, float2(0.0), isnan(_363))).x;
    float _147 = -_74;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _151 = _147 + _149;
    float _153 = -_74;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _157 = _153 + _155;
    float _159 = _151 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _165 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _169 = _161 + _143;
    out.m_41.x = _145;
    out.m_41.y = _169;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _167;
    return out;
}

