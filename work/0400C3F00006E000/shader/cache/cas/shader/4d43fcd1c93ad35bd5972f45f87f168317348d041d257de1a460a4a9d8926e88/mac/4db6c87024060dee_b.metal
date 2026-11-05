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

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _34 = as_type<float>(gl_LocalInvocationID.x);
    int _37 = as_type<int>(_34) << 4;
    uint _40 = uint(int(uint(_37) >> uint(2)));
    uint _42 = uint(int(uint(int(_40)) >> uint(2)));
    int _44 = int(_40) & 3;
    float _46 = (*spvDescriptorSet0.cp_c3)._m0[int(_42)][_44];
    int _48 = int(_40) + 1;
    uint _50 = uint(int(uint(_48) >> uint(2)));
    int _52 = _48 & 3;
    float _54 = (*spvDescriptorSet0.cp_c3)._m0[int(_50)][_52];
    int _56 = _37 + 8;
    uint _58 = uint(int(uint(_56) >> uint(2)));
    uint _60 = uint(int(uint(int(_58)) >> uint(2)));
    int _62 = int(_58) & 3;
    float _64 = (*spvDescriptorSet0.cp_c3)._m0[int(_60)][_62];
    int _66 = int(_58) + 1;
    uint _68 = uint(int(uint(_66) >> uint(2)));
    int _70 = _66 & 3;
    float _72 = (*spvDescriptorSet0.cp_c3)._m0[int(_68)][_70];
    int3 _149 = int3(0, 0, as_type<int>(_34));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_46, _54, _64, _72), uint2(_149.xy), uint(_149.z));
}

