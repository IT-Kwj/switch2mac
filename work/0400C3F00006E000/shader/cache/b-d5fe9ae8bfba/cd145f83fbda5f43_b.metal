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
    float2 _195 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_195, float2(0.0), isnan(_195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_195, float2(0.0), isnan(_195))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _58 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].z, _56);
    float _60 = _58 * _50;
    float _62 = _58 * _52;
    float _64 = _60 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _66 = _60 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _68 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].x, _64);
    float _70 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].x, _66);
    float _72 = _60 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = _60 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[3].z, _68);
    float _78 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[2].z, _70);
    float _80 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _82 = _78 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _88 = 1.0 / _80;
    float _90 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[0].z, _84);
    float _92 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[1].z, _86);
    float _94 = _90 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _96 = _92 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _98 = _82 * _88;
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = _94 * _88;
    float _104 = _96 * _88;
    float _106 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _102);
    float _108 = rint(_100);
    float _110 = precise::max(_108, 0.0);
    uint _113 = uint(_110);
    uint _115 = clamp(_113, 0u, 65535u);
    float _117 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _104);
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _121 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _119, _102);
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _125 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _123, _104);
    float3 _362 = float3(_102, _117, float(int(_115)));
    float3 _366 = select(_362, float3(0.0), isnan(_362));
    float _127 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _366.xy, uint(rint(_366.z)), 1.0);
    float3 _374 = float3(_106, _117, float(int(_115)));
    float3 _376 = select(_374, float3(0.0), isnan(_374));
    float _129 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _376.xy, uint(rint(_376.z)), 1.0);
    float3 _384 = float3(_121, _117, float(int(_115)));
    float3 _386 = select(_384, float3(0.0), isnan(_384));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _386.xy, uint(rint(_386.z)), 1.0);
    float3 _394 = float3(_106, _104, float(int(_115)));
    float3 _396 = select(_394, float3(0.0), isnan(_394));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _396.xy, uint(rint(_396.z)), 1.0);
    float3 _404 = float3(_102, _104, float(int(_115)));
    float3 _406 = select(_404, float3(0.0), isnan(_404));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _406.xy, uint(rint(_406.z)), 1.0);
    float3 _414 = float3(_121, _104, float(int(_115)));
    float3 _416 = select(_414, float3(0.0), isnan(_414));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _416.xy, uint(rint(_416.z)), 1.0);
    float3 _424 = float3(_106, _125, float(int(_115)));
    float3 _426 = select(_424, float3(0.0), isnan(_424));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _426.xy, uint(rint(_426.z)), 1.0);
    float3 _434 = float3(_102, _125, float(int(_115)));
    float3 _436 = select(_434, float3(0.0), isnan(_434));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _436.xy, uint(rint(_436.z)), 1.0);
    float3 _444 = float3(_121, _125, float(int(_115)));
    float3 _446 = select(_444, float3(0.0), isnan(_444));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _446.xy, uint(rint(_446.z)), 1.0);
    float _145 = -_58;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _149 = _145 + _147;
    float _151 = _149 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _157 = _129 + _127;
    float _159 = _157 + _131;
    float _161 = _159 + _133;
    float _163 = _161 + _135;
    float _165 = _163 + _137;
    float _167 = _165 + _139;
    float _169 = -_58;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _173 = _169 + _171;
    float _175 = _167 + _141;
    float _177 = _173 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _175 + _143;
    float _183 = fma(_181, 0.111111111938953399658203125, _179);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _183;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _155;
    return out;
}

