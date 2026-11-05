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
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _32 = as_type<float>(gl_WorkGroupID.x);
    float _34 = as_type<float>(gl_LocalInvocationID.x);
    float _36 = as_type<float>(gl_WorkGroupID.y);
    float _38 = as_type<float>(gl_LocalInvocationID.y);
    int _41 = as_type<int>(_32) * 8;
    int _43 = _41 + as_type<int>(_34);
    int _45 = as_type<int>(_36) * 8;
    int _47 = _45 + as_type<int>(_38);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(int2(_43, _47)));
    int _49 = _47 * 2;
    int _51 = _43 << 1;
    int _53 = _49 + 1;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(int2(_51, _49)));
    int _55 = _51 + 1;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(int2(_51, _53)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(int2(_55, _49)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(int2(_55, _53)));
}

