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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_26 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _606 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    uint _42 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].w)) >> uint(16)));
    int _45 = int(_42) & 65535;
    float _48 = in.m_26.x;
    uint _50 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(8)));
    float _52 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].x))).x;
    float _54 = (-0.0) + _52;
    int _56 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w) & 255;
    float _58 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].z))).x;
    float _60 = (-0.0) + _58;
    uint _62 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].x)) >> uint(16)));
    int _64 = int(_62) & 65535;
    int _66 = int(_50) & 255;
    uint _68 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(16)));
    float _70 = float(_56);
    uint _72 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(24)));
    float _74 = float(_66);
    uint _76 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].y)) >> uint(16)));
    int _78 = int(_76) & 65535;
    float _80 = _70 * 0.0039215688593685626983642578125;
    float _82 = float2(as_type<half2>(uint(_45))).x;
    float _84 = (-0.0) + _82;
    uint _86 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].z)) >> uint(16)));
    int _88 = int(_86) & 65535;
    float _90 = abs(_84);
    float _92 = precise::max(_90, 0.100000001490116119384765625);
    float _94 = float2(as_type<half2>(uint(_64))).x;
    float _96 = (-0.0) + _94;
    float _98 = precise::min(_92, 20.0);
    float _100 = _98 * 0.0500000007450580596923828125;
    float _102 = float2(as_type<half2>(uint(_78))).x;
    float _104 = (-0.0) + _102;
    bool _108 = _100 >= _48;
    bool _110 = isnan(_100);
    bool _112 = _108 || _110;
    bool _114 = isnan(_48);
    bool _116 = _112 || _114;
    float _118 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].y))).x;
    float _120 = (-0.0) + _118;
    float _122 = float2(as_type<half2>(uint(_88))).x;
    float _124 = (-0.0) + _122;
    int _126 = 0;
    if (!_116)
    {
        _126 = -1;
    }
    int _128 = _126;
    float _130 = 0.0;
    int _132 = _128;
    int _134 = _128;
    if (!_116)
    {
        _130 = 1.0;
    }
    float _136 = _130;
    bool _138 = !_116;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / _98;
        float _144 = _142 * 20.0;
        float _146 = _144 * _48;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        bool _150 = _148 > 0.20000000298023223876953125;
        bool _152 = isnan(_148);
        bool _154 = _150 || _152;
        bool _156 = isnan(0.20000000298023223876953125);
        bool _158 = _154 || _156;
        float _160 = 0.0;
        float _162 = _144;
        float _164 = _148;
        if (!_158)
        {
            float _166 = _148 * 5.0;
            _160 = _166;
        }
        float _168 = _160;
        float _170 = _168;
        if (!_158)
        {
            _132 = 0;
        }
        int _172 = _132;
        int _174 = _172;
        _134 = _172;
        if (!_158)
        {
            float _176 = _80 * _168;
            _162 = _176;
        }
        float _178 = _162;
        bool _180 = !_158;
        float _182 = _178;
        _140 = _178;
        if (!_180)
        {
            bool _184 = _148 > 0.4000000059604644775390625;
            bool _186 = isnan(_148);
            bool _188 = _184 || _186;
            bool _190 = isnan(0.4000000059604644775390625);
            bool _192 = _188 || _190;
            if (!_192)
            {
                _170 = 1.0;
            }
            float _194 = _170;
            float _196 = _194;
            if (!_192)
            {
                float _198 = -_70;
                float _200 = _198 + _74;
                _182 = _200;
            }
            float _202 = _182;
            float _204 = _202;
            if (!_192)
            {
                _174 = 0;
            }
            int _206 = _174;
            int _208 = _206;
            _134 = _206;
            if (!_192)
            {
                float _210 = -_194;
                float _212 = fma(_148, 5.0, _210);
                _196 = _212;
            }
            float _214 = _196;
            float _216 = _214;
            if (!_192)
            {
                float _218 = fma(_214, _202, _70);
                _204 = _218;
            }
            float _220 = _204;
            float _222 = _220;
            if (!_192)
            {
                float _224 = _220 * 0.0039215688593685626983642578125;
                _222 = _224;
            }
            float _226 = _222;
            bool _228 = !_192;
            float _230 = _226;
            _140 = _226;
            if (!_228)
            {
                bool _232 = _148 > 0.60000002384185791015625;
                bool _234 = isnan(_148);
                bool _236 = _232 || _234;
                bool _238 = isnan(0.60000002384185791015625);
                bool _240 = _236 || _238;
                int _242 = int(_68) & 255;
                float _244 = float(_242);
                float _246 = _244;
                if (!_240)
                {
                    _216 = 4.999999523162841796875;
                }
                float _248 = _216;
                float _250 = _248;
                if (!_240)
                {
                    _208 = 0;
                }
                int _252 = _208;
                _134 = _252;
                if (!_240)
                {
                    float _254 = fma(_148, _248, -1.99999988079071044921875);
                    _230 = _254;
                }
                float _256 = _230;
                float _258 = _256;
                if (!_240)
                {
                    float _260 = -_74;
                    float _262 = _260 + _244;
                    _250 = _262;
                }
                float _264 = _250;
                if (!_240)
                {
                    float _266 = fma(_256, _264, _74);
                    _258 = _266;
                }
                float _268 = _258;
                float _270 = _268;
                if (!_240)
                {
                    float _272 = _268 * 0.0039215688593685626983642578125;
                    _270 = _272;
                }
                float _274 = _270;
                bool _276 = !_240;
                float _278 = _274;
                _140 = _274;
                if (!_276)
                {
                    bool _280 = _148 > 0.800000011920928955078125;
                    bool _282 = isnan(_148);
                    bool _284 = _280 || _282;
                    bool _286 = isnan(0.800000011920928955078125);
                    bool _288 = _284 || _286;
                    float _290 = float(int(_72));
                    float _292 = 0.0;
                    float _294 = _290;
                    _134 = 0;
                    if (!_288)
                    {
                        float _296 = fma(_148, 5.000000476837158203125, -3.000000476837158203125);
                        _292 = _296;
                    }
                    float _298 = _292;
                    if (!_288)
                    {
                        float _300 = -_244;
                        float _302 = _300 + _290;
                        _278 = _302;
                    }
                    float _304 = _278;
                    float _306 = _304;
                    if (_288)
                    {
                        float _308 = _290 * 0.0039215688593685626983642578125;
                        _294 = _308;
                    }
                    float _310 = _294;
                    if (_288)
                    {
                        float _312 = fma(_148, 5.000000476837158203125, -4.000000476837158203125);
                        _164 = _312;
                    }
                    float _314 = _164;
                    if (!_288)
                    {
                        float _316 = fma(_298, _304, _244);
                        _306 = _316;
                    }
                    float _318 = _306;
                    float _320 = _318;
                    if (_288)
                    {
                        float _322 = -_310;
                        float _324 = _322 + 1.0;
                        _246 = _324;
                    }
                    float _326 = _246;
                    if (!_288)
                    {
                        float _328 = _318 * 0.0039215688593685626983642578125;
                        _320 = _328;
                    }
                    float _330 = _320;
                    _140 = _330;
                    if (_288)
                    {
                        float _332 = fma(_314, _326, _310);
                        _140 = _332;
                    }
                }
            }
        }
    }
    float _334 = _140;
    int _336 = _134;
    float _338 = -_70;
    float _340 = _338 + _74;
    float _342 = in.m_28.y;
    float _344 = fma(_340, 0.0019607846625149250030517578125, _80);
    float _346 = in.m_28.z;
    bool _348 = _334 >= _344;
    bool _350 = isnan(_334);
    bool _352 = _348 || _350;
    bool _354 = isnan(_344);
    bool _356 = _352 || _354;
    float _358 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
    bool _360 = 0.0 > _358;
    bool _362 = !_356;
    bool _364 = _360 && _362;
    bool _366 = _342 >= 0.0;
    bool _368 = _366 && _364;
    float _370 = fma(_48, -20.0, _346);
    bool _372 = !_368;
    float _374 = _342;
    float _376 = _370;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    float _594;
    float _596;
    float _598;
    float _600;
    float _602;
    float _604;
    if (!_372)
    {
        float _378 = _344 * _344;
        float _380 = -_344;
        float _382 = _380 + 1.0;
        float _384 = fma(_344, -3.0, 3.0);
        float _386 = _378 * 3.0;
        float _388 = _344 * _378;
        float _390 = _344 * _384;
        float _392 = _382 * _382;
        float _394 = _344 * _390;
        float _396 = _390 * 2.0;
        float _398 = _382 * _390;
        float _400 = _124 * _394;
        float _402 = -_386;
        float _404 = _402 + _396;
        float _406 = -_396;
        float _408 = fma(_392, 3.0, _406);
        float _410 = _96 * _394;
        float _412 = fma(_60, _398, _400);
        float _414 = _104 * _404;
        float _416 = _124 * _404;
        float _418 = fma(_54, _398, _410);
        float _420 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].z, _412);
        float _422 = _96 * _404;
        float _424 = fma(_120, _408, _414);
        float _426 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].x, _418);
        float _428 = _420 * _420;
        float _430 = fma(_54, _408, _422);
        float _432 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].y, _424);
        float _434 = fma(_60, _408, _416);
        float _436 = fma(_426, _426, _428);
        float _438 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].x, _430);
        float _440 = _432 * _432;
        float _442 = 1.0 / _344;
        float _444 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].z, _434);
        float _446 = _104 * _394;
        float _448 = fma(_120, _398, _446);
        float _450 = sqrt(_436);
        float _452 = fma(_438, _438, _440);
        float _454 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].y, _448);
        float _456 = fma(_444, _444, _452);
        float _458 = _442 * _334;
        float _460 = rsqrt(_456);
        float _462 = fma(_458, -3.0, 3.0);
        float _464 = _458 * _458;
        float _466 = -_458;
        float _468 = _466 + 1.0;
        float _470 = _450 * 0.20000000298023223876953125;
        float _472 = _458 * _462;
        float _474 = _464 * 3.0;
        float _476 = _468 * _468;
        float _478 = _458 * _464;
        float _480 = precise::max(_470, 0.100000001490116119384765625);
        float _482 = _472 * 2.0;
        float _484 = _420 * _474;
        float _486 = _468 * _472;
        float _488 = -_482;
        float _490 = fma(_476, 3.0, _488);
        float _492 = _460 * _480;
        float _494 = -_474;
        float _496 = _494 + _482;
        float _498 = -_492;
        float _500 = fma(_432, _498, _454);
        float _502 = -_492;
        float _504 = fma(_438, _502, _426);
        float _506 = _500 * _496;
        float _508 = fma(_490, 0.00999999977648258209228515625, _506);
        float _510 = _426 * _474;
        float _512 = _426 * _478;
        float _514 = fma(_454, _474, _508);
        float _516 = -_492;
        float _518 = fma(_444, _516, _420);
        float _520 = fma(_504, _496, _510);
        float _522 = _514 * _514;
        float _524 = fma(_518, _496, _484);
        float _526 = _458 * _472;
        float _528 = _420 * _478;
        float _530 = fma(_520, _520, _522);
        float _532 = _500 * _526;
        float _534 = fma(_504, _526, _512);
        float _536 = fma(_524, _524, _530);
        float _538 = fma(_518, _526, _528);
        float _540 = fma(_486, 0.00999999977648258209228515625, _532);
        float _542 = rsqrt(_536);
        float _544 = fma(_454, _478, _540);
        float _546 = _514 * _542;
        float _548 = _524 * _542;
        float _550 = _520 * _542;
        float _552 = _546 * _546;
        float _554 = fma(_548, _548, _552);
        float _556 = rsqrt(_554);
        float _558 = _546 * _556;
        float _560 = _548 * _556;
        float _562 = -_558;
        float _564 = _546 * _562;
        float _566 = -_558;
        float _568 = _550 * _566;
        float _570 = -_558;
        float _572 = (-0.0) + _570;
        float _574 = -_550;
        float _576 = fma(_574, _560, -0.0);
        float _578 = -_564;
        float _580 = fma(_548, _560, _578);
        _582 = _560;
        _584 = 0.0;
        _586 = _572;
        _588 = _568;
        _590 = _580;
        _592 = _576;
        _594 = _546;
        _596 = _550;
        _598 = _548;
        _600 = _544;
        _602 = _534;
        _604 = _538;
        _606 = true;
    }
    else
    {
        float _608 = _334 * _334;
        float _610 = -_334;
        float _612 = _610 + 1.0;
        float _614 = fma(_334, -3.0, 3.0);
        float _616 = _612 * _612;
        float _618 = _614 * _334;
        float _620 = _608 * 3.0;
        float _622 = _618 * 2.0;
        float _624 = _612 * _618;
        float _626 = -_620;
        float _628 = _626 + _622;
        float _630 = -_622;
        float _632 = fma(_616, 3.0, _630);
        float _634 = _104 * _628;
        float _636 = _96 * _628;
        float _638 = _124 * _628;
        float _640 = fma(_120, _632, _634);
        float _642 = fma(_54, _632, _636);
        float _644 = fma(_60, _632, _638);
        float _646 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].y, _640);
        float _648 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].x, _642);
        float _650 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].z, _644);
        float _652 = _646 * _646;
        float _654 = fma(_648, _648, _652);
        float _656 = fma(_650, _650, _654);
        float _658 = rsqrt(_656);
        float _660 = _648 * _658;
        float _662 = _650 * _658;
        float _664 = _618 * _334;
        float _666 = _660 * _660;
        float _668 = _96 * _664;
        float _670 = _104 * _664;
        float _672 = fma(_662, _662, _666);
        float _674 = _124 * _664;
        float _676 = _608 * _334;
        float _678 = fma(_120, _624, _670);
        float _680 = fma(_54, _624, _668);
        float _682 = fma(_60, _624, _674);
        float _684 = rsqrt(_672);
        float _686 = _646 * _658;
        float _688 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].x, _680);
        float _690 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].y, _678);
        float _692 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].z, _682);
        float _694 = _660 * _684;
        float _696 = _662 * _684;
        float _698 = -_694;
        float _700 = _660 * _698;
        float _702 = -_694;
        float _704 = _686 * _702;
        float _706 = -_694;
        float _708 = (-0.0) + _706;
        float _710 = -_686;
        float _712 = fma(_710, _696, -0.0);
        float _714 = -_700;
        float _716 = fma(_662, _696, _714);
        _582 = _716;
        _584 = _704;
        _586 = _712;
        _588 = 0.0;
        _590 = _696;
        _592 = _708;
        _594 = _686;
        _596 = _660;
        _598 = _662;
        _600 = _690;
        _602 = _688;
        _604 = _692;
    }
    _606 = false;
    float _718 = _582;
    float _720 = _584;
    float _722 = _586;
    float _724 = _588;
    float _726 = _590;
    float _728 = _592;
    float _730 = _594;
    float _732 = _596;
    float _734 = _598;
    float _736 = _600;
    float _738 = _602;
    float _740 = _604;
    float _742 = in.m_26.y;
    bool _744 = _742 > 0.0;
    float _746 = _742;
    if (!_744)
    {
        float _748 = in.m_28.x;
        _746 = _748;
    }
    float _750 = _746;
    bool _752 = !_744;
    float _754 = _750;
    if (!_752)
    {
        float _756 = in.m_28.x;
        float _758 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
        float _760 = (-0.0) + _758;
        float _762 = fma(_48, -20.0, _760);
        float _764 = fma(_762, 0.100000001490116119384765625, 1.0);
        float _766 = precise::clamp(_764, 0.0, 1.0);
        int _768 = ~_336;
        float _770 = (_768 != 0) ? _766 : 0.0;
        float _772 = _770 * _342;
        float _774 = _370 * _770;
        float _776 = _770 * _756;
        _374 = _772;
        _754 = _776;
        _376 = _774;
    }
    float _778 = _374;
    float _780 = _754;
    float _782 = _376;
    float _784 = _718 * _778;
    float _786 = _720 * _778;
    float _788 = _722 * _778;
    float _790 = fma(_724, _780, _784);
    float _792 = fma(_726, _780, _786);
    float _794 = fma(_728, _780, _788);
    float _796 = fma(_730, _782, _790);
    float _798 = fma(_732, _782, _792);
    float _800 = fma(_734, _782, _794);
    float _802 = _796 + _736;
    float _804 = _798 + _738;
    float _806 = _800 + _740;
    float _808 = _802 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _810 = _802 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _812 = _802 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[2].x, _808);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[0].x, _810);
    float _818 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[1].x, _812);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[2].z, _814);
    float _822 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[0].z, _816);
    float _824 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[1].z, _818);
    float _826 = _820 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _828 = _822 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _830 = _824 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _834 = _826 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _838 = _828 + _836;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = _830 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _846 = sqrt(_842);
    float _848 = fma(_828, (*spvDescriptorSet0.vp_c4)._m0[2].x, _844);
    float _850 = fma(_826, (*spvDescriptorSet0.vp_c4)._m0[2].z, _848);
    float _852 = _850 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _854 = _846 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _856 = _850;
    float _858 = _826;
    float _860 = _828;
    float _862 = _852;
    if (!_854)
    {
        _856 = _826;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_854)
    {
        _858 = _830;
    }
    float _868 = _858;
    bool _870 = !_854;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _876 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _878 = _846 + _876;
        float _880 = _830 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _882 = rsqrt(_842);
        float _884 = _878 * _874;
        float _886 = _884 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = cos(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = sin(_892);
        float _896 = _890 + (-1.0);
        float _898 = _896 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _900 = fma(_894, _880, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _902 = fma(_830, _890, _898);
        float _904 = _882 * _900;
        float _906 = _902 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _908 = fma(_838, _904, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _910 = fma(_834, _904, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _912 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[2].x, _906);
        float _914 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[2].z, _912);
        float _916 = _914 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _872 = _902;
        _860 = _908;
        _866 = _910;
        _862 = _916;
    }
    float _918 = _872;
    float _920 = _860;
    float _922 = _866;
    float _924 = _862;
    float _926 = _918 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _928 = _918 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _930 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[1].x, _926);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[0].x, _928);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[1].z, _930);
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[0].z, _932);
    float _938 = _934 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _940 = _936 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _942 = _938 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _944 = _938 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _946 = _938 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _950 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[8].x, _942);
    float _952 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[7].x, _944);
    float _954 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[9].x, _946);
    float _956 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[10].x, _948);
    float _958 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].z, _950);
    float _960 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].z, _952);
    float _962 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].z, _954);
    float _964 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].z, _956);
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _968 = _960 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _970 = _962 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _972 = _964 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _968;
    out.gl_Position.y = _966;
    out.gl_Position.z = _970;
    out.gl_Position.w = _972;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _606 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    uint _42 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].w)) >> uint(16)));
    int _45 = int(_42) & 65535;
    float _48 = in.m_26.x;
    uint _50 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(8)));
    float _52 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].x))).x;
    float _54 = (-0.0) + _52;
    int _56 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w) & 255;
    float _58 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].z))).x;
    float _60 = (-0.0) + _58;
    uint _62 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].x)) >> uint(16)));
    int _64 = int(_62) & 65535;
    int _66 = int(_50) & 255;
    uint _68 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(16)));
    float _70 = float(_56);
    uint _72 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(24)));
    float _74 = float(_66);
    uint _76 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].y)) >> uint(16)));
    int _78 = int(_76) & 65535;
    float _80 = _70 * 0.0039215688593685626983642578125;
    float _82 = float2(as_type<half2>(uint(_45))).x;
    float _84 = (-0.0) + _82;
    uint _86 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].z)) >> uint(16)));
    int _88 = int(_86) & 65535;
    float _90 = abs(_84);
    float _92 = precise::max(_90, 0.100000001490116119384765625);
    float _94 = float2(as_type<half2>(uint(_64))).x;
    float _96 = (-0.0) + _94;
    float _98 = precise::min(_92, 20.0);
    float _100 = _98 * 0.0500000007450580596923828125;
    float _102 = float2(as_type<half2>(uint(_78))).x;
    float _104 = (-0.0) + _102;
    bool _108 = _100 >= _48;
    bool _110 = isnan(_100);
    bool _112 = _108 || _110;
    bool _114 = isnan(_48);
    bool _116 = _112 || _114;
    float _118 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].y))).x;
    float _120 = (-0.0) + _118;
    float _122 = float2(as_type<half2>(uint(_88))).x;
    float _124 = (-0.0) + _122;
    int _126 = 0;
    if (!_116)
    {
        _126 = -1;
    }
    int _128 = _126;
    float _130 = 0.0;
    int _132 = _128;
    int _134 = _128;
    if (!_116)
    {
        _130 = 1.0;
    }
    float _136 = _130;
    bool _138 = !_116;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / _98;
        float _144 = _142 * 20.0;
        float _146 = _144 * _48;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        bool _150 = _148 > 0.20000000298023223876953125;
        bool _152 = isnan(_148);
        bool _154 = _150 || _152;
        bool _156 = isnan(0.20000000298023223876953125);
        bool _158 = _154 || _156;
        float _160 = 0.0;
        float _162 = _144;
        float _164 = _148;
        if (!_158)
        {
            float _166 = _148 * 5.0;
            _160 = _166;
        }
        float _168 = _160;
        float _170 = _168;
        if (!_158)
        {
            _132 = 0;
        }
        int _172 = _132;
        int _174 = _172;
        _134 = _172;
        if (!_158)
        {
            float _176 = _80 * _168;
            _162 = _176;
        }
        float _178 = _162;
        bool _180 = !_158;
        float _182 = _178;
        _140 = _178;
        if (!_180)
        {
            bool _184 = _148 > 0.4000000059604644775390625;
            bool _186 = isnan(_148);
            bool _188 = _184 || _186;
            bool _190 = isnan(0.4000000059604644775390625);
            bool _192 = _188 || _190;
            if (!_192)
            {
                _170 = 1.0;
            }
            float _194 = _170;
            float _196 = _194;
            if (!_192)
            {
                float _198 = -_70;
                float _200 = _198 + _74;
                _182 = _200;
            }
            float _202 = _182;
            float _204 = _202;
            if (!_192)
            {
                _174 = 0;
            }
            int _206 = _174;
            int _208 = _206;
            _134 = _206;
            if (!_192)
            {
                float _210 = -_194;
                float _212 = fma(_148, 5.0, _210);
                _196 = _212;
            }
            float _214 = _196;
            float _216 = _214;
            if (!_192)
            {
                float _218 = fma(_214, _202, _70);
                _204 = _218;
            }
            float _220 = _204;
            float _222 = _220;
            if (!_192)
            {
                float _224 = _220 * 0.0039215688593685626983642578125;
                _222 = _224;
            }
            float _226 = _222;
            bool _228 = !_192;
            float _230 = _226;
            _140 = _226;
            if (!_228)
            {
                bool _232 = _148 > 0.60000002384185791015625;
                bool _234 = isnan(_148);
                bool _236 = _232 || _234;
                bool _238 = isnan(0.60000002384185791015625);
                bool _240 = _236 || _238;
                int _242 = int(_68) & 255;
                float _244 = float(_242);
                float _246 = _244;
                if (!_240)
                {
                    _216 = 4.999999523162841796875;
                }
                float _248 = _216;
                float _250 = _248;
                if (!_240)
                {
                    _208 = 0;
                }
                int _252 = _208;
                _134 = _252;
                if (!_240)
                {
                    float _254 = fma(_148, _248, -1.99999988079071044921875);
                    _230 = _254;
                }
                float _256 = _230;
                float _258 = _256;
                if (!_240)
                {
                    float _260 = -_74;
                    float _262 = _260 + _244;
                    _250 = _262;
                }
                float _264 = _250;
                if (!_240)
                {
                    float _266 = fma(_256, _264, _74);
                    _258 = _266;
                }
                float _268 = _258;
                float _270 = _268;
                if (!_240)
                {
                    float _272 = _268 * 0.0039215688593685626983642578125;
                    _270 = _272;
                }
                float _274 = _270;
                bool _276 = !_240;
                float _278 = _274;
                _140 = _274;
                if (!_276)
                {
                    bool _280 = _148 > 0.800000011920928955078125;
                    bool _282 = isnan(_148);
                    bool _284 = _280 || _282;
                    bool _286 = isnan(0.800000011920928955078125);
                    bool _288 = _284 || _286;
                    float _290 = float(int(_72));
                    float _292 = 0.0;
                    float _294 = _290;
                    _134 = 0;
                    if (!_288)
                    {
                        float _296 = fma(_148, 5.000000476837158203125, -3.000000476837158203125);
                        _292 = _296;
                    }
                    float _298 = _292;
                    if (!_288)
                    {
                        float _300 = -_244;
                        float _302 = _300 + _290;
                        _278 = _302;
                    }
                    float _304 = _278;
                    float _306 = _304;
                    if (_288)
                    {
                        float _308 = _290 * 0.0039215688593685626983642578125;
                        _294 = _308;
                    }
                    float _310 = _294;
                    if (_288)
                    {
                        float _312 = fma(_148, 5.000000476837158203125, -4.000000476837158203125);
                        _164 = _312;
                    }
                    float _314 = _164;
                    if (!_288)
                    {
                        float _316 = fma(_298, _304, _244);
                        _306 = _316;
                    }
                    float _318 = _306;
                    float _320 = _318;
                    if (_288)
                    {
                        float _322 = -_310;
                        float _324 = _322 + 1.0;
                        _246 = _324;
                    }
                    float _326 = _246;
                    if (!_288)
                    {
                        float _328 = _318 * 0.0039215688593685626983642578125;
                        _320 = _328;
                    }
                    float _330 = _320;
                    _140 = _330;
                    if (_288)
                    {
                        float _332 = fma(_314, _326, _310);
                        _140 = _332;
                    }
                }
            }
        }
    }
    float _334 = _140;
    int _336 = _134;
    float _338 = -_70;
    float _340 = _338 + _74;
    float _342 = in.m_28.y;
    float _344 = fma(_340, 0.0019607846625149250030517578125, _80);
    float _346 = in.m_28.z;
    bool _348 = _334 >= _344;
    bool _350 = isnan(_334);
    bool _352 = _348 || _350;
    bool _354 = isnan(_344);
    bool _356 = _352 || _354;
    float _358 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
    bool _360 = 0.0 > _358;
    bool _362 = !_356;
    bool _364 = _360 && _362;
    bool _366 = _342 >= 0.0;
    bool _368 = _366 && _364;
    float _370 = fma(_48, -20.0, _346);
    bool _372 = !_368;
    float _374 = _342;
    float _376 = _370;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    float _594;
    float _596;
    float _598;
    float _600;
    float _602;
    float _604;
    if (!_372)
    {
        float _378 = _344 * _344;
        float _380 = -_344;
        float _382 = _380 + 1.0;
        float _384 = fma(_344, -3.0, 3.0);
        float _386 = _378 * 3.0;
        float _388 = _344 * _378;
        float _390 = _344 * _384;
        float _392 = _382 * _382;
        float _394 = _344 * _390;
        float _396 = _390 * 2.0;
        float _398 = _382 * _390;
        float _400 = _124 * _394;
        float _402 = -_386;
        float _404 = _402 + _396;
        float _406 = -_396;
        float _408 = fma(_392, 3.0, _406);
        float _410 = _96 * _394;
        float _412 = fma(_60, _398, _400);
        float _414 = _104 * _404;
        float _416 = _124 * _404;
        float _418 = fma(_54, _398, _410);
        float _420 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].z, _412);
        float _422 = _96 * _404;
        float _424 = fma(_120, _408, _414);
        float _426 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].x, _418);
        float _428 = _420 * _420;
        float _430 = fma(_54, _408, _422);
        float _432 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].y, _424);
        float _434 = fma(_60, _408, _416);
        float _436 = fma(_426, _426, _428);
        float _438 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].x, _430);
        float _440 = _432 * _432;
        float _442 = 1.0 / _344;
        float _444 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].z, _434);
        float _446 = _104 * _394;
        float _448 = fma(_120, _398, _446);
        float _450 = sqrt(_436);
        float _452 = fma(_438, _438, _440);
        float _454 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].y, _448);
        float _456 = fma(_444, _444, _452);
        float _458 = _442 * _334;
        float _460 = rsqrt(_456);
        float _462 = fma(_458, -3.0, 3.0);
        float _464 = _458 * _458;
        float _466 = -_458;
        float _468 = _466 + 1.0;
        float _470 = _450 * 0.20000000298023223876953125;
        float _472 = _458 * _462;
        float _474 = _464 * 3.0;
        float _476 = _468 * _468;
        float _478 = _458 * _464;
        float _480 = precise::max(_470, 0.100000001490116119384765625);
        float _482 = _472 * 2.0;
        float _484 = _420 * _474;
        float _486 = _468 * _472;
        float _488 = -_482;
        float _490 = fma(_476, 3.0, _488);
        float _492 = _460 * _480;
        float _494 = -_474;
        float _496 = _494 + _482;
        float _498 = -_492;
        float _500 = fma(_432, _498, _454);
        float _502 = -_492;
        float _504 = fma(_438, _502, _426);
        float _506 = _500 * _496;
        float _508 = fma(_490, 0.00999999977648258209228515625, _506);
        float _510 = _426 * _474;
        float _512 = _426 * _478;
        float _514 = fma(_454, _474, _508);
        float _516 = -_492;
        float _518 = fma(_444, _516, _420);
        float _520 = fma(_504, _496, _510);
        float _522 = _514 * _514;
        float _524 = fma(_518, _496, _484);
        float _526 = _458 * _472;
        float _528 = _420 * _478;
        float _530 = fma(_520, _520, _522);
        float _532 = _500 * _526;
        float _534 = fma(_504, _526, _512);
        float _536 = fma(_524, _524, _530);
        float _538 = fma(_518, _526, _528);
        float _540 = fma(_486, 0.00999999977648258209228515625, _532);
        float _542 = rsqrt(_536);
        float _544 = fma(_454, _478, _540);
        float _546 = _514 * _542;
        float _548 = _524 * _542;
        float _550 = _520 * _542;
        float _552 = _546 * _546;
        float _554 = fma(_548, _548, _552);
        float _556 = rsqrt(_554);
        float _558 = _546 * _556;
        float _560 = _548 * _556;
        float _562 = -_558;
        float _564 = _546 * _562;
        float _566 = -_558;
        float _568 = _550 * _566;
        float _570 = -_558;
        float _572 = (-0.0) + _570;
        float _574 = -_550;
        float _576 = fma(_574, _560, -0.0);
        float _578 = -_564;
        float _580 = fma(_548, _560, _578);
        _582 = _560;
        _584 = 0.0;
        _586 = _572;
        _588 = _568;
        _590 = _580;
        _592 = _576;
        _594 = _546;
        _596 = _550;
        _598 = _548;
        _600 = _544;
        _602 = _534;
        _604 = _538;
        _606 = true;
    }
    else
    {
        float _608 = _334 * _334;
        float _610 = -_334;
        float _612 = _610 + 1.0;
        float _614 = fma(_334, -3.0, 3.0);
        float _616 = _612 * _612;
        float _618 = _614 * _334;
        float _620 = _608 * 3.0;
        float _622 = _618 * 2.0;
        float _624 = _612 * _618;
        float _626 = -_620;
        float _628 = _626 + _622;
        float _630 = -_622;
        float _632 = fma(_616, 3.0, _630);
        float _634 = _104 * _628;
        float _636 = _96 * _628;
        float _638 = _124 * _628;
        float _640 = fma(_120, _632, _634);
        float _642 = fma(_54, _632, _636);
        float _644 = fma(_60, _632, _638);
        float _646 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].y, _640);
        float _648 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].x, _642);
        float _650 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].z, _644);
        float _652 = _646 * _646;
        float _654 = fma(_648, _648, _652);
        float _656 = fma(_650, _650, _654);
        float _658 = rsqrt(_656);
        float _660 = _648 * _658;
        float _662 = _650 * _658;
        float _664 = _618 * _334;
        float _666 = _660 * _660;
        float _668 = _96 * _664;
        float _670 = _104 * _664;
        float _672 = fma(_662, _662, _666);
        float _674 = _124 * _664;
        float _676 = _608 * _334;
        float _678 = fma(_120, _624, _670);
        float _680 = fma(_54, _624, _668);
        float _682 = fma(_60, _624, _674);
        float _684 = rsqrt(_672);
        float _686 = _646 * _658;
        float _688 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].x, _680);
        float _690 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].y, _678);
        float _692 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].z, _682);
        float _694 = _660 * _684;
        float _696 = _662 * _684;
        float _698 = -_694;
        float _700 = _660 * _698;
        float _702 = -_694;
        float _704 = _686 * _702;
        float _706 = -_694;
        float _708 = (-0.0) + _706;
        float _710 = -_686;
        float _712 = fma(_710, _696, -0.0);
        float _714 = -_700;
        float _716 = fma(_662, _696, _714);
        _582 = _716;
        _584 = _704;
        _586 = _712;
        _588 = 0.0;
        _590 = _696;
        _592 = _708;
        _594 = _686;
        _596 = _660;
        _598 = _662;
        _600 = _690;
        _602 = _688;
        _604 = _692;
    }
    _606 = false;
    float _718 = _582;
    float _720 = _584;
    float _722 = _586;
    float _724 = _588;
    float _726 = _590;
    float _728 = _592;
    float _730 = _594;
    float _732 = _596;
    float _734 = _598;
    float _736 = _600;
    float _738 = _602;
    float _740 = _604;
    float _742 = in.m_26.y;
    bool _744 = _742 > 0.0;
    float _746 = _742;
    if (!_744)
    {
        float _748 = in.m_28.x;
        _746 = _748;
    }
    float _750 = _746;
    bool _752 = !_744;
    float _754 = _750;
    if (!_752)
    {
        float _756 = in.m_28.x;
        float _758 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
        float _760 = (-0.0) + _758;
        float _762 = fma(_48, -20.0, _760);
        float _764 = fma(_762, 0.100000001490116119384765625, 1.0);
        float _766 = precise::clamp(_764, 0.0, 1.0);
        int _768 = ~_336;
        float _770 = (_768 != 0) ? _766 : 0.0;
        float _772 = _770 * _342;
        float _774 = _370 * _770;
        float _776 = _770 * _756;
        _374 = _772;
        _754 = _776;
        _376 = _774;
    }
    float _778 = _374;
    float _780 = _754;
    float _782 = _376;
    float _784 = _718 * _778;
    float _786 = _720 * _778;
    float _788 = _722 * _778;
    float _790 = fma(_724, _780, _784);
    float _792 = fma(_726, _780, _786);
    float _794 = fma(_728, _780, _788);
    float _796 = fma(_730, _782, _790);
    float _798 = fma(_732, _782, _792);
    float _800 = fma(_734, _782, _794);
    float _802 = _796 + _736;
    float _804 = _798 + _738;
    float _806 = _800 + _740;
    float _808 = _802 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _810 = _802 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _812 = _802 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[2].x, _808);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[0].x, _810);
    float _818 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[1].x, _812);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[2].z, _814);
    float _822 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[0].z, _816);
    float _824 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[1].z, _818);
    float _826 = _820 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _828 = _822 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _830 = _824 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _834 = _826 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _838 = _828 + _836;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = _830 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _846 = sqrt(_842);
    float _848 = fma(_828, (*spvDescriptorSet0.vp_c4)._m0[2].x, _844);
    float _850 = fma(_826, (*spvDescriptorSet0.vp_c4)._m0[2].z, _848);
    float _852 = _850 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _854 = _846 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _856 = _850;
    float _858 = _826;
    float _860 = _828;
    float _862 = _852;
    if (!_854)
    {
        _856 = _826;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_854)
    {
        _858 = _830;
    }
    float _868 = _858;
    bool _870 = !_854;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _876 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _878 = _846 + _876;
        float _880 = _830 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _882 = rsqrt(_842);
        float _884 = _878 * _874;
        float _886 = _884 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = cos(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = sin(_892);
        float _896 = _890 + (-1.0);
        float _898 = _896 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _900 = fma(_894, _880, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _902 = fma(_830, _890, _898);
        float _904 = _882 * _900;
        float _906 = _902 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _908 = fma(_838, _904, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _910 = fma(_834, _904, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _912 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[2].x, _906);
        float _914 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[2].z, _912);
        float _916 = _914 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _872 = _902;
        _860 = _908;
        _866 = _910;
        _862 = _916;
    }
    float _918 = _872;
    float _920 = _860;
    float _922 = _866;
    float _924 = _862;
    float _926 = _918 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _928 = _918 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _930 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[1].x, _926);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[0].x, _928);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[1].z, _930);
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[0].z, _932);
    float _938 = _934 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _940 = _936 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _942 = _938 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _944 = _938 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _946 = _938 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _950 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[8].x, _942);
    float _952 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[7].x, _944);
    float _954 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[9].x, _946);
    float _956 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[10].x, _948);
    float _958 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].z, _950);
    float _960 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].z, _952);
    float _962 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].z, _954);
    float _964 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].z, _956);
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _968 = _960 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _970 = _962 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _972 = _964 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _968;
    out.gl_Position.y = _966;
    out.gl_Position.z = _970;
    out.gl_Position.w = _972;
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
    bool _606 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    uint _42 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].w)) >> uint(16)));
    int _45 = int(_42) & 65535;
    float _48 = in.m_26.x;
    uint _50 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(8)));
    float _52 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].x))).x;
    float _54 = (-0.0) + _52;
    int _56 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w) & 255;
    float _58 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].z))).x;
    float _60 = (-0.0) + _58;
    uint _62 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].x)) >> uint(16)));
    int _64 = int(_62) & 65535;
    int _66 = int(_50) & 255;
    uint _68 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(16)));
    float _70 = float(_56);
    uint _72 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[10].w)) >> uint(24)));
    float _74 = float(_66);
    uint _76 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].y)) >> uint(16)));
    int _78 = int(_76) & 65535;
    float _80 = _70 * 0.0039215688593685626983642578125;
    float _82 = float2(as_type<half2>(uint(_45))).x;
    float _84 = (-0.0) + _82;
    uint _86 = uint(int(uint(as_type<int>((*spvDescriptorSet0.vp_c7)._m0[15].z)) >> uint(16)));
    int _88 = int(_86) & 65535;
    float _90 = abs(_84);
    float _92 = precise::max(_90, 0.100000001490116119384765625);
    float _94 = float2(as_type<half2>(uint(_64))).x;
    float _96 = (-0.0) + _94;
    float _98 = precise::min(_92, 20.0);
    float _100 = _98 * 0.0500000007450580596923828125;
    float _102 = float2(as_type<half2>(uint(_78))).x;
    float _104 = (-0.0) + _102;
    bool _108 = _100 >= _48;
    bool _110 = isnan(_100);
    bool _112 = _108 || _110;
    bool _114 = isnan(_48);
    bool _116 = _112 || _114;
    float _118 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].y))).x;
    float _120 = (-0.0) + _118;
    float _122 = float2(as_type<half2>(uint(_88))).x;
    float _124 = (-0.0) + _122;
    int _126 = 0;
    if (!_116)
    {
        _126 = -1;
    }
    int _128 = _126;
    float _130 = 0.0;
    int _132 = _128;
    int _134 = _128;
    if (!_116)
    {
        _130 = 1.0;
    }
    float _136 = _130;
    bool _138 = !_116;
    float _140 = _136;
    if (!_138)
    {
        float _142 = 1.0 / _98;
        float _144 = _142 * 20.0;
        float _146 = _144 * _48;
        float _148 = precise::clamp(_146, 0.0, 1.0);
        bool _150 = _148 > 0.20000000298023223876953125;
        bool _152 = isnan(_148);
        bool _154 = _150 || _152;
        bool _156 = isnan(0.20000000298023223876953125);
        bool _158 = _154 || _156;
        float _160 = 0.0;
        float _162 = _144;
        float _164 = _148;
        if (!_158)
        {
            float _166 = _148 * 5.0;
            _160 = _166;
        }
        float _168 = _160;
        float _170 = _168;
        if (!_158)
        {
            _132 = 0;
        }
        int _172 = _132;
        int _174 = _172;
        _134 = _172;
        if (!_158)
        {
            float _176 = _80 * _168;
            _162 = _176;
        }
        float _178 = _162;
        bool _180 = !_158;
        float _182 = _178;
        _140 = _178;
        if (!_180)
        {
            bool _184 = _148 > 0.4000000059604644775390625;
            bool _186 = isnan(_148);
            bool _188 = _184 || _186;
            bool _190 = isnan(0.4000000059604644775390625);
            bool _192 = _188 || _190;
            if (!_192)
            {
                _170 = 1.0;
            }
            float _194 = _170;
            float _196 = _194;
            if (!_192)
            {
                float _198 = -_70;
                float _200 = _198 + _74;
                _182 = _200;
            }
            float _202 = _182;
            float _204 = _202;
            if (!_192)
            {
                _174 = 0;
            }
            int _206 = _174;
            int _208 = _206;
            _134 = _206;
            if (!_192)
            {
                float _210 = -_194;
                float _212 = fma(_148, 5.0, _210);
                _196 = _212;
            }
            float _214 = _196;
            float _216 = _214;
            if (!_192)
            {
                float _218 = fma(_214, _202, _70);
                _204 = _218;
            }
            float _220 = _204;
            float _222 = _220;
            if (!_192)
            {
                float _224 = _220 * 0.0039215688593685626983642578125;
                _222 = _224;
            }
            float _226 = _222;
            bool _228 = !_192;
            float _230 = _226;
            _140 = _226;
            if (!_228)
            {
                bool _232 = _148 > 0.60000002384185791015625;
                bool _234 = isnan(_148);
                bool _236 = _232 || _234;
                bool _238 = isnan(0.60000002384185791015625);
                bool _240 = _236 || _238;
                int _242 = int(_68) & 255;
                float _244 = float(_242);
                float _246 = _244;
                if (!_240)
                {
                    _216 = 4.999999523162841796875;
                }
                float _248 = _216;
                float _250 = _248;
                if (!_240)
                {
                    _208 = 0;
                }
                int _252 = _208;
                _134 = _252;
                if (!_240)
                {
                    float _254 = fma(_148, _248, -1.99999988079071044921875);
                    _230 = _254;
                }
                float _256 = _230;
                float _258 = _256;
                if (!_240)
                {
                    float _260 = -_74;
                    float _262 = _260 + _244;
                    _250 = _262;
                }
                float _264 = _250;
                if (!_240)
                {
                    float _266 = fma(_256, _264, _74);
                    _258 = _266;
                }
                float _268 = _258;
                float _270 = _268;
                if (!_240)
                {
                    float _272 = _268 * 0.0039215688593685626983642578125;
                    _270 = _272;
                }
                float _274 = _270;
                bool _276 = !_240;
                float _278 = _274;
                _140 = _274;
                if (!_276)
                {
                    bool _280 = _148 > 0.800000011920928955078125;
                    bool _282 = isnan(_148);
                    bool _284 = _280 || _282;
                    bool _286 = isnan(0.800000011920928955078125);
                    bool _288 = _284 || _286;
                    float _290 = float(int(_72));
                    float _292 = 0.0;
                    float _294 = _290;
                    _134 = 0;
                    if (!_288)
                    {
                        float _296 = fma(_148, 5.000000476837158203125, -3.000000476837158203125);
                        _292 = _296;
                    }
                    float _298 = _292;
                    if (!_288)
                    {
                        float _300 = -_244;
                        float _302 = _300 + _290;
                        _278 = _302;
                    }
                    float _304 = _278;
                    float _306 = _304;
                    if (_288)
                    {
                        float _308 = _290 * 0.0039215688593685626983642578125;
                        _294 = _308;
                    }
                    float _310 = _294;
                    if (_288)
                    {
                        float _312 = fma(_148, 5.000000476837158203125, -4.000000476837158203125);
                        _164 = _312;
                    }
                    float _314 = _164;
                    if (!_288)
                    {
                        float _316 = fma(_298, _304, _244);
                        _306 = _316;
                    }
                    float _318 = _306;
                    float _320 = _318;
                    if (_288)
                    {
                        float _322 = -_310;
                        float _324 = _322 + 1.0;
                        _246 = _324;
                    }
                    float _326 = _246;
                    if (!_288)
                    {
                        float _328 = _318 * 0.0039215688593685626983642578125;
                        _320 = _328;
                    }
                    float _330 = _320;
                    _140 = _330;
                    if (_288)
                    {
                        float _332 = fma(_314, _326, _310);
                        _140 = _332;
                    }
                }
            }
        }
    }
    float _334 = _140;
    int _336 = _134;
    float _338 = -_70;
    float _340 = _338 + _74;
    float _342 = in.m_28.y;
    float _344 = fma(_340, 0.0019607846625149250030517578125, _80);
    float _346 = in.m_28.z;
    bool _348 = _334 >= _344;
    bool _350 = isnan(_334);
    bool _352 = _348 || _350;
    bool _354 = isnan(_344);
    bool _356 = _352 || _354;
    float _358 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
    bool _360 = 0.0 > _358;
    bool _362 = !_356;
    bool _364 = _360 && _362;
    bool _366 = _342 >= 0.0;
    bool _368 = _366 && _364;
    float _370 = fma(_48, -20.0, _346);
    bool _372 = !_368;
    float _374 = _342;
    float _376 = _370;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    float _594;
    float _596;
    float _598;
    float _600;
    float _602;
    float _604;
    if (!_372)
    {
        float _378 = _344 * _344;
        float _380 = -_344;
        float _382 = _380 + 1.0;
        float _384 = fma(_344, -3.0, 3.0);
        float _386 = _378 * 3.0;
        float _388 = _344 * _378;
        float _390 = _344 * _384;
        float _392 = _382 * _382;
        float _394 = _344 * _390;
        float _396 = _390 * 2.0;
        float _398 = _382 * _390;
        float _400 = _124 * _394;
        float _402 = -_386;
        float _404 = _402 + _396;
        float _406 = -_396;
        float _408 = fma(_392, 3.0, _406);
        float _410 = _96 * _394;
        float _412 = fma(_60, _398, _400);
        float _414 = _104 * _404;
        float _416 = _124 * _404;
        float _418 = fma(_54, _398, _410);
        float _420 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].z, _412);
        float _422 = _96 * _404;
        float _424 = fma(_120, _408, _414);
        float _426 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].x, _418);
        float _428 = _420 * _420;
        float _430 = fma(_54, _408, _422);
        float _432 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].y, _424);
        float _434 = fma(_60, _408, _416);
        float _436 = fma(_426, _426, _428);
        float _438 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].x, _430);
        float _440 = _432 * _432;
        float _442 = 1.0 / _344;
        float _444 = fma(_386, (*spvDescriptorSet0.vp_c7)._m0[10].z, _434);
        float _446 = _104 * _394;
        float _448 = fma(_120, _398, _446);
        float _450 = sqrt(_436);
        float _452 = fma(_438, _438, _440);
        float _454 = fma(_388, (*spvDescriptorSet0.vp_c7)._m0[10].y, _448);
        float _456 = fma(_444, _444, _452);
        float _458 = _442 * _334;
        float _460 = rsqrt(_456);
        float _462 = fma(_458, -3.0, 3.0);
        float _464 = _458 * _458;
        float _466 = -_458;
        float _468 = _466 + 1.0;
        float _470 = _450 * 0.20000000298023223876953125;
        float _472 = _458 * _462;
        float _474 = _464 * 3.0;
        float _476 = _468 * _468;
        float _478 = _458 * _464;
        float _480 = precise::max(_470, 0.100000001490116119384765625);
        float _482 = _472 * 2.0;
        float _484 = _420 * _474;
        float _486 = _468 * _472;
        float _488 = -_482;
        float _490 = fma(_476, 3.0, _488);
        float _492 = _460 * _480;
        float _494 = -_474;
        float _496 = _494 + _482;
        float _498 = -_492;
        float _500 = fma(_432, _498, _454);
        float _502 = -_492;
        float _504 = fma(_438, _502, _426);
        float _506 = _500 * _496;
        float _508 = fma(_490, 0.00999999977648258209228515625, _506);
        float _510 = _426 * _474;
        float _512 = _426 * _478;
        float _514 = fma(_454, _474, _508);
        float _516 = -_492;
        float _518 = fma(_444, _516, _420);
        float _520 = fma(_504, _496, _510);
        float _522 = _514 * _514;
        float _524 = fma(_518, _496, _484);
        float _526 = _458 * _472;
        float _528 = _420 * _478;
        float _530 = fma(_520, _520, _522);
        float _532 = _500 * _526;
        float _534 = fma(_504, _526, _512);
        float _536 = fma(_524, _524, _530);
        float _538 = fma(_518, _526, _528);
        float _540 = fma(_486, 0.00999999977648258209228515625, _532);
        float _542 = rsqrt(_536);
        float _544 = fma(_454, _478, _540);
        float _546 = _514 * _542;
        float _548 = _524 * _542;
        float _550 = _520 * _542;
        float _552 = _546 * _546;
        float _554 = fma(_548, _548, _552);
        float _556 = rsqrt(_554);
        float _558 = _546 * _556;
        float _560 = _548 * _556;
        float _562 = -_558;
        float _564 = _546 * _562;
        float _566 = -_558;
        float _568 = _550 * _566;
        float _570 = -_558;
        float _572 = (-0.0) + _570;
        float _574 = -_550;
        float _576 = fma(_574, _560, -0.0);
        float _578 = -_564;
        float _580 = fma(_548, _560, _578);
        _582 = _560;
        _584 = 0.0;
        _586 = _572;
        _588 = _568;
        _590 = _580;
        _592 = _576;
        _594 = _546;
        _596 = _550;
        _598 = _548;
        _600 = _544;
        _602 = _534;
        _604 = _538;
        _606 = true;
    }
    else
    {
        float _608 = _334 * _334;
        float _610 = -_334;
        float _612 = _610 + 1.0;
        float _614 = fma(_334, -3.0, 3.0);
        float _616 = _612 * _612;
        float _618 = _614 * _334;
        float _620 = _608 * 3.0;
        float _622 = _618 * 2.0;
        float _624 = _612 * _618;
        float _626 = -_620;
        float _628 = _626 + _622;
        float _630 = -_622;
        float _632 = fma(_616, 3.0, _630);
        float _634 = _104 * _628;
        float _636 = _96 * _628;
        float _638 = _124 * _628;
        float _640 = fma(_120, _632, _634);
        float _642 = fma(_54, _632, _636);
        float _644 = fma(_60, _632, _638);
        float _646 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].y, _640);
        float _648 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].x, _642);
        float _650 = fma(_620, (*spvDescriptorSet0.vp_c7)._m0[10].z, _644);
        float _652 = _646 * _646;
        float _654 = fma(_648, _648, _652);
        float _656 = fma(_650, _650, _654);
        float _658 = rsqrt(_656);
        float _660 = _648 * _658;
        float _662 = _650 * _658;
        float _664 = _618 * _334;
        float _666 = _660 * _660;
        float _668 = _96 * _664;
        float _670 = _104 * _664;
        float _672 = fma(_662, _662, _666);
        float _674 = _124 * _664;
        float _676 = _608 * _334;
        float _678 = fma(_120, _624, _670);
        float _680 = fma(_54, _624, _668);
        float _682 = fma(_60, _624, _674);
        float _684 = rsqrt(_672);
        float _686 = _646 * _658;
        float _688 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].x, _680);
        float _690 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].y, _678);
        float _692 = fma(_676, (*spvDescriptorSet0.vp_c7)._m0[10].z, _682);
        float _694 = _660 * _684;
        float _696 = _662 * _684;
        float _698 = -_694;
        float _700 = _660 * _698;
        float _702 = -_694;
        float _704 = _686 * _702;
        float _706 = -_694;
        float _708 = (-0.0) + _706;
        float _710 = -_686;
        float _712 = fma(_710, _696, -0.0);
        float _714 = -_700;
        float _716 = fma(_662, _696, _714);
        _582 = _716;
        _584 = _704;
        _586 = _712;
        _588 = 0.0;
        _590 = _696;
        _592 = _708;
        _594 = _686;
        _596 = _660;
        _598 = _662;
        _600 = _690;
        _602 = _688;
        _604 = _692;
    }
    _606 = false;
    float _718 = _582;
    float _720 = _584;
    float _722 = _586;
    float _724 = _588;
    float _726 = _590;
    float _728 = _592;
    float _730 = _594;
    float _732 = _596;
    float _734 = _598;
    float _736 = _600;
    float _738 = _602;
    float _740 = _604;
    float _742 = in.m_26.y;
    bool _744 = _742 > 0.0;
    float _746 = _742;
    if (!_744)
    {
        float _748 = in.m_28.x;
        _746 = _748;
    }
    float _750 = _746;
    bool _752 = !_744;
    float _754 = _750;
    if (!_752)
    {
        float _756 = in.m_28.x;
        float _758 = float2(as_type<half2>(as_type<uint>((*spvDescriptorSet0.vp_c7)._m0[15].w))).x;
        float _760 = (-0.0) + _758;
        float _762 = fma(_48, -20.0, _760);
        float _764 = fma(_762, 0.100000001490116119384765625, 1.0);
        float _766 = precise::clamp(_764, 0.0, 1.0);
        int _768 = ~_336;
        float _770 = (_768 != 0) ? _766 : 0.0;
        float _772 = _770 * _342;
        float _774 = _370 * _770;
        float _776 = _770 * _756;
        _374 = _772;
        _754 = _776;
        _376 = _774;
    }
    float _778 = _374;
    float _780 = _754;
    float _782 = _376;
    float _784 = _718 * _778;
    float _786 = _720 * _778;
    float _788 = _722 * _778;
    float _790 = fma(_724, _780, _784);
    float _792 = fma(_726, _780, _786);
    float _794 = fma(_728, _780, _788);
    float _796 = fma(_730, _782, _790);
    float _798 = fma(_732, _782, _792);
    float _800 = fma(_734, _782, _794);
    float _802 = _796 + _736;
    float _804 = _798 + _738;
    float _806 = _800 + _740;
    float _808 = _802 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _810 = _802 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _812 = _802 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[2].x, _808);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[0].x, _810);
    float _818 = fma(_804, (*spvDescriptorSet0.vp_c7)._m0[1].x, _812);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[2].z, _814);
    float _822 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[0].z, _816);
    float _824 = fma(_806, (*spvDescriptorSet0.vp_c7)._m0[1].z, _818);
    float _826 = _820 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _828 = _822 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _830 = _824 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _834 = _826 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _838 = _828 + _836;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = _830 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _846 = sqrt(_842);
    float _848 = fma(_828, (*spvDescriptorSet0.vp_c4)._m0[2].x, _844);
    float _850 = fma(_826, (*spvDescriptorSet0.vp_c4)._m0[2].z, _848);
    float _852 = _850 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _854 = _846 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _856 = _850;
    float _858 = _826;
    float _860 = _828;
    float _862 = _852;
    if (!_854)
    {
        _856 = _826;
    }
    float _864 = _856;
    float _866 = _864;
    if (!_854)
    {
        _858 = _830;
    }
    float _868 = _858;
    bool _870 = !_854;
    float _872 = _868;
    if (!_870)
    {
        float _874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _876 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _878 = _846 + _876;
        float _880 = _830 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _882 = rsqrt(_842);
        float _884 = _878 * _874;
        float _886 = _884 * 0.15915493667125701904296875;
        float _888 = _886 * 6.283185482025146484375;
        float _890 = cos(_888);
        float _892 = _886 * 6.283185482025146484375;
        float _894 = sin(_892);
        float _896 = _890 + (-1.0);
        float _898 = _896 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _900 = fma(_894, _880, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _902 = fma(_830, _890, _898);
        float _904 = _882 * _900;
        float _906 = _902 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _908 = fma(_838, _904, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _910 = fma(_834, _904, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _912 = fma(_908, (*spvDescriptorSet0.vp_c4)._m0[2].x, _906);
        float _914 = fma(_910, (*spvDescriptorSet0.vp_c4)._m0[2].z, _912);
        float _916 = _914 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _872 = _902;
        _860 = _908;
        _866 = _910;
        _862 = _916;
    }
    float _918 = _872;
    float _920 = _860;
    float _922 = _866;
    float _924 = _862;
    float _926 = _918 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _928 = _918 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _930 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[1].x, _926);
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c4)._m0[0].x, _928);
    float _934 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[1].z, _930);
    float _936 = fma(_922, (*spvDescriptorSet0.vp_c4)._m0[0].z, _932);
    float _938 = _934 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _940 = _936 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _942 = _938 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _944 = _938 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _946 = _938 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _950 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[8].x, _942);
    float _952 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[7].x, _944);
    float _954 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[9].x, _946);
    float _956 = fma(_940, (*spvDescriptorSet0.vp_c4)._m0[10].x, _948);
    float _958 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[8].z, _950);
    float _960 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[7].z, _952);
    float _962 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[9].z, _954);
    float _964 = fma(_924, (*spvDescriptorSet0.vp_c4)._m0[10].z, _956);
    float _966 = _958 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _968 = _960 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _970 = _962 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _972 = _964 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _968;
    out.gl_Position.y = _966;
    out.gl_Position.z = _970;
    out.gl_Position.w = _972;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

