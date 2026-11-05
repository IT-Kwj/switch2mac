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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float _53 = _49 + 9.9999997473787516355514526367188e-05;
    float _55 = precise::clamp(_53, 0.0, 1.0);
    float _57 = _51 + 9.9999997473787516355514526367188e-05;
    float _59 = precise::clamp(_57, 0.0, 1.0);
    float2 _106 = float2(_55, _59);
    float _61 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_106, float2(0.0), isnan(_106)), int2(0), component::x).w;
    out.m_26.x = _61;
    return out;
}

