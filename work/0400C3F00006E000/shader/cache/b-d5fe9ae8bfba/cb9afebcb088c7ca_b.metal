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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    int _33 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].z) >> 31;
    int _35 = _33 & 31;
    int _37 = _35 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    int _39 = _37 >> 5;
    bool _43 = 0 < _39;
    if (!_43)
    {
        return;
    }
    int _45 = 0;
    bool _47;
    do
    {
        int _49 = _45;
        int _51 = _49 * 64;
        int _53 = _49 + 1;
        bool _55 = _53 >= _39;
        int _57 = _51 + 28;
        int _59 = _51 + 16;
        int _61 = _51 + 40;
        uint _64 = uint(int(uint(_57) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_64)] = 0u;
        int _66 = _51 + 44;
        uint _68 = uint(int(uint(_51) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_68)] = 1174011904u;
        int _70 = _51 + 4;
        uint _72 = uint(int(uint(_70) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_72)] = 1174011904u;
        int _74 = _51 + 8;
        uint _76 = uint(int(uint(_74) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_76)] = 1174011904u;
        uint _78 = uint(int(uint(_59) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_78)] = 3321495552u;
        int _80 = _59 + 4;
        uint _82 = uint(int(uint(_80) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_82)] = 3321495552u;
        int _84 = _59 + 8;
        uint _86 = uint(int(uint(_84) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_86)] = 3321495552u;
        uint _88 = uint(int(uint(_61) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_88)] = 0u;
        uint _90 = uint(int(uint(_66) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_90)] = 0u;
        _47 = !_55;
        _45 = _53;
    } while (_47);
}

