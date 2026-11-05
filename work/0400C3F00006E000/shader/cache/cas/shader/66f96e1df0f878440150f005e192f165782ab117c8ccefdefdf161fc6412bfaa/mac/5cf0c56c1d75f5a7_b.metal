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
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_24.y;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = 1.0 / _34;
    float _50 = _48 * _40;
    float _52 = _48 * _46;
    float _54 = _50 * _50;
    float _56 = fma(_52, _52, _54);
    float _58 = precise::clamp(_56, 0.0, 1.0);
    float _60 = sqrt(_58);
    float _62 = -_60;
    float _64 = _62 + 1.0;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].y, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _68 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _72 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    out.m_27.x = _68;
    out.m_27.y = _66;
    out.m_27.z = _70;
    out.m_27.w = _72;
    return out;
}

