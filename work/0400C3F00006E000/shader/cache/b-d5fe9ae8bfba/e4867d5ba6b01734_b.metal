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
    texture2d<float> cp_t_tcb_A [[id(3)]];
    sampler cp_t_tcb_ASmplr [[id(4)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(5)]];
};

static inline __attribute__((always_inline))
int _36(thread const int& _187, thread const int& _188, constant _10& support_buffer)
{
    int _191 = 1 + _188;
    float _193 = support_buffer._m5[_191].x;
    bool _197 = _193 == 1.0;
    if (_197)
    {
        return _187;
    }
    float _199 = float(_187);
    float _201 = _199 * _193;
    int _203 = int(_201);
    return _203;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _40 = as_type<float>(gl_WorkGroupID.x);
    float _42 = as_type<float>(gl_LocalInvocationID.x);
    float _44 = as_type<float>(gl_WorkGroupID.y);
    float _46 = as_type<float>(gl_LocalInvocationID.y);
    int _48 = as_type<int>(_40) << 3;
    int _50 = _48 + as_type<int>(_42);
    int _52 = as_type<int>(_44) << 2;
    int _54 = _52 + as_type<int>(_46);
    int _56 = _50;
    int _58 = 0;
    int _60 = _36(_56, _58, (*spvDescriptorSet0.support_buffer));
    int _62 = _54;
    int _64 = 0;
    int _66 = _36(_62, _64, (*spvDescriptorSet0.support_buffer));
    float3 _70 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_60, _66)), 0).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    int _78 = _50;
    int _80 = 1;
    int _82 = _36(_78, _80, (*spvDescriptorSet0.support_buffer));
    int _84 = _54;
    int _86 = 1;
    int _88 = _36(_84, _86, (*spvDescriptorSet0.support_buffer));
    float3 _90 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(int2(_82, _88)), 0).xyz;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _72 + _92;
    float _100 = _74 + _94;
    float _102 = _76 + _96;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_98, _100, _102, 1.0), uint2(int2(_50, _54)));
}

