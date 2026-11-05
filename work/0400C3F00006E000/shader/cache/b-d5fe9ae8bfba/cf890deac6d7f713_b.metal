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
    float _146 = _142 * 0.715200006961822509765625;
    float _148 = 0.0 + _78;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_140, 0.2125999927520751953125, _146);
    bool _154 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _156 = fma(_144, 0.072200000286102294921875, _152);
    float _158 = 1.0 / _156;
    float _160 = _158 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_162, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _166 = _140 * _164;
    float _168 = _142 * _164;
    float _170 = _144 * _164;
    float _172 = _164;
    if (!_154)
    {
        _172 = _150;
    }
    float _174 = _172;
    bool _176 = !_154;
    float _178 = _174;
    if (!_176)
    {
        float _180 = in.m_37.w;
        float _182 = gl_FragCoord.w;
        float _184 = _180 * _182;
        float _186 = in.m_37.z;
        float _188 = gl_FragCoord.w;
        float _190 = _186 * _188;
        float _192 = _64 * _184;
        float _194 = _64 * _190;
        float _196 = 1.0 / _192;
        float _198 = _194 * _196;
        float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _202 = fma(_198, (*spvDescriptorSet0.fp_c8)._m0[30].w, _200);
        float _204 = 1.0 / _202;
        float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _208 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _210 = fma(_204, _206, _208);
        float _212 = _210 * 8.0;
        float _214 = precise::clamp(_212, 0.0, 1.0);
        float _216 = _150 * _214;
        _178 = _216;
    }
    float _218 = _178;
    float _220 = 0.0 + _218;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    out.m_35.x = _166;
    out.m_35.y = _168;
    out.m_35.z = _170;
    out.m_35.w = _222;
    return out;
}

