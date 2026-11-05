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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _41;
    float _51 = _49 * _47;
    bool _55 = _51 != 0.0;
    bool _57 = isnan(_51);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = !_63;
    if (!_65)
    {
        float _67 = in.m_31.x;
        float _69 = gl_FragCoord.w;
        float _71 = _67 * _69;
        float _73 = in.m_31.y;
        float _75 = gl_FragCoord.w;
        float _77 = _73 * _75;
        float _79 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _81 = fma(_51, _79, 1.0);
        float _83 = log2(_81);
        float _85 = _83 + (-1.0);
        float _87 = _49 * _71;
        float _89 = _49 * _77;
        float2 _196 = float2(_87, _89);
        float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_196, float2(0.0), isnan(_196)), level(_85)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_196, float2(0.0), isnan(_196)), level(_85)).xyz;
        float _95 = _93.x;
        float _97 = _93.y;
        float _99 = _93.z;
        float _101 = in.m_29.x;
        float _103 = gl_FragCoord.w;
        float _105 = _101 * _103;
        float _107 = in.m_29.y;
        float _109 = gl_FragCoord.w;
        float _111 = _107 * _109;
        float _113 = 0.0 + _83;
        float _115 = precise::clamp(_113, 0.0, 1.0);
        float _117 = _49 * _105;
        float _119 = _49 * _111;
        float _121 = fma(_119, _115, _117);
        out.m_34.x = _95;
        out.m_34.y = _97;
        out.m_34.z = _99;
        out.m_34.w = _121;
        return out;
    }
    discard_fragment();
    return out;
}

