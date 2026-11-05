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
    texture2d_array<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
};

struct main0_out
{
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.z;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_23.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _33;
    float _55 = _53 * _39;
    float _57 = _53 * _45;
    float _59 = _53 * _51;
    float _61 = rint(_55);
    float _63 = precise::max(_61, 0.0);
    uint _66 = uint(_63);
    uint _68 = clamp(_66, 0u, 65535u);
    float3 _145 = float3(_59, _57, float(int(_68)));
    float3 _150 = select(_145, float3(0.0), isnan(_145));
    float4 _71 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _150.xy, uint(rint(_150.z)), int2(0), component::x).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    float _81 = precise::max(_73, _75);
    float _83 = precise::max(_77, _79);
    float _85 = precise::max(_81, _83);
    out.gl_FragDepth = _85;
    return out;
}

