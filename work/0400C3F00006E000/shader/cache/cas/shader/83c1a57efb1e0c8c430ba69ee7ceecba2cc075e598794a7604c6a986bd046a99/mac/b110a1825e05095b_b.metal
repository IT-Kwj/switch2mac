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
    float2 _203 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float2(0.0), isnan(_203))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float2(0.0), isnan(_203))).x;
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
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _92);
    float _100 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _102 = _98 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _96 * _90;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _102 * _90;
    float _110 = _100 * _90;
    float _112 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _108);
    float _114 = rint(_106);
    float _116 = precise::max(_114, 0.0);
    uint _119 = uint(_116);
    uint _121 = clamp(_119, 0u, 65535u);
    float _123 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _110);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _127 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _125, _110);
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _131 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _129, _108);
    float3 _374 = float3(_110, _112, float(int(_121)));
    float3 _378 = select(_374, float3(0.0), isnan(_374));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _378.xy, uint(rint(_378.z)), 1.0);
    float3 _386 = float3(_123, _112, float(int(_121)));
    float3 _388 = select(_386, float3(0.0), isnan(_386));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _388.xy, uint(rint(_388.z)), 1.0);
    float3 _396 = float3(_127, _112, float(int(_121)));
    float3 _398 = select(_396, float3(0.0), isnan(_396));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _398.xy, uint(rint(_398.z)), 1.0);
    float3 _406 = float3(_123, _108, float(int(_121)));
    float3 _408 = select(_406, float3(0.0), isnan(_406));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _408.xy, uint(rint(_408.z)), 1.0);
    float3 _416 = float3(_110, _108, float(int(_121)));
    float3 _418 = select(_416, float3(0.0), isnan(_416));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _418.xy, uint(rint(_418.z)), 1.0);
    float3 _426 = float3(_127, _108, float(int(_121)));
    float3 _428 = select(_426, float3(0.0), isnan(_426));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _428.xy, uint(rint(_428.z)), 1.0);
    float3 _436 = float3(_123, _131, float(int(_121)));
    float3 _438 = select(_436, float3(0.0), isnan(_436));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _438.xy, uint(rint(_438.z)), 1.0);
    float3 _446 = float3(_110, _131, float(int(_121)));
    float3 _448 = select(_446, float3(0.0), isnan(_446));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _448.xy, uint(rint(_448.z)), 1.0);
    float3 _456 = float3(_127, _131, float(int(_121)));
    float3 _458 = select(_456, float3(0.0), isnan(_456));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _458.xy, uint(rint(_458.z)), 1.0);
    float2 _463 = float2(_46, _48);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float _153 = -_64;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _157 = _153 + _155;
    float _159 = -_64;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _163 = _159 + _161;
    float _165 = _157 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _163 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = _171 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _175 = _135 + _133;
    float _177 = _175 + _137;
    float _179 = _177 + _139;
    float _181 = _179 + _141;
    float _183 = _181 + _143;
    float _185 = _183 + _145;
    float _187 = _185 + _147;
    float _189 = _187 + _149;
    float _191 = fma(_189, 0.111111111938953399658203125, _167);
    out.m_39.x = _151;
    out.m_39.y = _191;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _173;
    return out;
}

