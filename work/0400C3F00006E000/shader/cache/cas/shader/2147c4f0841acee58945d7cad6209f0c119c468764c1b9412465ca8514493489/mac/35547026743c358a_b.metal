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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_ASmplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
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
    float2 _123 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_123, float2(0.0), isnan(_123))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_123, float2(0.0), isnan(_123))).z;
    float _65 = abs(_63);
    float _67 = -_65;
    float _69 = _67 + 1.0;
    float _71 = _69 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _73 = precise::clamp(_71, 0.0, 1.0);
    float _75 = abs(_73);
    float _77 = log2(_75);
    float _79 = _77 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _81 = exp2(_79);
    float _83 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _85 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _87 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _89 = _81 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    out.m_34.x = _83;
    out.m_34.y = _85;
    out.m_34.z = _87;
    out.m_34.w = _89;
    out.m_36.x = _83;
    out.m_36.y = _85;
    out.m_36.z = _87;
    out.m_36.w = _89;
    return out;
}

