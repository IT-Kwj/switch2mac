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
    float2 _204 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_204, float2(0.0), isnan(_204))).x;
    float2 _216 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_216, float2(0.0), isnan(_216))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_216, float2(0.0), isnan(_216))).xy;
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
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _86 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _88 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _92 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _88);
    float _94 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _96 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _98 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _100 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _84);
    float _102 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _104 = 1.0 / _96;
    float _106 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _98);
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _100);
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _112 = _106 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _114 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _116 = _112 * _104;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _110 * _104;
    float _122 = _114 * _104;
    float _124 = rint(_118);
    float _126 = precise::max(_124, 0.0);
    uint _129 = uint(_126);
    uint _131 = clamp(_129, 0u, 65535u);
    float _133 = fma(_58, 2.0, -1.0);
    float _135 = fma(_60, 2.0, -1.0);
    float _137 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _139 = fma(_94, 0.5, _120);
    float _141 = fma(_94, -0.5, _120);
    float _143 = _133 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _145 = _135 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _147 = fma(_137, 0.5, _122);
    float _149 = fma(_137, -0.5, _122);
    float _151 = fma(_143, 2.0, _48);
    float _153 = fma(_145, 2.0, _50);
    float3 _404 = float3(_139, _147, float(int(_131)));
    float3 _408 = select(_404, float3(0.0), isnan(_404));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _408.xy, uint(rint(_408.z)), 1.0);
    float3 _416 = float3(_141, _147, float(int(_131)));
    float3 _418 = select(_416, float3(0.0), isnan(_416));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _418.xy, uint(rint(_418.z)), 1.0);
    float3 _426 = float3(_139, _149, float(int(_131)));
    float3 _428 = select(_426, float3(0.0), isnan(_426));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _428.xy, uint(rint(_428.z)), 1.0);
    float3 _436 = float3(_141, _149, float(int(_131)));
    float3 _438 = select(_436, float3(0.0), isnan(_436));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _438.xy, uint(rint(_438.z)), 1.0);
    float2 _443 = float2(_151, _153);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_443, float2(0.0), isnan(_443))).x;
    float _165 = _155 + _157;
    float _167 = _165 + _159;
    float _169 = -_74;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _173 = _169 + _171;
    float _175 = -_74;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _179 = _175 + _177;
    float _181 = _167 + _161;
    float _183 = _173 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _179 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = fma(_181, 0.25, _185);
    float _193 = _189 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_41.x = _163;
    out.m_41.y = _191;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _193;
    return out;
}

