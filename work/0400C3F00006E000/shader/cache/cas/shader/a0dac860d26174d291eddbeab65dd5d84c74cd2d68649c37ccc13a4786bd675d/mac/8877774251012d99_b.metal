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
    float _36 = 1.0 / _28;
    float _38 = _36 * _34;
    out.m_21.x = _38;
    out.m_21.y = 0.0;
    out.m_21.z = 0.0;
    out.m_21.w = 1.0;
    return out;
}

