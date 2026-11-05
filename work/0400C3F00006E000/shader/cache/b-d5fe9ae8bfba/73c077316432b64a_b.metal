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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _204 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_204, float2(0.0), isnan(_204))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _222 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_222, float2(0.0), isnan(_222))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_222, float2(0.0), isnan(_222))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = _90 * (-1.44269502162933349609375);
    float _94 = abs(_67);
    float _96 = log2(_94);
    float _98 = abs(_69);
    float _100 = log2(_98);
    float _102 = abs(_71);
    float _104 = log2(_102);
    float _106 = _96 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _110 = exp2(_106);
    float _112 = _104 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _114 = exp2(_108);
    float _116 = exp2(_112);
    float _118 = _76 + _110;
    float _120 = _118 * _92;
    float _122 = _78 + _114;
    float _124 = exp2(_120);
    float _126 = _122 * _92;
    float _128 = _80 + _116;
    float _130 = exp2(_126);
    float _132 = _128 * _92;
    float _134 = exp2(_132);
    float _136 = -_124;
    float _138 = _136 + 1.0;
    float _140 = -_130;
    float _142 = _140 + 1.0;
    float _144 = abs(_138);
    float _146 = log2(_144);
    float _148 = -_134;
    float _150 = _148 + 1.0;
    float _152 = abs(_142);
    float _154 = log2(_152);
    float _156 = abs(_150);
    float _158 = log2(_156);
    float _160 = _146 * 2.2000000476837158203125;
    float _162 = _154 * 2.2000000476837158203125;
    float _164 = exp2(_160);
    float _166 = _158 * 2.2000000476837158203125;
    float _168 = exp2(_162);
    float _170 = exp2(_166);
    out.m_36.x = _164;
    out.m_36.y = _168;
    out.m_36.z = _170;
    out.m_36.w = _82;
    return out;
}

