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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_36 [[user(locn3)]];
    float4 m_32 [[user(locn4)]];
    float4 m_30 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _52 = gl_FragCoord.w;
    float _54 = in.m_30.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_30.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_32.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_30.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_32.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_32.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _52;
    float _92 = _90 * _58;
    float _94 = _90 * _64;
    float _96 = _90 * _70;
    float _98 = _90 * _76;
    float _100 = _90 * _82;
    float _102 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _104 = _94 + _102;
    float _106 = _96 * _96;
    float _108 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _110 = _92 + _108;
    float _112 = _90 * _88;
    float _114 = _104 * _104;
    float _116 = fma(_100, _100, _106);
    float _118 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _120 = _98 + _118;
    float _122 = in.m_34.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = fma(_110, _110, _114);
    float _130 = fma(_112, _112, _116);
    float _132 = fma(_120, _120, _128);
    float _134 = rsqrt(_130);
    float _136 = rsqrt(_132);
    float _138 = _96 * _134;
    float _140 = _100 * _134;
    float _142 = _112 * _134;
    float _144 = _138 * _138;
    float _146 = _104 * _136;
    float _148 = _110 * _136;
    float _150 = fma(_140, _140, _144);
    float _152 = _120 * _136;
    float _154 = _146 * _146;
    float _156 = fma(_142, _142, _150);
    float _158 = fma(_148, _148, _154);
    float _160 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _162 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _160;
    float _164 = fma(_152, _152, _158);
    float _166 = rsqrt(_156);
    float _168 = rsqrt(_164);
    float _170 = _138 * _166;
    float _172 = _140 * _166;
    float _174 = _142 * _166;
    float _176 = _146 * _168;
    float _178 = _148 * _168;
    float _180 = _152 * _168;
    float _182 = _170 * _176;
    float _184 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _186 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _184;
    float _188 = _162 * _162;
    float _190 = fma(_172, _178, _182);
    float _192 = in.m_36.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = fma(_186, _186, _188);
    float _200 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _202 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _200;
    float _204 = fma(_174, _180, _190);
    float _206 = _90 * _126;
    float _208 = fma(_202, _202, _198);
    float _210 = abs(_204);
    float _212 = fma(_210, -0.800000011920928955078125, 1.0);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = sqrt(_208);
    float _218 = fma(_214, -2.0, 3.0);
    float _220 = _214 * _214;
    float _222 = _218 * _220;
    float _224 = abs(_204);
    float _226 = _224 + (-1.60000002384185791015625);
    float _228 = abs(_204);
    float _230 = _228 * 1.66666662693023681640625;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = _206 * _206;
    float _236 = -_226;
    float _238 = 0.0 + _236;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_232, -2.0, 3.0);
    float _244 = fma(_222, 0.5, _234);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = precise::max(_216, 25.0);
    float _250 = _232 * _232;
    float _252 = fma(_240, -2.0, 3.0);
    float _254 = _240 * _240;
    float _256 = precise::min(_248, 40.0);
    float _258 = _242 * _250;
    float _260 = _252 * _254;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = fma(_256, 0.066666670143604278564453125, -1.6666667461395263671875);
    float _268 = _260 * _258;
    float _270 = fma(_266, _264, _246);
    float _272 = _90 * _196;
    float _274 = _268 * _206;
    float _276 = _274 * _270;
    float _278 = 0.0 + _276;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _280 * _272;
    bool _286 = _282 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _288 = isnan(_282);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _294 = _290 || _292;
    float _296 = in.m_38.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_38.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_38.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    if (!_294)
    {
        discard_fragment();
    }
    float _314 = _90 * _300;
    float _316 = _90 * _306;
    float _318 = _90 * _312;
    if (!_294)
    {
        out.m_41.x = _314;
        out.m_41.y = _316;
        out.m_41.z = _318;
        out.m_41.w = _276;
        return out;
    }
    float _320 = _316 * 0.715200006961822509765625;
    float _322 = in.m_43.w;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_43.z;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_43.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = fma(_314, 0.2125999927520751953125, _320);
    float _342 = in.m_43.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = fma(_318, 0.072200000286102294921875, _340);
    bool _350 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _352 = 1.0 / _348;
    float _354 = _352 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _90 * _326;
    float _360 = fma(_356, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _362 = _90 * _332;
    float _364 = _360 * _358;
    float _366 = 0.0 + _282;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _90 * _338;
    float _372 = _90 * _346;
    float _374 = fma(_318, _364, _362);
    float _376 = fma(_314, _364, _370);
    float _378 = fma(_316, _364, _372);
    float _380 = _362;
    if (!_350)
    {
        _380 = _368;
    }
    float _382 = _380;
    bool _384 = !_350;
    float _386 = _382;
    if (!_384)
    {
        float _388 = in.m_45.w;
        float _390 = gl_FragCoord.w;
        float _392 = _388 * _390;
        float _394 = in.m_45.z;
        float _396 = gl_FragCoord.w;
        float _398 = _394 * _396;
        float _400 = _90 * _392;
        float _402 = _90 * _398;
        float _404 = 1.0 / _400;
        float _406 = _402 * _404;
        float _408 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _410 = fma(_406, (*spvDescriptorSet0.fp_c8)._m0[30].w, _408);
        float _412 = 1.0 / _410;
        float _414 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _418 = fma(_412, _414, _416);
        float _420 = _418 * 8.0;
        float _422 = precise::clamp(_420, 0.0, 1.0);
        float _424 = _368 * _422;
        _386 = _424;
    }
    float _426 = _386;
    float _428 = 0.0 + _426;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    out.m_41.x = _376;
    out.m_41.y = _378;
    out.m_41.z = _374;
    out.m_41.w = _430;
    return out;
}

