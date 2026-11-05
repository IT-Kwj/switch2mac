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
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_35 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
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
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1157 = as_type<float>(_84);
        out.gl_Position.z = _1157;
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
    float _104 = 0.0;
    float _106 = _102;
    if (_98)
    {
        float _108 = float(_68);
        _104 = _108;
    }
    float _110 = _104;
    bool _112 = _102 >= _110;
    bool _114 = !_98;
    bool _116 = _112 || _114;
    if (_116)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _78;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1226 = as_type<float>(_122);
        out.gl_Position.z = _1226;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _126 = !_124;
    float _144;
    if (!_126)
    {
        float _128 = in.m_33.x;
        float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _132 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _134 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _136 = _134 * _130;
        float _138 = floor(_136);
        float _140 = -_138;
        float _142 = _136 + _140;
        _144 = _142;
        _146 = true;
    }
    else
    {
        float _148 = float(_68);
        float _150 = 1.0 / _148;
        float _152 = _102 * _150;
        _144 = _152;
    }
    _146 = false;
    float _154 = _144;
    float _156 = in.m_33.x;
    float _158 = in.m_33.y;
    float _160 = in.m_33.z;
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _164 = _154 + _162;
    float _166 = in.m_26.x;
    float _168 = in.m_26.y;
    float _170 = in.m_26.z;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _172;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _178 = _176 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _180;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = 1.0 / _174;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _204 = 1.0 + _202;
    float _206 = 1.0 / _178;
    float _208 = _156 * 2.0;
    float _210 = _158 + _156;
    float _212 = _158 + _160;
    float _214 = 1.0 / _182;
    float _216 = _158 + (-0.5);
    float _218 = _158 * 2.0;
    float _220 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _156);
    float _222 = _160 + _156;
    float _224 = _156 + (-0.5);
    float _226 = _160 * 2.0;
    float _228 = _210 + (-1.0);
    float _230 = 1.0 / _200;
    float _232 = fma(_158, 3.0, 1.0);
    float _234 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _236 = _226 > 1.0;
    float _238 = _160 + (-0.5);
    bool _240 = _226 >= 1.0;
    bool _242 = isnan(_226);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.0);
    bool _248 = _244 || _246;
    float _250 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _234);
    float _252 = _220 * _232;
    float _254 = floor(_208);
    float _256 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _258 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _262 = _154 + _260;
    float _264 = _212 + (-1.0);
    float _266 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _256);
    float _268 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _258);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _154 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _154 + _274;
    float _278 = floor(_226);
    float _280 = _262 * _230;
    float _282 = _272 * _196;
    float _284 = _276 * _206;
    float _286 = _164 * _214;
    int _288 = _248 ? 0 : 1;
    float _290 = _222 + (-1.0);
    bool _292 = _254 > 0.0;
    float _294 = floor(_218);
    bool _296 = _254 >= 0.0;
    bool _298 = isnan(_254);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _308 = ~_288;
    int _310 = _308 + 1;
    int _312 = _310 + 1;
    float _314 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _250);
    int _316 = _312;
    if (!_236)
    {
        int _318 = ~_288;
        int _320 = _318 + 1;
        _316 = _320;
    }
    int _322 = _316;
    float _324 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _326 = _304 ? 0 : 1;
    float _328 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _330 = log2(_328);
    float _332 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _268);
    int _334 = ~_326;
    int _336 = _334 + 1;
    int _338 = _336 + 1;
    float _340 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _342 = _278 > 0.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    bool _348 = _278 >= 0.0;
    bool _350 = isnan(_278);
    bool _352 = _348 || _350;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _362 = _338;
    if (!_292)
    {
        int _364 = ~_326;
        int _366 = _364 + 1;
        _362 = _366;
    }
    int _368 = _362;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _370;
    float _374 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _376 = fma(_372, _286, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _378 = _294 > 0.0;
    float _380 = _330 * _102;
    bool _382 = _294 >= 0.0;
    bool _384 = isnan(_294);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = exp2(_380);
    bool _402 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _404 = isnan(_154);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _414;
    float _418 = float(_322);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    bool _424 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _426 = isnan(_154);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_412;
    float _438 = _436 + 1.0;
    float _440 = fma(_346, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _252 * _418;
    float _444 = _442 * 2.0;
    float _446 = fma(_394, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_398, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _458 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _460 = isnan(_154);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_434;
    float _472 = _470 + 1.0;
    float _474 = fma(_416, _286, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_422, _286, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = _434 * _438;
    float _480 = fma(_360, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _482 = fma(_452, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _484 = fma(_456, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _486 = _390 ? 0 : 1;
    float _488 = 1.0 / _204;
    float _490 = in.m_35.x;
    float _492 = in.m_35.y;
    float _494 = in.m_35.z;
    bool _496 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _498 = isnan(_154);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = _468 * _472;
    bool _510 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _512 = isnan(1.0);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _518 = _514 || _516;
    float _520 = -_468;
    float _522 = _520 + 1.0;
    bool _524 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _526 = isnan(_154);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _444 * 0.15915493667125701904296875;
    float _538 = in.m_37.x;
    float _540 = in.m_37.y;
    float _542 = in.m_37.z;
    bool _544 = !_194;
    int _546 = _544 ? 0 : 1;
    bool _548 = !_190;
    int _550 = _548 ? 0 : 1;
    float _552 = _536 * 6.283185482025146484375;
    float _554 = cos(_552);
    int _556 = abs(_546);
    float _558 = _534 * _522;
    int _560 = ~_486;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = -_400;
    float _568 = _566 + 1.0;
    int _570 = _564;
    if (!_378)
    {
        int _572 = ~_486;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = -_534;
    float _580 = _578 + 1.0;
    float _582 = _536 * 6.283185482025146484375;
    float _584 = sin(_582);
    int _586 = abs(_550);
    float _588 = float(_556);
    float _590 = float(_586);
    float _592 = float(_368);
    float _594 = float(_576);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = _590 * _592;
    float _608 = _554 * _492;
    float _610 = _588 * _594;
    float _612 = _604 ? _568 : 0.0;
    float _614 = _606 * (-2.0);
    float _616 = fma(_584, _490, _608);
    float _618 = _610 * (-2.0);
    float _620 = fma(_614, _540, _540);
    if (_518)
    {
        float _622 = _612 * _488;
        _106 = _622;
    }
    float _624 = _106;
    float _626 = fma(_618, _542, _542);
    float _628 = _444 + _616;
    float _630 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[196].y, _620);
    float _632 = _506 * _580;
    float _634 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[196].z, _626);
    bool _636 = !_186;
    int _638 = _636 ? 0 : 1;
    float _640 = fma(_340, _618, _340);
    int _642 = _356 ? 0 : 1;
    float _644 = fma(_324, _614, _324);
    int _646 = abs(_638);
    float _648 = _628 * 0.15915493667125701904296875;
    float _650 = fma(_640, _624, _634);
    float _652 = _440 * _632;
    int _654 = ~_642;
    int _656 = _654 + 1;
    int _658 = _656 + 1;
    float _660 = -_506;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    int _668 = _658;
    if (!_342)
    {
        int _670 = ~_642;
        int _672 = _670 + 1;
        _668 = _672;
    }
    int _674 = _668;
    float _676 = _446 * _632;
    float _678 = _448 * _632;
    float _680 = _650 * 0.15915493667125701904296875;
    float _682 = _648 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _696 = float(_646);
    float _698 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].y, _676);
    float _700 = float(_674);
    float _702 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].z, _678);
    float _704 = fma(_690, _280, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _706 = fma(_694, _280, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _708 = fma(_666, _280, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _710 = fma(_480, _558, _686);
    float _712 = fma(_482, _558, _698);
    float _714 = _696 * _700;
    float _716 = in.m_39.x;
    float _718 = in.m_39.y;
    float _720 = in.m_39.z;
    float _722 = fma(_484, _558, _702);
    float _724 = _684 * 0.15915493667125701904296875;
    float _726 = _714 * (-2.0);
    float _728 = in.m_41.x;
    float _730 = in.m_41.y;
    float _732 = in.m_41.z;
    float _734 = fma(_474, _508, _710);
    float _736 = fma(_376, _508, _712);
    float _738 = fma(_726, _538, _538);
    float _740 = fma(_306, _726, _306);
    float _742 = _724 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = fma(_476, _508, _722);
    float _748 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    float _750 = fma(_644, _624, _630);
    float _752 = fma(_704, _478, _734);
    float _754 = fma(_706, _478, _736);
    float _756 = fma(_740, _624, _748);
    float _758 = _584 * _492;
    float _760 = fma(_708, _478, _746);
    float _762 = _724 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].x, _752);
    float _768 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].y, _754);
    float _770 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].z, _760);
    float _772 = _756 * 0.15915493667125701904296875;
    float _774 = -_758;
    float _776 = fma(_554, _490, _774);
    float _778 = _584 * _718;
    float _780 = _554 * _718;
    float _782 = _750 * 0.15915493667125701904296875;
    float _784 = _766 * _728;
    float _786 = -_778;
    float _788 = fma(_554, _716, _786);
    float _790 = fma(_584, _716, _780);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _796 = _744 * _494;
    float _798 = _782 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _764 * _494;
    float _804 = _794 * _792;
    float _806 = -_796;
    float _808 = fma(_616, _764, _806);
    float _810 = _768 * _730;
    float _812 = fma(_616, _744, _802);
    float _814 = _770 * _732;
    float _816 = _782 * 6.283185482025146484375;
    float _818 = cos(_816);
    bool _820 = _808 != 0.0;
    bool _822 = isnan(_808);
    bool _824 = _820 || _822;
    bool _826 = isnan(0.0);
    bool _828 = _824 || _826;
    float _830 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _834 = _776 == 0.0;
    bool _836 = !_828;
    bool _838 = _834 && _836;
    float _840 = _680 * 6.283185482025146484375;
    float _842 = sin(_840);
    bool _844 = _812 == 0.0;
    bool _846 = _844 && _838;
    float _848 = _680 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _788;
    if (!_846)
    {
        float _854 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _788);
        _852 = _854;
    }
    float _856 = _852;
    float _858 = _772 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = _800 * _842;
    float _864 = _818 * _842;
    float _866 = _772 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _818 * _850;
    float _872 = _800 * _850;
    float _874 = _860 * _800;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _808);
    float _878 = _860 * _850;
    float _880 = _860 * _842;
    float _882 = _860 * _818;
    float _884 = _830 * _876;
    float _886 = fma(_868, _862, _870);
    float _888 = fma(_868, _870, _862);
    float _890 = -_872;
    float _892 = fma(_868, _864, _890);
    float _894 = -_864;
    float _896 = fma(_868, _872, _894);
    float _898 = _744 * _720;
    float _900 = _764 * _720;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _904 = _878 * _884;
    float _906 = -_898;
    float _908 = fma(_764, _790, _906);
    float _910 = _896 * _884;
    float _912 = _832 * _902;
    float _914 = fma(_880, _804, _904);
    float _916 = _908;
    if (!_846)
    {
        float _918 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _908);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _888 * _884;
    float _924 = fma(_886, _804, _910);
    float _926 = -_868;
    float _928 = fma(_926, _912, _914);
    float _930 = _896 * _920;
    float _932 = _878 * _920;
    float _934 = fma(_744, _790, _900);
    float _936 = fma(_892, _804, _922);
    float _938 = _888 * _920;
    float _940 = fma(_886, _856, _930);
    float _942 = fma(_874, _912, _924);
    float _944 = _928 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = _934;
    if (!_846)
    {
        float _948 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _934);
        _946 = _948;
    }
    float _950 = _946;
    float _952 = fma(_892, _856, _938);
    float _954 = _928 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_882, _912, _936);
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[9].x, _944);
    float _960 = fma(_880, _856, _932);
    float _962 = _928 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _964 = fma(_874, _950, _940);
    float _966 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _968 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].z, _958);
    float _970 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _972 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[10].x, _962);
    float _974 = -_868;
    float _976 = fma(_974, _950, _960);
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].z, _966);
    float _980 = _374 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _982 = _970 + _968;
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].z, _972);
    float _986 = _332 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _988 = _980 + _978;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = _976 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _994 = _986 + _984;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = _976 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1002 = _976 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1004 = _982 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].x, _996);
    float _1008 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1010 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1004);
    float _1014 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1006);
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1018 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1000);
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1002);
    float _1022 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1012);
    float _1024 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1032 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1026);
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1028);
    float _1040 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1030);
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1032);
    float _1044 = _982 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = fma(_882, _950, _952);
    float _1048 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1036);
    float _1050 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1038);
    float _1052 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1040);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1042);
    float _1056 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1044);
    float _1058 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1010);
    float _1060 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1062 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1020);
    float _1064 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1056);
    out.m_43.x = _988;
    out.m_43.y = _982;
    out.m_43.z = _994;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1068 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1050);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1048);
    float _1098 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1052);
    float _1100 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1054);
    out.m_45.x = _1084;
    out.m_45.y = _1086;
    out.m_45.z = _1088;
    out.m_45.w = _1082;
    out.m_47.x = _1090;
    out.m_47.y = _1092;
    out.m_47.z = _1094;
    out.m_49.x = _1058;
    out.m_49.y = _1060;
    out.m_49.z = _1062;
    out.gl_Position.x = _1096;
    out.gl_Position.y = _1080;
    out.gl_Position.z = _1098;
    out.gl_Position.w = _1100;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
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
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1157 = as_type<float>(_84);
        out.gl_Position.z = _1157;
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
    float _104 = 0.0;
    float _106 = _102;
    if (_98)
    {
        float _108 = float(_68);
        _104 = _108;
    }
    float _110 = _104;
    bool _112 = _102 >= _110;
    bool _114 = !_98;
    bool _116 = _112 || _114;
    if (_116)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _78;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1226 = as_type<float>(_122);
        out.gl_Position.z = _1226;
    }
    if (_116)
    {
        return out;
    }
    bool _124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _126 = !_124;
    float _144;
    if (!_126)
    {
        float _128 = in.m_33.x;
        float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _132 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _134 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _136 = _134 * _130;
        float _138 = floor(_136);
        float _140 = -_138;
        float _142 = _136 + _140;
        _144 = _142;
        _146 = true;
    }
    else
    {
        float _148 = float(_68);
        float _150 = 1.0 / _148;
        float _152 = _102 * _150;
        _144 = _152;
    }
    _146 = false;
    float _154 = _144;
    float _156 = in.m_33.x;
    float _158 = in.m_33.y;
    float _160 = in.m_33.z;
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _164 = _154 + _162;
    float _166 = in.m_26.x;
    float _168 = in.m_26.y;
    float _170 = in.m_26.z;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _172;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _178 = _176 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _180;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = 1.0 / _174;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _204 = 1.0 + _202;
    float _206 = 1.0 / _178;
    float _208 = _156 * 2.0;
    float _210 = _158 + _156;
    float _212 = _158 + _160;
    float _214 = 1.0 / _182;
    float _216 = _158 + (-0.5);
    float _218 = _158 * 2.0;
    float _220 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _156);
    float _222 = _160 + _156;
    float _224 = _156 + (-0.5);
    float _226 = _160 * 2.0;
    float _228 = _210 + (-1.0);
    float _230 = 1.0 / _200;
    float _232 = fma(_158, 3.0, 1.0);
    float _234 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _236 = _226 > 1.0;
    float _238 = _160 + (-0.5);
    bool _240 = _226 >= 1.0;
    bool _242 = isnan(_226);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.0);
    bool _248 = _244 || _246;
    float _250 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _234);
    float _252 = _220 * _232;
    float _254 = floor(_208);
    float _256 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _258 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _262 = _154 + _260;
    float _264 = _212 + (-1.0);
    float _266 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _256);
    float _268 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _258);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _154 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _154 + _274;
    float _278 = floor(_226);
    float _280 = _262 * _230;
    float _282 = _272 * _196;
    float _284 = _276 * _206;
    float _286 = _164 * _214;
    int _288 = _248 ? 0 : 1;
    float _290 = _222 + (-1.0);
    bool _292 = _254 > 0.0;
    float _294 = floor(_218);
    bool _296 = _254 >= 0.0;
    bool _298 = isnan(_254);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _308 = ~_288;
    int _310 = _308 + 1;
    int _312 = _310 + 1;
    float _314 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _250);
    int _316 = _312;
    if (!_236)
    {
        int _318 = ~_288;
        int _320 = _318 + 1;
        _316 = _320;
    }
    int _322 = _316;
    float _324 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _326 = _304 ? 0 : 1;
    float _328 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _330 = log2(_328);
    float _332 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _268);
    int _334 = ~_326;
    int _336 = _334 + 1;
    int _338 = _336 + 1;
    float _340 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _342 = _278 > 0.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    bool _348 = _278 >= 0.0;
    bool _350 = isnan(_278);
    bool _352 = _348 || _350;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _362 = _338;
    if (!_292)
    {
        int _364 = ~_326;
        int _366 = _364 + 1;
        _362 = _366;
    }
    int _368 = _362;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _370;
    float _374 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _376 = fma(_372, _286, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _378 = _294 > 0.0;
    float _380 = _330 * _102;
    bool _382 = _294 >= 0.0;
    bool _384 = isnan(_294);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = exp2(_380);
    bool _402 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _404 = isnan(_154);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _414;
    float _418 = float(_322);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    bool _424 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _426 = isnan(_154);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_412;
    float _438 = _436 + 1.0;
    float _440 = fma(_346, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _252 * _418;
    float _444 = _442 * 2.0;
    float _446 = fma(_394, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_398, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _458 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _460 = isnan(_154);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_434;
    float _472 = _470 + 1.0;
    float _474 = fma(_416, _286, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_422, _286, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = _434 * _438;
    float _480 = fma(_360, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _482 = fma(_452, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _484 = fma(_456, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _486 = _390 ? 0 : 1;
    float _488 = 1.0 / _204;
    float _490 = in.m_35.x;
    float _492 = in.m_35.y;
    float _494 = in.m_35.z;
    bool _496 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _498 = isnan(_154);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = _468 * _472;
    bool _510 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _512 = isnan(1.0);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _518 = _514 || _516;
    float _520 = -_468;
    float _522 = _520 + 1.0;
    bool _524 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _526 = isnan(_154);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _444 * 0.15915493667125701904296875;
    float _538 = in.m_37.x;
    float _540 = in.m_37.y;
    float _542 = in.m_37.z;
    bool _544 = !_194;
    int _546 = _544 ? 0 : 1;
    bool _548 = !_190;
    int _550 = _548 ? 0 : 1;
    float _552 = _536 * 6.283185482025146484375;
    float _554 = cos(_552);
    int _556 = abs(_546);
    float _558 = _534 * _522;
    int _560 = ~_486;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = -_400;
    float _568 = _566 + 1.0;
    int _570 = _564;
    if (!_378)
    {
        int _572 = ~_486;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = -_534;
    float _580 = _578 + 1.0;
    float _582 = _536 * 6.283185482025146484375;
    float _584 = sin(_582);
    int _586 = abs(_550);
    float _588 = float(_556);
    float _590 = float(_586);
    float _592 = float(_368);
    float _594 = float(_576);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = _590 * _592;
    float _608 = _554 * _492;
    float _610 = _588 * _594;
    float _612 = _604 ? _568 : 0.0;
    float _614 = _606 * (-2.0);
    float _616 = fma(_584, _490, _608);
    float _618 = _610 * (-2.0);
    float _620 = fma(_614, _540, _540);
    if (_518)
    {
        float _622 = _612 * _488;
        _106 = _622;
    }
    float _624 = _106;
    float _626 = fma(_618, _542, _542);
    float _628 = _444 + _616;
    float _630 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[196].y, _620);
    float _632 = _506 * _580;
    float _634 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[196].z, _626);
    bool _636 = !_186;
    int _638 = _636 ? 0 : 1;
    float _640 = fma(_340, _618, _340);
    int _642 = _356 ? 0 : 1;
    float _644 = fma(_324, _614, _324);
    int _646 = abs(_638);
    float _648 = _628 * 0.15915493667125701904296875;
    float _650 = fma(_640, _624, _634);
    float _652 = _440 * _632;
    int _654 = ~_642;
    int _656 = _654 + 1;
    int _658 = _656 + 1;
    float _660 = -_506;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    int _668 = _658;
    if (!_342)
    {
        int _670 = ~_642;
        int _672 = _670 + 1;
        _668 = _672;
    }
    int _674 = _668;
    float _676 = _446 * _632;
    float _678 = _448 * _632;
    float _680 = _650 * 0.15915493667125701904296875;
    float _682 = _648 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _696 = float(_646);
    float _698 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].y, _676);
    float _700 = float(_674);
    float _702 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].z, _678);
    float _704 = fma(_690, _280, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _706 = fma(_694, _280, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _708 = fma(_666, _280, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _710 = fma(_480, _558, _686);
    float _712 = fma(_482, _558, _698);
    float _714 = _696 * _700;
    float _716 = in.m_39.x;
    float _718 = in.m_39.y;
    float _720 = in.m_39.z;
    float _722 = fma(_484, _558, _702);
    float _724 = _684 * 0.15915493667125701904296875;
    float _726 = _714 * (-2.0);
    float _728 = in.m_41.x;
    float _730 = in.m_41.y;
    float _732 = in.m_41.z;
    float _734 = fma(_474, _508, _710);
    float _736 = fma(_376, _508, _712);
    float _738 = fma(_726, _538, _538);
    float _740 = fma(_306, _726, _306);
    float _742 = _724 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = fma(_476, _508, _722);
    float _748 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    float _750 = fma(_644, _624, _630);
    float _752 = fma(_704, _478, _734);
    float _754 = fma(_706, _478, _736);
    float _756 = fma(_740, _624, _748);
    float _758 = _584 * _492;
    float _760 = fma(_708, _478, _746);
    float _762 = _724 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].x, _752);
    float _768 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].y, _754);
    float _770 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].z, _760);
    float _772 = _756 * 0.15915493667125701904296875;
    float _774 = -_758;
    float _776 = fma(_554, _490, _774);
    float _778 = _584 * _718;
    float _780 = _554 * _718;
    float _782 = _750 * 0.15915493667125701904296875;
    float _784 = _766 * _728;
    float _786 = -_778;
    float _788 = fma(_554, _716, _786);
    float _790 = fma(_584, _716, _780);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _796 = _744 * _494;
    float _798 = _782 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _764 * _494;
    float _804 = _794 * _792;
    float _806 = -_796;
    float _808 = fma(_616, _764, _806);
    float _810 = _768 * _730;
    float _812 = fma(_616, _744, _802);
    float _814 = _770 * _732;
    float _816 = _782 * 6.283185482025146484375;
    float _818 = cos(_816);
    bool _820 = _808 != 0.0;
    bool _822 = isnan(_808);
    bool _824 = _820 || _822;
    bool _826 = isnan(0.0);
    bool _828 = _824 || _826;
    float _830 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _834 = _776 == 0.0;
    bool _836 = !_828;
    bool _838 = _834 && _836;
    float _840 = _680 * 6.283185482025146484375;
    float _842 = sin(_840);
    bool _844 = _812 == 0.0;
    bool _846 = _844 && _838;
    float _848 = _680 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _788;
    if (!_846)
    {
        float _854 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _788);
        _852 = _854;
    }
    float _856 = _852;
    float _858 = _772 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = _800 * _842;
    float _864 = _818 * _842;
    float _866 = _772 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _818 * _850;
    float _872 = _800 * _850;
    float _874 = _860 * _800;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _808);
    float _878 = _860 * _850;
    float _880 = _860 * _842;
    float _882 = _860 * _818;
    float _884 = _830 * _876;
    float _886 = fma(_868, _862, _870);
    float _888 = fma(_868, _870, _862);
    float _890 = -_872;
    float _892 = fma(_868, _864, _890);
    float _894 = -_864;
    float _896 = fma(_868, _872, _894);
    float _898 = _744 * _720;
    float _900 = _764 * _720;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _904 = _878 * _884;
    float _906 = -_898;
    float _908 = fma(_764, _790, _906);
    float _910 = _896 * _884;
    float _912 = _832 * _902;
    float _914 = fma(_880, _804, _904);
    float _916 = _908;
    if (!_846)
    {
        float _918 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _908);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _888 * _884;
    float _924 = fma(_886, _804, _910);
    float _926 = -_868;
    float _928 = fma(_926, _912, _914);
    float _930 = _896 * _920;
    float _932 = _878 * _920;
    float _934 = fma(_744, _790, _900);
    float _936 = fma(_892, _804, _922);
    float _938 = _888 * _920;
    float _940 = fma(_886, _856, _930);
    float _942 = fma(_874, _912, _924);
    float _944 = _928 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = _934;
    if (!_846)
    {
        float _948 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _934);
        _946 = _948;
    }
    float _950 = _946;
    float _952 = fma(_892, _856, _938);
    float _954 = _928 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_882, _912, _936);
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[9].x, _944);
    float _960 = fma(_880, _856, _932);
    float _962 = _928 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _964 = fma(_874, _950, _940);
    float _966 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _968 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].z, _958);
    float _970 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _972 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[10].x, _962);
    float _974 = -_868;
    float _976 = fma(_974, _950, _960);
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].z, _966);
    float _980 = _374 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _982 = _970 + _968;
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].z, _972);
    float _986 = _332 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _988 = _980 + _978;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = _976 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _994 = _986 + _984;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = _976 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1002 = _976 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1004 = _982 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].x, _996);
    float _1008 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1010 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1004);
    float _1014 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1006);
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1018 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1000);
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1002);
    float _1022 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1012);
    float _1024 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1032 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1026);
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1028);
    float _1040 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1030);
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1032);
    float _1044 = _982 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = fma(_882, _950, _952);
    float _1048 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1036);
    float _1050 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1038);
    float _1052 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1040);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1042);
    float _1056 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1044);
    float _1058 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1010);
    float _1060 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1062 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1020);
    float _1064 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1056);
    out.m_43.x = _988;
    out.m_43.y = _982;
    out.m_43.z = _994;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1068 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1050);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1048);
    float _1098 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1052);
    float _1100 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1054);
    out.m_45.x = _1084;
    out.m_45.y = _1086;
    out.m_45.z = _1088;
    out.m_45.w = _1082;
    out.m_47.x = _1090;
    out.m_47.y = _1092;
    out.m_47.z = _1094;
    out.m_49.x = _1058;
    out.m_49.y = _1060;
    out.m_49.z = _1062;
    out.gl_Position.x = _1096;
    out.gl_Position.y = _1080;
    out.gl_Position.z = _1098;
    out.gl_Position.w = _1100;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
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
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1157 = as_type<float>(_84);
        out.gl_Position.z = _1157;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    float _106 = _102;
    if (_98)
    {
        float _108 = float(_68);
        _104 = _108;
    }
    float _110 = _104;
    bool _112 = _102 >= _110;
    bool _114 = !_98;
    bool _116 = _112 || _114;
    if (_116)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _78;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _120 = _118 * 5.0;
        _86 = as_type<int>(_120);
    }
    int _122 = _86;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1226 = as_type<float>(_122);
        out.gl_Position.z = _1226;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _126 = !_124;
    float _144;
    if (!_126)
    {
        float _128 = in.m_33.x;
        float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _132 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _134 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _136 = _134 * _130;
        float _138 = floor(_136);
        float _140 = -_138;
        float _142 = _136 + _140;
        _144 = _142;
        _146 = true;
    }
    else
    {
        float _148 = float(_68);
        float _150 = 1.0 / _148;
        float _152 = _102 * _150;
        _144 = _152;
    }
    _146 = false;
    float _154 = _144;
    float _156 = in.m_33.x;
    float _158 = in.m_33.y;
    float _160 = in.m_33.z;
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _164 = _154 + _162;
    float _166 = in.m_26.x;
    float _168 = in.m_26.y;
    float _170 = in.m_26.z;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _172;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _178 = _176 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _180;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = 1.0 / _174;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _204 = 1.0 + _202;
    float _206 = 1.0 / _178;
    float _208 = _156 * 2.0;
    float _210 = _158 + _156;
    float _212 = _158 + _160;
    float _214 = 1.0 / _182;
    float _216 = _158 + (-0.5);
    float _218 = _158 * 2.0;
    float _220 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _156);
    float _222 = _160 + _156;
    float _224 = _156 + (-0.5);
    float _226 = _160 * 2.0;
    float _228 = _210 + (-1.0);
    float _230 = 1.0 / _200;
    float _232 = fma(_158, 3.0, 1.0);
    float _234 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _236 = _226 > 1.0;
    float _238 = _160 + (-0.5);
    bool _240 = _226 >= 1.0;
    bool _242 = isnan(_226);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.0);
    bool _248 = _244 || _246;
    float _250 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _234);
    float _252 = _220 * _232;
    float _254 = floor(_208);
    float _256 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _258 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _262 = _154 + _260;
    float _264 = _212 + (-1.0);
    float _266 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _256);
    float _268 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _258);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _154 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _154 + _274;
    float _278 = floor(_226);
    float _280 = _262 * _230;
    float _282 = _272 * _196;
    float _284 = _276 * _206;
    float _286 = _164 * _214;
    int _288 = _248 ? 0 : 1;
    float _290 = _222 + (-1.0);
    bool _292 = _254 > 0.0;
    float _294 = floor(_218);
    bool _296 = _254 >= 0.0;
    bool _298 = isnan(_254);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _308 = ~_288;
    int _310 = _308 + 1;
    int _312 = _310 + 1;
    float _314 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _250);
    int _316 = _312;
    if (!_236)
    {
        int _318 = ~_288;
        int _320 = _318 + 1;
        _316 = _320;
    }
    int _322 = _316;
    float _324 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _326 = _304 ? 0 : 1;
    float _328 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _330 = log2(_328);
    float _332 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _268);
    int _334 = ~_326;
    int _336 = _334 + 1;
    int _338 = _336 + 1;
    float _340 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _342 = _278 > 0.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    bool _348 = _278 >= 0.0;
    bool _350 = isnan(_278);
    bool _352 = _348 || _350;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _362 = _338;
    if (!_292)
    {
        int _364 = ~_326;
        int _366 = _364 + 1;
        _362 = _366;
    }
    int _368 = _362;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _370;
    float _374 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _266);
    float _376 = fma(_372, _286, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _378 = _294 > 0.0;
    float _380 = _330 * _102;
    bool _382 = _294 >= 0.0;
    bool _384 = isnan(_294);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = exp2(_380);
    bool _402 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _404 = isnan(_154);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _414;
    float _418 = float(_322);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    bool _424 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _426 = isnan(_154);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_412;
    float _438 = _436 + 1.0;
    float _440 = fma(_346, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _252 * _418;
    float _444 = _442 * 2.0;
    float _446 = fma(_394, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_398, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _458 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _460 = isnan(_154);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_434;
    float _472 = _470 + 1.0;
    float _474 = fma(_416, _286, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _476 = fma(_422, _286, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = _434 * _438;
    float _480 = fma(_360, _284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _482 = fma(_452, _284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _484 = fma(_456, _284, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _486 = _390 ? 0 : 1;
    float _488 = 1.0 / _204;
    float _490 = in.m_35.x;
    float _492 = in.m_35.y;
    float _494 = in.m_35.z;
    bool _496 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _498 = isnan(_154);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = _468 * _472;
    bool _510 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _512 = isnan(1.0);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _518 = _514 || _516;
    float _520 = -_468;
    float _522 = _520 + 1.0;
    bool _524 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _526 = isnan(_154);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _444 * 0.15915493667125701904296875;
    float _538 = in.m_37.x;
    float _540 = in.m_37.y;
    float _542 = in.m_37.z;
    bool _544 = !_194;
    int _546 = _544 ? 0 : 1;
    bool _548 = !_190;
    int _550 = _548 ? 0 : 1;
    float _552 = _536 * 6.283185482025146484375;
    float _554 = cos(_552);
    int _556 = abs(_546);
    float _558 = _534 * _522;
    int _560 = ~_486;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = -_400;
    float _568 = _566 + 1.0;
    int _570 = _564;
    if (!_378)
    {
        int _572 = ~_486;
        int _574 = _572 + 1;
        _570 = _574;
    }
    int _576 = _570;
    float _578 = -_534;
    float _580 = _578 + 1.0;
    float _582 = _536 * 6.283185482025146484375;
    float _584 = sin(_582);
    int _586 = abs(_550);
    float _588 = float(_556);
    float _590 = float(_586);
    float _592 = float(_368);
    float _594 = float(_576);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = _590 * _592;
    float _608 = _554 * _492;
    float _610 = _588 * _594;
    float _612 = _604 ? _568 : 0.0;
    float _614 = _606 * (-2.0);
    float _616 = fma(_584, _490, _608);
    float _618 = _610 * (-2.0);
    float _620 = fma(_614, _540, _540);
    if (_518)
    {
        float _622 = _612 * _488;
        _106 = _622;
    }
    float _624 = _106;
    float _626 = fma(_618, _542, _542);
    float _628 = _444 + _616;
    float _630 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[196].y, _620);
    float _632 = _506 * _580;
    float _634 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[196].z, _626);
    bool _636 = !_186;
    int _638 = _636 ? 0 : 1;
    float _640 = fma(_340, _618, _340);
    int _642 = _356 ? 0 : 1;
    float _644 = fma(_324, _614, _324);
    int _646 = abs(_638);
    float _648 = _628 * 0.15915493667125701904296875;
    float _650 = fma(_640, _624, _634);
    float _652 = _440 * _632;
    int _654 = ~_642;
    int _656 = _654 + 1;
    int _658 = _656 + 1;
    float _660 = -_506;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    int _668 = _658;
    if (!_342)
    {
        int _670 = ~_642;
        int _672 = _670 + 1;
        _668 = _672;
    }
    int _674 = _668;
    float _676 = _446 * _632;
    float _678 = _448 * _632;
    float _680 = _650 * 0.15915493667125701904296875;
    float _682 = _648 * 6.283185482025146484375;
    float _684 = sin(_682);
    float _686 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].x, _652);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _696 = float(_646);
    float _698 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].y, _676);
    float _700 = float(_674);
    float _702 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[143].z, _678);
    float _704 = fma(_690, _280, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _706 = fma(_694, _280, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _708 = fma(_666, _280, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _710 = fma(_480, _558, _686);
    float _712 = fma(_482, _558, _698);
    float _714 = _696 * _700;
    float _716 = in.m_39.x;
    float _718 = in.m_39.y;
    float _720 = in.m_39.z;
    float _722 = fma(_484, _558, _702);
    float _724 = _684 * 0.15915493667125701904296875;
    float _726 = _714 * (-2.0);
    float _728 = in.m_41.x;
    float _730 = in.m_41.y;
    float _732 = in.m_41.z;
    float _734 = fma(_474, _508, _710);
    float _736 = fma(_376, _508, _712);
    float _738 = fma(_726, _538, _538);
    float _740 = fma(_306, _726, _306);
    float _742 = _724 * 6.283185482025146484375;
    float _744 = sin(_742);
    float _746 = fma(_476, _508, _722);
    float _748 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[196].x, _738);
    float _750 = fma(_644, _624, _630);
    float _752 = fma(_704, _478, _734);
    float _754 = fma(_706, _478, _736);
    float _756 = fma(_740, _624, _748);
    float _758 = _584 * _492;
    float _760 = fma(_708, _478, _746);
    float _762 = _724 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].x, _752);
    float _768 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].y, _754);
    float _770 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[147].z, _760);
    float _772 = _756 * 0.15915493667125701904296875;
    float _774 = -_758;
    float _776 = fma(_554, _490, _774);
    float _778 = _584 * _718;
    float _780 = _554 * _718;
    float _782 = _750 * 0.15915493667125701904296875;
    float _784 = _766 * _728;
    float _786 = -_778;
    float _788 = fma(_554, _716, _786);
    float _790 = fma(_584, _716, _780);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _796 = _744 * _494;
    float _798 = _782 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _764 * _494;
    float _804 = _794 * _792;
    float _806 = -_796;
    float _808 = fma(_616, _764, _806);
    float _810 = _768 * _730;
    float _812 = fma(_616, _744, _802);
    float _814 = _770 * _732;
    float _816 = _782 * 6.283185482025146484375;
    float _818 = cos(_816);
    bool _820 = _808 != 0.0;
    bool _822 = isnan(_808);
    bool _824 = _820 || _822;
    bool _826 = isnan(0.0);
    bool _828 = _824 || _826;
    float _830 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _832 = _814 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _834 = _776 == 0.0;
    bool _836 = !_828;
    bool _838 = _834 && _836;
    float _840 = _680 * 6.283185482025146484375;
    float _842 = sin(_840);
    bool _844 = _812 == 0.0;
    bool _846 = _844 && _838;
    float _848 = _680 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _788;
    if (!_846)
    {
        float _854 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _788);
        _852 = _854;
    }
    float _856 = _852;
    float _858 = _772 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = _800 * _842;
    float _864 = _818 * _842;
    float _866 = _772 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _818 * _850;
    float _872 = _800 * _850;
    float _874 = _860 * _800;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _808);
    float _878 = _860 * _850;
    float _880 = _860 * _842;
    float _882 = _860 * _818;
    float _884 = _830 * _876;
    float _886 = fma(_868, _862, _870);
    float _888 = fma(_868, _870, _862);
    float _890 = -_872;
    float _892 = fma(_868, _864, _890);
    float _894 = -_864;
    float _896 = fma(_868, _872, _894);
    float _898 = _744 * _720;
    float _900 = _764 * _720;
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _904 = _878 * _884;
    float _906 = -_898;
    float _908 = fma(_764, _790, _906);
    float _910 = _896 * _884;
    float _912 = _832 * _902;
    float _914 = fma(_880, _804, _904);
    float _916 = _908;
    if (!_846)
    {
        float _918 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _908);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = _888 * _884;
    float _924 = fma(_886, _804, _910);
    float _926 = -_868;
    float _928 = fma(_926, _912, _914);
    float _930 = _896 * _920;
    float _932 = _878 * _920;
    float _934 = fma(_744, _790, _900);
    float _936 = fma(_892, _804, _922);
    float _938 = _888 * _920;
    float _940 = fma(_886, _856, _930);
    float _942 = fma(_874, _912, _924);
    float _944 = _928 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _946 = _934;
    if (!_846)
    {
        float _948 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _934);
        _946 = _948;
    }
    float _950 = _946;
    float _952 = fma(_892, _856, _938);
    float _954 = _928 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_882, _912, _936);
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[9].x, _944);
    float _960 = fma(_880, _856, _932);
    float _962 = _928 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _964 = fma(_874, _950, _940);
    float _966 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _968 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].z, _958);
    float _970 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _972 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[10].x, _962);
    float _974 = -_868;
    float _976 = fma(_974, _950, _960);
    float _978 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].z, _966);
    float _980 = _374 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _982 = _970 + _968;
    float _984 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].z, _972);
    float _986 = _332 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _988 = _980 + _978;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _992 = _976 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _994 = _986 + _984;
    float _996 = _982 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].x, _990);
    float _1000 = _976 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1002 = _976 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1004 = _982 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].x, _996);
    float _1008 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[1].z, _998);
    float _1010 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1012 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1004);
    float _1014 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1006);
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1018 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1000);
    float _1020 = fma(_964, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1002);
    float _1022 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1012);
    float _1024 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1032 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1026);
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1028);
    float _1040 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1030);
    float _1042 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1032);
    float _1044 = _982 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = fma(_882, _950, _952);
    float _1048 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1036);
    float _1050 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1038);
    float _1052 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1040);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1042);
    float _1056 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1044);
    float _1058 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1010);
    float _1060 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1062 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1020);
    float _1064 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1056);
    out.m_43.x = _988;
    out.m_43.y = _982;
    out.m_43.z = _994;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1068 = _1064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1080 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1050);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1084 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1048);
    float _1098 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1052);
    float _1100 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1054);
    out.m_45.x = _1084;
    out.m_45.y = _1086;
    out.m_45.z = _1088;
    out.m_45.w = _1082;
    out.m_47.x = _1090;
    out.m_47.y = _1092;
    out.m_47.z = _1094;
    out.m_49.x = _1058;
    out.m_49.y = _1060;
    out.m_49.z = _1062;
    out.gl_Position.x = _1096;
    out.gl_Position.y = _1080;
    out.gl_Position.z = _1098;
    out.gl_Position.w = _1100;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

