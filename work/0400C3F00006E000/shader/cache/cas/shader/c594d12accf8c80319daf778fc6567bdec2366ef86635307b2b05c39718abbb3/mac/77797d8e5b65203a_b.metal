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
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _39 = as_type<float>(gl_WorkGroupID.x);
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    float _43 = as_type<float>(gl_WorkGroupID.y);
    float _45 = as_type<float>(gl_LocalInvocationID.y);
    int _48 = as_type<int>(_39) * 8;
    int _50 = _48 + as_type<int>(_41);
    bool _54 = uint(_50) > 32u;
    uint _57 = as_type<uint>(_41);
    if (!_54)
    {
        int _59 = as_type<int>(_43) * 8;
        int _61 = _59 + as_type<int>(_45);
        _57 = uint(_61);
    }
    uint _63 = _57;
    bool _65 = _63 > 32u;
    bool _67 = _65 || _54;
    if (_67)
    {
        return;
    }
    int _69 = as_type<int>(_43) << 3;
    int _71 = _69 + as_type<int>(_45);
    int _73 = _50 * 33;
    int _75 = _73 + _71;
    int _77 = _75 * 8;
    int _79 = _77 + 4;
    uint _81 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_81)] = 0u;
    uint _83 = uint(int(uint(_79) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_83)] = 0u;
    uint _85 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_85)] = 0u;
    uint _87 = uint(int(uint(_79) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_87)] = 0u;
}

