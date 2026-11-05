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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
    float4 m_31 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = in.m_31.x;
    float _49 = in.m_31.y;
    float2 _122 = float2(_43, _45);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_122, float2(0.0), isnan(_122))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_122, float2(0.0), isnan(_122))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float2 _142 = float2(_47, _49);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_142, float2(0.0), isnan(_142))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_142, float2(0.0), isnan(_142))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_33.x;
    float _74 = -_72;
    float _76 = _74 + 1.0;
    float _78 = _60 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _80 = -_76;
    float _82 = fma(_54, _64, _80);
    float _84 = precise::clamp(_82, 0.0, 1.0);
    float _86 = -_76;
    float _88 = fma(_56, _66, _86);
    float _90 = precise::clamp(_88, 0.0, 1.0);
    float _92 = _78 * _70;
    float _94 = -_76;
    float _96 = fma(_58, _68, _94);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _90 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _102 = _92 * _72;
    float _104 = _84 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    out.m_36.x = _104;
    out.m_36.y = _100;
    out.m_36.z = _106;
    out.m_36.w = _102;
    return out;
}

