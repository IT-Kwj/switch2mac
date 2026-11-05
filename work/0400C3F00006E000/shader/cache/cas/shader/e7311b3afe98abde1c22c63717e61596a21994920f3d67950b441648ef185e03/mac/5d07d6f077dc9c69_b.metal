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
    texture2d_array<float> cp_i_tcb_48_ [[id(1)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(2)]];
};

static inline __attribute__((always_inline))
int _31(thread const int& _200, thread const int& _201, constant _10& support_buffer)
{
    int _204 = 1 + _201;
    float _206 = support_buffer._m5[_204].x;
    bool _210 = _206 == 1.0;
    if (_210)
    {
        return _200;
    }
    float _212 = float(_200);
    float _214 = _212 * _206;
    int _216 = int(_214);
    return _216;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _35 = as_type<float>(gl_WorkGroupID.x);
    float _37 = as_type<float>(gl_LocalInvocationID.x);
    float _39 = as_type<float>(gl_WorkGroupID.y);
    float _41 = as_type<float>(gl_LocalInvocationID.y);
    float _43 = as_type<float>(gl_WorkGroupID.z);
    int _45 = as_type<int>(_35) * 8;
    int _47 = _45 + as_type<int>(_37);
    int _49 = as_type<int>(_39) * 8;
    int _51 = _49 + as_type<int>(_41);
    int _53 = ~_47;
    int _55 = _53 + 1;
    int _57 = -_51;
    int _59 = _55 & 31;
    int _61 = _47;
    int _63 = 0;
    int _65 = _31(_61, _63, (*spvDescriptorSet0.support_buffer));
    int _67 = _51;
    int _69 = 0;
    int _71 = _31(_67, _69, (*spvDescriptorSet0.support_buffer));
    int3 _157 = int3(_65, _71, as_type<int>(_43));
    float2 _75 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_157.xy), uint(_157.z)).xy);
    float _77 = _75.x;
    float _79 = _75.y;
    int _81 = _57 & 31;
    int _83 = _59;
    int _85 = 0;
    int _87 = _31(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = _81;
    int _91 = 0;
    int _93 = _31(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _176 = int3(_87, _93, as_type<int>(_43));
    float2 _95 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_176.xy), uint(_176.z)).xy);
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = -_99;
    float _103 = _101 + (-0.0);
    int3 _194 = int3(_47, _51, as_type<int>(_43));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_77, _79, _97, _103), uint2(_194.xy), uint(_194.z));
}

