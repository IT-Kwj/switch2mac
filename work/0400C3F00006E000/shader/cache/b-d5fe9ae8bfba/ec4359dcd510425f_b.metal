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
    float4 m_18 [[user(locn0), center_no_perspective]];
    float4 m_16 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]])
{
    main0_out out = {};
    float _28 = in.m_16.x;
    float _30 = in.m_18.x;
    out.m_21.x = _28;
    out.m_21.y = _30;
    return out;
}

