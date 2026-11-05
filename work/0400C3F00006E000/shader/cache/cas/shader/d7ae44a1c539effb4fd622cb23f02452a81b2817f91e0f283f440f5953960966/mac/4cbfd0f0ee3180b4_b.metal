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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
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
    float2 _267 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _54;
    float _68 = _64 * _56;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _72);
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _88 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _80);
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _82);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _102 = 1.0 / _94;
    float _104 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _96);
    float _106 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _108 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _110 = _92 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _112 = _104 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _114 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _106);
    float _116 = 1.0 / _98;
    float _118 = _100 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _120 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _114);
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _124 = _112 * _102;
    float _126 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _108);
    float _128 = _110 * _102;
    float _130 = _118 * _102;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _126);
    float _138 = fma(_132, _58, _124);
    float _140 = fma(_132, _134, _128);
    float _142 = _136 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _470 = float3(_138, _140, float(0));
    float3 _474 = select(_470, float3(0.0), isnan(_470));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _474.xy, uint(rint(_474.z)), _132);
    float _146 = -_134;
    float _148 = fma(_132, _146, _128);
    float _150 = _122 * _116;
    float _152 = _142 * _116;
    float _154 = -_58;
    float _156 = fma(_132, _154, _124);
    float3 _499 = float3(_124, _140, float(0));
    float3 _501 = select(_499, float3(0.0), isnan(_499));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _501.xy, uint(rint(_501.z)), _132);
    float3 _508 = float3(_156, _140, float(0));
    float3 _510 = select(_508, float3(0.0), isnan(_508));
    float _160 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _510.xy, uint(rint(_510.z)), _132);
    float3 _517 = float3(_138, _128, float(0));
    float3 _519 = select(_517, float3(0.0), isnan(_517));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _519.xy, uint(rint(_519.z)), _132);
    float3 _526 = float3(_124, _128, float(0));
    float3 _528 = select(_526, float3(0.0), isnan(_526));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _528.xy, uint(rint(_528.z)), _132);
    float2 _534 = float2(_150, _152);
    float2 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_534, float2(0.0), isnan(_534))).xy;
    float _170 = _168.x;
    float _172 = _168.y;
    float3 _547 = float3(_156, _128, float(0));
    float3 _549 = select(_547, float3(0.0), isnan(_547));
    float _174 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _549.xy, uint(rint(_549.z)), _132);
    float3 _556 = float3(_138, _148, float(0));
    float3 _558 = select(_556, float3(0.0), isnan(_556));
    float _176 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _558.xy, uint(rint(_558.z)), _132);
    float3 _565 = float3(_124, _148, float(0));
    float3 _567 = select(_565, float3(0.0), isnan(_565));
    float _178 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _567.xy, uint(rint(_567.z)), _132);
    float3 _574 = float3(_156, _148, float(0));
    float3 _576 = select(_574, float3(0.0), isnan(_574));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _576.xy, uint(rint(_576.z)), _132);
    float2 _582 = float2(_48, _50);
    float _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_582, float2(0.0), isnan(_582))).x;
    float _184 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _186 = -_64;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _190 = _186 + _188;
    float _192 = -_64;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _196 = _192 + _194;
    float _198 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _184);
    float _200 = _190 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _196 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _198);
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _212 = precise::min(_210, 1.0);
    float _214 = _144 + _158;
    float _216 = _214 + _160;
    float _218 = _216 + _162;
    float _220 = -_170;
    float _222 = fma(_220, _170, _172);
    float _224 = -_170;
    float _226 = _212 + _224;
    float _228 = _218 + _164;
    float _230 = fma(_226, _226, _222);
    bool _234 = _226 <= 0.001000000047497451305389404296875;
    float _236 = float(_234);
    float _238 = 1.0 / _230;
    float _240 = _228 + _174;
    float _242 = _240 + _176;
    float _244 = _222 * _238;
    float _246 = _242 + _178;
    float _248 = precise::max(_244, _236);
    float _250 = _246 + _180;
    float _252 = precise::min(_248, 1.0);
    float _254 = fma(_250, 0.111111111938953399658203125, _202);
    float _256 = _206 + _252;
    out.m_41.x = _182;
    out.m_41.y = _254;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _256;
    return out;
}

