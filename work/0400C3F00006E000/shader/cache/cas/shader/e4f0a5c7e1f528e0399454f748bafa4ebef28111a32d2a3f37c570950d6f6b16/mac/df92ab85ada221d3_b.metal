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
    float2 _190 = float2(_53, _55);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_190, float2(0.0), isnan(_190))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float2 _208 = float2(_53, _55);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_208, float2(0.0), isnan(_208))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_208, float2(0.0), isnan(_208))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = in.m_27.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = _51 * _82;
    float _86 = _72 + _63;
    float _88 = _70 + _61;
    float _90 = _74 + _65;
    float _92 = _86 * _84;
    float _94 = _88 * _84;
    float _96 = _90 * _84;
    float _98 = fma(_92, 6.19999980926513671875, 1.7000000476837158203125);
    float _100 = fma(_94, 6.19999980926513671875, 1.7000000476837158203125);
    float _102 = fma(_94, 6.19999980926513671875, 0.5);
    float _104 = fma(_92, _98, 0.0599999986588954925537109375);
    float _106 = fma(_96, 6.19999980926513671875, 1.7000000476837158203125);
    float _108 = fma(_94, _100, 0.0599999986588954925537109375);
    float _110 = _94 * _102;
    float _112 = 1.0 / _104;
    float _114 = fma(_96, _106, 0.0599999986588954925537109375);
    float _116 = fma(_92, 6.19999980926513671875, 0.5);
    float _118 = _92 * _116;
    float _120 = fma(_96, 6.19999980926513671875, 0.5);
    float _122 = 1.0 / _108;
    float _124 = _96 * _120;
    float _126 = 1.0 / _114;
    float _128 = _118 * _112;
    float _130 = _110 * _122;
    float _132 = abs(_128);
    float _134 = log2(_132);
    float _136 = _124 * _126;
    float _138 = abs(_130);
    float _140 = log2(_138);
    float _142 = abs(_136);
    float _144 = log2(_142);
    float _146 = _134 * 2.2000000476837158203125;
    float _148 = _140 * 2.2000000476837158203125;
    float _150 = exp2(_146);
    float _152 = _144 * 2.2000000476837158203125;
    float _154 = exp2(_148);
    float _156 = exp2(_152);
    out.m_30.x = _154;
    out.m_30.y = _150;
    out.m_30.z = _156;
    out.m_30.w = _76;
    return out;
}

