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
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _39(thread const int& _398, thread const int& _399, constant _10& support_buffer)
{
    int _402 = 1 + _399;
    float _404 = support_buffer._m5[_402].x;
    bool _406 = _404 == 1.0;
    if (_406)
    {
        return _398;
    }
    float _408 = float(_398);
    float _410 = _408 * _404;
    int _412 = int(_410);
    return _412;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_SubgroupInvocationID);
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = as_type<float>(gl_LocalInvocationID.x);
    float _49 = as_type<float>(gl_WorkGroupID.y);
    float _51 = as_type<float>(gl_LocalInvocationID.y);
    int _53 = as_type<int>(_43) & 6;
    bool _57 = _53 != 2;
    bool _59 = _53 != 4;
    bool _61 = !_57;
    bool _63 = _59 || _61;
    int _65 = as_type<int>(_45) * 4;
    int _67 = _65 + as_type<int>(_47);
    bool _69 = _53 != 4;
    bool _71 = _69 && _57;
    int _73 = as_type<int>(_49) * 16;
    int _75 = _73 + as_type<int>(_51);
    int _77 = _53;
    int _79 = _67;
    int _81 = as_type<int>(_51);
    int _83 = as_type<int>(_47);
    if (!_57)
    {
        int _85 = _67 + (-2);
        _77 = _85;
    }
    int _87 = _77;
    int _89 = _87;
    if (!_63)
    {
        int _91 = _67 + 2;
        _79 = _91;
    }
    int _93 = _79;
    if (_57)
    {
        int _95 = _75 + (-1);
        _81 = _95;
    }
    int _97 = _81;
    int _99 = _97;
    if (_71)
    {
        _99 = _75;
    }
    int _101 = _99;
    if (_57)
    {
        _89 = _93;
    }
    int _103 = _89;
    if (!_57)
    {
        int _105 = _75 + 1;
        _83 = _105;
    }
    int _107 = _83;
    int _109 = _107;
    if (_57)
    {
        _109 = _101;
    }
    int _111 = _109;
    int _113 = _103 * 2;
    int _115 = _111 << 1;
    int _117 = _113 + 1;
    int _119 = _115 + 1;
    int _121 = _113;
    int _123 = 0;
    int _125 = _39(_121, _123, (*spvDescriptorSet0.support_buffer));
    int _127 = _115;
    int _129 = 0;
    int _131 = _39(_127, _129, (*spvDescriptorSet0.support_buffer));
    float _133 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_125, _131)), 0).x;
    int _135 = _117;
    int _137 = 0;
    int _139 = _39(_135, _137, (*spvDescriptorSet0.support_buffer));
    int _141 = _115;
    int _143 = 0;
    int _145 = _39(_141, _143, (*spvDescriptorSet0.support_buffer));
    float _147 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_139, _145)), 0).x;
    int _149 = _113;
    int _151 = 0;
    int _153 = _39(_149, _151, (*spvDescriptorSet0.support_buffer));
    int _155 = _119;
    int _157 = 0;
    int _159 = _39(_155, _157, (*spvDescriptorSet0.support_buffer));
    float _161 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_153, _159)), 0).x;
    int _163 = _117;
    int _165 = 0;
    int _167 = _39(_163, _165, (*spvDescriptorSet0.support_buffer));
    int _169 = _119;
    int _171 = 0;
    int _173 = _39(_169, _171, (*spvDescriptorSet0.support_buffer));
    float _175 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_167, _173)), 0).x;
    float _177 = precise::max(_133, _147);
    float _179 = precise::max(_161, _175);
    float _181 = precise::max(_177, _179);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_133, _133, _133, _133), uint2(int2(_113, _115)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_147, _147, _147, _147), uint2(int2(_113, _119)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_161, _161, _161, _161), uint2(int2(_117, _115)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_175, _175, _175, _175), uint2(int2(_117, _119)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_181, _181, _181, _181), uint2(int2(_103, _111)));
}

