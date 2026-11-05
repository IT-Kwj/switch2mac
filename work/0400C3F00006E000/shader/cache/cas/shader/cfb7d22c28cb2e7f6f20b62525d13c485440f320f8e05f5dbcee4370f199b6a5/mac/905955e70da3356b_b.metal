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
    float4 m_47 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _270 = false;
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
        float _1131 = as_type<float>(_88);
        out.gl_Position.z = _1131;
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
    float _108 = _106;
    if (_102)
    {
        float _110 = float(_72);
        _82 = _110;
    }
    float _112 = _82;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _90 = as_type<int>(_124);
    }
    int _126 = _90;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1201 = as_type<float>(_126);
        out.gl_Position.z = _1201;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_37.w;
    float _130 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_35.x;
    float _144 = in.m_35.y;
    float _146 = in.m_35.z;
    float _148 = in.m_30.x;
    float _150 = in.m_30.y;
    float _152 = in.m_30.z;
    float _154 = 0.0;
    float _156 = _130;
    if (!_140)
    {
        float _158 = _130 * _130;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_140)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _130 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _130);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_140;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _130 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _144, _232);
    float _240 = fma(_228, _142, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _128, _150);
    float _246 = fma(_240, _128, _148);
    float _248 = fma(_242, _128, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_39.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_72);
        float _274 = 1.0 / _272;
        float _276 = _106 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = in.m_39.z;
    float _282 = in.m_39.x;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _290 = _288 != 0;
    float _292 = in.m_39.y;
    float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _296 = log2(_294);
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _308 = _306 != 0;
    float _310 = _280 * 2.0;
    float _312 = _282 * 2.0;
    float _314 = floor(_310);
    float _316 = _292 * 2.0;
    float _318 = floor(_312);
    bool _320 = _314 >= 0.0;
    bool _322 = isnan(_314);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = _292 + _280;
    bool _332 = _314 > 0.0;
    float _334 = _282 + _292;
    int _336 = _328 ? 0 : 1;
    float _338 = _330 + (-1.0);
    float _340 = floor(_316);
    float _342 = _334 + (-1.0);
    bool _344 = _318 >= 0.0;
    bool _346 = isnan(_318);
    bool _348 = _344 || _346;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _356 = _296 * _106;
    bool _358 = !_300;
    int _360 = _358 ? 0 : 1;
    float _362 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _364 = _352 ? 0 : 1;
    bool _366 = _318 > 0.0;
    float _368 = exp2(_356);
    int _370 = ~_336;
    int _372 = _370 + 1;
    int _374 = _372 + 1;
    int _376 = _374;
    if (!_332)
    {
        int _378 = ~_336;
        int _380 = _378 + 1;
        _376 = _380;
    }
    int _382 = _376;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    int _398 = abs(_360);
    float _400 = 1.0 / _386;
    float _402 = in.m_41.x;
    float _404 = in.m_41.y;
    float _406 = in.m_41.z;
    int _408 = ~_364;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    int _414 = _412;
    if (!_366)
    {
        int _416 = ~_364;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = -_368;
    float _424 = _422 + 1.0;
    bool _426 = !_304;
    int _428 = _426 ? 0 : 1;
    bool _430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = float(_398);
    float _442 = float(_382);
    int _444 = abs(_428);
    bool _446 = _340 > 0.0;
    float _448 = _440 * _442;
    float _450 = _438 ? _424 : 0.0;
    float _452 = float(_444);
    float _454 = float(_420);
    if (_396)
    {
        float _456 = _450 * _400;
        _108 = _456;
    }
    float _458 = _108;
    bool _460 = _340 >= 0.0;
    bool _462 = isnan(_340);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = _448 * (-2.0);
    bool _472 = !_308;
    int _474 = _472 ? 0 : 1;
    float _476 = _452 * _454;
    int _478 = _468 ? 0 : 1;
    float _480 = fma(_362, _470, _362);
    int _482 = abs(_474);
    float _484 = fma(_470, _402, _402);
    float _486 = _282 + (-0.5);
    int _488 = ~_478;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = _476 * (-2.0);
    int _496 = _492;
    if (!_446)
    {
        int _498 = ~_478;
        int _500 = _498 + 1;
        _496 = _500;
    }
    int _502 = _496;
    float _504 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[196].x, _484);
    bool _506 = _292 > 0.5;
    float _508 = _292 + (-0.5);
    float _510 = fma(_494, _404, _404);
    float _512 = float(_482);
    float _514 = fma(_480, _458, _504);
    float _516 = float(_502);
    float _518 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[196].y, _510);
    float _520 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _522 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _524 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _526 = _512 * _516;
    float _528 = in.m_37.x;
    float _530 = in.m_37.y;
    float _532 = in.m_37.z;
    float _534 = fma(_354, _494, _354);
    float _536 = _282 + _280;
    float _538 = _526 * (-2.0);
    float _540 = in.m_43.x;
    float _542 = in.m_43.y;
    float _544 = in.m_43.z;
    float _546 = _514 * 0.15915493667125701904296875;
    float _548 = _536 + (-1.0);
    float _550 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
    float _552 = fma(_534, _458, _518);
    float _554 = fma(_538, _406, _406);
    float _556 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _558 = _280 + (-0.5);
    float _560 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
    float _562 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
    float _564 = fma(_556, _538, _556);
    float _566 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[196].z, _554);
    float _568 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
    float _570 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    float _572 = _552 * 0.15915493667125701904296875;
    float _574 = fma(_564, _458, _566);
    float _576 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
    float _578 = _546 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _528 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _584 = _568 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _586 = _574 * 0.15915493667125701904296875;
    float _588 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _540);
    float _592 = _530 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _594 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _542);
    float _596 = _570 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _598 = _584 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _600 = _546 * 6.283185482025146484375;
    float _602 = cos(_600);
    float _604 = _584 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _606 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[9].x, _598);
    float _610 = _532 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _612 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[8].x, _604);
    float _614 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[9].z, _608);
    float _616 = _572 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _544);
    float _622 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[8].z, _612);
    float _624 = _614 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _626 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _628 = _606 * _590;
    float _630 = _622 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _632 = _624 * _624;
    float _634 = _572 * 6.283185482025146484375;
    float _636 = cos(_634);
    float _638 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _640 = _626 * _594;
    float _642 = fma(_630, _630, _632);
    bool _644 = _282 > 0.5;
    bool _646 = _644 && _286;
    float _648 = _638 * _620;
    float _650 = _586 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = _602 * _618;
    float _656 = _586 * 6.283185482025146484375;
    float _658 = cos(_656);
    float _660 = _580 * _636;
    float _662 = _602 * _636;
    float _664 = -_654;
    float _666 = fma(_652, _660, _664);
    float _668 = -_660;
    float _670 = fma(_652, _654, _668);
    float _672 = _580 * _618;
    float _674 = sqrt(_642);
    float _676 = fma(_652, _662, _672);
    float _678 = fma(_652, _672, _662);
    float _680 = _658 * _640;
    float _682 = _618 * _658;
    float _684 = _636 * _658;
    float _686 = _602 * _680;
    float _688 = _580 * _680;
    float _690 = -_640;
    float _692 = _652 * _690;
    float _694 = fma(_676, _628, _686);
    float _696 = fma(_666, _628, _688);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _702 = fma(_684, _628, _692);
    float _704 = fma(_670, _648, _694);
    float _706 = fma(_678, _648, _696);
    float _708 = 1.0 / _700;
    float _710 = fma(_682, _648, _702);
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _714 = _704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _716 = _704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _712);
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _714);
    float _722 = _674 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[26].z, _718);
    float _728 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[24].z, _720);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _730;
    float _734 = in.m_45.x;
    float _736 = _726 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _738 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _740 = isnan(_278);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _728 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _752 = _732 * _708;
    float _754 = fma(_736, _724, _588);
    bool _756 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _758 = isnan(_278);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -_748;
    float _770 = _768 + 1.0;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _774 = fma(_750, _724, _596);
    float _776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _778 = _754 + _776;
    float _780 = _766 * _770;
    float _782 = -_766;
    float _784 = _782 + 1.0;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _788 = _774 + _786;
    float _790 = _778 * _778;
    out.m_47.w = _772;
    bool _792 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _794 = isnan(_278);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _808 = fma(_788, _788, _790);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _278 + _810;
    bool _814 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _816 = isnan(_278);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = _802 * _784;
    float _828 = -_802;
    float _830 = _828 + 1.0;
    float _832 = 1.0 / _806;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _838 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _840 = fma(_752, _812, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _846 = _824 * _830;
    float _848 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _716);
    out.m_33.x = _838;
    float _850 = sqrt(_808);
    float _852 = _840 * _846;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _856 = _278 + _854;
    float _858 = in.m_45.y;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    float _864 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[25].z, _848);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _868 = _278 + _866;
    float _870 = _716;
    float _872 = _868;
    float _874 = _584;
    if (_286)
    {
        _870 = _734;
    }
    float _876 = _870;
    float _878 = 1.0 / _844;
    float _880 = _836 * _832;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[115].x, _852);
    float _884 = _864 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _886 = _876;
    float _888 = _884;
    if (_646)
    {
        float _890 = -_876;
        float _892 = _890 + 1.0;
        _886 = _892;
    }
    float _894 = _886;
    float _896 = fma(_880, _856, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _898 = _850 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _900;
    float _904 = fma(_896, _826, _882);
    float _906 = fma(_884, _724, _584);
    float _908 = _902 * _878;
    float _910 = -_858;
    float _912 = _910 + 1.0;
    float _914 = fma(_908, _868, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _916 = _858;
    float _918 = _912;
    if (!_286)
    {
        _872 = _734;
    }
    float _920 = _872;
    float _922 = _920;
    if (_286)
    {
        _922 = _894;
    }
    float _924 = _922;
    float _926 = fma(_914, _780, _904);
    if (_290)
    {
        float _928 = _506 ? _912 : _858;
        _916 = _928;
    }
    float _930 = _916;
    if (!_898)
    {
        _888 = _774;
    }
    float _932 = _888;
    float _934 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[118].x, _926);
    float _936 = _932;
    if (!_898)
    {
        _874 = _754;
    }
    float _938 = _874;
    float _940 = _938;
    if (!_898)
    {
        _918 = _906;
    }
    float _942 = _918;
    bool _944 = !_898;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _850 + _950;
        float _954 = rsqrt(_808);
        float _956 = _952 * _948;
        float _958 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_906, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_788, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_778, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _994 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _996 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    float _1002 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _996);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1000);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1016 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1004);
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1030 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1034 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1024);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1028);
    float _1038 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1030);
    float _1040 = _930 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1042 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1046 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1048 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1050 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1038);
    float _1052 = _1040 * _1008;
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1044);
    float _1056 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1046);
    float _1058 = _924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1062 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1064 = _1054 + _1056;
    float _1066 = _1056 * 0.5;
    float _1068 = _1058 * _1026;
    float _1070 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1050);
    float _1072 = _1064 * 0.5;
    float _1074 = fma(_1060, -0.5, _1066);
    out.m_49.w = _1062;
    out.m_51.x = _1068;
    out.m_51.y = _1052;
    out.gl_Position.x = _1054;
    out.gl_Position.y = _1060;
    out.gl_Position.z = _1070;
    out.gl_Position.w = _1056;
    out.m_53.w = _1056;
    out.m_53.x = _1072;
    out.m_53.y = _1074;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _270 = false;
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
        float _1131 = as_type<float>(_88);
        out.gl_Position.z = _1131;
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
    float _108 = _106;
    if (_102)
    {
        float _110 = float(_72);
        _82 = _110;
    }
    float _112 = _82;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _90 = as_type<int>(_124);
    }
    int _126 = _90;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1201 = as_type<float>(_126);
        out.gl_Position.z = _1201;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_37.w;
    float _130 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_35.x;
    float _144 = in.m_35.y;
    float _146 = in.m_35.z;
    float _148 = in.m_30.x;
    float _150 = in.m_30.y;
    float _152 = in.m_30.z;
    float _154 = 0.0;
    float _156 = _130;
    if (!_140)
    {
        float _158 = _130 * _130;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_140)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _130 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _130);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_140;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _130 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _144, _232);
    float _240 = fma(_228, _142, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _128, _150);
    float _246 = fma(_240, _128, _148);
    float _248 = fma(_242, _128, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_39.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_72);
        float _274 = 1.0 / _272;
        float _276 = _106 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = in.m_39.z;
    float _282 = in.m_39.x;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _290 = _288 != 0;
    float _292 = in.m_39.y;
    float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _296 = log2(_294);
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _308 = _306 != 0;
    float _310 = _280 * 2.0;
    float _312 = _282 * 2.0;
    float _314 = floor(_310);
    float _316 = _292 * 2.0;
    float _318 = floor(_312);
    bool _320 = _314 >= 0.0;
    bool _322 = isnan(_314);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = _292 + _280;
    bool _332 = _314 > 0.0;
    float _334 = _282 + _292;
    int _336 = _328 ? 0 : 1;
    float _338 = _330 + (-1.0);
    float _340 = floor(_316);
    float _342 = _334 + (-1.0);
    bool _344 = _318 >= 0.0;
    bool _346 = isnan(_318);
    bool _348 = _344 || _346;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _356 = _296 * _106;
    bool _358 = !_300;
    int _360 = _358 ? 0 : 1;
    float _362 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _364 = _352 ? 0 : 1;
    bool _366 = _318 > 0.0;
    float _368 = exp2(_356);
    int _370 = ~_336;
    int _372 = _370 + 1;
    int _374 = _372 + 1;
    int _376 = _374;
    if (!_332)
    {
        int _378 = ~_336;
        int _380 = _378 + 1;
        _376 = _380;
    }
    int _382 = _376;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    int _398 = abs(_360);
    float _400 = 1.0 / _386;
    float _402 = in.m_41.x;
    float _404 = in.m_41.y;
    float _406 = in.m_41.z;
    int _408 = ~_364;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    int _414 = _412;
    if (!_366)
    {
        int _416 = ~_364;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = -_368;
    float _424 = _422 + 1.0;
    bool _426 = !_304;
    int _428 = _426 ? 0 : 1;
    bool _430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = float(_398);
    float _442 = float(_382);
    int _444 = abs(_428);
    bool _446 = _340 > 0.0;
    float _448 = _440 * _442;
    float _450 = _438 ? _424 : 0.0;
    float _452 = float(_444);
    float _454 = float(_420);
    if (_396)
    {
        float _456 = _450 * _400;
        _108 = _456;
    }
    float _458 = _108;
    bool _460 = _340 >= 0.0;
    bool _462 = isnan(_340);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = _448 * (-2.0);
    bool _472 = !_308;
    int _474 = _472 ? 0 : 1;
    float _476 = _452 * _454;
    int _478 = _468 ? 0 : 1;
    float _480 = fma(_362, _470, _362);
    int _482 = abs(_474);
    float _484 = fma(_470, _402, _402);
    float _486 = _282 + (-0.5);
    int _488 = ~_478;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = _476 * (-2.0);
    int _496 = _492;
    if (!_446)
    {
        int _498 = ~_478;
        int _500 = _498 + 1;
        _496 = _500;
    }
    int _502 = _496;
    float _504 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[196].x, _484);
    bool _506 = _292 > 0.5;
    float _508 = _292 + (-0.5);
    float _510 = fma(_494, _404, _404);
    float _512 = float(_482);
    float _514 = fma(_480, _458, _504);
    float _516 = float(_502);
    float _518 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[196].y, _510);
    float _520 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _522 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _524 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _526 = _512 * _516;
    float _528 = in.m_37.x;
    float _530 = in.m_37.y;
    float _532 = in.m_37.z;
    float _534 = fma(_354, _494, _354);
    float _536 = _282 + _280;
    float _538 = _526 * (-2.0);
    float _540 = in.m_43.x;
    float _542 = in.m_43.y;
    float _544 = in.m_43.z;
    float _546 = _514 * 0.15915493667125701904296875;
    float _548 = _536 + (-1.0);
    float _550 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
    float _552 = fma(_534, _458, _518);
    float _554 = fma(_538, _406, _406);
    float _556 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _558 = _280 + (-0.5);
    float _560 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
    float _562 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
    float _564 = fma(_556, _538, _556);
    float _566 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[196].z, _554);
    float _568 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
    float _570 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    float _572 = _552 * 0.15915493667125701904296875;
    float _574 = fma(_564, _458, _566);
    float _576 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
    float _578 = _546 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _528 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _584 = _568 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _586 = _574 * 0.15915493667125701904296875;
    float _588 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _540);
    float _592 = _530 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _594 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _542);
    float _596 = _570 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _598 = _584 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _600 = _546 * 6.283185482025146484375;
    float _602 = cos(_600);
    float _604 = _584 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _606 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[9].x, _598);
    float _610 = _532 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _612 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[8].x, _604);
    float _614 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[9].z, _608);
    float _616 = _572 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _544);
    float _622 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[8].z, _612);
    float _624 = _614 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _626 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _628 = _606 * _590;
    float _630 = _622 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _632 = _624 * _624;
    float _634 = _572 * 6.283185482025146484375;
    float _636 = cos(_634);
    float _638 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _640 = _626 * _594;
    float _642 = fma(_630, _630, _632);
    bool _644 = _282 > 0.5;
    bool _646 = _644 && _286;
    float _648 = _638 * _620;
    float _650 = _586 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = _602 * _618;
    float _656 = _586 * 6.283185482025146484375;
    float _658 = cos(_656);
    float _660 = _580 * _636;
    float _662 = _602 * _636;
    float _664 = -_654;
    float _666 = fma(_652, _660, _664);
    float _668 = -_660;
    float _670 = fma(_652, _654, _668);
    float _672 = _580 * _618;
    float _674 = sqrt(_642);
    float _676 = fma(_652, _662, _672);
    float _678 = fma(_652, _672, _662);
    float _680 = _658 * _640;
    float _682 = _618 * _658;
    float _684 = _636 * _658;
    float _686 = _602 * _680;
    float _688 = _580 * _680;
    float _690 = -_640;
    float _692 = _652 * _690;
    float _694 = fma(_676, _628, _686);
    float _696 = fma(_666, _628, _688);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _702 = fma(_684, _628, _692);
    float _704 = fma(_670, _648, _694);
    float _706 = fma(_678, _648, _696);
    float _708 = 1.0 / _700;
    float _710 = fma(_682, _648, _702);
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _714 = _704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _716 = _704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _712);
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _714);
    float _722 = _674 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[26].z, _718);
    float _728 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[24].z, _720);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _730;
    float _734 = in.m_45.x;
    float _736 = _726 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _738 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _740 = isnan(_278);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _728 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _752 = _732 * _708;
    float _754 = fma(_736, _724, _588);
    bool _756 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _758 = isnan(_278);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -_748;
    float _770 = _768 + 1.0;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _774 = fma(_750, _724, _596);
    float _776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _778 = _754 + _776;
    float _780 = _766 * _770;
    float _782 = -_766;
    float _784 = _782 + 1.0;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _788 = _774 + _786;
    float _790 = _778 * _778;
    out.m_47.w = _772;
    bool _792 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _794 = isnan(_278);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _808 = fma(_788, _788, _790);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _278 + _810;
    bool _814 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _816 = isnan(_278);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = _802 * _784;
    float _828 = -_802;
    float _830 = _828 + 1.0;
    float _832 = 1.0 / _806;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _838 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _840 = fma(_752, _812, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _846 = _824 * _830;
    float _848 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _716);
    out.m_33.x = _838;
    float _850 = sqrt(_808);
    float _852 = _840 * _846;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _856 = _278 + _854;
    float _858 = in.m_45.y;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    float _864 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[25].z, _848);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _868 = _278 + _866;
    float _870 = _716;
    float _872 = _868;
    float _874 = _584;
    if (_286)
    {
        _870 = _734;
    }
    float _876 = _870;
    float _878 = 1.0 / _844;
    float _880 = _836 * _832;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[115].x, _852);
    float _884 = _864 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _886 = _876;
    float _888 = _884;
    if (_646)
    {
        float _890 = -_876;
        float _892 = _890 + 1.0;
        _886 = _892;
    }
    float _894 = _886;
    float _896 = fma(_880, _856, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _898 = _850 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _900;
    float _904 = fma(_896, _826, _882);
    float _906 = fma(_884, _724, _584);
    float _908 = _902 * _878;
    float _910 = -_858;
    float _912 = _910 + 1.0;
    float _914 = fma(_908, _868, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _916 = _858;
    float _918 = _912;
    if (!_286)
    {
        _872 = _734;
    }
    float _920 = _872;
    float _922 = _920;
    if (_286)
    {
        _922 = _894;
    }
    float _924 = _922;
    float _926 = fma(_914, _780, _904);
    if (_290)
    {
        float _928 = _506 ? _912 : _858;
        _916 = _928;
    }
    float _930 = _916;
    if (!_898)
    {
        _888 = _774;
    }
    float _932 = _888;
    float _934 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[118].x, _926);
    float _936 = _932;
    if (!_898)
    {
        _874 = _754;
    }
    float _938 = _874;
    float _940 = _938;
    if (!_898)
    {
        _918 = _906;
    }
    float _942 = _918;
    bool _944 = !_898;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _850 + _950;
        float _954 = rsqrt(_808);
        float _956 = _952 * _948;
        float _958 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_906, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_788, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_778, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _994 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _996 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    float _1002 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _996);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1000);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1016 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1004);
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1030 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1034 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1024);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1028);
    float _1038 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1030);
    float _1040 = _930 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1042 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1046 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1048 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1050 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1038);
    float _1052 = _1040 * _1008;
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1044);
    float _1056 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1046);
    float _1058 = _924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1062 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1064 = _1054 + _1056;
    float _1066 = _1056 * 0.5;
    float _1068 = _1058 * _1026;
    float _1070 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1050);
    float _1072 = _1064 * 0.5;
    float _1074 = fma(_1060, -0.5, _1066);
    out.m_49.w = _1062;
    out.m_51.x = _1068;
    out.m_51.y = _1052;
    out.gl_Position.x = _1054;
    out.gl_Position.y = _1060;
    out.gl_Position.z = _1070;
    out.gl_Position.w = _1056;
    out.m_53.w = _1056;
    out.m_53.x = _1072;
    out.m_53.y = _1074;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _270 = false;
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
        float _1131 = as_type<float>(_88);
        out.gl_Position.z = _1131;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = _106;
    if (_102)
    {
        float _110 = float(_72);
        _82 = _110;
    }
    float _112 = _82;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _90 = as_type<int>(_124);
    }
    int _126 = _90;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1201 = as_type<float>(_126);
        out.gl_Position.z = _1201;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_37.w;
    float _130 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_35.x;
    float _144 = in.m_35.y;
    float _146 = in.m_35.z;
    float _148 = in.m_30.x;
    float _150 = in.m_30.y;
    float _152 = in.m_30.z;
    float _154 = 0.0;
    float _156 = _130;
    if (!_140)
    {
        float _158 = _130 * _130;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_140)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _130 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _130);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_140;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _130 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _144, _232);
    float _240 = fma(_228, _142, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _128, _150);
    float _246 = fma(_240, _128, _148);
    float _248 = fma(_242, _128, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_39.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_72);
        float _274 = 1.0 / _272;
        float _276 = _106 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = in.m_39.z;
    float _282 = in.m_39.x;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _290 = _288 != 0;
    float _292 = in.m_39.y;
    float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _296 = log2(_294);
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _308 = _306 != 0;
    float _310 = _280 * 2.0;
    float _312 = _282 * 2.0;
    float _314 = floor(_310);
    float _316 = _292 * 2.0;
    float _318 = floor(_312);
    bool _320 = _314 >= 0.0;
    bool _322 = isnan(_314);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = _292 + _280;
    bool _332 = _314 > 0.0;
    float _334 = _282 + _292;
    int _336 = _328 ? 0 : 1;
    float _338 = _330 + (-1.0);
    float _340 = floor(_316);
    float _342 = _334 + (-1.0);
    bool _344 = _318 >= 0.0;
    bool _346 = isnan(_318);
    bool _348 = _344 || _346;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _356 = _296 * _106;
    bool _358 = !_300;
    int _360 = _358 ? 0 : 1;
    float _362 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _364 = _352 ? 0 : 1;
    bool _366 = _318 > 0.0;
    float _368 = exp2(_356);
    int _370 = ~_336;
    int _372 = _370 + 1;
    int _374 = _372 + 1;
    int _376 = _374;
    if (!_332)
    {
        int _378 = ~_336;
        int _380 = _378 + 1;
        _376 = _380;
    }
    int _382 = _376;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    bool _388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(1.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    int _398 = abs(_360);
    float _400 = 1.0 / _386;
    float _402 = in.m_41.x;
    float _404 = in.m_41.y;
    float _406 = in.m_41.z;
    int _408 = ~_364;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    int _414 = _412;
    if (!_366)
    {
        int _416 = ~_364;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = -_368;
    float _424 = _422 + 1.0;
    bool _426 = !_304;
    int _428 = _426 ? 0 : 1;
    bool _430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = float(_398);
    float _442 = float(_382);
    int _444 = abs(_428);
    bool _446 = _340 > 0.0;
    float _448 = _440 * _442;
    float _450 = _438 ? _424 : 0.0;
    float _452 = float(_444);
    float _454 = float(_420);
    if (_396)
    {
        float _456 = _450 * _400;
        _108 = _456;
    }
    float _458 = _108;
    bool _460 = _340 >= 0.0;
    bool _462 = isnan(_340);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = _448 * (-2.0);
    bool _472 = !_308;
    int _474 = _472 ? 0 : 1;
    float _476 = _452 * _454;
    int _478 = _468 ? 0 : 1;
    float _480 = fma(_362, _470, _362);
    int _482 = abs(_474);
    float _484 = fma(_470, _402, _402);
    float _486 = _282 + (-0.5);
    int _488 = ~_478;
    int _490 = _488 + 1;
    int _492 = _490 + 1;
    float _494 = _476 * (-2.0);
    int _496 = _492;
    if (!_446)
    {
        int _498 = ~_478;
        int _500 = _498 + 1;
        _496 = _500;
    }
    int _502 = _496;
    float _504 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[196].x, _484);
    bool _506 = _292 > 0.5;
    float _508 = _292 + (-0.5);
    float _510 = fma(_494, _404, _404);
    float _512 = float(_482);
    float _514 = fma(_480, _458, _504);
    float _516 = float(_502);
    float _518 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[196].y, _510);
    float _520 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _522 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _524 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _526 = _512 * _516;
    float _528 = in.m_37.x;
    float _530 = in.m_37.y;
    float _532 = in.m_37.z;
    float _534 = fma(_354, _494, _354);
    float _536 = _282 + _280;
    float _538 = _526 * (-2.0);
    float _540 = in.m_43.x;
    float _542 = in.m_43.y;
    float _544 = in.m_43.z;
    float _546 = _514 * 0.15915493667125701904296875;
    float _548 = _536 + (-1.0);
    float _550 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
    float _552 = fma(_534, _458, _518);
    float _554 = fma(_538, _406, _406);
    float _556 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _558 = _280 + (-0.5);
    float _560 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _522);
    float _562 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _524);
    float _564 = fma(_556, _538, _556);
    float _566 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[196].z, _554);
    float _568 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
    float _570 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    float _572 = _552 * 0.15915493667125701904296875;
    float _574 = fma(_564, _458, _566);
    float _576 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _562);
    float _578 = _546 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _528 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _584 = _568 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _586 = _574 * 0.15915493667125701904296875;
    float _588 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _540);
    float _592 = _530 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _594 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _542);
    float _596 = _570 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _598 = _584 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _600 = _546 * 6.283185482025146484375;
    float _602 = cos(_600);
    float _604 = _584 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _606 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[9].x, _598);
    float _610 = _532 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _612 = fma(_596, (*spvDescriptorSet0.vp_c8)._m0[8].x, _604);
    float _614 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[9].z, _608);
    float _616 = _572 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _544);
    float _622 = fma(_588, (*spvDescriptorSet0.vp_c8)._m0[8].z, _612);
    float _624 = _614 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _626 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _628 = _606 * _590;
    float _630 = _622 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _632 = _624 * _624;
    float _634 = _572 * 6.283185482025146484375;
    float _636 = cos(_634);
    float _638 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _640 = _626 * _594;
    float _642 = fma(_630, _630, _632);
    bool _644 = _282 > 0.5;
    bool _646 = _644 && _286;
    float _648 = _638 * _620;
    float _650 = _586 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = _602 * _618;
    float _656 = _586 * 6.283185482025146484375;
    float _658 = cos(_656);
    float _660 = _580 * _636;
    float _662 = _602 * _636;
    float _664 = -_654;
    float _666 = fma(_652, _660, _664);
    float _668 = -_660;
    float _670 = fma(_652, _654, _668);
    float _672 = _580 * _618;
    float _674 = sqrt(_642);
    float _676 = fma(_652, _662, _672);
    float _678 = fma(_652, _672, _662);
    float _680 = _658 * _640;
    float _682 = _618 * _658;
    float _684 = _636 * _658;
    float _686 = _602 * _680;
    float _688 = _580 * _680;
    float _690 = -_640;
    float _692 = _652 * _690;
    float _694 = fma(_676, _628, _686);
    float _696 = fma(_666, _628, _688);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _702 = fma(_684, _628, _692);
    float _704 = fma(_670, _648, _694);
    float _706 = fma(_678, _648, _696);
    float _708 = 1.0 / _700;
    float _710 = fma(_682, _648, _702);
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _714 = _704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _716 = _704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _718 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _712);
    float _720 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _714);
    float _722 = _674 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[26].z, _718);
    float _728 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[24].z, _720);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _730;
    float _734 = in.m_45.x;
    float _736 = _726 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _738 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _740 = isnan(_278);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _728 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _752 = _732 * _708;
    float _754 = fma(_736, _724, _588);
    bool _756 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _758 = isnan(_278);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -_748;
    float _770 = _768 + 1.0;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _774 = fma(_750, _724, _596);
    float _776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _778 = _754 + _776;
    float _780 = _766 * _770;
    float _782 = -_766;
    float _784 = _782 + 1.0;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _788 = _774 + _786;
    float _790 = _778 * _778;
    out.m_47.w = _772;
    bool _792 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _794 = isnan(_278);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _808 = fma(_788, _788, _790);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _812 = _278 + _810;
    bool _814 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _816 = isnan(_278);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = _802 * _784;
    float _828 = -_802;
    float _830 = _828 + 1.0;
    float _832 = 1.0 / _806;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _838 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _840 = fma(_752, _812, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _846 = _824 * _830;
    float _848 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _716);
    out.m_33.x = _838;
    float _850 = sqrt(_808);
    float _852 = _840 * _846;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _856 = _278 + _854;
    float _858 = in.m_45.y;
    float _860 = -_824;
    float _862 = _860 + 1.0;
    float _864 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[25].z, _848);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _868 = _278 + _866;
    float _870 = _716;
    float _872 = _868;
    float _874 = _584;
    if (_286)
    {
        _870 = _734;
    }
    float _876 = _870;
    float _878 = 1.0 / _844;
    float _880 = _836 * _832;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[115].x, _852);
    float _884 = _864 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _886 = _876;
    float _888 = _884;
    if (_646)
    {
        float _890 = -_876;
        float _892 = _890 + 1.0;
        _886 = _892;
    }
    float _894 = _886;
    float _896 = fma(_880, _856, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _898 = _850 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _900;
    float _904 = fma(_896, _826, _882);
    float _906 = fma(_884, _724, _584);
    float _908 = _902 * _878;
    float _910 = -_858;
    float _912 = _910 + 1.0;
    float _914 = fma(_908, _868, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _916 = _858;
    float _918 = _912;
    if (!_286)
    {
        _872 = _734;
    }
    float _920 = _872;
    float _922 = _920;
    if (_286)
    {
        _922 = _894;
    }
    float _924 = _922;
    float _926 = fma(_914, _780, _904);
    if (_290)
    {
        float _928 = _506 ? _912 : _858;
        _916 = _928;
    }
    float _930 = _916;
    if (!_898)
    {
        _888 = _774;
    }
    float _932 = _888;
    float _934 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[118].x, _926);
    float _936 = _932;
    if (!_898)
    {
        _874 = _754;
    }
    float _938 = _874;
    float _940 = _938;
    if (!_898)
    {
        _918 = _906;
    }
    float _942 = _918;
    bool _944 = !_898;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _850 + _950;
        float _954 = rsqrt(_808);
        float _956 = _952 * _948;
        float _958 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_906, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_788, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_778, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _994 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _996 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    float _1002 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _996);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1000);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1016 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1004);
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1020 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1030 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1034 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1024);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1028);
    float _1038 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1030);
    float _1040 = _930 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1042 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1046 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1048 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1050 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1038);
    float _1052 = _1040 * _1008;
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1044);
    float _1056 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1046);
    float _1058 = _924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1060 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1062 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1064 = _1054 + _1056;
    float _1066 = _1056 * 0.5;
    float _1068 = _1058 * _1026;
    float _1070 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1050);
    float _1072 = _1064 * 0.5;
    float _1074 = fma(_1060, -0.5, _1066);
    out.m_49.w = _1062;
    out.m_51.x = _1068;
    out.m_51.y = _1052;
    out.gl_Position.x = _1054;
    out.gl_Position.y = _1060;
    out.gl_Position.z = _1070;
    out.gl_Position.w = _1056;
    out.m_53.w = _1056;
    out.m_53.x = _1072;
    out.m_53.y = _1074;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

