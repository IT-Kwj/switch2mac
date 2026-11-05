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
    float4 m_29 [[color(2)]];
    float4 m_31 [[color(3)]];
};

struct main0_in
{
    float4 m_16 [[user(locn0), center_no_perspective]];
    float4 m_18 [[user(locn1), center_no_perspective]];
    float4 m_20 [[user(locn2), center_no_perspective]];
    float4 m_22 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]])
{
    main0_out out = {};
    float _38 = in.m_16.x;
    float _40 = in.m_16.y;
    float _42 = in.m_16.z;
    float _44 = in.m_16.w;
    float _46 = in.m_18.x;
    float _48 = in.m_18.y;
    float _50 = in.m_18.z;
    float _52 = in.m_18.w;
    float _54 = in.m_20.x;
    float _56 = in.m_20.y;
    float _58 = in.m_20.z;
    float _60 = in.m_20.w;
    float _62 = in.m_22.x;
    float _64 = in.m_22.y;
    float _66 = in.m_22.z;
    float _68 = in.m_22.w;
    out.m_25.x = _38;
    out.m_25.y = _40;
    out.m_25.z = _42;
    out.m_25.w = _44;
    out.m_27.x = _46;
    out.m_27.y = _48;
    out.m_27.z = _50;
    out.m_27.w = _52;
    out.m_29.x = _54;
    out.m_29.y = _56;
    out.m_29.z = _58;
    out.m_29.w = _60;
    out.m_31.x = _62;
    out.m_31.y = _64;
    out.m_31.z = _66;
    out.m_31.w = _68;
    return out;
}

