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
    float2 _200 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_200, float2(0.0), isnan(_200))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_200, float2(0.0), isnan(_200))).x;
    float2 _212 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_212, float2(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_212, float2(0.0), isnan(_212))).xy;
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
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _82 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _90 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = 1.0 / _86;
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _90);
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _106 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _110 = _106 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _112 = _102 * _96;
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _108 * _96;
    float _118 = _110 * _96;
    float _120 = rint(_114);
    float _122 = precise::max(_120, 0.0);
    uint _125 = uint(_122);
    uint _127 = clamp(_125, 0u, 65535u);
    float _129 = fma(_58, 2.0, -1.0);
    float _131 = fma(_60, 2.0, -1.0);
    float _133 = fma(_104, 0.5, _116);
    float _135 = fma(_104, -0.5, _116);
    float _137 = _129 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _139 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _141 = _131 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _143 = fma(_137, 2.0, _48);
    float _145 = fma(_139, 0.5, _118);
    float _147 = fma(_141, 2.0, _50);
    float _149 = fma(_139, -0.5, _118);
    float3 _396 = float3(_133, _145, float(int(_127)));
    float3 _400 = select(_396, float3(0.0), isnan(_396));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _400.xy, uint(rint(_400.z)), 1.0);
    float3 _408 = float3(_135, _145, float(int(_127)));
    float3 _410 = select(_408, float3(0.0), isnan(_408));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _410.xy, uint(rint(_410.z)), 1.0);
    float3 _418 = float3(_133, _149, float(int(_127)));
    float3 _420 = select(_418, float3(0.0), isnan(_418));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _420.xy, uint(rint(_420.z)), 1.0);
    float3 _428 = float3(_135, _149, float(int(_127)));
    float3 _430 = select(_428, float3(0.0), isnan(_428));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _430.xy, uint(rint(_430.z)), 1.0);
    float2 _435 = float2(_143, _147);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_435, float2(0.0), isnan(_435))).x;
    float _161 = _151 + _153;
    float _163 = _161 + _155;
    float _165 = -_70;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _169 = _165 + _167;
    float _171 = -_70;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _175 = _171 + _173;
    float _177 = _163 + _157;
    float _179 = _169 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _175 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma(_177, 0.25, _181);
    float _189 = _185 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_41.x = _159;
    out.m_41.y = _187;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _189;
    return out;
}

