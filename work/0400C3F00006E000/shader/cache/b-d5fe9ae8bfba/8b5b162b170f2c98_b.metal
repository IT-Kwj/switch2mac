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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _239 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _84 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _90 = 1.0 / _80;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _84);
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = _96 * _90;
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = _102 * _90;
    float _112 = _104 * _90;
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _116 = fma(_98, 0.5, _110);
    float _118 = rint(_108);
    float _120 = precise::max(_118, 0.0);
    uint _123 = uint(_120);
    uint _125 = clamp(_123, 0u, 65535u);
    float _127 = fma(_114, 1.5, _112);
    float _129 = fma(_98, -0.5, _110);
    float _131 = fma(_98, 1.5, _110);
    float _133 = fma(_98, -1.5, _110);
    float _135 = fma(_114, 0.5, _112);
    float _137 = fma(_114, -0.5, _112);
    float3 _417 = float3(_116, _127, float(int(_125)));
    float3 _421 = select(_417, float3(0.0), isnan(_417));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _421.xy, uint(rint(_421.z)), 1.0);
    float3 _429 = float3(_129, _127, float(int(_125)));
    float3 _431 = select(_429, float3(0.0), isnan(_429));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _431.xy, uint(rint(_431.z)), 1.0);
    float3 _439 = float3(_131, _127, float(int(_125)));
    float3 _441 = select(_439, float3(0.0), isnan(_439));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _441.xy, uint(rint(_441.z)), 1.0);
    float3 _449 = float3(_133, _127, float(int(_125)));
    float3 _451 = select(_449, float3(0.0), isnan(_449));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _451.xy, uint(rint(_451.z)), 1.0);
    float3 _459 = float3(_131, _135, float(int(_125)));
    float3 _461 = select(_459, float3(0.0), isnan(_459));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _461.xy, uint(rint(_461.z)), 1.0);
    float3 _469 = float3(_116, _135, float(int(_125)));
    float3 _471 = select(_469, float3(0.0), isnan(_469));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _471.xy, uint(rint(_471.z)), 1.0);
    float3 _479 = float3(_129, _135, float(int(_125)));
    float3 _481 = select(_479, float3(0.0), isnan(_479));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _481.xy, uint(rint(_481.z)), 1.0);
    float3 _489 = float3(_133, _135, float(int(_125)));
    float3 _491 = select(_489, float3(0.0), isnan(_489));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _491.xy, uint(rint(_491.z)), 1.0);
    float3 _499 = float3(_131, _137, float(int(_125)));
    float3 _501 = select(_499, float3(0.0), isnan(_499));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _501.xy, uint(rint(_501.z)), 1.0);
    float3 _509 = float3(_116, _137, float(int(_125)));
    float3 _511 = select(_509, float3(0.0), isnan(_509));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _511.xy, uint(rint(_511.z)), 1.0);
    float3 _519 = float3(_129, _137, float(int(_125)));
    float3 _521 = select(_519, float3(0.0), isnan(_519));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _521.xy, uint(rint(_521.z)), 1.0);
    float _161 = fma(_114, -1.5, _112);
    float3 _532 = float3(_133, _137, float(int(_125)));
    float3 _534 = select(_532, float3(0.0), isnan(_532));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _534.xy, uint(rint(_534.z)), 1.0);
    float3 _542 = float3(_131, _161, float(int(_125)));
    float3 _544 = select(_542, float3(0.0), isnan(_542));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _544.xy, uint(rint(_544.z)), 1.0);
    float3 _552 = float3(_116, _161, float(int(_125)));
    float3 _554 = select(_552, float3(0.0), isnan(_552));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _554.xy, uint(rint(_554.z)), 1.0);
    float3 _562 = float3(_129, _161, float(int(_125)));
    float3 _564 = select(_562, float3(0.0), isnan(_562));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _564.xy, uint(rint(_564.z)), 1.0);
    float3 _572 = float3(_133, _161, float(int(_125)));
    float3 _574 = select(_572, float3(0.0), isnan(_572));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _574.xy, uint(rint(_574.z)), 1.0);
    float2 _579 = float2(_46, _48);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_579, float2(0.0), isnan(_579))).x;
    float _175 = -_64;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _179 = _175 + _177;
    float _181 = _179 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _143 + _139;
    float _187 = _185 + _141;
    float _189 = _187 + _145;
    float _191 = _189 + _147;
    float _193 = _191 + _149;
    float _195 = _193 + _151;
    float _197 = _195 + _153;
    float _199 = _197 + _155;
    float _201 = _199 + _157;
    float _203 = _201 + _159;
    float _205 = _203 + _163;
    float _207 = _205 + _165;
    float _209 = _207 + _167;
    float _211 = _209 + _169;
    float _213 = -_64;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _217 = _213 + _215;
    float _219 = _211 + _171;
    float _221 = _217 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_219, 0.0625, _183);
    float _227 = _223 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _173;
    out.m_39.y = _225;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _227;
    return out;
}

