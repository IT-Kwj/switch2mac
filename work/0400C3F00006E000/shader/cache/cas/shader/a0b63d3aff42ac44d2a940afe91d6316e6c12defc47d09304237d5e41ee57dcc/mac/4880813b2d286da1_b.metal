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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float2 _111 = float2(0.0);
    float _39 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_111, float2(0.0), isnan(_111))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_111, float2(0.0), isnan(_111))).x;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.w;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _41;
    float _51 = _49 * _47;
    float _53 = _39 * 0.00048828125;
    bool _57 = _53 > 9.9999999392252902907785028219223e-09;
    float _59 = 0.0;
    float _61 = 0.0;
    if (_57)
    {
        float _63 = 1.0 / _39;
        _59 = _63;
    }
    float _65 = _59;
    float _67 = 0.0;
    if (!_57)
    {
        _67 = 9999999.0;
    }
    float _69 = _67;
    float _71 = _69;
    if (_57)
    {
        float _73 = _65 * 2048.0;
        _71 = _73;
    }
    float _75 = _71;
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _79 = precise::max(_77, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _81 = precise::min(_79, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    bool _83 = _81 >= _51;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan(_51);
    bool _91 = _87 || _89;
    float _93 = -_51;
    float _95 = _81 + _93;
    if (!_91)
    {
        _61 = (*spvDescriptorSet0.fp_c3)._m0[0].y;
    }
    float _97 = _61;
    float _99 = _97;
    if (_91)
    {
        _99 = (*spvDescriptorSet0.fp_c3)._m0[0].w;
    }
    float _101 = _99;
    float _103 = fma(_95, _101, _51);
    float _105 = precise::max(_103, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _107 = precise::min(_105, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    out.m_32.x = _53;
    out.m_32.y = _53;
    out.m_32.z = _53;
    out.m_32.w = _107;
    return out;
}

