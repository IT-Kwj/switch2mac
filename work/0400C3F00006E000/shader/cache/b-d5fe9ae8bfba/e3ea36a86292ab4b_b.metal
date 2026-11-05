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
    constant _16* fp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_22 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _29 = 0.0 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _31 = precise::clamp(_29, 0.0, 1.0);
    bool _35 = _31 != 0.0;
    bool _37 = isnan(_31);
    bool _39 = _35 || _37;
    bool _41 = isnan(0.0);
    bool _43 = _39 || _41;
    if (_43)
    {
        out.m_22.x = (*spvDescriptorSet0.fp_c3)._m0[0].x;
        out.m_22.y = (*spvDescriptorSet0.fp_c3)._m0[0].y;
        out.m_22.z = (*spvDescriptorSet0.fp_c3)._m0[0].z;
        out.m_22.w = _31;
        return out;
    }
    discard_fragment();
    return out;
}

