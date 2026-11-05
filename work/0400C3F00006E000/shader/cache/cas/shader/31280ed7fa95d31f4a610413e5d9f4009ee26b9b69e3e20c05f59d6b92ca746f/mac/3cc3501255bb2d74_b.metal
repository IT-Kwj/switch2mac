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
    float4 m_29 [[color(0)]];
};

struct main0_in
{
    float4 m_26 [[user(locn0), flat]];
    float4 m_24 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _36 = gl_FragCoord.w;
    float _38 = in.m_24.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_26.x;
    float _52 = 1.0 / _36;
    float _54 = _52 * _42;
    float _56 = _54 * _54;
    float _58 = -_54;
    float _60 = _58 + 2.0;
    float _62 = _56 * _60;
    float _64 = _52 * _48;
    float _66 = fma(_62, 10.0, -9.0);
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = fma(_64, 2.0, -1.0);
    float _72 = fma(_54, 100.0, -75.0);
    float _74 = precise::clamp(_72, 0.0, 1.0);
    float _76 = -_68;
    float _78 = _76 + 1.0;
    float _80 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _82 = _62 * _78;
    float _84 = abs(_70);
    float _86 = fma(_84, -10.0, 10.0);
    float _88 = precise::clamp(_86, 0.0, 1.0);
    float _90 = _82 * _50;
    float _92 = _88 * _90;
    out.m_29.x = 0.0;
    out.m_29.y = _92;
    out.m_29.z = 0.0;
    out.m_29.w = _80;
    return out;
}

