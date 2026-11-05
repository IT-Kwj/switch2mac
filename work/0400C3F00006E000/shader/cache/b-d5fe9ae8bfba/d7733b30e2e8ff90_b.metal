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
    texture2d_array<float> fp_t_tcb_A [[id(0)]];
    sampler fp_t_tcb_ASmplr [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_ASmplr_w [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_25.z;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_25.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_25.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_25.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _35;
    float _63 = _61 * _41;
    float _65 = _61 * _47;
    float _67 = _61 * _53;
    float _69 = _61 * _59;
    float _71 = rint(_63);
    float _73 = precise::max(_71, 0.0);
    uint _76 = uint(_73);
    uint _78 = clamp(_76, 0u, 65535u);
    float3 _162 = float3(_65, _67, float(int(_78)));
    float3 _167 = select(_162, float3(0.0), isnan(_162));
    float2 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _167.xy, uint(rint(_167.z)), level(_69)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _167.xy, uint(rint(_167.z)), level(_69)).zw;
    float _84 = _82.x;
    float _86 = _82.y;
    float3 _181 = float3(_65, _67, float(int(_78)));
    float3 _183 = select(_181, float3(0.0), isnan(_181));
    float2 _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _183.xy, uint(rint(_183.z)), level(_69)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _183.xy, uint(rint(_183.z)), level(_69)).xy;
    float _90 = _88.x;
    float _92 = _88.y;
    out.m_28.x = _90;
    out.m_28.y = _92;
    out.m_28.z = _84;
    out.m_28.w = _86;
    return out;
}

