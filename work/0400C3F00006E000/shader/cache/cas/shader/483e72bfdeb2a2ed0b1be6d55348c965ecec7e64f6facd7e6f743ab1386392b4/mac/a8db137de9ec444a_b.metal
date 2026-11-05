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
    float _98 = in.m_28.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_30.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_28.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_30.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_30.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    if (!_90)
    {
        discard_fragment();
    }
    float _128 = _64 * _96;
    float _130 = _64 * _102;
    float _132 = _64 * _108;
    float _134 = _64 * _114;
    float _136 = _64 * _120;
    float _138 = _64 * _126;
    float _140 = _128 * _132;
    float _142 = _134 * _136;
    float _144 = _130 * _138;
    if (!_90)
    {
        out.m_35.x = _140;
        out.m_35.y = _142;
        out.m_35.z = _144;
        out.m_35.w = _72;
        return out;
    }
    bool _146 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _148 = 0.0 + _78;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    bool _152 = !_146;
    float _154 = _150;
    if (!_152)
    {
        float _156 = in.m_37.w;
        float _158 = gl_FragCoord.w;
        float _160 = _156 * _158;
        float _162 = in.m_37.z;
        float _164 = gl_FragCoord.w;
        float _166 = _162 * _164;
        float _168 = _64 * _160;
        float _170 = _64 * _166;
        float _172 = 1.0 / _168;
        float _174 = _170 * _172;
        float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _178 = fma(_174, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
        float _180 = 1.0 / _178;
        float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _186 = fma(_180, _182, _184);
        float _188 = _186 * 8.0;
        float _190 = precise::clamp(_188, 0.0, 1.0);
        float _192 = _150 * _190;
        _154 = _192;
    }
    float _194 = _154;
    float _196 = 0.0 + _194;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    out.m_35.x = _140;
    out.m_35.y = _142;
    out.m_35.z = _144;
    out.m_35.w = _198;
    return out;
}

