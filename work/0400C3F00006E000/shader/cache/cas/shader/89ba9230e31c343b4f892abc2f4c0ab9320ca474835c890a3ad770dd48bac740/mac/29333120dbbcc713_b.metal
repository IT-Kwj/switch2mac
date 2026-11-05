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
    constant _10* support_buffer [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    texture2d<float> cp_i_tcb_48_ [[id(2)]];
};

static inline __attribute__((always_inline))
int _34(thread const int& _82, thread const int& _83, constant _10& support_buffer)
{
    int _86 = 1 + _83;
    float _88 = support_buffer._m5[_86].x;
    bool _92 = _88 == 1.0;
    if (_92)
    {
        return _82;
    }
    float _94 = float(_82);
    float _96 = _94 * _88;
    int _98 = int(_96);
    return _98;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    int _37 = 0;
    int _39 = 0;
    int _41 = _34(_37, _39, (*spvDescriptorSet0.support_buffer));
    int _43 = 0;
    int _45 = 0;
    int _47 = _34(_43, _45, (*spvDescriptorSet0.support_buffer));
    float _50 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_41, _47))).x;
    (*spvDescriptorSet0.cp_s0)._m0[1] = 1u;
    (*spvDescriptorSet0.cp_s0)._m0[2] = 1u;
    int _52 = as_type<int>(_50) + 63;
    uint _55 = uint(int(uint(_52) >> uint(6)));
    (*spvDescriptorSet0.cp_s0)._m0[0] = _55;
}

