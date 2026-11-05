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
    float4 m_20 [[user(locn0)]];
    float4 m_18 [[user(locn1)]];
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
    float _54 = _50 * _42;
    float _56 = fma(_52, 2.0, -1.0);
    float _58 = fma(_54, 2.0, -1.0);
    float _60 = _56 * _56;
    float _62 = fma(_58, _58, _60);
    float _64 = fma(_62, -2.0, 1.0);
    bool _68 = _62 > 1.0;
    float _70 = _50 * _48;
    float _72 = precise::max(0.0, _64);
    float _74 = _72 * _72;
    bool _76 = !_68;
    float _78 = _76 ? _74 : 0.0;
    float _80 = -_78;
    float _82 = fma(_80, _70, -0.0);
    out.m_23.x = 0.0;
    out.m_23.y = _82;
    out.m_23.z = 0.0;
    out.m_23.w = 0.0;
    return out;
}

