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
    texture2d_array<float> cp_i_tcb_4A_ [[id(1)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(2)]];
};

static inline __attribute__((always_inline))
int _31(thread const int& _142, thread const int& _143, constant _10& support_buffer)
{
    int _146 = 1 + _143;
    float _148 = support_buffer._m5[_146].x;
    bool _152 = _148 == 1.0;
    if (_152)
    {
        return _142;
    }
    float _154 = float(_142);
    float _156 = _154 * _148;
    int _158 = int(_156);
    return _158;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _35 = as_type<float>(gl_WorkGroupID.x);
    float _37 = as_type<float>(gl_LocalInvocationID.x);
    float _39 = as_type<float>(gl_WorkGroupID.y);
    float _41 = as_type<float>(gl_LocalInvocationID.y);
    float _43 = as_type<float>(gl_WorkGroupID.z);
    int _45 = as_type<int>(_35) << 3;
    int _47 = _45 + as_type<int>(_37);
    int _49 = as_type<int>(_39) << 2;
    int _51 = _49 + as_type<int>(_41);
    int _53 = _47;
    int _55 = 0;
    int _57 = _31(_53, _55, (*spvDescriptorSet0.support_buffer));
    int _59 = _51;
    int _61 = 0;
    int _63 = _31(_59, _61, (*spvDescriptorSet0.support_buffer));
    int3 _119 = int3(_57, _63, as_type<int>(_43));
    float4 _66 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(_119.xy), uint(_119.z)).xyzw);
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    int3 _136 = int3(_47, _51, as_type<int>(_43));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_68, _70, _72, _74), uint2(_136.xy), uint(_136.z));
}

