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
    float2 _179 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_179, float2(0.0), isnan(_179))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_179, float2(0.0), isnan(_179))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _58 = 1.0 / _56;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _58 * _60;
    float _64 = _62 * _50;
    float _66 = _62 * _52;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _82 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _74);
    float _84 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = _82 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _92 = 1.0 / _84;
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _96 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _90);
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _104 = _86 * _92;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _98 * _92;
    float _110 = _100 * _92;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = rint(_106);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = fma(_102, 0.5, _108);
    float _125 = fma(_102, -0.5, _108);
    float _127 = fma(_112, 0.5, _110);
    float _129 = fma(_112, -0.5, _110);
    float3 _346 = float3(_123, _127, float(int(_121)));
    float3 _350 = select(_346, float3(0.0), isnan(_346));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _350.xy, uint(rint(_350.z)), 1.0);
    float3 _358 = float3(_125, _127, float(int(_121)));
    float3 _360 = select(_358, float3(0.0), isnan(_358));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _360.xy, uint(rint(_360.z)), 1.0);
    float3 _368 = float3(_123, _129, float(int(_121)));
    float3 _370 = select(_368, float3(0.0), isnan(_368));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _370.xy, uint(rint(_370.z)), 1.0);
    float3 _378 = float3(_125, _129, float(int(_121)));
    float3 _380 = select(_378, float3(0.0), isnan(_378));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _380.xy, uint(rint(_380.z)), 1.0);
    float _139 = _131 + _133;
    float _141 = -_62;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _145 = _141 + _143;
    float _147 = _139 + _135;
    float _149 = -_62;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _153 = _149 + _151;
    float _155 = _145 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _147 + _137;
    float _161 = _153 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_159, 0.25, _157);
    float _167 = _163 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _165;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _167;
    return out;
}

