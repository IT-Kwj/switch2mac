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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _243 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_243, float2(0.0), isnan(_243))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_243, float2(0.0), isnan(_243))).x;
    float2 _254 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_254, float2(0.0), isnan(_254))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _72 = 1.0 / _70;
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _76 = _72 * _74;
    float _78 = _76 * _64;
    float _80 = _76 * _66;
    float _82 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _86 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _88 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].x, _82);
    float _90 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].x, _86);
    float _94 = fma(_60, 2.0, -1.0);
    float _96 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].z, _88);
    float _98 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _100 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].z, _92);
    float _102 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _106 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].x, _84);
    float _108 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _98);
    float _110 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _102);
    float _112 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _114 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].z, _106);
    float _116 = 1.0 / _104;
    float _118 = _108 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _120 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _112);
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _124 = _100 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _126 = fma(_62, 2.0, -1.0);
    float _128 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _120);
    float _130 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _110);
    float _132 = 1.0 / _118;
    float _134 = _126 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _136 = _128 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _140 = fma(_134, 2.0, _52);
    float _142 = _122 * _116;
    float _144 = _124 * _116;
    float _146 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _148 = _94 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _150 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _146);
    float _152 = _136 * _132;
    float _154 = _138 * _132;
    float _156 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _150);
    float _158 = fma(_148, 2.0, _50);
    float _160 = _156 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _462 = float2(_142, _144);
    float2 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_462, float2(0.0), isnan(_462))).xy;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _160 * _132;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float3 _481 = float3(_154, _152, float(0));
    float3 _485 = select(_481, float3(0.0), isnan(_481));
    float _172 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _485.xy, uint(rint(_485.z)), _170);
    float2 _491 = float2(_158, _140);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491))).x;
    float _176 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _178 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].x, _176);
    float _180 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].z, _178);
    float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _184 = precise::min(_182, 1.0);
    float _186 = -_76;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _190 = _186 + _188;
    float _192 = -_76;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _196 = _192 + _194;
    float _198 = _190 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _196 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = -_164;
    float _208 = fma(_206, _164, _166);
    float _210 = -_164;
    float _212 = _184 + _210;
    float _214 = fma(_212, _212, _208);
    bool _218 = _212 <= 0.001000000047497451305389404296875;
    float _220 = float(_218);
    float _222 = _200 + _172;
    float _224 = 1.0 / _214;
    float _226 = _208 * _224;
    float _228 = precise::max(_226, _220);
    float _230 = precise::min(_228, 1.0);
    float _232 = _204 + _230;
    out.m_43.x = _174;
    out.m_43.y = _222;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _232;
    return out;
}

