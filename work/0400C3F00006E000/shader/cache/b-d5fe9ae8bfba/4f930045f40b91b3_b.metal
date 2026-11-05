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
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_23.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_23.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _33;
    float _61 = _59 * _39;
    float _63 = _59 * _45;
    float _65 = _59 * _51;
    float _67 = _59 * _57;
    float2 _195 = float2(_61, _63);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_195, float2(0.0), isnan(_195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_195, float2(0.0), isnan(_195))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float2 _215 = float2(_61, _65);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_215, float2(0.0), isnan(_215))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_215, float2(0.0), isnan(_215))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float2 _231 = float2(_67, _63);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float2 _247 = float2(_67, _65);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_247, float2(0.0), isnan(_247))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = _72 + _82;
    float _112 = _74 + _84;
    float _114 = _76 + _86;
    float _116 = _78 + _88;
    float _118 = _110 + _92;
    float _120 = _112 + _94;
    float _122 = _114 + _96;
    float _124 = _116 + _98;
    float _126 = _118 + _102;
    float _128 = _120 + _104;
    float _130 = _122 + _106;
    float _132 = _124 + _108;
    float _134 = _126 * 0.25;
    float _136 = _128 * 0.25;
    float _138 = _130 * 0.25;
    float _140 = _132 * 0.25;
    out.m_26.x = _134;
    out.m_26.y = _136;
    out.m_26.z = _138;
    out.m_26.w = _140;
    return out;
}

