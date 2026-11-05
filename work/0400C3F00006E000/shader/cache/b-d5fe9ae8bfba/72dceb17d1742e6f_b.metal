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

struct _15
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _15* cp_s0 [[id(0)]];
    device _15* cp_s1 [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _33 = as_type<float>(gl_WorkGroupID.x);
    float _35 = as_type<float>(gl_LocalInvocationID.x);
    int _38 = as_type<int>(_33) * 64;
    int _40 = _38 + as_type<int>(_35);
    bool _44 = _40 != 0;
    int _46 = _40 << 2;
    if (!_44)
    {
        (*spvDescriptorSet0.cp_s0)._m0[0] = 0u;
    }
    uint _49 = uint(int(uint(_46) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_49)] = 0u;
}

