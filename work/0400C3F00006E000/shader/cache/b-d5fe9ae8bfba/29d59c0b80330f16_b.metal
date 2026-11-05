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
};

struct main0_out
{
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_24.x;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = 1.0 / _34;
    float _44 = _42 * _40;
    out.m_27.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_27.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_27.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_27.w = _44;
    return out;
}

