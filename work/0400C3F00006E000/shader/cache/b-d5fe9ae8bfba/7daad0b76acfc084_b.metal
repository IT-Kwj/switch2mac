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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _148 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_148, float2(0.0), isnan(_148))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_148, float2(0.0), isnan(_148))).x;
    float _65 = in.m_31.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    bool _83 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_83)
    {
        discard_fragment();
    }
    float _85 = fma(_63, _77, _79);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    if (_83)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    bool _89 = _87 != 0.0;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    int _100 = 0;
    if (_97)
    {
        _100 = as_type<int>(_87);
    }
    int _102 = _100;
    int _104 = 0;
    if (_97)
    {
        _104 = 0;
    }
    int _106 = _104;
    int _108 = 0;
    if (_97)
    {
        _108 = 0;
    }
    int _110 = _108;
    int _112 = 0;
    if (_97)
    {
        _112 = 1065353216;
    }
    int _114 = _112;
    if (_97)
    {
        out.m_36.x = as_type<float>(_102);
        out.m_36.y = as_type<float>(_106);
        out.m_36.z = as_type<float>(_110);
        out.m_36.w = as_type<float>(_114);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _148 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_148, float2(0.0), isnan(_148))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_148, float2(0.0), isnan(_148))).x;
    float _65 = in.m_31.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    bool _83 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_83)
    {
        discard_fragment();
    }
    float _85 = fma(_63, _77, _79);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    if (_83)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    bool _89 = _87 != 0.0;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    int _100 = 0;
    if (_97)
    {
        _100 = as_type<int>(_87);
    }
    int _102 = _100;
    int _104 = 0;
    if (_97)
    {
        _104 = 0;
    }
    int _106 = _104;
    int _108 = 0;
    if (_97)
    {
        _108 = 0;
    }
    int _110 = _108;
    int _112 = 0;
    if (_97)
    {
        _112 = 1065353216;
    }
    int _114 = _112;
    if (_97)
    {
        out.m_36.x = as_type<float>(_102);
        out.m_36.y = as_type<float>(_106);
        out.m_36.z = as_type<float>(_110);
        out.m_36.w = as_type<float>(_114);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

