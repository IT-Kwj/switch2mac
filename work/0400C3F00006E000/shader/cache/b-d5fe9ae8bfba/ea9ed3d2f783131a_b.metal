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
    texture2d<float> cp_i_tcb_48_ [[id(1)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(2)]];
};

static inline __attribute__((always_inline))
int _34(thread const int& _353, thread const int& _354, constant _10& support_buffer)
{
    int _357 = 1 + _354;
    float _359 = support_buffer._m5[_357].x;
    bool _361 = _359 == 1.0;
    if (_361)
    {
        return _353;
    }
    float _363 = float(_353);
    float _365 = _363 * _359;
    int _367 = int(_365);
    return _367;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _38 = as_type<float>(gl_SubgroupInvocationID);
    float _40 = as_type<float>(gl_WorkGroupID.x);
    float _42 = as_type<float>(gl_LocalInvocationID.x);
    float _44 = as_type<float>(gl_WorkGroupID.y);
    float _46 = as_type<float>(gl_LocalInvocationID.y);
    int _48 = as_type<int>(_38) & 6;
    bool _52 = _48 != 2;
    bool _54 = _48 != 4;
    bool _56 = !_52;
    bool _58 = _54 || _56;
    int _60 = as_type<int>(_40) * 4;
    int _62 = _60 + as_type<int>(_42);
    bool _64 = _48 != 4;
    bool _66 = _64 && _52;
    int _68 = as_type<int>(_44) * 16;
    int _70 = _68 + as_type<int>(_46);
    int _72 = _48;
    int _74 = as_type<int>(_46);
    int _76 = _62;
    int _78 = as_type<int>(_42);
    if (!_52)
    {
        int _80 = _62 + (-2);
        _72 = _80;
    }
    int _82 = _72;
    int _84 = _82;
    if (_52)
    {
        int _86 = _70 + (-1);
        _74 = _86;
    }
    int _88 = _74;
    int _90 = _88;
    if (!_58)
    {
        int _92 = _62 + 2;
        _76 = _92;
    }
    int _94 = _76;
    if (_66)
    {
        _90 = _70;
    }
    int _96 = _90;
    if (!_52)
    {
        int _98 = _70 + 1;
        _78 = _98;
    }
    int _100 = _78;
    int _102 = _100;
    if (_52)
    {
        _84 = _94;
    }
    int _104 = _84;
    if (_52)
    {
        _102 = _96;
    }
    int _106 = _102;
    int _108 = _104 * 2;
    int _110 = _106 * 2;
    int _112 = _108 + 1;
    int _114 = _110 + 1;
    int _116 = _108;
    int _118 = 0;
    int _120 = _34(_116, _118, (*spvDescriptorSet0.support_buffer));
    int _122 = _110;
    int _124 = 0;
    int _126 = _34(_122, _124, (*spvDescriptorSet0.support_buffer));
    float _128 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_120, _126))).x;
    int _130 = _112;
    int _132 = 0;
    int _134 = _34(_130, _132, (*spvDescriptorSet0.support_buffer));
    int _136 = _110;
    int _138 = 0;
    int _140 = _34(_136, _138, (*spvDescriptorSet0.support_buffer));
    float _142 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_134, _140))).x;
    int _144 = _108;
    int _146 = 0;
    int _148 = _34(_144, _146, (*spvDescriptorSet0.support_buffer));
    int _150 = _114;
    int _152 = 0;
    int _154 = _34(_150, _152, (*spvDescriptorSet0.support_buffer));
    float _156 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_148, _154))).x;
    int _158 = _112;
    int _160 = 0;
    int _162 = _34(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = _114;
    int _166 = 0;
    int _168 = _34(_164, _166, (*spvDescriptorSet0.support_buffer));
    float _170 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_162, _168))).x;
    float _172 = precise::max(_128, _142);
    float _174 = precise::max(_156, _170);
    float _176 = precise::max(_172, _174);
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_176, _176, _176, _176), uint2(int2(_104, _106)));
}

