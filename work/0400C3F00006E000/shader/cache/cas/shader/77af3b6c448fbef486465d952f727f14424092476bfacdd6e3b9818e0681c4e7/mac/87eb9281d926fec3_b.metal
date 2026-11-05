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
    float4 m_19 [[color(0)]];
    float4 m_21 [[color(1)]];
    float4 m_23 [[color(2)]];
    float4 m_25 [[color(3)]];
    float4 m_27 [[color(4)]];
    float4 m_29 [[color(5)]];
    float4 m_31 [[color(6)]];
    float4 m_33 [[color(7)]];
};

struct main0_in
{
    float4 m_16 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]])
{
    main0_out out = {};
    float _40 = in.m_16.x;
    float _42 = in.m_16.y;
    float _44 = in.m_16.z;
    float _46 = in.m_16.w;
    out.m_19.x = _40;
    out.m_19.y = _42;
    out.m_19.z = _44;
    out.m_19.w = _46;
    out.m_21.x = _40;
    out.m_21.y = _42;
    out.m_21.z = _44;
    out.m_21.w = _46;
    out.m_23.x = _40;
    out.m_23.y = _42;
    out.m_23.z = _44;
    out.m_23.w = _46;
    out.m_25.x = _40;
    out.m_25.y = _42;
    out.m_25.z = _44;
    out.m_25.w = _46;
    out.m_27.x = _40;
    out.m_27.y = _42;
    out.m_27.z = _44;
    out.m_27.w = _46;
    out.m_29.x = _40;
    out.m_29.y = _42;
    out.m_29.z = _44;
    out.m_29.w = _46;
    out.m_31.x = _40;
    out.m_31.y = _42;
    out.m_31.z = _44;
    out.m_31.w = _46;
    out.m_33.x = _40;
    out.m_33.y = _42;
    out.m_33.z = _44;
    out.m_33.w = _46;
    return out;
}

