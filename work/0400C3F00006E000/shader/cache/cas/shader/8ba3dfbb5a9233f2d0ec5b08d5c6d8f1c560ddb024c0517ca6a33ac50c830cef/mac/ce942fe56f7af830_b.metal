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
    float4 m_27 [[color(0)]];
};

struct main0_in
{
    float4 m_20 [[user(locn0)]];
    float4 m_24 [[user(locn2)]];
    float4 m_22 [[user(locn3)]];
    float4 m_18 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = in.m_18.w;
    float _38 = gl_FragCoord.w;
    float _40 = _36 * _38;
    float _42 = in.m_20.w;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_22.w;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_24.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_20.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_20.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_20.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _34;
    float _80 = _78 * _40;
    float _82 = _78 * _46;
    float _84 = _78 * _52;
    float _86 = _78 * _58;
    float _88 = _78 * _76;
    bool _92 = _80 != 1.0;
    bool _94 = isnan(_80);
    bool _96 = _92 || _94;
    bool _98 = isnan(1.0);
    bool _100 = _96 || _98;
    float _102 = _82 * _84;
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _78 * _64;
    float _108 = _78 * _70;
    float _110 = _104 * _86;
    bool _112 = !_100;
    if (!_112)
    {
        float _114 = gl_FragCoord.x;
        float _116 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _118 = _114 / _116;
        float _120 = gl_FragCoord.y;
        float _122 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _124 = _120 / _122;
        float _126 = trunc(_118);
        int _129 = int(_126);
        float _131 = trunc(_124);
        int _133 = int(_131);
        int _135 = _129 + 2;
        int _137 = _135 >> 1;
        uint _140 = uint(int(uint(_133) >> uint(1)));
        int _142 = _137 ^ int(_140);
        int _144 = _142 * 65536;
        int _146 = _144 ^ _137;
        int _148 = 983055 & _146;
        float _150 = _80 * 256.0;
        int _152 = _148 * 64;
        int _154 = _152 + _148;
        float _156 = trunc(_150);
        int _158 = int(_156);
        int _160 = _154 & 13369548;
        uint _162 = uint(int(uint(_160) >> uint(3)));
        int _164 = _160 | int(_162);
        int _166 = _164 & 5570560;
        int _168 = _164 & 85;
        uint _170 = uint(int(uint(_158) >> uint(7)));
        int _172 = int(_170) + _158;
        uint _174 = uint(int(uint(_166) >> uint(15)));
        int _176 = int(_174) + _168;
        bool _178 = uint(_172) > uint(_176);
        if (!_178)
        {
            discard_fragment();
        }
        if (!_178)
        {
            out.m_27.x = _106;
            out.m_27.y = _108;
            out.m_27.z = _88;
            out.m_27.w = _110;
            return out;
        }
    }
    float _180 = 0.0 + _110;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    out.m_27.x = 1.0;
    out.m_27.y = 1.0;
    out.m_27.z = 1.0;
    out.m_27.w = _182;
    return out;
}

