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
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _186 = float2(_51, _53);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_186, float2(0.0), isnan(_186))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_186, float2(0.0), isnan(_186))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_25.w;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = _49 * _70;
    float _74 = _60 * _72;
    float _76 = _58 * _72;
    float _78 = _62 * _72;
    float _80 = _74 * 0.586600005626678466796875;
    float _82 = _74 * (-1.44269502162933349609375);
    float _84 = _76 * (-1.44269502162933349609375);
    float _86 = _78 * (-1.44269502162933349609375);
    float _88 = fma(_76, 0.29890000820159912109375, _80);
    float _90 = exp2(_84);
    float _92 = fma(_78, 0.1143999993801116943359375, _88);
    float _94 = _92 * (-1.44269502162933349609375);
    float _96 = 1.0 / _92;
    float _98 = exp2(_94);
    float _100 = exp2(_82);
    float _102 = exp2(_86);
    float _104 = -_98;
    float _106 = _104 + 1.0;
    float _108 = _106 * _96;
    float _110 = _76 * _108;
    float _112 = _74 * _108;
    float _114 = -_90;
    float _116 = _114 + 1.0;
    float _118 = -_100;
    float _120 = _118 + 1.0;
    float _122 = _78 * _108;
    float _124 = _106 * _106;
    float _126 = -_110;
    float _128 = _116 + _126;
    float _130 = -_102;
    float _132 = _130 + 1.0;
    float _134 = -_112;
    float _136 = _120 + _134;
    float _138 = fma(_124, _128, _110);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = -_122;
    float _144 = _132 + _142;
    float _146 = fma(_124, _136, _112);
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_124, _144, _122);
    float _152 = precise::clamp(_150, 0.0, 1.0);
    out.m_28.x = _140;
    out.m_28.y = _148;
    out.m_28.z = _152;
    out.m_28.w = _64;
    return out;
}

