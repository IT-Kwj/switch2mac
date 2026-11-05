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
    float4 m_37 [[user(locn3)]];
    float4 m_35 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_28.w;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_30.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float _64 = 0.0 + _60;
    float _66 = precise::clamp(_64, 0.0, 1.0);
    float _68 = _66 * _62;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _74 = isnan(_68);
    bool _76 = _72 || _74;
    bool _78 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _80 = _76 || _78;
    float _82 = in.m_28.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_28.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_28.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    if (!_80)
    {
        discard_fragment();
    }
    float _100 = _58 * _86;
    float _102 = _58 * _92;
    float _104 = _58 * _98;
    if (!_80)
    {
        out.m_33.x = _100;
        out.m_33.y = _102;
        out.m_33.z = _104;
        out.m_33.w = _60;
        return out;
    }
    float _106 = _102 * 0.715200006961822509765625;
    float _108 = in.m_35.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_35.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_35.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = fma(_100, 0.2125999927520751953125, _106);
    float _128 = in.m_35.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = fma(_104, 0.072200000286102294921875, _126);
    bool _136 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _138 = 1.0 / _134;
    float _140 = _138 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _58 * _112;
    float _146 = fma(_142, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _148 = _58 * _118;
    float _150 = _146 * _144;
    float _152 = 0.0 + _68;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _58 * _124;
    float _158 = _58 * _132;
    float _160 = fma(_104, _150, _148);
    float _162 = fma(_100, _150, _156);
    float _164 = fma(_102, _150, _158);
    float _166 = _148;
    if (!_136)
    {
        _166 = _154;
    }
    float _168 = _166;
    bool _170 = !_136;
    float _172 = _168;
    if (!_170)
    {
        float _174 = in.m_37.w;
        float _176 = gl_FragCoord.w;
        float _178 = _174 * _176;
        float _180 = in.m_37.z;
        float _182 = gl_FragCoord.w;
        float _184 = _180 * _182;
        float _186 = _58 * _178;
        float _188 = _58 * _184;
        float _190 = 1.0 / _186;
        float _192 = _188 * _190;
        float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _196 = fma(_192, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
        float _198 = 1.0 / _196;
        float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _204 = fma(_198, _200, _202);
        float _206 = _204 * 8.0;
        float _208 = precise::clamp(_206, 0.0, 1.0);
        float _210 = _154 * _208;
        _172 = _210;
    }
    float _212 = _172;
    float _214 = 0.0 + _212;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    out.m_33.x = _162;
    out.m_33.y = _164;
    out.m_33.z = _160;
    out.m_33.w = _216;
    return out;
}

