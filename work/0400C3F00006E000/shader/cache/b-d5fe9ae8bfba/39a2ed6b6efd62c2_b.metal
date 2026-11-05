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
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_38.x;
    float _54 = in.m_38.y;
    float2 _254 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_254, float2(0.0), isnan(_254))).x;
    float _58 = in.m_40.w;
    float _60 = in.m_42.w;
    float _62 = in.m_40.y;
    float _64 = in.m_40.x;
    float _66 = in.m_42.x;
    float _68 = in.m_42.y;
    float _70 = in.m_40.z;
    float _72 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _74 = -_72;
    float _76 = fma(_74, _58, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _78 = -_72;
    float _80 = fma(_78, _60, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _82 = -_72;
    float _84 = fma(_82, _62, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _86 = -_72;
    float _88 = fma(_86, _64, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _90 = 1.0 / _76;
    float _92 = -_72;
    float _94 = fma(_92, _66, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _96 = fma(_76, (*spvDescriptorSet0.fp_c4)._m0[17].y, _84);
    float _98 = -_72;
    float _100 = fma(_98, _68, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _102 = fma(_76, (*spvDescriptorSet0.fp_c4)._m0[17].x, _88);
    float _104 = -_76;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c4)._m0[17].x, _88);
    float _108 = -_76;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c4)._m0[17].y, _84);
    float _112 = -_72;
    float _114 = fma(_112, _70, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _116 = 1.0 / _80;
    float _118 = _96 * _90;
    float _120 = _102 * _90;
    float _122 = _110 * _90;
    float _124 = _114 * _90;
    float _126 = _94 * _116;
    float _128 = _100 * _116;
    float _130 = _106 * _90;
    float2 _396 = float2(_52, _54);
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_396, float2(0.0), isnan(_396))).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float2 _410 = float2(_120, _118);
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410)), _124);
    float2 _418 = float2(_130, _118);
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418)), _124);
    float2 _426 = float2(_120, _122);
    float _146 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), _124);
    float2 _434 = float2(_130, _122);
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434)), _124);
    float2 _442 = float2(_126, _128);
    float3 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_442, float2(0.0), isnan(_442))).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = in.m_42.z;
    float _160 = -_72;
    float _162 = fma(_160, _158, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _164 = fma(_162, -0.5, 0.5);
    bool _168 = _164 <= 1.0;
    bool _170 = isnan(_164);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = float(_176);
    float _180 = _164 * _178;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = abs(_182);
    float _186 = log2(_184);
    float _188 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _190 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _188);
    float _192 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _190);
    float _194 = _186 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _196 = rsqrt(_192);
    float _198 = exp2(_194);
    float _200 = fma(_138, 2.0, -1.0);
    float _202 = fma(_136, 2.0, -1.0);
    float _204 = fma(_140, 2.0, -1.0);
    float _206 = _200 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _208 = _142 + _144;
    float _210 = fma(_202, (*spvDescriptorSet0.fp_c4)._m0[15].x, _206);
    float _212 = _208 + _146;
    float _214 = fma(_204, (*spvDescriptorSet0.fp_c4)._m0[15].z, _210);
    float _216 = _212 + _148;
    float _218 = -_196;
    float _220 = fma(_218, _214, 0.0);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _152 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _226 = _198 * _216;
    float _228 = _226 * 0.25;
    float _230 = _154 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _234 = _232 * _222;
    float _236 = _156 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _238 = _224 * _234;
    float _240 = _230 * _234;
    float _242 = _236 * _234;
    out.m_45.x = _238;
    out.m_45.y = _240;
    out.m_45.z = _242;
    out.m_45.w = 0.0;
    return out;
}

