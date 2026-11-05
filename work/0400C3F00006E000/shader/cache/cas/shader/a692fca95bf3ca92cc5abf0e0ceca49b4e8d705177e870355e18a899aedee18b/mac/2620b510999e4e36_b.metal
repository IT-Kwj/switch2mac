#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_25 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_FragCoord.x;
    float _34 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _36 = _32 / _34;
    float _38 = gl_FragCoord.y;
    float _40 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _42 = _38 / _40;
    float _44 = (*spvDescriptorSet0.fp_c3)._m0[0].y * (-28.853900909423828125);
    float _46 = _44 * 2.0;
    float _48 = _36 + (-0.5);
    float _50 = _42 + (-0.5);
    float _52 = _48 * _46;
    float _54 = _50 * _46;
    float _56 = exp2(_52);
    float _58 = exp2(_54);
    float _60 = -_56;
    float _62 = _60 + 1.0;
    float _64 = -_58;
    float _66 = _64 + 1.0;
    out.m_25.x = _62;
    out.m_25.y = _66;
    return out;
}

