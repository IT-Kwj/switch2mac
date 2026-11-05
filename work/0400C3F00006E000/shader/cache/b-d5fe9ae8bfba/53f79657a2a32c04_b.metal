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
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(2)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _38 = as_type<float>(gl_WorkGroupID.x);
    float _40 = as_type<float>(gl_LocalInvocationID.x);
    float _42 = as_type<float>(gl_WorkGroupID.y);
    float _44 = as_type<float>(gl_LocalInvocationID.y);
    int _47 = as_type<int>(_38) << 3;
    int _49 = _47 + as_type<int>(_40);
    bool _53 = uint(_49) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _55 = as_type<int>(_42) << 3;
    int _57 = _55 + as_type<int>(_44);
    bool _59 = uint(_57) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _61 = !_53;
    bool _63 = _59 && _61;
    if (!_63)
    {
        return;
    }
    float _65 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _67 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _69 = 1.0 / _65;
    float _71 = float(uint(_57));
    float _73 = float(uint(_49));
    float _75 = _71 + 0.5;
    float _77 = 1.0 / _67;
    float _79 = _73 + 0.5;
    float _81 = _75 * _69;
    float _83 = fma(_81, 2.0, -1.0);
    float _85 = _79 * _77;
    float _87 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _89 = _83 + _87;
    float _91 = fma(_85, 2.0, -1.0);
    float _93 = _89 * _89;
    float _95 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _97 = _91 + _95;
    float _99 = fma(_97, _97, _93);
    float _101 = sqrt(_99);
    float _103 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _105 = _101 + _103;
    float _107 = _105 * 4.0;
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = _109 * 16.0;
    float _113 = trunc(_111);
    float _115 = precise::max(_113, 0.0);
    uint _118 = uint(_115);
    uint _120 = min(_118, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_120), 0.0, 0.0, 0.0), uint2(int2(_49, _57)));
}

