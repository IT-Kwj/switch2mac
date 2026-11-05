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
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _37(thread const int& _390, thread const int& _391, constant _10& support_buffer)
{
    int _394 = 1 + _391;
    float _396 = support_buffer._m5[_394].x;
    bool _398 = _396 == 1.0;
    if (_398)
    {
        return _390;
    }
    float _400 = float(_390);
    float _402 = _400 * _396;
    int _404 = int(_402);
    return _404;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _41 = as_type<float>(gl_SubgroupInvocationID);
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    float _51 = as_type<float>(gl_WorkGroupID.z);
    int _53 = as_type<int>(_41) & 6;
    bool _57 = _53 != 2;
    bool _59 = _53 != 4;
    bool _61 = !_57;
    bool _63 = _59 || _61;
    int _65 = as_type<int>(_43) * 4;
    int _67 = _65 + as_type<int>(_45);
    bool _69 = _53 != 4;
    bool _71 = _69 && _57;
    int _73 = as_type<int>(_47) * 16;
    int _75 = _73 + as_type<int>(_49);
    int _77 = _53;
    int _79 = _67;
    int _81 = as_type<int>(_45);
    int _83 = _75;
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
    bool _103 = as_type<uint>(_51) > 65535u;
    if (_57)
    {
        _89 = _93;
    }
    int _105 = _89;
    if (!_57)
    {
        int _107 = _75 + 1;
        _83 = _107;
    }
    int _109 = _83;
    int _111 = _109;
    if (_57)
    {
        _111 = _101;
    }
    int _113 = _111;
    bool _115 = !_103;
    float _117 = _115 ? _51 : 9.1834094859526886742986618240905e-41;
    int _119 = _105 * 2;
    int _121 = _113 * 2;
    int _123 = _119 + 1;
    int _125 = _121 + 1;
    int _127 = _123;
    int _129 = 0;
    int _131 = _37(_127, _129, (*spvDescriptorSet0.support_buffer));
    int _133 = _121;
    int _135 = 0;
    int _137 = _37(_133, _135, (*spvDescriptorSet0.support_buffer));
    int3 _326 = int3(_131, _137, as_type<int>(_117));
    float _139 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_326.xy), uint(_326.z), 0).x;
    int _141 = _119;
    int _143 = 0;
    int _145 = _37(_141, _143, (*spvDescriptorSet0.support_buffer));
    int _147 = _121;
    int _149 = 0;
    int _151 = _37(_147, _149, (*spvDescriptorSet0.support_buffer));
    int3 _339 = int3(_145, _151, as_type<int>(_117));
    float _153 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_339.xy), uint(_339.z), 0).x;
    int _155 = _119;
    int _157 = 0;
    int _159 = _37(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = _125;
    int _163 = 0;
    int _165 = _37(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _352 = int3(_159, _165, as_type<int>(_117));
    float _167 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_352.xy), uint(_352.z), 0).x;
    int _169 = _123;
    int _171 = 0;
    int _173 = _37(_169, _171, (*spvDescriptorSet0.support_buffer));
    int _175 = _125;
    int _177 = 0;
    int _179 = _37(_175, _177, (*spvDescriptorSet0.support_buffer));
    int3 _365 = int3(_173, _179, as_type<int>(_117));
    float _181 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_365.xy), uint(_365.z), 0).x;
    float _183 = precise::max(_153, _139);
    float _185 = precise::max(_167, _181);
    float _187 = precise::max(_183, _185);
    int3 _384 = int3(_105, _113, as_type<int>(_51));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_187, _187, _187, _187), uint2(_384.xy), uint(_384.z));
}

