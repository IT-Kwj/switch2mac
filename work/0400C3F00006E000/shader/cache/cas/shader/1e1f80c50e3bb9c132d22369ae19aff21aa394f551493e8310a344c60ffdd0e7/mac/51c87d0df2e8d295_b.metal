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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.y;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = gl_FragCoord.x;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _53 = _51 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _55 = 1.0 / _53;
    float _57 = _43 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _59 = _49 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _61 = fma(_57, _53, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _63 = fma(_59, 420.96923828125, -16.54038238525390625);
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _67 = _61 + _65;
    float _69 = log2(_63);
    float _71 = _67 * _55;
    float _73 = sqrt(_71);
    float2 _183 = float2(_59, _71);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_183, float2(0.0), isnan(_183))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_183, float2(0.0), isnan(_183))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _69 * 0.1155245304107666015625;
    float2 _204 = float2(_85, _73);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_204, float2(0.0), isnan(_204))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = fma(_59, 1.2000000476837158203125, -0.20000000298023223876953125);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = fma(_89, _97, _79);
    float _101 = fma(_91, _97, _81);
    float _103 = fma(_93, _97, _83);
    float _105 = _99 * 0.3183098733425140380859375;
    float _107 = _101 * 0.3183098733425140380859375;
    float _109 = _103 * 0.3183098733425140380859375;
    float _111 = precise::max(0.0, _105);
    float _113 = precise::max(0.0, _107);
    float _115 = precise::max(0.0, _109);
    out.m_32.x = _111;
    out.m_32.y = _113;
    out.m_32.z = _115;
    out.m_32.w = 0.0;
    return out;
}

