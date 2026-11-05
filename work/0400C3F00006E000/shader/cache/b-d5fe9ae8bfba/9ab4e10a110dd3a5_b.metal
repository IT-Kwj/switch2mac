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
    float2 _175 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_175, float2(0.0), isnan(_175))).x;
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
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _88 = 1.0 / _80;
    float _90 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _92 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].z, _86);
    float _94 = _90 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _96 = _92 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _100 = _82 * _88;
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _94 * _88;
    float _106 = _96 * _88;
    float _108 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _110 = rint(_102);
    float _112 = precise::max(_110, 0.0);
    uint _115 = uint(_112);
    uint _117 = clamp(_115, 0u, 65535u);
    float _119 = fma(_98, 0.5, _104);
    float _121 = fma(_98, -0.5, _104);
    float _123 = fma(_108, 0.5, _106);
    float _125 = fma(_108, -0.5, _106);
    float3 _338 = float3(_119, _123, float(int(_117)));
    float3 _342 = select(_338, float3(0.0), isnan(_338));
    float _127 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _342.xy, uint(rint(_342.z)), 1.0);
    float3 _350 = float3(_121, _123, float(int(_117)));
    float3 _352 = select(_350, float3(0.0), isnan(_350));
    float _129 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _352.xy, uint(rint(_352.z)), 1.0);
    float3 _360 = float3(_119, _125, float(int(_117)));
    float3 _362 = select(_360, float3(0.0), isnan(_360));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _362.xy, uint(rint(_362.z)), 1.0);
    float3 _370 = float3(_121, _125, float(int(_117)));
    float3 _372 = select(_370, float3(0.0), isnan(_370));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _372.xy, uint(rint(_372.z)), 1.0);
    float _135 = _127 + _129;
    float _137 = -_58;
    float _139 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _141 = _137 + _139;
    float _143 = _135 + _131;
    float _145 = -_58;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _149 = _145 + _147;
    float _151 = _141 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _143 + _133;
    float _157 = _149 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = fma(_155, 0.25, _153);
    float _163 = _159 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _161;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _163;
    return out;
}

