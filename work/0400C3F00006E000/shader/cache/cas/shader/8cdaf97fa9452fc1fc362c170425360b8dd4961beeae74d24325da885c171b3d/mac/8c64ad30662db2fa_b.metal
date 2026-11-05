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
    float4 m_31 [[color(0)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
    float4 m_26 [[user(locn1)]];
    float4 m_24 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _38 = gl_FragCoord.w;
    float _40 = in.m_24.y;
    float _42 = gl_FragCoord.w;
    float _44 = _40 * _42;
    float _46 = in.m_24.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_24.z;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_26.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_28.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_28.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_28.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _38;
    float _84 = _82 * _44;
    float _86 = _82 * _50;
    float _88 = _82 * _56;
    float _90 = _82 * _80;
    float _92 = _84 * _84;
    float _94 = fma(_86, _86, _92);
    float _96 = in.m_28.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = fma(_88, _88, _94);
    float _104 = rsqrt(_102);
    float _106 = _84 * _104;
    float _108 = _86 * _104;
    float _110 = _88 * _104;
    float _112 = _82 * _74;
    float _114 = _106 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _116 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _114);
    float _118 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[7].z, _116);
    float _120 = fma(_118, -0.5, -0.5);
    float _122 = _82 * _62;
    float _124 = fma(_122, _120, 1.0);
    float _126 = _82 * _68;
    float _128 = _82 * _100;
    float _130 = _124 * _126;
    float _132 = _124 * _112;
    float _134 = _124 * _90;
    out.m_31.x = _130;
    out.m_31.y = _132;
    out.m_31.z = _134;
    out.m_31.w = _128;
    return out;
}

