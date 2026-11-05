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
    float4 m_25 [[color(0)]];
    float4 m_27 [[color(1)]];
};

struct main0_in
{
    float4 m_18 [[user(locn0), center_no_perspective]];
    float4 m_22 [[user(locn1), center_no_perspective]];
    float4 m_20 [[user(locn2), center_no_perspective]];
    float4 m_16 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]])
{
    main0_out out = {};
    float _34 = in.m_16.x;
    float _36 = in.m_18.x;
    float _38 = in.m_20.x;
    float _40 = in.m_20.y;
    float _42 = in.m_22.x;
    float _44 = in.m_22.y;
    out.m_25.x = _34;
    out.m_25.y = _36;
    out.m_25.z = _38;
    out.m_27.x = _42;
    out.m_27.y = _40;
    out.m_27.z = _44;
    return out;
}

