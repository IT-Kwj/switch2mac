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
    float4 m_21 [[color(0)]];
};

struct main0_in
{
    float4 m_18 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _28 = gl_FragCoord.w;
    float _30 = in.m_18.x;
    float _32 = gl_FragCoord.w;
    float _34 = _30 * _32;
    float _36 = in.m_18.y;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = 1.0 / _28;
    float _44 = _42 * _34;
    float _46 = _42 * _40;
    float _48 = fma(_44, 2.0, -1.0);
    float _50 = fma(_46, 2.0, -1.0);
    float _52 = abs(_48);
    float _54 = -_52;
    float _56 = _54 + 1.0;
    float _58 = abs(_50);
    float _60 = -_58;
    float _62 = _60 + 1.0;
    float _64 = precise::max(_56, _62);
    float _66 = _64 * 10.0;
    float _68 = precise::clamp(_66, 0.0, 1.0);
    out.m_21.x = 0.0;
    out.m_21.y = 0.0;
    out.m_21.z = _68;
    out.m_21.w = 0.0;
    return out;
}

