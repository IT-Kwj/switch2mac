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
    int _44 = as_type<int>(_39) * 32;
    int _46 = _44 + as_type<int>(_41);
    int _48 = _46 * 16;
    int _50 = _48 + 9728;
    int _52 = _48 + 9732;
    int _54 = _48 + 9736;
    int _56 = _48 + 9740;
    uint _59 = uint(int(uint(_50) >> uint(2)));
    float _61 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_59)]);
    uint _63 = uint(int(uint(_52) >> uint(2)));
    float _65 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_63)]);
    uint _67 = uint(int(uint(_54) >> uint(2)));
    float _69 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_67)]);
    uint _71 = uint(int(uint(_56) >> uint(2)));
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_71)]);
    int _75 = _46 << 3;
    int _77 = _75 + 448;
    uint _79 = max(as_type<uint>(_61), as_type<uint>(_65));
    uint _81 = max(as_type<uint>(_69), as_type<uint>(_73));
    uint _83 = max(_79, _81);
    float _85 = float(_83);
    float _87 = _85 * 5.9604651880817982601001858711243e-08;
    uint _89 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_89)] = 0u;
    int _91 = _77 + 4;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_93)] = as_type<uint>(_87);
}

