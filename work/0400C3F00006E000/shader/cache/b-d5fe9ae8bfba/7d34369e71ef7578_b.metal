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
    float4 m_33 [[color(0)]];
};

struct main0_in
{
    float4 m_28 [[user(locn0)]];
    float4 m_30 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_28.w;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_30.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float _62 = 0.0 + _58;
    float _64 = precise::clamp(_62, 0.0, 1.0);
    float _66 = _64 * _60;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _72 = isnan(_66);
    bool _74 = _70 || _72;
    bool _76 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _78 = _74 || _76;
    float _80 = in.m_28.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_28.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_28.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    if (!_78)
    {
        discard_fragment();
    }
    float _98 = _56 * _84;
    float _100 = _56 * _90;
    float _102 = _56 * _96;
    if (!_78)
    {
        out.m_33.x = _98;
        out.m_33.y = _100;
        out.m_33.z = _102;
        out.m_33.w = _58;
        return out;
    }
    bool _104 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _106 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (!_104)
    {
        _106 = _66;
    }
    float _108 = _106;
    bool _110 = !_104;
    float _112 = _108;
    if (!_110)
    {
        float _114 = in.m_35.w;
        float _116 = gl_FragCoord.w;
        float _118 = _114 * _116;
        float _120 = in.m_35.z;
        float _122 = gl_FragCoord.w;
        float _124 = _120 * _122;
        float _126 = _56 * _118;
        float _128 = _56 * _124;
        float _130 = 1.0 / _126;
        float _132 = _128 * _130;
        float _134 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _136 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _134);
        float _138 = 1.0 / _136;
        float _140 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _142 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _144 = fma(_138, _140, _142);
        float _146 = _144 * 8.0;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        float _150 = _66 * _148;
        _112 = _150;
    }
    float _152 = _112;
    float _154 = 0.0 + _152;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    out.m_33.x = _98;
    out.m_33.y = _100;
    out.m_33.z = _102;
    out.m_33.w = _156;
    return out;
}

