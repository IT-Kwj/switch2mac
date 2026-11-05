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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    const device _21* cp_s0 [[id(0)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _41 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[11]);
    float _43 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[5]);
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = as_type<float>(gl_LocalInvocationID.x);
    int _50 = as_type<int>(_45) * 32;
    int _52 = _50 + as_type<int>(_47);
    int _54 = min(as_type<int>(_41), as_type<int>(_43));
    bool _58 = uint(_52) >= uint(_54);
    if (_58)
    {
        return;
    }
    int _60 = _52 << 4;
    int _62 = _60 + 48;
    uint _65 = uint(int(uint(_62) >> uint(2)));
    packed_uint3 _dmw0 = *(const device packed_uint3*)&(*spvDescriptorSet0.cp_s0)._m0[int(_65)];
    float _67 = as_type<float>(_dmw0.x);
    int _69 = _62 + 4;
    uint _71 = uint(int(uint(_69) >> uint(2)));
    float _73 = as_type<float>(_dmw0.y);
    int _75 = _62 + 8;
    uint _77 = uint(int(uint(_75) >> uint(2)));
    float _79 = as_type<float>(_dmw0.z);
    bool _81 = as_type<int>(_79) != 1;
    bool _83 = as_type<int>(_79) != 0;
    int _85 = _81 ? 0 : 1065353216;
    bool _87 = !_81;
    int _89 = _87 ? 0 : 1065353216;
    float _91 = _83 ? 0.0 : 1.0;
    float _93 = _83 ? as_type<float>(_85) : 0.0;
    float _95 = _83 ? as_type<float>(_89) : 0.0;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_91, _93, _95, 1.0), uint2(int2(as_type<int>(_67), as_type<int>(_73))));
}

