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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _260 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _86 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _74);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _92 = 1.0 / _82;
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _86);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _94);
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = _98 * _92;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _102 * _92;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = _104 * _92;
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _118 = rint(_108);
    float _120 = precise::max(_118, 0.0);
    uint _123 = uint(_120);
    uint _125 = clamp(_123, 0u, 65535u);
    float _127 = fma(_112, 1.5, _114);
    float _129 = fma(_116, 1.5, _110);
    float _131 = fma(_116, 0.5, _110);
    float3 _424 = float3(_129, _127, float(int(_125)));
    float3 _428 = select(_424, float3(0.0), isnan(_424));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _428.xy, uint(rint(_428.z)), 1.0);
    float3 _436 = float3(_131, _127, float(int(_125)));
    float3 _438 = select(_436, float3(0.0), isnan(_436));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _438.xy, uint(rint(_438.z)), 1.0);
    float2 _443 = float2(_48, _50);
    float2 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_443, float2(0.0), isnan(_443))).xy;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = fma(_116, -0.5, _110);
    float _147 = fma(_116, -1.5, _110);
    float _149 = fma(_112, 0.5, _114);
    float _151 = fma(_112, -0.5, _114);
    float _153 = fma(_112, -1.5, _114);
    float _155 = fma(_141, 2.0, -1.0);
    float _157 = fma(_143, 2.0, -1.0);
    float _159 = _133 + _135;
    float _161 = _155 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _493 = float3(_145, _127, float(int(_125)));
    float3 _495 = select(_493, float3(0.0), isnan(_493));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _495.xy, uint(rint(_495.z)), 1.0);
    float3 _503 = float3(_147, _127, float(int(_125)));
    float3 _505 = select(_503, float3(0.0), isnan(_503));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _505.xy, uint(rint(_505.z)), 1.0);
    float3 _513 = float3(_129, _149, float(int(_125)));
    float3 _515 = select(_513, float3(0.0), isnan(_513));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _515.xy, uint(rint(_515.z)), 1.0);
    float3 _523 = float3(_131, _149, float(int(_125)));
    float3 _525 = select(_523, float3(0.0), isnan(_523));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _525.xy, uint(rint(_525.z)), 1.0);
    float3 _533 = float3(_145, _149, float(int(_125)));
    float3 _535 = select(_533, float3(0.0), isnan(_533));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _535.xy, uint(rint(_535.z)), 1.0);
    float3 _543 = float3(_147, _149, float(int(_125)));
    float3 _545 = select(_543, float3(0.0), isnan(_543));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _545.xy, uint(rint(_545.z)), 1.0);
    float3 _553 = float3(_129, _151, float(int(_125)));
    float3 _555 = select(_553, float3(0.0), isnan(_553));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _555.xy, uint(rint(_555.z)), 1.0);
    float3 _563 = float3(_131, _151, float(int(_125)));
    float3 _565 = select(_563, float3(0.0), isnan(_563));
    float _179 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _565.xy, uint(rint(_565.z)), 1.0);
    float3 _573 = float3(_145, _151, float(int(_125)));
    float3 _575 = select(_573, float3(0.0), isnan(_573));
    float _181 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _575.xy, uint(rint(_575.z)), 1.0);
    float _183 = fma(_161, 2.0, _48);
    float _185 = fma(_163, 2.0, _50);
    float3 _589 = float3(_147, _151, float(int(_125)));
    float3 _591 = select(_589, float3(0.0), isnan(_589));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _591.xy, uint(rint(_591.z)), 1.0);
    float3 _599 = float3(_129, _153, float(int(_125)));
    float3 _601 = select(_599, float3(0.0), isnan(_599));
    float _189 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _601.xy, uint(rint(_601.z)), 1.0);
    float3 _609 = float3(_131, _153, float(int(_125)));
    float3 _611 = select(_609, float3(0.0), isnan(_609));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _611.xy, uint(rint(_611.z)), 1.0);
    float3 _619 = float3(_145, _153, float(int(_125)));
    float3 _621 = select(_619, float3(0.0), isnan(_619));
    float _193 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _621.xy, uint(rint(_621.z)), 1.0);
    float3 _629 = float3(_147, _153, float(int(_125)));
    float3 _631 = select(_629, float3(0.0), isnan(_629));
    float _195 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _631.xy, uint(rint(_631.z)), 1.0);
    float2 _636 = float2(_183, _185);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float _199 = -_66;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _203 = _199 + _201;
    float _205 = -_66;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _209 = _205 + _207;
    float _211 = _203 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _209 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _217 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _221 = _159 + _165;
    float _223 = _221 + _167;
    float _225 = _223 + _169;
    float _227 = _225 + _171;
    float _229 = _227 + _173;
    float _231 = _229 + _175;
    float _233 = _231 + _177;
    float _235 = _233 + _179;
    float _237 = _235 + _181;
    float _239 = _237 + _187;
    float _241 = _239 + _189;
    float _243 = _241 + _191;
    float _245 = _243 + _193;
    float _247 = _245 + _195;
    float _249 = fma(_247, 0.0625, _213);
    out.m_41.x = _197;
    out.m_41.y = _249;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _219;
    return out;
}

