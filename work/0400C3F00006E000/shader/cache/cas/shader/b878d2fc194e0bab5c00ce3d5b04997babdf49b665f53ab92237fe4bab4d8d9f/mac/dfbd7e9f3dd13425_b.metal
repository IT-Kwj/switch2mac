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
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_35 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _881 = as_type<float>(_84);
        out.gl_Position.z = _881;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = _102;
    if (_98)
    {
        float _106 = float(_68);
        _76 = _106;
    }
    float _108 = _76;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _951 = as_type<float>(_122);
        out.gl_Position.z = _951;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_33.x;
    float _126 = in.m_33.y;
    float _128 = in.m_33.z;
    float _130 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _132 = log2(_130);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _134 = _132 * _102;
    float _136 = exp2(_134);
    float _138 = _128 * 2.0;
    float _140 = _124 * 2.0;
    bool _142 = _138 > 1.0;
    float _144 = fma(_126, 3.0, 1.0);
    bool _146 = _138 >= 1.0;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = floor(_140);
    int _158 = _154 ? 0 : 1;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _170 = _168 != 0;
    float _172 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _124);
    int _174 = ~_158;
    int _176 = _174 + 1;
    int _178 = _176 + 1;
    float _180 = _124 + _128;
    float _182 = -_136;
    float _184 = _182 + 1.0;
    int _186 = _178;
    if (!_142)
    {
        int _188 = ~_158;
        int _190 = _188 + 1;
        _186 = _190;
    }
    int _192 = _186;
    float _194 = _126 * 2.0;
    float _196 = _180 + (-1.0);
    float _198 = _172 * _144;
    float _200 = float(_192);
    float _202 = _126 + _128;
    float _204 = floor(_194);
    float _206 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _208 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _210 = isnan(1.0);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _216 = _212 || _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _220 = 1.0 + _218;
    float _222 = _198 * _200;
    float _224 = _222 * 2.0;
    float _226 = _202 + (-1.0);
    bool _228 = _156 > 0.0;
    float _230 = _224 * 0.15915493667125701904296875;
    bool _232 = _156 >= 0.0;
    bool _234 = isnan(_156);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _244 = !_166;
    int _246 = _244 ? 0 : 1;
    float _248 = in.m_35.x;
    float _250 = in.m_35.y;
    float _252 = in.m_35.z;
    int _254 = _240 ? 0 : 1;
    float _256 = _230 * 6.283185482025146484375;
    float _258 = cos(_256);
    int _260 = abs(_246);
    float _262 = _128 + (-0.5);
    bool _264 = _204 > 0.0;
    bool _266 = !_170;
    int _268 = _266 ? 0 : 1;
    bool _270 = _204 >= 0.0;
    bool _272 = isnan(_204);
    bool _274 = _270 || _272;
    bool _276 = isnan(0.0);
    bool _278 = _274 || _276;
    float _280 = 1.0 / _220;
    float _282 = in.m_37.x;
    float _284 = in.m_37.y;
    float _286 = in.m_37.z;
    int _288 = ~_254;
    int _290 = _288 + 1;
    int _292 = _290 + 1;
    int _294 = abs(_268);
    int _296 = _292;
    if (!_228)
    {
        int _298 = ~_254;
        int _300 = _298 + 1;
        _296 = _300;
    }
    int _302 = _296;
    float _304 = _230 * 6.283185482025146484375;
    float _306 = sin(_304);
    float _308 = float(_260);
    int _310 = _278 ? 0 : 1;
    float _312 = float(_302);
    bool _314 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _322 = _318 || _320;
    float _324 = floor(_138);
    int _326 = ~_310;
    int _328 = _326 + 1;
    int _330 = _328 + 1;
    int _332 = _330;
    if (!_264)
    {
        int _334 = ~_310;
        int _336 = _334 + 1;
        _332 = _336;
    }
    int _338 = _332;
    float _340 = _308 * _312;
    float _342 = _322 ? _184 : 0.0;
    float _344 = _258 * _250;
    float _346 = float(_294);
    float _348 = _340 * (-2.0);
    float _350 = float(_338);
    float _352 = fma(_306, _248, _344);
    if (_216)
    {
        float _354 = _342 * _280;
        _104 = _354;
    }
    float _356 = _104;
    float _358 = _126 + (-0.5);
    float _360 = fma(_348, _284, _284);
    float _362 = _346 * _350;
    float _364 = _224 + _352;
    bool _366 = _324 > 0.0;
    float _368 = fma(_242, _348, _242);
    float _370 = _362 * (-2.0);
    bool _372 = _324 >= 0.0;
    bool _374 = isnan(_324);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = _364 * 0.15915493667125701904296875;
    float _384 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[196].y, _360);
    float _386 = fma(_206, _370, _206);
    float _388 = fma(_370, _286, _286);
    int _390 = _380 ? 0 : 1;
    float _392 = _124 + _126;
    bool _394 = !_162;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].z, _388);
    int _400 = ~_390;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = _382 * 6.283185482025146484375;
    float _408 = sin(_406);
    int _410 = abs(_396);
    float _412 = fma(_386, _356, _398);
    int _414 = _404;
    if (!_366)
    {
        int _416 = ~_390;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = _392 + (-1.0);
    float _424 = float(_410);
    float _426 = in.m_26.x;
    float _428 = in.m_26.y;
    float _430 = in.m_26.z;
    float _432 = float(_420);
    float _434 = _412 * 0.15915493667125701904296875;
    float _436 = _124 + (-0.5);
    float _438 = fma(_368, _356, _384);
    float _440 = _424 * _432;
    float _442 = in.m_39.x;
    float _444 = in.m_39.y;
    float _446 = in.m_39.z;
    float _448 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = _438 * 0.15915493667125701904296875;
    float _452 = _440 * (-2.0);
    float _454 = _434 * 6.283185482025146484375;
    float _456 = sin(_454);
    float _458 = in.m_41.x;
    float _460 = in.m_41.y;
    float _462 = in.m_41.z;
    float _464 = fma(_452, _282, _282);
    float _466 = fma(_448, _452, _448);
    float _468 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[196].x, _464);
    float _470 = _450 * 6.283185482025146484375;
    float _472 = sin(_470);
    float _474 = fma(_466, _356, _468);
    float _476 = _428 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = _428 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = _428 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = _450 * 6.283185482025146484375;
    float _484 = cos(_482);
    float _486 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    float _488 = _474 * 0.15915493667125701904296875;
    float _490 = _306 * _250;
    float _492 = _442 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    float _496 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _498 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _434 * 6.283185482025146484375;
    float _502 = cos(_500);
    float _504 = _408 * 0.15915493667125701904296875;
    float _506 = _306 * _460;
    float _508 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _510 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _512 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _514 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[4].z, _486);
    float _516 = _504 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = -_490;
    float _522 = fma(_258, _248, _520);
    float _524 = _258 * _460;
    float _526 = -_506;
    float _528 = fma(_258, _458, _526);
    float _530 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = fma(_306, _458, _524);
    float _536 = _472 * _456;
    float _538 = _504 * 6.283185482025146484375;
    float _540 = cos(_538);
    float _542 = _484 * _456;
    float _544 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[6].z, _496);
    float _546 = _518 * _252;
    float _548 = _488 * 6.283185482025146484375;
    float _550 = cos(_548);
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _554 = _530 * _552;
    float _556 = _484 * _502;
    float _558 = -_546;
    float _560 = fma(_352, _540, _558);
    float _562 = _488 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _540 * _252;
    bool _568 = _560 != 0.0;
    bool _570 = isnan(_560);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = fma(_352, _518, _566);
    float _580 = _472 * _502;
    bool _582 = _522 == 0.0;
    bool _584 = !_576;
    bool _586 = _582 && _584;
    float _588 = _550 * _502;
    float _590 = _550 * _456;
    float _592 = _550 * _472;
    bool _594 = _578 == 0.0;
    bool _596 = _594 && _586;
    float _598 = _550 * _484;
    float _600 = fma(_564, _536, _556);
    float _602 = fma(_564, _556, _536);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _560);
    float _606 = -_580;
    float _608 = fma(_564, _542, _606);
    float _610 = -_542;
    float _612 = fma(_564, _580, _610);
    float _614 = _518 * _462;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _578);
    float _618 = _512 * _604;
    float _620 = _540 * _462;
    float _622 = -_614;
    float _624 = fma(_540, _534, _622);
    float _626 = _532 * _616;
    float _628 = _588 * _618;
    float _630 = _612 * _618;
    float _632 = _602 * _618;
    float _634 = _624;
    float _636 = _528;
    if (!_596)
    {
        float _638 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _624);
        _634 = _638;
    }
    float _640 = _634;
    float _642 = fma(_590, _554, _628);
    float _644 = fma(_600, _554, _630);
    float _646 = fma(_608, _554, _632);
    if (!_596)
    {
        float _648 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _636 = _648;
    }
    float _650 = _636;
    float _652 = _588 * _640;
    float _654 = -_564;
    float _656 = fma(_654, _626, _642);
    float _658 = fma(_518, _534, _620);
    float _660 = _612 * _640;
    float _662 = _602 * _640;
    float _664 = fma(_590, _650, _652);
    float _666 = fma(_592, _626, _644);
    float _668 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _670 = fma(_600, _650, _660);
    float _672 = fma(_608, _650, _662);
    float _674 = _656 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _676 = _656 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _678 = fma(_598, _626, _646);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[9].x, _668);
    float _682 = _658;
    if (!_596)
    {
        float _684 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _682 = _684;
    }
    float _686 = _682;
    float _688 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[8].x, _674);
    float _690 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[10].x, _676);
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _680);
    float _694 = _508 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = -_564;
    float _698 = fma(_696, _686, _664);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _688);
    float _702 = _514 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _704 = _694 + _692;
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _690);
    float _708 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _710 = _702 + _700;
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = _704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _716 = _708 + _706;
    float _718 = _704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _714);
    float _724 = fma(_598, _686, _672);
    float _726 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _718);
    float _728 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[1].z, _720);
    float _730 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[0].z, _722);
    float _732 = fma(_592, _686, _670);
    float _734 = _698 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _738 = _730 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _740 = _698 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _742 = _698 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _744 = _736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _746 = _736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _748 = _736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _750 = _736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _752 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[2].z, _726);
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _744);
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _746);
    float _758 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _748);
    float _760 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _750);
    float _762 = _704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _764 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _734);
    float _766 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _740);
    float _768 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _742);
    float _770 = _752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _772 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _762);
    float _774 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].z, _766);
    float _776 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _778 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _754);
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _756);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _758);
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _760);
    float _786 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[3].z, _772);
    float _788 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].z, _764);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[5].w, _780);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _808 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _816 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _822 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[6].w, _782);
    float _824 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[7].w, _784);
    out.m_43.x = _808;
    out.m_43.y = _810;
    out.m_43.z = _812;
    out.m_43.w = _806;
    out.m_45.x = _814;
    out.m_45.y = _816;
    out.m_45.z = _818;
    out.m_47.x = _710;
    out.m_47.y = _704;
    out.m_47.z = _716;
    out.m_49.x = _788;
    out.m_49.y = _774;
    out.m_49.z = _776;
    out.gl_Position.x = _820;
    out.gl_Position.y = _804;
    out.gl_Position.z = _822;
    out.gl_Position.w = _824;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _881 = as_type<float>(_84);
        out.gl_Position.z = _881;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = _102;
    if (_98)
    {
        float _106 = float(_68);
        _76 = _106;
    }
    float _108 = _76;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _951 = as_type<float>(_122);
        out.gl_Position.z = _951;
    }
    if (_114)
    {
        return out;
    }
    float _124 = in.m_33.x;
    float _126 = in.m_33.y;
    float _128 = in.m_33.z;
    float _130 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _132 = log2(_130);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _134 = _132 * _102;
    float _136 = exp2(_134);
    float _138 = _128 * 2.0;
    float _140 = _124 * 2.0;
    bool _142 = _138 > 1.0;
    float _144 = fma(_126, 3.0, 1.0);
    bool _146 = _138 >= 1.0;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = floor(_140);
    int _158 = _154 ? 0 : 1;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _170 = _168 != 0;
    float _172 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _124);
    int _174 = ~_158;
    int _176 = _174 + 1;
    int _178 = _176 + 1;
    float _180 = _124 + _128;
    float _182 = -_136;
    float _184 = _182 + 1.0;
    int _186 = _178;
    if (!_142)
    {
        int _188 = ~_158;
        int _190 = _188 + 1;
        _186 = _190;
    }
    int _192 = _186;
    float _194 = _126 * 2.0;
    float _196 = _180 + (-1.0);
    float _198 = _172 * _144;
    float _200 = float(_192);
    float _202 = _126 + _128;
    float _204 = floor(_194);
    float _206 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _208 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _210 = isnan(1.0);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _216 = _212 || _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _220 = 1.0 + _218;
    float _222 = _198 * _200;
    float _224 = _222 * 2.0;
    float _226 = _202 + (-1.0);
    bool _228 = _156 > 0.0;
    float _230 = _224 * 0.15915493667125701904296875;
    bool _232 = _156 >= 0.0;
    bool _234 = isnan(_156);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _244 = !_166;
    int _246 = _244 ? 0 : 1;
    float _248 = in.m_35.x;
    float _250 = in.m_35.y;
    float _252 = in.m_35.z;
    int _254 = _240 ? 0 : 1;
    float _256 = _230 * 6.283185482025146484375;
    float _258 = cos(_256);
    int _260 = abs(_246);
    float _262 = _128 + (-0.5);
    bool _264 = _204 > 0.0;
    bool _266 = !_170;
    int _268 = _266 ? 0 : 1;
    bool _270 = _204 >= 0.0;
    bool _272 = isnan(_204);
    bool _274 = _270 || _272;
    bool _276 = isnan(0.0);
    bool _278 = _274 || _276;
    float _280 = 1.0 / _220;
    float _282 = in.m_37.x;
    float _284 = in.m_37.y;
    float _286 = in.m_37.z;
    int _288 = ~_254;
    int _290 = _288 + 1;
    int _292 = _290 + 1;
    int _294 = abs(_268);
    int _296 = _292;
    if (!_228)
    {
        int _298 = ~_254;
        int _300 = _298 + 1;
        _296 = _300;
    }
    int _302 = _296;
    float _304 = _230 * 6.283185482025146484375;
    float _306 = sin(_304);
    float _308 = float(_260);
    int _310 = _278 ? 0 : 1;
    float _312 = float(_302);
    bool _314 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _322 = _318 || _320;
    float _324 = floor(_138);
    int _326 = ~_310;
    int _328 = _326 + 1;
    int _330 = _328 + 1;
    int _332 = _330;
    if (!_264)
    {
        int _334 = ~_310;
        int _336 = _334 + 1;
        _332 = _336;
    }
    int _338 = _332;
    float _340 = _308 * _312;
    float _342 = _322 ? _184 : 0.0;
    float _344 = _258 * _250;
    float _346 = float(_294);
    float _348 = _340 * (-2.0);
    float _350 = float(_338);
    float _352 = fma(_306, _248, _344);
    if (_216)
    {
        float _354 = _342 * _280;
        _104 = _354;
    }
    float _356 = _104;
    float _358 = _126 + (-0.5);
    float _360 = fma(_348, _284, _284);
    float _362 = _346 * _350;
    float _364 = _224 + _352;
    bool _366 = _324 > 0.0;
    float _368 = fma(_242, _348, _242);
    float _370 = _362 * (-2.0);
    bool _372 = _324 >= 0.0;
    bool _374 = isnan(_324);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = _364 * 0.15915493667125701904296875;
    float _384 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[196].y, _360);
    float _386 = fma(_206, _370, _206);
    float _388 = fma(_370, _286, _286);
    int _390 = _380 ? 0 : 1;
    float _392 = _124 + _126;
    bool _394 = !_162;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].z, _388);
    int _400 = ~_390;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = _382 * 6.283185482025146484375;
    float _408 = sin(_406);
    int _410 = abs(_396);
    float _412 = fma(_386, _356, _398);
    int _414 = _404;
    if (!_366)
    {
        int _416 = ~_390;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = _392 + (-1.0);
    float _424 = float(_410);
    float _426 = in.m_26.x;
    float _428 = in.m_26.y;
    float _430 = in.m_26.z;
    float _432 = float(_420);
    float _434 = _412 * 0.15915493667125701904296875;
    float _436 = _124 + (-0.5);
    float _438 = fma(_368, _356, _384);
    float _440 = _424 * _432;
    float _442 = in.m_39.x;
    float _444 = in.m_39.y;
    float _446 = in.m_39.z;
    float _448 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = _438 * 0.15915493667125701904296875;
    float _452 = _440 * (-2.0);
    float _454 = _434 * 6.283185482025146484375;
    float _456 = sin(_454);
    float _458 = in.m_41.x;
    float _460 = in.m_41.y;
    float _462 = in.m_41.z;
    float _464 = fma(_452, _282, _282);
    float _466 = fma(_448, _452, _448);
    float _468 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[196].x, _464);
    float _470 = _450 * 6.283185482025146484375;
    float _472 = sin(_470);
    float _474 = fma(_466, _356, _468);
    float _476 = _428 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = _428 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = _428 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = _450 * 6.283185482025146484375;
    float _484 = cos(_482);
    float _486 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    float _488 = _474 * 0.15915493667125701904296875;
    float _490 = _306 * _250;
    float _492 = _442 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    float _496 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _498 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _434 * 6.283185482025146484375;
    float _502 = cos(_500);
    float _504 = _408 * 0.15915493667125701904296875;
    float _506 = _306 * _460;
    float _508 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _510 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _512 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _514 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[4].z, _486);
    float _516 = _504 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = -_490;
    float _522 = fma(_258, _248, _520);
    float _524 = _258 * _460;
    float _526 = -_506;
    float _528 = fma(_258, _458, _526);
    float _530 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = fma(_306, _458, _524);
    float _536 = _472 * _456;
    float _538 = _504 * 6.283185482025146484375;
    float _540 = cos(_538);
    float _542 = _484 * _456;
    float _544 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[6].z, _496);
    float _546 = _518 * _252;
    float _548 = _488 * 6.283185482025146484375;
    float _550 = cos(_548);
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _554 = _530 * _552;
    float _556 = _484 * _502;
    float _558 = -_546;
    float _560 = fma(_352, _540, _558);
    float _562 = _488 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _540 * _252;
    bool _568 = _560 != 0.0;
    bool _570 = isnan(_560);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = fma(_352, _518, _566);
    float _580 = _472 * _502;
    bool _582 = _522 == 0.0;
    bool _584 = !_576;
    bool _586 = _582 && _584;
    float _588 = _550 * _502;
    float _590 = _550 * _456;
    float _592 = _550 * _472;
    bool _594 = _578 == 0.0;
    bool _596 = _594 && _586;
    float _598 = _550 * _484;
    float _600 = fma(_564, _536, _556);
    float _602 = fma(_564, _556, _536);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _560);
    float _606 = -_580;
    float _608 = fma(_564, _542, _606);
    float _610 = -_542;
    float _612 = fma(_564, _580, _610);
    float _614 = _518 * _462;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _578);
    float _618 = _512 * _604;
    float _620 = _540 * _462;
    float _622 = -_614;
    float _624 = fma(_540, _534, _622);
    float _626 = _532 * _616;
    float _628 = _588 * _618;
    float _630 = _612 * _618;
    float _632 = _602 * _618;
    float _634 = _624;
    float _636 = _528;
    if (!_596)
    {
        float _638 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _624);
        _634 = _638;
    }
    float _640 = _634;
    float _642 = fma(_590, _554, _628);
    float _644 = fma(_600, _554, _630);
    float _646 = fma(_608, _554, _632);
    if (!_596)
    {
        float _648 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _636 = _648;
    }
    float _650 = _636;
    float _652 = _588 * _640;
    float _654 = -_564;
    float _656 = fma(_654, _626, _642);
    float _658 = fma(_518, _534, _620);
    float _660 = _612 * _640;
    float _662 = _602 * _640;
    float _664 = fma(_590, _650, _652);
    float _666 = fma(_592, _626, _644);
    float _668 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _670 = fma(_600, _650, _660);
    float _672 = fma(_608, _650, _662);
    float _674 = _656 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _676 = _656 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _678 = fma(_598, _626, _646);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[9].x, _668);
    float _682 = _658;
    if (!_596)
    {
        float _684 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _682 = _684;
    }
    float _686 = _682;
    float _688 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[8].x, _674);
    float _690 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[10].x, _676);
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _680);
    float _694 = _508 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = -_564;
    float _698 = fma(_696, _686, _664);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _688);
    float _702 = _514 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _704 = _694 + _692;
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _690);
    float _708 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _710 = _702 + _700;
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = _704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _716 = _708 + _706;
    float _718 = _704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _714);
    float _724 = fma(_598, _686, _672);
    float _726 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _718);
    float _728 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[1].z, _720);
    float _730 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[0].z, _722);
    float _732 = fma(_592, _686, _670);
    float _734 = _698 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _738 = _730 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _740 = _698 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _742 = _698 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _744 = _736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _746 = _736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _748 = _736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _750 = _736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _752 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[2].z, _726);
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _744);
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _746);
    float _758 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _748);
    float _760 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _750);
    float _762 = _704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _764 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _734);
    float _766 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _740);
    float _768 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _742);
    float _770 = _752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _772 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _762);
    float _774 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].z, _766);
    float _776 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _778 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _754);
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _756);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _758);
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _760);
    float _786 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[3].z, _772);
    float _788 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].z, _764);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[5].w, _780);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _808 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _816 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _822 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[6].w, _782);
    float _824 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[7].w, _784);
    out.m_43.x = _808;
    out.m_43.y = _810;
    out.m_43.z = _812;
    out.m_43.w = _806;
    out.m_45.x = _814;
    out.m_45.y = _816;
    out.m_45.z = _818;
    out.m_47.x = _710;
    out.m_47.y = _704;
    out.m_47.z = _716;
    out.m_49.x = _788;
    out.m_49.y = _774;
    out.m_49.z = _776;
    out.gl_Position.x = _820;
    out.gl_Position.y = _804;
    out.gl_Position.z = _822;
    out.gl_Position.w = _824;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    float _76 = as_type<float>(_68);
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _74;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _881 = as_type<float>(_84);
        out.gl_Position.z = _881;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = _102;
    if (_98)
    {
        float _106 = float(_68);
        _76 = _106;
    }
    float _108 = _76;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _951 = as_type<float>(_122);
        out.gl_Position.z = _951;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_33.x;
    float _126 = in.m_33.y;
    float _128 = in.m_33.z;
    float _130 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _132 = log2(_130);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _134 = _132 * _102;
    float _136 = exp2(_134);
    float _138 = _128 * 2.0;
    float _140 = _124 * 2.0;
    bool _142 = _138 > 1.0;
    float _144 = fma(_126, 3.0, 1.0);
    bool _146 = _138 >= 1.0;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = floor(_140);
    int _158 = _154 ? 0 : 1;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _170 = _168 != 0;
    float _172 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _124);
    int _174 = ~_158;
    int _176 = _174 + 1;
    int _178 = _176 + 1;
    float _180 = _124 + _128;
    float _182 = -_136;
    float _184 = _182 + 1.0;
    int _186 = _178;
    if (!_142)
    {
        int _188 = ~_158;
        int _190 = _188 + 1;
        _186 = _190;
    }
    int _192 = _186;
    float _194 = _126 * 2.0;
    float _196 = _180 + (-1.0);
    float _198 = _172 * _144;
    float _200 = float(_192);
    float _202 = _126 + _128;
    float _204 = floor(_194);
    float _206 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _208 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _210 = isnan(1.0);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _216 = _212 || _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _220 = 1.0 + _218;
    float _222 = _198 * _200;
    float _224 = _222 * 2.0;
    float _226 = _202 + (-1.0);
    bool _228 = _156 > 0.0;
    float _230 = _224 * 0.15915493667125701904296875;
    bool _232 = _156 >= 0.0;
    bool _234 = isnan(_156);
    bool _236 = _232 || _234;
    bool _238 = isnan(0.0);
    bool _240 = _236 || _238;
    float _242 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _244 = !_166;
    int _246 = _244 ? 0 : 1;
    float _248 = in.m_35.x;
    float _250 = in.m_35.y;
    float _252 = in.m_35.z;
    int _254 = _240 ? 0 : 1;
    float _256 = _230 * 6.283185482025146484375;
    float _258 = cos(_256);
    int _260 = abs(_246);
    float _262 = _128 + (-0.5);
    bool _264 = _204 > 0.0;
    bool _266 = !_170;
    int _268 = _266 ? 0 : 1;
    bool _270 = _204 >= 0.0;
    bool _272 = isnan(_204);
    bool _274 = _270 || _272;
    bool _276 = isnan(0.0);
    bool _278 = _274 || _276;
    float _280 = 1.0 / _220;
    float _282 = in.m_37.x;
    float _284 = in.m_37.y;
    float _286 = in.m_37.z;
    int _288 = ~_254;
    int _290 = _288 + 1;
    int _292 = _290 + 1;
    int _294 = abs(_268);
    int _296 = _292;
    if (!_228)
    {
        int _298 = ~_254;
        int _300 = _298 + 1;
        _296 = _300;
    }
    int _302 = _296;
    float _304 = _230 * 6.283185482025146484375;
    float _306 = sin(_304);
    float _308 = float(_260);
    int _310 = _278 ? 0 : 1;
    float _312 = float(_302);
    bool _314 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _316 = isnan(0.0);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _322 = _318 || _320;
    float _324 = floor(_138);
    int _326 = ~_310;
    int _328 = _326 + 1;
    int _330 = _328 + 1;
    int _332 = _330;
    if (!_264)
    {
        int _334 = ~_310;
        int _336 = _334 + 1;
        _332 = _336;
    }
    int _338 = _332;
    float _340 = _308 * _312;
    float _342 = _322 ? _184 : 0.0;
    float _344 = _258 * _250;
    float _346 = float(_294);
    float _348 = _340 * (-2.0);
    float _350 = float(_338);
    float _352 = fma(_306, _248, _344);
    if (_216)
    {
        float _354 = _342 * _280;
        _104 = _354;
    }
    float _356 = _104;
    float _358 = _126 + (-0.5);
    float _360 = fma(_348, _284, _284);
    float _362 = _346 * _350;
    float _364 = _224 + _352;
    bool _366 = _324 > 0.0;
    float _368 = fma(_242, _348, _242);
    float _370 = _362 * (-2.0);
    bool _372 = _324 >= 0.0;
    bool _374 = isnan(_324);
    bool _376 = _372 || _374;
    bool _378 = isnan(0.0);
    bool _380 = _376 || _378;
    float _382 = _364 * 0.15915493667125701904296875;
    float _384 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[196].y, _360);
    float _386 = fma(_206, _370, _206);
    float _388 = fma(_370, _286, _286);
    int _390 = _380 ? 0 : 1;
    float _392 = _124 + _126;
    bool _394 = !_162;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].z, _388);
    int _400 = ~_390;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    float _406 = _382 * 6.283185482025146484375;
    float _408 = sin(_406);
    int _410 = abs(_396);
    float _412 = fma(_386, _356, _398);
    int _414 = _404;
    if (!_366)
    {
        int _416 = ~_390;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = _392 + (-1.0);
    float _424 = float(_410);
    float _426 = in.m_26.x;
    float _428 = in.m_26.y;
    float _430 = in.m_26.z;
    float _432 = float(_420);
    float _434 = _412 * 0.15915493667125701904296875;
    float _436 = _124 + (-0.5);
    float _438 = fma(_368, _356, _384);
    float _440 = _424 * _432;
    float _442 = in.m_39.x;
    float _444 = in.m_39.y;
    float _446 = in.m_39.z;
    float _448 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = _438 * 0.15915493667125701904296875;
    float _452 = _440 * (-2.0);
    float _454 = _434 * 6.283185482025146484375;
    float _456 = sin(_454);
    float _458 = in.m_41.x;
    float _460 = in.m_41.y;
    float _462 = in.m_41.z;
    float _464 = fma(_452, _282, _282);
    float _466 = fma(_448, _452, _448);
    float _468 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[196].x, _464);
    float _470 = _450 * 6.283185482025146484375;
    float _472 = sin(_470);
    float _474 = fma(_466, _356, _468);
    float _476 = _428 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = _428 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = _428 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = _450 * 6.283185482025146484375;
    float _484 = cos(_482);
    float _486 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    float _488 = _474 * 0.15915493667125701904296875;
    float _490 = _306 * _250;
    float _492 = _442 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _494 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    float _496 = fma(_426, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _498 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _434 * 6.283185482025146484375;
    float _502 = cos(_500);
    float _504 = _408 * 0.15915493667125701904296875;
    float _506 = _306 * _460;
    float _508 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[5].z, _494);
    float _510 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _512 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _514 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[4].z, _486);
    float _516 = _504 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = -_490;
    float _522 = fma(_258, _248, _520);
    float _524 = _258 * _460;
    float _526 = -_506;
    float _528 = fma(_258, _458, _526);
    float _530 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _534 = fma(_306, _458, _524);
    float _536 = _472 * _456;
    float _538 = _504 * 6.283185482025146484375;
    float _540 = cos(_538);
    float _542 = _484 * _456;
    float _544 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[6].z, _496);
    float _546 = _518 * _252;
    float _548 = _488 * 6.283185482025146484375;
    float _550 = cos(_548);
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _522);
    float _554 = _530 * _552;
    float _556 = _484 * _502;
    float _558 = -_546;
    float _560 = fma(_352, _540, _558);
    float _562 = _488 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _540 * _252;
    bool _568 = _560 != 0.0;
    bool _570 = isnan(_560);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = fma(_352, _518, _566);
    float _580 = _472 * _502;
    bool _582 = _522 == 0.0;
    bool _584 = !_576;
    bool _586 = _582 && _584;
    float _588 = _550 * _502;
    float _590 = _550 * _456;
    float _592 = _550 * _472;
    bool _594 = _578 == 0.0;
    bool _596 = _594 && _586;
    float _598 = _550 * _484;
    float _600 = fma(_564, _536, _556);
    float _602 = fma(_564, _556, _536);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _560);
    float _606 = -_580;
    float _608 = fma(_564, _542, _606);
    float _610 = -_542;
    float _612 = fma(_564, _580, _610);
    float _614 = _518 * _462;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _578);
    float _618 = _512 * _604;
    float _620 = _540 * _462;
    float _622 = -_614;
    float _624 = fma(_540, _534, _622);
    float _626 = _532 * _616;
    float _628 = _588 * _618;
    float _630 = _612 * _618;
    float _632 = _602 * _618;
    float _634 = _624;
    float _636 = _528;
    if (!_596)
    {
        float _638 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _624);
        _634 = _638;
    }
    float _640 = _634;
    float _642 = fma(_590, _554, _628);
    float _644 = fma(_600, _554, _630);
    float _646 = fma(_608, _554, _632);
    if (!_596)
    {
        float _648 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _636 = _648;
    }
    float _650 = _636;
    float _652 = _588 * _640;
    float _654 = -_564;
    float _656 = fma(_654, _626, _642);
    float _658 = fma(_518, _534, _620);
    float _660 = _612 * _640;
    float _662 = _602 * _640;
    float _664 = fma(_590, _650, _652);
    float _666 = fma(_592, _626, _644);
    float _668 = _656 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _670 = fma(_600, _650, _660);
    float _672 = fma(_608, _650, _662);
    float _674 = _656 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _676 = _656 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _678 = fma(_598, _626, _646);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[9].x, _668);
    float _682 = _658;
    if (!_596)
    {
        float _684 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _682 = _684;
    }
    float _686 = _682;
    float _688 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[8].x, _674);
    float _690 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[10].x, _676);
    float _692 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].z, _680);
    float _694 = _508 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = -_564;
    float _698 = fma(_696, _686, _664);
    float _700 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].z, _688);
    float _702 = _514 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _704 = _694 + _692;
    float _706 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].z, _690);
    float _708 = _544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _710 = _702 + _700;
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = _704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _716 = _708 + _706;
    float _718 = _704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _722 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _714);
    float _724 = fma(_598, _686, _672);
    float _726 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _718);
    float _728 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[1].z, _720);
    float _730 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[0].z, _722);
    float _732 = fma(_592, _686, _670);
    float _734 = _698 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _738 = _730 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _740 = _698 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _742 = _698 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _744 = _736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _746 = _736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _748 = _736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _750 = _736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _752 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[2].z, _726);
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[4].x, _744);
    float _756 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[5].x, _746);
    float _758 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[6].x, _748);
    float _760 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[7].x, _750);
    float _762 = _704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _764 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _734);
    float _766 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _740);
    float _768 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _742);
    float _770 = _752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _772 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _762);
    float _774 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].z, _766);
    float _776 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].z, _768);
    float _778 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[4].z, _754);
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[5].z, _756);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[6].z, _758);
    float _784 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[7].z, _760);
    float _786 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[3].z, _772);
    float _788 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].z, _764);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[5].w, _780);
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _808 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _816 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _822 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[6].w, _782);
    float _824 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[7].w, _784);
    out.m_43.x = _808;
    out.m_43.y = _810;
    out.m_43.z = _812;
    out.m_43.w = _806;
    out.m_45.x = _814;
    out.m_45.y = _816;
    out.m_45.z = _818;
    out.m_47.x = _710;
    out.m_47.y = _704;
    out.m_47.z = _716;
    out.m_49.x = _788;
    out.m_49.y = _774;
    out.m_49.z = _776;
    out.gl_Position.x = _820;
    out.gl_Position.y = _804;
    out.gl_Position.z = _822;
    out.gl_Position.w = _824;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

