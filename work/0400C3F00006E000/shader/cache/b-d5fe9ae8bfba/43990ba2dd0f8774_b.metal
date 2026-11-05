#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_30 [[user(locn3)]];
    float4 m_32 [[user(locn4)]];
    float4 m_34 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _52 = gl_FragCoord.w;
    float _54 = in.m_30.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_32.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_30.x;
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
    float _100 = _92 * _92;
    float _102 = _90 * _82;
    float _104 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _106 = _94 + _104;
    float _108 = -_94;
    float _110 = _108 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _112 = fma(_96, _96, _100);
    float _114 = _90 * _88;
    float _116 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _118 = _102 + _116;
    float _120 = _106 * _106;
    float _122 = fma(_98, _98, _112);
    float _124 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _126 = _114 + _124;
    float _128 = _110 * _110;
    float _130 = fma(_118, _118, _120);
    float _132 = rsqrt(_122);
    float _134 = fma(_126, _126, _130);
    float _136 = -_102;
    float _138 = _136 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _140 = -_114;
    float _142 = _140 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _144 = fma(_138, _138, _128);
    float _146 = rsqrt(_134);
    float _148 = fma(_142, _142, _144);
    float _150 = _92 * _132;
    float _152 = _96 * _132;
    float _154 = _98 * _132;
    float _156 = rsqrt(_148);
    float _158 = _150 * _150;
    float _160 = fma(_152, _152, _158);
    float _162 = _106 * _146;
    float _164 = _118 * _146;
    float _166 = fma(_154, _154, _160);
    float _168 = _162 * _162;
    float _170 = _126 * _146;
    float _172 = fma(_164, _164, _168);
    float _174 = rsqrt(_166);
    float _176 = _110 * _156;
    float _178 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _180 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _178;
    float _182 = fma(_170, _170, _172);
    float _184 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _186 = _184 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _188 = _138 * _156;
    float _190 = _142 * _156;
    float _192 = rsqrt(_182);
    float _194 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _196 = _194 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _198 = _150 * _174;
    float _200 = _152 * _174;
    float _202 = 1.0 / _180;
    float _204 = _154 * _174;
    float _206 = _176 * _198;
    float _208 = fma(_188, _200, _206);
    float _210 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _212 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _210;
    float _214 = _162 * _192;
    float _216 = 1.0 / _186;
    float _218 = fma(_190, _204, _208);
    float _220 = _164 * _192;
    float _222 = _198 * _214;
    float _224 = _170 * _192;
    float _226 = fma(_218, 0.5, 0.5);
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = fma(_200, _220, _222);
    float _232 = 1.0 / _212;
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _236 = _228 + _234;
    float _238 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _240 = _228 + _238;
    float _242 = fma(_204, _224, _230);
    float _244 = _236 * _202;
    float _246 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _248 = _228 + _246;
    float _250 = abs(_242);
    float _252 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _254 = _250 + _252;
    float _256 = 1.0 / _196;
    float _258 = _240 * _216;
    float _260 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _262 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _260;
    float _264 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _266 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _264;
    float _268 = fma(_262, _244, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _270 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _272 = _270 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _274 = _248 * _232;
    float _276 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _278 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _276;
    bool _282 = _228 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _284 = isnan(_228);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = fma(_272, _258, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _296 = fma(_278, _244, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _298 = fma(_266, _244, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _300 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _302 = _300 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _304 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _306 = _304 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _308 = _254 * _256;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    bool _312 = _228 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _314 = isnan(_228);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_292;
    float _326 = _324 + 1.0;
    float _328 = fma(_306, _258, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _330 = fma(_302, _258, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    bool _332 = _228 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _334 = isnan(_228);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = in.m_34.w;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    bool _350 = _228 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _352 = isnan(_228);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_322;
    float _364 = _362 + 1.0;
    float _366 = _342 * _326;
    float _368 = -_342;
    float _370 = _368 + 1.0;
    float _372 = -_360;
    float _374 = _372 + 1.0;
    float _376 = _292 * _364;
    float _378 = _296 * _366;
    float _380 = in.m_36.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_36.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_36.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = _322 * _374;
    float _400 = _268 * _366;
    float _402 = _298 * _366;
    float _404 = in.m_38.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = fma(_370, (*spvDescriptorSet0.fp_c9)._m0[107].x, _400);
    float _412 = fma(_370, (*spvDescriptorSet0.fp_c9)._m0[107].y, _378);
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _416 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _414;
    float _418 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _420 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _418;
    float _422 = fma(_294, _376, _410);
    float _424 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _426 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _424;
    float _428 = fma(_370, (*spvDescriptorSet0.fp_c9)._m0[107].z, _402);
    float _430 = fma(_416, _274, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _432 = fma(_328, _376, _412);
    float _434 = fma(_426, _274, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _436 = fma(_420, _274, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _438 = fma(_330, _376, _428);
    float _440 = fma(_310, -2.0, 3.0);
    float _442 = _310 * _310;
    float _444 = _90 * _348;
    float _446 = fma(_430, _398, _432);
    float _448 = fma(_434, _398, _422);
    float _450 = fma(_436, _398, _438);
    float _452 = _440 * _442;
    float _454 = _452 * 0.5;
    bool _456 = _444 != 1.0;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = fma(_360, (*spvDescriptorSet0.fp_c9)._m0[110].y, _446);
    float _468 = fma(_360, (*spvDescriptorSet0.fp_c9)._m0[110].x, _448);
    float _470 = fma(_360, (*spvDescriptorSet0.fp_c9)._m0[110].z, _450);
    float _472 = _90 * _384;
    float _474 = _90 * _390;
    float _476 = _90 * _396;
    float _478 = fma(_472, _454, _468);
    float _480 = fma(_474, _454, _466);
    float _482 = fma(_476, _454, _470);
    float _484 = _90 * _408;
    bool _486 = !_464;
    if (!_486)
    {
        float _488 = gl_FragCoord.x;
        float _490 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _492 = _488 / _490;
        float _494 = gl_FragCoord.y;
        float _496 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _498 = _494 / _496;
        float _500 = trunc(_492);
        int _503 = int(_500);
        float _505 = trunc(_498);
        int _507 = int(_505);
        int _509 = _503 + 2;
        int _511 = _509 >> 1;
        uint _514 = uint(int(uint(_507) >> uint(1)));
        int _516 = _511 ^ int(_514);
        int _518 = _516 << 16;
        int _520 = _518 ^ _511;
        int _522 = 983055 & _520;
        float _524 = _444 * 256.0;
        int _526 = _522 << 6;
        int _528 = _526 + _522;
        float _530 = trunc(_524);
        int _532 = int(_530);
        int _534 = _528 & 13369548;
        uint _536 = uint(int(uint(_534) >> uint(3)));
        int _538 = _534 | int(_536);
        int _540 = _538 & 5570560;
        int _542 = _538 & 85;
        uint _544 = uint(int(uint(_532) >> uint(7)));
        int _546 = int(_544) + _532;
        uint _548 = uint(int(uint(_540) >> uint(15)));
        int _550 = int(_548) + _542;
        bool _552 = uint(_546) > uint(_550);
        if (!_552)
        {
            discard_fragment();
        }
        if (!_552)
        {
            out.m_41.x = _478;
            out.m_41.y = _480;
            out.m_41.z = _482;
            out.m_41.w = _484;
            return out;
        }
    }
    float _554 = _480 * 0.715200006961822509765625;
    float _556 = in.m_43.w;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_43.x;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_43.y;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = fma(_478, 0.2125999927520751953125, _554);
    float _576 = in.m_43.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = fma(_482, 0.072200000286102294921875, _574);
    bool _584 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _586 = 1.0 / _582;
    float _588 = _586 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = fma(_590, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _594 = _90 * _560;
    float _596 = 0.0 + _484;
    float _598 = precise::clamp(_596, 0.0, 1.0);
    float _600 = _90 * _566;
    float _602 = _592 * _594;
    float _604 = _90 * _572;
    float _606 = _90 * _580;
    float _608 = fma(_478, _602, _600);
    float _610 = fma(_480, _602, _604);
    float _612 = fma(_482, _602, _606);
    float _614 = _600;
    if (!_584)
    {
        _614 = _598;
    }
    float _616 = _614;
    bool _618 = !_584;
    float _620 = _616;
    if (!_618)
    {
        float _622 = in.m_45.w;
        float _624 = gl_FragCoord.w;
        float _626 = _622 * _624;
        float _628 = in.m_45.z;
        float _630 = gl_FragCoord.w;
        float _632 = _628 * _630;
        float _634 = _90 * _626;
        float _636 = _90 * _632;
        float _638 = 1.0 / _634;
        float _640 = _636 * _638;
        float _642 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _644 = fma(_640, (*spvDescriptorSet0.fp_c8)._m0[30].w, _642);
        float _646 = 1.0 / _644;
        float _648 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _650 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _652 = fma(_646, _648, _650);
        float _654 = _652 * 8.0;
        float _656 = precise::clamp(_654, 0.0, 1.0);
        float _658 = _598 * _656;
        _620 = _658;
    }
    float _660 = _620;
    float _662 = 0.0 + _660;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    out.m_41.x = _608;
    out.m_41.y = _610;
    out.m_41.z = _612;
    out.m_41.w = _664;
    return out;
}

