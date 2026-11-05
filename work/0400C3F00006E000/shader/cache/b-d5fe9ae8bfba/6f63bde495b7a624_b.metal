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
    constant _16* fp_c9 [[id(0)]];
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
    float4 m_30 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_32 [[user(locn5)]];
    float4 m_37 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_28.w;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_30.w;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_32.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _46;
    float _68 = _66 * _52;
    float _70 = _66 * _58;
    float _72 = _66 * _64;
    float _74 = _68 * _70;
    float _76 = 0.0 + _74;
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = _78 * _72;
    bool _84 = _80 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _86 = isnan(_80);
    bool _88 = _84 || _86;
    bool _90 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _92 = _88 || _90;
    float _94 = in.m_28.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_28.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_30.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_28.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_30.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_30.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    if (!_92)
    {
        discard_fragment();
    }
    float _130 = _66 * _98;
    float _132 = _66 * _104;
    float _134 = _66 * _110;
    float _136 = _66 * _116;
    float _138 = _66 * _122;
    float _140 = _66 * _128;
    float _142 = _130 * _134;
    float _144 = _136 * _138;
    float _146 = _132 * _140;
    if (!_92)
    {
        out.m_35.x = _142;
        out.m_35.y = _144;
        out.m_35.z = _146;
        out.m_35.w = _74;
        return out;
    }
    float _148 = _144 * 0.715200006961822509765625;
    float _150 = in.m_37.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_37.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_37.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = fma(_142, 0.2125999927520751953125, _148);
    float _170 = in.m_37.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = 0.0 + _80;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_146, 0.072200000286102294921875, _168);
    bool _182 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _184 = 1.0 / _180;
    float _186 = _184 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _192 = _66 * _154;
    float _194 = _66 * _160;
    float _196 = _190 * _192;
    float _198 = _66 * _166;
    float _200 = _66 * _174;
    float _202 = fma(_146, _196, _194);
    float _204 = fma(_142, _196, _198);
    float _206 = fma(_144, _196, _200);
    float _208 = _194;
    if (!_182)
    {
        _208 = _178;
    }
    float _210 = _208;
    bool _212 = !_182;
    float _214 = _210;
    if (!_212)
    {
        float _216 = in.m_39.w;
        float _218 = gl_FragCoord.w;
        float _220 = _216 * _218;
        float _222 = in.m_39.z;
        float _224 = gl_FragCoord.w;
        float _226 = _222 * _224;
        float _228 = _66 * _220;
        float _230 = _66 * _226;
        float _232 = 1.0 / _228;
        float _234 = _230 * _232;
        float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _238 = fma(_234, (*spvDescriptorSet0.fp_c8)._m0[30].w, _236);
        float _240 = 1.0 / _238;
        float _242 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _246 = fma(_240, _242, _244);
        float _248 = _246 * 8.0;
        float _250 = precise::clamp(_248, 0.0, 1.0);
        float _252 = _178 * _250;
        _214 = _252;
    }
    float _254 = _214;
    float _256 = 0.0 + _254;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    out.m_35.x = _204;
    out.m_35.y = _206;
    out.m_35.z = _202;
    out.m_35.w = _258;
    return out;
}

