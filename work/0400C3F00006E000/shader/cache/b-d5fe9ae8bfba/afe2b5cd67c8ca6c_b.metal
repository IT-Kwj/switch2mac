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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_30 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_34 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_30.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _50;
    float _60 = _58 * _56;
    bool _64 = _60 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _66 = isnan(_60);
    bool _68 = _64 || _66;
    bool _70 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _72 = _68 || _70;
    float _74 = in.m_32.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_32.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_32.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    if (!_72)
    {
        discard_fragment();
    }
    float _92 = in.m_34.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_34.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_34.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _112 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _110;
    float _114 = _58 * _78;
    float _116 = _58 * _84;
    float _118 = _58 * _90;
    float _120 = _114 * _114;
    float _122 = fma(_116, _116, _120);
    float _124 = _58 * _96;
    float _126 = _58 * _102;
    float _128 = fma(_118, _118, _122);
    float _130 = _58 * _108;
    float _132 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _134 = _124 + _132;
    float _136 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _138 = _126 + _136;
    float _140 = rsqrt(_128);
    float _142 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _144 = _130 + _142;
    float _146 = _134 * _134;
    float _148 = -_124;
    float _150 = _148 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _152 = -_126;
    float _154 = _152 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _156 = fma(_144, _144, _146);
    float _158 = _150 * _150;
    float _160 = fma(_138, _138, _156);
    float _162 = -_130;
    float _164 = _162 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _166 = 1.0 / _112;
    float _168 = fma(_164, _164, _158);
    float _170 = _114 * _140;
    float _172 = _116 * _140;
    float _174 = _118 * _140;
    float _176 = fma(_154, _154, _168);
    float _178 = rsqrt(_160);
    float _180 = rsqrt(_176);
    float _182 = _170 * _170;
    float _184 = fma(_172, _172, _182);
    float _186 = _134 * _178;
    float _188 = fma(_174, _174, _184);
    float _190 = _144 * _178;
    float _192 = _138 * _178;
    float _194 = _186 * _186;
    float _196 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _198 = _196 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _200 = rsqrt(_188);
    float _202 = fma(_190, _190, _194);
    float _204 = _150 * _180;
    float _206 = _164 * _180;
    float _208 = _154 * _180;
    float _210 = fma(_192, _192, _202);
    float _212 = 1.0 / _198;
    float _214 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _216 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _214;
    float _218 = rsqrt(_210);
    float _220 = _170 * _200;
    float _222 = _172 * _200;
    float _224 = _174 * _200;
    float _226 = _204 * _220;
    float _228 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _230 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _228;
    float _232 = 1.0 / _216;
    float _234 = fma(_206, _222, _226);
    float _236 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _238 = _236 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _240 = fma(_208, _224, _234);
    float _242 = _190 * _218;
    float _244 = fma(_240, 0.5, 0.5);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _186 * _218;
    float _250 = _192 * _218;
    float _252 = 1.0 / _238;
    float _254 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _256 = _246 + _254;
    float _258 = _220 * _248;
    float _260 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _262 = _246 + _260;
    float _264 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _266 = _246 + _264;
    float _268 = _256 * _166;
    float _270 = fma(_222, _242, _258);
    float _272 = _262 * _212;
    float _274 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _276 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _274;
    float _278 = fma(_224, _250, _270);
    float _280 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _282 = _280 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _284 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _286 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _284;
    float _288 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _290 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _288;
    float _292 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _294 = _292 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _296 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _298 = _296 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _300 = _266 * _232;
    float _302 = fma(_276, _268, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _304 = fma(_282, _272, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _306 = abs(_278);
    float _308 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _310 = _306 + _308;
    float _312 = fma(_294, _272, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _314 = fma(_298, _272, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    bool _316 = _246 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _318 = isnan(_246);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = in.m_36.x;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_36.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_36.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_286, _268, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _348 = fma(_290, _268, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    bool _350 = _246 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _352 = isnan(_246);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_326;
    float _364 = _362 + 1.0;
    bool _366 = _246 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _368 = isnan(_246);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = _310 * _252;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    bool _382 = _246 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _384 = isnan(_246);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -_360;
    float _396 = _394 + 1.0;
    float _398 = _360 * _364;
    float _400 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _402 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _400;
    float _404 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _406 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _404;
    float _408 = _376 * _396;
    float _410 = -_376;
    float _412 = _410 + 1.0;
    float _414 = fma(_402, _300, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _416 = fma(_406, _300, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _418 = _346 * _408;
    float _420 = _348 * _408;
    float _422 = _302 * _408;
    float _424 = -_392;
    float _426 = _424 + 1.0;
    float _428 = fma(_412, (*spvDescriptorSet0.fp_c9)._m0[107].x, _418);
    float _430 = fma(_412, (*spvDescriptorSet0.fp_c9)._m0[107].y, _420);
    float _432 = fma(_412, (*spvDescriptorSet0.fp_c9)._m0[107].z, _422);
    float _434 = fma(_230, _300, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _436 = _326 * _426;
    float _438 = fma(_312, _398, _428);
    float _440 = fma(_314, _398, _430);
    float _442 = fma(_304, _398, _432);
    float _444 = fma(_380, -2.0, 3.0);
    float _446 = _380 * _380;
    float _448 = fma(_414, _436, _438);
    float _450 = fma(_416, _436, _440);
    float _452 = fma(_434, _436, _442);
    float _454 = _444 * _446;
    float _456 = _454 * 0.5;
    float _458 = fma(_392, (*spvDescriptorSet0.fp_c9)._m0[110].x, _448);
    float _460 = fma(_392, (*spvDescriptorSet0.fp_c9)._m0[110].y, _450);
    float _462 = fma(_392, (*spvDescriptorSet0.fp_c9)._m0[110].z, _452);
    float _464 = _58 * _332;
    float _466 = _58 * _338;
    float _468 = _58 * _344;
    float _470 = fma(_464, _456, _458);
    float _472 = fma(_466, _456, _460);
    float _474 = fma(_468, _456, _462);
    if (!_72)
    {
        out.m_39.x = _470;
        out.m_39.y = _472;
        out.m_39.z = _474;
        out.m_39.w = 1.0;
        return out;
    }
    float _476 = _472 * 0.715200006961822509765625;
    float _478 = in.m_41.w;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_41.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_41.x;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = fma(_470, 0.2125999927520751953125, _476);
    float _498 = in.m_41.y;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = fma(_474, 0.072200000286102294921875, _496);
    bool _506 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _508 = 1.0 / _504;
    float _510 = _508 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _58 * _482;
    float _516 = fma(_512, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _518 = _58 * _488;
    float _520 = _516 * _514;
    float _522 = 0.0 + _60;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = _58 * _494;
    float _528 = _58 * _502;
    float _530 = fma(_474, _520, _518);
    float _532 = fma(_470, _520, _526);
    float _534 = fma(_472, _520, _528);
    float _536 = _518;
    if (!_506)
    {
        _536 = _524;
    }
    float _538 = _536;
    bool _540 = !_506;
    float _542 = _538;
    if (!_540)
    {
        float _544 = in.m_43.w;
        float _546 = gl_FragCoord.w;
        float _548 = _544 * _546;
        float _550 = in.m_43.z;
        float _552 = gl_FragCoord.w;
        float _554 = _550 * _552;
        float _556 = _58 * _548;
        float _558 = _58 * _554;
        float _560 = 1.0 / _556;
        float _562 = _558 * _560;
        float _564 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _566 = fma(_562, (*spvDescriptorSet0.fp_c8)._m0[30].w, _564);
        float _568 = 1.0 / _566;
        float _570 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _572 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _574 = fma(_568, _570, _572);
        float _576 = _574 * 8.0;
        float _578 = precise::clamp(_576, 0.0, 1.0);
        float _580 = _524 * _578;
        _542 = _580;
    }
    float _582 = _542;
    float _584 = 0.0 + _582;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    out.m_39.x = _532;
    out.m_39.y = _534;
    out.m_39.z = _530;
    out.m_39.w = _586;
    return out;
}

