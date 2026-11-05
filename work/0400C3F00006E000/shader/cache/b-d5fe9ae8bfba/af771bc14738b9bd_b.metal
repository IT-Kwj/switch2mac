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
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _41;
    float _63 = _61 * _47;
    float _65 = _61 * _53;
    float _67 = _61 * _59;
    float _69 = abs(_63);
    float _71 = abs(_65);
    float _73 = precise::max(_69, _71);
    float _75 = abs(_67);
    float _77 = precise::max(_75, _73);
    float _79 = 1.0 / _77;
    float _81 = _63 * _79;
    float _83 = _65 * _79;
    float _85 = _67 * _79;
    float3 _212 = float3(_81, _83, _85);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float3(0.0), isnan(_212)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float3(0.0), isnan(_212)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = in.m_31.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _61 * _101;
    float _105 = 1.0 / _103;
    float _107 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _109 = precise::max(_91, _93);
    float _111 = precise::max(_95, _109);
    float _113 = fma(_111, -4.0, 1.0);
    float _115 = floor(_113);
    float _117 = -_115;
    float _119 = _113 + _117;
    float _121 = fma(_119, 0.25, _111);
    float _123 = precise::max(_121, 0.00390625);
    float _125 = 1.0 / _123;
    float _127 = _123 * _105;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = abs(_129);
    float _133 = log2(_131);
    float _135 = _91 * _125;
    float _137 = _93 * _125;
    float _139 = _95 * _125;
    float _141 = _133 * _107;
    float _143 = exp2(_141);
    out.m_34.x = _135;
    out.m_34.y = _137;
    out.m_34.z = _139;
    out.m_34.w = _143;
    return out;
}

