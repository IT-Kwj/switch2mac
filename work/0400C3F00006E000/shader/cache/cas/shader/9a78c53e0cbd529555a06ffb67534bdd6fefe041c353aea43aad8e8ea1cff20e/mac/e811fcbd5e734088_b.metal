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
    float _48 = 1.0 / _34;
    float _50 = _48 * _40;
    float _52 = _48 * _46;
    float _54 = abs(_50);
    float _56 = -_54;
    float _58 = _56 + 1.0;
    float _60 = abs(_52);
    float _62 = -_60;
    float _64 = _62 + 1.0;
    float _66 = fma(_58, _64, -0.5);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = _68 * 2.0;
    float _72 = _70 * _70;
    float _74 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _76 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    out.m_27.x = _74;
    out.m_27.y = _76;
    out.m_27.z = _78;
    out.m_27.w = 1.0;
    return out;
}

