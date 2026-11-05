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
    float _54 = fma(_50, 2.0, -1.0);
    float _56 = fma(_52, 2.0, -1.0);
    float _58 = _54 * _54;
    float _60 = fma(_56, _56, _58);
    float _62 = sqrt(_60);
    float _64 = -_62;
    float _66 = _64 + 1.0;
    float _68 = precise::clamp(_66, 0.0, 1.0);
    float _70 = _68 * 3.1415927410125732421875;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _74 = _72 * 0.15915493667125701904296875;
    float _76 = _74 * 6.283185482025146484375;
    float _78 = sin(_76);
    float _80 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    out.m_27.x = _80;
    out.m_27.w = 1.0;
    return out;
}

