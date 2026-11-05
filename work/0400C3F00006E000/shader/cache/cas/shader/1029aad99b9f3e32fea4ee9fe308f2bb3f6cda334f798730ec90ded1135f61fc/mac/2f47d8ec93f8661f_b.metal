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
    float4 m_18 [[color(1)]];
    float4 m_20 [[color(2)]];
    float4 m_22 [[color(3)]];
    float4 m_24 [[color(4)]];
    float4 m_26 [[color(5)]];
};

fragment main0_out main0()
{
    main0_out out = {};
    out.m_16.x = 1.0;
    out.m_16.y = 0.0;
    out.m_16.z = 0.0;
    out.m_16.w = 1.0;
    out.m_18.x = 1.0;
    out.m_18.y = 0.0;
    out.m_18.z = 0.0;
    out.m_18.w = 1.0;
    out.m_20.x = 1.0;
    out.m_20.y = 0.0;
    out.m_20.z = 0.0;
    out.m_20.w = 1.0;
    out.m_22.x = 1.0;
    out.m_22.y = 0.0;
    out.m_22.z = 0.0;
    out.m_22.w = 1.0;
    out.m_24.x = 1.0;
    out.m_24.y = 0.0;
    out.m_24.z = 0.0;
    out.m_24.w = 1.0;
    out.m_26.x = 1.0;
    out.m_26.y = 0.0;
    out.m_26.z = 0.0;
    out.m_26.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_16 [[color(0)]];
    uint4 m_18 [[color(1)]];
    uint4 m_20 [[color(2)]];
    uint4 m_22 [[color(3)]];
    uint4 m_24 [[color(4)]];
    uint4 m_26 [[color(5)]];
};

fragment main0_out_u main0_u()
{
    main0_out out = {};
    out.m_16.x = 1.0;
    out.m_16.y = 0.0;
    out.m_16.z = 0.0;
    out.m_16.w = 1.0;
    out.m_18.x = 1.0;
    out.m_18.y = 0.0;
    out.m_18.z = 0.0;
    out.m_18.w = 1.0;
    out.m_20.x = 1.0;
    out.m_20.y = 0.0;
    out.m_20.z = 0.0;
    out.m_20.w = 1.0;
    out.m_22.x = 1.0;
    out.m_22.y = 0.0;
    out.m_22.z = 0.0;
    out.m_22.w = 1.0;
    out.m_24.x = 1.0;
    out.m_24.y = 0.0;
    out.m_24.z = 0.0;
    out.m_24.w = 1.0;
    out.m_26.x = 1.0;
    out.m_26.y = 0.0;
    out.m_26.z = 0.0;
    out.m_26.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_16), as_type<uint4>(out.m_18), as_type<uint4>(out.m_20), as_type<uint4>(out.m_22), as_type<uint4>(out.m_24), as_type<uint4>(out.m_26)};
}

