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
    float _36 = in.m_24.x;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_24.y;
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
    bool _66 = _58 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _68 = isnan(_58);
    bool _70 = _66 || _68;
    bool _72 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _74 = _70 || _72;
    bool _76 = _60 < (*spvDescriptorSet0.fp_c3)._m0[7].y;
    bool _78 = !_74;
    bool _80 = _76 || _78;
    bool _82 = _62 < (*spvDescriptorSet0.fp_c3)._m0[7].z;
    bool _84 = _82 || _80;
    bool _86 = !_84;
    float _88 = _86 ? _58 : 0.0;
    bool _90 = !_84;
    float _92 = _90 ? _60 : 0.0;
    bool _94 = _88 > (*spvDescriptorSet0.fp_c3)._m0[8].x;
    bool _96 = !_84;
    float _98 = _96 ? _62 : 1.0;
    bool _100 = _92 > (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _102 = _100 || _94;
    bool _104 = _98 > (*spvDescriptorSet0.fp_c3)._m0[8].z;
    bool _106 = _104 || _102;
    bool _108 = !_106;
    float _110 = _108 ? _88 : 1.0;
    bool _112 = !_106;
    float _114 = _112 ? _92 : 0.0;
    bool _116 = !_106;
    float _118 = _116 ? _98 : 0.0;
    float _120 = abs(_110);
    float _122 = log2(_120);
    float _124 = abs(_114);
    float _126 = log2(_124);
    float _128 = abs(_118);
    float _130 = log2(_128);
    float _132 = _122 * _54;
    float _134 = _126 * _54;
    float _136 = exp2(_132);
    float _138 = _130 * _54;
    float _140 = exp2(_134);
    float _142 = exp2(_138);
    out.m_27.x = _136;
    out.m_27.y = _140;
    out.m_27.z = _142;
    out.m_27.w = 1.0;
    return out;
}

