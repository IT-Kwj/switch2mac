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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _124 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_124, float2(0.0), isnan(_124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_124, float2(0.0), isnan(_124))).x;
    float2 _135 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_135, float2(0.0), isnan(_135))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_135, float2(0.0), isnan(_135))).x;
    bool _72 = _68 >= _66;
    bool _74 = isnan(_68);
    bool _76 = _72 || _74;
    bool _78 = isnan(_66);
    bool _80 = _76 || _78;
    if (!_80)
    {
        discard_fragment();
    }
    if (!_80)
    {
        out.gl_FragDepth = 0.0;
        out.m_39.x = 0.0;
        out.m_39.y = 0.0;
        out.m_39.z = 0.0;
        out.m_39.w = 0.0;
        return out;
    }
    float2 _169 = float2(_62, _64);
    float3 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_169, float2(0.0), isnan(_169))).xyz;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    out.gl_FragDepth = _66;
    out.m_39.x = _86;
    out.m_39.y = _88;
    out.m_39.z = _90;
    out.m_39.w = (*spvDescriptorSet0.fp_c3)._m0[9].y;
    return out;
}

