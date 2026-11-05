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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
};

struct main0_out
{
    float4 m_31 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn0)]];
    float4 m_28 [[user(locn2)]];
    float4 m_26 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _40 = gl_FragCoord.w;
    float _42 = in.m_24.w;
    float _44 = gl_FragCoord.w;
    float _46 = _42 * _44;
    float _48 = in.m_26.w;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_28.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _40;
    float _62 = _60 * _46;
    float _64 = _60 * _52;
    float _66 = _60 * _58;
    float _68 = _62 * _64;
    float _70 = 0.0 + _68;
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = _72 * _66;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _86 = _82 || _84;
    float _88 = in.m_24.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_24.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_26.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_24.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_26.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_26.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    if (!_86)
    {
        discard_fragment();
    }
    float _124 = _60 * _92;
    float _126 = _60 * _98;
    float _128 = _60 * _104;
    float _130 = _60 * _110;
    float _132 = _60 * _116;
    float _134 = _60 * _122;
    float _136 = _124 * _128;
    float _138 = _130 * _132;
    float _140 = _126 * _134;
    if (!_86)
    {
        out.m_31.x = _136;
        out.m_31.y = _138;
        out.m_31.z = _140;
        out.m_31.w = _68;
        return out;
    }
    float _142 = in.m_33.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _60 * _146;
    bool _150 = _148 != 1.0;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    bool _160 = !_158;
    if (!_160)
    {
        float _162 = gl_FragCoord.x;
        float _164 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _166 = _162 / _164;
        float _168 = gl_FragCoord.y;
        float _170 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _172 = _168 / _170;
        float _174 = _148 * 256.0;
        float _176 = trunc(_174);
        int _179 = int(_176);
        float _181 = trunc(_166);
        int _183 = int(_181);
        float _185 = trunc(_172);
        int _187 = int(_185);
        int _189 = _183 + 2;
        int _191 = _189 >> 1;
        uint _194 = uint(int(uint(_187) >> uint(1)));
        int _196 = _191 ^ int(_194);
        int _198 = _196 << 16;
        int _200 = _198 ^ _191;
        int _202 = 983055 & _200;
        int _204 = _202 << 6;
        int _206 = _204 + _202;
        int _208 = _206 & 13369548;
        uint _210 = uint(int(uint(_208) >> uint(3)));
        int _212 = _208 | int(_210);
        uint _214 = uint(int(uint(_179) >> uint(7)));
        int _216 = int(_214) + _179;
        int _218 = _212 & 5570560;
        int _220 = _212 & 85;
        uint _222 = uint(int(uint(_218) >> uint(15)));
        int _224 = int(_222) + _220;
        bool _226 = uint(_216) > uint(_224);
        if (!_226)
        {
            discard_fragment();
        }
        if (!_226)
        {
            out.m_31.x = _136;
            out.m_31.y = _138;
            out.m_31.z = _140;
            out.m_31.w = _74;
            return out;
        }
    }
    float _228 = 0.0 + _74;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    out.m_31.x = 1.0;
    out.m_31.y = 1.0;
    out.m_31.z = 1.0;
    out.m_31.w = _230;
    return out;
}

