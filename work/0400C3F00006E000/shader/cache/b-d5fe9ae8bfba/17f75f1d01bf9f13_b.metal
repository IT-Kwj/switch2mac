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
    float4 m_30 [[user(locn0)]];
    float4 m_39 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_26 [[user(locn4)]];
    float4 m_28 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_26.w;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_28.w;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_30.w;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_32.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_30.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_30.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_30.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _46;
    float _92 = _90 * _52;
    float _94 = _90 * _58;
    float _96 = _90 * _64;
    float _98 = _90 * _70;
    bool _102 = _94 != 1.0;
    bool _104 = isnan(_94);
    bool _106 = _102 || _104;
    bool _108 = isnan(1.0);
    bool _110 = _106 || _108;
    float _112 = _96 * _92;
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _90 * _82;
    float _118 = _114 * _98;
    float _120 = _90 * _76;
    float _122 = _90 * _88;
    bool _124 = !_110;
    if (!_124)
    {
        float _126 = gl_FragCoord.x;
        float _128 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _130 = _126 / _128;
        float _132 = gl_FragCoord.y;
        float _134 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _136 = _132 / _134;
        float _138 = _94 * 256.0;
        float _140 = trunc(_138);
        int _143 = int(_140);
        float _145 = trunc(_130);
        int _147 = int(_145);
        float _149 = trunc(_136);
        int _151 = int(_149);
        int _153 = _147 + 2;
        int _155 = _153 >> 1;
        uint _158 = uint(int(uint(_151) >> uint(1)));
        int _160 = _155 ^ int(_158);
        int _162 = _160 << 16;
        int _164 = _162 ^ _155;
        int _166 = 983055 & _164;
        int _168 = _166 << 6;
        int _170 = _168 + _166;
        int _172 = _170 & 13369548;
        uint _174 = uint(int(uint(_172) >> uint(3)));
        int _176 = _172 | int(_174);
        uint _178 = uint(int(uint(_143) >> uint(7)));
        int _180 = int(_178) + _143;
        int _182 = _176 & 5570560;
        int _184 = _176 & 85;
        uint _186 = uint(int(uint(_182) >> uint(15)));
        int _188 = int(_186) + _184;
        bool _190 = uint(_180) > uint(_188);
        if (!_190)
        {
            discard_fragment();
        }
        if (!_190)
        {
            out.m_35.x = _120;
            out.m_35.y = _116;
            out.m_35.z = _122;
            out.m_35.w = _118;
            return out;
        }
    }
    float _192 = _116 * 0.715200006961822509765625;
    float _194 = in.m_37.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_37.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_37.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = fma(_120, 0.2125999927520751953125, _192);
    float _214 = in.m_37.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = fma(_122, 0.072200000286102294921875, _212);
    bool _222 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _224 = 1.0 / _220;
    float _226 = _224 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = fma(_228, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _232 = _90 * _198;
    float _234 = 0.0 + _118;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = _90 * _204;
    float _240 = _230 * _232;
    float _242 = _90 * _210;
    float _244 = _90 * _218;
    float _246 = fma(_120, _240, _238);
    float _248 = fma(_116, _240, _242);
    float _250 = fma(_122, _240, _244);
    float _252 = _238;
    if (!_222)
    {
        _252 = _236;
    }
    float _254 = _252;
    bool _256 = !_222;
    float _258 = _254;
    if (!_256)
    {
        float _260 = in.m_39.w;
        float _262 = gl_FragCoord.w;
        float _264 = _260 * _262;
        float _266 = in.m_39.z;
        float _268 = gl_FragCoord.w;
        float _270 = _266 * _268;
        float _272 = _90 * _264;
        float _274 = _90 * _270;
        float _276 = 1.0 / _272;
        float _278 = _274 * _276;
        float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _282 = fma(_278, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
        float _284 = 1.0 / _282;
        float _286 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _290 = fma(_284, _286, _288);
        float _292 = _290 * 8.0;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = _236 * _294;
        _258 = _296;
    }
    float _298 = _258;
    float _300 = 0.0 + _298;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    out.m_35.x = _246;
    out.m_35.y = _248;
    out.m_35.z = _250;
    out.m_35.w = _302;
    return out;
}

