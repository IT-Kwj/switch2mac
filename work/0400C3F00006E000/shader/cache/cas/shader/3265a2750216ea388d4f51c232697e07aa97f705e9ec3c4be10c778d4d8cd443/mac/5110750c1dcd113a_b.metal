#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    float _59 = _55 + 9.9999997473787516355514526367188e-05;
    float _61 = precise::clamp(_59, 0.0, 1.0);
    float _63 = _57 + 9.9999997473787516355514526367188e-05;
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float2 _137 = float2(_61, _65);
    float _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_137, float2(0.0), isnan(_137)), int2(0), component::x).w;
    float _69 = -_67;
    float _71 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    bool _75 = _67 != 1.0;
    bool _77 = isnan(_67);
    bool _79 = _75 || _77;
    bool _81 = isnan(1.0);
    bool _83 = _79 || _81;
    float _85 = 1.0 / _71;
    float _87 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _89 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[0].w, _87);
    int _92 = _83 ? as_type<int>(_89) : 1065353216;
    out.m_32.x = as_type<float>(_92);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float _59 = _55 + 9.9999997473787516355514526367188e-05;
    float _61 = precise::clamp(_59, 0.0, 1.0);
    float _63 = _57 + 9.9999997473787516355514526367188e-05;
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float2 _137 = float2(_61, _65);
    float _67 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_137, float2(0.0), isnan(_137)), int2(0), component::x).w;
    float _69 = -_67;
    float _71 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    bool _75 = _67 != 1.0;
    bool _77 = isnan(_67);
    bool _79 = _75 || _77;
    bool _81 = isnan(1.0);
    bool _83 = _79 || _81;
    float _85 = 1.0 / _71;
    float _87 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _89 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[0].w, _87);
    int _92 = _83 ? as_type<int>(_89) : 1065353216;
    out.m_32.x = as_type<float>(_92);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

