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

struct main0_out
{
    float4 m_23 [[color(0)]];
};

struct main0_in
{
    float4 m_20 [[user(locn1)]];
    float4 m_18 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _30 = gl_FragCoord.w;
    float _32 = in.m_18.y;
    float _34 = gl_FragCoord.w;
    float _36 = _32 * _34;
    float _38 = in.m_18.x;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_20.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = 1.0 / _30;
    float _52 = _50 * _36;
    float _54 = _52 * 7.0;
    float _56 = floor(_54);
    float _58 = -_56;
    float _60 = _54 + _58;
    float _62 = precise::max(_60, 0.20000000298023223876953125);
    float _64 = _50 * _42;
    float _66 = precise::min(_62, 0.300000011920928955078125);
    float _68 = _64 + (-0.5);
    float _70 = abs(_68);
    float _72 = _70 + _66;
    float _74 = precise::clamp(_72, 0.0, 1.0);
    float _76 = _50 * _48;
    float _78 = -_74;
    float _80 = _78 + 1.0;
    float _82 = _80 * _76;
    float _84 = precise::max(_82, 9.9999997473787516355514526367188e-06);
    float _86 = precise::min(_84, 1.0);
    out.m_23.x = 0.0;
    out.m_23.y = 0.0;
    out.m_23.z = 0.0;
    out.m_23.w = _86;
    return out;
}

