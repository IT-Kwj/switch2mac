#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
};

struct main0_out
{
    float4 m_21 [[color(0)]];
};

struct main0_in
{
    float4 m_18 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _28 = gl_FragCoord.x;
    float _30 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _32 = _28 / _30;
    float _34 = gl_FragCoord.y;
    float _36 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _38 = _34 / _36;
    float _40 = gl_FragCoord.w;
    float _42 = in.m_18.z;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_18.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = trunc(_32);
    float _56 = precise::max(_54, 0.0);
    uint _59 = uint(_56);
    float _61 = trunc(_38);
    float _63 = precise::max(_61, 0.0);
    uint _65 = uint(_63);
    float _67 = 1.0 / _40;
    int _70 = int(_59) + 1;
    int _72 = _70 ^ int(_65);
    int _74 = _72 * 65536;
    float _76 = _67 * _46;
    float _78 = _67 * _52;
    int _80 = _74 ^ _70;
    int _82 = 983055 & _80;
    float _84 = _76 * _76;
    int _86 = _82 * 64;
    int _88 = _86 + _82;
    float _90 = fma(_78, _78, _84);
    int _92 = _88 & 13369548;
    float _94 = sqrt(_90);
    uint _96 = uint(int(uint(_92) >> uint(3)));
    int _98 = _92 | int(_96);
    int _100 = _98 & 5570560;
    int _102 = _98 & 85;
    uint _104 = uint(int(uint(_100) >> uint(15)));
    int _106 = int(_104) + _102;
    float _108 = fma(_94, 0.20000000298023223876953125, -3.0);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = float(uint(_106));
    float _114 = -_110;
    float _116 = _114 + 1.0;
    float _118 = _116 * _116;
    float _120 = fma(_112, 0.00390625, 0.001953125);
    bool _124 = _118 > _120;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    if (!_132)
    {
        discard_fragment();
    }
    if (!_132)
    {
        out.m_21.x = 0.0;
        out.m_21.y = 0.0;
        out.m_21.z = 0.0;
        out.m_21.w = 0.0;
        return out;
    }
    out.m_21.x = 1.0;
    out.m_21.y = 1.0;
    out.m_21.z = 1.0;
    out.m_21.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_21 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _28 = gl_FragCoord.x;
    float _30 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _32 = _28 / _30;
    float _34 = gl_FragCoord.y;
    float _36 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _38 = _34 / _36;
    float _40 = gl_FragCoord.w;
    float _42 = in.m_18.z;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_18.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = trunc(_32);
    float _56 = precise::max(_54, 0.0);
    uint _59 = uint(_56);
    float _61 = trunc(_38);
    float _63 = precise::max(_61, 0.0);
    uint _65 = uint(_63);
    float _67 = 1.0 / _40;
    int _70 = int(_59) + 1;
    int _72 = _70 ^ int(_65);
    int _74 = _72 * 65536;
    float _76 = _67 * _46;
    float _78 = _67 * _52;
    int _80 = _74 ^ _70;
    int _82 = 983055 & _80;
    float _84 = _76 * _76;
    int _86 = _82 * 64;
    int _88 = _86 + _82;
    float _90 = fma(_78, _78, _84);
    int _92 = _88 & 13369548;
    float _94 = sqrt(_90);
    uint _96 = uint(int(uint(_92) >> uint(3)));
    int _98 = _92 | int(_96);
    int _100 = _98 & 5570560;
    int _102 = _98 & 85;
    uint _104 = uint(int(uint(_100) >> uint(15)));
    int _106 = int(_104) + _102;
    float _108 = fma(_94, 0.20000000298023223876953125, -3.0);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = float(uint(_106));
    float _114 = -_110;
    float _116 = _114 + 1.0;
    float _118 = _116 * _116;
    float _120 = fma(_112, 0.00390625, 0.001953125);
    bool _124 = _118 > _120;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    if (!_132)
    {
        discard_fragment();
    }
    if (!_132)
    {
        out.m_21.x = 0.0;
        out.m_21.y = 0.0;
        out.m_21.z = 0.0;
        out.m_21.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_21)};
    }
    out.m_21.x = 1.0;
    out.m_21.y = 1.0;
    out.m_21.z = 1.0;
    out.m_21.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_21)};
}

