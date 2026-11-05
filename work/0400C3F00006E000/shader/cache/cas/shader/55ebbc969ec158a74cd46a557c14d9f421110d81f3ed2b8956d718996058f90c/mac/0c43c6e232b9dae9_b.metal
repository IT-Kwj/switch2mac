#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _34(thread const int& _136, thread const int& _137, constant _10& support_buffer)
{
    int _140 = 1 + _137;
    float _142 = support_buffer._m5[_140].x;
    bool _146 = _142 == 1.0;
    if (_146)
    {
        return _136;
    }
    float _148 = float(_136);
    float _150 = _148 * _142;
    int _152 = int(_150);
    return _152;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _38 = as_type<float>(gl_WorkGroupID.x);
    float _40 = as_type<float>(gl_LocalInvocationID.x);
    float _42 = as_type<float>(gl_WorkGroupID.y);
    float _44 = as_type<float>(gl_LocalInvocationID.y);
    int _46 = as_type<int>(_38) << 3;
    int _48 = _46 + as_type<int>(_40);
    int _50 = as_type<int>(_42) << 2;
    int _52 = _50 + as_type<int>(_44);
    int _54 = _48;
    int _56 = 0;
    int _58 = _34(_54, _56, (*spvDescriptorSet0.support_buffer));
    int _60 = _52;
    int _62 = 0;
    int _64 = _34(_60, _62, (*spvDescriptorSet0.support_buffer));
    float4 _67 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_58, _64)), 0).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_69, _71, _73, _75), uint2(int2(_48, _52)));
}

