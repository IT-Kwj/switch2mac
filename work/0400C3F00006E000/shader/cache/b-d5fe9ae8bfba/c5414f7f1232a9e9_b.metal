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
    float4 m_37 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_30 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_28.w;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_30.w;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_32.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float _72 = _66 * _68;
    float _74 = 0.0 + _72;
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = _76 * _70;
    bool _82 = _78 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _84 = isnan(_78);
    bool _86 = _82 || _84;
    bool _88 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _90 = _86 || _88;
    float _92 = in.m_28.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_28.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_28.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    if (!_90)
    {
        discard_fragment();
    }
    float _110 = _64 * _96;
    float _112 = _64 * _102;
    float _114 = _64 * _108;
    if (!_90)
    {
        out.m_35.x = _110;
        out.m_35.y = _112;
        out.m_35.z = _114;
        out.m_35.w = _72;
        return out;
    }
    float _116 = _112 * 0.715200006961822509765625;
    float _118 = 0.0 + _78;
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = fma(_110, 0.2125999927520751953125, _116);
    bool _124 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _126 = fma(_114, 0.072200000286102294921875, _122);
    float _128 = 1.0 / _126;
    float _130 = _128 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _136 = _110 * _134;
    float _138 = _112 * _134;
    float _140 = _114 * _134;
    float _142 = _134;
    if (!_124)
    {
        _142 = _120;
    }
    float _144 = _142;
    bool _146 = !_124;
    float _148 = _144;
    if (!_146)
    {
        float _150 = in.m_37.w;
        float _152 = gl_FragCoord.w;
        float _154 = _150 * _152;
        float _156 = in.m_37.z;
        float _158 = gl_FragCoord.w;
        float _160 = _156 * _158;
        float _162 = _64 * _154;
        float _164 = _64 * _160;
        float _166 = 1.0 / _162;
        float _168 = _164 * _166;
        float _170 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _172 = fma(_168, (*spvDescriptorSet0.fp_c8)._m0[30].w, _170);
        float _174 = 1.0 / _172;
        float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _178 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _180 = fma(_174, _176, _178);
        float _182 = _180 * 8.0;
        float _184 = precise::clamp(_182, 0.0, 1.0);
        float _186 = _120 * _184;
        _148 = _186;
    }
    float _188 = _148;
    float _190 = 0.0 + _188;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    out.m_35.x = _136;
    out.m_35.y = _138;
    out.m_35.z = _140;
    out.m_35.w = _192;
    return out;
}

