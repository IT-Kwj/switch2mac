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
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
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
    float2 _287 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).x;
    float2 _298 = float2(_50, _52);
    float2 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_298, float2(0.0), isnan(_298))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_298, float2(0.0), isnan(_298))).xy;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _70 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _72 = -_54;
    float _74 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _76 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[46].z, _74);
    float _78 = _76 * _64;
    float _80 = _76 * _66;
    float _82 = _78 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _84 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _86 = _78 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _88 = _78 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _90 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[15].x, _82);
    float _92 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[13].x, _86);
    float _96 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[12].x, _88);
    float _98 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[15].z, _90);
    float _100 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _102 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[13].z, _94);
    float _104 = _98 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _106 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[3].x, _84);
    float _108 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _110 = 1.0 / _104;
    float _112 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[3].z, _106);
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _116 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[12].z, _96);
    float _118 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[0].x, _92);
    float _120 = _102 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _122 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].x, _108);
    float _124 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[2].x, _100);
    float _126 = 1.0 / _114;
    float _128 = _116 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _130 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[0].z, _118);
    float _132 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
    float _134 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
    float _136 = _128 * _110;
    float _138 = _120 * _110;
    float _140 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _142 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _144 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _146 = _140 * _126;
    float _148 = _142 * _126;
    float _150 = _144 * _126;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = fma(_62, 2.0, -1.0);
    float _156 = fma(_60, 2.0, -1.0);
    float _158 = fma(_152, _68, _146);
    float _160 = fma(_152, _70, _148);
    float _162 = _154 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _164 = _156 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _523 = float3(_158, _160, float(0));
    float3 _527 = select(_523, float3(0.0), isnan(_523));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _527.xy, uint(rint(_527.z)), _152);
    float _168 = -_70;
    float _170 = fma(_152, _168, _148);
    float _172 = fma(_162, 2.0, _52);
    float _174 = fma(_164, 2.0, _50);
    float _176 = -_68;
    float _178 = fma(_152, _176, _146);
    float3 _552 = float3(_146, _160, float(0));
    float3 _554 = select(_552, float3(0.0), isnan(_552));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _554.xy, uint(rint(_554.z)), _152);
    float3 _561 = float3(_178, _160, float(0));
    float3 _563 = select(_561, float3(0.0), isnan(_561));
    float _182 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _563.xy, uint(rint(_563.z)), _152);
    float3 _570 = float3(_158, _148, float(0));
    float3 _572 = select(_570, float3(0.0), isnan(_570));
    float _184 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _572.xy, uint(rint(_572.z)), _152);
    float3 _579 = float3(_146, _148, float(0));
    float3 _581 = select(_579, float3(0.0), isnan(_579));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _581.xy, uint(rint(_581.z)), _152);
    float2 _587 = float2(_136, _138);
    float2 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_587, float2(0.0), isnan(_587))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_587, float2(0.0), isnan(_587))).xy;
    float _190 = _188.x;
    float _192 = _188.y;
    float3 _600 = float3(_178, _148, float(0));
    float3 _602 = select(_600, float3(0.0), isnan(_600));
    float _194 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _602.xy, uint(rint(_602.z)), _152);
    float3 _609 = float3(_158, _170, float(0));
    float3 _611 = select(_609, float3(0.0), isnan(_609));
    float _196 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _611.xy, uint(rint(_611.z)), _152);
    float3 _618 = float3(_146, _170, float(0));
    float3 _620 = select(_618, float3(0.0), isnan(_618));
    float _198 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _620.xy, uint(rint(_620.z)), _152);
    float3 _627 = float3(_178, _170, float(0));
    float3 _629 = select(_627, float3(0.0), isnan(_627));
    float _200 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _629.xy, uint(rint(_629.z)), _152);
    float2 _635 = float2(_174, _172);
    float _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float _204 = _78 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _206 = -_76;
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _210 = _206 + _208;
    float _212 = -_76;
    float _214 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _216 = _212 + _214;
    float _218 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[14].x, _204);
    float _220 = _210 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[14].z, _218);
    float _230 = _228 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _232 = precise::min(_230, 1.0);
    float _234 = _166 + _180;
    float _236 = -_190;
    float _238 = fma(_236, _190, _192);
    float _240 = -_190;
    float _242 = _232 + _240;
    float _244 = _234 + _182;
    float _246 = fma(_242, _242, _238);
    float _248 = _244 + _184;
    bool _252 = _242 <= 0.001000000047497451305389404296875;
    float _254 = float(_252);
    float _256 = 1.0 / _246;
    float _258 = _248 + _186;
    float _260 = _258 + _194;
    float _262 = _260 + _196;
    float _264 = _238 * _256;
    float _266 = _262 + _198;
    float _268 = precise::max(_264, _254);
    float _270 = _266 + _200;
    float _272 = precise::min(_268, 1.0);
    float _274 = fma(_270, 0.111111111938953399658203125, _222);
    float _276 = _226 + _272;
    out.m_43.x = _202;
    out.m_43.y = _274;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _276;
    return out;
}

