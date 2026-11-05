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

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _36 = as_type<float>(gl_WorkGroupID.x);
    float _38 = as_type<float>(gl_LocalInvocationID.x);
    int _41 = as_type<int>(_36) * 8;
    int _43 = _41 + as_type<int>(_38);
    int _45 = _43 * 4;
    uint _48 = uint(int(uint(_43) >> uint(2)));
    int _50 = 12 & _45;
    int _52 = int(_48) << 4;
    int _54 = _52 + _50;
    uint _56 = uint(int(uint(_54) >> uint(2)));
    uint _58 = uint(int(uint(int(_56)) >> uint(2)));
    int _60 = int(_56) & 3;
    float _62 = (*spvDescriptorSet0.cp_c3)._m0[int(_58)][_60];
    int _64 = _54 + 64;
    uint _66 = uint(int(uint(_64) >> uint(2)));
    uint _68 = uint(int(uint(int(_66)) >> uint(2)));
    int _70 = int(_66) & 3;
    float _72 = (*spvDescriptorSet0.cp_c3)._m0[int(_68)][_70];
    int3 _143 = int3(_43, 0, 0);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_62, 0.0, 0.0, 0.0), uint2(_143.xy), uint(_143.z));
    int3 _150 = int3(_43, 0, 1);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_72, 0.0, 0.0, 0.0), uint2(_150.xy), uint(_150.z));
}

