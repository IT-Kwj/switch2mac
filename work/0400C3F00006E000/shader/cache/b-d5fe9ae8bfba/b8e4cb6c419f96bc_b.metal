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
    float4 m_22 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _29 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _31 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _33 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _35 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    out.m_22.x = _29;
    out.m_22.y = _31;
    out.m_22.z = _33;
    out.m_22.w = _35;
    return out;
}

