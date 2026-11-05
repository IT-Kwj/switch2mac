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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_29 [[color(0)]];
    float4 m_31 [[color(1)]];
    float4 m_33 [[color(2)]];
    float4 m_35 [[color(3)]];
};

struct main0_in
{
    float4 m_22 [[user(locn0), center_no_perspective]];
    float4 m_24 [[user(locn1), center_no_perspective]];
    float4 m_26 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _42 = in.m_22.x;
    float _44 = in.m_22.y;
    float _46 = in.m_22.z;
    float _48 = in.m_22.w;
    float _50 = in.m_24.x;
    float _52 = in.m_24.y;
    float _54 = in.m_24.z;
    float _56 = in.m_24.w;
    float _58 = in.m_26.x;
    float _60 = in.m_26.y;
    float _62 = in.m_26.z;
    float _64 = in.m_26.w;
    out.m_29.x = _42;
    out.m_29.y = _44;
    out.m_29.z = _46;
    out.m_29.w = _48;
    out.m_31.x = _50;
    out.m_31.y = _52;
    out.m_31.z = _54;
    out.m_31.w = _56;
    out.m_33.x = _58;
    out.m_33.y = _60;
    out.m_33.z = _62;
    out.m_33.w = _64;
    out.m_35.x = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    out.m_35.y = (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_35.z = (*spvDescriptorSet0.fp_c3)._m0[0].z;
    out.m_35.w = (*spvDescriptorSet0.fp_c3)._m0[0].w;
    return out;
}

