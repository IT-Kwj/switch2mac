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
    constant _16* cp_c3 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    device _21* cp_s1 [[id(2)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _39 = as_type<float>(gl_WorkGroupID.x);
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    int _44 = as_type<int>(_39) * 64;
    int _46 = _44 + as_type<int>(_41);
    bool _50 = _46 != 0;
    bool _52 = uint(_46) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (!_50)
    {
        (*spvDescriptorSet0.cp_s0)._m0[0] = 0u;
    }
    if (_52)
    {
        return;
    }
    int _54 = _46 << 2;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_57)] = 0u;
}

