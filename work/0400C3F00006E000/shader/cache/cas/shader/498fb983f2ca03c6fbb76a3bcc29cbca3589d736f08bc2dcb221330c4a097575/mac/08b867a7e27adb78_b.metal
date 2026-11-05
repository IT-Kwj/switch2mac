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
    float _42 = in.m_20.x;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_20.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_20.w;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_22.w;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_20.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_22.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_22.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_22.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_24.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _34;
    float _98 = _96 * _40;
    float _100 = _96 * _46;
    float _102 = _96 * _52;
    float _104 = _96 * _58;
    float _106 = _96 * _64;
    bool _110 = _98 != 1.0;
    bool _112 = isnan(_98);
    bool _114 = _110 || _112;
    bool _116 = isnan(1.0);
    bool _118 = _114 || _116;
    float _120 = _96 * _70;
    float _122 = _96 * _76;
    float _124 = _96 * _82;
    float _126 = _96 * _88;
    float _128 = _96 * _94;
    float _130 = _104 * _106;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _100 * _122;
    float _136 = _102 * _124;
    float _138 = _120 * _126;
    float _140 = _132 * _128;
    bool _142 = !_118;
    if (!_142)
    {
        float _144 = gl_FragCoord.x;
        float _146 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _148 = _144 / _146;
        float _150 = gl_FragCoord.y;
        float _152 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _154 = _150 / _152;
        float _156 = trunc(_148);
        int _159 = int(_156);
        float _161 = trunc(_154);
        int _163 = int(_161);
        int _165 = _159 + 2;
        int _167 = _165 >> 1;
        uint _170 = uint(int(uint(_163) >> uint(1)));
        int _172 = _167 ^ int(_170);
        int _174 = _172 << 16;
        int _176 = _174 ^ _167;
        int _178 = 983055 & _176;
        float _180 = _98 * 256.0;
        int _182 = _178 << 6;
        int _184 = _182 + _178;
        float _186 = trunc(_180);
        int _188 = int(_186);
        int _190 = _184 & 13369548;
        uint _192 = uint(int(uint(_190) >> uint(3)));
        int _194 = _190 | int(_192);
        int _196 = _194 & 5570560;
        int _198 = _194 & 85;
        uint _200 = uint(int(uint(_188) >> uint(7)));
        int _202 = int(_200) + _188;
        uint _204 = uint(int(uint(_196) >> uint(15)));
        int _206 = int(_204) + _198;
        bool _208 = uint(_202) > uint(_206);
        if (!_208)
        {
            discard_fragment();
        }
        if (!_208)
        {
            out.m_27.x = _134;
            out.m_27.y = _136;
            out.m_27.z = _138;
            out.m_27.w = _140;
            return out;
        }
    }
    float _210 = 0.0 + _140;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    out.m_27.x = 1.0;
    out.m_27.y = 1.0;
    out.m_27.z = 1.0;
    out.m_27.w = _212;
    return out;
}

