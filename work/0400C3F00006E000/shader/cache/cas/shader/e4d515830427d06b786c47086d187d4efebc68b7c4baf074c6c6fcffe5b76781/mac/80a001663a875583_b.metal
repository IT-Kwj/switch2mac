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
    float4 m_24 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_24.x;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.y;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_24.z;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_24.w;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _34;
    float _62 = _60 * _40;
    float _64 = _60 * _46;
    float _66 = _60 * _52;
    float _68 = _60 * _58;
    float _70 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _72 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    out.m_27.x = _70;
    out.m_27.y = _72;
    out.m_27.z = _74;
    out.m_27.w = _76;
    return out;
}

