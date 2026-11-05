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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_A [[id(0)]];
    sampler fp_t_tcb_ASmplr [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_ASmplr_w [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0)]];
    float4 m_25 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_25.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = 1.0 / _37;
    float _53 = _51 * _43;
    float _55 = _51 * _49;
    float2 _154 = float2(_53, _55);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_154, float2(0.0), isnan(_154))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_154, float2(0.0), isnan(_154))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float2 _172 = float2(_53, _55);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_172, float2(0.0), isnan(_172))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_172, float2(0.0), isnan(_172))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = in.m_27.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = _51 * _82;
    float _86 = _70 + _61;
    float _88 = _72 + _63;
    float _90 = _74 + _65;
    float _92 = _86 * _84;
    float _94 = _88 * _84;
    float _96 = _90 * _84;
    float _98 = abs(_92);
    float _100 = log2(_98);
    float _102 = abs(_94);
    float _104 = log2(_102);
    float _106 = abs(_96);
    float _108 = log2(_106);
    float _110 = _100 * 0.4545454680919647216796875;
    float _112 = _104 * 0.4545454680919647216796875;
    float _114 = exp2(_110);
    float _116 = _108 * 0.4545454680919647216796875;
    float _118 = exp2(_112);
    float _120 = exp2(_116);
    out.m_30.x = _114;
    out.m_30.y = _118;
    out.m_30.z = _120;
    out.m_30.w = _76;
    return out;
}

