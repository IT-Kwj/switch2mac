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
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(2)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _34 = as_type<float>(gl_WorkGroupID.x);
    float _36 = as_type<float>(gl_LocalInvocationID.x);
    float _38 = as_type<float>(gl_WorkGroupID.y);
    float _40 = as_type<float>(gl_LocalInvocationID.y);
    int _43 = as_type<int>(_34) << 3;
    int _45 = _43 + as_type<int>(_36);
    int _47 = as_type<int>(_38) << 3;
    int _49 = _47 + as_type<int>(_40);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(int2(_45, _49)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(int2(_45, _49)));
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(0.0), uint2(int2(_45, _49)));
}

