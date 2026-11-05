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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _215 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_215, float2(0.0), isnan(_215))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_215, float2(0.0), isnan(_215))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = _60 * _54;
    float _66 = _62 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _68 = _62 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _72 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _66);
    float _76 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _68);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _70);
    float _82 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[15].z, _74);
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _88 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[12].z, _78);
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _92 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _94 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _98 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[13].z, _80);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _102 = 1.0 / _90;
    float _104 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    float _106 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _108 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _86);
    float _110 = _88 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _112 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _104);
    float _114 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _106);
    float _116 = _98 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _118 = 1.0 / _100;
    float _120 = _108 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _122 = _112 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = _110 * _102;
    float _128 = _116 * _102;
    float _130 = _120 * _118;
    float _132 = _122 * _118;
    float _134 = _124 * _118;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float2 _402 = float2(_126, _128);
    float2 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_402, float2(0.0), isnan(_402))).xy;
    float _142 = _140.x;
    float _144 = _140.y;
    float3 _416 = float3(_130, _132, float(0));
    float3 _420 = select(_416, float3(0.0), isnan(_416));
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _420.xy, uint(rint(_420.z)), _136);
    float _148 = _62 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _150 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _148);
    float _152 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[14].z, _150);
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _156 = precise::min(_154, 1.0);
    float _158 = -_60;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _162 = _158 + _160;
    float _164 = -_142;
    float _166 = fma(_164, _142, _144);
    float _168 = -_142;
    float _170 = _156 + _168;
    float _172 = -_60;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _176 = _172 + _174;
    float _178 = fma(_170, _170, _166);
    bool _182 = _170 <= 0.001000000047497451305389404296875;
    float _184 = float(_182);
    float _186 = _176 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _162 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = 1.0 / _178;
    float _196 = _188 + _146;
    float _198 = _166 * _194;
    float _200 = precise::max(_198, _184);
    float _202 = precise::min(_200, 1.0);
    float _204 = _192 + _202;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _196;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _204;
    return out;
}

