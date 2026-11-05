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
    float2 _176 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176))).x;
    float2 _188 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_188, float2(0.0), isnan(_188))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_188, float2(0.0), isnan(_188))).xy;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = in.m_38.y;
    float _64 = in.m_38.x;
    float _66 = -_52;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[46].z, _68);
    float _72 = _70 * _62;
    float _74 = _70 * _64;
    float _76 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _82 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _90 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _94 = 1.0 / _86;
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _106 = _100 * _94;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _112 = fma(_58, 2.0, -1.0);
    float _114 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _116 = rint(_108);
    float _118 = precise::max(_116, 0.0);
    uint _121 = uint(_118);
    uint _123 = clamp(_121, 0u, 65535u);
    float _125 = fma(_60, 2.0, -1.0);
    float _127 = _110 * _94;
    float _129 = _112 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _131 = _114 * _94;
    float _133 = _125 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _135 = fma(_129, 2.0, _48);
    float _137 = fma(_133, 2.0, _50);
    float3 _346 = float3(_131, _127, float(int(_123)));
    float3 _350 = select(_346, float3(0.0), isnan(_346));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _350.xy, uint(rint(_350.z)), 1.0);
    float2 _355 = float2(_135, _137);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_355, float2(0.0), isnan(_355))).x;
    float _143 = -_70;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _147 = _143 + _145;
    float _149 = -_70;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _153 = _149 + _151;
    float _155 = _147 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _153 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _161 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _165 = _157 + _139;
    out.m_41.x = _141;
    out.m_41.y = _165;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _163;
    return out;
}

