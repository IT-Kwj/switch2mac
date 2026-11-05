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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
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
    float2 _148 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_148, float2(0.0), isnan(_148))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_148, float2(0.0), isnan(_148))).x;
    float2 _160 = float2(_57, _59);
    float2 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_160, float2(0.0), isnan(_160))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_160, float2(0.0), isnan(_160))).xy;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _61 + (*spvDescriptorSet0.fp_c3)._m0[21].x;
    float _73 = _69 + (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _75 = _67 + (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _79 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[22].x, _77);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[22].w, _77);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[22].z, _77);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[22].y, _87);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = abs(_81);
    float _95 = log2(_93);
    float _97 = abs(_85);
    float _99 = log2(_97);
    float _101 = abs(_91);
    float _103 = log2(_101);
    float _105 = _95 * 2.2000000476837158203125;
    float _107 = _99 * 2.2000000476837158203125;
    float _109 = exp2(_105);
    float _111 = _103 * 2.2000000476837158203125;
    float _113 = exp2(_107);
    float _115 = exp2(_111);
    out.m_34.x = _109;
    out.m_34.y = _115;
    out.m_34.z = _113;
    out.m_34.w = 1.0;
    return out;
}

