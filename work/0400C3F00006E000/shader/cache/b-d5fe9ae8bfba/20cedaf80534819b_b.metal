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

struct spvDescriptorSetBuffer0
{
    texture2d<float, access::write> cp_i_tcb_48_ [[id(0)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    float _30 = as_type<float>(gl_LocalInvocationID.x);
    float _32 = as_type<float>(gl_WorkGroupID.x);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(int2(as_type<int>(_30), as_type<int>(_32))));
}

