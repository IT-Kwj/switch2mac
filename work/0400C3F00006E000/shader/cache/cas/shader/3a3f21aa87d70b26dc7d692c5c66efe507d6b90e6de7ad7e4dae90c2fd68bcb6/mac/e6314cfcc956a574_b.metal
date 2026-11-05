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
    float4 m_16 [[color(0)]];
};

fragment main0_out main0()
{
    main0_out out = {};
    out.m_16.x = 0.0;
    out.m_16.y = 0.0;
    out.m_16.z = 0.0;
    out.m_16.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_16 [[color(0)]];
};

fragment main0_out_u main0_u()
{
    main0_out out = {};
    out.m_16.x = 0.0;
    out.m_16.y = 0.0;
    out.m_16.z = 0.0;
    out.m_16.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_16)};
}

