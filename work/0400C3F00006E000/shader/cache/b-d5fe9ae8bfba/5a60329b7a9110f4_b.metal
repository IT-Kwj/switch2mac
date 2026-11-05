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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_43 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _156 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1002 = as_type<float>(_82);
        out.gl_Position.z = _1002;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_31.w;
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
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1071 = as_type<float>(_120);
        out.gl_Position.z = _1071;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_33.x;
    float _124 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _128 = _124 * _122;
    float _130 = trunc(_128);
    int _132 = int(_130);
    int _134 = _132 << 4;
    int _136 = _134 + 1712;
    bool _138 = !_126;
    float _154;
    if (!_138)
    {
        float _140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _142 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _144 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _146 = _144 * _140;
        float _148 = floor(_146);
        float _150 = -_148;
        float _152 = _146 + _150;
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = float(_66);
        float _160 = 1.0 / _158;
        float _162 = _100 * _160;
        _154 = _162;
    }
    _156 = false;
    float _164 = _154;
    float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _168 = log2(_166);
    float _170 = in.m_33.z;
    float _172 = _122 * 2.0;
    float _174 = in.m_33.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _186 = _184 != 0;
    float _188 = floor(_172);
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _192 = 1.0 + _190;
    bool _194 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _202 = _198 || _200;
    bool _204 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _206 = isnan(1.0);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _212 = _208 || _210;
    float _214 = _168 * _100;
    float _216 = 1.0 / _192;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _218 = exp2(_214);
    float _220 = _170 * 2.0;
    float _222 = fma(_174, 3.0, 1.0);
    bool _224 = _220 > 1.0;
    bool _226 = _220 >= 1.0;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _122);
    float _238 = _174 * 2.0;
    float _240 = floor(_220);
    float _242 = _236 * _222;
    int _244 = _234 ? 0 : 1;
    float _246 = -_218;
    float _248 = _246 + 1.0;
    bool _250 = _188 > 0.0;
    float _252 = floor(_238);
    float _254 = _122 + _170;
    float _256 = _202 ? _248 : 0.0;
    int _258 = ~_244;
    int _260 = _258 + 1;
    int _262 = _260 + 1;
    float _264 = _254 + (-1.0);
    int _266 = _262;
    if (!_224)
    {
        int _268 = ~_244;
        int _270 = _268 + 1;
        _266 = _270;
    }
    int _272 = _266;
    float _274 = _174 + _170;
    bool _276 = _188 >= 0.0;
    bool _278 = isnan(_188);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    if (_212)
    {
        float _286 = _256 * _216;
        _104 = _286;
    }
    float _288 = _104;
    float _290 = _274 + (-1.0);
    int _292 = _284 ? 0 : 1;
    float _294 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _296 = _240 > 0.0;
    float _298 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _300 = !_182;
    int _302 = _300 ? 0 : 1;
    bool _304 = _240 >= 0.0;
    bool _306 = isnan(_240);
    bool _308 = _304 || _306;
    bool _310 = isnan(0.0);
    bool _312 = _308 || _310;
    int _314 = abs(_302);
    int _316 = ~_292;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    float _322 = float(_272);
    float _324 = _174 + (-0.5);
    bool _326 = _252 > 0.0;
    float _328 = _122 + _174;
    bool _330 = _252 >= 0.0;
    bool _332 = isnan(_252);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = _242 * _322;
    float _342 = _340 * 2.0;
    int _344 = _320;
    if (!_250)
    {
        int _346 = ~_292;
        int _348 = _346 + 1;
        _344 = _348;
    }
    int _350 = _344;
    float _352 = _122 + (-0.5);
    float _354 = in.m_35.x;
    float _356 = in.m_35.y;
    float _358 = in.m_35.z;
    int _360 = _312 ? 0 : 1;
    float _362 = _342 * 0.15915493667125701904296875;
    float _364 = float(_314);
    float _366 = float(_350);
    bool _368 = !_186;
    int _370 = _368 ? 0 : 1;
    int _372 = ~_360;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    float _378 = _364 * _366;
    int _380 = _376;
    if (!_296)
    {
        int _382 = ~_360;
        int _384 = _382 + 1;
        _380 = _384;
    }
    int _386 = _380;
    int _388 = abs(_370);
    float _390 = _378 * (-2.0);
    float _392 = in.m_37.x;
    float _394 = in.m_37.y;
    float _396 = in.m_37.z;
    int _398 = _338 ? 0 : 1;
    float _400 = _362 * 6.283185482025146484375;
    float _402 = sin(_400);
    bool _404 = !_178;
    int _406 = _404 ? 0 : 1;
    int _408 = ~_398;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    int _414 = _412;
    if (!_326)
    {
        int _416 = ~_398;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = float(_388);
    float _424 = _362 * 6.283185482025146484375;
    float _426 = cos(_424);
    float _428 = float(_420);
    float _430 = fma(_390, _356, _356);
    float _432 = fma(_298, _390, _298);
    int _434 = abs(_406);
    float _436 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[196].y, _430);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _442 = _422 * _428;
    float _444 = fma(_432, _288, _436);
    float _446 = float(_386);
    float _448 = 1.0 / _440;
    float _450 = _442 * (-2.0);
    float _452 = float(_434);
    float _454 = _444 * 0.15915493667125701904296875;
    float _456 = _426 * _394;
    float _458 = fma(_294, _450, _294);
    float _460 = in.m_39.x;
    float _462 = in.m_39.y;
    float _464 = in.m_39.z;
    float _466 = _452 * _446;
    float _468 = fma(_402, _392, _456);
    float _470 = fma(_450, _358, _358);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _472;
    float _476 = _466 * (-2.0);
    float _478 = _342 + _468;
    float _480 = _170 + (-0.5);
    bool _482 = _164 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_164);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = fma(_476, _354, _354);
    float _496 = _478 * 0.15915493667125701904296875;
    float _498 = _474 * _448;
    float _500 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[196].z, _470);
    float _502 = in.m_26.x;
    float _504 = in.m_26.y;
    float _506 = in.m_26.z;
    float _508 = _454 * 6.283185482025146484375;
    float _510 = sin(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _164 + _512;
    float _516 = fma(_458, _288, _500);
    bool _518 = _164 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _520 = isnan(_164);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _328 + (-1.0);
    float _532 = fma(_498, _514, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _534 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[196].x, _494);
    float _536 = _516 * 0.15915493667125701904296875;
    float _538 = _496 * 6.283185482025146484375;
    float _540 = sin(_538);
    float _542 = _402 * _394;
    float _544 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _546 = -_492;
    float _548 = _546 + 1.0;
    float _550 = _462 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _552 = _464 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _554 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _556 = _454 * 6.283185482025146484375;
    float _558 = cos(_556);
    float _560 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _564 = _540 * 0.15915493667125701904296875;
    float _566 = _504 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _568 = _536 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _574 = _528 * _548;
    float _576 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _566);
    float _578 = in.m_41.x;
    float _580 = in.m_41.y;
    float _582 = in.m_41.z;
    float _584 = fma(_572, _476, _572);
    float _586 = _532 * _574;
    float _588 = _504 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _590 = _564 * 6.283185482025146484375;
    float _592 = sin(_590);
    float _594 = _504 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _596 = -_528;
    float _598 = _596 + 1.0;
    float _600 = fma(_584, _288, _534);
    float _602 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _604 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
    float _606 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _608 = _600 * 0.15915493667125701904296875;
    float _610 = _564 * 6.283185482025146484375;
    float _612 = cos(_610);
    float _614 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
    float _616 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _618 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _604);
    float _620 = -_542;
    float _622 = fma(_426, _392, _620);
    float _624 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[116].x, _606);
    float _626 = _616 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _628 = _592 * _396;
    float _630 = _536 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _636 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _638 = _402 * _580;
    float _640 = _426 * _580;
    float _642 = _554 * _634;
    float _644 = _558 * _570;
    float _646 = -_628;
    float _648 = fma(_468, _612, _646);
    float _650 = _608 * 6.283185482025146484375;
    float _652 = cos(_650);
    float _654 = _612 * _396;
    float _656 = -_638;
    float _658 = fma(_426, _578, _656);
    float _660 = fma(_402, _578, _640);
    bool _662 = _648 != 0.0;
    bool _664 = isnan(_648);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_468, _592, _654);
    float _674 = _510 * _570;
    float _676 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _678 = _608 * 6.283185482025146484375;
    float _680 = sin(_678);
    bool _682 = _622 == 0.0;
    bool _684 = !_670;
    bool _686 = _682 && _684;
    float _688 = _510 * _632;
    float _690 = _558 * _632;
    bool _692 = _672 == 0.0;
    bool _694 = _692 && _686;
    float _696 = _652 * _632;
    float _698 = _652 * _570;
    float _700 = _652 * _510;
    float _702 = _652 * _558;
    float _704 = -_688;
    float _706 = fma(_680, _644, _704);
    float _708 = -_644;
    float _710 = fma(_680, _688, _708);
    float _712 = _592 * _582;
    float _714 = fma(_680, _674, _690);
    float _716 = fma(_680, _690, _674);
    float _718 = _612 * _582;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _722 = -_712;
    float _724 = fma(_612, _660, _722);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _728 = fma(_592, _660, _718);
    float _730 = _560 * _720;
    float _732 = _724;
    float _734 = _658;
    float _736 = _728;
    if (!_694)
    {
        float _738 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _724);
        _732 = _738;
    }
    float _740 = _732;
    float _742 = _562 * _726;
    if (!_694)
    {
        float _744 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _734 = _744;
    }
    float _746 = _734;
    float _748 = _710 * _730;
    float _750 = _716 * _730;
    float _752 = _696 * _730;
    float _754 = _696 * _740;
    float _756 = _710 * _740;
    float _758 = fma(_714, _642, _748);
    float _760 = fma(_706, _642, _750);
    float _762 = _716 * _740;
    if (!_694)
    {
        float _764 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _728);
        _736 = _764;
    }
    float _766 = _736;
    float _768 = fma(_698, _642, _752);
    float _770 = fma(_698, _746, _754);
    float _772 = fma(_714, _746, _756);
    float _774 = fma(_706, _746, _762);
    float _776 = fma(_700, _742, _758);
    float _778 = -_680;
    float _780 = fma(_778, _742, _768);
    float _782 = fma(_702, _742, _760);
    float _784 = -_680;
    float _786 = fma(_784, _766, _770);
    int _788 = _136 + 8;
    uint _791 = uint(int(uint(_788) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[int(_793)][_795];
    float _799 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _801 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _803 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _805 = fma(_702, _766, _774);
    float _807 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[9].x, _799);
    float _809 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[8].x, _801);
    float _811 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[10].x, _803);
    uint _813 = uint(int(uint(_136) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[int(_823)][_825];
    float _829 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].z, _807);
    float _831 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].z, _809);
    float _833 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].z, _811);
    float _835 = fma(_700, _766, _772);
    float _837 = _626 + _829;
    float _839 = _636 + _831;
    float _841 = _676 + _833;
    float _843 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _845 = _837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _847 = _837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _845);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _847);
    float _857 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _849);
    float _859 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _851);
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _853);
    float _863 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _855);
    float _865 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _857);
    float _867 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _859);
    float _869 = _861 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _875 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _877 = _869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _879 = _869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _881 = _869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _883 = _869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[4].x, _877);
    float _887 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[7].x, _879);
    float _889 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _891 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].x, _843);
    float _893 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[6].x, _881);
    float _895 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[5].x, _883);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].z, _885);
    float _899 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].z, _887);
    float _901 = _867 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].x, _875);
    float _905 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].x, _889);
    float _907 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[10].z, _891);
    float _909 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _911 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].z, _895);
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _897);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _899);
    float _917 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].z, _893);
    float _919 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _923 = _819 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _925 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _927 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[9].z, _905);
    float _929 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _911);
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _913 + _915;
    float _935 = _915 * 0.5;
    float _937 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[8].z, _903);
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _917);
    float _943 = _933 * 0.5;
    float _945 = fma(_929, -0.5, _935);
    out.m_43.x = _937;
    out.m_43.y = _927;
    out.m_43.z = _907;
    out.m_45.x = _931;
    out.m_45.y = _939;
    out.m_45.z = _919;
    out.m_45.w = _921;
    out.gl_Position.x = _913;
    out.gl_Position.y = _929;
    out.gl_Position.z = _941;
    out.gl_Position.w = _915;
    out.m_47.w = _915;
    out.m_47.x = _943;
    out.m_47.y = _945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _156 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1002 = as_type<float>(_82);
        out.gl_Position.z = _1002;
    }
    if (!_70)
    {
        return out;
    }
    float _86 = in.m_31.w;
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
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1071 = as_type<float>(_120);
        out.gl_Position.z = _1071;
    }
    if (_114)
    {
        return out;
    }
    float _122 = in.m_33.x;
    float _124 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _128 = _124 * _122;
    float _130 = trunc(_128);
    int _132 = int(_130);
    int _134 = _132 << 4;
    int _136 = _134 + 1712;
    bool _138 = !_126;
    float _154;
    if (!_138)
    {
        float _140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _142 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _144 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _146 = _144 * _140;
        float _148 = floor(_146);
        float _150 = -_148;
        float _152 = _146 + _150;
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = float(_66);
        float _160 = 1.0 / _158;
        float _162 = _100 * _160;
        _154 = _162;
    }
    _156 = false;
    float _164 = _154;
    float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _168 = log2(_166);
    float _170 = in.m_33.z;
    float _172 = _122 * 2.0;
    float _174 = in.m_33.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _186 = _184 != 0;
    float _188 = floor(_172);
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _192 = 1.0 + _190;
    bool _194 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _202 = _198 || _200;
    bool _204 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _206 = isnan(1.0);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _212 = _208 || _210;
    float _214 = _168 * _100;
    float _216 = 1.0 / _192;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _218 = exp2(_214);
    float _220 = _170 * 2.0;
    float _222 = fma(_174, 3.0, 1.0);
    bool _224 = _220 > 1.0;
    bool _226 = _220 >= 1.0;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _122);
    float _238 = _174 * 2.0;
    float _240 = floor(_220);
    float _242 = _236 * _222;
    int _244 = _234 ? 0 : 1;
    float _246 = -_218;
    float _248 = _246 + 1.0;
    bool _250 = _188 > 0.0;
    float _252 = floor(_238);
    float _254 = _122 + _170;
    float _256 = _202 ? _248 : 0.0;
    int _258 = ~_244;
    int _260 = _258 + 1;
    int _262 = _260 + 1;
    float _264 = _254 + (-1.0);
    int _266 = _262;
    if (!_224)
    {
        int _268 = ~_244;
        int _270 = _268 + 1;
        _266 = _270;
    }
    int _272 = _266;
    float _274 = _174 + _170;
    bool _276 = _188 >= 0.0;
    bool _278 = isnan(_188);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    if (_212)
    {
        float _286 = _256 * _216;
        _104 = _286;
    }
    float _288 = _104;
    float _290 = _274 + (-1.0);
    int _292 = _284 ? 0 : 1;
    float _294 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _296 = _240 > 0.0;
    float _298 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _300 = !_182;
    int _302 = _300 ? 0 : 1;
    bool _304 = _240 >= 0.0;
    bool _306 = isnan(_240);
    bool _308 = _304 || _306;
    bool _310 = isnan(0.0);
    bool _312 = _308 || _310;
    int _314 = abs(_302);
    int _316 = ~_292;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    float _322 = float(_272);
    float _324 = _174 + (-0.5);
    bool _326 = _252 > 0.0;
    float _328 = _122 + _174;
    bool _330 = _252 >= 0.0;
    bool _332 = isnan(_252);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = _242 * _322;
    float _342 = _340 * 2.0;
    int _344 = _320;
    if (!_250)
    {
        int _346 = ~_292;
        int _348 = _346 + 1;
        _344 = _348;
    }
    int _350 = _344;
    float _352 = _122 + (-0.5);
    float _354 = in.m_35.x;
    float _356 = in.m_35.y;
    float _358 = in.m_35.z;
    int _360 = _312 ? 0 : 1;
    float _362 = _342 * 0.15915493667125701904296875;
    float _364 = float(_314);
    float _366 = float(_350);
    bool _368 = !_186;
    int _370 = _368 ? 0 : 1;
    int _372 = ~_360;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    float _378 = _364 * _366;
    int _380 = _376;
    if (!_296)
    {
        int _382 = ~_360;
        int _384 = _382 + 1;
        _380 = _384;
    }
    int _386 = _380;
    int _388 = abs(_370);
    float _390 = _378 * (-2.0);
    float _392 = in.m_37.x;
    float _394 = in.m_37.y;
    float _396 = in.m_37.z;
    int _398 = _338 ? 0 : 1;
    float _400 = _362 * 6.283185482025146484375;
    float _402 = sin(_400);
    bool _404 = !_178;
    int _406 = _404 ? 0 : 1;
    int _408 = ~_398;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    int _414 = _412;
    if (!_326)
    {
        int _416 = ~_398;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = float(_388);
    float _424 = _362 * 6.283185482025146484375;
    float _426 = cos(_424);
    float _428 = float(_420);
    float _430 = fma(_390, _356, _356);
    float _432 = fma(_298, _390, _298);
    int _434 = abs(_406);
    float _436 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[196].y, _430);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _442 = _422 * _428;
    float _444 = fma(_432, _288, _436);
    float _446 = float(_386);
    float _448 = 1.0 / _440;
    float _450 = _442 * (-2.0);
    float _452 = float(_434);
    float _454 = _444 * 0.15915493667125701904296875;
    float _456 = _426 * _394;
    float _458 = fma(_294, _450, _294);
    float _460 = in.m_39.x;
    float _462 = in.m_39.y;
    float _464 = in.m_39.z;
    float _466 = _452 * _446;
    float _468 = fma(_402, _392, _456);
    float _470 = fma(_450, _358, _358);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _472;
    float _476 = _466 * (-2.0);
    float _478 = _342 + _468;
    float _480 = _170 + (-0.5);
    bool _482 = _164 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_164);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = fma(_476, _354, _354);
    float _496 = _478 * 0.15915493667125701904296875;
    float _498 = _474 * _448;
    float _500 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[196].z, _470);
    float _502 = in.m_26.x;
    float _504 = in.m_26.y;
    float _506 = in.m_26.z;
    float _508 = _454 * 6.283185482025146484375;
    float _510 = sin(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _164 + _512;
    float _516 = fma(_458, _288, _500);
    bool _518 = _164 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _520 = isnan(_164);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _328 + (-1.0);
    float _532 = fma(_498, _514, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _534 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[196].x, _494);
    float _536 = _516 * 0.15915493667125701904296875;
    float _538 = _496 * 6.283185482025146484375;
    float _540 = sin(_538);
    float _542 = _402 * _394;
    float _544 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _546 = -_492;
    float _548 = _546 + 1.0;
    float _550 = _462 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _552 = _464 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _554 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _556 = _454 * 6.283185482025146484375;
    float _558 = cos(_556);
    float _560 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _564 = _540 * 0.15915493667125701904296875;
    float _566 = _504 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _568 = _536 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _574 = _528 * _548;
    float _576 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _566);
    float _578 = in.m_41.x;
    float _580 = in.m_41.y;
    float _582 = in.m_41.z;
    float _584 = fma(_572, _476, _572);
    float _586 = _532 * _574;
    float _588 = _504 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _590 = _564 * 6.283185482025146484375;
    float _592 = sin(_590);
    float _594 = _504 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _596 = -_528;
    float _598 = _596 + 1.0;
    float _600 = fma(_584, _288, _534);
    float _602 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _604 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
    float _606 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _608 = _600 * 0.15915493667125701904296875;
    float _610 = _564 * 6.283185482025146484375;
    float _612 = cos(_610);
    float _614 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
    float _616 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _618 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _604);
    float _620 = -_542;
    float _622 = fma(_426, _392, _620);
    float _624 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[116].x, _606);
    float _626 = _616 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _628 = _592 * _396;
    float _630 = _536 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _636 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _638 = _402 * _580;
    float _640 = _426 * _580;
    float _642 = _554 * _634;
    float _644 = _558 * _570;
    float _646 = -_628;
    float _648 = fma(_468, _612, _646);
    float _650 = _608 * 6.283185482025146484375;
    float _652 = cos(_650);
    float _654 = _612 * _396;
    float _656 = -_638;
    float _658 = fma(_426, _578, _656);
    float _660 = fma(_402, _578, _640);
    bool _662 = _648 != 0.0;
    bool _664 = isnan(_648);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_468, _592, _654);
    float _674 = _510 * _570;
    float _676 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _678 = _608 * 6.283185482025146484375;
    float _680 = sin(_678);
    bool _682 = _622 == 0.0;
    bool _684 = !_670;
    bool _686 = _682 && _684;
    float _688 = _510 * _632;
    float _690 = _558 * _632;
    bool _692 = _672 == 0.0;
    bool _694 = _692 && _686;
    float _696 = _652 * _632;
    float _698 = _652 * _570;
    float _700 = _652 * _510;
    float _702 = _652 * _558;
    float _704 = -_688;
    float _706 = fma(_680, _644, _704);
    float _708 = -_644;
    float _710 = fma(_680, _688, _708);
    float _712 = _592 * _582;
    float _714 = fma(_680, _674, _690);
    float _716 = fma(_680, _690, _674);
    float _718 = _612 * _582;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _722 = -_712;
    float _724 = fma(_612, _660, _722);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _728 = fma(_592, _660, _718);
    float _730 = _560 * _720;
    float _732 = _724;
    float _734 = _658;
    float _736 = _728;
    if (!_694)
    {
        float _738 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _724);
        _732 = _738;
    }
    float _740 = _732;
    float _742 = _562 * _726;
    if (!_694)
    {
        float _744 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _734 = _744;
    }
    float _746 = _734;
    float _748 = _710 * _730;
    float _750 = _716 * _730;
    float _752 = _696 * _730;
    float _754 = _696 * _740;
    float _756 = _710 * _740;
    float _758 = fma(_714, _642, _748);
    float _760 = fma(_706, _642, _750);
    float _762 = _716 * _740;
    if (!_694)
    {
        float _764 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _728);
        _736 = _764;
    }
    float _766 = _736;
    float _768 = fma(_698, _642, _752);
    float _770 = fma(_698, _746, _754);
    float _772 = fma(_714, _746, _756);
    float _774 = fma(_706, _746, _762);
    float _776 = fma(_700, _742, _758);
    float _778 = -_680;
    float _780 = fma(_778, _742, _768);
    float _782 = fma(_702, _742, _760);
    float _784 = -_680;
    float _786 = fma(_784, _766, _770);
    int _788 = _136 + 8;
    uint _791 = uint(int(uint(_788) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[int(_793)][_795];
    float _799 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _801 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _803 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _805 = fma(_702, _766, _774);
    float _807 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[9].x, _799);
    float _809 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[8].x, _801);
    float _811 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[10].x, _803);
    uint _813 = uint(int(uint(_136) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[int(_823)][_825];
    float _829 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].z, _807);
    float _831 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].z, _809);
    float _833 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].z, _811);
    float _835 = fma(_700, _766, _772);
    float _837 = _626 + _829;
    float _839 = _636 + _831;
    float _841 = _676 + _833;
    float _843 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _845 = _837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _847 = _837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _845);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _847);
    float _857 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _849);
    float _859 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _851);
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _853);
    float _863 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _855);
    float _865 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _857);
    float _867 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _859);
    float _869 = _861 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _875 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _877 = _869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _879 = _869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _881 = _869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _883 = _869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[4].x, _877);
    float _887 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[7].x, _879);
    float _889 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _891 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].x, _843);
    float _893 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[6].x, _881);
    float _895 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[5].x, _883);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].z, _885);
    float _899 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].z, _887);
    float _901 = _867 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].x, _875);
    float _905 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].x, _889);
    float _907 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[10].z, _891);
    float _909 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _911 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].z, _895);
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _897);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _899);
    float _917 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].z, _893);
    float _919 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _923 = _819 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _925 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _927 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[9].z, _905);
    float _929 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _911);
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _913 + _915;
    float _935 = _915 * 0.5;
    float _937 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[8].z, _903);
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _917);
    float _943 = _933 * 0.5;
    float _945 = fma(_929, -0.5, _935);
    out.m_43.x = _937;
    out.m_43.y = _927;
    out.m_43.z = _907;
    out.m_45.x = _931;
    out.m_45.y = _939;
    out.m_45.z = _919;
    out.m_45.w = _921;
    out.gl_Position.x = _913;
    out.gl_Position.y = _929;
    out.gl_Position.z = _941;
    out.gl_Position.w = _915;
    out.m_47.w = _915;
    out.m_47.x = _943;
    out.m_47.y = _945;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _156 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1002 = as_type<float>(_82);
        out.gl_Position.z = _1002;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_31.w;
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
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1071 = as_type<float>(_120);
        out.gl_Position.z = _1071;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_33.x;
    float _124 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _128 = _124 * _122;
    float _130 = trunc(_128);
    int _132 = int(_130);
    int _134 = _132 << 4;
    int _136 = _134 + 1712;
    bool _138 = !_126;
    float _154;
    if (!_138)
    {
        float _140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _142 = _122 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _144 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _146 = _144 * _140;
        float _148 = floor(_146);
        float _150 = -_148;
        float _152 = _146 + _150;
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = float(_66);
        float _160 = 1.0 / _158;
        float _162 = _100 * _160;
        _154 = _162;
    }
    _156 = false;
    float _164 = _154;
    float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _168 = log2(_166);
    float _170 = in.m_33.z;
    float _172 = _122 * 2.0;
    float _174 = in.m_33.y;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _178 = _176 != 0;
    int _180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _182 = _180 != 0;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _186 = _184 != 0;
    float _188 = floor(_172);
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _192 = 1.0 + _190;
    bool _194 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _196 = isnan(0.0);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _202 = _198 || _200;
    bool _204 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _206 = isnan(1.0);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _212 = _208 || _210;
    float _214 = _168 * _100;
    float _216 = 1.0 / _192;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _218 = exp2(_214);
    float _220 = _170 * 2.0;
    float _222 = fma(_174, 3.0, 1.0);
    bool _224 = _220 > 1.0;
    bool _226 = _220 >= 1.0;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _122);
    float _238 = _174 * 2.0;
    float _240 = floor(_220);
    float _242 = _236 * _222;
    int _244 = _234 ? 0 : 1;
    float _246 = -_218;
    float _248 = _246 + 1.0;
    bool _250 = _188 > 0.0;
    float _252 = floor(_238);
    float _254 = _122 + _170;
    float _256 = _202 ? _248 : 0.0;
    int _258 = ~_244;
    int _260 = _258 + 1;
    int _262 = _260 + 1;
    float _264 = _254 + (-1.0);
    int _266 = _262;
    if (!_224)
    {
        int _268 = ~_244;
        int _270 = _268 + 1;
        _266 = _270;
    }
    int _272 = _266;
    float _274 = _174 + _170;
    bool _276 = _188 >= 0.0;
    bool _278 = isnan(_188);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    if (_212)
    {
        float _286 = _256 * _216;
        _104 = _286;
    }
    float _288 = _104;
    float _290 = _274 + (-1.0);
    int _292 = _284 ? 0 : 1;
    float _294 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _296 = _240 > 0.0;
    float _298 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _300 = !_182;
    int _302 = _300 ? 0 : 1;
    bool _304 = _240 >= 0.0;
    bool _306 = isnan(_240);
    bool _308 = _304 || _306;
    bool _310 = isnan(0.0);
    bool _312 = _308 || _310;
    int _314 = abs(_302);
    int _316 = ~_292;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    float _322 = float(_272);
    float _324 = _174 + (-0.5);
    bool _326 = _252 > 0.0;
    float _328 = _122 + _174;
    bool _330 = _252 >= 0.0;
    bool _332 = isnan(_252);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = _242 * _322;
    float _342 = _340 * 2.0;
    int _344 = _320;
    if (!_250)
    {
        int _346 = ~_292;
        int _348 = _346 + 1;
        _344 = _348;
    }
    int _350 = _344;
    float _352 = _122 + (-0.5);
    float _354 = in.m_35.x;
    float _356 = in.m_35.y;
    float _358 = in.m_35.z;
    int _360 = _312 ? 0 : 1;
    float _362 = _342 * 0.15915493667125701904296875;
    float _364 = float(_314);
    float _366 = float(_350);
    bool _368 = !_186;
    int _370 = _368 ? 0 : 1;
    int _372 = ~_360;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    float _378 = _364 * _366;
    int _380 = _376;
    if (!_296)
    {
        int _382 = ~_360;
        int _384 = _382 + 1;
        _380 = _384;
    }
    int _386 = _380;
    int _388 = abs(_370);
    float _390 = _378 * (-2.0);
    float _392 = in.m_37.x;
    float _394 = in.m_37.y;
    float _396 = in.m_37.z;
    int _398 = _338 ? 0 : 1;
    float _400 = _362 * 6.283185482025146484375;
    float _402 = sin(_400);
    bool _404 = !_178;
    int _406 = _404 ? 0 : 1;
    int _408 = ~_398;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    int _414 = _412;
    if (!_326)
    {
        int _416 = ~_398;
        int _418 = _416 + 1;
        _414 = _418;
    }
    int _420 = _414;
    float _422 = float(_388);
    float _424 = _362 * 6.283185482025146484375;
    float _426 = cos(_424);
    float _428 = float(_420);
    float _430 = fma(_390, _356, _356);
    float _432 = fma(_298, _390, _298);
    int _434 = abs(_406);
    float _436 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[196].y, _430);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _442 = _422 * _428;
    float _444 = fma(_432, _288, _436);
    float _446 = float(_386);
    float _448 = 1.0 / _440;
    float _450 = _442 * (-2.0);
    float _452 = float(_434);
    float _454 = _444 * 0.15915493667125701904296875;
    float _456 = _426 * _394;
    float _458 = fma(_294, _450, _294);
    float _460 = in.m_39.x;
    float _462 = in.m_39.y;
    float _464 = in.m_39.z;
    float _466 = _452 * _446;
    float _468 = fma(_402, _392, _456);
    float _470 = fma(_450, _358, _358);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _472;
    float _476 = _466 * (-2.0);
    float _478 = _342 + _468;
    float _480 = _170 + (-0.5);
    bool _482 = _164 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_164);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = fma(_476, _354, _354);
    float _496 = _478 * 0.15915493667125701904296875;
    float _498 = _474 * _448;
    float _500 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[196].z, _470);
    float _502 = in.m_26.x;
    float _504 = in.m_26.y;
    float _506 = in.m_26.z;
    float _508 = _454 * 6.283185482025146484375;
    float _510 = sin(_508);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _164 + _512;
    float _516 = fma(_458, _288, _500);
    bool _518 = _164 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _520 = isnan(_164);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _328 + (-1.0);
    float _532 = fma(_498, _514, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _534 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[196].x, _494);
    float _536 = _516 * 0.15915493667125701904296875;
    float _538 = _496 * 6.283185482025146484375;
    float _540 = sin(_538);
    float _542 = _402 * _394;
    float _544 = _460 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _546 = -_492;
    float _548 = _546 + 1.0;
    float _550 = _462 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _552 = _464 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _554 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _556 = _454 * 6.283185482025146484375;
    float _558 = cos(_556);
    float _560 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _562 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _564 = _540 * 0.15915493667125701904296875;
    float _566 = _504 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _568 = _536 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _574 = _528 * _548;
    float _576 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _566);
    float _578 = in.m_41.x;
    float _580 = in.m_41.y;
    float _582 = in.m_41.z;
    float _584 = fma(_572, _476, _572);
    float _586 = _532 * _574;
    float _588 = _504 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _590 = _564 * 6.283185482025146484375;
    float _592 = sin(_590);
    float _594 = _504 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _596 = -_528;
    float _598 = _596 + 1.0;
    float _600 = fma(_584, _288, _534);
    float _602 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _588);
    float _604 = fma(_502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
    float _606 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _608 = _600 * 0.15915493667125701904296875;
    float _610 = _564 * 6.283185482025146484375;
    float _612 = cos(_610);
    float _614 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
    float _616 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _618 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _604);
    float _620 = -_542;
    float _622 = fma(_426, _392, _620);
    float _624 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[116].x, _606);
    float _626 = _616 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _628 = _592 * _396;
    float _630 = _536 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _636 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _638 = _402 * _580;
    float _640 = _426 * _580;
    float _642 = _554 * _634;
    float _644 = _558 * _570;
    float _646 = -_628;
    float _648 = fma(_468, _612, _646);
    float _650 = _608 * 6.283185482025146484375;
    float _652 = cos(_650);
    float _654 = _612 * _396;
    float _656 = -_638;
    float _658 = fma(_426, _578, _656);
    float _660 = fma(_402, _578, _640);
    bool _662 = _648 != 0.0;
    bool _664 = isnan(_648);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_468, _592, _654);
    float _674 = _510 * _570;
    float _676 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _678 = _608 * 6.283185482025146484375;
    float _680 = sin(_678);
    bool _682 = _622 == 0.0;
    bool _684 = !_670;
    bool _686 = _682 && _684;
    float _688 = _510 * _632;
    float _690 = _558 * _632;
    bool _692 = _672 == 0.0;
    bool _694 = _692 && _686;
    float _696 = _652 * _632;
    float _698 = _652 * _570;
    float _700 = _652 * _510;
    float _702 = _652 * _558;
    float _704 = -_688;
    float _706 = fma(_680, _644, _704);
    float _708 = -_644;
    float _710 = fma(_680, _688, _708);
    float _712 = _592 * _582;
    float _714 = fma(_680, _674, _690);
    float _716 = fma(_680, _690, _674);
    float _718 = _612 * _582;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _722 = -_712;
    float _724 = fma(_612, _660, _722);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _728 = fma(_592, _660, _718);
    float _730 = _560 * _720;
    float _732 = _724;
    float _734 = _658;
    float _736 = _728;
    if (!_694)
    {
        float _738 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _724);
        _732 = _738;
    }
    float _740 = _732;
    float _742 = _562 * _726;
    if (!_694)
    {
        float _744 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[17].y, _658);
        _734 = _744;
    }
    float _746 = _734;
    float _748 = _710 * _730;
    float _750 = _716 * _730;
    float _752 = _696 * _730;
    float _754 = _696 * _740;
    float _756 = _710 * _740;
    float _758 = fma(_714, _642, _748);
    float _760 = fma(_706, _642, _750);
    float _762 = _716 * _740;
    if (!_694)
    {
        float _764 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _728);
        _736 = _764;
    }
    float _766 = _736;
    float _768 = fma(_698, _642, _752);
    float _770 = fma(_698, _746, _754);
    float _772 = fma(_714, _746, _756);
    float _774 = fma(_706, _746, _762);
    float _776 = fma(_700, _742, _758);
    float _778 = -_680;
    float _780 = fma(_778, _742, _768);
    float _782 = fma(_702, _742, _760);
    float _784 = -_680;
    float _786 = fma(_784, _766, _770);
    int _788 = _136 + 8;
    uint _791 = uint(int(uint(_788) >> uint(2)));
    uint _793 = uint(int(uint(int(_791)) >> uint(2)));
    int _795 = int(_791) & 3;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[int(_793)][_795];
    float _799 = _780 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _801 = _780 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _803 = _780 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _805 = fma(_702, _766, _774);
    float _807 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[9].x, _799);
    float _809 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[8].x, _801);
    float _811 = fma(_776, (*spvDescriptorSet0.vp_c10)._m0[10].x, _803);
    uint _813 = uint(int(uint(_136) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[int(_823)][_825];
    float _829 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].z, _807);
    float _831 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].z, _809);
    float _833 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].z, _811);
    float _835 = fma(_700, _766, _772);
    float _837 = _626 + _829;
    float _839 = _636 + _831;
    float _841 = _676 + _833;
    float _843 = _786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _845 = _837 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _847 = _837 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _849 = _837 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _851 = _837 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _853 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].x, _845);
    float _855 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[0].x, _847);
    float _857 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[2].x, _849);
    float _859 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[3].x, _851);
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[1].z, _853);
    float _863 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[0].z, _855);
    float _865 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[2].z, _857);
    float _867 = fma(_841, (*spvDescriptorSet0.vp_c8)._m0[3].z, _859);
    float _869 = _861 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _871 = _863 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _873 = _865 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _875 = _786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _877 = _869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _879 = _869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _881 = _869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _883 = _869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[4].x, _877);
    float _887 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[7].x, _879);
    float _889 = _786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _891 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[10].x, _843);
    float _893 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[6].x, _881);
    float _895 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[5].x, _883);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[4].z, _885);
    float _899 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[7].z, _887);
    float _901 = _867 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[8].x, _875);
    float _905 = fma(_835, (*spvDescriptorSet0.vp_c10)._m0[9].x, _889);
    float _907 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[10].z, _891);
    float _909 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _911 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[5].z, _895);
    float _913 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _897);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _899);
    float _917 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[6].z, _893);
    float _919 = _909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _921 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _923 = _819 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _925 = _827 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _927 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[9].z, _905);
    float _929 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _911);
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = _913 + _915;
    float _935 = _915 * 0.5;
    float _937 = fma(_805, (*spvDescriptorSet0.vp_c10)._m0[8].z, _903);
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _917);
    float _943 = _933 * 0.5;
    float _945 = fma(_929, -0.5, _935);
    out.m_43.x = _937;
    out.m_43.y = _927;
    out.m_43.z = _907;
    out.m_45.x = _931;
    out.m_45.y = _939;
    out.m_45.z = _919;
    out.m_45.w = _921;
    out.gl_Position.x = _913;
    out.gl_Position.y = _929;
    out.gl_Position.z = _941;
    out.gl_Position.w = _915;
    out.m_47.w = _915;
    out.m_47.x = _943;
    out.m_47.y = _945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

