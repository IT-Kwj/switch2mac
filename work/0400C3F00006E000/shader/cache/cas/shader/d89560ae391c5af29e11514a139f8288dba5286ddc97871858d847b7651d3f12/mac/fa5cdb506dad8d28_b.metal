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
    float2 _230 = float2(_44, _46);
    float _48 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_230, float2(0.0), isnan(_230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_230, float2(0.0), isnan(_230))).x;
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
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _68);
    float _76 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _70);
    float _80 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _86 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _78);
    float _88 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _82);
    float _92 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _94 = 1.0 / _88;
    float _96 = _86 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _104 = _96 * _94;
    float _106 = _98 * _94;
    float _108 = _100 * _94;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = _110 * _102;
    float _116 = _110 * _112;
    float _118 = fma(_114, 1.5, _104);
    float _120 = fma(_114, 0.5, _104);
    float _122 = fma(_116, 0.5, _106);
    float _124 = fma(_116, 1.5, _106);
    float3 _391 = float3(_118, _124, float(0));
    float3 _395 = select(_391, float3(0.0), isnan(_391));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _395.xy, uint(rint(_395.z)), _110);
    float3 _402 = float3(_120, _124, float(0));
    float3 _404 = select(_402, float3(0.0), isnan(_402));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _404.xy, uint(rint(_404.z)), _110);
    float3 _411 = float3(_118, _122, float(0));
    float3 _413 = select(_411, float3(0.0), isnan(_411));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _413.xy, uint(rint(_413.z)), _110);
    float3 _420 = float3(_120, _122, float(0));
    float3 _422 = select(_420, float3(0.0), isnan(_420));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _422.xy, uint(rint(_422.z)), _110);
    float _134 = fma(_114, -0.5, _104);
    float _136 = fma(_114, -1.5, _104);
    float3 _437 = float3(_134, _124, float(0));
    float3 _439 = select(_437, float3(0.0), isnan(_437));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _439.xy, uint(rint(_439.z)), _110);
    float3 _446 = float3(_136, _124, float(0));
    float3 _448 = select(_446, float3(0.0), isnan(_446));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _448.xy, uint(rint(_448.z)), _110);
    float _142 = fma(_116, -0.5, _106);
    float3 _458 = float3(_134, _122, float(0));
    float3 _460 = select(_458, float3(0.0), isnan(_458));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _460.xy, uint(rint(_460.z)), _110);
    float3 _467 = float3(_136, _122, float(0));
    float3 _469 = select(_467, float3(0.0), isnan(_467));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _469.xy, uint(rint(_469.z)), _110);
    float3 _476 = float3(_118, _142, float(0));
    float3 _478 = select(_476, float3(0.0), isnan(_476));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _478.xy, uint(rint(_478.z)), _110);
    float3 _485 = float3(_120, _142, float(0));
    float3 _487 = select(_485, float3(0.0), isnan(_485));
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _487.xy, uint(rint(_487.z)), _110);
    float _152 = fma(_116, -1.5, _106);
    float3 _497 = float3(_134, _142, float(0));
    float3 _499 = select(_497, float3(0.0), isnan(_497));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _499.xy, uint(rint(_499.z)), _110);
    float3 _506 = float3(_136, _142, float(0));
    float3 _508 = select(_506, float3(0.0), isnan(_506));
    float _156 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _508.xy, uint(rint(_508.z)), _110);
    float3 _515 = float3(_118, _152, float(0));
    float3 _517 = select(_515, float3(0.0), isnan(_515));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _517.xy, uint(rint(_517.z)), _110);
    float3 _524 = float3(_120, _152, float(0));
    float3 _526 = select(_524, float3(0.0), isnan(_524));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _526.xy, uint(rint(_526.z)), _110);
    float3 _533 = float3(_134, _152, float(0));
    float3 _535 = select(_533, float3(0.0), isnan(_533));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _535.xy, uint(rint(_535.z)), _110);
    float3 _542 = float3(_136, _152, float(0));
    float3 _544 = select(_542, float3(0.0), isnan(_542));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _544.xy, uint(rint(_544.z)), _110);
    float _166 = _126 + _128;
    float _168 = -_62;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _172 = _168 + _170;
    float _174 = _172 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _166 + _138;
    float _180 = _178 + _140;
    float _182 = _180 + _130;
    float _184 = _182 + _132;
    float _186 = -_62;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _190 = _186 + _188;
    float _192 = _184 + _144;
    float _194 = _190 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _192 + _146;
    float _200 = _196 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _202 = _198 + _148;
    float _204 = _202 + _150;
    float _206 = _204 + _154;
    float _208 = _206 + _156;
    float _210 = _208 + _158;
    float _212 = _210 + _160;
    float _214 = _212 + _162;
    float _216 = _214 + _164;
    float _218 = fma(_216, 0.0625, _176);
    out.m_37.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_37.y = _218;
    out.m_37.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_37.w = _200;
    return out;
}

