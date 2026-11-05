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
    float4 m_25 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_25.y;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = 1.0 / _37;
    float _53 = _51 * _43;
    float _55 = _51 * _49;
    float2 _150 = float2(_55, _53);
    float2 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_150, float2(0.0), isnan(_150))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_150, float2(0.0), isnan(_150))).zw;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = in.m_27.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_27.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_27.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_27.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _51 * _69;
    float _91 = _51 * _75;
    float _93 = _51 * _81;
    float _95 = _51 * _87;
    bool _99 = _61 > 0.0;
    bool _101 = _63 > 0.0;
    float _103 = _99 ? _95 : _91;
    float _105 = _101 ? _95 : _93;
    float2 _218 = float2(_89, _95);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_218, float2(0.0), isnan(_218))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_218, float2(0.0), isnan(_218))).x;
    float2 _226 = float2(_89, _103);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_226, float2(0.0), isnan(_226))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_226, float2(0.0), isnan(_226))).x;
    float2 _234 = float2(_89, _105);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_234, float2(0.0), isnan(_234))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_234, float2(0.0), isnan(_234))).x;
    float _113 = _107 * 0.2941176593303680419921875;
    float _115 = fma(_109, 0.3529411852359771728515625, _113);
    float _117 = fma(_111, 0.3529411852359771728515625, _115);
    out.m_30.x = _117;
    return out;
}

