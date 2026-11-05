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
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_32 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_34 [[user(locn3)]];
    float4 m_30 [[user(locn4), flat]];
    float4 m_28 [[user(locn5)]];
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
    float _62 = in.m_30.z;
    float _64 = in.m_32.w;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_34.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _48;
    float _78 = _62 * 0.3499999940395355224609375;
    float _80 = -_62;
    float _82 = _80 + 1.0;
    float _84 = 1.0 / _78;
    float _86 = _76 * _54;
    float _88 = _76 * _60;
    float _90 = _86 * _86;
    float _92 = _88 + _86;
    float _94 = fma(_88, _88, _90);
    float _96 = -_88;
    float _98 = _96 + _86;
    float _100 = abs(_92);
    float _102 = -_100;
    float _104 = _102 + 1.0;
    float _106 = abs(_98);
    float _108 = -_106;
    float _110 = _108 + 1.0;
    float _112 = sqrt(_94);
    float _114 = _104 * _104;
    float _116 = _110 * _110;
    float _118 = _114 * _114;
    float _120 = _116 * _116;
    float _122 = _118 * _118;
    float _124 = _120 * _120;
    float _126 = _122 * _122;
    float _128 = -_78;
    float _130 = _112 + _128;
    float _132 = _112 * 1.41421401500701904296875;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = fma(_124, _124, _126);
    float _138 = _130 * _84;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _112 * _84;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = -_134;
    float _148 = _146 + 1.0;
    float _150 = _112 * 2.0;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = -_140;
    float _156 = _154 + 1.0;
    float _158 = in.m_36.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _148 * _148;
    float _166 = _144 * _156;
    float _168 = -_152;
    float _170 = _168 + 1.0;
    float _172 = _164 * _164;
    float _174 = _166 * _166;
    float _176 = _170 * _170;
    float _178 = _76 * _68;
    float _180 = _172 * _136;
    float _182 = _174 * _174;
    float _184 = _182 * 0.5;
    float _186 = _184 * _82;
    float _188 = -_186;
    float _190 = _188 + 1.0;
    float _192 = fma(_180, _190, _186);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = -_176;
    float _198 = _196 + 1.0;
    float _200 = _76 * _74;
    float _202 = fma(_194, _198, _176);
    float _204 = _76 * _162;
    float _206 = _202 * _204;
    float _208 = _178 * _206;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = _210 * _200;
    bool _216 = _212 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_212);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    float _226 = in.m_32.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_32.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_32.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_36.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_36.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    if (!_224)
    {
        discard_fragment();
    }
    float _256 = in.m_36.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = -_194;
    float _264 = _262 + 1.0;
    float _266 = _76 * _230;
    float _268 = _76 * _236;
    float _270 = _76 * _242;
    float _272 = _266 * _264;
    float _274 = _268 * _264;
    float _276 = _270 * _264;
    float _278 = _76 * _248;
    float _280 = _76 * _254;
    float _282 = fma(_194, _278, _274);
    float _284 = fma(_194, _280, _272);
    float _286 = _76 * _260;
    float _288 = fma(_194, _286, _276);
    if (!_224)
    {
        out.m_39.x = _284;
        out.m_39.y = _282;
        out.m_39.z = _288;
        out.m_39.w = _210;
        return out;
    }
    float _290 = _282 * 0.715200006961822509765625;
    float _292 = 0.0 + _212;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = fma(_284, 0.2125999927520751953125, _290);
    bool _298 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _300 = fma(_288, 0.072200000286102294921875, _296);
    float _302 = 1.0 / _300;
    float _304 = _302 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = fma(_306, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _310 = _284 * _308;
    float _312 = _282 * _308;
    float _314 = _288 * _308;
    float _316 = _308;
    if (!_298)
    {
        _316 = _294;
    }
    float _318 = _316;
    bool _320 = !_298;
    float _322 = _318;
    if (!_320)
    {
        float _324 = in.m_41.w;
        float _326 = gl_FragCoord.w;
        float _328 = _324 * _326;
        float _330 = in.m_41.z;
        float _332 = gl_FragCoord.w;
        float _334 = _330 * _332;
        float _336 = _76 * _328;
        float _338 = _76 * _334;
        float _340 = 1.0 / _336;
        float _342 = _338 * _340;
        float _344 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _346 = fma(_342, (*spvDescriptorSet0.fp_c8)._m0[30].w, _344);
        float _348 = 1.0 / _346;
        float _350 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _352 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _354 = fma(_348, _350, _352);
        float _356 = _354 * 8.0;
        float _358 = precise::clamp(_356, 0.0, 1.0);
        float _360 = _294 * _358;
        _322 = _360;
    }
    float _362 = _322;
    float _364 = 0.0 + _362;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    out.m_39.x = _310;
    out.m_39.y = _312;
    out.m_39.z = _314;
    out.m_39.w = _366;
    return out;
}

