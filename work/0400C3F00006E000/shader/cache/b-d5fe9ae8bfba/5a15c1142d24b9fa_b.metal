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
    float4 m_38 [[user(locn1), center_no_perspective]];
    float4 m_36 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_36.x;
    float _52 = in.m_36.y;
    float2 _244 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_244, float2(0.0), isnan(_244))).x;
    float _56 = in.m_38.w;
    float _58 = in.m_38.y;
    float _60 = in.m_38.x;
    float _62 = in.m_38.z;
    float _64 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _66 = -_64;
    float _68 = fma(_66, _56, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _70 = -_64;
    float _72 = fma(_70, _58, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _74 = -_64;
    float _76 = fma(_74, _60, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _78 = -_64;
    float _80 = fma(_78, _62, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _82 = 1.0 / _68;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c4)._m0[14].y, _72);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c4)._m0[14].x, _76);
    float _88 = -_68;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c4)._m0[14].x, _76);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c4)._m0[14].y, _72);
    float2 _335 = float2(_50, _52);
    float3 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_335, float2(0.0), isnan(_335))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_335, float2(0.0), isnan(_335))).xyz;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _84 * _82;
    float _108 = _86 * _82;
    float _110 = _80 * _82;
    float _112 = _90 * _82;
    float _114 = _94 * _82;
    float2 _364 = float2(_108, _106);
    float _116 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), _110);
    float2 _372 = float2(_112, _106);
    float _118 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_372, float2(0.0), isnan(_372)), _110);
    float2 _380 = float2(_108, _114);
    float _120 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380)), _110);
    float2 _388 = float2(_112, _114);
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_388, float2(0.0), isnan(_388)), _110);
    float _124 = in.m_40.y;
    float _126 = in.m_40.x;
    float _128 = in.m_40.z;
    float _130 = -_64;
    float _132 = -(*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _134 = fma(_130, _124, _132);
    float _136 = -_64;
    float _138 = -(*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _140 = fma(_136, _126, _138);
    float _142 = -_64;
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _146 = fma(_142, _128, _144);
    float _148 = _134 * _134;
    float _150 = fma(_140, _140, _148);
    float _152 = fma(_146, _146, _150);
    float _154 = rsqrt(_152);
    float _156 = _134 * (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _158 = fma(_140, (*spvDescriptorSet0.fp_c4)._m0[11].x, _156);
    float _160 = sqrt(_152);
    float _162 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[11].z, _158);
    float _164 = _154 * _162;
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _168 = fma(_164, (*spvDescriptorSet0.fp_c4)._m0[13].y, _166);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = -_160;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c4)._m0[8].w, 1.0);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = abs(_170);
    float _180 = log2(_178);
    float _182 = abs(_176);
    float _184 = log2(_182);
    float _186 = _180 * (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _188 = exp2(_186);
    float _190 = _184 * (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _192 = exp2(_190);
    float _194 = _192 * _188;
    float _196 = fma(_102, 2.0, -1.0);
    float _198 = fma(_100, 2.0, -1.0);
    float _200 = _116 + _118;
    float _202 = _196 * _134;
    float _204 = fma(_104, 2.0, -1.0);
    float _206 = _200 + _120;
    float _208 = fma(_198, _140, _202);
    float _210 = _206 + _122;
    float _212 = fma(_204, _146, _208);
    float _214 = _210 * _194;
    float _216 = _214 * 0.25;
    float _218 = -_154;
    float _220 = fma(_218, _212, 0.0);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _216 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _226 = _222 * _224;
    float _228 = _226 * (*spvDescriptorSet0.fp_c4)._m0[8].x;
    float _230 = _226 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _232 = _226 * (*spvDescriptorSet0.fp_c4)._m0[8].z;
    out.m_43.x = _228;
    out.m_43.y = _230;
    out.m_43.z = _232;
    out.m_43.w = 0.0;
    return out;
}

