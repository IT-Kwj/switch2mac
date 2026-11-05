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
    float2 _220 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_220, float2(0.0), isnan(_220))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_220, float2(0.0), isnan(_220))).x;
    float2 _232 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_232, float2(0.0), isnan(_232))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_232, float2(0.0), isnan(_232))).xy;
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
    float _92 = 1.0 / _86;
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _100 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _104 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _98);
    float _106 = fma(_60, 2.0, -1.0);
    float _108 = fma(_58, 2.0, -1.0);
    float _110 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _114 = _106 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _116 = _100 * _92;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _110 * _92;
    float _122 = _112 * _92;
    float _124 = fma(_114, 2.0, _50);
    float _126 = _108 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _128 = rint(_118);
    float _130 = precise::max(_128, 0.0);
    uint _133 = uint(_130);
    uint _135 = clamp(_133, 0u, 65535u);
    float _137 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _122);
    float _139 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _120);
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _143 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _141, _120);
    float _145 = fma(_126, 2.0, _48);
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _149 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _147, _122);
    float3 _420 = float3(_120, _137, float(int(_135)));
    float3 _424 = select(_420, float3(0.0), isnan(_420));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _424.xy, uint(rint(_424.z)), 1.0);
    float3 _432 = float3(_139, _137, float(int(_135)));
    float3 _434 = select(_432, float3(0.0), isnan(_432));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _434.xy, uint(rint(_434.z)), 1.0);
    float3 _442 = float3(_143, _137, float(int(_135)));
    float3 _444 = select(_442, float3(0.0), isnan(_442));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _444.xy, uint(rint(_444.z)), 1.0);
    float3 _452 = float3(_139, _122, float(int(_135)));
    float3 _454 = select(_452, float3(0.0), isnan(_452));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _454.xy, uint(rint(_454.z)), 1.0);
    float3 _462 = float3(_120, _122, float(int(_135)));
    float3 _464 = select(_462, float3(0.0), isnan(_462));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _464.xy, uint(rint(_464.z)), 1.0);
    float3 _472 = float3(_143, _122, float(int(_135)));
    float3 _474 = select(_472, float3(0.0), isnan(_472));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _474.xy, uint(rint(_474.z)), 1.0);
    float3 _482 = float3(_139, _149, float(int(_135)));
    float3 _484 = select(_482, float3(0.0), isnan(_482));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _484.xy, uint(rint(_484.z)), 1.0);
    float3 _492 = float3(_120, _149, float(int(_135)));
    float3 _494 = select(_492, float3(0.0), isnan(_492));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _494.xy, uint(rint(_494.z)), 1.0);
    float3 _502 = float3(_143, _149, float(int(_135)));
    float3 _504 = select(_502, float3(0.0), isnan(_502));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _504.xy, uint(rint(_504.z)), 1.0);
    float2 _509 = float2(_145, _124);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_509, float2(0.0), isnan(_509))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_509, float2(0.0), isnan(_509))).x;
    float _171 = -_70;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _175 = _171 + _173;
    float _177 = -_70;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _181 = _177 + _179;
    float _183 = _175 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _181 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _189 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _193 = _153 + _151;
    float _195 = _193 + _155;
    float _197 = _195 + _157;
    float _199 = _197 + _159;
    float _201 = _199 + _161;
    float _203 = _201 + _163;
    float _205 = _203 + _165;
    float _207 = _205 + _167;
    float _209 = fma(_207, 0.111111111938953399658203125, _185);
    out.m_41.x = _169;
    out.m_41.y = _209;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _191;
    return out;
}

