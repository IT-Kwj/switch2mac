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
    texture2d<float, access::write> cp_i_tcb_48_ [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _36 = as_type<float>(gl_WorkGroupID.x);
    float _38 = as_type<float>(gl_LocalInvocationID.x);
    float _40 = as_type<float>(gl_WorkGroupID.y);
    float _42 = as_type<float>(gl_LocalInvocationID.y);
    int _45 = as_type<int>(_36) * 8;
    int _47 = _45 + as_type<int>(_38);
    bool _51 = uint(_47) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _53 = as_type<int>(_40) * 8;
    int _55 = _53 + as_type<int>(_42);
    bool _57 = uint(_55) < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    bool _59 = !_51;
    bool _61 = _57 && _59;
    if (!_61)
    {
        return;
    }
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(0.0), uint2(int2(_47, _55)));
}

