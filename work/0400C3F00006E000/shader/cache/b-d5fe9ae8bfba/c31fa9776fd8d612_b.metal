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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _31 = as_type<float>(gl_WorkGroupID.x);
    float _33 = as_type<float>(gl_LocalInvocationID.x);
    int _36 = as_type<int>(_31) * 64;
    int _38 = _36 + as_type<int>(_33);
    int _40 = _38 << 3;
    uint _43 = uint(int(uint(_40) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_43)] = 0u;
    int _45 = _40 + 4;
    uint _47 = uint(int(uint(_45) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_47)] = 0u;
}

