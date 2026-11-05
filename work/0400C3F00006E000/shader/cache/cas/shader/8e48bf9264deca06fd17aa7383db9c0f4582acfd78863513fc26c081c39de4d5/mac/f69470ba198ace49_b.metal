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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _61 = 1.0 / _39;
    float _63 = _61 * _45;
    float _65 = _61 * _51;
    float _67 = _61 * _57;
    float _69 = fma(_59, 0.5, _65);
    float _71 = rint(_63);
    float _73 = precise::max(_71, 0.0);
    uint _76 = uint(_73);
    uint _78 = clamp(_76, 0u, 65535u);
    float _80 = fma(_59, -0.5, _67);
    float _82 = fma(_59, -0.5, _65);
    float _84 = fma(_59, 0.5, _67);
    float3 _176 = float3(_69, _80, float(int(_78)));
    float3 _181 = select(_176, float3(0.0), isnan(_176));
    float _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _181.xy, uint(rint(_181.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _181.xy, uint(rint(_181.z))).x;
    float3 _190 = float3(_82, _80, float(int(_78)));
    float3 _192 = select(_190, float3(0.0), isnan(_190));
    float _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _192.xy, uint(rint(_192.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _192.xy, uint(rint(_192.z))).x;
    float3 _201 = float3(_82, _84, float(int(_78)));
    float3 _203 = select(_201, float3(0.0), isnan(_201));
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _203.xy, uint(rint(_203.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _203.xy, uint(rint(_203.z))).x;
    float3 _212 = float3(_69, _84, float(int(_78)));
    float3 _214 = select(_212, float3(0.0), isnan(_212));
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _214.xy, uint(rint(_214.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _214.xy, uint(rint(_214.z))).x;
    float _94 = precise::min(_88, _86);
    float _96 = precise::min(_90, _92);
    float _98 = precise::min(_94, _96);
    out.m_32.x = _98;
    out.m_32.y = 0.0;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

