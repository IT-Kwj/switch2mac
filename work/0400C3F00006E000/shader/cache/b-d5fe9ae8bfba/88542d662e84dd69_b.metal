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
    texture2d_array<float> cp_i_tcb_4C_ [[id(1)]];
    texture2d_array<float> cp_i_tcb_4A_ [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _33(thread const int& _202, thread const int& _203, constant _10& support_buffer)
{
    int _206 = 1 + _203;
    float _208 = support_buffer._m5[_206].x;
    bool _212 = _208 == 1.0;
    if (_212)
    {
        return _202;
    }
    float _214 = float(_202);
    float _216 = _214 * _208;
    int _218 = int(_216);
    return _218;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _37 = as_type<float>(gl_WorkGroupID.x);
    float _39 = as_type<float>(gl_LocalInvocationID.x);
    float _41 = as_type<float>(gl_WorkGroupID.y);
    float _43 = as_type<float>(gl_LocalInvocationID.y);
    float _45 = as_type<float>(gl_WorkGroupID.z);
    int _47 = as_type<int>(_37) << 3;
    int _49 = _47 + as_type<int>(_39);
    int _51 = as_type<int>(_41) << 2;
    int _53 = _51 + as_type<int>(_43);
    int _55 = _49;
    int _57 = 0;
    int _59 = _33(_55, _57, (*spvDescriptorSet0.support_buffer));
    int _61 = _53;
    int _63 = 0;
    int _65 = _33(_61, _63, (*spvDescriptorSet0.support_buffer));
    int3 _149 = int3(_59, _65, as_type<int>(_45));
    float4 _68 = (spvDescriptorSet0.cp_i_tcb_4C_.read(uint2(_149.xy), uint(_149.z)).xyzw);
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    int _78 = _49;
    int _80 = 1;
    int _82 = _33(_78, _80, (*spvDescriptorSet0.support_buffer));
    int _84 = _53;
    int _86 = 1;
    int _88 = _33(_84, _86, (*spvDescriptorSet0.support_buffer));
    int3 _170 = int3(_82, _88, as_type<int>(_45));
    float4 _90 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(_170.xy), uint(_170.z)).xyzw);
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float _100 = _92 + _70;
    float _102 = _94 + _72;
    float _104 = _96 + _74;
    int3 _196 = int3(_49, _53, as_type<int>(_45));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_100, _102, _104, 1.0), uint2(_196.xy), uint(_196.z));
}

