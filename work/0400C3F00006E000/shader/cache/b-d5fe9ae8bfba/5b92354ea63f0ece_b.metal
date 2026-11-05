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
    float2 _224 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float2 _236 = float2(_48, _50);
    float2 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_236, float2(0.0), isnan(_236))).xy;
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
    float _82 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _80);
    float _86 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _86);
    float _94 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _98 = 1.0 / _90;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _92);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _104 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _106 = _100 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _110 = _104 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _112 = fma(_60, 2.0, -1.0);
    float _114 = fma(_58, 2.0, -1.0);
    float _116 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _118 = _112 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _120 = _106 * _98;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _110 * _98;
    float _126 = _116 * _98;
    float _128 = fma(_118, 2.0, _50);
    float _130 = _114 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _132 = rint(_122);
    float _134 = precise::max(_132, 0.0);
    uint _137 = uint(_134);
    uint _139 = clamp(_137, 0u, 65535u);
    float _141 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _126);
    float _143 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _124);
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _147 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _145, _124);
    float _149 = fma(_130, 2.0, _48);
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _153 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _151, _126);
    float3 _428 = float3(_124, _141, float(int(_139)));
    float3 _432 = select(_428, float3(0.0), isnan(_428));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _432.xy, uint(rint(_432.z)), 1.0);
    float3 _440 = float3(_143, _141, float(int(_139)));
    float3 _442 = select(_440, float3(0.0), isnan(_440));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _442.xy, uint(rint(_442.z)), 1.0);
    float3 _450 = float3(_147, _141, float(int(_139)));
    float3 _452 = select(_450, float3(0.0), isnan(_450));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _452.xy, uint(rint(_452.z)), 1.0);
    float3 _460 = float3(_143, _126, float(int(_139)));
    float3 _462 = select(_460, float3(0.0), isnan(_460));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _462.xy, uint(rint(_462.z)), 1.0);
    float3 _470 = float3(_124, _126, float(int(_139)));
    float3 _472 = select(_470, float3(0.0), isnan(_470));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _472.xy, uint(rint(_472.z)), 1.0);
    float3 _480 = float3(_147, _126, float(int(_139)));
    float3 _482 = select(_480, float3(0.0), isnan(_480));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _482.xy, uint(rint(_482.z)), 1.0);
    float3 _490 = float3(_143, _153, float(int(_139)));
    float3 _492 = select(_490, float3(0.0), isnan(_490));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _492.xy, uint(rint(_492.z)), 1.0);
    float3 _500 = float3(_124, _153, float(int(_139)));
    float3 _502 = select(_500, float3(0.0), isnan(_500));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _502.xy, uint(rint(_502.z)), 1.0);
    float3 _510 = float3(_147, _153, float(int(_139)));
    float3 _512 = select(_510, float3(0.0), isnan(_510));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _512.xy, uint(rint(_512.z)), 1.0);
    float2 _517 = float2(_149, _128);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_517, float2(0.0), isnan(_517))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_517, float2(0.0), isnan(_517))).x;
    float _175 = -_74;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _179 = _175 + _177;
    float _181 = -_74;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _185 = _181 + _183;
    float _187 = _179 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _185 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _193 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _197 = _157 + _155;
    float _199 = _197 + _159;
    float _201 = _199 + _161;
    float _203 = _201 + _163;
    float _205 = _203 + _165;
    float _207 = _205 + _167;
    float _209 = _207 + _169;
    float _211 = _209 + _171;
    float _213 = fma(_211, 0.111111111938953399658203125, _189);
    out.m_41.x = _173;
    out.m_41.y = _213;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _195;
    return out;
}

