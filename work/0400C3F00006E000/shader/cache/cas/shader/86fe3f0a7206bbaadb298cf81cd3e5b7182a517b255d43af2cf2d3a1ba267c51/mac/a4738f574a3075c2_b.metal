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
    float4 m_33 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_72)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _996 = as_type<float>(_82);
        out.gl_Position.z = _996;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_35.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_68);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _84 = as_type<int>(_120);
    }
    int _122 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1066 = as_type<float>(_122);
        out.gl_Position.z = _1066;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _126 = !_124;
    float _144;
    if (!_126)
    {
        float _128 = in.m_37.x;
        float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _132 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _134 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
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
        float _152 = _100 * _150;
        _144 = _152;
    }
    _146 = false;
    float _154 = _144;
    float _156 = in.m_37.x;
    float _158 = in.m_37.y;
    float _160 = in.m_37.z;
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _162;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _172 = _170 != 0;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _176 = _174 != 0;
    float _178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _180 = _178 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = 1.0 / _164;
    float _184 = 1.0 / _180;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _154 + _186;
    float _190 = _160 * 2.0;
    float _192 = _156 * 2.0;
    float _194 = _158 + _160;
    float _196 = _160 + _156;
    float _198 = floor(_190);
    float _200 = _160 + (-0.5);
    float _202 = _158 + _156;
    float _204 = _156 + (-0.5);
    float _206 = _158 + (-0.5);
    float _208 = _158 * 2.0;
    float _210 = _188 * _182;
    bool _212 = !_168;
    int _214 = _212 ? 0 : 1;
    float _216 = floor(_192);
    float _218 = _196 + (-1.0);
    float _220 = _202 + (-1.0);
    int _222 = abs(_214);
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _226 = _194 + (-1.0);
    float _228 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _230 = _198 > 0.0;
    float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _234 = log2(_232);
    bool _236 = _198 >= 0.0;
    bool _238 = isnan(_198);
    bool _240 = _236 || _238;
    bool _242 = isnan(0.0);
    bool _244 = _240 || _242;
    float _246 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _248 = float(_222);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _154 + _250;
    int _254 = _244 ? 0 : 1;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    bool _260 = _216 > 0.0;
    float _262 = floor(_208);
    int _264 = ~_254;
    int _266 = _264 + 1;
    int _268 = _266 + 1;
    float _270 = _252 * _184;
    bool _272 = _216 >= 0.0;
    bool _274 = isnan(_216);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    int _286 = _268;
    if (!_230)
    {
        int _288 = ~_254;
        int _290 = _288 + 1;
        _286 = _290;
    }
    int _292 = _286;
    float _294 = fma(_258, _210, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _296 = _280 ? 0 : 1;
    float _298 = fma(_284, _210, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = float(_292);
    float _302 = _234 * _100;
    int _304 = ~_296;
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    int _310 = _308;
    if (!_260)
    {
        int _312 = ~_296;
        int _314 = _312 + 1;
        _310 = _314;
    }
    int _316 = _310;
    float _318 = _248 * _300;
    float _320 = exp2(_302);
    float _322 = in.m_39.x;
    float _324 = in.m_39.y;
    float _326 = in.m_39.z;
    bool _328 = _262 > 0.0;
    float _330 = _318 * (-2.0);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _334 = 1.0 + _332;
    bool _336 = _262 >= 0.0;
    bool _338 = isnan(_262);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = !_172;
    int _348 = _346 ? 0 : 1;
    float _350 = fma(_228, _330, _228);
    bool _352 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _354 = isnan(1.0);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _360 = _356 || _358;
    float _362 = 1.0 / _334;
    int _364 = abs(_348);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    bool _370 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _378 = _374 || _376;
    float _380 = float(_364);
    float _382 = -_320;
    float _384 = _382 + 1.0;
    float _386 = float(_316);
    float _388 = fma(_368, _210, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _390 = _344 ? 0 : 1;
    float _392 = _378 ? _384 : 0.0;
    float _394 = _380 * _386;
    if (_360)
    {
        float _396 = _392 * _362;
        _104 = _396;
    }
    float _398 = _104;
    float _400 = _394 * (-2.0);
    float _402 = fma(_330, _322, _322);
    int _404 = ~_390;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    float _410 = fma(_400, _324, _324);
    float _412 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[196].x, _402);
    float _414 = fma(_246, _400, _246);
    bool _416 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _418 = isnan(_154);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].y, _410);
    bool _430 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _432 = isnan(_154);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_350, _398, _412);
    bool _444 = !_176;
    int _446 = _444 ? 0 : 1;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _452 = _408;
    if (!_328)
    {
        int _454 = ~_390;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = -_440;
    float _462 = _460 + 1.0;
    int _464 = abs(_446);
    float _466 = _442 * 0.15915493667125701904296875;
    bool _468 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_154);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = _426 * _462;
    float _486 = float(_464);
    float _488 = -_426;
    float _490 = _488 + 1.0;
    float _492 = float(_458);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = fma(_414, _398, _428);
    float _500 = fma(_482, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _502 = fma(_450, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = _486 * _492;
    float _506 = _478 * _490;
    float _508 = fma(_496, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = in.m_41.x;
    float _512 = in.m_41.y;
    float _514 = in.m_41.z;
    float _516 = _504 * (-2.0);
    float _518 = _298 * _506;
    float _520 = -_478;
    float _522 = _520 + 1.0;
    float _524 = in.m_43.x;
    float _526 = in.m_43.y;
    float _528 = in.m_43.z;
    float _530 = fma(_516, _326, _326);
    float _532 = _294 * _506;
    float _534 = fma(_224, _516, _224);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _518);
    float _538 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _530);
    float _540 = _388 * _506;
    float _542 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _544 = _498 * 0.15915493667125701904296875;
    float _546 = fma(_534, _398, _538);
    float _548 = fma(_500, _484, _536);
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _552 = fma(_502, _484, _542);
    float _554 = _546 * 0.15915493667125701904296875;
    float _556 = _466 * 6.283185482025146484375;
    float _558 = sin(_556);
    float _560 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].x, _548);
    float _562 = fma(_508, _484, _550);
    float _564 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].y, _552);
    float _566 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].z, _562);
    float _568 = _560 * _510;
    float _570 = _466 * 6.283185482025146484375;
    float _572 = cos(_570);
    float _574 = _564 * _512;
    float _576 = in.m_30.x;
    float _578 = in.m_30.y;
    float _580 = in.m_30.z;
    float _582 = _566 * _514;
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _524);
    float _586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _526);
    float _588 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _590 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _592 = _544 * 6.283185482025146484375;
    float _594 = sin(_592);
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _528);
    float _598 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _600 = _588 * _584;
    float _602 = _590 * _586;
    bool _604 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _606 = isnan(0.5);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _612 = _608 || _610;
    float _614 = _598 * _596;
    float _616 = _544 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = _554 * 6.283185482025146484375;
    float _622 = cos(_620);
    float _624 = _572 * _594;
    float _626 = _558 * _594;
    float _628 = _554 * 6.283185482025146484375;
    float _630 = sin(_628);
    float _632 = _558 * _618;
    float _634 = _572 * _618;
    float _636 = _622 * _602;
    float _638 = _618 * _622;
    float _640 = _594 * _622;
    float _642 = _558 * _636;
    float _644 = -_624;
    float _646 = fma(_630, _632, _644);
    float _648 = -_632;
    float _650 = fma(_630, _624, _648);
    float _652 = _630 * _602;
    float _654 = _572 * _636;
    float _656 = fma(_630, _634, _626);
    float _658 = fma(_630, _626, _634);
    float _660 = -_652;
    float _662 = fma(_638, _600, _660);
    float _664 = fma(_646, _600, _642);
    float _666 = fma(_656, _600, _654);
    float _668 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(_640, _614, _662);
    float _672 = fma(_658, _614, _664);
    float _674 = fma(_650, _614, _666);
    float _676 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _678 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    float _680 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _682 = _674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _676);
    float _686 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _688 = _674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _692 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _684);
    float _694 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].x, _688);
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[10].z, _690);
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _702 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _680);
    float _704 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[8].z, _696);
    float _706 = _694 + _698;
    float _708 = _674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _710 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _702);
    float _712 = _700 + _704;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _706 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _720 = _712 + _718;
    float _722 = _716 * _716;
    float _724 = fma(_720, _720, _722);
    float _726 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].x, _708);
    float _728 = _710 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _730 = sqrt(_724);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[9].z, _726);
    float _734 = _728 + _732;
    bool _736 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _738 = _580;
    float _740 = _576;
    float _742 = _710;
    if (!_736)
    {
        _738 = _712;
    }
    float _744 = _738;
    float _746 = _744;
    if (!_736)
    {
        _740 = _706;
    }
    float _748 = _740;
    float _750 = _748;
    if (!_736)
    {
        _742 = _734;
    }
    float _752 = _742;
    bool _754 = !_736;
    float _756 = _752;
    if (!_754)
    {
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _762 = _730 + _760;
        float _764 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = rsqrt(_724);
        float _768 = _762 * _758;
        float _770 = _768 * 0.15915493667125701904296875;
        float _772 = _770 * 6.283185482025146484375;
        float _774 = cos(_772);
        float _776 = _770 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = _774 + (-1.0);
        float _782 = _780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = fma(_778, _764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _786 = fma(_734, _774, _782);
        float _788 = _766 * _784;
        float _790 = fma(_720, _788, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _792 = fma(_716, _788, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _746 = _790;
        _756 = _786;
        _750 = _792;
    }
    float _794 = _746;
    float _796 = _756;
    float _798 = _750;
    float _800 = _796;
    float _802 = _794;
    float _804 = _798;
    if (!_612)
    {
        float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _808 = _728 + _806;
        float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _812 = _700 + _810;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _816 = -_700;
        float _818 = _816 + _794;
        float _820 = _808 * _808;
        float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _824 = _694 + _822;
        float _826 = -_728;
        float _828 = _826 + _796;
        float _830 = -_694;
        float _832 = _830 + _798;
        float _834 = fma(_812, _812, _820);
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _838 = fma(_824, _824, _834);
        float _840 = sqrt(_838);
        float _842 = _814 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _844 = precise::min(_840, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _846 = _844 * _836;
        float _848 = _842 * _846;
        float _850 = fma(_818, _848, _700);
        float _852 = fma(_828, _848, _728);
        float _854 = fma(_832, _848, _694);
        _800 = _852;
        _802 = _850;
        _804 = _854;
    }
    float _856 = _800;
    float _858 = _802;
    float _860 = _804;
    float _862 = _856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = _856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _866 = _856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _868 = _856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _870 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _862);
    float _872 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _864);
    float _874 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _866);
    float _876 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _868);
    float _878 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].z, _870);
    float _880 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].z, _872);
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].z, _874);
    float _884 = _878 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _886 = _880 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _888 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].z, _876);
    float _890 = _882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _892);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _894);
    float _902 = _884 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _904 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _896);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _898);
    float _908 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _902);
    float _910 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _900);
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _908);
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _904);
    float _916 = _888 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[6].w, _910);
    float _926 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _930 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[4].w, _912);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[5].w, _906);
    float _940 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[7].w, _914);
    out.m_33.x = 1.0;
    out.m_47.w = _926;
    out.m_49.x = _930;
    out.m_49.y = _932;
    out.m_49.z = _934;
    out.m_49.w = _928;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _924;
    out.gl_Position.w = _940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_72)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _996 = as_type<float>(_82);
        out.gl_Position.z = _996;
    }
    if (!_72)
    {
        return out;
    }
    float _86 = in.m_35.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_68);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _84 = as_type<int>(_120);
    }
    int _122 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1066 = as_type<float>(_122);
        out.gl_Position.z = _1066;
    }
    if (_114)
    {
        return out;
    }
    bool _124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _126 = !_124;
    float _144;
    if (!_126)
    {
        float _128 = in.m_37.x;
        float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _132 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _134 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
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
        float _152 = _100 * _150;
        _144 = _152;
    }
    _146 = false;
    float _154 = _144;
    float _156 = in.m_37.x;
    float _158 = in.m_37.y;
    float _160 = in.m_37.z;
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _162;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _172 = _170 != 0;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _176 = _174 != 0;
    float _178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _180 = _178 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = 1.0 / _164;
    float _184 = 1.0 / _180;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _154 + _186;
    float _190 = _160 * 2.0;
    float _192 = _156 * 2.0;
    float _194 = _158 + _160;
    float _196 = _160 + _156;
    float _198 = floor(_190);
    float _200 = _160 + (-0.5);
    float _202 = _158 + _156;
    float _204 = _156 + (-0.5);
    float _206 = _158 + (-0.5);
    float _208 = _158 * 2.0;
    float _210 = _188 * _182;
    bool _212 = !_168;
    int _214 = _212 ? 0 : 1;
    float _216 = floor(_192);
    float _218 = _196 + (-1.0);
    float _220 = _202 + (-1.0);
    int _222 = abs(_214);
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _226 = _194 + (-1.0);
    float _228 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _230 = _198 > 0.0;
    float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _234 = log2(_232);
    bool _236 = _198 >= 0.0;
    bool _238 = isnan(_198);
    bool _240 = _236 || _238;
    bool _242 = isnan(0.0);
    bool _244 = _240 || _242;
    float _246 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _248 = float(_222);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _154 + _250;
    int _254 = _244 ? 0 : 1;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    bool _260 = _216 > 0.0;
    float _262 = floor(_208);
    int _264 = ~_254;
    int _266 = _264 + 1;
    int _268 = _266 + 1;
    float _270 = _252 * _184;
    bool _272 = _216 >= 0.0;
    bool _274 = isnan(_216);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    int _286 = _268;
    if (!_230)
    {
        int _288 = ~_254;
        int _290 = _288 + 1;
        _286 = _290;
    }
    int _292 = _286;
    float _294 = fma(_258, _210, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _296 = _280 ? 0 : 1;
    float _298 = fma(_284, _210, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = float(_292);
    float _302 = _234 * _100;
    int _304 = ~_296;
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    int _310 = _308;
    if (!_260)
    {
        int _312 = ~_296;
        int _314 = _312 + 1;
        _310 = _314;
    }
    int _316 = _310;
    float _318 = _248 * _300;
    float _320 = exp2(_302);
    float _322 = in.m_39.x;
    float _324 = in.m_39.y;
    float _326 = in.m_39.z;
    bool _328 = _262 > 0.0;
    float _330 = _318 * (-2.0);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _334 = 1.0 + _332;
    bool _336 = _262 >= 0.0;
    bool _338 = isnan(_262);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = !_172;
    int _348 = _346 ? 0 : 1;
    float _350 = fma(_228, _330, _228);
    bool _352 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _354 = isnan(1.0);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _360 = _356 || _358;
    float _362 = 1.0 / _334;
    int _364 = abs(_348);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    bool _370 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _378 = _374 || _376;
    float _380 = float(_364);
    float _382 = -_320;
    float _384 = _382 + 1.0;
    float _386 = float(_316);
    float _388 = fma(_368, _210, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _390 = _344 ? 0 : 1;
    float _392 = _378 ? _384 : 0.0;
    float _394 = _380 * _386;
    if (_360)
    {
        float _396 = _392 * _362;
        _104 = _396;
    }
    float _398 = _104;
    float _400 = _394 * (-2.0);
    float _402 = fma(_330, _322, _322);
    int _404 = ~_390;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    float _410 = fma(_400, _324, _324);
    float _412 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[196].x, _402);
    float _414 = fma(_246, _400, _246);
    bool _416 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _418 = isnan(_154);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].y, _410);
    bool _430 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _432 = isnan(_154);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_350, _398, _412);
    bool _444 = !_176;
    int _446 = _444 ? 0 : 1;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _452 = _408;
    if (!_328)
    {
        int _454 = ~_390;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = -_440;
    float _462 = _460 + 1.0;
    int _464 = abs(_446);
    float _466 = _442 * 0.15915493667125701904296875;
    bool _468 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_154);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = _426 * _462;
    float _486 = float(_464);
    float _488 = -_426;
    float _490 = _488 + 1.0;
    float _492 = float(_458);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = fma(_414, _398, _428);
    float _500 = fma(_482, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _502 = fma(_450, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = _486 * _492;
    float _506 = _478 * _490;
    float _508 = fma(_496, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = in.m_41.x;
    float _512 = in.m_41.y;
    float _514 = in.m_41.z;
    float _516 = _504 * (-2.0);
    float _518 = _298 * _506;
    float _520 = -_478;
    float _522 = _520 + 1.0;
    float _524 = in.m_43.x;
    float _526 = in.m_43.y;
    float _528 = in.m_43.z;
    float _530 = fma(_516, _326, _326);
    float _532 = _294 * _506;
    float _534 = fma(_224, _516, _224);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _518);
    float _538 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _530);
    float _540 = _388 * _506;
    float _542 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _544 = _498 * 0.15915493667125701904296875;
    float _546 = fma(_534, _398, _538);
    float _548 = fma(_500, _484, _536);
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _552 = fma(_502, _484, _542);
    float _554 = _546 * 0.15915493667125701904296875;
    float _556 = _466 * 6.283185482025146484375;
    float _558 = sin(_556);
    float _560 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].x, _548);
    float _562 = fma(_508, _484, _550);
    float _564 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].y, _552);
    float _566 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].z, _562);
    float _568 = _560 * _510;
    float _570 = _466 * 6.283185482025146484375;
    float _572 = cos(_570);
    float _574 = _564 * _512;
    float _576 = in.m_30.x;
    float _578 = in.m_30.y;
    float _580 = in.m_30.z;
    float _582 = _566 * _514;
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _524);
    float _586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _526);
    float _588 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _590 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _592 = _544 * 6.283185482025146484375;
    float _594 = sin(_592);
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _528);
    float _598 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _600 = _588 * _584;
    float _602 = _590 * _586;
    bool _604 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _606 = isnan(0.5);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _612 = _608 || _610;
    float _614 = _598 * _596;
    float _616 = _544 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = _554 * 6.283185482025146484375;
    float _622 = cos(_620);
    float _624 = _572 * _594;
    float _626 = _558 * _594;
    float _628 = _554 * 6.283185482025146484375;
    float _630 = sin(_628);
    float _632 = _558 * _618;
    float _634 = _572 * _618;
    float _636 = _622 * _602;
    float _638 = _618 * _622;
    float _640 = _594 * _622;
    float _642 = _558 * _636;
    float _644 = -_624;
    float _646 = fma(_630, _632, _644);
    float _648 = -_632;
    float _650 = fma(_630, _624, _648);
    float _652 = _630 * _602;
    float _654 = _572 * _636;
    float _656 = fma(_630, _634, _626);
    float _658 = fma(_630, _626, _634);
    float _660 = -_652;
    float _662 = fma(_638, _600, _660);
    float _664 = fma(_646, _600, _642);
    float _666 = fma(_656, _600, _654);
    float _668 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(_640, _614, _662);
    float _672 = fma(_658, _614, _664);
    float _674 = fma(_650, _614, _666);
    float _676 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _678 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    float _680 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _682 = _674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _676);
    float _686 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _688 = _674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _692 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _684);
    float _694 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].x, _688);
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[10].z, _690);
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _702 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _680);
    float _704 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[8].z, _696);
    float _706 = _694 + _698;
    float _708 = _674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _710 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _702);
    float _712 = _700 + _704;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _706 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _720 = _712 + _718;
    float _722 = _716 * _716;
    float _724 = fma(_720, _720, _722);
    float _726 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].x, _708);
    float _728 = _710 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _730 = sqrt(_724);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[9].z, _726);
    float _734 = _728 + _732;
    bool _736 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _738 = _580;
    float _740 = _576;
    float _742 = _710;
    if (!_736)
    {
        _738 = _712;
    }
    float _744 = _738;
    float _746 = _744;
    if (!_736)
    {
        _740 = _706;
    }
    float _748 = _740;
    float _750 = _748;
    if (!_736)
    {
        _742 = _734;
    }
    float _752 = _742;
    bool _754 = !_736;
    float _756 = _752;
    if (!_754)
    {
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _762 = _730 + _760;
        float _764 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = rsqrt(_724);
        float _768 = _762 * _758;
        float _770 = _768 * 0.15915493667125701904296875;
        float _772 = _770 * 6.283185482025146484375;
        float _774 = cos(_772);
        float _776 = _770 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = _774 + (-1.0);
        float _782 = _780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = fma(_778, _764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _786 = fma(_734, _774, _782);
        float _788 = _766 * _784;
        float _790 = fma(_720, _788, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _792 = fma(_716, _788, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _746 = _790;
        _756 = _786;
        _750 = _792;
    }
    float _794 = _746;
    float _796 = _756;
    float _798 = _750;
    float _800 = _796;
    float _802 = _794;
    float _804 = _798;
    if (!_612)
    {
        float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _808 = _728 + _806;
        float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _812 = _700 + _810;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _816 = -_700;
        float _818 = _816 + _794;
        float _820 = _808 * _808;
        float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _824 = _694 + _822;
        float _826 = -_728;
        float _828 = _826 + _796;
        float _830 = -_694;
        float _832 = _830 + _798;
        float _834 = fma(_812, _812, _820);
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _838 = fma(_824, _824, _834);
        float _840 = sqrt(_838);
        float _842 = _814 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _844 = precise::min(_840, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _846 = _844 * _836;
        float _848 = _842 * _846;
        float _850 = fma(_818, _848, _700);
        float _852 = fma(_828, _848, _728);
        float _854 = fma(_832, _848, _694);
        _800 = _852;
        _802 = _850;
        _804 = _854;
    }
    float _856 = _800;
    float _858 = _802;
    float _860 = _804;
    float _862 = _856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = _856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _866 = _856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _868 = _856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _870 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _862);
    float _872 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _864);
    float _874 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _866);
    float _876 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _868);
    float _878 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].z, _870);
    float _880 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].z, _872);
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].z, _874);
    float _884 = _878 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _886 = _880 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _888 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].z, _876);
    float _890 = _882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _892);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _894);
    float _902 = _884 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _904 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _896);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _898);
    float _908 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _902);
    float _910 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _900);
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _908);
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _904);
    float _916 = _888 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[6].w, _910);
    float _926 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _930 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[4].w, _912);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[5].w, _906);
    float _940 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[7].w, _914);
    out.m_33.x = 1.0;
    out.m_47.w = _926;
    out.m_49.x = _930;
    out.m_49.y = _932;
    out.m_49.z = _934;
    out.m_49.w = _928;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _924;
    out.gl_Position.w = _940;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _146 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_72)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _996 = as_type<float>(_82);
        out.gl_Position.z = _996;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_35.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_68);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _84 = as_type<int>(_120);
    }
    int _122 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1066 = as_type<float>(_122);
        out.gl_Position.z = _1066;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _126 = !_124;
    float _144;
    if (!_126)
    {
        float _128 = in.m_37.x;
        float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _132 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _134 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
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
        float _152 = _100 * _150;
        _144 = _152;
    }
    _146 = false;
    float _154 = _144;
    float _156 = in.m_37.x;
    float _158 = in.m_37.y;
    float _160 = in.m_37.z;
    float _162 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _162;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _168 = _166 != 0;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _172 = _170 != 0;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _176 = _174 != 0;
    float _178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _180 = _178 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _182 = 1.0 / _164;
    float _184 = 1.0 / _180;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _154 + _186;
    float _190 = _160 * 2.0;
    float _192 = _156 * 2.0;
    float _194 = _158 + _160;
    float _196 = _160 + _156;
    float _198 = floor(_190);
    float _200 = _160 + (-0.5);
    float _202 = _158 + _156;
    float _204 = _156 + (-0.5);
    float _206 = _158 + (-0.5);
    float _208 = _158 * 2.0;
    float _210 = _188 * _182;
    bool _212 = !_168;
    int _214 = _212 ? 0 : 1;
    float _216 = floor(_192);
    float _218 = _196 + (-1.0);
    float _220 = _202 + (-1.0);
    int _222 = abs(_214);
    float _224 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _226 = _194 + (-1.0);
    float _228 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _230 = _198 > 0.0;
    float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _234 = log2(_232);
    bool _236 = _198 >= 0.0;
    bool _238 = isnan(_198);
    bool _240 = _236 || _238;
    bool _242 = isnan(0.0);
    bool _244 = _240 || _242;
    float _246 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _248 = float(_222);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _154 + _250;
    int _254 = _244 ? 0 : 1;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    bool _260 = _216 > 0.0;
    float _262 = floor(_208);
    int _264 = ~_254;
    int _266 = _264 + 1;
    int _268 = _266 + 1;
    float _270 = _252 * _184;
    bool _272 = _216 >= 0.0;
    bool _274 = isnan(_216);
    bool _276 = _272 || _274;
    bool _278 = isnan(0.0);
    bool _280 = _276 || _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _282;
    int _286 = _268;
    if (!_230)
    {
        int _288 = ~_254;
        int _290 = _288 + 1;
        _286 = _290;
    }
    int _292 = _286;
    float _294 = fma(_258, _210, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _296 = _280 ? 0 : 1;
    float _298 = fma(_284, _210, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = float(_292);
    float _302 = _234 * _100;
    int _304 = ~_296;
    int _306 = _304 + 1;
    int _308 = _306 + 1;
    int _310 = _308;
    if (!_260)
    {
        int _312 = ~_296;
        int _314 = _312 + 1;
        _310 = _314;
    }
    int _316 = _310;
    float _318 = _248 * _300;
    float _320 = exp2(_302);
    float _322 = in.m_39.x;
    float _324 = in.m_39.y;
    float _326 = in.m_39.z;
    bool _328 = _262 > 0.0;
    float _330 = _318 * (-2.0);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _334 = 1.0 + _332;
    bool _336 = _262 >= 0.0;
    bool _338 = isnan(_262);
    bool _340 = _336 || _338;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = !_172;
    int _348 = _346 ? 0 : 1;
    float _350 = fma(_228, _330, _228);
    bool _352 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _354 = isnan(1.0);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _360 = _356 || _358;
    float _362 = 1.0 / _334;
    int _364 = abs(_348);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    bool _370 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _378 = _374 || _376;
    float _380 = float(_364);
    float _382 = -_320;
    float _384 = _382 + 1.0;
    float _386 = float(_316);
    float _388 = fma(_368, _210, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _390 = _344 ? 0 : 1;
    float _392 = _378 ? _384 : 0.0;
    float _394 = _380 * _386;
    if (_360)
    {
        float _396 = _392 * _362;
        _104 = _396;
    }
    float _398 = _104;
    float _400 = _394 * (-2.0);
    float _402 = fma(_330, _322, _322);
    int _404 = ~_390;
    int _406 = _404 + 1;
    int _408 = _406 + 1;
    float _410 = fma(_400, _324, _324);
    float _412 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[196].x, _402);
    float _414 = fma(_246, _400, _246);
    bool _416 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _418 = isnan(_154);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[196].y, _410);
    bool _430 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _432 = isnan(_154);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_350, _398, _412);
    bool _444 = !_176;
    int _446 = _444 ? 0 : 1;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _452 = _408;
    if (!_328)
    {
        int _454 = ~_390;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = -_440;
    float _462 = _460 + 1.0;
    int _464 = abs(_446);
    float _466 = _442 * 0.15915493667125701904296875;
    bool _468 = _154 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _470 = isnan(_154);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = _426 * _462;
    float _486 = float(_464);
    float _488 = -_426;
    float _490 = _488 + 1.0;
    float _492 = float(_458);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _498 = fma(_414, _398, _428);
    float _500 = fma(_482, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _502 = fma(_450, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _504 = _486 * _492;
    float _506 = _478 * _490;
    float _508 = fma(_496, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _510 = in.m_41.x;
    float _512 = in.m_41.y;
    float _514 = in.m_41.z;
    float _516 = _504 * (-2.0);
    float _518 = _298 * _506;
    float _520 = -_478;
    float _522 = _520 + 1.0;
    float _524 = in.m_43.x;
    float _526 = in.m_43.y;
    float _528 = in.m_43.z;
    float _530 = fma(_516, _326, _326);
    float _532 = _294 * _506;
    float _534 = fma(_224, _516, _224);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _518);
    float _538 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _530);
    float _540 = _388 * _506;
    float _542 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _544 = _498 * 0.15915493667125701904296875;
    float _546 = fma(_534, _398, _538);
    float _548 = fma(_500, _484, _536);
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _540);
    float _552 = fma(_502, _484, _542);
    float _554 = _546 * 0.15915493667125701904296875;
    float _556 = _466 * 6.283185482025146484375;
    float _558 = sin(_556);
    float _560 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].x, _548);
    float _562 = fma(_508, _484, _550);
    float _564 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].y, _552);
    float _566 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[145].z, _562);
    float _568 = _560 * _510;
    float _570 = _466 * 6.283185482025146484375;
    float _572 = cos(_570);
    float _574 = _564 * _512;
    float _576 = in.m_30.x;
    float _578 = in.m_30.y;
    float _580 = in.m_30.z;
    float _582 = _566 * _514;
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _524);
    float _586 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _526);
    float _588 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _590 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _592 = _544 * 6.283185482025146484375;
    float _594 = sin(_592);
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _528);
    float _598 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _600 = _588 * _584;
    float _602 = _590 * _586;
    bool _604 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _606 = isnan(0.5);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _612 = _608 || _610;
    float _614 = _598 * _596;
    float _616 = _544 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = _554 * 6.283185482025146484375;
    float _622 = cos(_620);
    float _624 = _572 * _594;
    float _626 = _558 * _594;
    float _628 = _554 * 6.283185482025146484375;
    float _630 = sin(_628);
    float _632 = _558 * _618;
    float _634 = _572 * _618;
    float _636 = _622 * _602;
    float _638 = _618 * _622;
    float _640 = _594 * _622;
    float _642 = _558 * _636;
    float _644 = -_624;
    float _646 = fma(_630, _632, _644);
    float _648 = -_632;
    float _650 = fma(_630, _624, _648);
    float _652 = _630 * _602;
    float _654 = _572 * _636;
    float _656 = fma(_630, _634, _626);
    float _658 = fma(_630, _626, _634);
    float _660 = -_652;
    float _662 = fma(_638, _600, _660);
    float _664 = fma(_646, _600, _642);
    float _666 = fma(_656, _600, _654);
    float _668 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _670 = fma(_640, _614, _662);
    float _672 = fma(_658, _614, _664);
    float _674 = fma(_650, _614, _666);
    float _676 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _678 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _668);
    float _680 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _682 = _674 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _684 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _676);
    float _686 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _678);
    float _688 = _674 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].x, _682);
    float _692 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _684);
    float _694 = _686 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _696 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].x, _688);
    float _698 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[10].z, _690);
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _702 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _680);
    float _704 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[8].z, _696);
    float _706 = _694 + _698;
    float _708 = _674 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _710 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _702);
    float _712 = _700 + _704;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _706 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _720 = _712 + _718;
    float _722 = _716 * _716;
    float _724 = fma(_720, _720, _722);
    float _726 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].x, _708);
    float _728 = _710 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _730 = sqrt(_724);
    float _732 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[9].z, _726);
    float _734 = _728 + _732;
    bool _736 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _738 = _580;
    float _740 = _576;
    float _742 = _710;
    if (!_736)
    {
        _738 = _712;
    }
    float _744 = _738;
    float _746 = _744;
    if (!_736)
    {
        _740 = _706;
    }
    float _748 = _740;
    float _750 = _748;
    if (!_736)
    {
        _742 = _734;
    }
    float _752 = _742;
    bool _754 = !_736;
    float _756 = _752;
    if (!_754)
    {
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _762 = _730 + _760;
        float _764 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = rsqrt(_724);
        float _768 = _762 * _758;
        float _770 = _768 * 0.15915493667125701904296875;
        float _772 = _770 * 6.283185482025146484375;
        float _774 = cos(_772);
        float _776 = _770 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = _774 + (-1.0);
        float _782 = _780 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = fma(_778, _764, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _786 = fma(_734, _774, _782);
        float _788 = _766 * _784;
        float _790 = fma(_720, _788, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _792 = fma(_716, _788, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _746 = _790;
        _756 = _786;
        _750 = _792;
    }
    float _794 = _746;
    float _796 = _756;
    float _798 = _750;
    float _800 = _796;
    float _802 = _794;
    float _804 = _798;
    if (!_612)
    {
        float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _808 = _728 + _806;
        float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _812 = _700 + _810;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _816 = -_700;
        float _818 = _816 + _794;
        float _820 = _808 * _808;
        float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _824 = _694 + _822;
        float _826 = -_728;
        float _828 = _826 + _796;
        float _830 = -_694;
        float _832 = _830 + _798;
        float _834 = fma(_812, _812, _820);
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _838 = fma(_824, _824, _834);
        float _840 = sqrt(_838);
        float _842 = _814 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _844 = precise::min(_840, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _846 = _844 * _836;
        float _848 = _842 * _846;
        float _850 = fma(_818, _848, _700);
        float _852 = fma(_828, _848, _728);
        float _854 = fma(_832, _848, _694);
        _800 = _852;
        _802 = _850;
        _804 = _854;
    }
    float _856 = _800;
    float _858 = _802;
    float _860 = _804;
    float _862 = _856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _864 = _856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _866 = _856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _868 = _856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _870 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _862);
    float _872 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _864);
    float _874 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _866);
    float _876 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _868);
    float _878 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].z, _870);
    float _880 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].z, _872);
    out.m_45.x = 1.0;
    out.m_45.y = 1.0;
    out.m_45.z = 1.0;
    float _882 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].z, _874);
    float _884 = _878 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _886 = _880 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _888 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].z, _876);
    float _890 = _882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _892);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _894);
    float _902 = _884 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _904 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _896);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _898);
    float _908 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _902);
    float _910 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _900);
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _908);
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _904);
    float _916 = _888 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[6].w, _910);
    float _926 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _930 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[4].w, _912);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[5].w, _906);
    float _940 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[7].w, _914);
    out.m_33.x = 1.0;
    out.m_47.w = _926;
    out.m_49.x = _930;
    out.m_49.y = _932;
    out.m_49.z = _934;
    out.m_49.w = _928;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _924;
    out.gl_Position.w = _940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

