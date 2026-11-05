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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _276 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_276, float2(0.0), isnan(_276))).x;
    float _60 = in.m_40.w;
    float _62 = in.m_42.w;
    float _64 = in.m_40.y;
    float _66 = in.m_40.x;
    float _68 = in.m_40.z;
    float _70 = in.m_42.y;
    float _72 = in.m_42.x;
    float _74 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _60, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _80 = -_74;
    float _82 = fma(_80, _62, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _84 = -_74;
    float _86 = fma(_84, _64, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _88 = -_74;
    float _90 = fma(_88, _66, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _92 = 1.0 / _78;
    float _94 = -_74;
    float _96 = fma(_94, _68, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _98 = fma(_78, (*spvDescriptorSet0.fp_c4)._m0[17].y, _86);
    float _100 = fma(_78, (*spvDescriptorSet0.fp_c4)._m0[17].x, _90);
    float _102 = -_78;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c4)._m0[17].x, _90);
    float _106 = -_78;
    float _108 = fma(_106, (*spvDescriptorSet0.fp_c4)._m0[17].y, _86);
    float _110 = -_74;
    float _112 = fma(_110, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _114 = -_74;
    float _116 = fma(_114, _72, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _118 = 1.0 / _82;
    float _120 = _98 * _92;
    float _122 = _104 * _92;
    float _124 = _96 * _92;
    float _126 = _100 * _92;
    float _128 = _108 * _92;
    float _130 = _112 * _118;
    float2 _415 = float2(_54, _56);
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_415, float2(0.0), isnan(_415))).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float2 _429 = float2(_126, _120);
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_429, float2(0.0), isnan(_429)), _124);
    float2 _437 = float2(_122, _120);
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437)), _124);
    float _146 = _116 * _118;
    float2 _448 = float2(_126, _128);
    float _148 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448)), _124);
    float2 _456 = float2(_122, _128);
    float _150 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456)), _124);
    float2 _464 = float2(_146, _130);
    float3 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_464, float2(0.0), isnan(_464))).xyz;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = in.m_44.y;
    float _162 = in.m_44.x;
    float _164 = -_82;
    float _166 = fma(_164, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _168 = in.m_44.z;
    bool _172 = _166 <= 1.0;
    bool _174 = isnan(_166);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = float(_180);
    float _184 = _166 * _182;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = abs(_186);
    float _190 = log2(_188);
    float _192 = -_74;
    float _194 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _196 = fma(_192, _160, _194);
    float _198 = -_74;
    float _200 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _202 = fma(_198, _162, _200);
    float _204 = _196 * _196;
    float _206 = _190 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _208 = -_74;
    float _210 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _212 = fma(_208, _168, _210);
    float _214 = fma(_202, _202, _204);
    float _216 = exp2(_206);
    float _218 = fma(_212, _212, _214);
    float _220 = rsqrt(_218);
    float _222 = fma(_138, 2.0, -1.0);
    float _224 = fma(_136, 2.0, -1.0);
    float _226 = _142 + _144;
    float _228 = fma(_140, 2.0, -1.0);
    float _230 = _222 * _196;
    float _232 = _226 + _148;
    float _234 = fma(_224, _202, _230);
    float _236 = _232 + _150;
    float _238 = fma(_228, _212, _234);
    float _240 = _216 * _236;
    float _242 = _240 * 0.25;
    float _244 = -_220;
    float _246 = fma(_244, _238, 0.0);
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _252 = _154 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _254 = _156 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _256 = _250 * _248;
    float _258 = _158 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _260 = _252 * _256;
    float _262 = _254 * _256;
    float _264 = _258 * _256;
    out.m_47.x = _260;
    out.m_47.y = _262;
    out.m_47.z = _264;
    out.m_47.w = 0.0;
    return out;
}

