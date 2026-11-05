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
    texture2d<float> cp_t_tcb_C [[id(5)]];
    sampler cp_t_tcb_CSmplr [[id(6)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(7)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _241, thread const int& _242, constant _10& support_buffer)
{
    int _245 = 1 + _242;
    float _247 = support_buffer._m5[_245].x;
    bool _251 = _247 == 1.0;
    if (_251)
    {
        return _241;
    }
    float _253 = float(_241);
    float _255 = _253 * _247;
    int _257 = int(_255);
    return _257;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _42 = as_type<float>(gl_WorkGroupID.x);
    float _44 = as_type<float>(gl_LocalInvocationID.x);
    float _46 = as_type<float>(gl_WorkGroupID.y);
    float _48 = as_type<float>(gl_LocalInvocationID.y);
    int _50 = as_type<int>(_42) << 3;
    int _52 = _50 + as_type<int>(_44);
    int _54 = as_type<int>(_46) << 2;
    int _56 = _54 + as_type<int>(_48);
    int _58 = _52;
    int _60 = 0;
    int _62 = _38(_58, _60, (*spvDescriptorSet0.support_buffer));
    int _64 = _56;
    int _66 = 0;
    int _68 = _38(_64, _66, (*spvDescriptorSet0.support_buffer));
    float3 _72 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_62, _68)), 0).xyz;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    int _80 = _52;
    int _82 = 1;
    int _84 = _38(_80, _82, (*spvDescriptorSet0.support_buffer));
    int _86 = _56;
    int _88 = 1;
    int _90 = _38(_86, _88, (*spvDescriptorSet0.support_buffer));
    float3 _92 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(int2(_84, _90)), 0).xyz;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    int _100 = _52;
    int _102 = 2;
    int _104 = _38(_100, _102, (*spvDescriptorSet0.support_buffer));
    int _106 = _56;
    int _108 = 2;
    int _110 = _38(_106, _108, (*spvDescriptorSet0.support_buffer));
    float3 _112 = spvDescriptorSet0.cp_t_tcb_C.read(uint2(int2(_104, _110)), 0).xyz;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _74 + _94;
    float _122 = _76 + _96;
    float _124 = _78 + _98;
    float _126 = _114 + _120;
    float _128 = _116 + _122;
    float _130 = _118 + _124;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_126, _128, _130, 1.0), uint2(int2(_52, _56)));
}

