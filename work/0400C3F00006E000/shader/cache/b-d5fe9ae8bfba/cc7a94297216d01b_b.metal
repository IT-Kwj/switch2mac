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
    float4 m_35 [[color(0)]];
};

struct main0_in
{
    float4 m_30 [[user(locn0)]];
    float4 m_26 [[user(locn1)]];
    float4 m_32 [[user(locn2)]];
    float4 m_24 [[user(locn3), flat]];
    float4 m_28 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_24.y;
    float _46 = in.m_24.x;
    float _48 = in.m_26.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_28.w;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_30.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_30.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = (*spvDescriptorSet0.fp_c9)._m0[194].z * 0.15915493667125701904296875;
    float _74 = in.m_26.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_30.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_26.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = _72 * 6.283185482025146484375;
    float _94 = cos(_92);
    float _96 = in.m_32.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _72 * 6.283185482025146484375;
    float _104 = sin(_102);
    float _106 = 1.0 / _42;
    float _108 = _44 * _94;
    float _110 = fma(_46, _104, _108);
    float _112 = (*spvDescriptorSet0.fp_c9)._m0[194].w + (-5.0);
    float _114 = (*spvDescriptorSet0.fp_c9)._m0[194].w + 5.0;
    float _116 = precise::max(_112, _110);
    float _118 = _106 * _52;
    float _120 = _106 * _58;
    float _122 = precise::min(_114, _116);
    float _124 = _106 * _78;
    float _126 = _106 * _84;
    float _128 = _106 * _90;
    bool _132 = _120 != 1.0;
    bool _134 = isnan(_120);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = -_112;
    float _144 = _142 + _122;
    float _146 = _106 * _64;
    float _148 = _106 * _70;
    float _150 = -_126;
    float _152 = _150 + _128;
    float _154 = _144 * 0.100000001490116119384765625;
    float _156 = -_146;
    float _158 = _156 + _118;
    float _160 = -_148;
    float _162 = _160 + _124;
    float _164 = _106 * _100;
    float _166 = fma(_154, _152, _126);
    float _168 = fma(_154, _158, _146);
    float _170 = fma(_154, _162, _148);
    bool _172 = !_140;
    if (!_172)
    {
        float _174 = gl_FragCoord.x;
        float _176 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _178 = _174 / _176;
        float _180 = gl_FragCoord.y;
        float _182 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _184 = _180 / _182;
        float _186 = trunc(_178);
        int _189 = int(_186);
        float _191 = trunc(_184);
        int _193 = int(_191);
        int _195 = _189 + 2;
        int _197 = _195 >> 1;
        uint _200 = uint(int(uint(_193) >> uint(1)));
        int _202 = _197 ^ int(_200);
        int _204 = _202 << 16;
        int _206 = _204 ^ _197;
        int _208 = 983055 & _206;
        float _210 = _120 * 256.0;
        int _212 = _208 << 6;
        int _214 = _212 + _208;
        float _216 = trunc(_210);
        int _218 = int(_216);
        int _220 = _214 & 13369548;
        uint _222 = uint(int(uint(_220) >> uint(3)));
        int _224 = _220 | int(_222);
        int _226 = _224 & 5570560;
        int _228 = _224 & 85;
        uint _230 = uint(int(uint(_218) >> uint(7)));
        int _232 = int(_230) + _218;
        uint _234 = uint(int(uint(_226) >> uint(15)));
        int _236 = int(_234) + _228;
        bool _238 = uint(_232) > uint(_236);
        if (!_238)
        {
            discard_fragment();
        }
        if (!_238)
        {
            out.m_35.x = _168;
            out.m_35.y = _170;
            out.m_35.z = _166;
            out.m_35.w = _164;
            return out;
        }
    }
    float _240 = 0.0 + _164;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    out.m_35.x = 1.0;
    out.m_35.y = 1.0;
    out.m_35.z = 1.0;
    out.m_35.w = _242;
    return out;
}

