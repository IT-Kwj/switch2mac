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
    float _48 = in.m_24.z;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = 1.0 / _34;
    float _56 = _54 * _40;
    float _58 = _54 * _46;
    float _60 = _54 * _52;
    float _62 = _56 * _56;
    float _64 = fma(_58, _58, _62);
    float _66 = fma(_60, _60, _64);
    float _68 = rsqrt(_66);
    float _70 = _56 * _68;
    float _72 = _58 * _68;
    float _74 = _60 * _68;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _78 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _76);
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[11].z, _78);
    float _82 = fma(_80, -0.5, -0.5);
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[11].w, 1.0);
    float _86 = _84 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _88 = _84 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    out.m_27.x = _86;
    out.m_27.y = _88;
    out.m_27.z = _90;
    out.m_27.w = (*spvDescriptorSet0.fp_c3)._m0[10].w;
    return out;
}

