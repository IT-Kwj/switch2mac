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
    const device _15* cp_s0 [[id(0)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    float _33 = as_type<float>(gl_WorkGroupID.x);
    int _36 = as_type<int>(_33) << 2;
    uint _39 = uint(int(uint(_36) >> uint(2)));
    float _41 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_39)]);
    float _43 = exp2(_41);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_43, _43, _43, _43), uint2(int2(as_type<int>(_33), 0)));
}

