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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    (*spvDescriptorSet0.cp_s0)._m0[0] = 1000u;
    (*spvDescriptorSet0.cp_s0)._m0[1] = 4294966296u;
    (*spvDescriptorSet0.cp_s0)._m0[2] = 0u;
    (*spvDescriptorSet0.cp_s0)._m0[3] = 0u;
}

