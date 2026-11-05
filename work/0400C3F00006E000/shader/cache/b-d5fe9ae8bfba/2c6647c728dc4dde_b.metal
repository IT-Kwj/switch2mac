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
    float2 _235 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_235, float2(0.0), isnan(_235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_235, float2(0.0), isnan(_235))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _66);
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _70);
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _80 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _78);
    float _84 = 1.0 / _76;
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _80);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _68);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _94 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _96 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = _90 * _84;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _98 * _84;
    float _108 = _100 * _84;
    float _110 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _112 = fma(_92, 0.5, _106);
    float _114 = rint(_104);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = fma(_110, 1.5, _108);
    float _125 = fma(_92, -0.5, _106);
    float _127 = fma(_92, 1.5, _106);
    float _129 = fma(_92, -1.5, _106);
    float _131 = fma(_110, 0.5, _108);
    float _133 = fma(_110, -0.5, _108);
    float3 _409 = float3(_112, _123, float(int(_121)));
    float3 _413 = select(_409, float3(0.0), isnan(_409));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _413.xy, uint(rint(_413.z)), 1.0);
    float3 _421 = float3(_125, _123, float(int(_121)));
    float3 _423 = select(_421, float3(0.0), isnan(_421));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _423.xy, uint(rint(_423.z)), 1.0);
    float3 _431 = float3(_127, _123, float(int(_121)));
    float3 _433 = select(_431, float3(0.0), isnan(_431));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _433.xy, uint(rint(_433.z)), 1.0);
    float3 _441 = float3(_129, _123, float(int(_121)));
    float3 _443 = select(_441, float3(0.0), isnan(_441));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _443.xy, uint(rint(_443.z)), 1.0);
    float3 _451 = float3(_127, _131, float(int(_121)));
    float3 _453 = select(_451, float3(0.0), isnan(_451));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _453.xy, uint(rint(_453.z)), 1.0);
    float3 _461 = float3(_112, _131, float(int(_121)));
    float3 _463 = select(_461, float3(0.0), isnan(_461));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _463.xy, uint(rint(_463.z)), 1.0);
    float3 _471 = float3(_125, _131, float(int(_121)));
    float3 _473 = select(_471, float3(0.0), isnan(_471));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _473.xy, uint(rint(_473.z)), 1.0);
    float3 _481 = float3(_129, _131, float(int(_121)));
    float3 _483 = select(_481, float3(0.0), isnan(_481));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _483.xy, uint(rint(_483.z)), 1.0);
    float3 _491 = float3(_127, _133, float(int(_121)));
    float3 _493 = select(_491, float3(0.0), isnan(_491));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _493.xy, uint(rint(_493.z)), 1.0);
    float3 _501 = float3(_112, _133, float(int(_121)));
    float3 _503 = select(_501, float3(0.0), isnan(_501));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _503.xy, uint(rint(_503.z)), 1.0);
    float3 _511 = float3(_125, _133, float(int(_121)));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _513.xy, uint(rint(_513.z)), 1.0);
    float _157 = fma(_110, -1.5, _108);
    float3 _524 = float3(_129, _133, float(int(_121)));
    float3 _526 = select(_524, float3(0.0), isnan(_524));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _526.xy, uint(rint(_526.z)), 1.0);
    float3 _534 = float3(_127, _157, float(int(_121)));
    float3 _536 = select(_534, float3(0.0), isnan(_534));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _536.xy, uint(rint(_536.z)), 1.0);
    float3 _544 = float3(_112, _157, float(int(_121)));
    float3 _546 = select(_544, float3(0.0), isnan(_544));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _546.xy, uint(rint(_546.z)), 1.0);
    float3 _554 = float3(_125, _157, float(int(_121)));
    float3 _556 = select(_554, float3(0.0), isnan(_554));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _556.xy, uint(rint(_556.z)), 1.0);
    float3 _564 = float3(_129, _157, float(int(_121)));
    float3 _566 = select(_564, float3(0.0), isnan(_564));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _566.xy, uint(rint(_566.z)), 1.0);
    float2 _571 = float2(_46, _48);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_571, float2(0.0), isnan(_571))).x;
    float _171 = -_60;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _175 = _171 + _173;
    float _177 = _175 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _139 + _135;
    float _183 = _181 + _137;
    float _185 = _183 + _141;
    float _187 = _185 + _143;
    float _189 = _187 + _145;
    float _191 = _189 + _147;
    float _193 = _191 + _149;
    float _195 = _193 + _151;
    float _197 = _195 + _153;
    float _199 = _197 + _155;
    float _201 = _199 + _159;
    float _203 = _201 + _161;
    float _205 = _203 + _163;
    float _207 = _205 + _165;
    float _209 = -_60;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _213 = _209 + _211;
    float _215 = _207 + _167;
    float _217 = _213 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_215, 0.0625, _179);
    float _223 = _219 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    out.m_39.x = _169;
    out.m_39.y = _221;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _223;
    return out;
}

