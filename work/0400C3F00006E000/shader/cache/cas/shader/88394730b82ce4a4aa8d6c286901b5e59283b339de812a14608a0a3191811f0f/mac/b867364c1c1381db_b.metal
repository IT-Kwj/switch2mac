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
    float4 m_29 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn0)]];
    float4 m_26 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _36 = gl_FragCoord.w;
    float _38 = in.m_24.y;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_24.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_24.z;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_26.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_26.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_26.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _36;
    float _76 = _74 * _42;
    float _78 = _74 * _48;
    float _80 = _74 * _54;
    float _82 = _76 * _76;
    float _84 = in.m_26.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_78, _78, _82);
    float _92 = fma(_80, _80, _90);
    float _94 = rsqrt(_92);
    float _96 = _76 * _94;
    float _98 = _78 * _94;
    float _100 = _80 * _94;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _104 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[11].x, _102);
    float _106 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[11].z, _104);
    float _108 = fma(_106, -0.5, -0.5);
    float _110 = _74 * _60;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].w, 1.0);
    float _114 = _74 * _66;
    float _116 = _74 * _72;
    float _118 = _74 * _88;
    float _120 = _110 * _112;
    float _122 = _114 * _112;
    float _124 = _116 * _112;
    out.m_29.x = _120;
    out.m_29.y = _122;
    out.m_29.z = _124;
    out.m_29.w = _118;
    return out;
}

