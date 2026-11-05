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
    texture2d<float> fp_t_tcb_C [[id(0)]];
    sampler fp_t_tcb_CSmplr [[id(1)]];
    sampler fp_t_tcb_CSmplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_25 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _128 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_128, float2(0.0), isnan(_128))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_128, float2(0.0), isnan(_128))).x;
    float _57 = in.m_25.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = _49 * _61;
    float _65 = precise::max(_55, _63);
    bool _69 = _65 != 0.0;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    int _80 = 0;
    if (_77)
    {
        _80 = as_type<int>(_65);
    }
    int _82 = _80;
    int _84 = 0;
    if (_77)
    {
        _84 = as_type<int>(_55);
    }
    int _86 = _84;
    int _88 = 0;
    if (_77)
    {
        _88 = 0;
    }
    int _90 = _88;
    int _92 = 0;
    if (_77)
    {
        _92 = 1065353216;
    }
    int _94 = _92;
    if (_77)
    {
        out.m_28.x = as_type<float>(_82);
        out.m_28.y = as_type<float>(_86);
        out.m_28.z = as_type<float>(_90);
        out.m_28.w = as_type<float>(_94);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_28 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _128 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_128, float2(0.0), isnan(_128))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_128, float2(0.0), isnan(_128))).x;
    float _57 = in.m_25.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = _49 * _61;
    float _65 = precise::max(_55, _63);
    bool _69 = _65 != 0.0;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    int _80 = 0;
    if (_77)
    {
        _80 = as_type<int>(_65);
    }
    int _82 = _80;
    int _84 = 0;
    if (_77)
    {
        _84 = as_type<int>(_55);
    }
    int _86 = _84;
    int _88 = 0;
    if (_77)
    {
        _88 = 0;
    }
    int _90 = _88;
    int _92 = 0;
    if (_77)
    {
        _92 = 1065353216;
    }
    int _94 = _92;
    if (_77)
    {
        out.m_28.x = as_type<float>(_82);
        out.m_28.y = as_type<float>(_86);
        out.m_28.z = as_type<float>(_90);
        out.m_28.w = as_type<float>(_94);
        return main0_out_u{as_type<uint4>(out.m_28)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_28)};
}

