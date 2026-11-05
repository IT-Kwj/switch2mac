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

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _37 = as_type<float>(gl_WorkGroupID.x);
    float _39 = as_type<float>(gl_LocalInvocationID.x);
    int _42 = as_type<int>(_37) << 5;
    int _44 = _42 + as_type<int>(_39);
    int _46 = _44 * 136;
    int _48 = _46 + 4;
    uint _51 = uint(int(uint(_46) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_51)] = 0u;
    uint _53 = uint(int(uint(_48) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_53)] = 0u;
}

