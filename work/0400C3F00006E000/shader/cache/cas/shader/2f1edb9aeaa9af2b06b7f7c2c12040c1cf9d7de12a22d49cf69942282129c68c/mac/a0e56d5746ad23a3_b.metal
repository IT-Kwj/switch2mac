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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
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
    float2 _219 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _68);
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _80 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _70);
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _76);
    float _86 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _78);
    float _88 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _80);
    float _90 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _94 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _86);
    float _98 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _82);
    float _100 = 1.0 / _92;
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _104 = _88 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _106 = _96 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _110 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _112 = _98 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _114 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _108);
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _72);
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _120 = 1.0 / _106;
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _124 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _116);
    float _126 = _104 * _100;
    float _128 = _124 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _130 = _128 * _100;
    float2 _395 = float2(_126, _130);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_395, float2(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_395, float2(0.0), isnan(_395))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _122 * _120;
    float _142 = _118 * _120;
    float _144 = _112 * _120;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float3 _420 = float3(_140, _142, float(0));
    float3 _424 = select(_420, float3(0.0), isnan(_420));
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _424.xy, uint(rint(_424.z)), _146);
    float2 _430 = float2(_48, _50);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float _152 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _154 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _152);
    float _156 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _154);
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _160 = precise::min(_158, 1.0);
    float _162 = -_62;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _166 = _162 + _164;
    float _168 = -_62;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _172 = _168 + _170;
    float _174 = _166 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = -_136;
    float _184 = fma(_182, _136, _138);
    float _186 = -_136;
    float _188 = _160 + _186;
    float _190 = fma(_188, _188, _184);
    bool _194 = _188 <= 0.001000000047497451305389404296875;
    float _196 = float(_194);
    float _198 = _176 + _148;
    float _200 = 1.0 / _190;
    float _202 = _184 * _200;
    float _204 = precise::max(_202, _196);
    float _206 = precise::min(_204, 1.0);
    float _208 = _180 + _206;
    out.m_41.x = _150;
    out.m_41.y = _198;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _208;
    return out;
}

