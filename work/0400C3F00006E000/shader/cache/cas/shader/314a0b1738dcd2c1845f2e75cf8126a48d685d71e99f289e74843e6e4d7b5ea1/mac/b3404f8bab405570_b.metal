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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _158 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_158, float2(0.0), isnan(_158))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_158, float2(0.0), isnan(_158))).x;
    float2 _169 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_169, float2(0.0), isnan(_169))).x;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, _81, _83);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    bool _91 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _93 = !_91;
    float _95 = _93 ? _87 : 0.0;
    float _97 = precise::max(_67, _95);
    bool _99 = _97 != 0.0;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    int _110 = 0;
    if (_107)
    {
        _110 = as_type<int>(_97);
    }
    int _112 = _110;
    int _114 = 0;
    if (_107)
    {
        _114 = as_type<int>(_67);
    }
    int _116 = _114;
    int _118 = 0;
    if (_107)
    {
        _118 = 0;
    }
    int _120 = _118;
    int _122 = 0;
    if (_107)
    {
        _122 = 1065353216;
    }
    int _124 = _122;
    if (_107)
    {
        out.m_38.x = as_type<float>(_112);
        out.m_38.y = as_type<float>(_116);
        out.m_38.z = as_type<float>(_120);
        out.m_38.w = as_type<float>(_124);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _158 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_158, float2(0.0), isnan(_158))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_158, float2(0.0), isnan(_158))).x;
    float2 _169 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_169, float2(0.0), isnan(_169))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_169, float2(0.0), isnan(_169))).x;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, _81, _83);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    bool _91 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _93 = !_91;
    float _95 = _93 ? _87 : 0.0;
    float _97 = precise::max(_67, _95);
    bool _99 = _97 != 0.0;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    int _110 = 0;
    if (_107)
    {
        _110 = as_type<int>(_97);
    }
    int _112 = _110;
    int _114 = 0;
    if (_107)
    {
        _114 = as_type<int>(_67);
    }
    int _116 = _114;
    int _118 = 0;
    if (_107)
    {
        _118 = 0;
    }
    int _120 = _118;
    int _122 = 0;
    if (_107)
    {
        _122 = 1065353216;
    }
    int _124 = _122;
    if (_107)
    {
        out.m_38.x = as_type<float>(_112);
        out.m_38.y = as_type<float>(_116);
        out.m_38.z = as_type<float>(_120);
        out.m_38.w = as_type<float>(_124);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_38)};
}

