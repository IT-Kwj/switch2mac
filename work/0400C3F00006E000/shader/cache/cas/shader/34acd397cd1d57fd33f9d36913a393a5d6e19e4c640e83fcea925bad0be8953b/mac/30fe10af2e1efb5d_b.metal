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
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _37(thread const int& _360, thread const int& _361, constant _10& support_buffer)
{
    int _364 = 1 + _361;
    float _366 = support_buffer._m5[_364].x;
    bool _368 = _366 == 1.0;
    if (_368)
    {
        return _360;
    }
    float _370 = float(_360);
    float _372 = _370 * _366;
    int _374 = int(_372);
    return _374;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _41 = as_type<float>(gl_SubgroupInvocationID);
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    int _51 = as_type<int>(_41) & 6;
    bool _55 = _51 != 2;
    bool _57 = _51 != 4;
    bool _59 = !_55;
    bool _61 = _57 || _59;
    int _63 = as_type<int>(_43) * 4;
    int _65 = _63 + as_type<int>(_45);
    bool _67 = _51 != 4;
    bool _69 = _67 && _55;
    int _71 = as_type<int>(_47) * 16;
    int _73 = _71 + as_type<int>(_49);
    int _75 = _51;
    int _77 = _65;
    int _79 = as_type<int>(_49);
    int _81 = as_type<int>(_45);
    if (!_55)
    {
        int _83 = _65 + (-2);
        _75 = _83;
    }
    int _85 = _75;
    int _87 = _85;
    if (!_61)
    {
        int _89 = _65 + 2;
        _77 = _89;
    }
    int _91 = _77;
    if (_55)
    {
        int _93 = _73 + (-1);
        _79 = _93;
    }
    int _95 = _79;
    int _97 = _95;
    if (_69)
    {
        _97 = _73;
    }
    int _99 = _97;
    if (!_55)
    {
        int _101 = _73 + 1;
        _81 = _101;
    }
    int _103 = _81;
    int _105 = _103;
    if (_55)
    {
        _87 = _91;
    }
    int _107 = _87;
    if (_55)
    {
        _105 = _99;
    }
    int _109 = _105;
    int _111 = _107 * 2;
    int _113 = _109 * 2;
    int _115 = _111 + 1;
    int _117 = _113 + 1;
    int _119 = _111;
    int _121 = 0;
    int _123 = _37(_119, _121, (*spvDescriptorSet0.support_buffer));
    int _125 = _113;
    int _127 = 0;
    int _129 = _37(_125, _127, (*spvDescriptorSet0.support_buffer));
    float _131 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_123, _129)), 0).x;
    int _133 = _115;
    int _135 = 0;
    int _137 = _37(_133, _135, (*spvDescriptorSet0.support_buffer));
    int _139 = _113;
    int _141 = 0;
    int _143 = _37(_139, _141, (*spvDescriptorSet0.support_buffer));
    float _145 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_137, _143)), 0).x;
    int _147 = _111;
    int _149 = 0;
    int _151 = _37(_147, _149, (*spvDescriptorSet0.support_buffer));
    int _153 = _117;
    int _155 = 0;
    int _157 = _37(_153, _155, (*spvDescriptorSet0.support_buffer));
    float _159 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_151, _157)), 0).x;
    int _161 = _115;
    int _163 = 0;
    int _165 = _37(_161, _163, (*spvDescriptorSet0.support_buffer));
    int _167 = _117;
    int _169 = 0;
    int _171 = _37(_167, _169, (*spvDescriptorSet0.support_buffer));
    float _173 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_165, _171)), 0).x;
    float _175 = precise::max(_131, _145);
    float _177 = precise::max(_159, _173);
    float _179 = precise::max(_175, _177);
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_179, _179, _179, _179), uint2(int2(_107, _109)));
}

