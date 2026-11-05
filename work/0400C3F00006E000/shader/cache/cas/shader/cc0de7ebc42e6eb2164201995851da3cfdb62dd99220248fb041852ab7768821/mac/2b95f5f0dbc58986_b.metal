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
    float2 _245 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_245, float2(0.0), isnan(_245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_245, float2(0.0), isnan(_245))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = _62 * _56;
    float _68 = _64 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _70 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _74 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _68);
    float _78 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _80 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _72);
    float _84 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _76);
    float _86 = _64 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _88 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _90 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _86);
    float _98 = _88 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _100 = 1.0 / _92;
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _104 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _94);
    float _106 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _82);
    float _108 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _96);
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _112 = _106 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _114 = 1.0 / _98;
    float _116 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _110);
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _120 = _112 * _100;
    float _122 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _102);
    float _124 = _104 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = _108 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _128 = _122 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _130 = _126 * _100;
    float _132 = _124 * _114;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _128 * _114;
    float _138 = _118 * _114;
    float _140 = _134 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float2 _437 = float2(_120, _130);
    float2 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_437, float2(0.0), isnan(_437))).xy;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _140 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _152 = _140 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _154 = fma(_150, 0.5, _136);
    float _156 = fma(_150, -0.5, _136);
    float _158 = fma(_152, 0.5, _138);
    float _160 = fma(_152, -0.5, _138);
    float3 _474 = float3(_154, _158, float(0));
    float3 _478 = select(_474, float3(0.0), isnan(_474));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _478.xy, uint(rint(_478.z)), _134);
    float3 _485 = float3(_156, _158, float(0));
    float3 _487 = select(_485, float3(0.0), isnan(_485));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _487.xy, uint(rint(_487.z)), _134);
    float3 _494 = float3(_154, _160, float(0));
    float3 _496 = select(_494, float3(0.0), isnan(_494));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _496.xy, uint(rint(_496.z)), _134);
    float3 _503 = float3(_156, _160, float(0));
    float3 _505 = select(_503, float3(0.0), isnan(_503));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _505.xy, uint(rint(_505.z)), _134);
    float2 _511 = float2(_48, _50);
    float _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_511, float2(0.0), isnan(_511))).x;
    float _172 = _64 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _172);
    float _176 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _174);
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _180 = precise::min(_178, 1.0);
    float _182 = -_62;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _186 = _182 + _184;
    float _188 = -_62;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _192 = _188 + _190;
    float _194 = _186 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -_146;
    float _204 = fma(_202, _146, _148);
    float _206 = -_146;
    float _208 = _180 + _206;
    float _210 = fma(_208, _208, _204);
    bool _214 = _208 <= 0.001000000047497451305389404296875;
    float _216 = float(_214);
    float _218 = 1.0 / _210;
    float _220 = _162 + _164;
    float _222 = _204 * _218;
    float _224 = _220 + _166;
    float _226 = precise::max(_222, _216);
    float _228 = _224 + _168;
    float _230 = precise::min(_226, 1.0);
    float _232 = fma(_228, 0.25, _196);
    float _234 = _200 + _230;
    out.m_41.x = _170;
    out.m_41.y = _232;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _234;
    return out;
}

