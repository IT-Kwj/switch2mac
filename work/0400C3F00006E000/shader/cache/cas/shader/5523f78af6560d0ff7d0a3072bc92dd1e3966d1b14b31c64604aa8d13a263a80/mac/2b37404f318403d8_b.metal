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
    float4 m_26 [[user(locn0)]];
    float4 m_24 [[user(locn1)]];
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
    float _74 = in.m_26.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _36;
    float _82 = _80 * _42;
    float _84 = _80 * _48;
    float _86 = _80 * _54;
    float _88 = _80 * _66;
    float _90 = _82 * _82;
    float _92 = _84 + _82;
    float _94 = _80 * _72;
    float _96 = fma(_84, _84, _90);
    float _98 = _86 + _92;
    float _100 = fma(_86, _86, _96);
    float _102 = _80 * _78;
    float _104 = rsqrt(_100);
    float _106 = _102 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _108 = _104 * _98;
    float _110 = fma(_108, -0.288675129413604736328125, 0.5);
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _80 * _60;
    float _116 = -_114;
    float _118 = fma(_112, _116, _114);
    float _120 = -_88;
    float _122 = fma(_112, _120, _88);
    float _124 = -_94;
    float _126 = fma(_112, _124, _94);
    float _128 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _130 = _122 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    out.m_29.x = _128;
    out.m_29.y = _130;
    out.m_29.z = _132;
    out.m_29.w = _106;
    return out;
}

