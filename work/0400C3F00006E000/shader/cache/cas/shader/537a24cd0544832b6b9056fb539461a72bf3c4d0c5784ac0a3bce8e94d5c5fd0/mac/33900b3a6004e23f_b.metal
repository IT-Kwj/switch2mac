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
    texture2d_array<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(3)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _39(thread const int& _437, thread const int& _438, constant _10& support_buffer)
{
    int _441 = 1 + _438;
    float _443 = support_buffer._m5[_441].x;
    bool _445 = _443 == 1.0;
    if (_445)
    {
        return _437;
    }
    float _447 = float(_437);
    float _449 = _447 * _443;
    int _451 = int(_449);
    return _451;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_SubgroupInvocationID);
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = as_type<float>(gl_LocalInvocationID.x);
    float _49 = as_type<float>(gl_WorkGroupID.y);
    float _51 = as_type<float>(gl_LocalInvocationID.y);
    float _53 = as_type<float>(gl_WorkGroupID.z);
    int _55 = as_type<int>(_43) & 6;
    bool _59 = _55 != 2;
    bool _61 = _55 != 4;
    bool _63 = !_59;
    bool _65 = _61 || _63;
    bool _67 = _55 != 4;
    bool _69 = _67 && _59;
    int _71 = as_type<int>(_45) * 4;
    int _73 = _71 + as_type<int>(_47);
    int _75 = as_type<int>(_49) * 16;
    int _77 = _75 + as_type<int>(_51);
    int _79 = as_type<int>(_47);
    int _81 = _73;
    int _83 = as_type<int>(_45);
    int _85 = _77;
    if (!_59)
    {
        int _87 = _73 + (-2);
        _79 = _87;
    }
    int _89 = _79;
    int _91 = _89;
    if (!_65)
    {
        int _93 = _73 + 2;
        _81 = _93;
    }
    int _95 = _81;
    if (_59)
    {
        int _97 = _77 + (-1);
        _83 = _97;
    }
    int _99 = _83;
    int _101 = _99;
    if (_69)
    {
        _101 = _77;
    }
    int _103 = _101;
    if (_59)
    {
        _91 = _95;
    }
    int _105 = _91;
    bool _107 = as_type<uint>(_53) > 65535u;
    if (!_59)
    {
        int _109 = _77 + 1;
        _85 = _109;
    }
    int _111 = _85;
    int _113 = _111;
    if (_59)
    {
        _113 = _103;
    }
    int _115 = _113;
    bool _117 = !_107;
    float _119 = _117 ? _53 : 9.1834094859526886742986618240905e-41;
    int _121 = _105 * 2;
    int _123 = _115 << 1;
    int _125 = _121 + 1;
    int _127 = _123 + 1;
    int _129 = _121;
    int _131 = 0;
    int _133 = _39(_129, _131, (*spvDescriptorSet0.support_buffer));
    int _135 = _123;
    int _137 = 0;
    int _139 = _39(_135, _137, (*spvDescriptorSet0.support_buffer));
    int3 _329 = int3(_133, _139, as_type<int>(_119));
    float _141 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_329.xy), uint(_329.z), 0).x;
    int _143 = _125;
    int _145 = 0;
    int _147 = _39(_143, _145, (*spvDescriptorSet0.support_buffer));
    int _149 = _123;
    int _151 = 0;
    int _153 = _39(_149, _151, (*spvDescriptorSet0.support_buffer));
    int3 _342 = int3(_147, _153, as_type<int>(_119));
    float _155 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_342.xy), uint(_342.z), 0).x;
    int _157 = _125;
    int _159 = 0;
    int _161 = _39(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = _127;
    int _165 = 0;
    int _167 = _39(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _355 = int3(_161, _167, as_type<int>(_119));
    float _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_355.xy), uint(_355.z), 0).x;
    int _171 = _121;
    int _173 = 0;
    int _175 = _39(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = _127;
    int _179 = 0;
    int _181 = _39(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _368 = int3(_175, _181, as_type<int>(_119));
    float _183 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_368.xy), uint(_368.z), 0).x;
    float _185 = precise::max(_141, _155);
    float _187 = precise::max(_183, _169);
    float _189 = precise::max(_185, _187);
    int3 _387 = int3(_121, _123, as_type<int>(_53));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_141, _141, _141, _141), uint2(_387.xy), uint(_387.z));
    int3 _398 = int3(_121, _127, as_type<int>(_53));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_155, _155, _155, _155), uint2(_398.xy), uint(_398.z));
    int3 _409 = int3(_125, _123, as_type<int>(_53));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_183, _183, _183, _183), uint2(_409.xy), uint(_409.z));
    int3 _420 = int3(_125, _127, as_type<int>(_53));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_169, _169, _169, _169), uint2(_420.xy), uint(_420.z));
    int3 _431 = int3(_105, _115, as_type<int>(_53));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_189, _189, _189, _189), uint2(_431.xy), uint(_431.z));
}

