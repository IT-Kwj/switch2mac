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

struct main0_out
{
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_18 [[user(locn0)]];
    float4 m_20 [[user(locn1)]];
    float4 m_22 [[user(locn2)]];
    float4 m_24 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_18.y;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_20.y;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_18.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_20.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_22.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_24.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _34;
    float _74 = _72 * _40;
    float _76 = _72 * _46;
    float _78 = _72 * _52;
    float _80 = _72 * _58;
    float _82 = -_74;
    float _84 = _82 + _76;
    float _86 = -_76;
    float _88 = _74 + _86;
    float _90 = -_78;
    float _92 = _90 + _80;
    float _94 = -_80;
    float _96 = _78 + _94;
    float _98 = _84 * _84;
    float _100 = _88 * _88;
    float _102 = fma(_92, _92, _98);
    float _104 = fma(_96, _96, _100);
    float _106 = _72 * _64;
    float _108 = _72 * _70;
    float _110 = sqrt(_104);
    float _112 = rsqrt(_102);
    float _114 = -_110;
    float _116 = fma(_114, _106, 1.0);
    float _118 = _112 * 0.5;
    float _120 = fma(_92, _118, 0.5);
    float _122 = fma(_84, _118, 0.5);
    out.m_27.x = _116;
    out.m_27.y = _120;
    out.m_27.z = _122;
    out.m_27.w = _108;
    return out;
}

