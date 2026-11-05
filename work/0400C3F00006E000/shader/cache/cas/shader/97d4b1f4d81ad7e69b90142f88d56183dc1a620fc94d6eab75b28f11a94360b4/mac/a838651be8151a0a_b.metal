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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0), center_no_perspective]];
    float4 m_32 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _44 = in.m_32.x;
    float _46 = in.m_32.y;
    float2 _151 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_151, float2(0.0), isnan(_151))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_151, float2(0.0), isnan(_151))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _58 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].z, _56);
    float _60 = _58 * _50;
    float _62 = _58 * _52;
    float _64 = _60 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _66 = _60 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _68 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].x, _64);
    float _70 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].x, _66);
    float _72 = _60 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = _60 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[3].z, _68);
    float _78 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[2].z, _70);
    float _80 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _82 = _78 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _84 = 1.0 / _80;
    float _86 = _82 * _84;
    float _88 = precise::clamp(_86, 0.0, 1.0);
    float _90 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _92 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _94 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[0].z, _90);
    float _96 = rint(_88);
    float _98 = precise::max(_96, 0.0);
    uint _101 = uint(_98);
    uint _103 = clamp(_101, 0u, 65535u);
    float _105 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _107 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _109 = _105 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _111 = _107 * _84;
    float _113 = _109 * _84;
    float3 _288 = float3(_111, _113, float(int(_103)));
    float3 _292 = select(_288, float3(0.0), isnan(_288));
    float _115 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _292.xy, uint(rint(_292.z)), 1.0);
    float _117 = -_58;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _121 = _117 + _119;
    float _123 = -_58;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _127 = _123 + _125;
    float _129 = _121 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _127 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _139 = _131 + _115;
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _139;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _137;
    return out;
}

