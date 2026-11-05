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
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _121 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_121, float2(0.0), isnan(_121))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_121, float2(0.0), isnan(_121))).z;
    float _63 = abs(_61);
    float _65 = -_63;
    float _67 = _65 + 1.0;
    float _69 = _67 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _71 = precise::clamp(_69, 0.0, 1.0);
    float _73 = abs(_71);
    float _75 = log2(_73);
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _79 = exp2(_77);
    float _81 = _79 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _83 = _79 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _87 = _79 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    out.m_34.x = _81;
    out.m_34.y = _83;
    out.m_34.z = _85;
    out.m_34.w = _87;
    return out;
}

