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
    float _36 = in.m_24.z;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_24.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _56 = 1.0 / _34;
    float _58 = _56 * _40;
    float _60 = _56 * _46;
    float _62 = _56 * _52;
    float _64 = abs(_60);
    float _66 = log2(_64);
    float _68 = abs(_62);
    float _70 = log2(_68);
    float _72 = abs(_58);
    float _74 = log2(_72);
    float _76 = _66 * _54;
    float _78 = _70 * _54;
    float _80 = exp2(_76);
    float _82 = _74 * _54;
    float _84 = exp2(_78);
    float _86 = exp2(_82);
    out.m_27.x = _80;
    out.m_27.y = _84;
    out.m_27.z = _86;
    out.m_27.w = 1.0;
    return out;
}

