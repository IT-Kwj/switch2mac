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
    float4 m_29 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _36 = gl_FragCoord.w;
    float _38 = in.m_23.x;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_23.y;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = 1.0 / _36;
    float _52 = _50 * _42;
    float _54 = _50 * _48;
    float2 _105 = float2(_52, _54);
    float4 _57 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_105, float2(0.0), isnan(_105)), int2(0), component::x).xyzw;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float _65 = _57.w;
    float _67 = precise::max(_59, _61);
    float _69 = precise::max(_63, _65);
    float _71 = precise::max(_67, _69);
    out.gl_FragDepth = _54;
    out.m_29.x = _71;
    return out;
}

