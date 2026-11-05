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

struct _15
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    const device _15* cp_s0 [[id(1)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(2)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _36(thread const int& _211, thread const int& _212, constant _10& support_buffer)
{
    int _215 = 1 + _212;
    float _217 = support_buffer._m5[_215].x;
    bool _219 = _217 == 1.0;
    if (_219)
    {
        return _211;
    }
    float _221 = float(_211);
    float _223 = _221 * _217;
    int _225 = int(_223);
    return _225;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _40 = as_type<float>(gl_WorkGroupID.y);
    float _42 = as_type<float>(gl_WorkGroupID.z);
    float _44 = as_type<float>(gl_WorkGroupID.x);
    int _46 = as_type<int>(_42) * 32;
    int _48 = _46 + as_type<int>(_40);
    int _50 = _48 << 4;
    int _52 = _50 + as_type<int>(_44);
    int _54 = _52 << 2;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    float _59 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_57)]);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    float _63 = as_type<float>(gl_LocalInvocationID.y);
    int _65 = as_type<int>(_44) << 3;
    int _67 = _65 + as_type<int>(_61);
    int _69 = as_type<int>(_40) * 4;
    int _71 = _69 + as_type<int>(_63);
    bool _75 = as_type<int>(_59) != 0;
    if (!_75)
    {
        int3 _171 = int3(_67, _71, as_type<int>(_42));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(_171.xy), uint(_171.z));
    }
    if (!_75)
    {
        return;
    }
    int _77 = _67;
    int _79 = 1;
    int _81 = _36(_77, _79, (*spvDescriptorSet0.support_buffer));
    int _83 = _71;
    int _85 = 1;
    int _87 = _36(_83, _85, (*spvDescriptorSet0.support_buffer));
    int3 _188 = int3(_81, _87, as_type<int>(_42));
    float4 _90 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_188.xy), uint(_188.z)).xyzw);
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    int3 _205 = int3(_67, _71, as_type<int>(_42));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_92, _94, _96, _98), uint2(_205.xy), uint(_205.z));
}

