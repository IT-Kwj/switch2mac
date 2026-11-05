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
    sampler fp_t_tcb_ASmplr_w [[id(3)]];
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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _135 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_135, float2(0.0), isnan(_135))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_135, float2(0.0), isnan(_135))).x;
    float _61 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _63 = -_59;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _67 = _65 * _61;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _71 = -_67;
    float _73 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[0].z, _69);
    float _75 = -_67;
    float _77 = -_69;
    float _79 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[0].z, _77);
    float _81 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _83 = precise::max(0.0, _73);
    float _85 = precise::max(0.0, _79);
    float _87 = _83 * _81;
    float _89 = _85 * _81;
    float _91 = precise::max(_87, -0.00999999977648258209228515625);
    float _93 = precise::max(_89, -0.00999999977648258209228515625);
    float _95 = precise::min(_91, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _97 = precise::min(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _99 = _95 * 0.00999999977648258209228515625;
    float _101 = _97 * 0.00999999977648258209228515625;
    out.m_32.x = _99;
    out.m_32.y = _101;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

