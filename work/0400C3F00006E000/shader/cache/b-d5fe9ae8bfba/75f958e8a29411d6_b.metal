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
    float4 m_22 [[color(5)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_22.x = (*spvDescriptorSet0.fp_c3)._m0[10].x;
    out.m_22.y = (*spvDescriptorSet0.fp_c3)._m0[10].y;
    out.m_22.z = (*spvDescriptorSet0.fp_c3)._m0[10].z;
    out.m_22.w = (*spvDescriptorSet0.fp_c3)._m0[10].w;
    return out;
}

