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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
};

struct main0_out
{
    float4 m_35 [[color(0)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
    float4 m_37 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_30 [[user(locn4)]];
    float4 m_26 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_26.w;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_28.w;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_30.w;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_28.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_30.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_28.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_30.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_28.z;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_30.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_32.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _44;
    float _108 = _106 * _50;
    float _110 = _106 * _56;
    float _112 = _106 * _62;
    float _114 = _106 * _74;
    float _116 = _106 * _98;
    bool _120 = _108 != 1.0;
    bool _122 = isnan(_108);
    bool _124 = _120 || _122;
    bool _126 = isnan(1.0);
    bool _128 = _124 || _126;
    float _130 = _110 * _112;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _106 * _68;
    float _136 = _106 * _80;
    float _138 = _106 * _86;
    float _140 = _106 * _92;
    float _142 = _106 * _104;
    float _144 = _134 * _114;
    float _146 = _136 * _138;
    float _148 = _140 * _116;
    float _150 = _132 * _142;
    bool _152 = !_128;
    if (!_152)
    {
        float _154 = gl_FragCoord.x;
        float _156 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _158 = _154 / _156;
        float _160 = gl_FragCoord.y;
        float _162 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _164 = _160 / _162;
        float _166 = trunc(_158);
        int _169 = int(_166);
        float _171 = trunc(_164);
        int _173 = int(_171);
        int _175 = _169 + 2;
        int _177 = _175 >> 1;
        uint _180 = uint(int(uint(_173) >> uint(1)));
        int _182 = _177 ^ int(_180);
        int _184 = _182 << 16;
        int _186 = _184 ^ _177;
        int _188 = 983055 & _186;
        float _190 = _108 * 256.0;
        int _192 = _188 << 6;
        int _194 = _192 + _188;
        float _196 = trunc(_190);
        int _198 = int(_196);
        int _200 = _194 & 13369548;
        uint _202 = uint(int(uint(_200) >> uint(3)));
        int _204 = _200 | int(_202);
        int _206 = _204 & 5570560;
        int _208 = _204 & 85;
        uint _210 = uint(int(uint(_198) >> uint(7)));
        int _212 = int(_210) + _198;
        uint _214 = uint(int(uint(_206) >> uint(15)));
        int _216 = int(_214) + _208;
        bool _218 = uint(_212) > uint(_216);
        if (!_218)
        {
            discard_fragment();
        }
        if (!_218)
        {
            out.m_35.x = _144;
            out.m_35.y = _146;
            out.m_35.z = _148;
            out.m_35.w = _150;
            return out;
        }
    }
    float _220 = _146 * 0.715200006961822509765625;
    float _222 = 0.0 + _150;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_144, 0.2125999927520751953125, _220);
    bool _228 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _230 = fma(_148, 0.072200000286102294921875, _226);
    float _232 = 1.0 / _230;
    float _234 = _232 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _240 = _144 * _238;
    float _242 = _146 * _238;
    float _244 = _148 * _238;
    bool _246 = !_228;
    float _248 = _224;
    if (!_246)
    {
        float _250 = in.m_37.w;
        float _252 = gl_FragCoord.w;
        float _254 = _250 * _252;
        float _256 = in.m_37.z;
        float _258 = gl_FragCoord.w;
        float _260 = _256 * _258;
        float _262 = _106 * _254;
        float _264 = _106 * _260;
        float _266 = 1.0 / _262;
        float _268 = _264 * _266;
        float _270 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _272 = fma(_268, (*spvDescriptorSet0.fp_c8)._m0[30].w, _270);
        float _274 = 1.0 / _272;
        float _276 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _280 = fma(_274, _276, _278);
        float _282 = _280 * 8.0;
        float _284 = precise::clamp(_282, 0.0, 1.0);
        float _286 = _224 * _284;
        _248 = _286;
    }
    float _288 = _248;
    float _290 = 0.0 + _288;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    out.m_35.x = _240;
    out.m_35.y = _242;
    out.m_35.z = _244;
    out.m_35.w = _292;
    return out;
}

