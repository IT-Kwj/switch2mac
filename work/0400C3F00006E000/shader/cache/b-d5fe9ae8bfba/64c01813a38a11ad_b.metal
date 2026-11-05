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
    float2 _239 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).x;
    float2 _250 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_250, float2(0.0), isnan(_250))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_250, float2(0.0), isnan(_250))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = -_54;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[46].z, _70);
    float _74 = _72 * _64;
    float _76 = _72 * _66;
    float _78 = _74 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _80 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _84 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].x, _78);
    float _86 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].x, _80);
    float _88 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].x, _82);
    float _90 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _92 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].z, _84);
    float _94 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].z, _86);
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].z, _88);
    float _98 = fma(_60, 2.0, -1.0);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _104 = _96 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _106 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    float _108 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _110 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _112 = 1.0 / _100;
    float _114 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _106);
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].x, _108);
    float _118 = fma(_62, 2.0, -1.0);
    float _120 = _114 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _122 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].x, _110);
    float _124 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _116);
    float _126 = _118 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _128 = 1.0 / _120;
    float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
    float _132 = _124 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _134 = fma(_126, 2.0, _52);
    float _136 = _130 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _138 = _102 * _112;
    float _140 = _104 * _112;
    float _142 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _144 = _98 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _146 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].x, _142);
    float _148 = _136 * _128;
    float _150 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _146);
    float _152 = _132 * _128;
    float _154 = fma(_144, 2.0, _50);
    float _156 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _454 = float2(_138, _140);
    float2 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_454, float2(0.0), isnan(_454))).xy;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _156 * _128;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float3 _473 = float3(_152, _148, float(0));
    float3 _477 = select(_473, float3(0.0), isnan(_473));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _477.xy, uint(rint(_477.z)), _166);
    float2 _483 = float2(_154, _134);
    float _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float _172 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _174 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].x, _172);
    float _176 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].z, _174);
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _180 = precise::min(_178, 1.0);
    float _182 = -_72;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _186 = _182 + _184;
    float _188 = -_72;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _192 = _188 + _190;
    float _194 = _186 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -_160;
    float _204 = fma(_202, _160, _162);
    float _206 = -_160;
    float _208 = _180 + _206;
    float _210 = fma(_208, _208, _204);
    bool _214 = _208 <= 0.001000000047497451305389404296875;
    float _216 = float(_214);
    float _218 = _196 + _168;
    float _220 = 1.0 / _210;
    float _222 = _204 * _220;
    float _224 = precise::max(_222, _216);
    float _226 = precise::min(_224, 1.0);
    float _228 = _200 + _226;
    out.m_43.x = _170;
    out.m_43.y = _218;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _228;
    return out;
}

