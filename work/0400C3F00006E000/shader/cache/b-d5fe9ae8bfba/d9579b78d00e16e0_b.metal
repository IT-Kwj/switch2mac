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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_41 [[attribute(2)]];
    float4 m_45 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_51 [[attribute(8)]];
    float4 m_37 [[attribute(9)]];
    float4 m_39 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _586 = false;
    bool _354 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1633 = as_type<float>(_88);
        out.gl_Position.z = _1633;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _82 = _108;
    }
    float _110 = _82;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_33.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1702 = as_type<float>(_124);
        out.gl_Position.z = _1702;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_37.x;
    float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _130 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _132 = in.m_35.x;
    float _134 = in.m_35.y;
    float _136 = in.m_35.z;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    int _148 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _150 = _148 != 0;
    float _152 = _130 * _128;
    float _154 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    float _160 = _156 * 0.15915493667125701904296875;
    float _162 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = 1.4012984643248170709237295832899e-45;
    float _166 = _162;
    if (!_146)
    {
        float _168 = _162 * _162;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _160 * 6.283185482025146484375;
    float _176 = cos(_174);
    float _178 = _172;
    if (!_146)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = -_158;
    float _186 = _154 + _184;
    bool _188 = !_146;
    float _190 = _182;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _162 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _162);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_146;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _162 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _166 = _244;
    }
    float _246 = _166;
    float _248 = in.m_39.w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _252 = _250 != 0;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _256 = _254 != 0;
    float _258 = in.m_30.x;
    float _260 = in.m_30.y;
    float _262 = in.m_30.z;
    bool _264 = _186 < 0.5;
    float _266 = float(_264);
    float _268 = fma(_176, 0.5, 0.5);
    bool _270 = !_252;
    int _272 = _270 ? 0 : 1;
    float _274 = -_186;
    float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _278 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = -_266;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_268;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _288 = abs(_272);
    float _290 = fma(_246, _132, _278);
    bool _292 = !_150;
    int _294 = _292 ? 0 : 1;
    float _296 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _298 = !_256;
    int _300 = _298 ? 0 : 1;
    float _302 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = fma(_246, _134, _296);
    int _308 = abs(_294);
    float _310 = fma(_246, _136, _302);
    int _312 = abs(_300);
    float _314 = float(_288);
    float _316 = float(_308);
    float _318 = abs(_276);
    float _320 = _314 * _318;
    float _322 = fma(_306, _248, _260);
    float _324 = float(_312);
    float _326 = fma(_316, _286, _320);
    float _328 = fma(_290, _248, _258);
    float _330 = fma(_310, _248, _262);
    float _332 = abs(_282);
    float _334 = fma(_324, _332, _326);
    bool _336 = !_304;
    float _352;
    if (!_336)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _340 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_72);
        float _358 = 1.0 / _356;
        float _360 = _106 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _362 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _362 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _380;
    float _384 = 1.0 / _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _362 + _386;
    bool _390 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_362);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    bool _402 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_362);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = 1.0 / _378;
    bool _416 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _430 = 1.0 / _382;
    float _432 = _366 * _384;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _370 * _414;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _444;
    float _448 = fma(_436, _432, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _388 * _430;
    float _456 = -_426;
    float _458 = _456 + 1.0;
    float _460 = fma(_442, _432, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _462 = fma(_446, _432, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _464 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_362);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _400 * _458;
    float _478 = -_400;
    float _480 = _478 + 1.0;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = -_474;
    float _492 = _490 + 1.0;
    float _494 = _474 * _480;
    float _496 = fma(_452, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _498 = fma(_484, _438, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = _412 * _492;
    float _502 = in.m_39.x;
    float _504 = in.m_39.y;
    float _506 = in.m_39.z;
    float _508 = fma(_488, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = -_412;
    float _512 = _510 + 1.0;
    float _514 = _448 * _500;
    float _516 = _460 * _500;
    float _518 = _462 * _500;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].x, _514);
    float _526 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].y, _516);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _532;
    float _536 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].z, _518);
    float _538 = fma(_522, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _540 = fma(_508, _494, _524);
    float _542 = fma(_530, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _544 = fma(_534, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _546 = fma(_496, _494, _526);
    float _548 = fma(_498, _494, _536);
    float _550 = fma(_538, _476, _540);
    float _552 = fma(_542, _476, _546);
    float _554 = fma(_544, _476, _548);
    float _556 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].x, _550);
    float _558 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].y, _552);
    float _560 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].z, _554);
    float _562 = _556 * _502;
    float _564 = _558 * _504;
    float _566 = _560 * _506;
    bool _568 = !_428;
    float _584;
    if (!_568)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _126 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_72);
        float _590 = 1.0 / _588;
        float _592 = _106 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = in.m_41.x;
    float _598 = in.m_41.y;
    float _600 = in.m_41.z;
    float _602 = in.m_43.x;
    float _604 = in.m_43.y;
    float _606 = in.m_43.z;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _616 = in.m_45.x;
    float _618 = in.m_45.y;
    float _620 = in.m_45.z;
    bool _622 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _624 = isnan(_594);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = 1.0 / _610;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _644 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _646 = isnan(_594);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _614;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _666 = _322 * _598;
    float _668 = 1.0 / _638;
    float _670 = _322 * _604;
    float _672 = fma(_328, _596, _666);
    float _674 = _322 * _618;
    float _676 = fma(_328, _602, _670);
    float _678 = 1.0 / _664;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _594 + _680;
    float _684 = fma(_328, _616, _674);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _594 + _686;
    float _690 = fma(_330, _606, _676);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _694 = _594 + _692;
    float _696 = _688 * _656;
    float _698 = 1.0 / _660;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _702 = _594 + _700;
    bool _704 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _706 = isnan(_594);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _694 * _668;
    float _718 = fma(_330, _620, _684);
    float _720 = _690 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = -_714;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _642;
    float _728 = fma(_330, _600, _672);
    float _730 = _682 * _634;
    bool _732 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _734 = isnan(_594);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _702 * _678;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _750;
    float _754 = -_742;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _760 = _594 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _762;
    float _766 = fma(_748, _730, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _768 = _714 * _756;
    float _770 = fma(_752, _730, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = fma(_764, _730, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _774 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _776 = isnan(_594);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -_632;
    float _788 = _786 + 1.0;
    float _790 = _632 * _724;
    float _792 = _760 * _726;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _800 = _594 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _810 = _784 * _788;
    float _812 = -_784;
    float _814 = _812 + 1.0;
    bool _816 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _818 = isnan(_594);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _800 * _698;
    bool _830 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _832 = isnan(_594);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = fma(_796, _696, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _844 = fma(_804, _696, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _846 = fma(_808, _696, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _848 = _654 * _814;
    float _850 = -_654;
    float _852 = _850 + 1.0;
    float _854 = -_826;
    float _856 = _854 + 1.0;
    float _858 = _826 * _852;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _860;
    float _864 = _840 * _856;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _866;
    float _870 = -_840;
    float _872 = _870 + 1.0;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _874;
    float _878 = fma(_862, _716, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _880 = fma(_868, _716, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _882 = _772 * _864;
    float _884 = fma(_876, _716, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _886 = _766 * _864;
    float _888 = _770 * _864;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _902 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].x, _882);
    float _904 = fma(_892, _792, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _906 = fma(_896, _792, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _908 = fma(_900, _792, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _910 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].y, _886);
    float _912 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].z, _888);
    float _914 = fma(_842, _858, _902);
    float _916 = fma(_844, _858, _910);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _926;
    float _930 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _932 = fma(_846, _858, _912);
    float _934 = fma(_920, _828, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _936 = fma(_928, _828, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _938 = fma(_924, _828, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = fma(_884, _848, _932);
    float _946 = fma(_878, _848, _914);
    float _948 = fma(_880, _848, _916);
    float _950 = _718 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _954 = _720 + _952;
    float _956 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _966 = fma(_908, _810, _944);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _972 = fma(_904, _810, _946);
    float _974 = fma(_906, _810, _948);
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _978 = _950 + _976;
    float _980 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[28].x, _956);
    float _982 = fma(_960, _744, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _984 = fma(_964, _744, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _986 = fma(_970, _744, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _988 = fma(_938, _790, _966);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[28].z, _980);
    float _992 = fma(_934, _790, _972);
    float _994 = fma(_936, _790, _974);
    float _996 = fma(_986, _768, _988);
    float _998 = _942 * _942;
    bool _1000 = _990 >= 0.0;
    float _1002 = fma(_982, _768, _992);
    float _1004 = fma(_984, _768, _994);
    float _1006 = fma(_954, _954, _998);
    float _1008 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].z, _996);
    float _1010 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1002);
    float _1012 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1004);
    float _1014 = fma(_978, _978, _1006);
    float _1016 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1020 = rsqrt(_1014);
    float _1022 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1024 = _984;
    if (_1000)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1026 = _1024;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1030 = as_type<int>(_1026);
    if (_1000)
    {
        float _1032 = _1026 * 5.0;
        _1030 = as_type<int>(_1032);
    }
    int _1034 = _1030;
    float _1036 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1040 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = 1.0;
    if (_1000)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3190 = as_type<float>(_1034);
        out.gl_Position.z = _3190;
    }
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _1044 = _942 * _1020;
    float _1046 = _954 * _1020;
    out.m_49.x = _1036;
    out.m_49.y = _1038;
    out.m_49.z = _1040;
    out.m_49.w = _1028;
    if (_1000)
    {
        out.m_33.x = 0.0;
    }
    if (_1000)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1048 = -_1044;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _1052 = _978 * _1020;
    float _1054 = -_1046;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _1058 = -_1044;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1050 + _1062;
    float _1066 = -_1052;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1056 + _1070;
    float _1074 = -_1046;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _954);
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1068 + _1080;
    float _1084 = -_1052;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1078);
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1088);
    bool _1092 = _1090 >= 0.0;
    float _1094 = _1060 * _1060;
    float _1096 = fma(_1076, _1076, _1094);
    float _1098 = fma(_1086, _1086, _1096);
    if (_1092)
    {
        _1042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1100 = _1042;
    int _1102 = as_type<int>(_1100);
    if (_1092)
    {
        out.m_33.x = 0.0;
    }
    if (_1092)
    {
        float _1104 = _1100 * 5.0;
        _1102 = as_type<int>(_1104);
    }
    int _1106 = _1102;
    if (_1092)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3333 = as_type<float>(_1106);
        out.gl_Position.z = _3333;
    }
    if (_1092)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1108 = in.m_51.x;
    float _1110 = in.m_51.y;
    float _1112 = in.m_51.z;
    float _1114 = sqrt(_1098);
    float _1116 = _334 * _564;
    float _1118 = _334 * _562;
    float _1120 = _334 * _566;
    bool _1122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1124 = isnan(0.5);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1130 = _1126 || _1128;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1134 = _1020 * _1114;
    float _1136 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1138 = _1134 * _1132;
    float _1140 = _1134 * _1136;
    float _1142 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1110);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1108);
    float _1148 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1112);
    float _1150 = _1134 * _1142;
    float _1152 = _1144 * _1140;
    float _1154 = _1146 * _1138;
    float _1156 = _1148 * _1150;
    float _1158 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1166 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1158);
    float _1168 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1170 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1168);
    float _1178 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1170);
    float _1180 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1188 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1190 = _950 + _1182;
    float _1192 = _720 + _1184;
    float _1194 = 1.0 / _1186;
    float _1196 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1188);
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1200 = _1190 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1204 = _1192 + _1202;
    float _1206 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1208 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1196);
    float _1210 = _1200 * _1200;
    float _1212 = _930 + _1206;
    float _1214 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = fma(_1204, _1204, _1210);
    float _1218 = _1214 + _1186;
    float _1220 = sqrt(_1216);
    float _1222 = _1218 * _1194;
    float _1224 = _1222 * 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1226);
    float _1230 = 1.0 / _1228;
    bool _1232 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1224;
    float _1236 = _1218;
    float _1238 = _1192;
    if (!_1232)
    {
        _1234 = _1192;
    }
    float _1240 = _1234;
    float _1242 = _1240;
    if (!_1232)
    {
        _1236 = _1190;
    }
    float _1244 = _1236;
    float _1246 = _1244;
    if (!_1232)
    {
        _1238 = _1212;
    }
    float _1248 = _1238;
    bool _1250 = !_1232;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1220 + _1256;
        float _1260 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = rsqrt(_1216);
        float _1264 = _1258 * _1254;
        float _1266 = _1264 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1260, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1262 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = fma(_1204, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1284 = fma(_1200, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = fma(_1212, _1274, _1286);
        _1242 = _1282;
        _1252 = _1288;
        _1246 = _1284;
    }
    float _1290 = _1242;
    float _1292 = _1252;
    float _1294 = _1246;
    bool _1296 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1298 = isnan(0.5);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1304 = _1300 || _1302;
    float _1306 = -_1046;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1290);
    float _1310 = -_1044;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1292);
    float _1314 = -_1052;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1318 = _1312;
    float _1320 = _1308;
    float _1322 = _1316;
    if (!_1130)
    {
        float _1324 = _1064 * _1064;
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1328 = -_950;
        float _1330 = _1328 + _1294;
        float _1332 = fma(_1072, _1072, _1324);
        float _1334 = fma(_1082, _1082, _1332);
        float _1336 = 1.0 / _1134;
        float _1338 = sqrt(_1334);
        float _1340 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1326;
        float _1344 = -_720;
        float _1346 = _1344 + _1290;
        float _1348 = _1342 * _1336;
        float _1350 = -_930;
        float _1352 = _1350 + _1292;
        float _1354 = fma(_1346, _1348, _1056);
        float _1356 = fma(_1352, _1348, _1050);
        float _1358 = fma(_1330, _1348, _1068);
        _1318 = _1356;
        _1320 = _1354;
        _1322 = _1358;
    }
    float _1360 = _1318;
    float _1362 = _1320;
    float _1364 = _1322;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1370 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1372 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1366);
    float _1376 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1368);
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1370);
    float _1380 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1372);
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1374);
    float _1384 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1376);
    float _1386 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1378);
    float _1388 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1380);
    float _1390 = _1368;
    float _1392 = _1376;
    if (_1304)
    {
        _1390 = 1.0;
    }
    float _1394 = _1390;
    float _1396 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1398 = _1394;
    if (_1304)
    {
        _1392 = 1.0;
    }
    float _1400 = _1392;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1230 * _1402;
    float _1406 = _1400;
    if (!_1304)
    {
        float _1408 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1410 = _1408 * 0.15915493667125701904296875;
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1414 = _1410 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 0.15915493667125701904296875;
        float _1420 = _1410 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        float _1424 = 1.0 / _1416;
        float _1426 = _1418 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = _1418 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = _1428 * _1430;
        float _1438 = 1.0 / _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1440;
        float _1444 = 1.0 / _1442;
        float _1446 = _1434 * _1438;
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = fma(_1404, _1446, _1448);
        float _1452 = _1450 * _1444;
        float _1454 = precise::clamp(_1452, 0.0, 1.0);
        _1398 = _1454;
    }
    float _1456 = _1398;
    if (!_1304)
    {
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = _1458 * 0.15915493667125701904296875;
        float _1464 = _1460 * 0.15915493667125701904296875;
        float _1466 = _1462 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1462 * 6.283185482025146484375;
        float _1472 = sin(_1470);
        float _1474 = 1.0 / _1468;
        float _1476 = _1464 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = _1472 * _1474;
        float _1482 = _1464 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1488 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1486;
        float _1490 = _1478 * _1480;
        float _1492 = 1.0 / _1488;
        float _1494 = 1.0 / _1490;
        float _1496 = _1484 * _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1500 = fma(_1404, _1496, _1498);
        float _1502 = _1500 * _1492;
        float _1504 = precise::clamp(_1502, 0.0, 1.0);
        float _1506 = -_1504;
        float _1508 = _1506 + 1.0;
        _1406 = _1508;
    }
    float _1510 = _1406;
    float _1512 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1514 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1520 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1522 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    float _1524 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1526 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1528 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1518);
    float _1530 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1522);
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    bool _1536 = _1456 > 0.0;
    bool _1538 = isnan(_1456);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    float _1546 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1526);
    float _1548 = _1456 * _1510;
    float _1550 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1532);
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1534);
    bool _1556 = _1510 <= 0.0;
    bool _1558 = !_1544;
    bool _1560 = _1556 || _1558;
    float _1562 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1546);
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1566 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1568 = _1552 + _1554;
    float _1570 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1562);
    float _1572 = _1564 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1574 = _1568 * 0.5;
    out.m_33.x = _1572;
    out.gl_Position.x = _1566;
    out.gl_Position.y = _1570;
    out.gl_Position.z = _1552;
    out.gl_Position.w = _1554;
    out.m_53.z = _1574;
    out.m_53.w = _1554;
    if (!_1560)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1576;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _586 = false;
    bool _354 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1633 = as_type<float>(_88);
        out.gl_Position.z = _1633;
    }
    if (!_76)
    {
        return out;
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _82 = _108;
    }
    float _110 = _82;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_33.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1702 = as_type<float>(_124);
        out.gl_Position.z = _1702;
    }
    if (_116)
    {
        return out;
    }
    float _126 = in.m_37.x;
    float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _130 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _132 = in.m_35.x;
    float _134 = in.m_35.y;
    float _136 = in.m_35.z;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    int _148 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _150 = _148 != 0;
    float _152 = _130 * _128;
    float _154 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    float _160 = _156 * 0.15915493667125701904296875;
    float _162 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = 1.4012984643248170709237295832899e-45;
    float _166 = _162;
    if (!_146)
    {
        float _168 = _162 * _162;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _160 * 6.283185482025146484375;
    float _176 = cos(_174);
    float _178 = _172;
    if (!_146)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = -_158;
    float _186 = _154 + _184;
    bool _188 = !_146;
    float _190 = _182;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _162 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _162);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_146;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _162 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _166 = _244;
    }
    float _246 = _166;
    float _248 = in.m_39.w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _252 = _250 != 0;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _256 = _254 != 0;
    float _258 = in.m_30.x;
    float _260 = in.m_30.y;
    float _262 = in.m_30.z;
    bool _264 = _186 < 0.5;
    float _266 = float(_264);
    float _268 = fma(_176, 0.5, 0.5);
    bool _270 = !_252;
    int _272 = _270 ? 0 : 1;
    float _274 = -_186;
    float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _278 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = -_266;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_268;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _288 = abs(_272);
    float _290 = fma(_246, _132, _278);
    bool _292 = !_150;
    int _294 = _292 ? 0 : 1;
    float _296 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _298 = !_256;
    int _300 = _298 ? 0 : 1;
    float _302 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = fma(_246, _134, _296);
    int _308 = abs(_294);
    float _310 = fma(_246, _136, _302);
    int _312 = abs(_300);
    float _314 = float(_288);
    float _316 = float(_308);
    float _318 = abs(_276);
    float _320 = _314 * _318;
    float _322 = fma(_306, _248, _260);
    float _324 = float(_312);
    float _326 = fma(_316, _286, _320);
    float _328 = fma(_290, _248, _258);
    float _330 = fma(_310, _248, _262);
    float _332 = abs(_282);
    float _334 = fma(_324, _332, _326);
    bool _336 = !_304;
    float _352;
    if (!_336)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _340 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_72);
        float _358 = 1.0 / _356;
        float _360 = _106 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _362 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _362 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _380;
    float _384 = 1.0 / _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _362 + _386;
    bool _390 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_362);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    bool _402 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_362);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = 1.0 / _378;
    bool _416 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _430 = 1.0 / _382;
    float _432 = _366 * _384;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _370 * _414;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _444;
    float _448 = fma(_436, _432, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _388 * _430;
    float _456 = -_426;
    float _458 = _456 + 1.0;
    float _460 = fma(_442, _432, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _462 = fma(_446, _432, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _464 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_362);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _400 * _458;
    float _478 = -_400;
    float _480 = _478 + 1.0;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = -_474;
    float _492 = _490 + 1.0;
    float _494 = _474 * _480;
    float _496 = fma(_452, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _498 = fma(_484, _438, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = _412 * _492;
    float _502 = in.m_39.x;
    float _504 = in.m_39.y;
    float _506 = in.m_39.z;
    float _508 = fma(_488, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = -_412;
    float _512 = _510 + 1.0;
    float _514 = _448 * _500;
    float _516 = _460 * _500;
    float _518 = _462 * _500;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].x, _514);
    float _526 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].y, _516);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _532;
    float _536 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].z, _518);
    float _538 = fma(_522, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _540 = fma(_508, _494, _524);
    float _542 = fma(_530, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _544 = fma(_534, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _546 = fma(_496, _494, _526);
    float _548 = fma(_498, _494, _536);
    float _550 = fma(_538, _476, _540);
    float _552 = fma(_542, _476, _546);
    float _554 = fma(_544, _476, _548);
    float _556 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].x, _550);
    float _558 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].y, _552);
    float _560 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].z, _554);
    float _562 = _556 * _502;
    float _564 = _558 * _504;
    float _566 = _560 * _506;
    bool _568 = !_428;
    float _584;
    if (!_568)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _126 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_72);
        float _590 = 1.0 / _588;
        float _592 = _106 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = in.m_41.x;
    float _598 = in.m_41.y;
    float _600 = in.m_41.z;
    float _602 = in.m_43.x;
    float _604 = in.m_43.y;
    float _606 = in.m_43.z;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _616 = in.m_45.x;
    float _618 = in.m_45.y;
    float _620 = in.m_45.z;
    bool _622 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _624 = isnan(_594);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = 1.0 / _610;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _644 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _646 = isnan(_594);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _614;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _666 = _322 * _598;
    float _668 = 1.0 / _638;
    float _670 = _322 * _604;
    float _672 = fma(_328, _596, _666);
    float _674 = _322 * _618;
    float _676 = fma(_328, _602, _670);
    float _678 = 1.0 / _664;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _594 + _680;
    float _684 = fma(_328, _616, _674);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _594 + _686;
    float _690 = fma(_330, _606, _676);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _694 = _594 + _692;
    float _696 = _688 * _656;
    float _698 = 1.0 / _660;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _702 = _594 + _700;
    bool _704 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _706 = isnan(_594);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _694 * _668;
    float _718 = fma(_330, _620, _684);
    float _720 = _690 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = -_714;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _642;
    float _728 = fma(_330, _600, _672);
    float _730 = _682 * _634;
    bool _732 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _734 = isnan(_594);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _702 * _678;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _750;
    float _754 = -_742;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _760 = _594 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _762;
    float _766 = fma(_748, _730, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _768 = _714 * _756;
    float _770 = fma(_752, _730, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = fma(_764, _730, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _774 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _776 = isnan(_594);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -_632;
    float _788 = _786 + 1.0;
    float _790 = _632 * _724;
    float _792 = _760 * _726;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _800 = _594 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _810 = _784 * _788;
    float _812 = -_784;
    float _814 = _812 + 1.0;
    bool _816 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _818 = isnan(_594);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _800 * _698;
    bool _830 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _832 = isnan(_594);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = fma(_796, _696, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _844 = fma(_804, _696, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _846 = fma(_808, _696, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _848 = _654 * _814;
    float _850 = -_654;
    float _852 = _850 + 1.0;
    float _854 = -_826;
    float _856 = _854 + 1.0;
    float _858 = _826 * _852;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _860;
    float _864 = _840 * _856;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _866;
    float _870 = -_840;
    float _872 = _870 + 1.0;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _874;
    float _878 = fma(_862, _716, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _880 = fma(_868, _716, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _882 = _772 * _864;
    float _884 = fma(_876, _716, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _886 = _766 * _864;
    float _888 = _770 * _864;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _902 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].x, _882);
    float _904 = fma(_892, _792, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _906 = fma(_896, _792, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _908 = fma(_900, _792, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _910 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].y, _886);
    float _912 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].z, _888);
    float _914 = fma(_842, _858, _902);
    float _916 = fma(_844, _858, _910);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _926;
    float _930 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _932 = fma(_846, _858, _912);
    float _934 = fma(_920, _828, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _936 = fma(_928, _828, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _938 = fma(_924, _828, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = fma(_884, _848, _932);
    float _946 = fma(_878, _848, _914);
    float _948 = fma(_880, _848, _916);
    float _950 = _718 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _954 = _720 + _952;
    float _956 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _966 = fma(_908, _810, _944);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _972 = fma(_904, _810, _946);
    float _974 = fma(_906, _810, _948);
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _978 = _950 + _976;
    float _980 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[28].x, _956);
    float _982 = fma(_960, _744, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _984 = fma(_964, _744, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _986 = fma(_970, _744, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _988 = fma(_938, _790, _966);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[28].z, _980);
    float _992 = fma(_934, _790, _972);
    float _994 = fma(_936, _790, _974);
    float _996 = fma(_986, _768, _988);
    float _998 = _942 * _942;
    bool _1000 = _990 >= 0.0;
    float _1002 = fma(_982, _768, _992);
    float _1004 = fma(_984, _768, _994);
    float _1006 = fma(_954, _954, _998);
    float _1008 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].z, _996);
    float _1010 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1002);
    float _1012 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1004);
    float _1014 = fma(_978, _978, _1006);
    float _1016 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1020 = rsqrt(_1014);
    float _1022 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1024 = _984;
    if (_1000)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1026 = _1024;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1030 = as_type<int>(_1026);
    if (_1000)
    {
        float _1032 = _1026 * 5.0;
        _1030 = as_type<int>(_1032);
    }
    int _1034 = _1030;
    float _1036 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1040 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = 1.0;
    if (_1000)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3190 = as_type<float>(_1034);
        out.gl_Position.z = _3190;
    }
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _1044 = _942 * _1020;
    float _1046 = _954 * _1020;
    out.m_49.x = _1036;
    out.m_49.y = _1038;
    out.m_49.z = _1040;
    out.m_49.w = _1028;
    if (_1000)
    {
        out.m_33.x = 0.0;
    }
    if (_1000)
    {
        return out;
    }
    float _1048 = -_1044;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _1052 = _978 * _1020;
    float _1054 = -_1046;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _1058 = -_1044;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1050 + _1062;
    float _1066 = -_1052;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1056 + _1070;
    float _1074 = -_1046;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _954);
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1068 + _1080;
    float _1084 = -_1052;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1078);
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1088);
    bool _1092 = _1090 >= 0.0;
    float _1094 = _1060 * _1060;
    float _1096 = fma(_1076, _1076, _1094);
    float _1098 = fma(_1086, _1086, _1096);
    if (_1092)
    {
        _1042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1100 = _1042;
    int _1102 = as_type<int>(_1100);
    if (_1092)
    {
        out.m_33.x = 0.0;
    }
    if (_1092)
    {
        float _1104 = _1100 * 5.0;
        _1102 = as_type<int>(_1104);
    }
    int _1106 = _1102;
    if (_1092)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3333 = as_type<float>(_1106);
        out.gl_Position.z = _3333;
    }
    if (_1092)
    {
        return out;
    }
    float _1108 = in.m_51.x;
    float _1110 = in.m_51.y;
    float _1112 = in.m_51.z;
    float _1114 = sqrt(_1098);
    float _1116 = _334 * _564;
    float _1118 = _334 * _562;
    float _1120 = _334 * _566;
    bool _1122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1124 = isnan(0.5);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1130 = _1126 || _1128;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1134 = _1020 * _1114;
    float _1136 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1138 = _1134 * _1132;
    float _1140 = _1134 * _1136;
    float _1142 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1110);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1108);
    float _1148 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1112);
    float _1150 = _1134 * _1142;
    float _1152 = _1144 * _1140;
    float _1154 = _1146 * _1138;
    float _1156 = _1148 * _1150;
    float _1158 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1166 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1158);
    float _1168 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1170 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1168);
    float _1178 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1170);
    float _1180 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1188 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1190 = _950 + _1182;
    float _1192 = _720 + _1184;
    float _1194 = 1.0 / _1186;
    float _1196 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1188);
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1200 = _1190 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1204 = _1192 + _1202;
    float _1206 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1208 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1196);
    float _1210 = _1200 * _1200;
    float _1212 = _930 + _1206;
    float _1214 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = fma(_1204, _1204, _1210);
    float _1218 = _1214 + _1186;
    float _1220 = sqrt(_1216);
    float _1222 = _1218 * _1194;
    float _1224 = _1222 * 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1226);
    float _1230 = 1.0 / _1228;
    bool _1232 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1224;
    float _1236 = _1218;
    float _1238 = _1192;
    if (!_1232)
    {
        _1234 = _1192;
    }
    float _1240 = _1234;
    float _1242 = _1240;
    if (!_1232)
    {
        _1236 = _1190;
    }
    float _1244 = _1236;
    float _1246 = _1244;
    if (!_1232)
    {
        _1238 = _1212;
    }
    float _1248 = _1238;
    bool _1250 = !_1232;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1220 + _1256;
        float _1260 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = rsqrt(_1216);
        float _1264 = _1258 * _1254;
        float _1266 = _1264 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1260, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1262 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = fma(_1204, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1284 = fma(_1200, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = fma(_1212, _1274, _1286);
        _1242 = _1282;
        _1252 = _1288;
        _1246 = _1284;
    }
    float _1290 = _1242;
    float _1292 = _1252;
    float _1294 = _1246;
    bool _1296 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1298 = isnan(0.5);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1304 = _1300 || _1302;
    float _1306 = -_1046;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1290);
    float _1310 = -_1044;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1292);
    float _1314 = -_1052;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1318 = _1312;
    float _1320 = _1308;
    float _1322 = _1316;
    if (!_1130)
    {
        float _1324 = _1064 * _1064;
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1328 = -_950;
        float _1330 = _1328 + _1294;
        float _1332 = fma(_1072, _1072, _1324);
        float _1334 = fma(_1082, _1082, _1332);
        float _1336 = 1.0 / _1134;
        float _1338 = sqrt(_1334);
        float _1340 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1326;
        float _1344 = -_720;
        float _1346 = _1344 + _1290;
        float _1348 = _1342 * _1336;
        float _1350 = -_930;
        float _1352 = _1350 + _1292;
        float _1354 = fma(_1346, _1348, _1056);
        float _1356 = fma(_1352, _1348, _1050);
        float _1358 = fma(_1330, _1348, _1068);
        _1318 = _1356;
        _1320 = _1354;
        _1322 = _1358;
    }
    float _1360 = _1318;
    float _1362 = _1320;
    float _1364 = _1322;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1370 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1372 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1366);
    float _1376 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1368);
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1370);
    float _1380 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1372);
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1374);
    float _1384 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1376);
    float _1386 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1378);
    float _1388 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1380);
    float _1390 = _1368;
    float _1392 = _1376;
    if (_1304)
    {
        _1390 = 1.0;
    }
    float _1394 = _1390;
    float _1396 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1398 = _1394;
    if (_1304)
    {
        _1392 = 1.0;
    }
    float _1400 = _1392;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1230 * _1402;
    float _1406 = _1400;
    if (!_1304)
    {
        float _1408 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1410 = _1408 * 0.15915493667125701904296875;
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1414 = _1410 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 0.15915493667125701904296875;
        float _1420 = _1410 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        float _1424 = 1.0 / _1416;
        float _1426 = _1418 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = _1418 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = _1428 * _1430;
        float _1438 = 1.0 / _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1440;
        float _1444 = 1.0 / _1442;
        float _1446 = _1434 * _1438;
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = fma(_1404, _1446, _1448);
        float _1452 = _1450 * _1444;
        float _1454 = precise::clamp(_1452, 0.0, 1.0);
        _1398 = _1454;
    }
    float _1456 = _1398;
    if (!_1304)
    {
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = _1458 * 0.15915493667125701904296875;
        float _1464 = _1460 * 0.15915493667125701904296875;
        float _1466 = _1462 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1462 * 6.283185482025146484375;
        float _1472 = sin(_1470);
        float _1474 = 1.0 / _1468;
        float _1476 = _1464 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = _1472 * _1474;
        float _1482 = _1464 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1488 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1486;
        float _1490 = _1478 * _1480;
        float _1492 = 1.0 / _1488;
        float _1494 = 1.0 / _1490;
        float _1496 = _1484 * _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1500 = fma(_1404, _1496, _1498);
        float _1502 = _1500 * _1492;
        float _1504 = precise::clamp(_1502, 0.0, 1.0);
        float _1506 = -_1504;
        float _1508 = _1506 + 1.0;
        _1406 = _1508;
    }
    float _1510 = _1406;
    float _1512 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1514 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1520 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1522 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    float _1524 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1526 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1528 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1518);
    float _1530 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1522);
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    bool _1536 = _1456 > 0.0;
    bool _1538 = isnan(_1456);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    float _1546 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1526);
    float _1548 = _1456 * _1510;
    float _1550 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1532);
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1534);
    bool _1556 = _1510 <= 0.0;
    bool _1558 = !_1544;
    bool _1560 = _1556 || _1558;
    float _1562 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1546);
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1566 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1568 = _1552 + _1554;
    float _1570 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1562);
    float _1572 = _1564 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1574 = _1568 * 0.5;
    out.m_33.x = _1572;
    out.gl_Position.x = _1566;
    out.gl_Position.y = _1570;
    out.gl_Position.z = _1552;
    out.gl_Position.w = _1554;
    out.m_53.z = _1574;
    out.m_53.w = _1554;
    if (!_1560)
    {
        return out;
    }
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1576;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _586 = false;
    bool _354 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1633 = as_type<float>(_88);
        out.gl_Position.z = _1633;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _82 = _108;
    }
    float _110 = _82;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_33.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1702 = as_type<float>(_124);
        out.gl_Position.z = _1702;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_37.x;
    float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _130 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _132 = in.m_35.x;
    float _134 = in.m_35.y;
    float _136 = in.m_35.z;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    int _148 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _150 = _148 != 0;
    float _152 = _130 * _128;
    float _154 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _156 = _154 * 6.283185482025146484375;
    float _158 = floor(_154);
    float _160 = _156 * 0.15915493667125701904296875;
    float _162 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = 1.4012984643248170709237295832899e-45;
    float _166 = _162;
    if (!_146)
    {
        float _168 = _162 * _162;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _160 * 6.283185482025146484375;
    float _176 = cos(_174);
    float _178 = _172;
    if (!_146)
    {
        float _180 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = -_158;
    float _186 = _154 + _184;
    bool _188 = !_146;
    float _190 = _182;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _162 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _162);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_146;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _162 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _166 = _244;
    }
    float _246 = _166;
    float _248 = in.m_39.w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _252 = _250 != 0;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _256 = _254 != 0;
    float _258 = in.m_30.x;
    float _260 = in.m_30.y;
    float _262 = in.m_30.z;
    bool _264 = _186 < 0.5;
    float _266 = float(_264);
    float _268 = fma(_176, 0.5, 0.5);
    bool _270 = !_252;
    int _272 = _270 ? 0 : 1;
    float _274 = -_186;
    float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _278 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = -_266;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_268;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _288 = abs(_272);
    float _290 = fma(_246, _132, _278);
    bool _292 = !_150;
    int _294 = _292 ? 0 : 1;
    float _296 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _298 = !_256;
    int _300 = _298 ? 0 : 1;
    float _302 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _306 = fma(_246, _134, _296);
    int _308 = abs(_294);
    float _310 = fma(_246, _136, _302);
    int _312 = abs(_300);
    float _314 = float(_288);
    float _316 = float(_308);
    float _318 = abs(_276);
    float _320 = _314 * _318;
    float _322 = fma(_306, _248, _260);
    float _324 = float(_312);
    float _326 = fma(_316, _286, _320);
    float _328 = fma(_290, _248, _258);
    float _330 = fma(_310, _248, _262);
    float _332 = abs(_282);
    float _334 = fma(_324, _332, _326);
    bool _336 = !_304;
    float _352;
    if (!_336)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _340 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_72);
        float _358 = 1.0 / _356;
        float _360 = _106 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _362 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _362 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _380;
    float _384 = 1.0 / _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _362 + _386;
    bool _390 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_362);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    bool _402 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_362);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = 1.0 / _378;
    bool _416 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _430 = 1.0 / _382;
    float _432 = _366 * _384;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _370 * _414;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _444;
    float _448 = fma(_436, _432, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = _388 * _430;
    float _456 = -_426;
    float _458 = _456 + 1.0;
    float _460 = fma(_442, _432, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _462 = fma(_446, _432, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _464 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _466 = isnan(_362);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _400 * _458;
    float _478 = -_400;
    float _480 = _478 + 1.0;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _490 = -_474;
    float _492 = _490 + 1.0;
    float _494 = _474 * _480;
    float _496 = fma(_452, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _498 = fma(_484, _438, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = _412 * _492;
    float _502 = in.m_39.x;
    float _504 = in.m_39.y;
    float _506 = in.m_39.z;
    float _508 = fma(_488, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = -_412;
    float _512 = _510 + 1.0;
    float _514 = _448 * _500;
    float _516 = _460 * _500;
    float _518 = _462 * _500;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].x, _514);
    float _526 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].y, _516);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _532;
    float _536 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[143].z, _518);
    float _538 = fma(_522, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _540 = fma(_508, _494, _524);
    float _542 = fma(_530, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _544 = fma(_534, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _546 = fma(_496, _494, _526);
    float _548 = fma(_498, _494, _536);
    float _550 = fma(_538, _476, _540);
    float _552 = fma(_542, _476, _546);
    float _554 = fma(_544, _476, _548);
    float _556 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].x, _550);
    float _558 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].y, _552);
    float _560 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[146].z, _554);
    float _562 = _556 * _502;
    float _564 = _558 * _504;
    float _566 = _560 * _506;
    bool _568 = !_428;
    float _584;
    if (!_568)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _572 = _126 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_72);
        float _590 = 1.0 / _588;
        float _592 = _106 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = in.m_41.x;
    float _598 = in.m_41.y;
    float _600 = in.m_41.z;
    float _602 = in.m_43.x;
    float _604 = in.m_43.y;
    float _606 = in.m_43.z;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _616 = in.m_45.x;
    float _618 = in.m_45.y;
    float _620 = in.m_45.z;
    bool _622 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _624 = isnan(_594);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = 1.0 / _610;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _644 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _646 = isnan(_594);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _614;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _666 = _322 * _598;
    float _668 = 1.0 / _638;
    float _670 = _322 * _604;
    float _672 = fma(_328, _596, _666);
    float _674 = _322 * _618;
    float _676 = fma(_328, _602, _670);
    float _678 = 1.0 / _664;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _594 + _680;
    float _684 = fma(_328, _616, _674);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _594 + _686;
    float _690 = fma(_330, _606, _676);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _694 = _594 + _692;
    float _696 = _688 * _656;
    float _698 = 1.0 / _660;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _702 = _594 + _700;
    bool _704 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _706 = isnan(_594);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _694 * _668;
    float _718 = fma(_330, _620, _684);
    float _720 = _690 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = -_714;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _642;
    float _728 = fma(_330, _600, _672);
    float _730 = _682 * _634;
    bool _732 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _734 = isnan(_594);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _702 * _678;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _750;
    float _754 = -_742;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _760 = _594 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _762;
    float _766 = fma(_748, _730, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _768 = _714 * _756;
    float _770 = fma(_752, _730, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = fma(_764, _730, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _774 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _776 = isnan(_594);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -_632;
    float _788 = _786 + 1.0;
    float _790 = _632 * _724;
    float _792 = _760 * _726;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _800 = _594 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _810 = _784 * _788;
    float _812 = -_784;
    float _814 = _812 + 1.0;
    bool _816 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _818 = isnan(_594);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _800 * _698;
    bool _830 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _832 = isnan(_594);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = fma(_796, _696, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _844 = fma(_804, _696, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _846 = fma(_808, _696, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _848 = _654 * _814;
    float _850 = -_654;
    float _852 = _850 + 1.0;
    float _854 = -_826;
    float _856 = _854 + 1.0;
    float _858 = _826 * _852;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _860;
    float _864 = _840 * _856;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _866;
    float _870 = -_840;
    float _872 = _870 + 1.0;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _874;
    float _878 = fma(_862, _716, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _880 = fma(_868, _716, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _882 = _772 * _864;
    float _884 = fma(_876, _716, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _886 = _766 * _864;
    float _888 = _770 * _864;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _900 = _898 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _902 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].x, _882);
    float _904 = fma(_892, _792, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _906 = fma(_896, _792, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _908 = fma(_900, _792, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _910 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].y, _886);
    float _912 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[107].z, _888);
    float _914 = fma(_842, _858, _902);
    float _916 = fma(_844, _858, _910);
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _926;
    float _930 = _728 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _932 = fma(_846, _858, _912);
    float _934 = fma(_920, _828, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _936 = fma(_928, _828, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _938 = fma(_924, _828, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = fma(_884, _848, _932);
    float _946 = fma(_878, _848, _914);
    float _948 = fma(_880, _848, _916);
    float _950 = _718 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _954 = _720 + _952;
    float _956 = _942 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _966 = fma(_908, _810, _944);
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _972 = fma(_904, _810, _946);
    float _974 = fma(_906, _810, _948);
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _978 = _950 + _976;
    float _980 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[28].x, _956);
    float _982 = fma(_960, _744, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _984 = fma(_964, _744, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _986 = fma(_970, _744, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _988 = fma(_938, _790, _966);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[28].z, _980);
    float _992 = fma(_934, _790, _972);
    float _994 = fma(_936, _790, _974);
    float _996 = fma(_986, _768, _988);
    float _998 = _942 * _942;
    bool _1000 = _990 >= 0.0;
    float _1002 = fma(_982, _768, _992);
    float _1004 = fma(_984, _768, _994);
    float _1006 = fma(_954, _954, _998);
    float _1008 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].z, _996);
    float _1010 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1002);
    float _1012 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1004);
    float _1014 = fma(_978, _978, _1006);
    float _1016 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1020 = rsqrt(_1014);
    float _1022 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1024 = _984;
    if (_1000)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1026 = _1024;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1030 = as_type<int>(_1026);
    if (_1000)
    {
        float _1032 = _1026 * 5.0;
        _1030 = as_type<int>(_1032);
    }
    int _1034 = _1030;
    float _1036 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1038 = _1018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1040 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1042 = 1.0;
    if (_1000)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3190 = as_type<float>(_1034);
        out.gl_Position.z = _3190;
    }
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _1044 = _942 * _1020;
    float _1046 = _954 * _1020;
    out.m_49.x = _1036;
    out.m_49.y = _1038;
    out.m_49.z = _1040;
    out.m_49.w = _1028;
    if (_1000)
    {
        out.m_33.x = 0.0;
    }
    if (_1000)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1048 = -_1044;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[18].w, _930);
    float _1052 = _978 * _1020;
    float _1054 = -_1046;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _1058 = -_1044;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1050 + _1062;
    float _1066 = -_1052;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _950);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1056 + _1070;
    float _1074 = -_1046;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _954);
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1082 = _1068 + _1080;
    float _1084 = -_1052;
    float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1078);
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1088);
    bool _1092 = _1090 >= 0.0;
    float _1094 = _1060 * _1060;
    float _1096 = fma(_1076, _1076, _1094);
    float _1098 = fma(_1086, _1086, _1096);
    if (_1092)
    {
        _1042 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1100 = _1042;
    int _1102 = as_type<int>(_1100);
    if (_1092)
    {
        out.m_33.x = 0.0;
    }
    if (_1092)
    {
        float _1104 = _1100 * 5.0;
        _1102 = as_type<int>(_1104);
    }
    int _1106 = _1102;
    if (_1092)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3333 = as_type<float>(_1106);
        out.gl_Position.z = _3333;
    }
    if (_1092)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1108 = in.m_51.x;
    float _1110 = in.m_51.y;
    float _1112 = in.m_51.z;
    float _1114 = sqrt(_1098);
    float _1116 = _334 * _564;
    float _1118 = _334 * _562;
    float _1120 = _334 * _566;
    bool _1122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1124 = isnan(0.5);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1130 = _1126 || _1128;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1134 = _1020 * _1114;
    float _1136 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1138 = _1134 * _1132;
    float _1140 = _1134 * _1136;
    float _1142 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1110);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1108);
    float _1148 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1112);
    float _1150 = _1134 * _1142;
    float _1152 = _1144 * _1140;
    float _1154 = _1146 * _1138;
    float _1156 = _1148 * _1150;
    float _1158 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1166 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1158);
    float _1168 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1170 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1168);
    float _1178 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1170);
    float _1180 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1188 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1190 = _950 + _1182;
    float _1192 = _720 + _1184;
    float _1194 = 1.0 / _1186;
    float _1196 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1188);
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1200 = _1190 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1204 = _1192 + _1202;
    float _1206 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1208 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1196);
    float _1210 = _1200 * _1200;
    float _1212 = _930 + _1206;
    float _1214 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = fma(_1204, _1204, _1210);
    float _1218 = _1214 + _1186;
    float _1220 = sqrt(_1216);
    float _1222 = _1218 * _1194;
    float _1224 = _1222 * 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1226);
    float _1230 = 1.0 / _1228;
    bool _1232 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1224;
    float _1236 = _1218;
    float _1238 = _1192;
    if (!_1232)
    {
        _1234 = _1192;
    }
    float _1240 = _1234;
    float _1242 = _1240;
    if (!_1232)
    {
        _1236 = _1190;
    }
    float _1244 = _1236;
    float _1246 = _1244;
    if (!_1232)
    {
        _1238 = _1212;
    }
    float _1248 = _1238;
    bool _1250 = !_1232;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1220 + _1256;
        float _1260 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = rsqrt(_1216);
        float _1264 = _1258 * _1254;
        float _1266 = _1264 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1260, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1262 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = fma(_1204, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1284 = fma(_1200, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = fma(_1212, _1274, _1286);
        _1242 = _1282;
        _1252 = _1288;
        _1246 = _1284;
    }
    float _1290 = _1242;
    float _1292 = _1252;
    float _1294 = _1246;
    bool _1296 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1298 = isnan(0.5);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1304 = _1300 || _1302;
    float _1306 = -_1046;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1290);
    float _1310 = -_1044;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1292);
    float _1314 = -_1052;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1318 = _1312;
    float _1320 = _1308;
    float _1322 = _1316;
    if (!_1130)
    {
        float _1324 = _1064 * _1064;
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1328 = -_950;
        float _1330 = _1328 + _1294;
        float _1332 = fma(_1072, _1072, _1324);
        float _1334 = fma(_1082, _1082, _1332);
        float _1336 = 1.0 / _1134;
        float _1338 = sqrt(_1334);
        float _1340 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1326;
        float _1344 = -_720;
        float _1346 = _1344 + _1290;
        float _1348 = _1342 * _1336;
        float _1350 = -_930;
        float _1352 = _1350 + _1292;
        float _1354 = fma(_1346, _1348, _1056);
        float _1356 = fma(_1352, _1348, _1050);
        float _1358 = fma(_1330, _1348, _1068);
        _1318 = _1356;
        _1320 = _1354;
        _1322 = _1358;
    }
    float _1360 = _1318;
    float _1362 = _1320;
    float _1364 = _1322;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1368 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1370 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1372 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1366);
    float _1376 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1368);
    float _1378 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1370);
    float _1380 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1372);
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1374);
    float _1384 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1376);
    float _1386 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1378);
    float _1388 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1380);
    float _1390 = _1368;
    float _1392 = _1376;
    if (_1304)
    {
        _1390 = 1.0;
    }
    float _1394 = _1390;
    float _1396 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1398 = _1394;
    if (_1304)
    {
        _1392 = 1.0;
    }
    float _1400 = _1392;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1230 * _1402;
    float _1406 = _1400;
    if (!_1304)
    {
        float _1408 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1410 = _1408 * 0.15915493667125701904296875;
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1414 = _1410 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 0.15915493667125701904296875;
        float _1420 = _1410 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        float _1424 = 1.0 / _1416;
        float _1426 = _1418 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = _1418 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = _1428 * _1430;
        float _1438 = 1.0 / _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1440;
        float _1444 = 1.0 / _1442;
        float _1446 = _1434 * _1438;
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = fma(_1404, _1446, _1448);
        float _1452 = _1450 * _1444;
        float _1454 = precise::clamp(_1452, 0.0, 1.0);
        _1398 = _1454;
    }
    float _1456 = _1398;
    if (!_1304)
    {
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = _1458 * 0.15915493667125701904296875;
        float _1464 = _1460 * 0.15915493667125701904296875;
        float _1466 = _1462 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1462 * 6.283185482025146484375;
        float _1472 = sin(_1470);
        float _1474 = 1.0 / _1468;
        float _1476 = _1464 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = _1472 * _1474;
        float _1482 = _1464 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1488 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1486;
        float _1490 = _1478 * _1480;
        float _1492 = 1.0 / _1488;
        float _1494 = 1.0 / _1490;
        float _1496 = _1484 * _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1500 = fma(_1404, _1496, _1498);
        float _1502 = _1500 * _1492;
        float _1504 = precise::clamp(_1502, 0.0, 1.0);
        float _1506 = -_1504;
        float _1508 = _1506 + 1.0;
        _1406 = _1508;
    }
    float _1510 = _1406;
    float _1512 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1514 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1518 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1520 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1522 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    float _1524 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    float _1526 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1528 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1518);
    float _1530 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1522);
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1524);
    bool _1536 = _1456 > 0.0;
    bool _1538 = isnan(_1456);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    float _1546 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1526);
    float _1548 = _1456 * _1510;
    float _1550 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1532);
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1534);
    bool _1556 = _1510 <= 0.0;
    bool _1558 = !_1544;
    bool _1560 = _1556 || _1558;
    float _1562 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1546);
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1566 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1568 = _1552 + _1554;
    float _1570 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1562);
    float _1572 = _1564 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1574 = _1568 * 0.5;
    out.m_33.x = _1572;
    out.gl_Position.x = _1566;
    out.gl_Position.y = _1570;
    out.gl_Position.z = _1552;
    out.gl_Position.w = _1554;
    out.m_53.z = _1574;
    out.m_53.w = _1554;
    if (!_1560)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1576;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

