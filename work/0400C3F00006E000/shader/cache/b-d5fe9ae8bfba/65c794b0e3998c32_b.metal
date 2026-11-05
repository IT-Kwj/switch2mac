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
int _34(thread const int& _368, thread const int& _369, constant _10& support_buffer)
{
    int _372 = 1 + _369;
    float _374 = support_buffer._m5[_372].x;
    bool _376 = _374 == 1.0;
    if (_376)
    {
        return _368;
    }
    float _378 = float(_368);
    float _380 = _378 * _374;
    int _382 = int(_380);
    return _382;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _38 = as_type<float>(gl_SubgroupInvocationID);
    float _40 = as_type<float>(gl_WorkGroupID.y);
    float _42 = as_type<float>(gl_LocalInvocationID.y);
    float _44 = as_type<float>(gl_WorkGroupID.x);
    float _46 = as_type<float>(gl_LocalInvocationID.x);
    float _48 = as_type<float>(gl_WorkGroupID.z);
    int _50 = as_type<int>(_38) & 6;
    bool _54 = _50 != 2;
    bool _56 = _50 != 4;
    bool _58 = _56 && _54;
    int _60 = as_type<int>(_40) * 16;
    int _62 = _60 + as_type<int>(_42);
    bool _64 = _50 != 4;
    bool _66 = !_54;
    bool _68 = _64 || _66;
    int _70 = as_type<int>(_44) * 4;
    int _72 = _70 + as_type<int>(_46);
    int _74 = as_type<int>(_44);
    int _76 = as_type<int>(_46);
    int _78 = _72;
    int _80 = _62;
    if (_54)
    {
        int _82 = _62 + (-1);
        _74 = _82;
    }
    int _84 = _74;
    int _86 = _84;
    if (!_54)
    {
        int _88 = _72 + (-2);
        _76 = _88;
    }
    int _90 = _76;
    int _92 = _90;
    if (_58)
    {
        _86 = _62;
    }
    int _94 = _86;
    if (!_68)
    {
        int _96 = _72 + 2;
        _78 = _96;
    }
    int _98 = _78;
    if (!_54)
    {
        int _100 = _62 + 1;
        _80 = _100;
    }
    int _102 = _80;
    int _104 = _102;
    if (_54)
    {
        _104 = _94;
    }
    int _106 = _104;
    if (_54)
    {
        _92 = _98;
    }
    int _108 = _92;
    int _110 = _106 * 2;
    int _112 = _108 * 2;
    int _114 = _110 + 1;
    int _116 = _112 + 1;
    int _118 = _112;
    int _120 = 0;
    int _122 = _34(_118, _120, (*spvDescriptorSet0.support_buffer));
    int _124 = _110;
    int _126 = 0;
    int _128 = _34(_124, _126, (*spvDescriptorSet0.support_buffer));
    int3 _308 = int3(_122, _128, as_type<int>(_48));
    float _130 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_308.xy), uint(_308.z)).x;
    int _132 = _116;
    int _134 = 0;
    int _136 = _34(_132, _134, (*spvDescriptorSet0.support_buffer));
    int _138 = _110;
    int _140 = 0;
    int _142 = _34(_138, _140, (*spvDescriptorSet0.support_buffer));
    int3 _320 = int3(_136, _142, as_type<int>(_48));
    float _144 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_320.xy), uint(_320.z)).x;
    int _146 = _112;
    int _148 = 0;
    int _150 = _34(_146, _148, (*spvDescriptorSet0.support_buffer));
    int _152 = _114;
    int _154 = 0;
    int _156 = _34(_152, _154, (*spvDescriptorSet0.support_buffer));
    int3 _332 = int3(_150, _156, as_type<int>(_48));
    float _158 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_332.xy), uint(_332.z)).x;
    int _160 = _116;
    int _162 = 0;
    int _164 = _34(_160, _162, (*spvDescriptorSet0.support_buffer));
    int _166 = _114;
    int _168 = 0;
    int _170 = _34(_166, _168, (*spvDescriptorSet0.support_buffer));
    int3 _344 = int3(_164, _170, as_type<int>(_48));
    float _172 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_344.xy), uint(_344.z)).x;
    float _174 = precise::max(_130, _144);
    float _176 = precise::max(_158, _172);
    float _178 = precise::max(_174, _176);
    int3 _362 = int3(_108, _106, as_type<int>(_48));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_178, _178, _178, _178), uint2(_362.xy), uint(_362.z));
}

