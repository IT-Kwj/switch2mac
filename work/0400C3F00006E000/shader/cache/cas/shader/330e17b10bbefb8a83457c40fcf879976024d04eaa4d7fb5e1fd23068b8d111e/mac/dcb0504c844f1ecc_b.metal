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
};

struct main0_in
{
    float4 m_16 [[user(locn0), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]])
{
    main0_out out = {};
    float _26 = in.m_16.x;
    out.m_19.x = _26;
    return out;
}


struct main0_out_u
{
    uint4 m_19 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]])
{
    main0_out out = {};
    float _26 = in.m_16.x;
    out.m_19.x = _26;
    return main0_out_u{as_type<uint4>(out.m_19)};
}

