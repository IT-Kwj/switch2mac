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
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_28 [[user(locn4)]];
    float4 m_30 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_28.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_28.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_28.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_30.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_30.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_30.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _50;
    float _90 = _88 * _56;
    float _92 = _88 * _62;
    float _94 = _88 * _68;
    float _96 = _90 * _90;
    float _98 = fma(_92, _92, _96);
    float _100 = _88 * _80;
    float _102 = fma(_94, _94, _98);
    float _104 = _88 * _74;
    float _106 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _108 = _100 + _106;
    float _110 = in.m_32.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = rsqrt(_102);
    float _118 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _120 = _104 + _118;
    float _122 = _88 * _86;
    float _124 = _120 * _120;
    float _126 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _128 = _122 + _126;
    float _130 = fma(_108, _108, _124);
    float _132 = fma(_128, _128, _130);
    float _134 = _90 * _116;
    float _136 = _92 * _116;
    float _138 = _94 * _116;
    float _140 = rsqrt(_132);
    float _142 = _134 * _134;
    float _144 = fma(_136, _136, _142);
    float _146 = fma(_138, _138, _144);
    float _148 = rsqrt(_146);
    float _150 = _120 * _140;
    float _152 = _108 * _140;
    float _154 = _128 * _140;
    float _156 = in.m_34.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _134 * _148;
    float _164 = _136 * _148;
    float _166 = _138 * _148;
    float _168 = _150 * _162;
    float _170 = fma(_152, _164, _168);
    float _172 = in.m_36.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = fma(_154, _166, _170);
    float _180 = abs(_178);
    float _182 = -_180;
    float _184 = _182 + 1.0;
    float _186 = precise::max(_184, 0.300000011920928955078125);
    float _188 = _88 * _160;
    float _190 = precise::min(_186, 0.89999997615814208984375);
    float _192 = fma(_190, 1.6666667461395263671875, -0.500000059604644775390625);
    float _194 = _88 * _114;
    float _196 = _192 * _192;
    float _198 = precise::max(_194, _196);
    float _200 = _88 * _176;
    float _202 = _188 * _198;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _204 * _200;
    bool _210 = _206 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _212 = isnan(_206);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _218 = _214 || _216;
    float _220 = in.m_32.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_32.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_34.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_34.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_32.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_34.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    if (!_218)
    {
        discard_fragment();
    }
    float _256 = _88 * _224;
    float _258 = _88 * _230;
    float _260 = _196 * 4.0;
    float _262 = _88 * _236;
    float _264 = _88 * _242;
    float _266 = _88 * _248;
    float _268 = _88 * _254;
    float _270 = fma(_262, _260, _256);
    float _272 = fma(_264, _260, _258);
    float _274 = fma(_268, _260, _266);
    if (!_218)
    {
        out.m_39.x = _270;
        out.m_39.y = _272;
        out.m_39.z = _274;
        out.m_39.w = _204;
        return out;
    }
    float _276 = _272 * 0.715200006961822509765625;
    float _278 = in.m_41.w;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_41.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_41.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = fma(_270, 0.2125999927520751953125, _276);
    float _298 = in.m_41.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = 0.0 + _206;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = fma(_274, 0.072200000286102294921875, _296);
    bool _310 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _312 = 1.0 / _308;
    float _314 = _312 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = fma(_316, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _320 = _88 * _282;
    float _322 = _88 * _288;
    float _324 = _318 * _320;
    float _326 = _88 * _294;
    float _328 = _88 * _302;
    float _330 = fma(_274, _324, _322);
    float _332 = fma(_270, _324, _326);
    float _334 = fma(_272, _324, _328);
    float _336 = _322;
    if (!_310)
    {
        _336 = _306;
    }
    float _338 = _336;
    bool _340 = !_310;
    float _342 = _338;
    if (!_340)
    {
        float _344 = in.m_43.w;
        float _346 = gl_FragCoord.w;
        float _348 = _344 * _346;
        float _350 = in.m_43.z;
        float _352 = gl_FragCoord.w;
        float _354 = _350 * _352;
        float _356 = _88 * _348;
        float _358 = _88 * _354;
        float _360 = 1.0 / _356;
        float _362 = _358 * _360;
        float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _366 = fma(_362, (*spvDescriptorSet0.fp_c8)._m0[30].w, _364);
        float _368 = 1.0 / _366;
        float _370 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _374 = fma(_368, _370, _372);
        float _376 = _374 * 8.0;
        float _378 = precise::clamp(_376, 0.0, 1.0);
        float _380 = _306 * _378;
        _342 = _380;
    }
    float _382 = _342;
    float _384 = 0.0 + _382;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    out.m_39.x = _332;
    out.m_39.y = _334;
    out.m_39.z = _330;
    out.m_39.w = _386;
    return out;
}

