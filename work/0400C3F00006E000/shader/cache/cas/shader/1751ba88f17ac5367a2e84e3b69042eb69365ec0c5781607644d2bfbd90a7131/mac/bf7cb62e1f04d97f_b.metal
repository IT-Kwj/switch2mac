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
    int _50 = _48 + 4;
    uint _53 = uint(int(uint(_48) >> uint(2)));
    float _55 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_53)]);
    int _57 = _48 + 8;
    int _59 = _48 + 12;
    int _61 = _48 + 9728;
    uint _63 = uint(int(uint(_50) >> uint(2)));
    float _65 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_63)]);
    int _67 = _48 + 9732;
    int _69 = _48 + 9736;
    uint _71 = uint(int(uint(_57) >> uint(2)));
    float _73 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_71)]);
    int _75 = _48 + 9740;
    uint _77 = uint(int(uint(_59) >> uint(2)));
    float _79 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_77)]);
    uint _81 = uint(int(uint(_61) >> uint(2)));
    float _83 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_81)]);
    uint _85 = uint(int(uint(_67) >> uint(2)));
    float _87 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_85)]);
    uint _89 = uint(int(uint(_69) >> uint(2)));
    float _91 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_89)]);
    uint _93 = uint(int(uint(_75) >> uint(2)));
    float _95 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_93)]);
    uint _97 = min(as_type<uint>(_55), as_type<uint>(_65));
    uint _99 = min(as_type<uint>(_73), as_type<uint>(_79));
    uint _101 = min(_97, _99);
    uint _103 = max(as_type<uint>(_83), as_type<uint>(_87));
    uint _105 = max(as_type<uint>(_91), as_type<uint>(_95));
    uint _107 = max(_103, _105);
    float _109 = float(_101);
    float _111 = float(_107);
    int _113 = _46 << 3;
    int _115 = _113 + 448;
    float _117 = _109 * 5.9604651880817982601001858711243e-08;
    float _119 = _111 * 5.9604651880817982601001858711243e-08;
    uint _121 = uint(int(uint(_115) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_121)] = as_type<uint>(_117);
    int _123 = _115 + 4;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_125)] = as_type<uint>(_119);
}

