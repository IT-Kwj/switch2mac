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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _37 = as_type<float>(gl_WorkGroupID.x);
    float _39 = as_type<float>(gl_LocalInvocationID.x);
    float _41 = as_type<float>(gl_WorkGroupID.y);
    float _43 = as_type<float>(gl_LocalInvocationID.y);
    int _46 = as_type<int>(_37) * 16;
    int _48 = _46 + as_type<int>(_39);
    bool _52 = _48 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _54 = as_type<int>(_41) << 4;
    int _56 = _54 + as_type<int>(_43);
    if (_52)
    {
        return;
    }
    bool _58 = _56 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (_58)
    {
        return;
    }
    int _60 = _56 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _62 = _60 + _48;
    int _64 = _62 << 2;
    uint _67 = uint(int(uint(_64) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_67)] = 0u;
}

