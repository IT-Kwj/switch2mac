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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    device _25* cp_s0 [[id(2)]];
    device _25* cp_s1 [[id(3)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    int _48 = as_type<int>(_43) << 6;
    int _50 = _48 + as_type<int>(_45);
    int _52 = _50 * 80;
    int _54 = _52 + 60;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    float _59 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_57)]);
    bool _63 = as_type<int>(_59) != (-1);
    if (!_63)
    {
        return;
    }
    int _65 = _52 + 16;
    int _67 = _52 + 32;
    int _69 = _52 + 12;
    uint _71 = uint(int(uint(_69) >> uint(2)));
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_71)]);
    int _75 = _65 + 12;
    uint _77 = uint(int(uint(_75) >> uint(2)));
    float _79 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_77)]);
    int _81 = _67 + 12;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_83)]);
    int _87 = _52 + 48;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_89)]);
    int _93 = _87 + 4;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    float _97 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_95)]);
    int _99 = _50 << 2;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    float _103 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_101)]);
    float _105 = -_73;
    float _107 = _105 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _109 = -_79;
    float _111 = _109 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _113 = _111 * _111;
    float _115 = -_85;
    float _117 = _115 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _119 = fma(_107, _107, _113);
    float _121 = fma(_117, _117, _119);
    float _123 = sqrt(_121);
    float _125 = _91 + 50.0;
    float _127 = _125 * (*spvDescriptorSet0.cp_c4)._m0[0].y;
    bool _129 = _123 >= _127;
    bool _131 = isnan(_123);
    bool _133 = _129 || _131;
    bool _135 = isnan(_127);
    bool _137 = _133 || _135;
    float _139 = _97 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
    bool _141 = _123 > _139;
    float _143 = _113;
    float _145 = _139;
    float _147 = _123;
    if (!_137)
    {
        _143 = (*spvDescriptorSet0.cp_c4)._m0[0].y;
    }
    float _149 = _143;
    if (!_137)
    {
        float _151 = _149 * 50.0;
        _145 = _151;
    }
    float _153 = _145;
    float _155 = _153;
    if (!_137)
    {
        float _157 = 1.0 / _153;
        _155 = _157;
    }
    float _159 = _155;
    if (!_137)
    {
        float _161 = -_91;
        float _163 = fma(_161, (*spvDescriptorSet0.cp_c4)._m0[0].y, _123);
        _147 = _163;
    }
    float _165 = _147;
    float _167 = _141 ? 0.039999999105930328369140625 : (-0.039999999105930328369140625);
    float _169 = -_167;
    float _171 = _103 + _169;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    int _175 = as_type<int>(_173);
    if (!_137)
    {
        float _177 = _165 * _159;
        float _179 = precise::clamp(_177, 0.0, 1.0);
        _175 = as_type<int>(_179);
    }
    int _181 = _175;
    uint _183 = uint(int(uint(_99) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_183)] = uint(_181);
}

