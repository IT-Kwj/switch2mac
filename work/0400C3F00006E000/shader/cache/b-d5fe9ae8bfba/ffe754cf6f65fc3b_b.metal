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
    float2 _249 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_249, float2(0.0), isnan(_249))).x;
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
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _78 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _84 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _76);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _90 = _68 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _82);
    float _94 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _98 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _84);
    float _100 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _90);
    float _102 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _94);
    float _104 = _92 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _106 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _98);
    float _108 = 1.0 / _96;
    float _110 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _86);
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _100);
    float _114 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _102);
    float _116 = _106 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _118 = _110 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _122 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _124 = 1.0 / _104;
    float _126 = _114 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
    float _130 = _128 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _132 = _118 * _108;
    float _134 = _120 * _108;
    float2 _429 = float2(_132, _134);
    float2 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_429, float2(0.0), isnan(_429))).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _116 * _124;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = _126 * _124;
    float _150 = _130 * _124;
    float _152 = _146 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _154 = _152 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _156 = _152 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _158 = fma(_154, 0.5, _148);
    float _160 = fma(_154, -0.5, _148);
    float _162 = fma(_156, 0.5, _150);
    float _164 = fma(_156, -0.5, _150);
    float3 _482 = float3(_158, _162, float(0));
    float3 _486 = select(_482, float3(0.0), isnan(_482));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _486.xy, uint(rint(_486.z)), _146);
    float3 _493 = float3(_160, _162, float(0));
    float3 _495 = select(_493, float3(0.0), isnan(_493));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _495.xy, uint(rint(_495.z)), _146);
    float3 _502 = float3(_158, _164, float(0));
    float3 _504 = select(_502, float3(0.0), isnan(_502));
    float _170 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _504.xy, uint(rint(_504.z)), _146);
    float3 _511 = float3(_160, _164, float(0));
    float3 _513 = select(_511, float3(0.0), isnan(_511));
    float _172 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _513.xy, uint(rint(_513.z)), _146);
    float2 _519 = float2(_48, _50);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float _176 = _68 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _176);
    float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _178);
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _184 = precise::min(_182, 1.0);
    float _186 = -_66;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _190 = _186 + _188;
    float _192 = -_66;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _196 = _192 + _194;
    float _198 = _190 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = -_140;
    float _208 = fma(_206, _140, _142);
    float _210 = -_140;
    float _212 = _184 + _210;
    float _214 = fma(_212, _212, _208);
    bool _218 = _212 <= 0.001000000047497451305389404296875;
    float _220 = float(_218);
    float _222 = 1.0 / _214;
    float _224 = _166 + _168;
    float _226 = _208 * _222;
    float _228 = _224 + _170;
    float _230 = precise::max(_226, _220);
    float _232 = _228 + _172;
    float _234 = precise::min(_230, 1.0);
    float _236 = fma(_232, 0.25, _200);
    float _238 = _204 + _234;
    out.m_41.x = _174;
    out.m_41.y = _236;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _238;
    return out;
}

