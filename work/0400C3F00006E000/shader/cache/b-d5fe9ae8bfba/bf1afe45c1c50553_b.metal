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
    float2 _199 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_199, float2(0.0), isnan(_199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_199, float2(0.0), isnan(_199))).x;
    float _50 = in.m_34.y;
    float _52 = in.m_34.x;
    float _54 = -_48;
    float _56 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _58 = 1.0 / _56;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _58 * _60;
    float _64 = _62 * _50;
    float _66 = _62 * _52;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _72 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _70);
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _82 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _74);
    float _84 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = _82 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _92 = 1.0 / _84;
    float _94 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _96 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _90);
    float _98 = _94 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = _96 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = _86 * _92;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _98 * _92;
    float _108 = _100 * _92;
    float _110 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _106);
    float _112 = rint(_104);
    float _114 = precise::max(_112, 0.0);
    uint _117 = uint(_114);
    uint _119 = clamp(_117, 0u, 65535u);
    float _121 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _108);
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _125 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _123, _106);
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _129 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _127, _108);
    float3 _370 = float3(_106, _121, float(int(_119)));
    float3 _374 = select(_370, float3(0.0), isnan(_370));
    float _131 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _374.xy, uint(rint(_374.z)), 1.0);
    float3 _382 = float3(_110, _121, float(int(_119)));
    float3 _384 = select(_382, float3(0.0), isnan(_382));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _384.xy, uint(rint(_384.z)), 1.0);
    float3 _392 = float3(_125, _121, float(int(_119)));
    float3 _394 = select(_392, float3(0.0), isnan(_392));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _394.xy, uint(rint(_394.z)), 1.0);
    float3 _402 = float3(_110, _108, float(int(_119)));
    float3 _404 = select(_402, float3(0.0), isnan(_402));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _404.xy, uint(rint(_404.z)), 1.0);
    float3 _412 = float3(_106, _108, float(int(_119)));
    float3 _414 = select(_412, float3(0.0), isnan(_412));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _414.xy, uint(rint(_414.z)), 1.0);
    float3 _422 = float3(_125, _108, float(int(_119)));
    float3 _424 = select(_422, float3(0.0), isnan(_422));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _424.xy, uint(rint(_424.z)), 1.0);
    float3 _432 = float3(_110, _129, float(int(_119)));
    float3 _434 = select(_432, float3(0.0), isnan(_432));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _434.xy, uint(rint(_434.z)), 1.0);
    float3 _442 = float3(_106, _129, float(int(_119)));
    float3 _444 = select(_442, float3(0.0), isnan(_442));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _444.xy, uint(rint(_444.z)), 1.0);
    float3 _452 = float3(_125, _129, float(int(_119)));
    float3 _454 = select(_452, float3(0.0), isnan(_452));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _454.xy, uint(rint(_454.z)), 1.0);
    float _149 = -_62;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _153 = _149 + _151;
    float _155 = _153 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _161 = _133 + _131;
    float _163 = _161 + _135;
    float _165 = _163 + _137;
    float _167 = _165 + _139;
    float _169 = _167 + _141;
    float _171 = _169 + _143;
    float _173 = -_62;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _177 = _173 + _175;
    float _179 = _171 + _145;
    float _181 = _177 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _179 + _147;
    float _187 = fma(_185, 0.111111111938953399658203125, _183);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _187;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _159;
    return out;
}

