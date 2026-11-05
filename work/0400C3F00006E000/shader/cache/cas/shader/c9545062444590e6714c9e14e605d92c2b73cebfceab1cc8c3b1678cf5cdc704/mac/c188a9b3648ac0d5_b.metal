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
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_30 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_28 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_28.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_28.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_30.w;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_32.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _46;
    float _74 = _72 * _52;
    float _76 = _72 * _58;
    float _78 = in.m_34.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = fma(_74, 2.0, -1.0);
    float _86 = fma(_76, 2.0, -1.0);
    float _88 = _72 * _64;
    float _90 = _72 * _70;
    float _92 = _84 * _84;
    float _94 = fma(_86, _86, _92);
    float _96 = 0.0 + _94;
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = -_98;
    float _102 = _100 + 1.0;
    float _104 = abs(_102);
    float _106 = log2(_104);
    float _108 = _72 * _82;
    float _110 = _106 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _112 = exp2(_110);
    float _114 = _108 * _112;
    float _116 = _88 * _114;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _118 * _90;
    bool _124 = _120 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _132 = _128 || _130;
    float _134 = sqrt(_94);
    if (!_132)
    {
        discard_fragment();
    }
    float _136 = 0.0 + _134;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = in.m_30.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_30.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_30.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = -_138;
    float _160 = _158 + 1.0;
    float _162 = in.m_34.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_34.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_34.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = abs(_160);
    float _182 = log2(_180);
    float _184 = _182 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _186 = exp2(_184);
    float _188 = _72 * _144;
    float _190 = _72 * _150;
    float _192 = _72 * _156;
    float _194 = _72 * _178;
    float _196 = -_186;
    float _198 = _196 + 1.0;
    float _200 = _188 * _198;
    float _202 = _190 * _198;
    float _204 = _192 * _198;
    float _206 = _72 * _166;
    float _208 = _72 * _172;
    float _210 = fma(_186, _206, _200);
    float _212 = fma(_186, _208, _202);
    float _214 = fma(_186, _194, _204);
    if (!_132)
    {
        out.m_37.x = _210;
        out.m_37.y = _212;
        out.m_37.z = _214;
        out.m_37.w = _118;
        return out;
    }
    float _216 = _212 * 0.715200006961822509765625;
    float _218 = 0.0 + _120;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = fma(_210, 0.2125999927520751953125, _216);
    bool _224 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _226 = fma(_214, 0.072200000286102294921875, _222);
    float _228 = 1.0 / _226;
    float _230 = _228 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_232, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _236 = _210 * _234;
    float _238 = _212 * _234;
    float _240 = _214 * _234;
    float _242 = _234;
    if (!_224)
    {
        _242 = _220;
    }
    float _244 = _242;
    bool _246 = !_224;
    float _248 = _244;
    if (!_246)
    {
        float _250 = in.m_39.w;
        float _252 = gl_FragCoord.w;
        float _254 = _250 * _252;
        float _256 = in.m_39.z;
        float _258 = gl_FragCoord.w;
        float _260 = _256 * _258;
        float _262 = _72 * _254;
        float _264 = _72 * _260;
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
        float _286 = _220 * _284;
        _248 = _286;
    }
    float _288 = _248;
    float _290 = 0.0 + _288;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    out.m_37.x = _236;
    out.m_37.y = _238;
    out.m_37.z = _240;
    out.m_37.w = _292;
    return out;
}

