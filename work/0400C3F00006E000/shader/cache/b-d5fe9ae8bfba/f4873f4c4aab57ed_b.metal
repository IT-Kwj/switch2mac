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
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _248 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float _60 = in.m_40.w;
    float _62 = in.m_42.w;
    float _64 = in.m_40.x;
    float _66 = in.m_40.y;
    float _68 = in.m_42.z;
    float _70 = in.m_42.x;
    float _72 = in.m_42.y;
    float _74 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _60, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _80 = -_74;
    float _82 = fma(_80, _62, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _84 = -_74;
    float _86 = fma(_84, _64, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _88 = -_74;
    float _90 = fma(_88, _66, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _92 = 1.0 / _78;
    float _94 = -_74;
    float _96 = fma(_94, _68, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _98 = -_74;
    float _100 = fma(_98, _70, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _102 = -_74;
    float _104 = fma(_102, _72, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _106 = 1.0 / _82;
    float _108 = fma(_86, _92, (*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _110 = fma(_90, _92, (*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _112 = _108 * (*spvDescriptorSet0.fp_c4)._m0[18].z;
    float _114 = _110 * (*spvDescriptorSet0.fp_c4)._m0[18].w;
    float2 _363 = float2(_54, _56);
    float3 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_363, float2(0.0), isnan(_363))).xyz;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _96 * _106;
    float _128 = _100 * _106;
    float _130 = _104 * _106;
    float2 _386 = float2(_128, _130);
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_386, float2(0.0), isnan(_386)), _126);
    float2 _394 = float2(_112, _114);
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_394, float2(0.0), isnan(_394))).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = in.m_44.y;
    float _144 = in.m_44.x;
    float _146 = in.m_44.z;
    float _148 = -_78;
    float _150 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    bool _154 = _150 <= 1.0;
    bool _156 = isnan(_150);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = float(_162);
    float _166 = _150 * _164;
    float _168 = precise::clamp(_166, 0.0, 1.0);
    float _170 = abs(_168);
    float _172 = log2(_170);
    float _174 = -_74;
    float _176 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _178 = fma(_174, _142, _176);
    float _180 = -_74;
    float _182 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _184 = fma(_180, _144, _182);
    float _186 = -_74;
    float _188 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _190 = fma(_186, _146, _188);
    float _192 = _178 * _178;
    float _194 = fma(_184, _184, _192);
    float _196 = fma(_190, _190, _194);
    float _198 = _172 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _200 = rsqrt(_196);
    float _202 = exp2(_198);
    float _204 = fma(_122, 2.0, -1.0);
    float _206 = fma(_120, 2.0, -1.0);
    float _208 = fma(_124, 2.0, -1.0);
    float _210 = _204 * _178;
    float _212 = fma(_206, _184, _210);
    float _214 = fma(_208, _190, _212);
    float _216 = _202 * _132;
    float _218 = -_200;
    float _220 = fma(_218, _214, 0.0);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _136 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _226 = _138 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _228 = _216 * _222;
    float _230 = _140 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _232 = _224 * _228;
    float _234 = _226 * _228;
    float _236 = _230 * _228;
    out.m_47.x = _232;
    out.m_47.y = _234;
    out.m_47.z = _236;
    return out;
}

