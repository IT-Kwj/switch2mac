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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_36.x;
    float _52 = in.m_36.y;
    float2 _184 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_184, float2(0.0), isnan(_184))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_184, float2(0.0), isnan(_184))).x;
    float _56 = in.m_38.w;
    float _58 = in.m_38.x;
    float _60 = in.m_38.z;
    float _62 = in.m_38.y;
    float _64 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _66 = -_64;
    float _68 = fma(_66, _56, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _70 = -_64;
    float _72 = fma(_70, _58, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _74 = -_64;
    float _76 = fma(_74, _60, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _78 = -_64;
    float _80 = fma(_78, _62, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _82 = 1.0 / _68;
    float _84 = _72 * _82;
    float _86 = _76 * _82;
    float2 _254 = float2(_50, _52);
    float3 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_254, float2(0.0), isnan(_254))).xyz;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _80 * _82;
    float2 _271 = float2(_84, _98);
    float _100 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271)), _86);
    float _102 = in.m_40.z;
    float _104 = -_64;
    float _106 = fma(_104, _102, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _108 = fma(_106, -0.5, 0.5);
    bool _112 = _108 <= 1.0;
    bool _114 = isnan(_108);
    bool _116 = _112 || _114;
    bool _118 = isnan(1.0);
    bool _120 = _116 || _118;
    float _122 = float(_120);
    float _124 = _108 * _122;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = abs(_126);
    float _130 = log2(_128);
    float _132 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _134 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _132);
    float _136 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _134);
    float _138 = rsqrt(_136);
    float _140 = _130 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _142 = exp2(_140);
    float _144 = fma(_94, 2.0, -1.0);
    float _146 = fma(_92, 2.0, -1.0);
    float _148 = fma(_96, 2.0, -1.0);
    float _150 = _144 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _152 = _142 * _100;
    float _154 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[15].x, _150);
    float _156 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[15].z, _154);
    float _158 = _152 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _160 = -_138;
    float _162 = fma(_160, _156, 0.0);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _158 * _164;
    float _168 = _166 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _170 = _166 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _172 = _166 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_43.x = _168;
    out.m_43.y = _170;
    out.m_43.z = _172;
    out.m_43.w = 0.0;
    return out;
}

