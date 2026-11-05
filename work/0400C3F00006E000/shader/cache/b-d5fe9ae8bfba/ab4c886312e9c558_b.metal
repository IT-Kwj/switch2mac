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
    float _54 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _56 = 1.0 / _34;
    float _58 = _56 * _40;
    float _60 = _56 * _46;
    float _62 = _56 * _52;
    float _64 = _58 * _58;
    float _66 = fma(_60, _60, _64);
    float _68 = fma(_62, _62, _66);
    float _70 = rsqrt(_68);
    float _72 = _58 * _70;
    float _74 = fma(_72, -0.5, 0.5);
    float _76 = fma(_72, 0.5, 0.5);
    float _78 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _80 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[9].x, _78);
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _84 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[9].y, _82);
    float _86 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _88 = abs(_80);
    float _90 = log2(_88);
    float _92 = fma(_76, (*spvDescriptorSet0.fp_c3)._m0[9].z, _86);
    float _94 = abs(_84);
    float _96 = log2(_94);
    float _98 = abs(_92);
    float _100 = log2(_98);
    float _102 = _90 * _54;
    float _104 = _96 * _54;
    float _106 = exp2(_102);
    float _108 = _100 * _54;
    float _110 = exp2(_104);
    float _112 = exp2(_108);
    out.m_27.x = _106;
    out.m_27.y = _110;
    out.m_27.z = _112;
    out.m_27.w = 1.0;
    return out;
}

