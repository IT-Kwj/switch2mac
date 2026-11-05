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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
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
    float2 _198 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_198, float2(0.0), isnan(_198))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_198, float2(0.0), isnan(_198))).x;
    float _52 = in.m_36.y;
    float _54 = in.m_36.x;
    float _56 = -_50;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _52;
    float _68 = _64 * _54;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _78 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _78);
    float _84 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _90 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _86);
    float _94 = 1.0 / _84;
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = _102 * _94;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _98 * _94;
    float _110 = _100 * _94;
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _114 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _116 = fma(_106, _112, _108);
    float _118 = fma(_106, _114, _110);
    float _120 = -_112;
    float _122 = fma(_106, _120, _108);
    float _124 = -_114;
    float _126 = fma(_106, _124, _110);
    float3 _359 = float3(_116, _118, float(0));
    float3 _363 = select(_359, float3(0.0), isnan(_359));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _363.xy, uint(rint(_363.z)), _106);
    float3 _370 = float3(_108, _118, float(0));
    float3 _372 = select(_370, float3(0.0), isnan(_370));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _372.xy, uint(rint(_372.z)), _106);
    float3 _379 = float3(_122, _118, float(0));
    float3 _381 = select(_379, float3(0.0), isnan(_379));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _381.xy, uint(rint(_381.z)), _106);
    float3 _388 = float3(_116, _110, float(0));
    float3 _390 = select(_388, float3(0.0), isnan(_388));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _390.xy, uint(rint(_390.z)), _106);
    float3 _397 = float3(_108, _110, float(0));
    float3 _399 = select(_397, float3(0.0), isnan(_397));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _399.xy, uint(rint(_399.z)), _106);
    float3 _406 = float3(_122, _110, float(0));
    float3 _408 = select(_406, float3(0.0), isnan(_406));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _408.xy, uint(rint(_408.z)), _106);
    float3 _415 = float3(_116, _126, float(0));
    float3 _417 = select(_415, float3(0.0), isnan(_415));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _417.xy, uint(rint(_417.z)), _106);
    float3 _424 = float3(_108, _126, float(0));
    float3 _426 = select(_424, float3(0.0), isnan(_424));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _426.xy, uint(rint(_426.z)), _106);
    float3 _433 = float3(_122, _126, float(0));
    float3 _435 = select(_433, float3(0.0), isnan(_433));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _435.xy, uint(rint(_435.z)), _106);
    float2 _441 = float2(_46, _48);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_441, float2(0.0), isnan(_441))).x;
    float _148 = _128 + _130;
    float _150 = _148 + _132;
    float _152 = _150 + _134;
    float _154 = _152 + _136;
    float _156 = _154 + _138;
    float _158 = _156 + _140;
    float _160 = -_64;
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _164 = _160 + _162;
    float _166 = -_64;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _170 = _166 + _168;
    float _172 = _158 + _142;
    float _174 = _164 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _170 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = _172 + _144;
    float _184 = _180 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _186 = fma(_182, 0.111111111938953399658203125, _176);
    out.m_39.x = _146;
    out.m_39.y = _186;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _184;
    return out;
}

