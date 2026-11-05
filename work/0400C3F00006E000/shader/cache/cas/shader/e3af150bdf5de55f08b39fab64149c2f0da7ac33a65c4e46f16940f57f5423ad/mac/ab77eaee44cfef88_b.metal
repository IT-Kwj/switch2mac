#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

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
    const device _21* cp_s0 [[id(1)]];
    texture2d<uint, access::read_write> cp_i_tcb_48_r32ui [[id(2)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _41 = as_type<float>(gl_WorkGroupID.x);
    int _44 = as_type<int>(_41) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _46 = _44 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _48 = _46 << 2;
    uint _51 = uint(int(uint(_48) >> uint(2)));
    float _53 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_51)]);
    float _55 = as_type<float>(gl_LocalInvocationID.x);
    float _57 = float(as_type<uint>(_55));
    float _59 = _57 * 0.015625;
    bool _63 = _59 >= _53;
    if (!_63)
    {
        return;
    }
    int2 _118 = int2(as_type<int>(_55), as_type<int>(_41));
    if (all(uint2(_118) < uint2(spvDescriptorSet0.cp_i_tcb_48_r32ui.get_width(), spvDescriptorSet0.cp_i_tcb_48_r32ui.get_height())))
    {
        uint _131 = spvDescriptorSet0.cp_i_tcb_48_r32ui.atomic_fetch_add(uint2(_118), 1u).x;
    }
    int _65 = int(0u);
}

