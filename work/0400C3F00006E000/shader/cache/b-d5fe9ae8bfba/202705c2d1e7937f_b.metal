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
    float2 _228 = float2(_53, _55);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_228, float2(0.0), isnan(_228))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float2 _246 = float2(_53, _55);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_246, float2(0.0), isnan(_246))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_246, float2(0.0), isnan(_246))).xyzw;
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
    float _98 = _92 * 0.586600005626678466796875;
    float _100 = _94 * (-1.44269502162933349609375);
    float _102 = _92 * (-1.44269502162933349609375);
    float _104 = _96 * (-1.44269502162933349609375);
    float _106 = fma(_94, 0.29890000820159912109375, _98);
    float _108 = exp2(_100);
    float _110 = fma(_96, 0.1143999993801116943359375, _106);
    float _112 = _110 * (-1.44269502162933349609375);
    float _114 = 1.0 / _110;
    float _116 = exp2(_112);
    float _118 = -_108;
    float _120 = _118 + 1.0;
    float _122 = exp2(_102);
    float _124 = exp2(_104);
    float _126 = -_116;
    float _128 = _126 + 1.0;
    float _130 = _128 * _114;
    float _132 = _128 * _128;
    float _134 = -_122;
    float _136 = _134 + 1.0;
    float _138 = _94 * _130;
    float _140 = _92 * _130;
    float _142 = _96 * _130;
    float _144 = -_138;
    float _146 = _120 + _144;
    float _148 = -_140;
    float _150 = _136 + _148;
    float _152 = -_124;
    float _154 = _152 + 1.0;
    float _156 = fma(_132, _146, _138);
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = fma(_132, _150, _140);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = -_142;
    float _166 = _154 + _164;
    float _168 = abs(_162);
    float _170 = log2(_168);
    float _172 = fma(_132, _166, _142);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = abs(_158);
    float _178 = log2(_176);
    float _180 = abs(_174);
    float _182 = log2(_180);
    float _184 = _170 * 0.4545454680919647216796875;
    float _186 = _178 * 0.4545454680919647216796875;
    float _188 = exp2(_184);
    float _190 = _182 * 0.4545454680919647216796875;
    float _192 = exp2(_186);
    float _194 = exp2(_190);
    out.m_30.x = _192;
    out.m_30.y = _188;
    out.m_30.z = _194;
    out.m_30.w = _76;
    return out;
}

