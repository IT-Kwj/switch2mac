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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_36 [[user(locn4)]];
    float4 m_28 [[user(locn5)]];
    float4 m_30 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _52 = gl_FragCoord.w;
    float _54 = in.m_28.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_28.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_28.z;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_30.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_30.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_30.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_32.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _52;
    float _98 = _96 * _58;
    float _100 = _96 * _64;
    float _102 = _96 * _70;
    float _104 = _98 * _98;
    float _106 = fma(_100, _100, _104);
    float _108 = _96 * _82;
    float _110 = fma(_102, _102, _106);
    float _112 = _96 * _76;
    float _114 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _116 = _108 + _114;
    float _118 = in.m_34.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = rsqrt(_110);
    float _126 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _128 = _112 + _126;
    float _130 = _96 * _88;
    float _132 = in.m_36.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _128 * _128;
    float _140 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _142 = _130 + _140;
    float _144 = fma(_116, _116, _138);
    float _146 = fma(_142, _142, _144);
    float _148 = _98 * _124;
    float _150 = _100 * _124;
    float _152 = _102 * _124;
    float _154 = rsqrt(_146);
    float _156 = _148 * _148;
    float _158 = fma(_150, _150, _156);
    float _160 = fma(_152, _152, _158);
    float _162 = rsqrt(_160);
    float _164 = _128 * _154;
    float _166 = _116 * _154;
    float _168 = _142 * _154;
    float _170 = _96 * _122;
    float _172 = _148 * _162;
    float _174 = _150 * _162;
    float _176 = _152 * _162;
    float _178 = _164 * _172;
    float _180 = _96 * _136;
    float _182 = fma(_166, _174, _178);
    float _184 = fma(_168, _176, _182);
    float _186 = _180 * _180;
    float _188 = _184 * _184;
    float _190 = _188 * _186;
    float _192 = _96 * _94;
    float _194 = _170 * _190;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _196 * _192;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _204 = isnan(_198);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _210 = _206 || _208;
    float _212 = in.m_38.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_38.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_34.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_34.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_38.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_34.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    if (!_210)
    {
        discard_fragment();
    }
    float _248 = _96 * _216;
    float _250 = _96 * _222;
    float _252 = _96 * _228;
    float _254 = _96 * _234;
    float _256 = _96 * _240;
    float _258 = _96 * _246;
    float _260 = -_248;
    float _262 = _260 + _252;
    float _264 = -_250;
    float _266 = _264 + _254;
    float _268 = -_256;
    float _270 = _268 + _258;
    float _272 = fma(_190, _262, _248);
    float _274 = fma(_190, _266, _250);
    float _276 = fma(_190, _270, _256);
    if (!_210)
    {
        out.m_41.x = _272;
        out.m_41.y = _274;
        out.m_41.z = _276;
        out.m_41.w = _196;
        return out;
    }
    float _278 = _274 * 0.715200006961822509765625;
    float _280 = in.m_43.w;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_43.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_43.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_272, 0.2125999927520751953125, _278);
    float _300 = in.m_43.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_276, 0.072200000286102294921875, _298);
    bool _308 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _310 = 1.0 / _306;
    float _312 = _310 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _96 * _284;
    float _318 = fma(_314, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _320 = _96 * _290;
    float _322 = _318 * _316;
    float _324 = 0.0 + _198;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _96 * _296;
    float _330 = _96 * _304;
    float _332 = fma(_276, _322, _320);
    float _334 = fma(_272, _322, _328);
    float _336 = fma(_274, _322, _330);
    float _338 = _320;
    if (!_308)
    {
        _338 = _326;
    }
    float _340 = _338;
    bool _342 = !_308;
    float _344 = _340;
    if (!_342)
    {
        float _346 = in.m_45.w;
        float _348 = gl_FragCoord.w;
        float _350 = _346 * _348;
        float _352 = in.m_45.z;
        float _354 = gl_FragCoord.w;
        float _356 = _352 * _354;
        float _358 = _96 * _350;
        float _360 = _96 * _356;
        float _362 = 1.0 / _358;
        float _364 = _360 * _362;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _368 = fma(_364, (*spvDescriptorSet0.fp_c8)._m0[30].w, _366);
        float _370 = 1.0 / _368;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _376 = fma(_370, _372, _374);
        float _378 = _376 * 8.0;
        float _380 = precise::clamp(_378, 0.0, 1.0);
        float _382 = _326 * _380;
        _344 = _382;
    }
    float _384 = _344;
    float _386 = 0.0 + _384;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    out.m_41.x = _334;
    out.m_41.y = _336;
    out.m_41.z = _332;
    out.m_41.w = _388;
    return out;
}

