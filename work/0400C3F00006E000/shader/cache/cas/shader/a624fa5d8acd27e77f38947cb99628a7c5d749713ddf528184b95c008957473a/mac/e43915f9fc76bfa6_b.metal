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
    float4 m_41 [[user(locn3)]];
    float4 m_28 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_28.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_28.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_30.w;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_32.w;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_34.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _48;
    float _82 = _80 * _54;
    float _84 = _80 * _60;
    float _86 = _82 * _82;
    float _88 = fma(_84, _84, _86);
    float _90 = sqrt(_88);
    float _92 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _94 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _92;
    float _96 = 1.0 / _94;
    float _98 = _90 * 2.0;
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = -_100;
    float _104 = _102 + 1.0;
    float _106 = precise::max(_104, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _108 = precise::min(_106, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _110 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _112 = _108 + _110;
    float _114 = _112 * _96;
    float _116 = _80 * _66;
    float _118 = _80 * _72;
    float _120 = _80 * _78;
    float _122 = _114 * _116;
    float _124 = _118 * _122;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = _126 * _120;
    bool _132 = _128 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _134 = isnan(_128);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _140 = _136 || _138;
    float _142 = in.m_32.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_32.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_32.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_30.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_30.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_30.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    if (!_140)
    {
        discard_fragment();
    }
    float _178 = _114 * _114;
    float _180 = -_178;
    float _182 = _180 + 1.0;
    float _184 = _80 * _146;
    float _186 = _80 * _152;
    float _188 = _80 * _158;
    float _190 = _184 * _182;
    float _192 = _186 * _182;
    float _194 = _188 * _182;
    float _196 = _80 * _164;
    float _198 = _80 * _170;
    float _200 = _80 * _176;
    float _202 = fma(_178, _196, _192);
    float _204 = fma(_178, _198, _190);
    float _206 = fma(_178, _200, _194);
    if (!_140)
    {
        out.m_37.x = _202;
        out.m_37.y = _204;
        out.m_37.z = _206;
        out.m_37.w = _126;
        return out;
    }
    float _208 = in.m_39.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = _204 * 0.715200006961822509765625;
    float _216 = fma(_202, 0.2125999927520751953125, _214);
    bool _218 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _220 = fma(_206, 0.072200000286102294921875, _216);
    float _222 = 1.0 / _220;
    float _224 = _222 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _80 * _212;
    float _230 = fma(_226, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _232 = _128 * _228;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _202 * _230;
    float _238 = _204 * _230;
    float _240 = _206 * _230;
    float _242 = _222;
    if (!_218)
    {
        _242 = _234;
    }
    float _244 = _242;
    bool _246 = !_218;
    float _248 = _244;
    if (!_246)
    {
        float _250 = in.m_41.w;
        float _252 = gl_FragCoord.w;
        float _254 = _250 * _252;
        float _256 = in.m_41.z;
        float _258 = gl_FragCoord.w;
        float _260 = _256 * _258;
        float _262 = _80 * _254;
        float _264 = _80 * _260;
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
        float _286 = _234 * _284;
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

