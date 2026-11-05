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
    float4 m_21 [[color(1)]];
};

struct main0_in
{
    float4 m_18 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _28 = gl_FragCoord.w;
    float _30 = in.m_18.z;
    float _32 = gl_FragCoord.w;
    float _34 = _30 * _32;
    float _36 = in.m_18.w;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = 1.0 / _28;
    float _44 = _42 * _34;
    float _46 = _42 * _40;
    float _48 = floor(_44);
    float _50 = floor(_46);
    float _52 = -_48;
    float _54 = _44 + _52;
    float _56 = 0.0 + _54;
    float _58 = precise::clamp(_56, 0.0, 1.0);
    float _60 = -_50;
    float _62 = _46 + _60;
    float _64 = -_54;
    float _66 = _64 + _58;
    float _68 = 0.0 + _62;
    float _70 = precise::clamp(_68, 0.0, 1.0);
    float _72 = fma(_66, 0.5, 0.5);
    float _74 = -_62;
    float _76 = _74 + _70;
    float _78 = fma(_76, 0.5, 0.5);
    out.m_21.x = _72;
    out.m_21.y = _78;
    return out;
}

