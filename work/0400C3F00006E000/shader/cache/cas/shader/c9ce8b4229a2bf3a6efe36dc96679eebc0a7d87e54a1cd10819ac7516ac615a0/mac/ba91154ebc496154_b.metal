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
    float4 m_18 [[user(locn6)]];
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
    float _42 = in.m_18.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = trunc(_32);
    float _50 = precise::max(_48, 0.0);
    uint _53 = uint(_50);
    float _55 = trunc(_38);
    float _57 = precise::max(_55, 0.0);
    uint _59 = uint(_57);
    int _62 = int(_53) + 1;
    float _64 = 1.0 / _40;
    int _66 = _62 ^ int(_59);
    int _68 = _66 * 65536;
    int _70 = _68 ^ _62;
    int _72 = 983055 & _70;
    int _74 = _72 * 64;
    int _76 = _74 + _72;
    int _78 = _76 & 13369548;
    uint _80 = uint(int(uint(_78) >> uint(3)));
    int _82 = _78 | int(_80);
    int _84 = _82 & 5570560;
    int _86 = _82 & 85;
    uint _88 = uint(int(uint(_84) >> uint(15)));
    int _90 = int(_88) + _86;
    float _92 = float(uint(_90));
    float _94 = _64 * _46;
    float _96 = fma(_92, 0.00390625, 0.001953125);
    bool _100 = _94 > _96;
    bool _102 = isnan(_94);
    bool _104 = _100 || _102;
    bool _106 = isnan(_96);
    bool _108 = _104 || _106;
    if (!_108)
    {
        discard_fragment();
    }
    if (!_108)
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
    float _42 = in.m_18.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = trunc(_32);
    float _50 = precise::max(_48, 0.0);
    uint _53 = uint(_50);
    float _55 = trunc(_38);
    float _57 = precise::max(_55, 0.0);
    uint _59 = uint(_57);
    int _62 = int(_53) + 1;
    float _64 = 1.0 / _40;
    int _66 = _62 ^ int(_59);
    int _68 = _66 * 65536;
    int _70 = _68 ^ _62;
    int _72 = 983055 & _70;
    int _74 = _72 * 64;
    int _76 = _74 + _72;
    int _78 = _76 & 13369548;
    uint _80 = uint(int(uint(_78) >> uint(3)));
    int _82 = _78 | int(_80);
    int _84 = _82 & 5570560;
    int _86 = _82 & 85;
    uint _88 = uint(int(uint(_84) >> uint(15)));
    int _90 = int(_88) + _86;
    float _92 = float(uint(_90));
    float _94 = _64 * _46;
    float _96 = fma(_92, 0.00390625, 0.001953125);
    bool _100 = _94 > _96;
    bool _102 = isnan(_94);
    bool _104 = _100 || _102;
    bool _106 = isnan(_96);
    bool _108 = _104 || _106;
    if (!_108)
    {
        discard_fragment();
    }
    if (!_108)
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

