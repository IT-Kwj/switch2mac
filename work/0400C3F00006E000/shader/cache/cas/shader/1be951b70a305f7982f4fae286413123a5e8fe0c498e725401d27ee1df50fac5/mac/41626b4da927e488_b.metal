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
    float2 _223 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_223, float2(0.0), isnan(_223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_223, float2(0.0), isnan(_223))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _74);
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _90 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _82);
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _84);
    float _94 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _90);
    float _100 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _94);
    float _104 = 1.0 / _96;
    float _106 = _98 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _108 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _100);
    float _110 = _92 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _102);
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _108);
    float _118 = 1.0 / _106;
    float _120 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _76);
    float _122 = _116 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = _112 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _126 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _120);
    float _130 = _110 * _104;
    float _132 = _128 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _134 = _132 * _104;
    float _136 = _124 * _118;
    float2 _406 = float2(_130, _134);
    float2 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_406, float2(0.0), isnan(_406))).xy;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _122 * _118;
    float _148 = _126 * _118;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float3 _428 = float3(_136, _146, float(0));
    float3 _432 = select(_428, float3(0.0), isnan(_428));
    float _152 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _432.xy, uint(rint(_432.z)), _150);
    float2 _438 = float2(_48, _50);
    float _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float _156 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _158 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _156);
    float _160 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _158);
    float _162 = _160 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _164 = precise::min(_162, 1.0);
    float _166 = -_66;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _170 = _166 + _168;
    float _172 = -_66;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _176 = _172 + _174;
    float _178 = _170 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = _176 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = -_142;
    float _188 = fma(_186, _142, _144);
    float _190 = -_142;
    float _192 = _164 + _190;
    float _194 = fma(_192, _192, _188);
    bool _198 = _192 <= 0.001000000047497451305389404296875;
    float _200 = float(_198);
    float _202 = _180 + _152;
    float _204 = 1.0 / _194;
    float _206 = _188 * _204;
    float _208 = precise::max(_206, _200);
    float _210 = precise::min(_208, 1.0);
    float _212 = _184 + _210;
    out.m_41.x = _154;
    out.m_41.y = _202;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _212;
    return out;
}

