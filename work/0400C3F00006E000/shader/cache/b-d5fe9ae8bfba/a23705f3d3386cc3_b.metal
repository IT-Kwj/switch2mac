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
    float4 m_30 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
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
    float _66 = in.m_32.w;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_34.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _46;
    float _80 = _78 * _52;
    float _82 = _78 * _58;
    float _84 = _80 * _80;
    float _86 = fma(_82, _82, _84);
    float _88 = sqrt(_86);
    float _90 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _92 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _90;
    float _94 = 1.0 / _92;
    float _96 = _88 * 2.0;
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = -_98;
    float _102 = _100 + 1.0;
    float _104 = precise::max(_102, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _106 = precise::min(_104, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _108 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _110 = _106 + _108;
    float _112 = _110 * _94;
    float _114 = _78 * _64;
    float _116 = _78 * _70;
    float _118 = _78 * _76;
    float _120 = _112 * _114;
    float _122 = _116 * _120;
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = _124 * _118;
    bool _130 = _126 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _138 = _134 || _136;
    float _140 = in.m_32.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_32.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_32.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_30.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_30.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_30.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    if (!_138)
    {
        discard_fragment();
    }
    float _176 = _112 * _112;
    float _178 = -_176;
    float _180 = _178 + 1.0;
    float _182 = _78 * _144;
    float _184 = _78 * _150;
    float _186 = _78 * _156;
    float _188 = _182 * _180;
    float _190 = _184 * _180;
    float _192 = _186 * _180;
    float _194 = _78 * _162;
    float _196 = _78 * _168;
    float _198 = _78 * _174;
    float _200 = fma(_176, _194, _190);
    float _202 = fma(_176, _196, _188);
    float _204 = fma(_176, _198, _192);
    if (!_138)
    {
        out.m_37.x = _200;
        out.m_37.y = _202;
        out.m_37.z = _204;
        out.m_37.w = _124;
        return out;
    }
    float _206 = _202 * 0.715200006961822509765625;
    float _208 = 0.0 + _126;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = fma(_200, 0.2125999927520751953125, _206);
    bool _214 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _216 = fma(_204, 0.072200000286102294921875, _212);
    float _218 = 1.0 / _216;
    float _220 = _218 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = fma(_222, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _226 = _200 * _224;
    float _228 = _202 * _224;
    float _230 = _204 * _224;
    float _232 = _224;
    if (!_214)
    {
        _232 = _210;
    }
    float _234 = _232;
    bool _236 = !_214;
    float _238 = _234;
    if (!_236)
    {
        float _240 = in.m_39.w;
        float _242 = gl_FragCoord.w;
        float _244 = _240 * _242;
        float _246 = in.m_39.z;
        float _248 = gl_FragCoord.w;
        float _250 = _246 * _248;
        float _252 = _78 * _244;
        float _254 = _78 * _250;
        float _256 = 1.0 / _252;
        float _258 = _254 * _256;
        float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _262 = fma(_258, (*spvDescriptorSet0.fp_c8)._m0[30].w, _260);
        float _264 = 1.0 / _262;
        float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _268 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _270 = fma(_264, _266, _268);
        float _272 = _270 * 8.0;
        float _274 = precise::clamp(_272, 0.0, 1.0);
        float _276 = _210 * _274;
        _238 = _276;
    }
    float _278 = _238;
    float _280 = 0.0 + _278;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    out.m_37.x = _226;
    out.m_37.y = _228;
    out.m_37.z = _230;
    out.m_37.w = _282;
    return out;
}

