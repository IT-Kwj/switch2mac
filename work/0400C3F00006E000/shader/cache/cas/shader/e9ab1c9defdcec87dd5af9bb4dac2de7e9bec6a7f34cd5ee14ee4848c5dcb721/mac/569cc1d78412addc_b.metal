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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c5 [[id(1)]];
    constant _16* vp_c12 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
    constant _16* vp_c9 [[id(5)]];
    const device _31* vp_s0 [[id(6)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(0)]];
    float4 m_48 [[attribute(4)]];
    uint4 m_46 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _3020 = false;
    bool _188 = false;
    bool _2146 = false;
    bool _800 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    bool _63 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[8].w);
    bool _65 = !_63;
    float _182;
    float _184;
    float _186;
    if (!_65)
    {
        bool _67 = 0 != as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
        if (!_67)
        {
            float _70 = as_type<float>(int(gl_InstanceIndex));
            float _72 = as_type<float>(int(gl_BaseInstance));
            int _75 = as_type<int>(_70) - as_type<int>(_72);
            float _77 = in.m_42.x;
            float _79 = in.m_42.y;
            float _81 = in.m_42.z;
            int _83 = _75 + as_type<int>(as_type<float>(gl_BaseInstance));
            int _85 = _83 * 80;
            int _87 = _85 + 16;
            int _89 = _85 + 32;
            uint _92 = uint(int(uint(_85) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_92)];
            float _94 = as_type<float>(_dmw0.x);
            int _96 = _85 + 4;
            uint _98 = uint(int(uint(_96) >> uint(2)));
            float _100 = as_type<float>(_dmw0.y);
            int _102 = _85 + 8;
            uint _104 = uint(int(uint(_102) >> uint(2)));
            float _106 = as_type<float>(_dmw0.z);
            int _108 = _85 + 12;
            uint _110 = uint(int(uint(_108) >> uint(2)));
            float _112 = as_type<float>(_dmw0.w);
            uint _114 = uint(int(uint(_87) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_114)];
            float _116 = as_type<float>(_dmw1.x);
            int _118 = _87 + 4;
            uint _120 = uint(int(uint(_118) >> uint(2)));
            float _122 = as_type<float>(_dmw1.y);
            int _124 = _87 + 8;
            uint _126 = uint(int(uint(_124) >> uint(2)));
            float _128 = as_type<float>(_dmw1.z);
            int _130 = _87 + 12;
            uint _132 = uint(int(uint(_130) >> uint(2)));
            float _134 = as_type<float>(_dmw1.w);
            uint _136 = uint(int(uint(_89) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_136)];
            float _138 = as_type<float>(_dmw2.x);
            int _140 = _89 + 4;
            uint _142 = uint(int(uint(_140) >> uint(2)));
            float _144 = as_type<float>(_dmw2.y);
            int _146 = _89 + 8;
            uint _148 = uint(int(uint(_146) >> uint(2)));
            float _150 = as_type<float>(_dmw2.z);
            int _152 = _89 + 12;
            uint _154 = uint(int(uint(_152) >> uint(2)));
            float _156 = as_type<float>(_dmw2.w);
            float _158 = _100 * _79;
            float _160 = _122 * _79;
            float _162 = fma(_94, _77, _158);
            float _164 = _144 * _79;
            float _166 = fma(_116, _77, _160);
            float _168 = fma(_106, _81, _162);
            float _170 = fma(_138, _77, _164);
            float _172 = fma(_128, _81, _166);
            float _174 = _112 + _168;
            float _176 = fma(_150, _81, _170);
            float _178 = _134 + _172;
            float _180 = _156 + _176;
            _182 = _178;
            _184 = _174;
            _186 = _180;
            _188 = true;
        }
        else
        {
            float _190 = as_type<float>(in.m_46.x);
            float _192 = as_type<float>(in.m_46.y);
            float _194 = as_type<float>(in.m_46.z);
            float _196 = as_type<float>(in.m_46.w);
            float _198 = in.m_42.x;
            float _200 = in.m_42.y;
            float _202 = in.m_42.z;
            int _204 = as_type<int>(_190) * 48;
            int _206 = _204 + 16;
            uint _208 = uint(int(uint(_206) >> uint(2)));
            uint _210 = uint(int(uint(int(_208)) >> uint(2)));
            int _212 = int(_208) & 3;
            float _214 = (*spvDescriptorSet0.vp_c5)._m0[int(_210)][_212];
            int _216 = int(_208) + 1;
            uint _218 = uint(int(uint(_216) >> uint(2)));
            int _220 = _216 & 3;
            float _222 = (*spvDescriptorSet0.vp_c5)._m0[int(_218)][_220];
            bool _224 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x) > 1;
            uint _226 = uint(int(uint(_204) >> uint(2)));
            uint _228 = uint(int(uint(int(_226)) >> uint(2)));
            int _230 = int(_226) & 3;
            float _232 = (*spvDescriptorSet0.vp_c5)._m0[int(_228)][_230];
            int _234 = int(_226) + 1;
            uint _236 = uint(int(uint(_234) >> uint(2)));
            int _238 = _234 & 3;
            float _240 = (*spvDescriptorSet0.vp_c5)._m0[int(_236)][_238];
            int _242 = _204 + 32;
            uint _244 = uint(int(uint(_242) >> uint(2)));
            uint _246 = uint(int(uint(int(_244)) >> uint(2)));
            int _248 = int(_244) & 3;
            float _250 = (*spvDescriptorSet0.vp_c5)._m0[int(_246)][_248];
            int _252 = int(_244) + 1;
            uint _254 = uint(int(uint(_252) >> uint(2)));
            int _256 = _252 & 3;
            float _258 = (*spvDescriptorSet0.vp_c5)._m0[int(_254)][_256];
            int _260 = _204 + 24;
            uint _262 = uint(int(uint(_260) >> uint(2)));
            uint _264 = uint(int(uint(int(_262)) >> uint(2)));
            int _266 = int(_262) & 3;
            float _268 = (*spvDescriptorSet0.vp_c5)._m0[int(_264)][_266];
            int _270 = int(_262) + 1;
            uint _272 = uint(int(uint(_270) >> uint(2)));
            int _274 = _270 & 3;
            float _276 = (*spvDescriptorSet0.vp_c5)._m0[int(_272)][_274];
            int _278 = _204 + 8;
            uint _280 = uint(int(uint(_278) >> uint(2)));
            uint _282 = uint(int(uint(int(_280)) >> uint(2)));
            int _284 = int(_280) & 3;
            float _286 = (*spvDescriptorSet0.vp_c5)._m0[int(_282)][_284];
            int _288 = int(_280) + 1;
            uint _290 = uint(int(uint(_288) >> uint(2)));
            int _292 = _288 & 3;
            float _294 = (*spvDescriptorSet0.vp_c5)._m0[int(_290)][_292];
            int _296 = _204 + 40;
            uint _298 = uint(int(uint(_296) >> uint(2)));
            uint _300 = uint(int(uint(int(_298)) >> uint(2)));
            int _302 = int(_298) & 3;
            float _304 = (*spvDescriptorSet0.vp_c5)._m0[int(_300)][_302];
            int _306 = int(_298) + 1;
            uint _308 = uint(int(uint(_306) >> uint(2)));
            int _310 = _306 & 3;
            float _312 = (*spvDescriptorSet0.vp_c5)._m0[int(_308)][_310];
            float _314 = _200 * _222;
            float _316 = fma(_198, _214, _314);
            float _318 = _200 * _240;
            float _320 = fma(_198, _232, _318);
            float _322 = _200 * _258;
            float _324 = fma(_198, _250, _322);
            float _326 = fma(_202, _268, _316);
            float _328 = _326 + _276;
            float _330 = fma(_202, _286, _320);
            float _332 = _320;
            float _334 = _326;
            float _336 = _330;
            float _338 = _328;
            float _340 = _200;
            float _342 = _198;
            if (!_224)
            {
                _332 = _328;
            }
            float _344 = _332;
            float _346 = _330 + _294;
            float _348 = fma(_202, _304, _324);
            float _350 = _346;
            float _352 = _344;
            if (!_224)
            {
                _334 = _346;
            }
            float _354 = _334;
            float _356 = _348 + _312;
            float _358 = _356;
            float _360 = _354;
            if (!_224)
            {
                _336 = _356;
            }
            float _362 = _336;
            bool _364 = !_224;
            float _366 = _362;
            if (!_364)
            {
                int _368 = as_type<int>(_192) * 48;
                int _370 = as_type<int>(_194) * 48;
                int _372 = as_type<int>(_196) * 48;
                uint _374 = uint(int(uint(_368) >> uint(2)));
                uint _376 = uint(int(uint(int(_374)) >> uint(2)));
                int _378 = int(_374) & 3;
                float _380 = (*spvDescriptorSet0.vp_c5)._m0[int(_376)][_378];
                int _382 = int(_374) + 1;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                int _386 = _382 & 3;
                float _388 = (*spvDescriptorSet0.vp_c5)._m0[int(_384)][_386];
                int _390 = _368 + 8;
                uint _392 = uint(int(uint(_390) >> uint(2)));
                uint _394 = uint(int(uint(int(_392)) >> uint(2)));
                int _396 = int(_392) & 3;
                float _398 = (*spvDescriptorSet0.vp_c5)._m0[int(_394)][_396];
                int _400 = int(_392) + 1;
                uint _402 = uint(int(uint(_400) >> uint(2)));
                int _404 = _400 & 3;
                float _406 = (*spvDescriptorSet0.vp_c5)._m0[int(_402)][_404];
                int _408 = _368 + 16;
                uint _410 = uint(int(uint(_408) >> uint(2)));
                uint _412 = uint(int(uint(int(_410)) >> uint(2)));
                int _414 = int(_410) & 3;
                float _416 = (*spvDescriptorSet0.vp_c5)._m0[int(_412)][_414];
                int _418 = int(_410) + 1;
                uint _420 = uint(int(uint(_418) >> uint(2)));
                int _422 = _418 & 3;
                float _424 = (*spvDescriptorSet0.vp_c5)._m0[int(_420)][_422];
                int _426 = _368 + 24;
                uint _428 = uint(int(uint(_426) >> uint(2)));
                uint _430 = uint(int(uint(int(_428)) >> uint(2)));
                int _432 = int(_428) & 3;
                float _434 = (*spvDescriptorSet0.vp_c5)._m0[int(_430)][_432];
                int _436 = int(_428) + 1;
                uint _438 = uint(int(uint(_436) >> uint(2)));
                int _440 = _436 & 3;
                float _442 = (*spvDescriptorSet0.vp_c5)._m0[int(_438)][_440];
                int _444 = _368 + 32;
                uint _446 = uint(int(uint(_444) >> uint(2)));
                uint _448 = uint(int(uint(int(_446)) >> uint(2)));
                int _450 = int(_446) & 3;
                float _452 = (*spvDescriptorSet0.vp_c5)._m0[int(_448)][_450];
                int _454 = int(_446) + 1;
                uint _456 = uint(int(uint(_454) >> uint(2)));
                int _458 = _454 & 3;
                float _460 = (*spvDescriptorSet0.vp_c5)._m0[int(_456)][_458];
                int _462 = _368 + 40;
                uint _464 = uint(int(uint(_462) >> uint(2)));
                uint _466 = uint(int(uint(int(_464)) >> uint(2)));
                int _468 = int(_464) & 3;
                float _470 = (*spvDescriptorSet0.vp_c5)._m0[int(_466)][_468];
                int _472 = int(_464) + 1;
                uint _474 = uint(int(uint(_472) >> uint(2)));
                int _476 = _472 & 3;
                float _478 = (*spvDescriptorSet0.vp_c5)._m0[int(_474)][_476];
                uint _480 = uint(int(uint(_370) >> uint(2)));
                uint _482 = uint(int(uint(int(_480)) >> uint(2)));
                int _484 = int(_480) & 3;
                float _486 = (*spvDescriptorSet0.vp_c5)._m0[int(_482)][_484];
                int _488 = int(_480) + 1;
                uint _490 = uint(int(uint(_488) >> uint(2)));
                int _492 = _488 & 3;
                float _494 = (*spvDescriptorSet0.vp_c5)._m0[int(_490)][_492];
                int _496 = _370 + 8;
                uint _498 = uint(int(uint(_496) >> uint(2)));
                uint _500 = uint(int(uint(int(_498)) >> uint(2)));
                int _502 = int(_498) & 3;
                float _504 = (*spvDescriptorSet0.vp_c5)._m0[int(_500)][_502];
                int _506 = int(_498) + 1;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                int _510 = _506 & 3;
                float _512 = (*spvDescriptorSet0.vp_c5)._m0[int(_508)][_510];
                int _514 = _370 + 16;
                uint _516 = uint(int(uint(_514) >> uint(2)));
                uint _518 = uint(int(uint(int(_516)) >> uint(2)));
                int _520 = int(_516) & 3;
                float _522 = (*spvDescriptorSet0.vp_c5)._m0[int(_518)][_520];
                int _524 = int(_516) + 1;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                int _528 = _524 & 3;
                float _530 = (*spvDescriptorSet0.vp_c5)._m0[int(_526)][_528];
                int _532 = _370 + 24;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                uint _536 = uint(int(uint(int(_534)) >> uint(2)));
                int _538 = int(_534) & 3;
                float _540 = (*spvDescriptorSet0.vp_c5)._m0[int(_536)][_538];
                int _542 = int(_534) + 1;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                int _546 = _542 & 3;
                float _548 = (*spvDescriptorSet0.vp_c5)._m0[int(_544)][_546];
                int _550 = _370 + 32;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                uint _554 = uint(int(uint(int(_552)) >> uint(2)));
                int _556 = int(_552) & 3;
                float _558 = (*spvDescriptorSet0.vp_c5)._m0[int(_554)][_556];
                int _560 = int(_552) + 1;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                int _564 = _560 & 3;
                float _566 = (*spvDescriptorSet0.vp_c5)._m0[int(_562)][_564];
                int _568 = _370 + 40;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.vp_c5)._m0[int(_572)][_574];
                int _578 = int(_570) + 1;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                int _582 = _578 & 3;
                float _584 = (*spvDescriptorSet0.vp_c5)._m0[int(_580)][_582];
                uint _586 = uint(int(uint(_372) >> uint(2)));
                uint _588 = uint(int(uint(int(_586)) >> uint(2)));
                int _590 = int(_586) & 3;
                float _592 = (*spvDescriptorSet0.vp_c5)._m0[int(_588)][_590];
                int _594 = int(_586) + 1;
                uint _596 = uint(int(uint(_594) >> uint(2)));
                int _598 = _594 & 3;
                float _600 = (*spvDescriptorSet0.vp_c5)._m0[int(_596)][_598];
                int _602 = _372 + 8;
                uint _604 = uint(int(uint(_602) >> uint(2)));
                uint _606 = uint(int(uint(int(_604)) >> uint(2)));
                int _608 = int(_604) & 3;
                float _610 = (*spvDescriptorSet0.vp_c5)._m0[int(_606)][_608];
                int _612 = int(_604) + 1;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                int _616 = _612 & 3;
                float _618 = (*spvDescriptorSet0.vp_c5)._m0[int(_614)][_616];
                int _620 = _372 + 16;
                uint _622 = uint(int(uint(_620) >> uint(2)));
                uint _624 = uint(int(uint(int(_622)) >> uint(2)));
                int _626 = int(_622) & 3;
                float _628 = (*spvDescriptorSet0.vp_c5)._m0[int(_624)][_626];
                int _630 = int(_622) + 1;
                uint _632 = uint(int(uint(_630) >> uint(2)));
                int _634 = _630 & 3;
                float _636 = (*spvDescriptorSet0.vp_c5)._m0[int(_632)][_634];
                int _638 = _372 + 24;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                uint _642 = uint(int(uint(int(_640)) >> uint(2)));
                int _644 = int(_640) & 3;
                float _646 = (*spvDescriptorSet0.vp_c5)._m0[int(_642)][_644];
                int _648 = int(_640) + 1;
                uint _650 = uint(int(uint(_648) >> uint(2)));
                int _652 = _648 & 3;
                float _654 = (*spvDescriptorSet0.vp_c5)._m0[int(_650)][_652];
                int _656 = _372 + 32;
                uint _658 = uint(int(uint(_656) >> uint(2)));
                uint _660 = uint(int(uint(int(_658)) >> uint(2)));
                int _662 = int(_658) & 3;
                float _664 = (*spvDescriptorSet0.vp_c5)._m0[int(_660)][_662];
                int _666 = int(_658) + 1;
                uint _668 = uint(int(uint(_666) >> uint(2)));
                int _670 = _666 & 3;
                float _672 = (*spvDescriptorSet0.vp_c5)._m0[int(_668)][_670];
                int _674 = _372 + 40;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                uint _678 = uint(int(uint(int(_676)) >> uint(2)));
                int _680 = int(_676) & 3;
                float _682 = (*spvDescriptorSet0.vp_c5)._m0[int(_678)][_680];
                int _684 = int(_676) + 1;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                int _688 = _684 & 3;
                float _690 = (*spvDescriptorSet0.vp_c5)._m0[int(_686)][_688];
                int _692 = 1;
                float _694 = 0.0;
                float _696 = 0.0;
                float _698 = 0.0;
                float _700 = 0.0;
                float _702 = 0.0;
                float _704 = 0.0;
                float _706 = 0.0;
                float _708 = 0.0;
                float _710 = 0.0;
                float _712 = 0.0;
                bool _714;
                float _1476;
                float _1482;
                float _1484;
                do
                {
                    int _716 = _692;
                    float _718 = _350;
                    float _720 = _338;
                    float _722 = _358;
                    float _724 = _694;
                    float _726 = _696;
                    float _728 = _698;
                    float _730 = _700;
                    float _732 = _702;
                    float _734 = _704;
                    float _736 = _706;
                    float _738 = _708;
                    float _740 = _710;
                    float _742 = _712;
                    float _744 = in.m_48.x;
                    int _746 = _716 & 3;
                    bool _748 = _716 != 1;
                    bool _750 = _746 >= 2;
                    float _752 = _718;
                    float _754 = _720;
                    float _756 = _722;
                    float _758 = _744;
                    float _760 = _724;
                    float _762 = _726;
                    float _764 = _734;
                    float _766 = _732;
                    float _768 = _728;
                    float _770 = _740;
                    float _772 = _730;
                    float _774 = _736;
                    float _776 = _742;
                    float _778 = _738;
                    if (!_748)
                    {
                        float _780 = _718 * _744;
                        _752 = _780;
                    }
                    float _782 = _752;
                    if (!_748)
                    {
                        float _784 = _720 * _744;
                        _754 = _784;
                    }
                    float _786 = _754;
                    if (!_748)
                    {
                        float _788 = _722 * _744;
                        _756 = _788;
                    }
                    float _790 = _756;
                    bool _792 = !_750;
                    if (!_792)
                    {
                        bool _794 = _746 >= 3;
                        bool _796 = !_794;
                        if (!_796)
                        {
                            bool _798 = _746 != 3;
                            _800 = _798;
                            if (!_800)
                            {
                                float _802 = in.m_48.w;
                                _758 = _802;
                                _800 = true;
                            }
                        }
                        else
                        {
                            float _804 = in.m_48.z;
                            _758 = _804;
                            _800 = true;
                        }
                    }
                    else
                    {
                        bool _806 = _746 != 1;
                        if (!_806)
                        {
                            float _808 = in.m_48.y;
                            _758 = _808;
                        }
                    }
                    _800 = false;
                    float _810 = _758;
                    int _812 = _716 * 3;
                    int _814 = _716 + 1;
                    int _816 = _812 * 16;
                    int _818 = _812 + 1;
                    int _820 = _812 + 2;
                    bool _822 = _816 == 0;
                    bool _824 = _816 == 16;
                    int _826 = _820 * 16;
                    bool _828 = _816 == 32;
                    bool _830 = _816 == 48;
                    bool _832 = _816 == 64;
                    bool _834 = _816 == 80;
                    int _836 = _818 << 4;
                    _692 = _814;
                    float _838 = as_type<float>(_820);
                    float _840 = as_type<float>(_816);
                    if (_822)
                    {
                        _760 = _240;
                    }
                    float _842 = _760;
                    float _844 = _842;
                    if (_822)
                    {
                        _762 = _232;
                    }
                    float _846 = _762;
                    float _848 = _846;
                    if (_822)
                    {
                        _764 = _294;
                    }
                    float _850 = _764;
                    float _852 = _850;
                    if (_822)
                    {
                        _766 = _286;
                    }
                    float _854 = _766;
                    float _856 = _854;
                    if (_824)
                    {
                        _844 = _222;
                    }
                    float _858 = _844;
                    bool _860 = _816 == 96;
                    float _862 = _858;
                    if (_824)
                    {
                        _852 = _276;
                    }
                    float _864 = _852;
                    float _866 = _864;
                    if (_824)
                    {
                        _848 = _214;
                    }
                    float _868 = _848;
                    float _870 = _868;
                    if (_828)
                    {
                        _862 = _258;
                    }
                    float _872 = _862;
                    float _874 = _872;
                    if (_824)
                    {
                        _856 = _268;
                    }
                    float _876 = _856;
                    float _878 = _876;
                    if (_828)
                    {
                        _866 = _312;
                    }
                    float _880 = _866;
                    bool _882 = _816 == 112;
                    float _884 = _880;
                    if (_830)
                    {
                        _874 = _388;
                    }
                    float _886 = _874;
                    float _888 = _886;
                    if (_828)
                    {
                        _870 = _250;
                    }
                    float _890 = _870;
                    float _892 = _890;
                    if (_830)
                    {
                        _884 = _406;
                    }
                    float _894 = _884;
                    float _896 = _894;
                    if (_828)
                    {
                        _878 = _304;
                    }
                    float _898 = _878;
                    float _900 = _898;
                    if (_832)
                    {
                        _888 = _424;
                    }
                    float _902 = _888;
                    float _904 = _902;
                    if (_830)
                    {
                        _892 = _380;
                    }
                    float _906 = _892;
                    float _908 = _906;
                    if (_832)
                    {
                        _896 = _442;
                    }
                    float _910 = _896;
                    float _912 = _910;
                    if (_830)
                    {
                        _900 = _398;
                    }
                    float _914 = _900;
                    float _916 = _914;
                    if (_834)
                    {
                        _904 = _460;
                    }
                    float _918 = _904;
                    bool _920 = _816 == 128;
                    float _922 = _918;
                    if (_834)
                    {
                        _912 = _478;
                    }
                    float _924 = _912;
                    float _926 = _924;
                    if (_832)
                    {
                        _908 = _416;
                    }
                    float _928 = _908;
                    float _930 = _928;
                    if (_860)
                    {
                        _922 = _494;
                    }
                    float _932 = _922;
                    float _934 = _932;
                    if (_832)
                    {
                        _916 = _434;
                    }
                    float _936 = _916;
                    float _938 = _936;
                    if (_860)
                    {
                        _926 = _512;
                    }
                    float _940 = _926;
                    bool _942 = _816 == 144;
                    float _944 = _940;
                    if (_882)
                    {
                        _934 = _530;
                    }
                    float _946 = _934;
                    float _948 = _946;
                    if (_834)
                    {
                        _930 = _452;
                    }
                    float _950 = _930;
                    float _952 = _950;
                    if (_882)
                    {
                        _944 = _548;
                    }
                    float _954 = _944;
                    float _956 = _954;
                    if (_834)
                    {
                        _938 = _470;
                    }
                    float _958 = _938;
                    bool _960 = _816 == 160;
                    float _962 = _958;
                    if (_920)
                    {
                        _948 = _566;
                    }
                    float _964 = _948;
                    float _966 = _964;
                    if (_860)
                    {
                        _952 = _486;
                    }
                    float _968 = _952;
                    float _970 = _968;
                    if (_920)
                    {
                        _956 = _584;
                    }
                    float _972 = _956;
                    float _974 = _972;
                    if (_860)
                    {
                        _962 = _504;
                    }
                    float _976 = _962;
                    bool _978 = _836 == 0;
                    float _980 = _976;
                    if (_942)
                    {
                        _966 = _600;
                    }
                    float _982 = _966;
                    float _984 = _982;
                    if (_882)
                    {
                        _970 = _522;
                    }
                    float _986 = _970;
                    float _988 = _986;
                    if (_942)
                    {
                        _974 = _618;
                    }
                    float _990 = _974;
                    float _992 = _990;
                    if (_882)
                    {
                        _980 = _540;
                    }
                    float _994 = _980;
                    bool _996 = _836 == 16;
                    float _998 = _994;
                    if (_960)
                    {
                        _984 = _636;
                    }
                    float _1000 = _984;
                    float _1002 = _1000;
                    if (_920)
                    {
                        _988 = _558;
                    }
                    float _1004 = _988;
                    float _1006 = _1004;
                    if (_960)
                    {
                        _992 = _654;
                    }
                    float _1008 = _992;
                    float _1010 = _1008;
                    if (_920)
                    {
                        _998 = _576;
                    }
                    float _1012 = _998;
                    bool _1014 = _836 == 32;
                    float _1016 = _1012;
                    if (_978)
                    {
                        _768 = _240;
                    }
                    float _1018 = _768;
                    float _1020 = _1018;
                    if (_942)
                    {
                        _1006 = _592;
                    }
                    float _1022 = _1006;
                    float _1024 = _1022;
                    if (_978)
                    {
                        _770 = _294;
                    }
                    float _1026 = _770;
                    float _1028 = _1026;
                    if (_942)
                    {
                        _1016 = _610;
                    }
                    float _1030 = _1016;
                    bool _1032 = _836 == 48;
                    float _1034 = _1030;
                    if (_996)
                    {
                        _1020 = _222;
                    }
                    float _1036 = _1020;
                    float _1038 = _1036;
                    if (_960)
                    {
                        _1024 = _628;
                    }
                    float _1040 = _1024;
                    float _1042 = _1040;
                    if (_996)
                    {
                        _1028 = _276;
                    }
                    float _1044 = _1028;
                    float _1046 = _1044;
                    if (_960)
                    {
                        _1034 = _646;
                    }
                    float _1048 = _1034;
                    bool _1050 = _836 == 64;
                    float _1052 = _1048;
                    if (_1014)
                    {
                        _1038 = _258;
                    }
                    float _1054 = _1038;
                    float _1056 = _1054;
                    if (_978)
                    {
                        _772 = _232;
                    }
                    float _1058 = _772;
                    float _1060 = _1058;
                    if (_1014)
                    {
                        _1046 = _312;
                    }
                    float _1062 = _1046;
                    float _1064 = _1062;
                    if (_978)
                    {
                        _774 = _286;
                    }
                    float _1066 = _774;
                    bool _1068 = _836 == 80;
                    float _1070 = _1066;
                    if (_1032)
                    {
                        _1056 = _388;
                    }
                    float _1072 = _1056;
                    float _1074 = _1072;
                    if (_996)
                    {
                        _1060 = _214;
                    }
                    float _1076 = _1060;
                    float _1078 = _1076;
                    if (_1032)
                    {
                        _1064 = _406;
                    }
                    float _1080 = _1064;
                    float _1082 = _1080;
                    if (_996)
                    {
                        _1070 = _268;
                    }
                    float _1084 = _1070;
                    bool _1086 = _836 == 96;
                    float _1088 = _1084;
                    if (_1050)
                    {
                        _1074 = _424;
                    }
                    float _1090 = _1074;
                    float _1092 = _1090;
                    if (_1014)
                    {
                        _1078 = _250;
                    }
                    float _1094 = _1078;
                    float _1096 = _1094;
                    if (_1050)
                    {
                        _1082 = _442;
                    }
                    float _1098 = _1082;
                    float _1100 = _1098;
                    if (_1014)
                    {
                        _1088 = _304;
                    }
                    float _1102 = _1088;
                    float _1104 = _1102;
                    if (_1032)
                    {
                        _1096 = _380;
                    }
                    float _1106 = _1096;
                    float _1108 = _1106;
                    if (_1068)
                    {
                        _1092 = _460;
                    }
                    float _1110 = _1092;
                    float _1112 = _1110;
                    if (_1032)
                    {
                        _1104 = _398;
                    }
                    float _1114 = _1104;
                    float _1116 = _1114;
                    if (_1068)
                    {
                        _1100 = _478;
                    }
                    float _1118 = _1100;
                    bool _1120 = _836 == 112;
                    float _1122 = _1118;
                    if (_1050)
                    {
                        _1108 = _416;
                    }
                    float _1124 = _1108;
                    float _1126 = _1124;
                    if (_1086)
                    {
                        _1112 = _494;
                    }
                    float _1128 = _1112;
                    float _1130 = _1128;
                    if (_1050)
                    {
                        _1116 = _434;
                    }
                    float _1132 = _1116;
                    float _1134 = _1132;
                    if (_1086)
                    {
                        _1122 = _512;
                    }
                    float _1136 = _1122;
                    bool _1138 = _836 == 128;
                    float _1140 = _1136;
                    if (_1068)
                    {
                        _1126 = _452;
                    }
                    float _1142 = _1126;
                    float _1144 = _1142;
                    if (_1068)
                    {
                        _1134 = _470;
                    }
                    float _1146 = _1134;
                    bool _1148 = _836 == 144;
                    float _1150 = _1146;
                    if (_1120)
                    {
                        _1130 = _530;
                    }
                    float _1152 = _1130;
                    float _1154 = _1152;
                    if (_1086)
                    {
                        _1144 = _486;
                    }
                    float _1156 = _1144;
                    float _1158 = _1156;
                    if (_1120)
                    {
                        _1140 = _548;
                    }
                    float _1160 = _1140;
                    float _1162 = _1160;
                    if (_1086)
                    {
                        _1150 = _504;
                    }
                    float _1164 = _1150;
                    bool _1166 = _826 == 0;
                    float _1168 = _1164;
                    if (_1138)
                    {
                        _1154 = _566;
                    }
                    float _1170 = _1154;
                    float _1172 = _1170;
                    if (_1120)
                    {
                        _1158 = _522;
                    }
                    float _1174 = _1158;
                    float _1176 = _1174;
                    if (_1138)
                    {
                        _1162 = _584;
                    }
                    float _1178 = _1162;
                    float _1180 = _1178;
                    if (_1120)
                    {
                        _1168 = _540;
                    }
                    float _1182 = _1168;
                    bool _1184 = _826 == 16;
                    float _1186 = _1182;
                    if (_1148)
                    {
                        _1172 = _600;
                    }
                    float _1188 = _1172;
                    float _1190 = _1188;
                    if (_1138)
                    {
                        _1176 = _558;
                    }
                    float _1192 = _1176;
                    float _1194 = _1192;
                    if (_1148)
                    {
                        _1180 = _618;
                    }
                    float _1196 = _1180;
                    float _1198 = _1196;
                    if (_1138)
                    {
                        _1186 = _576;
                    }
                    float _1200 = _1186;
                    bool _1202 = _816 == 176;
                    float _1204 = _1200;
                    if (_1166)
                    {
                        _838 = _240;
                    }
                    float _1206 = _838;
                    bool _1208 = _826 == 32;
                    float _1210 = _1206;
                    if (_1166)
                    {
                        _776 = _294;
                    }
                    float _1212 = _776;
                    float _1214 = _1212;
                    if (_1148)
                    {
                        _1194 = _592;
                    }
                    float _1216 = _1194;
                    float _1218 = _1216;
                    if (_1148)
                    {
                        _1204 = _610;
                    }
                    float _1220 = _1204;
                    float _1222 = _1220;
                    if (_1184)
                    {
                        _1210 = _222;
                    }
                    float _1224 = _1210;
                    bool _1226 = _826 == 48;
                    float _1228 = _1224;
                    if (_1184)
                    {
                        _1214 = _276;
                    }
                    float _1230 = _1214;
                    float _1232 = _1230;
                    if (_1166)
                    {
                        _840 = _232;
                    }
                    float _1234 = _840;
                    float _1236 = _1234;
                    if (_1166)
                    {
                        _778 = _286;
                    }
                    float _1238 = _778;
                    float _1240 = _1238;
                    if (_1202)
                    {
                        _1042 = _664;
                    }
                    float _1242 = _1042;
                    bool _1244 = _826 == 64;
                    if (_1208)
                    {
                        _1228 = _258;
                    }
                    float _1246 = _1228;
                    float _1248 = _1246;
                    if (_1184)
                    {
                        _1236 = _214;
                    }
                    float _1250 = _1236;
                    float _1252 = _1250;
                    if (_1208)
                    {
                        _1232 = _312;
                    }
                    float _1254 = _1232;
                    float _1256 = _1254;
                    if (_1184)
                    {
                        _1240 = _268;
                    }
                    float _1258 = _1240;
                    float _1260 = _1258;
                    if (_1202)
                    {
                        _1052 = _682;
                    }
                    float _1262 = _1052;
                    bool _1264 = _826 == 80;
                    _702 = _1262;
                    if (_1226)
                    {
                        _1248 = _388;
                    }
                    float _1266 = _1248;
                    float _1268 = _1266;
                    if (_1208)
                    {
                        _1252 = _250;
                    }
                    float _1270 = _1252;
                    float _1272 = _1270;
                    if (_1226)
                    {
                        _1256 = _406;
                    }
                    float _1274 = _1256;
                    float _1276 = _1274;
                    if (_1208)
                    {
                        _1260 = _304;
                    }
                    float _1278 = _1260;
                    bool _1280 = _826 == 96;
                    float _1282 = _1278;
                    if (_1244)
                    {
                        _1268 = _424;
                    }
                    float _1284 = _1268;
                    float _1286 = _1284;
                    if (_1226)
                    {
                        _1272 = _380;
                    }
                    float _1288 = _1272;
                    float _1290 = _1288;
                    if (_1244)
                    {
                        _1276 = _442;
                    }
                    float _1292 = _1276;
                    float _1294 = _1292;
                    if (_1226)
                    {
                        _1282 = _398;
                    }
                    float _1296 = _1282;
                    bool _1298 = _826 == 112;
                    float _1300 = _1296;
                    if (_1264)
                    {
                        _1286 = _460;
                    }
                    float _1302 = _1286;
                    float _1304 = _1302;
                    if (_1244)
                    {
                        _1290 = _416;
                    }
                    float _1306 = _1290;
                    float _1308 = _1306;
                    if (_1264)
                    {
                        _1294 = _478;
                    }
                    float _1310 = _1294;
                    float _1312 = _1310;
                    if (_1244)
                    {
                        _1300 = _434;
                    }
                    float _1314 = _1300;
                    bool _1316 = _826 == 128;
                    float _1318 = _1314;
                    if (_1280)
                    {
                        _1304 = _494;
                    }
                    float _1320 = _1304;
                    float _1322 = _1320;
                    if (_1264)
                    {
                        _1308 = _452;
                    }
                    float _1324 = _1308;
                    float _1326 = _1324;
                    if (_1280)
                    {
                        _1312 = _512;
                    }
                    float _1328 = _1312;
                    float _1330 = _1328;
                    if (_1264)
                    {
                        _1318 = _470;
                    }
                    float _1332 = _1318;
                    float _1334 = _1332;
                    if (_1280)
                    {
                        _1326 = _486;
                    }
                    float _1336 = _1326;
                    float _1338 = _1336;
                    if (_1298)
                    {
                        _1322 = _530;
                    }
                    float _1340 = _1322;
                    float _1342 = _1340;
                    if (_1280)
                    {
                        _1334 = _504;
                    }
                    float _1344 = _1334;
                    float _1346 = _1344;
                    if (_1298)
                    {
                        _1330 = _548;
                    }
                    float _1348 = _1330;
                    bool _1350 = _826 == 144;
                    float _1352 = _1348;
                    if (_1298)
                    {
                        _1338 = _522;
                    }
                    float _1354 = _1338;
                    float _1356 = _1354;
                    if (_1316)
                    {
                        _1342 = _566;
                    }
                    float _1358 = _1342;
                    float _1360 = _1358;
                    if (_1298)
                    {
                        _1346 = _540;
                    }
                    float _1362 = _1346;
                    float _1364 = _1362;
                    if (_1316)
                    {
                        _1364 = _576;
                    }
                    float _1366 = _1364;
                    bool _1368 = _826 == 160;
                    float _1370 = _1366;
                    if (_1316)
                    {
                        _1356 = _558;
                    }
                    float _1372 = _1356;
                    float _1374 = _1372;
                    if (_1316)
                    {
                        _1352 = _584;
                    }
                    float _1376 = _1352;
                    bool _1378 = _836 == 160;
                    float _1380 = _1376;
                    if (_1350)
                    {
                        _1374 = _592;
                    }
                    float _1382 = _1374;
                    bool _1384 = _826 == 176;
                    float _1386 = _1382;
                    if (_1350)
                    {
                        _1370 = _610;
                    }
                    float _1388 = _1370;
                    bool _1390 = _836 == 176;
                    float _1392 = _1388;
                    if (_1202)
                    {
                        _1002 = _672;
                    }
                    float _1394 = _1002;
                    if (_1368)
                    {
                        _1392 = _646;
                    }
                    float _1396 = _1392;
                    float _1398 = _1396;
                    if (_1350)
                    {
                        _1360 = _600;
                    }
                    float _1400 = _1360;
                    float _1402 = _1400;
                    if (_1368)
                    {
                        _1402 = _636;
                    }
                    float _1404 = _1402;
                    float _1406 = _200 * _1394;
                    float _1408 = _1404;
                    if (_1368)
                    {
                        _1386 = _628;
                    }
                    float _1410 = _1386;
                    float _1412 = _1410;
                    if (_1378)
                    {
                        _1190 = _636;
                    }
                    float _1414 = _1190;
                    float _1416 = fma(_198, _1242, _1406);
                    _696 = _1416;
                    float _1418 = _1414;
                    if (_1384)
                    {
                        _1408 = _672;
                    }
                    float _1420 = _1408;
                    if (_1390)
                    {
                        _1418 = _672;
                    }
                    float _1422 = _1418;
                    if (_1378)
                    {
                        _1218 = _628;
                    }
                    float _1424 = _1218;
                    float _1426 = _1424;
                    if (_1390)
                    {
                        _1426 = _664;
                    }
                    float _1428 = _1426;
                    float _1430 = _200 * _1422;
                    _698 = _1430;
                    if (_1384)
                    {
                        _1412 = _664;
                    }
                    float _1432 = _1412;
                    float _1434 = _200 * _1420;
                    if (_1202)
                    {
                        _1010 = _690;
                    }
                    float _1436 = _1010;
                    float _1438 = fma(_198, _1428, _1430);
                    bool _1440 = _814 >= as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
                    float _1442 = fma(_198, _1432, _1434);
                    _694 = _1442;
                    _704 = _1436;
                    if (_1378)
                    {
                        _1222 = _646;
                    }
                    float _1444 = _1222;
                    float _1446 = fma(_202, _1262, _1416);
                    float _1448 = _1444;
                    if (_1390)
                    {
                        _1448 = _682;
                    }
                    float _1450 = _1448;
                    _706 = _1450;
                    if (_1384)
                    {
                        _1398 = _682;
                    }
                    float _1452 = _1398;
                    float _1454 = _1446 + _1436;
                    _708 = _1452;
                    if (_1350)
                    {
                        _1380 = _618;
                    }
                    float _1456 = _1380;
                    float _1458 = _1456;
                    if (_1368)
                    {
                        _1458 = _654;
                    }
                    float _1460 = _1458;
                    float _1462 = _1460;
                    if (_1378)
                    {
                        _1198 = _654;
                    }
                    float _1464 = _1198;
                    float _1466 = _1464;
                    if (_1390)
                    {
                        _1466 = _690;
                    }
                    float _1468 = _1466;
                    _710 = _1468;
                    if (_1384)
                    {
                        _1462 = _690;
                    }
                    float _1470 = _1462;
                    float _1472 = fma(_202, _1450, _1438);
                    float _1474 = fma(_202, _1452, _1442);
                    _1476 = fma(_1454, _810, _782);
                    float _1478 = _1472 + _1468;
                    float _1480 = _1474 + _1470;
                    _1482 = fma(_1478, _810, _786);
                    _1484 = fma(_1480, _810, _790);
                    _714 = !_1440;
                    _350 = _1476;
                    _338 = _1482;
                    _358 = _1484;
                    _700 = _1478;
                    _712 = _1470;
                } while (_714);
                _360 = _1476;
                _366 = _1484;
                _352 = _1482;
            }
            float _1486 = _360;
            float _1488 = _366;
            float _1490 = _352;
            _182 = _1490;
            if (!_224)
            {
                _340 = _1486;
            }
            float _1492 = _340;
            float _1494 = _1492;
            if (!_224)
            {
                _342 = _1488;
            }
            float _1496 = _342;
            float _1498 = _1496;
            if (_224)
            {
                _1494 = _1486;
            }
            float _1500 = _1494;
            _184 = _1500;
            if (_224)
            {
                _1498 = _1488;
            }
            float _1502 = _1498;
            _186 = _1502;
            _188 = true;
        }
    }
    else
    {
        bool _1504 = 0 != as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
        if (!_1504)
        {
            float _1506 = in.m_42.x;
            float _1508 = in.m_42.y;
            float _1510 = in.m_42.z;
            float _1512 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
            float _1514 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
            float _1516 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
            float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[0].x, _1512);
            float _1520 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[1].x, _1514);
            float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[2].x, _1516);
            float _1524 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[0].z, _1518);
            float _1526 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[1].z, _1520);
            float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[2].z, _1522);
            float _1530 = _1524 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
            float _1532 = _1526 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
            float _1534 = _1528 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
            _182 = _1532;
            _184 = _1530;
            _186 = _1534;
            _188 = true;
        }
        else
        {
            float _1536 = as_type<float>(in.m_46.x);
            float _1538 = as_type<float>(in.m_46.y);
            float _1540 = as_type<float>(in.m_46.z);
            float _1542 = as_type<float>(in.m_46.w);
            float _1544 = in.m_42.x;
            float _1546 = in.m_42.y;
            float _1548 = in.m_42.z;
            int _1550 = as_type<int>(_1536) * 48;
            uint _1552 = uint(int(uint(_1550) >> uint(2)));
            uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
            int _1556 = int(_1552) & 3;
            float _1558 = (*spvDescriptorSet0.vp_c5)._m0[int(_1554)][_1556];
            int _1560 = int(_1552) + 1;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            int _1564 = _1560 & 3;
            float _1566 = (*spvDescriptorSet0.vp_c5)._m0[int(_1562)][_1564];
            bool _1568 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x) > 1;
            int _1570 = _1550 + 16;
            uint _1572 = uint(int(uint(_1570) >> uint(2)));
            uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
            int _1576 = int(_1572) & 3;
            float _1578 = (*spvDescriptorSet0.vp_c5)._m0[int(_1574)][_1576];
            int _1580 = int(_1572) + 1;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            int _1584 = _1580 & 3;
            float _1586 = (*spvDescriptorSet0.vp_c5)._m0[int(_1582)][_1584];
            int _1588 = _1550 + 32;
            uint _1590 = uint(int(uint(_1588) >> uint(2)));
            uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
            int _1594 = int(_1590) & 3;
            float _1596 = (*spvDescriptorSet0.vp_c5)._m0[int(_1592)][_1594];
            int _1598 = int(_1590) + 1;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            int _1602 = _1598 & 3;
            float _1604 = (*spvDescriptorSet0.vp_c5)._m0[int(_1600)][_1602];
            int _1606 = _1550 + 8;
            uint _1608 = uint(int(uint(_1606) >> uint(2)));
            uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
            int _1612 = int(_1608) & 3;
            float _1614 = (*spvDescriptorSet0.vp_c5)._m0[int(_1610)][_1612];
            int _1616 = int(_1608) + 1;
            uint _1618 = uint(int(uint(_1616) >> uint(2)));
            int _1620 = _1616 & 3;
            float _1622 = (*spvDescriptorSet0.vp_c5)._m0[int(_1618)][_1620];
            int _1624 = _1550 + 24;
            uint _1626 = uint(int(uint(_1624) >> uint(2)));
            uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
            int _1630 = int(_1626) & 3;
            float _1632 = (*spvDescriptorSet0.vp_c5)._m0[int(_1628)][_1630];
            int _1634 = int(_1626) + 1;
            uint _1636 = uint(int(uint(_1634) >> uint(2)));
            int _1638 = _1634 & 3;
            float _1640 = (*spvDescriptorSet0.vp_c5)._m0[int(_1636)][_1638];
            int _1642 = _1550 + 40;
            uint _1644 = uint(int(uint(_1642) >> uint(2)));
            uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
            int _1648 = int(_1644) & 3;
            float _1650 = (*spvDescriptorSet0.vp_c5)._m0[int(_1646)][_1648];
            int _1652 = int(_1644) + 1;
            uint _1654 = uint(int(uint(_1652) >> uint(2)));
            int _1656 = _1652 & 3;
            float _1658 = (*spvDescriptorSet0.vp_c5)._m0[int(_1654)][_1656];
            float _1660 = _1546 * _1566;
            float _1662 = fma(_1544, _1558, _1660);
            float _1664 = _1546 * _1586;
            float _1666 = fma(_1544, _1578, _1664);
            float _1668 = _1546 * _1604;
            float _1670 = fma(_1544, _1596, _1668);
            float _1672 = fma(_1548, _1614, _1662);
            float _1674 = _1672 + _1622;
            float _1676 = fma(_1548, _1632, _1666);
            float _1678 = _1676 + _1640;
            float _1680 = _1676;
            float _1682 = _1662;
            float _1684 = _1672;
            float _1686 = _1674;
            float _1688 = _1678;
            float _1690 = _1546;
            float _1692 = _1544;
            if (!_1568)
            {
                _1680 = _1674;
            }
            float _1694 = _1680;
            float _1696 = fma(_1548, _1650, _1670);
            float _1698 = _1694;
            if (!_1568)
            {
                _1682 = _1678;
            }
            float _1700 = _1682;
            float _1702 = _1696 + _1658;
            float _1704 = _1702;
            float _1706 = _1700;
            if (!_1568)
            {
                _1684 = _1702;
            }
            float _1708 = _1684;
            bool _1710 = !_1568;
            float _1712 = _1708;
            if (!_1710)
            {
                int _1714 = as_type<int>(_1538) * 48;
                int _1716 = as_type<int>(_1540) * 48;
                int _1718 = as_type<int>(_1542) * 48;
                uint _1720 = uint(int(uint(_1714) >> uint(2)));
                uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
                int _1724 = int(_1720) & 3;
                float _1726 = (*spvDescriptorSet0.vp_c5)._m0[int(_1722)][_1724];
                int _1728 = int(_1720) + 1;
                uint _1730 = uint(int(uint(_1728) >> uint(2)));
                int _1732 = _1728 & 3;
                float _1734 = (*spvDescriptorSet0.vp_c5)._m0[int(_1730)][_1732];
                int _1736 = _1714 + 8;
                uint _1738 = uint(int(uint(_1736) >> uint(2)));
                uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
                int _1742 = int(_1738) & 3;
                float _1744 = (*spvDescriptorSet0.vp_c5)._m0[int(_1740)][_1742];
                int _1746 = int(_1738) + 1;
                uint _1748 = uint(int(uint(_1746) >> uint(2)));
                int _1750 = _1746 & 3;
                float _1752 = (*spvDescriptorSet0.vp_c5)._m0[int(_1748)][_1750];
                int _1754 = _1714 + 16;
                uint _1756 = uint(int(uint(_1754) >> uint(2)));
                uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
                int _1760 = int(_1756) & 3;
                float _1762 = (*spvDescriptorSet0.vp_c5)._m0[int(_1758)][_1760];
                int _1764 = int(_1756) + 1;
                uint _1766 = uint(int(uint(_1764) >> uint(2)));
                int _1768 = _1764 & 3;
                float _1770 = (*spvDescriptorSet0.vp_c5)._m0[int(_1766)][_1768];
                int _1772 = _1714 + 24;
                uint _1774 = uint(int(uint(_1772) >> uint(2)));
                uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
                int _1778 = int(_1774) & 3;
                float _1780 = (*spvDescriptorSet0.vp_c5)._m0[int(_1776)][_1778];
                int _1782 = int(_1774) + 1;
                uint _1784 = uint(int(uint(_1782) >> uint(2)));
                int _1786 = _1782 & 3;
                float _1788 = (*spvDescriptorSet0.vp_c5)._m0[int(_1784)][_1786];
                int _1790 = _1714 + 32;
                uint _1792 = uint(int(uint(_1790) >> uint(2)));
                uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
                int _1796 = int(_1792) & 3;
                float _1798 = (*spvDescriptorSet0.vp_c5)._m0[int(_1794)][_1796];
                int _1800 = int(_1792) + 1;
                uint _1802 = uint(int(uint(_1800) >> uint(2)));
                int _1804 = _1800 & 3;
                float _1806 = (*spvDescriptorSet0.vp_c5)._m0[int(_1802)][_1804];
                int _1808 = _1714 + 40;
                uint _1810 = uint(int(uint(_1808) >> uint(2)));
                uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
                int _1814 = int(_1810) & 3;
                float _1816 = (*spvDescriptorSet0.vp_c5)._m0[int(_1812)][_1814];
                int _1818 = int(_1810) + 1;
                uint _1820 = uint(int(uint(_1818) >> uint(2)));
                int _1822 = _1818 & 3;
                float _1824 = (*spvDescriptorSet0.vp_c5)._m0[int(_1820)][_1822];
                uint _1826 = uint(int(uint(_1716) >> uint(2)));
                uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
                int _1830 = int(_1826) & 3;
                float _1832 = (*spvDescriptorSet0.vp_c5)._m0[int(_1828)][_1830];
                int _1834 = int(_1826) + 1;
                uint _1836 = uint(int(uint(_1834) >> uint(2)));
                int _1838 = _1834 & 3;
                float _1840 = (*spvDescriptorSet0.vp_c5)._m0[int(_1836)][_1838];
                int _1842 = _1716 + 8;
                uint _1844 = uint(int(uint(_1842) >> uint(2)));
                uint _1846 = uint(int(uint(int(_1844)) >> uint(2)));
                int _1848 = int(_1844) & 3;
                float _1850 = (*spvDescriptorSet0.vp_c5)._m0[int(_1846)][_1848];
                int _1852 = int(_1844) + 1;
                uint _1854 = uint(int(uint(_1852) >> uint(2)));
                int _1856 = _1852 & 3;
                float _1858 = (*spvDescriptorSet0.vp_c5)._m0[int(_1854)][_1856];
                int _1860 = _1716 + 16;
                uint _1862 = uint(int(uint(_1860) >> uint(2)));
                uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
                int _1866 = int(_1862) & 3;
                float _1868 = (*spvDescriptorSet0.vp_c5)._m0[int(_1864)][_1866];
                int _1870 = int(_1862) + 1;
                uint _1872 = uint(int(uint(_1870) >> uint(2)));
                int _1874 = _1870 & 3;
                float _1876 = (*spvDescriptorSet0.vp_c5)._m0[int(_1872)][_1874];
                int _1878 = _1716 + 24;
                uint _1880 = uint(int(uint(_1878) >> uint(2)));
                uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
                int _1884 = int(_1880) & 3;
                float _1886 = (*spvDescriptorSet0.vp_c5)._m0[int(_1882)][_1884];
                int _1888 = int(_1880) + 1;
                uint _1890 = uint(int(uint(_1888) >> uint(2)));
                int _1892 = _1888 & 3;
                float _1894 = (*spvDescriptorSet0.vp_c5)._m0[int(_1890)][_1892];
                int _1896 = _1716 + 32;
                uint _1898 = uint(int(uint(_1896) >> uint(2)));
                uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
                int _1902 = int(_1898) & 3;
                float _1904 = (*spvDescriptorSet0.vp_c5)._m0[int(_1900)][_1902];
                int _1906 = int(_1898) + 1;
                uint _1908 = uint(int(uint(_1906) >> uint(2)));
                int _1910 = _1906 & 3;
                float _1912 = (*spvDescriptorSet0.vp_c5)._m0[int(_1908)][_1910];
                int _1914 = _1716 + 40;
                uint _1916 = uint(int(uint(_1914) >> uint(2)));
                uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
                int _1920 = int(_1916) & 3;
                float _1922 = (*spvDescriptorSet0.vp_c5)._m0[int(_1918)][_1920];
                int _1924 = int(_1916) + 1;
                uint _1926 = uint(int(uint(_1924) >> uint(2)));
                int _1928 = _1924 & 3;
                float _1930 = (*spvDescriptorSet0.vp_c5)._m0[int(_1926)][_1928];
                uint _1932 = uint(int(uint(_1718) >> uint(2)));
                uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
                int _1936 = int(_1932) & 3;
                float _1938 = (*spvDescriptorSet0.vp_c5)._m0[int(_1934)][_1936];
                int _1940 = int(_1932) + 1;
                uint _1942 = uint(int(uint(_1940) >> uint(2)));
                int _1944 = _1940 & 3;
                float _1946 = (*spvDescriptorSet0.vp_c5)._m0[int(_1942)][_1944];
                int _1948 = _1718 + 8;
                uint _1950 = uint(int(uint(_1948) >> uint(2)));
                uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
                int _1954 = int(_1950) & 3;
                float _1956 = (*spvDescriptorSet0.vp_c5)._m0[int(_1952)][_1954];
                int _1958 = int(_1950) + 1;
                uint _1960 = uint(int(uint(_1958) >> uint(2)));
                int _1962 = _1958 & 3;
                float _1964 = (*spvDescriptorSet0.vp_c5)._m0[int(_1960)][_1962];
                int _1966 = _1718 + 16;
                uint _1968 = uint(int(uint(_1966) >> uint(2)));
                uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
                int _1972 = int(_1968) & 3;
                float _1974 = (*spvDescriptorSet0.vp_c5)._m0[int(_1970)][_1972];
                int _1976 = int(_1968) + 1;
                uint _1978 = uint(int(uint(_1976) >> uint(2)));
                int _1980 = _1976 & 3;
                float _1982 = (*spvDescriptorSet0.vp_c5)._m0[int(_1978)][_1980];
                int _1984 = _1718 + 24;
                uint _1986 = uint(int(uint(_1984) >> uint(2)));
                uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
                int _1990 = int(_1986) & 3;
                float _1992 = (*spvDescriptorSet0.vp_c5)._m0[int(_1988)][_1990];
                int _1994 = int(_1986) + 1;
                uint _1996 = uint(int(uint(_1994) >> uint(2)));
                int _1998 = _1994 & 3;
                float _2000 = (*spvDescriptorSet0.vp_c5)._m0[int(_1996)][_1998];
                int _2002 = _1718 + 32;
                uint _2004 = uint(int(uint(_2002) >> uint(2)));
                uint _2006 = uint(int(uint(int(_2004)) >> uint(2)));
                int _2008 = int(_2004) & 3;
                float _2010 = (*spvDescriptorSet0.vp_c5)._m0[int(_2006)][_2008];
                int _2012 = int(_2004) + 1;
                uint _2014 = uint(int(uint(_2012) >> uint(2)));
                int _2016 = _2012 & 3;
                float _2018 = (*spvDescriptorSet0.vp_c5)._m0[int(_2014)][_2016];
                int _2020 = _1718 + 40;
                uint _2022 = uint(int(uint(_2020) >> uint(2)));
                uint _2024 = uint(int(uint(int(_2022)) >> uint(2)));
                int _2026 = int(_2022) & 3;
                float _2028 = (*spvDescriptorSet0.vp_c5)._m0[int(_2024)][_2026];
                int _2030 = int(_2022) + 1;
                uint _2032 = uint(int(uint(_2030) >> uint(2)));
                int _2034 = _2030 & 3;
                float _2036 = (*spvDescriptorSet0.vp_c5)._m0[int(_2032)][_2034];
                int _2038 = 1;
                float _2040 = 0.0;
                float _2042 = 0.0;
                float _2044 = 0.0;
                float _2046 = 0.0;
                float _2048 = 0.0;
                float _2050 = 0.0;
                float _2052 = 0.0;
                float _2054 = 0.0;
                float _2056 = 0.0;
                float _2058 = 0.0;
                bool _2060;
                float _2826;
                float _2828;
                float _2830;
                do
                {
                    int _2062 = _2038;
                    float _2064 = _1686;
                    float _2066 = _1688;
                    float _2068 = _1704;
                    float _2070 = _2040;
                    float _2072 = _2042;
                    float _2074 = _2044;
                    float _2076 = _2046;
                    float _2078 = _2048;
                    float _2080 = _2050;
                    float _2082 = _2052;
                    float _2084 = _2054;
                    float _2086 = _2056;
                    float _2088 = _2058;
                    float _2090 = in.m_48.x;
                    int _2092 = _2062 & 3;
                    bool _2094 = _2062 != 1;
                    bool _2096 = _2092 >= 2;
                    float _2098 = _2064;
                    float _2100 = _2066;
                    float _2102 = _2068;
                    float _2104 = _2090;
                    float _2106 = _2072;
                    float _2108 = _2070;
                    float _2110 = _2084;
                    float _2112 = _2078;
                    float _2114 = _2080;
                    float _2116 = _2076;
                    float _2118 = _2074;
                    float _2120 = _2086;
                    float _2122 = _2082;
                    float _2124 = _2088;
                    if (!_2094)
                    {
                        float _2126 = _2064 * _2090;
                        _2098 = _2126;
                    }
                    float _2128 = _2098;
                    if (!_2094)
                    {
                        float _2130 = _2066 * _2090;
                        _2100 = _2130;
                    }
                    float _2132 = _2100;
                    if (!_2094)
                    {
                        float _2134 = _2068 * _2090;
                        _2102 = _2134;
                    }
                    float _2136 = _2102;
                    bool _2138 = !_2096;
                    if (!_2138)
                    {
                        bool _2140 = _2092 >= 3;
                        bool _2142 = !_2140;
                        if (!_2142)
                        {
                            bool _2144 = _2092 != 3;
                            _2146 = _2144;
                            if (!_2146)
                            {
                                float _2148 = in.m_48.w;
                                _2104 = _2148;
                                _2146 = true;
                            }
                        }
                        else
                        {
                            float _2150 = in.m_48.z;
                            _2104 = _2150;
                            _2146 = true;
                        }
                    }
                    else
                    {
                        bool _2152 = _2092 != 1;
                        if (!_2152)
                        {
                            float _2154 = in.m_48.y;
                            _2104 = _2154;
                        }
                    }
                    _2146 = false;
                    float _2156 = _2104;
                    int _2158 = _2062 * 3;
                    int _2160 = _2062 + 1;
                    int _2162 = _2158 << 4;
                    int _2164 = _2158 + 1;
                    bool _2166 = _2162 == 0;
                    bool _2168 = _2162 == 16;
                    int _2170 = _2164 * 16;
                    bool _2172 = _2162 == 32;
                    bool _2174 = _2162 == 48;
                    bool _2176 = _2162 == 64;
                    bool _2178 = _2162 == 80;
                    int _2180 = _2158 + 2;
                    _2038 = _2160;
                    float _2182 = as_type<float>(_2180);
                    float _2184 = as_type<float>(_2162);
                    if (_2166)
                    {
                        _2106 = _1558;
                    }
                    float _2186 = _2106;
                    float _2188 = _2186;
                    if (_2166)
                    {
                        _2108 = _1566;
                    }
                    float _2190 = _2108;
                    float _2192 = _2190;
                    if (_2166)
                    {
                        _2110 = _1622;
                    }
                    float _2194 = _2110;
                    float _2196 = _2194;
                    if (_2166)
                    {
                        _2112 = _1614;
                    }
                    float _2198 = _2112;
                    float _2200 = _2198;
                    if (_2168)
                    {
                        _2200 = _1632;
                    }
                    float _2202 = _2200;
                    bool _2204 = _2162 == 96;
                    float _2206 = _2202;
                    if (_2168)
                    {
                        _2188 = _1578;
                    }
                    float _2208 = _2188;
                    float _2210 = _2208;
                    if (_2168)
                    {
                        _2192 = _1586;
                    }
                    float _2212 = _2192;
                    float _2214 = _2212;
                    if (_2172)
                    {
                        _2214 = _1604;
                    }
                    float _2216 = _2214;
                    float _2218 = _2216;
                    if (_2168)
                    {
                        _2196 = _1640;
                    }
                    float _2220 = _2196;
                    bool _2222 = _2162 == 112;
                    float _2224 = _2220;
                    if (_2172)
                    {
                        _2210 = _1596;
                    }
                    float _2226 = _2210;
                    float _2228 = _2226;
                    if (_2174)
                    {
                        _2228 = _1726;
                    }
                    float _2230 = _2228;
                    float _2232 = _2230;
                    if (_2172)
                    {
                        _2206 = _1650;
                    }
                    float _2234 = _2206;
                    float _2236 = _2234;
                    if (_2172)
                    {
                        _2224 = _1658;
                    }
                    float _2238 = _2224;
                    float _2240 = _2238;
                    if (_2174)
                    {
                        _2240 = _1752;
                    }
                    float _2242 = _2240;
                    float _2244 = _2242;
                    if (_2174)
                    {
                        _2218 = _1734;
                    }
                    float _2246 = _2218;
                    float _2248 = _2246;
                    if (_2174)
                    {
                        _2236 = _1744;
                    }
                    float _2250 = _2236;
                    float _2252 = _2250;
                    if (_2176)
                    {
                        _2252 = _1780;
                    }
                    float _2254 = _2252;
                    bool _2256 = _2162 == 128;
                    float _2258 = _2254;
                    if (_2176)
                    {
                        _2232 = _1762;
                    }
                    float _2260 = _2232;
                    float _2262 = _2260;
                    if (_2176)
                    {
                        _2248 = _1770;
                    }
                    float _2264 = _2248;
                    float _2266 = _2264;
                    if (_2178)
                    {
                        _2266 = _1806;
                    }
                    float _2268 = _2266;
                    float _2270 = _2268;
                    if (_2176)
                    {
                        _2244 = _1788;
                    }
                    float _2272 = _2244;
                    float _2274 = _2272;
                    if (_2204)
                    {
                        _2270 = _1840;
                    }
                    float _2276 = _2270;
                    bool _2278 = _2162 == 144;
                    float _2280 = _2276;
                    if (_2178)
                    {
                        _2262 = _1798;
                    }
                    float _2282 = _2262;
                    float _2284 = _2282;
                    if (_2178)
                    {
                        _2258 = _1816;
                    }
                    float _2286 = _2258;
                    float _2288 = _2286;
                    if (_2178)
                    {
                        _2274 = _1824;
                    }
                    float _2290 = _2274;
                    bool _2292 = _2162 == 160;
                    float _2294 = _2290;
                    if (_2204)
                    {
                        _2284 = _1832;
                    }
                    float _2296 = _2284;
                    float _2298 = _2296;
                    if (_2222)
                    {
                        _2298 = _1868;
                    }
                    float _2300 = _2298;
                    float _2302 = _2300;
                    if (_2204)
                    {
                        _2288 = _1850;
                    }
                    float _2304 = _2288;
                    float _2306 = _2304;
                    if (_2204)
                    {
                        _2294 = _1858;
                    }
                    float _2308 = _2294;
                    float _2310 = _2308;
                    if (_2222)
                    {
                        _2310 = _1894;
                    }
                    float _2312 = _2310;
                    bool _2314 = _2170 == 0;
                    float _2316 = _2312;
                    if (_2222)
                    {
                        _2280 = _1876;
                    }
                    float _2318 = _2280;
                    float _2320 = _2318;
                    if (_2222)
                    {
                        _2306 = _1886;
                    }
                    float _2322 = _2306;
                    float _2324 = _2322;
                    if (_2256)
                    {
                        _2324 = _1922;
                    }
                    float _2326 = _2324;
                    bool _2328 = _2170 == 16;
                    float _2330 = _2326;
                    if (_2256)
                    {
                        _2302 = _1904;
                    }
                    float _2332 = _2302;
                    float _2334 = _2332;
                    if (_2256)
                    {
                        _2320 = _1912;
                    }
                    float _2336 = _2320;
                    float _2338 = _2336;
                    if (_2278)
                    {
                        _2338 = _1946;
                    }
                    float _2340 = _2338;
                    float _2342 = _2340;
                    if (_2256)
                    {
                        _2316 = _1930;
                    }
                    float _2344 = _2316;
                    float _2346 = _2344;
                    if (_2314)
                    {
                        _2114 = _1614;
                    }
                    float _2348 = _2114;
                    bool _2350 = _2170 == 32;
                    float _2352 = _2348;
                    if (_2278)
                    {
                        _2334 = _1938;
                    }
                    float _2354 = _2334;
                    float _2356 = _2354;
                    if (_2292)
                    {
                        _2356 = _1974;
                    }
                    float _2358 = _2356;
                    float _2360 = _2358;
                    if (_2278)
                    {
                        _2330 = _1956;
                    }
                    float _2362 = _2330;
                    float _2364 = _2362;
                    if (_2278)
                    {
                        _2346 = _1964;
                    }
                    float _2366 = _2346;
                    float _2368 = _2366;
                    if (_2292)
                    {
                        _2368 = _2000;
                    }
                    float _2370 = _2368;
                    bool _2372 = _2170 == 48;
                    float _2374 = _2370;
                    if (_2292)
                    {
                        _2342 = _1982;
                    }
                    float _2376 = _2342;
                    float _2378 = _2376;
                    if (_2292)
                    {
                        _2364 = _1992;
                    }
                    float _2380 = _2364;
                    bool _2382 = _2170 == 64;
                    float _2384 = _2380;
                    if (_2314)
                    {
                        _2116 = _1558;
                    }
                    float _2386 = _2116;
                    float _2388 = _2386;
                    if (_2314)
                    {
                        _2118 = _1566;
                    }
                    float _2390 = _2118;
                    float _2392 = _2390;
                    if (_2328)
                    {
                        _2392 = _1586;
                    }
                    float _2394 = _2392;
                    float _2396 = _2394;
                    if (_2314)
                    {
                        _2120 = _1622;
                    }
                    float _2398 = _2120;
                    bool _2400 = _2170 == 80;
                    float _2402 = _2398;
                    if (_2328)
                    {
                        _2388 = _1578;
                    }
                    float _2404 = _2388;
                    float _2406 = _2404;
                    if (_2350)
                    {
                        _2406 = _1596;
                    }
                    float _2408 = _2406;
                    float _2410 = _2408;
                    if (_2328)
                    {
                        _2352 = _1632;
                    }
                    float _2412 = _2352;
                    float _2414 = _2412;
                    if (_2328)
                    {
                        _2402 = _1640;
                    }
                    float _2416 = _2402;
                    float _2418 = _2416;
                    if (_2350)
                    {
                        _2418 = _1658;
                    }
                    float _2420 = _2418;
                    bool _2422 = _2170 == 96;
                    float _2424 = _2420;
                    if (_2350)
                    {
                        _2396 = _1604;
                    }
                    float _2426 = _2396;
                    float _2428 = _2426;
                    if (_2350)
                    {
                        _2414 = _1650;
                    }
                    float _2430 = _2414;
                    float _2432 = _2430;
                    if (_2372)
                    {
                        _2432 = _1744;
                    }
                    float _2434 = _2432;
                    int _2436 = _2180 << 4;
                    float _2438 = _2434;
                    if (_2372)
                    {
                        _2410 = _1726;
                    }
                    float _2440 = _2410;
                    float _2442 = _2440;
                    if (_2372)
                    {
                        _2428 = _1734;
                    }
                    float _2444 = _2428;
                    float _2446 = _2444;
                    if (_2382)
                    {
                        _2446 = _1770;
                    }
                    float _2448 = _2446;
                    float _2450 = _2448;
                    if (_2372)
                    {
                        _2424 = _1752;
                    }
                    float _2452 = _2424;
                    bool _2454 = _2170 == 112;
                    float _2456 = _2452;
                    if (_2382)
                    {
                        _2442 = _1762;
                    }
                    float _2458 = _2442;
                    float _2460 = _2458;
                    if (_2400)
                    {
                        _2460 = _1798;
                    }
                    float _2462 = _2460;
                    float _2464 = _2462;
                    if (_2382)
                    {
                        _2438 = _1780;
                    }
                    float _2466 = _2438;
                    float _2468 = _2466;
                    if (_2382)
                    {
                        _2456 = _1788;
                    }
                    float _2470 = _2456;
                    float _2472 = _2470;
                    if (_2400)
                    {
                        _2472 = _1824;
                    }
                    float _2474 = _2472;
                    bool _2476 = _2170 == 128;
                    float _2478 = _2474;
                    if (_2400)
                    {
                        _2450 = _1806;
                    }
                    float _2480 = _2450;
                    float _2482 = _2480;
                    if (_2400)
                    {
                        _2468 = _1816;
                    }
                    float _2484 = _2468;
                    float _2486 = _2484;
                    if (_2422)
                    {
                        _2486 = _1850;
                    }
                    float _2488 = _2486;
                    bool _2490 = _2170 == 144;
                    float _2492 = _2488;
                    if (_2422)
                    {
                        _2464 = _1832;
                    }
                    float _2494 = _2464;
                    float _2496 = _2494;
                    if (_2422)
                    {
                        _2482 = _1840;
                    }
                    float _2498 = _2482;
                    float _2500 = _2498;
                    if (_2454)
                    {
                        _2500 = _1876;
                    }
                    float _2502 = _2500;
                    float _2504 = _2502;
                    if (_2422)
                    {
                        _2478 = _1858;
                    }
                    float _2506 = _2478;
                    bool _2508 = _2436 == 0;
                    float _2510 = _2506;
                    if (_2454)
                    {
                        _2496 = _1868;
                    }
                    float _2512 = _2496;
                    float _2514 = _2512;
                    if (_2476)
                    {
                        _2514 = _1904;
                    }
                    float _2516 = _2514;
                    float _2518 = _2516;
                    if (_2454)
                    {
                        _2492 = _1886;
                    }
                    float _2520 = _2492;
                    float _2522 = _2520;
                    if (_2454)
                    {
                        _2510 = _1894;
                    }
                    float _2524 = _2510;
                    float _2526 = _2524;
                    if (_2476)
                    {
                        _2526 = _1930;
                    }
                    float _2528 = _2526;
                    bool _2530 = _2436 == 16;
                    float _2532 = _2528;
                    if (_2476)
                    {
                        _2504 = _1912;
                    }
                    float _2534 = _2504;
                    float _2536 = _2534;
                    if (_2476)
                    {
                        _2522 = _1922;
                    }
                    float _2538 = _2522;
                    float _2540 = _2538;
                    if (_2490)
                    {
                        _2540 = _1956;
                    }
                    float _2542 = _2540;
                    bool _2544 = _2162 == 176;
                    float _2546 = _2542;
                    if (_2508)
                    {
                        _2182 = _1566;
                    }
                    float _2548 = _2182;
                    bool _2550 = _2436 == 32;
                    float _2552 = _2548;
                    if (_2490)
                    {
                        _2518 = _1938;
                    }
                    float _2554 = _2518;
                    float _2556 = _2554;
                    if (_2490)
                    {
                        _2536 = _1946;
                    }
                    float _2558 = _2536;
                    float _2560 = _2558;
                    if (_2490)
                    {
                        _2532 = _1964;
                    }
                    float _2562 = _2532;
                    bool _2564 = _2436 == 48;
                    float _2566 = _2562;
                    if (_2508)
                    {
                        _2184 = _1558;
                    }
                    float _2568 = _2184;
                    float _2570 = _2568;
                    if (_2530)
                    {
                        _2570 = _1578;
                    }
                    float _2572 = _2570;
                    float _2574 = _2572;
                    if (_2508)
                    {
                        _2122 = _1614;
                    }
                    float _2576 = _2122;
                    float _2578 = _2576;
                    if (_2544)
                    {
                        _2378 = _2018;
                    }
                    float _2580 = _2378;
                    if (_2508)
                    {
                        _2124 = _1622;
                    }
                    float _2582 = _2124;
                    float _2584 = _2582;
                    if (_2530)
                    {
                        _2584 = _1640;
                    }
                    float _2586 = _2584;
                    bool _2588 = _2436 == 64;
                    float _2590 = _2586;
                    if (_2544)
                    {
                        _2360 = _2010;
                    }
                    float _2592 = _2360;
                    if (_2530)
                    {
                        _2552 = _1586;
                    }
                    float _2594 = _2552;
                    float _2596 = _1546 * _2580;
                    float _2598 = _2594;
                    if (_2530)
                    {
                        _2578 = _1632;
                    }
                    float _2600 = _2578;
                    float _2602 = _2600;
                    if (_2550)
                    {
                        _2602 = _1650;
                    }
                    float _2604 = _2602;
                    bool _2606 = _2436 == 80;
                    float _2608 = fma(_1544, _2592, _2596);
                    _2042 = _2608;
                    float _2610 = _2604;
                    if (_2550)
                    {
                        _2574 = _1596;
                    }
                    float _2612 = _2574;
                    float _2614 = _2612;
                    if (_2544)
                    {
                        _2384 = _2028;
                    }
                    float _2616 = _2384;
                    _2048 = _2616;
                    if (_2550)
                    {
                        _2598 = _1604;
                    }
                    float _2618 = _2598;
                    float _2620 = _2618;
                    if (_2564)
                    {
                        _2620 = _1734;
                    }
                    float _2622 = _2620;
                    float _2624 = _2622;
                    if (_2550)
                    {
                        _2590 = _1658;
                    }
                    float _2626 = _2590;
                    bool _2628 = _2436 == 96;
                    float _2630 = _2626;
                    if (_2564)
                    {
                        _2614 = _1726;
                    }
                    float _2632 = _2614;
                    float _2634 = _2632;
                    if (_2588)
                    {
                        _2634 = _1762;
                    }
                    float _2636 = _2634;
                    float _2638 = _2636;
                    if (_2564)
                    {
                        _2610 = _1744;
                    }
                    float _2640 = _2610;
                    float _2642 = _2640;
                    if (_2564)
                    {
                        _2630 = _1752;
                    }
                    float _2644 = _2630;
                    float _2646 = _2644;
                    if (_2588)
                    {
                        _2646 = _1788;
                    }
                    float _2648 = _2646;
                    bool _2650 = _2436 == 112;
                    float _2652 = _2648;
                    if (_2588)
                    {
                        _2624 = _1770;
                    }
                    float _2654 = _2624;
                    float _2656 = _2654;
                    if (_2588)
                    {
                        _2642 = _1780;
                    }
                    float _2658 = _2642;
                    float _2660 = _2658;
                    if (_2606)
                    {
                        _2660 = _1816;
                    }
                    float _2662 = _2660;
                    bool _2664 = _2436 == 128;
                    float _2666 = _2662;
                    if (_2606)
                    {
                        _2638 = _1798;
                    }
                    float _2668 = _2638;
                    float _2670 = _2668;
                    if (_2606)
                    {
                        _2656 = _1806;
                    }
                    float _2672 = _2656;
                    float _2674 = _2672;
                    if (_2628)
                    {
                        _2674 = _1840;
                    }
                    float _2676 = _2674;
                    float _2678 = _2676;
                    if (_2606)
                    {
                        _2652 = _1824;
                    }
                    float _2680 = _2652;
                    float _2682 = _2680;
                    if (_2628)
                    {
                        _2670 = _1832;
                    }
                    float _2684 = _2670;
                    float _2686 = _2684;
                    if (_2650)
                    {
                        _2686 = _1868;
                    }
                    float _2688 = _2686;
                    float _2690 = _2688;
                    if (_2628)
                    {
                        _2666 = _1850;
                    }
                    float _2692 = _2666;
                    float _2694 = _2692;
                    if (_2628)
                    {
                        _2682 = _1858;
                    }
                    float _2696 = _2682;
                    float _2698 = _2696;
                    if (_2650)
                    {
                        _2698 = _1894;
                    }
                    float _2700 = _2698;
                    bool _2702 = _2436 == 144;
                    float _2704 = _2700;
                    if (_2650)
                    {
                        _2678 = _1876;
                    }
                    float _2706 = _2678;
                    float _2708 = _2706;
                    if (_2650)
                    {
                        _2694 = _1886;
                    }
                    float _2710 = _2694;
                    bool _2712 = _2436 == 160;
                    float _2714 = _2710;
                    if (_2664)
                    {
                        _2690 = _1904;
                    }
                    float _2716 = _2690;
                    float _2718 = _2716;
                    if (_2664)
                    {
                        _2708 = _1912;
                    }
                    float _2720 = _2708;
                    float _2722 = _2720;
                    if (_2664)
                    {
                        _2714 = _1922;
                    }
                    float _2724 = _2714;
                    float _2726 = _2724;
                    if (_2702)
                    {
                        _2718 = _1938;
                    }
                    float _2728 = _2718;
                    float _2730 = _2728;
                    if (_2664)
                    {
                        _2704 = _1930;
                    }
                    float _2732 = _2704;
                    float _2734 = _2732;
                    if (_2702)
                    {
                        _2726 = _1956;
                    }
                    float _2736 = _2726;
                    bool _2738 = _2170 == 160;
                    bool _2740 = _2436 == 176;
                    float _2742 = _2736;
                    if (_2712)
                    {
                        _2742 = _1992;
                    }
                    float _2744 = _2742;
                    bool _2746 = _2170 == 176;
                    float _2748 = _2744;
                    if (_2702)
                    {
                        _2722 = _1946;
                    }
                    float _2750 = _2722;
                    float _2752 = _2750;
                    if (_2712)
                    {
                        _2752 = _1982;
                    }
                    float _2754 = _2752;
                    float _2756 = _2754;
                    if (_2712)
                    {
                        _2730 = _1974;
                    }
                    float _2758 = _2730;
                    float _2760 = _2758;
                    if (_2544)
                    {
                        _2374 = _2036;
                    }
                    float _2762 = _2374;
                    _2054 = _2762;
                    if (_2738)
                    {
                        _2560 = _1982;
                    }
                    float _2764 = _2560;
                    float _2766 = _2764;
                    if (_2740)
                    {
                        _2756 = _2018;
                    }
                    float _2768 = _2756;
                    if (_2746)
                    {
                        _2766 = _2018;
                    }
                    float _2770 = _2766;
                    if (_2738)
                    {
                        _2556 = _1974;
                    }
                    float _2772 = _2556;
                    float _2774 = _2772;
                    if (_2746)
                    {
                        _2774 = _2010;
                    }
                    float _2776 = _2774;
                    float _2778 = _1546 * _2770;
                    _2044 = _2778;
                    if (_2740)
                    {
                        _2760 = _2010;
                    }
                    float _2780 = _2760;
                    float _2782 = _1546 * _2768;
                    bool _2784 = _2160 >= as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
                    float _2786 = fma(_1544, _2776, _2778);
                    if (_2738)
                    {
                        _2546 = _1992;
                    }
                    float _2788 = _2546;
                    float _2790 = fma(_1544, _2780, _2782);
                    _2040 = _2790;
                    float _2792 = _2788;
                    if (_2746)
                    {
                        _2792 = _2028;
                    }
                    float _2794 = _2792;
                    float _2796 = fma(_1548, _2616, _2608);
                    _2050 = _2794;
                    if (_2740)
                    {
                        _2748 = _2028;
                    }
                    float _2798 = _2748;
                    _2052 = _2798;
                    if (_2702)
                    {
                        _2734 = _1964;
                    }
                    float _2800 = _2734;
                    float _2802 = _2800;
                    if (_2712)
                    {
                        _2802 = _2000;
                    }
                    float _2804 = _2802;
                    float _2806 = _2804;
                    if (_2738)
                    {
                        _2566 = _2000;
                    }
                    float _2808 = _2566;
                    float _2810 = _2808;
                    if (_2746)
                    {
                        _2810 = _2036;
                    }
                    float _2812 = _2810;
                    _2056 = _2812;
                    if (_2740)
                    {
                        _2806 = _2036;
                    }
                    float _2814 = _2806;
                    float _2816 = fma(_1548, _2794, _2786);
                    float _2818 = fma(_1548, _2798, _2790);
                    float _2820 = _2796 + _2762;
                    float _2822 = _2816 + _2812;
                    float _2824 = _2818 + _2814;
                    _2826 = fma(_2820, _2156, _2128);
                    _2828 = fma(_2822, _2156, _2132);
                    _2830 = fma(_2824, _2156, _2136);
                    _2060 = !_2784;
                    _1686 = _2826;
                    _1688 = _2828;
                    _1704 = _2830;
                    _2046 = _2822;
                    _2058 = _2814;
                } while (_2060);
                _1698 = _2826;
                _1712 = _2830;
                _1706 = _2828;
            }
            float _2832 = _1698;
            float _2834 = _1712;
            float _2836 = _1706;
            _182 = _2836;
            if (!_1568)
            {
                _1690 = _2832;
            }
            float _2838 = _1690;
            float _2840 = _2838;
            if (!_1568)
            {
                _1692 = _2834;
            }
            float _2842 = _1692;
            _186 = _2842;
            if (_1568)
            {
                _2840 = _2832;
            }
            float _2844 = _2840;
            _184 = _2844;
            if (_1568)
            {
                _186 = _2834;
            }
        }
    }
    _188 = false;
    float _2846 = _182;
    float _2848 = _184;
    float _2850 = _186;
    bool _2852 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _2854 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _2856 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _2860 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[0].x, _2854);
    float _2862 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[1].x, _2856);
    float _2864 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[2].x, _2858);
    float _2866 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[0].z, _2860);
    float _2868 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[1].z, _2862);
    float _2870 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[2].z, _2864);
    float _2872 = _2866 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _2874 = _2868 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _2876 = _2870 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _2878 = _2854;
    float _2880 = _2848;
    int _3012;
    int _3014;
    int _3016;
    int _3018;
    if (!_2852)
    {
        float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _2884 = _2850 + _2882;
        float _2886 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _2888 = _2848 + _2886;
        float _2890 = _2884 * _2884;
        float _2892 = fma(_2888, _2888, _2890);
        float _2894 = sqrt(_2892);
        bool _2896 = _2894 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _2898 = _2890;
        if (!_2896)
        {
            _2878 = _2876;
        }
        float _2900 = _2878;
        float _2902 = _2900;
        if (!_2896)
        {
            _2880 = _2874;
        }
        float _2904 = _2880;
        float _2906 = _2904;
        if (!_2896)
        {
            _2898 = _2872;
        }
        float _2908 = _2898;
        bool _2910 = !_2896;
        float _2912 = _2908;
        if (!_2910)
        {
            float _2914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _2918 = _2894 + _2916;
            float _2920 = _2846 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2922 = rsqrt(_2892);
            float _2924 = _2918 * _2914;
            float _2926 = _2924 * 0.15915493667125701904296875;
            float _2928 = _2926 * 6.283185482025146484375;
            float _2930 = cos(_2928);
            float _2932 = _2926 * 6.283185482025146484375;
            float _2934 = sin(_2932);
            float _2936 = _2930 + (-1.0);
            float _2938 = fma(_2934, _2920, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _2940 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2942 = _2922 * _2938;
            float _2944 = fma(_2930, _2846, _2940);
            float _2946 = fma(_2888, _2942, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _2948 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _2950 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _2952 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _2954 = fma(_2884, _2942, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _2956 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[0].x, _2948);
            float _2958 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[1].x, _2950);
            float _2960 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[2].x, _2952);
            float _2962 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[0].z, _2956);
            float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[1].z, _2958);
            float _2966 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[2].z, _2960);
            float _2968 = _2962 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _2970 = _2964 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _2972 = _2966 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _2906 = _2970;
            _2912 = _2968;
            _2902 = _2972;
        }
        float _2974 = _2906;
        float _2976 = _2912;
        float _2978 = _2902;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _2982 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _2984 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _2986 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[7].x, _2980);
        float _2990 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[8].x, _2982);
        float _2992 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[9].x, _2984);
        float _2994 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[10].x, _2986);
        float _2996 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[7].z, _2988);
        float _2998 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[8].z, _2990);
        float _3000 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[9].z, _2992);
        float _3002 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[10].z, _2994);
        float _3004 = _2996 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _3006 = _2998 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _3008 = _3000 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _3010 = _3002 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _3012 = as_type<int>(_3004);
        _3014 = as_type<int>(_3006);
        _3016 = as_type<int>(_3008);
        _3018 = as_type<int>(_3010);
        _3020 = true;
    }
    else
    {
        float _3022 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _3024 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _3026 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _3028 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _3030 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[7].x, _3022);
        float _3032 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[8].x, _3024);
        float _3034 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[9].x, _3026);
        float _3036 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[10].x, _3028);
        float _3038 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[7].z, _3030);
        float _3040 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[8].z, _3032);
        float _3042 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[9].z, _3034);
        float _3044 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[10].z, _3036);
        float _3046 = _3038 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _3048 = _3040 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _3050 = _3042 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _3052 = _3044 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _3012 = as_type<int>(_3046);
        _3014 = as_type<int>(_3048);
        _3016 = as_type<int>(_3050);
        _3018 = as_type<int>(_3052);
    }
    _3020 = false;
    int _3054 = _3012;
    int _3056 = _3014;
    int _3058 = _3016;
    int _3060 = _3018;
    float _7743 = as_type<float>(_3054);
    out.gl_Position.x = _7743;
    float _7746 = as_type<float>(_3056);
    out.gl_Position.y = _7746;
    float _7749 = as_type<float>(_3058);
    out.gl_Position.z = _7749;
    float _7752 = as_type<float>(_3060);
    out.gl_Position.w = _7752;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    bool _3020 = false;
    bool _188 = false;
    bool _2146 = false;
    bool _800 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    bool _63 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[8].w);
    bool _65 = !_63;
    float _182;
    float _184;
    float _186;
    if (!_65)
    {
        bool _67 = 0 != as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
        if (!_67)
        {
            float _70 = as_type<float>(int(gl_InstanceIndex));
            float _72 = as_type<float>(int(gl_BaseInstance));
            int _75 = as_type<int>(_70) - as_type<int>(_72);
            float _77 = in.m_42.x;
            float _79 = in.m_42.y;
            float _81 = in.m_42.z;
            int _83 = _75 + as_type<int>(as_type<float>(gl_BaseInstance));
            int _85 = _83 * 80;
            int _87 = _85 + 16;
            int _89 = _85 + 32;
            uint _92 = uint(int(uint(_85) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_92)];
            float _94 = as_type<float>(_dmw0.x);
            int _96 = _85 + 4;
            uint _98 = uint(int(uint(_96) >> uint(2)));
            float _100 = as_type<float>(_dmw0.y);
            int _102 = _85 + 8;
            uint _104 = uint(int(uint(_102) >> uint(2)));
            float _106 = as_type<float>(_dmw0.z);
            int _108 = _85 + 12;
            uint _110 = uint(int(uint(_108) >> uint(2)));
            float _112 = as_type<float>(_dmw0.w);
            uint _114 = uint(int(uint(_87) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_114)];
            float _116 = as_type<float>(_dmw1.x);
            int _118 = _87 + 4;
            uint _120 = uint(int(uint(_118) >> uint(2)));
            float _122 = as_type<float>(_dmw1.y);
            int _124 = _87 + 8;
            uint _126 = uint(int(uint(_124) >> uint(2)));
            float _128 = as_type<float>(_dmw1.z);
            int _130 = _87 + 12;
            uint _132 = uint(int(uint(_130) >> uint(2)));
            float _134 = as_type<float>(_dmw1.w);
            uint _136 = uint(int(uint(_89) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_136)];
            float _138 = as_type<float>(_dmw2.x);
            int _140 = _89 + 4;
            uint _142 = uint(int(uint(_140) >> uint(2)));
            float _144 = as_type<float>(_dmw2.y);
            int _146 = _89 + 8;
            uint _148 = uint(int(uint(_146) >> uint(2)));
            float _150 = as_type<float>(_dmw2.z);
            int _152 = _89 + 12;
            uint _154 = uint(int(uint(_152) >> uint(2)));
            float _156 = as_type<float>(_dmw2.w);
            float _158 = _100 * _79;
            float _160 = _122 * _79;
            float _162 = fma(_94, _77, _158);
            float _164 = _144 * _79;
            float _166 = fma(_116, _77, _160);
            float _168 = fma(_106, _81, _162);
            float _170 = fma(_138, _77, _164);
            float _172 = fma(_128, _81, _166);
            float _174 = _112 + _168;
            float _176 = fma(_150, _81, _170);
            float _178 = _134 + _172;
            float _180 = _156 + _176;
            _182 = _178;
            _184 = _174;
            _186 = _180;
            _188 = true;
        }
        else
        {
            float _190 = as_type<float>(in.m_46.x);
            float _192 = as_type<float>(in.m_46.y);
            float _194 = as_type<float>(in.m_46.z);
            float _196 = as_type<float>(in.m_46.w);
            float _198 = in.m_42.x;
            float _200 = in.m_42.y;
            float _202 = in.m_42.z;
            int _204 = as_type<int>(_190) * 48;
            int _206 = _204 + 16;
            uint _208 = uint(int(uint(_206) >> uint(2)));
            uint _210 = uint(int(uint(int(_208)) >> uint(2)));
            int _212 = int(_208) & 3;
            float _214 = (*spvDescriptorSet0.vp_c5)._m0[int(_210)][_212];
            int _216 = int(_208) + 1;
            uint _218 = uint(int(uint(_216) >> uint(2)));
            int _220 = _216 & 3;
            float _222 = (*spvDescriptorSet0.vp_c5)._m0[int(_218)][_220];
            bool _224 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x) > 1;
            uint _226 = uint(int(uint(_204) >> uint(2)));
            uint _228 = uint(int(uint(int(_226)) >> uint(2)));
            int _230 = int(_226) & 3;
            float _232 = (*spvDescriptorSet0.vp_c5)._m0[int(_228)][_230];
            int _234 = int(_226) + 1;
            uint _236 = uint(int(uint(_234) >> uint(2)));
            int _238 = _234 & 3;
            float _240 = (*spvDescriptorSet0.vp_c5)._m0[int(_236)][_238];
            int _242 = _204 + 32;
            uint _244 = uint(int(uint(_242) >> uint(2)));
            uint _246 = uint(int(uint(int(_244)) >> uint(2)));
            int _248 = int(_244) & 3;
            float _250 = (*spvDescriptorSet0.vp_c5)._m0[int(_246)][_248];
            int _252 = int(_244) + 1;
            uint _254 = uint(int(uint(_252) >> uint(2)));
            int _256 = _252 & 3;
            float _258 = (*spvDescriptorSet0.vp_c5)._m0[int(_254)][_256];
            int _260 = _204 + 24;
            uint _262 = uint(int(uint(_260) >> uint(2)));
            uint _264 = uint(int(uint(int(_262)) >> uint(2)));
            int _266 = int(_262) & 3;
            float _268 = (*spvDescriptorSet0.vp_c5)._m0[int(_264)][_266];
            int _270 = int(_262) + 1;
            uint _272 = uint(int(uint(_270) >> uint(2)));
            int _274 = _270 & 3;
            float _276 = (*spvDescriptorSet0.vp_c5)._m0[int(_272)][_274];
            int _278 = _204 + 8;
            uint _280 = uint(int(uint(_278) >> uint(2)));
            uint _282 = uint(int(uint(int(_280)) >> uint(2)));
            int _284 = int(_280) & 3;
            float _286 = (*spvDescriptorSet0.vp_c5)._m0[int(_282)][_284];
            int _288 = int(_280) + 1;
            uint _290 = uint(int(uint(_288) >> uint(2)));
            int _292 = _288 & 3;
            float _294 = (*spvDescriptorSet0.vp_c5)._m0[int(_290)][_292];
            int _296 = _204 + 40;
            uint _298 = uint(int(uint(_296) >> uint(2)));
            uint _300 = uint(int(uint(int(_298)) >> uint(2)));
            int _302 = int(_298) & 3;
            float _304 = (*spvDescriptorSet0.vp_c5)._m0[int(_300)][_302];
            int _306 = int(_298) + 1;
            uint _308 = uint(int(uint(_306) >> uint(2)));
            int _310 = _306 & 3;
            float _312 = (*spvDescriptorSet0.vp_c5)._m0[int(_308)][_310];
            float _314 = _200 * _222;
            float _316 = fma(_198, _214, _314);
            float _318 = _200 * _240;
            float _320 = fma(_198, _232, _318);
            float _322 = _200 * _258;
            float _324 = fma(_198, _250, _322);
            float _326 = fma(_202, _268, _316);
            float _328 = _326 + _276;
            float _330 = fma(_202, _286, _320);
            float _332 = _320;
            float _334 = _326;
            float _336 = _330;
            float _338 = _328;
            float _340 = _200;
            float _342 = _198;
            if (!_224)
            {
                _332 = _328;
            }
            float _344 = _332;
            float _346 = _330 + _294;
            float _348 = fma(_202, _304, _324);
            float _350 = _346;
            float _352 = _344;
            if (!_224)
            {
                _334 = _346;
            }
            float _354 = _334;
            float _356 = _348 + _312;
            float _358 = _356;
            float _360 = _354;
            if (!_224)
            {
                _336 = _356;
            }
            float _362 = _336;
            bool _364 = !_224;
            float _366 = _362;
            if (!_364)
            {
                int _368 = as_type<int>(_192) * 48;
                int _370 = as_type<int>(_194) * 48;
                int _372 = as_type<int>(_196) * 48;
                uint _374 = uint(int(uint(_368) >> uint(2)));
                uint _376 = uint(int(uint(int(_374)) >> uint(2)));
                int _378 = int(_374) & 3;
                float _380 = (*spvDescriptorSet0.vp_c5)._m0[int(_376)][_378];
                int _382 = int(_374) + 1;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                int _386 = _382 & 3;
                float _388 = (*spvDescriptorSet0.vp_c5)._m0[int(_384)][_386];
                int _390 = _368 + 8;
                uint _392 = uint(int(uint(_390) >> uint(2)));
                uint _394 = uint(int(uint(int(_392)) >> uint(2)));
                int _396 = int(_392) & 3;
                float _398 = (*spvDescriptorSet0.vp_c5)._m0[int(_394)][_396];
                int _400 = int(_392) + 1;
                uint _402 = uint(int(uint(_400) >> uint(2)));
                int _404 = _400 & 3;
                float _406 = (*spvDescriptorSet0.vp_c5)._m0[int(_402)][_404];
                int _408 = _368 + 16;
                uint _410 = uint(int(uint(_408) >> uint(2)));
                uint _412 = uint(int(uint(int(_410)) >> uint(2)));
                int _414 = int(_410) & 3;
                float _416 = (*spvDescriptorSet0.vp_c5)._m0[int(_412)][_414];
                int _418 = int(_410) + 1;
                uint _420 = uint(int(uint(_418) >> uint(2)));
                int _422 = _418 & 3;
                float _424 = (*spvDescriptorSet0.vp_c5)._m0[int(_420)][_422];
                int _426 = _368 + 24;
                uint _428 = uint(int(uint(_426) >> uint(2)));
                uint _430 = uint(int(uint(int(_428)) >> uint(2)));
                int _432 = int(_428) & 3;
                float _434 = (*spvDescriptorSet0.vp_c5)._m0[int(_430)][_432];
                int _436 = int(_428) + 1;
                uint _438 = uint(int(uint(_436) >> uint(2)));
                int _440 = _436 & 3;
                float _442 = (*spvDescriptorSet0.vp_c5)._m0[int(_438)][_440];
                int _444 = _368 + 32;
                uint _446 = uint(int(uint(_444) >> uint(2)));
                uint _448 = uint(int(uint(int(_446)) >> uint(2)));
                int _450 = int(_446) & 3;
                float _452 = (*spvDescriptorSet0.vp_c5)._m0[int(_448)][_450];
                int _454 = int(_446) + 1;
                uint _456 = uint(int(uint(_454) >> uint(2)));
                int _458 = _454 & 3;
                float _460 = (*spvDescriptorSet0.vp_c5)._m0[int(_456)][_458];
                int _462 = _368 + 40;
                uint _464 = uint(int(uint(_462) >> uint(2)));
                uint _466 = uint(int(uint(int(_464)) >> uint(2)));
                int _468 = int(_464) & 3;
                float _470 = (*spvDescriptorSet0.vp_c5)._m0[int(_466)][_468];
                int _472 = int(_464) + 1;
                uint _474 = uint(int(uint(_472) >> uint(2)));
                int _476 = _472 & 3;
                float _478 = (*spvDescriptorSet0.vp_c5)._m0[int(_474)][_476];
                uint _480 = uint(int(uint(_370) >> uint(2)));
                uint _482 = uint(int(uint(int(_480)) >> uint(2)));
                int _484 = int(_480) & 3;
                float _486 = (*spvDescriptorSet0.vp_c5)._m0[int(_482)][_484];
                int _488 = int(_480) + 1;
                uint _490 = uint(int(uint(_488) >> uint(2)));
                int _492 = _488 & 3;
                float _494 = (*spvDescriptorSet0.vp_c5)._m0[int(_490)][_492];
                int _496 = _370 + 8;
                uint _498 = uint(int(uint(_496) >> uint(2)));
                uint _500 = uint(int(uint(int(_498)) >> uint(2)));
                int _502 = int(_498) & 3;
                float _504 = (*spvDescriptorSet0.vp_c5)._m0[int(_500)][_502];
                int _506 = int(_498) + 1;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                int _510 = _506 & 3;
                float _512 = (*spvDescriptorSet0.vp_c5)._m0[int(_508)][_510];
                int _514 = _370 + 16;
                uint _516 = uint(int(uint(_514) >> uint(2)));
                uint _518 = uint(int(uint(int(_516)) >> uint(2)));
                int _520 = int(_516) & 3;
                float _522 = (*spvDescriptorSet0.vp_c5)._m0[int(_518)][_520];
                int _524 = int(_516) + 1;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                int _528 = _524 & 3;
                float _530 = (*spvDescriptorSet0.vp_c5)._m0[int(_526)][_528];
                int _532 = _370 + 24;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                uint _536 = uint(int(uint(int(_534)) >> uint(2)));
                int _538 = int(_534) & 3;
                float _540 = (*spvDescriptorSet0.vp_c5)._m0[int(_536)][_538];
                int _542 = int(_534) + 1;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                int _546 = _542 & 3;
                float _548 = (*spvDescriptorSet0.vp_c5)._m0[int(_544)][_546];
                int _550 = _370 + 32;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                uint _554 = uint(int(uint(int(_552)) >> uint(2)));
                int _556 = int(_552) & 3;
                float _558 = (*spvDescriptorSet0.vp_c5)._m0[int(_554)][_556];
                int _560 = int(_552) + 1;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                int _564 = _560 & 3;
                float _566 = (*spvDescriptorSet0.vp_c5)._m0[int(_562)][_564];
                int _568 = _370 + 40;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.vp_c5)._m0[int(_572)][_574];
                int _578 = int(_570) + 1;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                int _582 = _578 & 3;
                float _584 = (*spvDescriptorSet0.vp_c5)._m0[int(_580)][_582];
                uint _586 = uint(int(uint(_372) >> uint(2)));
                uint _588 = uint(int(uint(int(_586)) >> uint(2)));
                int _590 = int(_586) & 3;
                float _592 = (*spvDescriptorSet0.vp_c5)._m0[int(_588)][_590];
                int _594 = int(_586) + 1;
                uint _596 = uint(int(uint(_594) >> uint(2)));
                int _598 = _594 & 3;
                float _600 = (*spvDescriptorSet0.vp_c5)._m0[int(_596)][_598];
                int _602 = _372 + 8;
                uint _604 = uint(int(uint(_602) >> uint(2)));
                uint _606 = uint(int(uint(int(_604)) >> uint(2)));
                int _608 = int(_604) & 3;
                float _610 = (*spvDescriptorSet0.vp_c5)._m0[int(_606)][_608];
                int _612 = int(_604) + 1;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                int _616 = _612 & 3;
                float _618 = (*spvDescriptorSet0.vp_c5)._m0[int(_614)][_616];
                int _620 = _372 + 16;
                uint _622 = uint(int(uint(_620) >> uint(2)));
                uint _624 = uint(int(uint(int(_622)) >> uint(2)));
                int _626 = int(_622) & 3;
                float _628 = (*spvDescriptorSet0.vp_c5)._m0[int(_624)][_626];
                int _630 = int(_622) + 1;
                uint _632 = uint(int(uint(_630) >> uint(2)));
                int _634 = _630 & 3;
                float _636 = (*spvDescriptorSet0.vp_c5)._m0[int(_632)][_634];
                int _638 = _372 + 24;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                uint _642 = uint(int(uint(int(_640)) >> uint(2)));
                int _644 = int(_640) & 3;
                float _646 = (*spvDescriptorSet0.vp_c5)._m0[int(_642)][_644];
                int _648 = int(_640) + 1;
                uint _650 = uint(int(uint(_648) >> uint(2)));
                int _652 = _648 & 3;
                float _654 = (*spvDescriptorSet0.vp_c5)._m0[int(_650)][_652];
                int _656 = _372 + 32;
                uint _658 = uint(int(uint(_656) >> uint(2)));
                uint _660 = uint(int(uint(int(_658)) >> uint(2)));
                int _662 = int(_658) & 3;
                float _664 = (*spvDescriptorSet0.vp_c5)._m0[int(_660)][_662];
                int _666 = int(_658) + 1;
                uint _668 = uint(int(uint(_666) >> uint(2)));
                int _670 = _666 & 3;
                float _672 = (*spvDescriptorSet0.vp_c5)._m0[int(_668)][_670];
                int _674 = _372 + 40;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                uint _678 = uint(int(uint(int(_676)) >> uint(2)));
                int _680 = int(_676) & 3;
                float _682 = (*spvDescriptorSet0.vp_c5)._m0[int(_678)][_680];
                int _684 = int(_676) + 1;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                int _688 = _684 & 3;
                float _690 = (*spvDescriptorSet0.vp_c5)._m0[int(_686)][_688];
                int _692 = 1;
                float _694 = 0.0;
                float _696 = 0.0;
                float _698 = 0.0;
                float _700 = 0.0;
                float _702 = 0.0;
                float _704 = 0.0;
                float _706 = 0.0;
                float _708 = 0.0;
                float _710 = 0.0;
                float _712 = 0.0;
                bool _714;
                float _1476;
                float _1482;
                float _1484;
                do
                {
                    int _716 = _692;
                    float _718 = _350;
                    float _720 = _338;
                    float _722 = _358;
                    float _724 = _694;
                    float _726 = _696;
                    float _728 = _698;
                    float _730 = _700;
                    float _732 = _702;
                    float _734 = _704;
                    float _736 = _706;
                    float _738 = _708;
                    float _740 = _710;
                    float _742 = _712;
                    float _744 = in.m_48.x;
                    int _746 = _716 & 3;
                    bool _748 = _716 != 1;
                    bool _750 = _746 >= 2;
                    float _752 = _718;
                    float _754 = _720;
                    float _756 = _722;
                    float _758 = _744;
                    float _760 = _724;
                    float _762 = _726;
                    float _764 = _734;
                    float _766 = _732;
                    float _768 = _728;
                    float _770 = _740;
                    float _772 = _730;
                    float _774 = _736;
                    float _776 = _742;
                    float _778 = _738;
                    if (!_748)
                    {
                        float _780 = _718 * _744;
                        _752 = _780;
                    }
                    float _782 = _752;
                    if (!_748)
                    {
                        float _784 = _720 * _744;
                        _754 = _784;
                    }
                    float _786 = _754;
                    if (!_748)
                    {
                        float _788 = _722 * _744;
                        _756 = _788;
                    }
                    float _790 = _756;
                    bool _792 = !_750;
                    if (!_792)
                    {
                        bool _794 = _746 >= 3;
                        bool _796 = !_794;
                        if (!_796)
                        {
                            bool _798 = _746 != 3;
                            _800 = _798;
                            if (!_800)
                            {
                                float _802 = in.m_48.w;
                                _758 = _802;
                                _800 = true;
                            }
                        }
                        else
                        {
                            float _804 = in.m_48.z;
                            _758 = _804;
                            _800 = true;
                        }
                    }
                    else
                    {
                        bool _806 = _746 != 1;
                        if (!_806)
                        {
                            float _808 = in.m_48.y;
                            _758 = _808;
                        }
                    }
                    _800 = false;
                    float _810 = _758;
                    int _812 = _716 * 3;
                    int _814 = _716 + 1;
                    int _816 = _812 * 16;
                    int _818 = _812 + 1;
                    int _820 = _812 + 2;
                    bool _822 = _816 == 0;
                    bool _824 = _816 == 16;
                    int _826 = _820 * 16;
                    bool _828 = _816 == 32;
                    bool _830 = _816 == 48;
                    bool _832 = _816 == 64;
                    bool _834 = _816 == 80;
                    int _836 = _818 << 4;
                    _692 = _814;
                    float _838 = as_type<float>(_820);
                    float _840 = as_type<float>(_816);
                    if (_822)
                    {
                        _760 = _240;
                    }
                    float _842 = _760;
                    float _844 = _842;
                    if (_822)
                    {
                        _762 = _232;
                    }
                    float _846 = _762;
                    float _848 = _846;
                    if (_822)
                    {
                        _764 = _294;
                    }
                    float _850 = _764;
                    float _852 = _850;
                    if (_822)
                    {
                        _766 = _286;
                    }
                    float _854 = _766;
                    float _856 = _854;
                    if (_824)
                    {
                        _844 = _222;
                    }
                    float _858 = _844;
                    bool _860 = _816 == 96;
                    float _862 = _858;
                    if (_824)
                    {
                        _852 = _276;
                    }
                    float _864 = _852;
                    float _866 = _864;
                    if (_824)
                    {
                        _848 = _214;
                    }
                    float _868 = _848;
                    float _870 = _868;
                    if (_828)
                    {
                        _862 = _258;
                    }
                    float _872 = _862;
                    float _874 = _872;
                    if (_824)
                    {
                        _856 = _268;
                    }
                    float _876 = _856;
                    float _878 = _876;
                    if (_828)
                    {
                        _866 = _312;
                    }
                    float _880 = _866;
                    bool _882 = _816 == 112;
                    float _884 = _880;
                    if (_830)
                    {
                        _874 = _388;
                    }
                    float _886 = _874;
                    float _888 = _886;
                    if (_828)
                    {
                        _870 = _250;
                    }
                    float _890 = _870;
                    float _892 = _890;
                    if (_830)
                    {
                        _884 = _406;
                    }
                    float _894 = _884;
                    float _896 = _894;
                    if (_828)
                    {
                        _878 = _304;
                    }
                    float _898 = _878;
                    float _900 = _898;
                    if (_832)
                    {
                        _888 = _424;
                    }
                    float _902 = _888;
                    float _904 = _902;
                    if (_830)
                    {
                        _892 = _380;
                    }
                    float _906 = _892;
                    float _908 = _906;
                    if (_832)
                    {
                        _896 = _442;
                    }
                    float _910 = _896;
                    float _912 = _910;
                    if (_830)
                    {
                        _900 = _398;
                    }
                    float _914 = _900;
                    float _916 = _914;
                    if (_834)
                    {
                        _904 = _460;
                    }
                    float _918 = _904;
                    bool _920 = _816 == 128;
                    float _922 = _918;
                    if (_834)
                    {
                        _912 = _478;
                    }
                    float _924 = _912;
                    float _926 = _924;
                    if (_832)
                    {
                        _908 = _416;
                    }
                    float _928 = _908;
                    float _930 = _928;
                    if (_860)
                    {
                        _922 = _494;
                    }
                    float _932 = _922;
                    float _934 = _932;
                    if (_832)
                    {
                        _916 = _434;
                    }
                    float _936 = _916;
                    float _938 = _936;
                    if (_860)
                    {
                        _926 = _512;
                    }
                    float _940 = _926;
                    bool _942 = _816 == 144;
                    float _944 = _940;
                    if (_882)
                    {
                        _934 = _530;
                    }
                    float _946 = _934;
                    float _948 = _946;
                    if (_834)
                    {
                        _930 = _452;
                    }
                    float _950 = _930;
                    float _952 = _950;
                    if (_882)
                    {
                        _944 = _548;
                    }
                    float _954 = _944;
                    float _956 = _954;
                    if (_834)
                    {
                        _938 = _470;
                    }
                    float _958 = _938;
                    bool _960 = _816 == 160;
                    float _962 = _958;
                    if (_920)
                    {
                        _948 = _566;
                    }
                    float _964 = _948;
                    float _966 = _964;
                    if (_860)
                    {
                        _952 = _486;
                    }
                    float _968 = _952;
                    float _970 = _968;
                    if (_920)
                    {
                        _956 = _584;
                    }
                    float _972 = _956;
                    float _974 = _972;
                    if (_860)
                    {
                        _962 = _504;
                    }
                    float _976 = _962;
                    bool _978 = _836 == 0;
                    float _980 = _976;
                    if (_942)
                    {
                        _966 = _600;
                    }
                    float _982 = _966;
                    float _984 = _982;
                    if (_882)
                    {
                        _970 = _522;
                    }
                    float _986 = _970;
                    float _988 = _986;
                    if (_942)
                    {
                        _974 = _618;
                    }
                    float _990 = _974;
                    float _992 = _990;
                    if (_882)
                    {
                        _980 = _540;
                    }
                    float _994 = _980;
                    bool _996 = _836 == 16;
                    float _998 = _994;
                    if (_960)
                    {
                        _984 = _636;
                    }
                    float _1000 = _984;
                    float _1002 = _1000;
                    if (_920)
                    {
                        _988 = _558;
                    }
                    float _1004 = _988;
                    float _1006 = _1004;
                    if (_960)
                    {
                        _992 = _654;
                    }
                    float _1008 = _992;
                    float _1010 = _1008;
                    if (_920)
                    {
                        _998 = _576;
                    }
                    float _1012 = _998;
                    bool _1014 = _836 == 32;
                    float _1016 = _1012;
                    if (_978)
                    {
                        _768 = _240;
                    }
                    float _1018 = _768;
                    float _1020 = _1018;
                    if (_942)
                    {
                        _1006 = _592;
                    }
                    float _1022 = _1006;
                    float _1024 = _1022;
                    if (_978)
                    {
                        _770 = _294;
                    }
                    float _1026 = _770;
                    float _1028 = _1026;
                    if (_942)
                    {
                        _1016 = _610;
                    }
                    float _1030 = _1016;
                    bool _1032 = _836 == 48;
                    float _1034 = _1030;
                    if (_996)
                    {
                        _1020 = _222;
                    }
                    float _1036 = _1020;
                    float _1038 = _1036;
                    if (_960)
                    {
                        _1024 = _628;
                    }
                    float _1040 = _1024;
                    float _1042 = _1040;
                    if (_996)
                    {
                        _1028 = _276;
                    }
                    float _1044 = _1028;
                    float _1046 = _1044;
                    if (_960)
                    {
                        _1034 = _646;
                    }
                    float _1048 = _1034;
                    bool _1050 = _836 == 64;
                    float _1052 = _1048;
                    if (_1014)
                    {
                        _1038 = _258;
                    }
                    float _1054 = _1038;
                    float _1056 = _1054;
                    if (_978)
                    {
                        _772 = _232;
                    }
                    float _1058 = _772;
                    float _1060 = _1058;
                    if (_1014)
                    {
                        _1046 = _312;
                    }
                    float _1062 = _1046;
                    float _1064 = _1062;
                    if (_978)
                    {
                        _774 = _286;
                    }
                    float _1066 = _774;
                    bool _1068 = _836 == 80;
                    float _1070 = _1066;
                    if (_1032)
                    {
                        _1056 = _388;
                    }
                    float _1072 = _1056;
                    float _1074 = _1072;
                    if (_996)
                    {
                        _1060 = _214;
                    }
                    float _1076 = _1060;
                    float _1078 = _1076;
                    if (_1032)
                    {
                        _1064 = _406;
                    }
                    float _1080 = _1064;
                    float _1082 = _1080;
                    if (_996)
                    {
                        _1070 = _268;
                    }
                    float _1084 = _1070;
                    bool _1086 = _836 == 96;
                    float _1088 = _1084;
                    if (_1050)
                    {
                        _1074 = _424;
                    }
                    float _1090 = _1074;
                    float _1092 = _1090;
                    if (_1014)
                    {
                        _1078 = _250;
                    }
                    float _1094 = _1078;
                    float _1096 = _1094;
                    if (_1050)
                    {
                        _1082 = _442;
                    }
                    float _1098 = _1082;
                    float _1100 = _1098;
                    if (_1014)
                    {
                        _1088 = _304;
                    }
                    float _1102 = _1088;
                    float _1104 = _1102;
                    if (_1032)
                    {
                        _1096 = _380;
                    }
                    float _1106 = _1096;
                    float _1108 = _1106;
                    if (_1068)
                    {
                        _1092 = _460;
                    }
                    float _1110 = _1092;
                    float _1112 = _1110;
                    if (_1032)
                    {
                        _1104 = _398;
                    }
                    float _1114 = _1104;
                    float _1116 = _1114;
                    if (_1068)
                    {
                        _1100 = _478;
                    }
                    float _1118 = _1100;
                    bool _1120 = _836 == 112;
                    float _1122 = _1118;
                    if (_1050)
                    {
                        _1108 = _416;
                    }
                    float _1124 = _1108;
                    float _1126 = _1124;
                    if (_1086)
                    {
                        _1112 = _494;
                    }
                    float _1128 = _1112;
                    float _1130 = _1128;
                    if (_1050)
                    {
                        _1116 = _434;
                    }
                    float _1132 = _1116;
                    float _1134 = _1132;
                    if (_1086)
                    {
                        _1122 = _512;
                    }
                    float _1136 = _1122;
                    bool _1138 = _836 == 128;
                    float _1140 = _1136;
                    if (_1068)
                    {
                        _1126 = _452;
                    }
                    float _1142 = _1126;
                    float _1144 = _1142;
                    if (_1068)
                    {
                        _1134 = _470;
                    }
                    float _1146 = _1134;
                    bool _1148 = _836 == 144;
                    float _1150 = _1146;
                    if (_1120)
                    {
                        _1130 = _530;
                    }
                    float _1152 = _1130;
                    float _1154 = _1152;
                    if (_1086)
                    {
                        _1144 = _486;
                    }
                    float _1156 = _1144;
                    float _1158 = _1156;
                    if (_1120)
                    {
                        _1140 = _548;
                    }
                    float _1160 = _1140;
                    float _1162 = _1160;
                    if (_1086)
                    {
                        _1150 = _504;
                    }
                    float _1164 = _1150;
                    bool _1166 = _826 == 0;
                    float _1168 = _1164;
                    if (_1138)
                    {
                        _1154 = _566;
                    }
                    float _1170 = _1154;
                    float _1172 = _1170;
                    if (_1120)
                    {
                        _1158 = _522;
                    }
                    float _1174 = _1158;
                    float _1176 = _1174;
                    if (_1138)
                    {
                        _1162 = _584;
                    }
                    float _1178 = _1162;
                    float _1180 = _1178;
                    if (_1120)
                    {
                        _1168 = _540;
                    }
                    float _1182 = _1168;
                    bool _1184 = _826 == 16;
                    float _1186 = _1182;
                    if (_1148)
                    {
                        _1172 = _600;
                    }
                    float _1188 = _1172;
                    float _1190 = _1188;
                    if (_1138)
                    {
                        _1176 = _558;
                    }
                    float _1192 = _1176;
                    float _1194 = _1192;
                    if (_1148)
                    {
                        _1180 = _618;
                    }
                    float _1196 = _1180;
                    float _1198 = _1196;
                    if (_1138)
                    {
                        _1186 = _576;
                    }
                    float _1200 = _1186;
                    bool _1202 = _816 == 176;
                    float _1204 = _1200;
                    if (_1166)
                    {
                        _838 = _240;
                    }
                    float _1206 = _838;
                    bool _1208 = _826 == 32;
                    float _1210 = _1206;
                    if (_1166)
                    {
                        _776 = _294;
                    }
                    float _1212 = _776;
                    float _1214 = _1212;
                    if (_1148)
                    {
                        _1194 = _592;
                    }
                    float _1216 = _1194;
                    float _1218 = _1216;
                    if (_1148)
                    {
                        _1204 = _610;
                    }
                    float _1220 = _1204;
                    float _1222 = _1220;
                    if (_1184)
                    {
                        _1210 = _222;
                    }
                    float _1224 = _1210;
                    bool _1226 = _826 == 48;
                    float _1228 = _1224;
                    if (_1184)
                    {
                        _1214 = _276;
                    }
                    float _1230 = _1214;
                    float _1232 = _1230;
                    if (_1166)
                    {
                        _840 = _232;
                    }
                    float _1234 = _840;
                    float _1236 = _1234;
                    if (_1166)
                    {
                        _778 = _286;
                    }
                    float _1238 = _778;
                    float _1240 = _1238;
                    if (_1202)
                    {
                        _1042 = _664;
                    }
                    float _1242 = _1042;
                    bool _1244 = _826 == 64;
                    if (_1208)
                    {
                        _1228 = _258;
                    }
                    float _1246 = _1228;
                    float _1248 = _1246;
                    if (_1184)
                    {
                        _1236 = _214;
                    }
                    float _1250 = _1236;
                    float _1252 = _1250;
                    if (_1208)
                    {
                        _1232 = _312;
                    }
                    float _1254 = _1232;
                    float _1256 = _1254;
                    if (_1184)
                    {
                        _1240 = _268;
                    }
                    float _1258 = _1240;
                    float _1260 = _1258;
                    if (_1202)
                    {
                        _1052 = _682;
                    }
                    float _1262 = _1052;
                    bool _1264 = _826 == 80;
                    _702 = _1262;
                    if (_1226)
                    {
                        _1248 = _388;
                    }
                    float _1266 = _1248;
                    float _1268 = _1266;
                    if (_1208)
                    {
                        _1252 = _250;
                    }
                    float _1270 = _1252;
                    float _1272 = _1270;
                    if (_1226)
                    {
                        _1256 = _406;
                    }
                    float _1274 = _1256;
                    float _1276 = _1274;
                    if (_1208)
                    {
                        _1260 = _304;
                    }
                    float _1278 = _1260;
                    bool _1280 = _826 == 96;
                    float _1282 = _1278;
                    if (_1244)
                    {
                        _1268 = _424;
                    }
                    float _1284 = _1268;
                    float _1286 = _1284;
                    if (_1226)
                    {
                        _1272 = _380;
                    }
                    float _1288 = _1272;
                    float _1290 = _1288;
                    if (_1244)
                    {
                        _1276 = _442;
                    }
                    float _1292 = _1276;
                    float _1294 = _1292;
                    if (_1226)
                    {
                        _1282 = _398;
                    }
                    float _1296 = _1282;
                    bool _1298 = _826 == 112;
                    float _1300 = _1296;
                    if (_1264)
                    {
                        _1286 = _460;
                    }
                    float _1302 = _1286;
                    float _1304 = _1302;
                    if (_1244)
                    {
                        _1290 = _416;
                    }
                    float _1306 = _1290;
                    float _1308 = _1306;
                    if (_1264)
                    {
                        _1294 = _478;
                    }
                    float _1310 = _1294;
                    float _1312 = _1310;
                    if (_1244)
                    {
                        _1300 = _434;
                    }
                    float _1314 = _1300;
                    bool _1316 = _826 == 128;
                    float _1318 = _1314;
                    if (_1280)
                    {
                        _1304 = _494;
                    }
                    float _1320 = _1304;
                    float _1322 = _1320;
                    if (_1264)
                    {
                        _1308 = _452;
                    }
                    float _1324 = _1308;
                    float _1326 = _1324;
                    if (_1280)
                    {
                        _1312 = _512;
                    }
                    float _1328 = _1312;
                    float _1330 = _1328;
                    if (_1264)
                    {
                        _1318 = _470;
                    }
                    float _1332 = _1318;
                    float _1334 = _1332;
                    if (_1280)
                    {
                        _1326 = _486;
                    }
                    float _1336 = _1326;
                    float _1338 = _1336;
                    if (_1298)
                    {
                        _1322 = _530;
                    }
                    float _1340 = _1322;
                    float _1342 = _1340;
                    if (_1280)
                    {
                        _1334 = _504;
                    }
                    float _1344 = _1334;
                    float _1346 = _1344;
                    if (_1298)
                    {
                        _1330 = _548;
                    }
                    float _1348 = _1330;
                    bool _1350 = _826 == 144;
                    float _1352 = _1348;
                    if (_1298)
                    {
                        _1338 = _522;
                    }
                    float _1354 = _1338;
                    float _1356 = _1354;
                    if (_1316)
                    {
                        _1342 = _566;
                    }
                    float _1358 = _1342;
                    float _1360 = _1358;
                    if (_1298)
                    {
                        _1346 = _540;
                    }
                    float _1362 = _1346;
                    float _1364 = _1362;
                    if (_1316)
                    {
                        _1364 = _576;
                    }
                    float _1366 = _1364;
                    bool _1368 = _826 == 160;
                    float _1370 = _1366;
                    if (_1316)
                    {
                        _1356 = _558;
                    }
                    float _1372 = _1356;
                    float _1374 = _1372;
                    if (_1316)
                    {
                        _1352 = _584;
                    }
                    float _1376 = _1352;
                    bool _1378 = _836 == 160;
                    float _1380 = _1376;
                    if (_1350)
                    {
                        _1374 = _592;
                    }
                    float _1382 = _1374;
                    bool _1384 = _826 == 176;
                    float _1386 = _1382;
                    if (_1350)
                    {
                        _1370 = _610;
                    }
                    float _1388 = _1370;
                    bool _1390 = _836 == 176;
                    float _1392 = _1388;
                    if (_1202)
                    {
                        _1002 = _672;
                    }
                    float _1394 = _1002;
                    if (_1368)
                    {
                        _1392 = _646;
                    }
                    float _1396 = _1392;
                    float _1398 = _1396;
                    if (_1350)
                    {
                        _1360 = _600;
                    }
                    float _1400 = _1360;
                    float _1402 = _1400;
                    if (_1368)
                    {
                        _1402 = _636;
                    }
                    float _1404 = _1402;
                    float _1406 = _200 * _1394;
                    float _1408 = _1404;
                    if (_1368)
                    {
                        _1386 = _628;
                    }
                    float _1410 = _1386;
                    float _1412 = _1410;
                    if (_1378)
                    {
                        _1190 = _636;
                    }
                    float _1414 = _1190;
                    float _1416 = fma(_198, _1242, _1406);
                    _696 = _1416;
                    float _1418 = _1414;
                    if (_1384)
                    {
                        _1408 = _672;
                    }
                    float _1420 = _1408;
                    if (_1390)
                    {
                        _1418 = _672;
                    }
                    float _1422 = _1418;
                    if (_1378)
                    {
                        _1218 = _628;
                    }
                    float _1424 = _1218;
                    float _1426 = _1424;
                    if (_1390)
                    {
                        _1426 = _664;
                    }
                    float _1428 = _1426;
                    float _1430 = _200 * _1422;
                    _698 = _1430;
                    if (_1384)
                    {
                        _1412 = _664;
                    }
                    float _1432 = _1412;
                    float _1434 = _200 * _1420;
                    if (_1202)
                    {
                        _1010 = _690;
                    }
                    float _1436 = _1010;
                    float _1438 = fma(_198, _1428, _1430);
                    bool _1440 = _814 >= as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
                    float _1442 = fma(_198, _1432, _1434);
                    _694 = _1442;
                    _704 = _1436;
                    if (_1378)
                    {
                        _1222 = _646;
                    }
                    float _1444 = _1222;
                    float _1446 = fma(_202, _1262, _1416);
                    float _1448 = _1444;
                    if (_1390)
                    {
                        _1448 = _682;
                    }
                    float _1450 = _1448;
                    _706 = _1450;
                    if (_1384)
                    {
                        _1398 = _682;
                    }
                    float _1452 = _1398;
                    float _1454 = _1446 + _1436;
                    _708 = _1452;
                    if (_1350)
                    {
                        _1380 = _618;
                    }
                    float _1456 = _1380;
                    float _1458 = _1456;
                    if (_1368)
                    {
                        _1458 = _654;
                    }
                    float _1460 = _1458;
                    float _1462 = _1460;
                    if (_1378)
                    {
                        _1198 = _654;
                    }
                    float _1464 = _1198;
                    float _1466 = _1464;
                    if (_1390)
                    {
                        _1466 = _690;
                    }
                    float _1468 = _1466;
                    _710 = _1468;
                    if (_1384)
                    {
                        _1462 = _690;
                    }
                    float _1470 = _1462;
                    float _1472 = fma(_202, _1450, _1438);
                    float _1474 = fma(_202, _1452, _1442);
                    _1476 = fma(_1454, _810, _782);
                    float _1478 = _1472 + _1468;
                    float _1480 = _1474 + _1470;
                    _1482 = fma(_1478, _810, _786);
                    _1484 = fma(_1480, _810, _790);
                    _714 = !_1440;
                    _350 = _1476;
                    _338 = _1482;
                    _358 = _1484;
                    _700 = _1478;
                    _712 = _1470;
                } while (_714);
                _360 = _1476;
                _366 = _1484;
                _352 = _1482;
            }
            float _1486 = _360;
            float _1488 = _366;
            float _1490 = _352;
            _182 = _1490;
            if (!_224)
            {
                _340 = _1486;
            }
            float _1492 = _340;
            float _1494 = _1492;
            if (!_224)
            {
                _342 = _1488;
            }
            float _1496 = _342;
            float _1498 = _1496;
            if (_224)
            {
                _1494 = _1486;
            }
            float _1500 = _1494;
            _184 = _1500;
            if (_224)
            {
                _1498 = _1488;
            }
            float _1502 = _1498;
            _186 = _1502;
            _188 = true;
        }
    }
    else
    {
        bool _1504 = 0 != as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
        if (!_1504)
        {
            float _1506 = in.m_42.x;
            float _1508 = in.m_42.y;
            float _1510 = in.m_42.z;
            float _1512 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
            float _1514 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
            float _1516 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
            float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[0].x, _1512);
            float _1520 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[1].x, _1514);
            float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[2].x, _1516);
            float _1524 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[0].z, _1518);
            float _1526 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[1].z, _1520);
            float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[2].z, _1522);
            float _1530 = _1524 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
            float _1532 = _1526 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
            float _1534 = _1528 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
            _182 = _1532;
            _184 = _1530;
            _186 = _1534;
            _188 = true;
        }
        else
        {
            float _1536 = as_type<float>(in.m_46.x);
            float _1538 = as_type<float>(in.m_46.y);
            float _1540 = as_type<float>(in.m_46.z);
            float _1542 = as_type<float>(in.m_46.w);
            float _1544 = in.m_42.x;
            float _1546 = in.m_42.y;
            float _1548 = in.m_42.z;
            int _1550 = as_type<int>(_1536) * 48;
            uint _1552 = uint(int(uint(_1550) >> uint(2)));
            uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
            int _1556 = int(_1552) & 3;
            float _1558 = (*spvDescriptorSet0.vp_c5)._m0[int(_1554)][_1556];
            int _1560 = int(_1552) + 1;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            int _1564 = _1560 & 3;
            float _1566 = (*spvDescriptorSet0.vp_c5)._m0[int(_1562)][_1564];
            bool _1568 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x) > 1;
            int _1570 = _1550 + 16;
            uint _1572 = uint(int(uint(_1570) >> uint(2)));
            uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
            int _1576 = int(_1572) & 3;
            float _1578 = (*spvDescriptorSet0.vp_c5)._m0[int(_1574)][_1576];
            int _1580 = int(_1572) + 1;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            int _1584 = _1580 & 3;
            float _1586 = (*spvDescriptorSet0.vp_c5)._m0[int(_1582)][_1584];
            int _1588 = _1550 + 32;
            uint _1590 = uint(int(uint(_1588) >> uint(2)));
            uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
            int _1594 = int(_1590) & 3;
            float _1596 = (*spvDescriptorSet0.vp_c5)._m0[int(_1592)][_1594];
            int _1598 = int(_1590) + 1;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            int _1602 = _1598 & 3;
            float _1604 = (*spvDescriptorSet0.vp_c5)._m0[int(_1600)][_1602];
            int _1606 = _1550 + 8;
            uint _1608 = uint(int(uint(_1606) >> uint(2)));
            uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
            int _1612 = int(_1608) & 3;
            float _1614 = (*spvDescriptorSet0.vp_c5)._m0[int(_1610)][_1612];
            int _1616 = int(_1608) + 1;
            uint _1618 = uint(int(uint(_1616) >> uint(2)));
            int _1620 = _1616 & 3;
            float _1622 = (*spvDescriptorSet0.vp_c5)._m0[int(_1618)][_1620];
            int _1624 = _1550 + 24;
            uint _1626 = uint(int(uint(_1624) >> uint(2)));
            uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
            int _1630 = int(_1626) & 3;
            float _1632 = (*spvDescriptorSet0.vp_c5)._m0[int(_1628)][_1630];
            int _1634 = int(_1626) + 1;
            uint _1636 = uint(int(uint(_1634) >> uint(2)));
            int _1638 = _1634 & 3;
            float _1640 = (*spvDescriptorSet0.vp_c5)._m0[int(_1636)][_1638];
            int _1642 = _1550 + 40;
            uint _1644 = uint(int(uint(_1642) >> uint(2)));
            uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
            int _1648 = int(_1644) & 3;
            float _1650 = (*spvDescriptorSet0.vp_c5)._m0[int(_1646)][_1648];
            int _1652 = int(_1644) + 1;
            uint _1654 = uint(int(uint(_1652) >> uint(2)));
            int _1656 = _1652 & 3;
            float _1658 = (*spvDescriptorSet0.vp_c5)._m0[int(_1654)][_1656];
            float _1660 = _1546 * _1566;
            float _1662 = fma(_1544, _1558, _1660);
            float _1664 = _1546 * _1586;
            float _1666 = fma(_1544, _1578, _1664);
            float _1668 = _1546 * _1604;
            float _1670 = fma(_1544, _1596, _1668);
            float _1672 = fma(_1548, _1614, _1662);
            float _1674 = _1672 + _1622;
            float _1676 = fma(_1548, _1632, _1666);
            float _1678 = _1676 + _1640;
            float _1680 = _1676;
            float _1682 = _1662;
            float _1684 = _1672;
            float _1686 = _1674;
            float _1688 = _1678;
            float _1690 = _1546;
            float _1692 = _1544;
            if (!_1568)
            {
                _1680 = _1674;
            }
            float _1694 = _1680;
            float _1696 = fma(_1548, _1650, _1670);
            float _1698 = _1694;
            if (!_1568)
            {
                _1682 = _1678;
            }
            float _1700 = _1682;
            float _1702 = _1696 + _1658;
            float _1704 = _1702;
            float _1706 = _1700;
            if (!_1568)
            {
                _1684 = _1702;
            }
            float _1708 = _1684;
            bool _1710 = !_1568;
            float _1712 = _1708;
            if (!_1710)
            {
                int _1714 = as_type<int>(_1538) * 48;
                int _1716 = as_type<int>(_1540) * 48;
                int _1718 = as_type<int>(_1542) * 48;
                uint _1720 = uint(int(uint(_1714) >> uint(2)));
                uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
                int _1724 = int(_1720) & 3;
                float _1726 = (*spvDescriptorSet0.vp_c5)._m0[int(_1722)][_1724];
                int _1728 = int(_1720) + 1;
                uint _1730 = uint(int(uint(_1728) >> uint(2)));
                int _1732 = _1728 & 3;
                float _1734 = (*spvDescriptorSet0.vp_c5)._m0[int(_1730)][_1732];
                int _1736 = _1714 + 8;
                uint _1738 = uint(int(uint(_1736) >> uint(2)));
                uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
                int _1742 = int(_1738) & 3;
                float _1744 = (*spvDescriptorSet0.vp_c5)._m0[int(_1740)][_1742];
                int _1746 = int(_1738) + 1;
                uint _1748 = uint(int(uint(_1746) >> uint(2)));
                int _1750 = _1746 & 3;
                float _1752 = (*spvDescriptorSet0.vp_c5)._m0[int(_1748)][_1750];
                int _1754 = _1714 + 16;
                uint _1756 = uint(int(uint(_1754) >> uint(2)));
                uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
                int _1760 = int(_1756) & 3;
                float _1762 = (*spvDescriptorSet0.vp_c5)._m0[int(_1758)][_1760];
                int _1764 = int(_1756) + 1;
                uint _1766 = uint(int(uint(_1764) >> uint(2)));
                int _1768 = _1764 & 3;
                float _1770 = (*spvDescriptorSet0.vp_c5)._m0[int(_1766)][_1768];
                int _1772 = _1714 + 24;
                uint _1774 = uint(int(uint(_1772) >> uint(2)));
                uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
                int _1778 = int(_1774) & 3;
                float _1780 = (*spvDescriptorSet0.vp_c5)._m0[int(_1776)][_1778];
                int _1782 = int(_1774) + 1;
                uint _1784 = uint(int(uint(_1782) >> uint(2)));
                int _1786 = _1782 & 3;
                float _1788 = (*spvDescriptorSet0.vp_c5)._m0[int(_1784)][_1786];
                int _1790 = _1714 + 32;
                uint _1792 = uint(int(uint(_1790) >> uint(2)));
                uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
                int _1796 = int(_1792) & 3;
                float _1798 = (*spvDescriptorSet0.vp_c5)._m0[int(_1794)][_1796];
                int _1800 = int(_1792) + 1;
                uint _1802 = uint(int(uint(_1800) >> uint(2)));
                int _1804 = _1800 & 3;
                float _1806 = (*spvDescriptorSet0.vp_c5)._m0[int(_1802)][_1804];
                int _1808 = _1714 + 40;
                uint _1810 = uint(int(uint(_1808) >> uint(2)));
                uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
                int _1814 = int(_1810) & 3;
                float _1816 = (*spvDescriptorSet0.vp_c5)._m0[int(_1812)][_1814];
                int _1818 = int(_1810) + 1;
                uint _1820 = uint(int(uint(_1818) >> uint(2)));
                int _1822 = _1818 & 3;
                float _1824 = (*spvDescriptorSet0.vp_c5)._m0[int(_1820)][_1822];
                uint _1826 = uint(int(uint(_1716) >> uint(2)));
                uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
                int _1830 = int(_1826) & 3;
                float _1832 = (*spvDescriptorSet0.vp_c5)._m0[int(_1828)][_1830];
                int _1834 = int(_1826) + 1;
                uint _1836 = uint(int(uint(_1834) >> uint(2)));
                int _1838 = _1834 & 3;
                float _1840 = (*spvDescriptorSet0.vp_c5)._m0[int(_1836)][_1838];
                int _1842 = _1716 + 8;
                uint _1844 = uint(int(uint(_1842) >> uint(2)));
                uint _1846 = uint(int(uint(int(_1844)) >> uint(2)));
                int _1848 = int(_1844) & 3;
                float _1850 = (*spvDescriptorSet0.vp_c5)._m0[int(_1846)][_1848];
                int _1852 = int(_1844) + 1;
                uint _1854 = uint(int(uint(_1852) >> uint(2)));
                int _1856 = _1852 & 3;
                float _1858 = (*spvDescriptorSet0.vp_c5)._m0[int(_1854)][_1856];
                int _1860 = _1716 + 16;
                uint _1862 = uint(int(uint(_1860) >> uint(2)));
                uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
                int _1866 = int(_1862) & 3;
                float _1868 = (*spvDescriptorSet0.vp_c5)._m0[int(_1864)][_1866];
                int _1870 = int(_1862) + 1;
                uint _1872 = uint(int(uint(_1870) >> uint(2)));
                int _1874 = _1870 & 3;
                float _1876 = (*spvDescriptorSet0.vp_c5)._m0[int(_1872)][_1874];
                int _1878 = _1716 + 24;
                uint _1880 = uint(int(uint(_1878) >> uint(2)));
                uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
                int _1884 = int(_1880) & 3;
                float _1886 = (*spvDescriptorSet0.vp_c5)._m0[int(_1882)][_1884];
                int _1888 = int(_1880) + 1;
                uint _1890 = uint(int(uint(_1888) >> uint(2)));
                int _1892 = _1888 & 3;
                float _1894 = (*spvDescriptorSet0.vp_c5)._m0[int(_1890)][_1892];
                int _1896 = _1716 + 32;
                uint _1898 = uint(int(uint(_1896) >> uint(2)));
                uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
                int _1902 = int(_1898) & 3;
                float _1904 = (*spvDescriptorSet0.vp_c5)._m0[int(_1900)][_1902];
                int _1906 = int(_1898) + 1;
                uint _1908 = uint(int(uint(_1906) >> uint(2)));
                int _1910 = _1906 & 3;
                float _1912 = (*spvDescriptorSet0.vp_c5)._m0[int(_1908)][_1910];
                int _1914 = _1716 + 40;
                uint _1916 = uint(int(uint(_1914) >> uint(2)));
                uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
                int _1920 = int(_1916) & 3;
                float _1922 = (*spvDescriptorSet0.vp_c5)._m0[int(_1918)][_1920];
                int _1924 = int(_1916) + 1;
                uint _1926 = uint(int(uint(_1924) >> uint(2)));
                int _1928 = _1924 & 3;
                float _1930 = (*spvDescriptorSet0.vp_c5)._m0[int(_1926)][_1928];
                uint _1932 = uint(int(uint(_1718) >> uint(2)));
                uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
                int _1936 = int(_1932) & 3;
                float _1938 = (*spvDescriptorSet0.vp_c5)._m0[int(_1934)][_1936];
                int _1940 = int(_1932) + 1;
                uint _1942 = uint(int(uint(_1940) >> uint(2)));
                int _1944 = _1940 & 3;
                float _1946 = (*spvDescriptorSet0.vp_c5)._m0[int(_1942)][_1944];
                int _1948 = _1718 + 8;
                uint _1950 = uint(int(uint(_1948) >> uint(2)));
                uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
                int _1954 = int(_1950) & 3;
                float _1956 = (*spvDescriptorSet0.vp_c5)._m0[int(_1952)][_1954];
                int _1958 = int(_1950) + 1;
                uint _1960 = uint(int(uint(_1958) >> uint(2)));
                int _1962 = _1958 & 3;
                float _1964 = (*spvDescriptorSet0.vp_c5)._m0[int(_1960)][_1962];
                int _1966 = _1718 + 16;
                uint _1968 = uint(int(uint(_1966) >> uint(2)));
                uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
                int _1972 = int(_1968) & 3;
                float _1974 = (*spvDescriptorSet0.vp_c5)._m0[int(_1970)][_1972];
                int _1976 = int(_1968) + 1;
                uint _1978 = uint(int(uint(_1976) >> uint(2)));
                int _1980 = _1976 & 3;
                float _1982 = (*spvDescriptorSet0.vp_c5)._m0[int(_1978)][_1980];
                int _1984 = _1718 + 24;
                uint _1986 = uint(int(uint(_1984) >> uint(2)));
                uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
                int _1990 = int(_1986) & 3;
                float _1992 = (*spvDescriptorSet0.vp_c5)._m0[int(_1988)][_1990];
                int _1994 = int(_1986) + 1;
                uint _1996 = uint(int(uint(_1994) >> uint(2)));
                int _1998 = _1994 & 3;
                float _2000 = (*spvDescriptorSet0.vp_c5)._m0[int(_1996)][_1998];
                int _2002 = _1718 + 32;
                uint _2004 = uint(int(uint(_2002) >> uint(2)));
                uint _2006 = uint(int(uint(int(_2004)) >> uint(2)));
                int _2008 = int(_2004) & 3;
                float _2010 = (*spvDescriptorSet0.vp_c5)._m0[int(_2006)][_2008];
                int _2012 = int(_2004) + 1;
                uint _2014 = uint(int(uint(_2012) >> uint(2)));
                int _2016 = _2012 & 3;
                float _2018 = (*spvDescriptorSet0.vp_c5)._m0[int(_2014)][_2016];
                int _2020 = _1718 + 40;
                uint _2022 = uint(int(uint(_2020) >> uint(2)));
                uint _2024 = uint(int(uint(int(_2022)) >> uint(2)));
                int _2026 = int(_2022) & 3;
                float _2028 = (*spvDescriptorSet0.vp_c5)._m0[int(_2024)][_2026];
                int _2030 = int(_2022) + 1;
                uint _2032 = uint(int(uint(_2030) >> uint(2)));
                int _2034 = _2030 & 3;
                float _2036 = (*spvDescriptorSet0.vp_c5)._m0[int(_2032)][_2034];
                int _2038 = 1;
                float _2040 = 0.0;
                float _2042 = 0.0;
                float _2044 = 0.0;
                float _2046 = 0.0;
                float _2048 = 0.0;
                float _2050 = 0.0;
                float _2052 = 0.0;
                float _2054 = 0.0;
                float _2056 = 0.0;
                float _2058 = 0.0;
                bool _2060;
                float _2826;
                float _2828;
                float _2830;
                do
                {
                    int _2062 = _2038;
                    float _2064 = _1686;
                    float _2066 = _1688;
                    float _2068 = _1704;
                    float _2070 = _2040;
                    float _2072 = _2042;
                    float _2074 = _2044;
                    float _2076 = _2046;
                    float _2078 = _2048;
                    float _2080 = _2050;
                    float _2082 = _2052;
                    float _2084 = _2054;
                    float _2086 = _2056;
                    float _2088 = _2058;
                    float _2090 = in.m_48.x;
                    int _2092 = _2062 & 3;
                    bool _2094 = _2062 != 1;
                    bool _2096 = _2092 >= 2;
                    float _2098 = _2064;
                    float _2100 = _2066;
                    float _2102 = _2068;
                    float _2104 = _2090;
                    float _2106 = _2072;
                    float _2108 = _2070;
                    float _2110 = _2084;
                    float _2112 = _2078;
                    float _2114 = _2080;
                    float _2116 = _2076;
                    float _2118 = _2074;
                    float _2120 = _2086;
                    float _2122 = _2082;
                    float _2124 = _2088;
                    if (!_2094)
                    {
                        float _2126 = _2064 * _2090;
                        _2098 = _2126;
                    }
                    float _2128 = _2098;
                    if (!_2094)
                    {
                        float _2130 = _2066 * _2090;
                        _2100 = _2130;
                    }
                    float _2132 = _2100;
                    if (!_2094)
                    {
                        float _2134 = _2068 * _2090;
                        _2102 = _2134;
                    }
                    float _2136 = _2102;
                    bool _2138 = !_2096;
                    if (!_2138)
                    {
                        bool _2140 = _2092 >= 3;
                        bool _2142 = !_2140;
                        if (!_2142)
                        {
                            bool _2144 = _2092 != 3;
                            _2146 = _2144;
                            if (!_2146)
                            {
                                float _2148 = in.m_48.w;
                                _2104 = _2148;
                                _2146 = true;
                            }
                        }
                        else
                        {
                            float _2150 = in.m_48.z;
                            _2104 = _2150;
                            _2146 = true;
                        }
                    }
                    else
                    {
                        bool _2152 = _2092 != 1;
                        if (!_2152)
                        {
                            float _2154 = in.m_48.y;
                            _2104 = _2154;
                        }
                    }
                    _2146 = false;
                    float _2156 = _2104;
                    int _2158 = _2062 * 3;
                    int _2160 = _2062 + 1;
                    int _2162 = _2158 << 4;
                    int _2164 = _2158 + 1;
                    bool _2166 = _2162 == 0;
                    bool _2168 = _2162 == 16;
                    int _2170 = _2164 * 16;
                    bool _2172 = _2162 == 32;
                    bool _2174 = _2162 == 48;
                    bool _2176 = _2162 == 64;
                    bool _2178 = _2162 == 80;
                    int _2180 = _2158 + 2;
                    _2038 = _2160;
                    float _2182 = as_type<float>(_2180);
                    float _2184 = as_type<float>(_2162);
                    if (_2166)
                    {
                        _2106 = _1558;
                    }
                    float _2186 = _2106;
                    float _2188 = _2186;
                    if (_2166)
                    {
                        _2108 = _1566;
                    }
                    float _2190 = _2108;
                    float _2192 = _2190;
                    if (_2166)
                    {
                        _2110 = _1622;
                    }
                    float _2194 = _2110;
                    float _2196 = _2194;
                    if (_2166)
                    {
                        _2112 = _1614;
                    }
                    float _2198 = _2112;
                    float _2200 = _2198;
                    if (_2168)
                    {
                        _2200 = _1632;
                    }
                    float _2202 = _2200;
                    bool _2204 = _2162 == 96;
                    float _2206 = _2202;
                    if (_2168)
                    {
                        _2188 = _1578;
                    }
                    float _2208 = _2188;
                    float _2210 = _2208;
                    if (_2168)
                    {
                        _2192 = _1586;
                    }
                    float _2212 = _2192;
                    float _2214 = _2212;
                    if (_2172)
                    {
                        _2214 = _1604;
                    }
                    float _2216 = _2214;
                    float _2218 = _2216;
                    if (_2168)
                    {
                        _2196 = _1640;
                    }
                    float _2220 = _2196;
                    bool _2222 = _2162 == 112;
                    float _2224 = _2220;
                    if (_2172)
                    {
                        _2210 = _1596;
                    }
                    float _2226 = _2210;
                    float _2228 = _2226;
                    if (_2174)
                    {
                        _2228 = _1726;
                    }
                    float _2230 = _2228;
                    float _2232 = _2230;
                    if (_2172)
                    {
                        _2206 = _1650;
                    }
                    float _2234 = _2206;
                    float _2236 = _2234;
                    if (_2172)
                    {
                        _2224 = _1658;
                    }
                    float _2238 = _2224;
                    float _2240 = _2238;
                    if (_2174)
                    {
                        _2240 = _1752;
                    }
                    float _2242 = _2240;
                    float _2244 = _2242;
                    if (_2174)
                    {
                        _2218 = _1734;
                    }
                    float _2246 = _2218;
                    float _2248 = _2246;
                    if (_2174)
                    {
                        _2236 = _1744;
                    }
                    float _2250 = _2236;
                    float _2252 = _2250;
                    if (_2176)
                    {
                        _2252 = _1780;
                    }
                    float _2254 = _2252;
                    bool _2256 = _2162 == 128;
                    float _2258 = _2254;
                    if (_2176)
                    {
                        _2232 = _1762;
                    }
                    float _2260 = _2232;
                    float _2262 = _2260;
                    if (_2176)
                    {
                        _2248 = _1770;
                    }
                    float _2264 = _2248;
                    float _2266 = _2264;
                    if (_2178)
                    {
                        _2266 = _1806;
                    }
                    float _2268 = _2266;
                    float _2270 = _2268;
                    if (_2176)
                    {
                        _2244 = _1788;
                    }
                    float _2272 = _2244;
                    float _2274 = _2272;
                    if (_2204)
                    {
                        _2270 = _1840;
                    }
                    float _2276 = _2270;
                    bool _2278 = _2162 == 144;
                    float _2280 = _2276;
                    if (_2178)
                    {
                        _2262 = _1798;
                    }
                    float _2282 = _2262;
                    float _2284 = _2282;
                    if (_2178)
                    {
                        _2258 = _1816;
                    }
                    float _2286 = _2258;
                    float _2288 = _2286;
                    if (_2178)
                    {
                        _2274 = _1824;
                    }
                    float _2290 = _2274;
                    bool _2292 = _2162 == 160;
                    float _2294 = _2290;
                    if (_2204)
                    {
                        _2284 = _1832;
                    }
                    float _2296 = _2284;
                    float _2298 = _2296;
                    if (_2222)
                    {
                        _2298 = _1868;
                    }
                    float _2300 = _2298;
                    float _2302 = _2300;
                    if (_2204)
                    {
                        _2288 = _1850;
                    }
                    float _2304 = _2288;
                    float _2306 = _2304;
                    if (_2204)
                    {
                        _2294 = _1858;
                    }
                    float _2308 = _2294;
                    float _2310 = _2308;
                    if (_2222)
                    {
                        _2310 = _1894;
                    }
                    float _2312 = _2310;
                    bool _2314 = _2170 == 0;
                    float _2316 = _2312;
                    if (_2222)
                    {
                        _2280 = _1876;
                    }
                    float _2318 = _2280;
                    float _2320 = _2318;
                    if (_2222)
                    {
                        _2306 = _1886;
                    }
                    float _2322 = _2306;
                    float _2324 = _2322;
                    if (_2256)
                    {
                        _2324 = _1922;
                    }
                    float _2326 = _2324;
                    bool _2328 = _2170 == 16;
                    float _2330 = _2326;
                    if (_2256)
                    {
                        _2302 = _1904;
                    }
                    float _2332 = _2302;
                    float _2334 = _2332;
                    if (_2256)
                    {
                        _2320 = _1912;
                    }
                    float _2336 = _2320;
                    float _2338 = _2336;
                    if (_2278)
                    {
                        _2338 = _1946;
                    }
                    float _2340 = _2338;
                    float _2342 = _2340;
                    if (_2256)
                    {
                        _2316 = _1930;
                    }
                    float _2344 = _2316;
                    float _2346 = _2344;
                    if (_2314)
                    {
                        _2114 = _1614;
                    }
                    float _2348 = _2114;
                    bool _2350 = _2170 == 32;
                    float _2352 = _2348;
                    if (_2278)
                    {
                        _2334 = _1938;
                    }
                    float _2354 = _2334;
                    float _2356 = _2354;
                    if (_2292)
                    {
                        _2356 = _1974;
                    }
                    float _2358 = _2356;
                    float _2360 = _2358;
                    if (_2278)
                    {
                        _2330 = _1956;
                    }
                    float _2362 = _2330;
                    float _2364 = _2362;
                    if (_2278)
                    {
                        _2346 = _1964;
                    }
                    float _2366 = _2346;
                    float _2368 = _2366;
                    if (_2292)
                    {
                        _2368 = _2000;
                    }
                    float _2370 = _2368;
                    bool _2372 = _2170 == 48;
                    float _2374 = _2370;
                    if (_2292)
                    {
                        _2342 = _1982;
                    }
                    float _2376 = _2342;
                    float _2378 = _2376;
                    if (_2292)
                    {
                        _2364 = _1992;
                    }
                    float _2380 = _2364;
                    bool _2382 = _2170 == 64;
                    float _2384 = _2380;
                    if (_2314)
                    {
                        _2116 = _1558;
                    }
                    float _2386 = _2116;
                    float _2388 = _2386;
                    if (_2314)
                    {
                        _2118 = _1566;
                    }
                    float _2390 = _2118;
                    float _2392 = _2390;
                    if (_2328)
                    {
                        _2392 = _1586;
                    }
                    float _2394 = _2392;
                    float _2396 = _2394;
                    if (_2314)
                    {
                        _2120 = _1622;
                    }
                    float _2398 = _2120;
                    bool _2400 = _2170 == 80;
                    float _2402 = _2398;
                    if (_2328)
                    {
                        _2388 = _1578;
                    }
                    float _2404 = _2388;
                    float _2406 = _2404;
                    if (_2350)
                    {
                        _2406 = _1596;
                    }
                    float _2408 = _2406;
                    float _2410 = _2408;
                    if (_2328)
                    {
                        _2352 = _1632;
                    }
                    float _2412 = _2352;
                    float _2414 = _2412;
                    if (_2328)
                    {
                        _2402 = _1640;
                    }
                    float _2416 = _2402;
                    float _2418 = _2416;
                    if (_2350)
                    {
                        _2418 = _1658;
                    }
                    float _2420 = _2418;
                    bool _2422 = _2170 == 96;
                    float _2424 = _2420;
                    if (_2350)
                    {
                        _2396 = _1604;
                    }
                    float _2426 = _2396;
                    float _2428 = _2426;
                    if (_2350)
                    {
                        _2414 = _1650;
                    }
                    float _2430 = _2414;
                    float _2432 = _2430;
                    if (_2372)
                    {
                        _2432 = _1744;
                    }
                    float _2434 = _2432;
                    int _2436 = _2180 << 4;
                    float _2438 = _2434;
                    if (_2372)
                    {
                        _2410 = _1726;
                    }
                    float _2440 = _2410;
                    float _2442 = _2440;
                    if (_2372)
                    {
                        _2428 = _1734;
                    }
                    float _2444 = _2428;
                    float _2446 = _2444;
                    if (_2382)
                    {
                        _2446 = _1770;
                    }
                    float _2448 = _2446;
                    float _2450 = _2448;
                    if (_2372)
                    {
                        _2424 = _1752;
                    }
                    float _2452 = _2424;
                    bool _2454 = _2170 == 112;
                    float _2456 = _2452;
                    if (_2382)
                    {
                        _2442 = _1762;
                    }
                    float _2458 = _2442;
                    float _2460 = _2458;
                    if (_2400)
                    {
                        _2460 = _1798;
                    }
                    float _2462 = _2460;
                    float _2464 = _2462;
                    if (_2382)
                    {
                        _2438 = _1780;
                    }
                    float _2466 = _2438;
                    float _2468 = _2466;
                    if (_2382)
                    {
                        _2456 = _1788;
                    }
                    float _2470 = _2456;
                    float _2472 = _2470;
                    if (_2400)
                    {
                        _2472 = _1824;
                    }
                    float _2474 = _2472;
                    bool _2476 = _2170 == 128;
                    float _2478 = _2474;
                    if (_2400)
                    {
                        _2450 = _1806;
                    }
                    float _2480 = _2450;
                    float _2482 = _2480;
                    if (_2400)
                    {
                        _2468 = _1816;
                    }
                    float _2484 = _2468;
                    float _2486 = _2484;
                    if (_2422)
                    {
                        _2486 = _1850;
                    }
                    float _2488 = _2486;
                    bool _2490 = _2170 == 144;
                    float _2492 = _2488;
                    if (_2422)
                    {
                        _2464 = _1832;
                    }
                    float _2494 = _2464;
                    float _2496 = _2494;
                    if (_2422)
                    {
                        _2482 = _1840;
                    }
                    float _2498 = _2482;
                    float _2500 = _2498;
                    if (_2454)
                    {
                        _2500 = _1876;
                    }
                    float _2502 = _2500;
                    float _2504 = _2502;
                    if (_2422)
                    {
                        _2478 = _1858;
                    }
                    float _2506 = _2478;
                    bool _2508 = _2436 == 0;
                    float _2510 = _2506;
                    if (_2454)
                    {
                        _2496 = _1868;
                    }
                    float _2512 = _2496;
                    float _2514 = _2512;
                    if (_2476)
                    {
                        _2514 = _1904;
                    }
                    float _2516 = _2514;
                    float _2518 = _2516;
                    if (_2454)
                    {
                        _2492 = _1886;
                    }
                    float _2520 = _2492;
                    float _2522 = _2520;
                    if (_2454)
                    {
                        _2510 = _1894;
                    }
                    float _2524 = _2510;
                    float _2526 = _2524;
                    if (_2476)
                    {
                        _2526 = _1930;
                    }
                    float _2528 = _2526;
                    bool _2530 = _2436 == 16;
                    float _2532 = _2528;
                    if (_2476)
                    {
                        _2504 = _1912;
                    }
                    float _2534 = _2504;
                    float _2536 = _2534;
                    if (_2476)
                    {
                        _2522 = _1922;
                    }
                    float _2538 = _2522;
                    float _2540 = _2538;
                    if (_2490)
                    {
                        _2540 = _1956;
                    }
                    float _2542 = _2540;
                    bool _2544 = _2162 == 176;
                    float _2546 = _2542;
                    if (_2508)
                    {
                        _2182 = _1566;
                    }
                    float _2548 = _2182;
                    bool _2550 = _2436 == 32;
                    float _2552 = _2548;
                    if (_2490)
                    {
                        _2518 = _1938;
                    }
                    float _2554 = _2518;
                    float _2556 = _2554;
                    if (_2490)
                    {
                        _2536 = _1946;
                    }
                    float _2558 = _2536;
                    float _2560 = _2558;
                    if (_2490)
                    {
                        _2532 = _1964;
                    }
                    float _2562 = _2532;
                    bool _2564 = _2436 == 48;
                    float _2566 = _2562;
                    if (_2508)
                    {
                        _2184 = _1558;
                    }
                    float _2568 = _2184;
                    float _2570 = _2568;
                    if (_2530)
                    {
                        _2570 = _1578;
                    }
                    float _2572 = _2570;
                    float _2574 = _2572;
                    if (_2508)
                    {
                        _2122 = _1614;
                    }
                    float _2576 = _2122;
                    float _2578 = _2576;
                    if (_2544)
                    {
                        _2378 = _2018;
                    }
                    float _2580 = _2378;
                    if (_2508)
                    {
                        _2124 = _1622;
                    }
                    float _2582 = _2124;
                    float _2584 = _2582;
                    if (_2530)
                    {
                        _2584 = _1640;
                    }
                    float _2586 = _2584;
                    bool _2588 = _2436 == 64;
                    float _2590 = _2586;
                    if (_2544)
                    {
                        _2360 = _2010;
                    }
                    float _2592 = _2360;
                    if (_2530)
                    {
                        _2552 = _1586;
                    }
                    float _2594 = _2552;
                    float _2596 = _1546 * _2580;
                    float _2598 = _2594;
                    if (_2530)
                    {
                        _2578 = _1632;
                    }
                    float _2600 = _2578;
                    float _2602 = _2600;
                    if (_2550)
                    {
                        _2602 = _1650;
                    }
                    float _2604 = _2602;
                    bool _2606 = _2436 == 80;
                    float _2608 = fma(_1544, _2592, _2596);
                    _2042 = _2608;
                    float _2610 = _2604;
                    if (_2550)
                    {
                        _2574 = _1596;
                    }
                    float _2612 = _2574;
                    float _2614 = _2612;
                    if (_2544)
                    {
                        _2384 = _2028;
                    }
                    float _2616 = _2384;
                    _2048 = _2616;
                    if (_2550)
                    {
                        _2598 = _1604;
                    }
                    float _2618 = _2598;
                    float _2620 = _2618;
                    if (_2564)
                    {
                        _2620 = _1734;
                    }
                    float _2622 = _2620;
                    float _2624 = _2622;
                    if (_2550)
                    {
                        _2590 = _1658;
                    }
                    float _2626 = _2590;
                    bool _2628 = _2436 == 96;
                    float _2630 = _2626;
                    if (_2564)
                    {
                        _2614 = _1726;
                    }
                    float _2632 = _2614;
                    float _2634 = _2632;
                    if (_2588)
                    {
                        _2634 = _1762;
                    }
                    float _2636 = _2634;
                    float _2638 = _2636;
                    if (_2564)
                    {
                        _2610 = _1744;
                    }
                    float _2640 = _2610;
                    float _2642 = _2640;
                    if (_2564)
                    {
                        _2630 = _1752;
                    }
                    float _2644 = _2630;
                    float _2646 = _2644;
                    if (_2588)
                    {
                        _2646 = _1788;
                    }
                    float _2648 = _2646;
                    bool _2650 = _2436 == 112;
                    float _2652 = _2648;
                    if (_2588)
                    {
                        _2624 = _1770;
                    }
                    float _2654 = _2624;
                    float _2656 = _2654;
                    if (_2588)
                    {
                        _2642 = _1780;
                    }
                    float _2658 = _2642;
                    float _2660 = _2658;
                    if (_2606)
                    {
                        _2660 = _1816;
                    }
                    float _2662 = _2660;
                    bool _2664 = _2436 == 128;
                    float _2666 = _2662;
                    if (_2606)
                    {
                        _2638 = _1798;
                    }
                    float _2668 = _2638;
                    float _2670 = _2668;
                    if (_2606)
                    {
                        _2656 = _1806;
                    }
                    float _2672 = _2656;
                    float _2674 = _2672;
                    if (_2628)
                    {
                        _2674 = _1840;
                    }
                    float _2676 = _2674;
                    float _2678 = _2676;
                    if (_2606)
                    {
                        _2652 = _1824;
                    }
                    float _2680 = _2652;
                    float _2682 = _2680;
                    if (_2628)
                    {
                        _2670 = _1832;
                    }
                    float _2684 = _2670;
                    float _2686 = _2684;
                    if (_2650)
                    {
                        _2686 = _1868;
                    }
                    float _2688 = _2686;
                    float _2690 = _2688;
                    if (_2628)
                    {
                        _2666 = _1850;
                    }
                    float _2692 = _2666;
                    float _2694 = _2692;
                    if (_2628)
                    {
                        _2682 = _1858;
                    }
                    float _2696 = _2682;
                    float _2698 = _2696;
                    if (_2650)
                    {
                        _2698 = _1894;
                    }
                    float _2700 = _2698;
                    bool _2702 = _2436 == 144;
                    float _2704 = _2700;
                    if (_2650)
                    {
                        _2678 = _1876;
                    }
                    float _2706 = _2678;
                    float _2708 = _2706;
                    if (_2650)
                    {
                        _2694 = _1886;
                    }
                    float _2710 = _2694;
                    bool _2712 = _2436 == 160;
                    float _2714 = _2710;
                    if (_2664)
                    {
                        _2690 = _1904;
                    }
                    float _2716 = _2690;
                    float _2718 = _2716;
                    if (_2664)
                    {
                        _2708 = _1912;
                    }
                    float _2720 = _2708;
                    float _2722 = _2720;
                    if (_2664)
                    {
                        _2714 = _1922;
                    }
                    float _2724 = _2714;
                    float _2726 = _2724;
                    if (_2702)
                    {
                        _2718 = _1938;
                    }
                    float _2728 = _2718;
                    float _2730 = _2728;
                    if (_2664)
                    {
                        _2704 = _1930;
                    }
                    float _2732 = _2704;
                    float _2734 = _2732;
                    if (_2702)
                    {
                        _2726 = _1956;
                    }
                    float _2736 = _2726;
                    bool _2738 = _2170 == 160;
                    bool _2740 = _2436 == 176;
                    float _2742 = _2736;
                    if (_2712)
                    {
                        _2742 = _1992;
                    }
                    float _2744 = _2742;
                    bool _2746 = _2170 == 176;
                    float _2748 = _2744;
                    if (_2702)
                    {
                        _2722 = _1946;
                    }
                    float _2750 = _2722;
                    float _2752 = _2750;
                    if (_2712)
                    {
                        _2752 = _1982;
                    }
                    float _2754 = _2752;
                    float _2756 = _2754;
                    if (_2712)
                    {
                        _2730 = _1974;
                    }
                    float _2758 = _2730;
                    float _2760 = _2758;
                    if (_2544)
                    {
                        _2374 = _2036;
                    }
                    float _2762 = _2374;
                    _2054 = _2762;
                    if (_2738)
                    {
                        _2560 = _1982;
                    }
                    float _2764 = _2560;
                    float _2766 = _2764;
                    if (_2740)
                    {
                        _2756 = _2018;
                    }
                    float _2768 = _2756;
                    if (_2746)
                    {
                        _2766 = _2018;
                    }
                    float _2770 = _2766;
                    if (_2738)
                    {
                        _2556 = _1974;
                    }
                    float _2772 = _2556;
                    float _2774 = _2772;
                    if (_2746)
                    {
                        _2774 = _2010;
                    }
                    float _2776 = _2774;
                    float _2778 = _1546 * _2770;
                    _2044 = _2778;
                    if (_2740)
                    {
                        _2760 = _2010;
                    }
                    float _2780 = _2760;
                    float _2782 = _1546 * _2768;
                    bool _2784 = _2160 >= as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
                    float _2786 = fma(_1544, _2776, _2778);
                    if (_2738)
                    {
                        _2546 = _1992;
                    }
                    float _2788 = _2546;
                    float _2790 = fma(_1544, _2780, _2782);
                    _2040 = _2790;
                    float _2792 = _2788;
                    if (_2746)
                    {
                        _2792 = _2028;
                    }
                    float _2794 = _2792;
                    float _2796 = fma(_1548, _2616, _2608);
                    _2050 = _2794;
                    if (_2740)
                    {
                        _2748 = _2028;
                    }
                    float _2798 = _2748;
                    _2052 = _2798;
                    if (_2702)
                    {
                        _2734 = _1964;
                    }
                    float _2800 = _2734;
                    float _2802 = _2800;
                    if (_2712)
                    {
                        _2802 = _2000;
                    }
                    float _2804 = _2802;
                    float _2806 = _2804;
                    if (_2738)
                    {
                        _2566 = _2000;
                    }
                    float _2808 = _2566;
                    float _2810 = _2808;
                    if (_2746)
                    {
                        _2810 = _2036;
                    }
                    float _2812 = _2810;
                    _2056 = _2812;
                    if (_2740)
                    {
                        _2806 = _2036;
                    }
                    float _2814 = _2806;
                    float _2816 = fma(_1548, _2794, _2786);
                    float _2818 = fma(_1548, _2798, _2790);
                    float _2820 = _2796 + _2762;
                    float _2822 = _2816 + _2812;
                    float _2824 = _2818 + _2814;
                    _2826 = fma(_2820, _2156, _2128);
                    _2828 = fma(_2822, _2156, _2132);
                    _2830 = fma(_2824, _2156, _2136);
                    _2060 = !_2784;
                    _1686 = _2826;
                    _1688 = _2828;
                    _1704 = _2830;
                    _2046 = _2822;
                    _2058 = _2814;
                } while (_2060);
                _1698 = _2826;
                _1712 = _2830;
                _1706 = _2828;
            }
            float _2832 = _1698;
            float _2834 = _1712;
            float _2836 = _1706;
            _182 = _2836;
            if (!_1568)
            {
                _1690 = _2832;
            }
            float _2838 = _1690;
            float _2840 = _2838;
            if (!_1568)
            {
                _1692 = _2834;
            }
            float _2842 = _1692;
            _186 = _2842;
            if (_1568)
            {
                _2840 = _2832;
            }
            float _2844 = _2840;
            _184 = _2844;
            if (_1568)
            {
                _186 = _2834;
            }
        }
    }
    _188 = false;
    float _2846 = _182;
    float _2848 = _184;
    float _2850 = _186;
    bool _2852 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _2854 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _2856 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _2860 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[0].x, _2854);
    float _2862 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[1].x, _2856);
    float _2864 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[2].x, _2858);
    float _2866 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[0].z, _2860);
    float _2868 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[1].z, _2862);
    float _2870 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[2].z, _2864);
    float _2872 = _2866 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _2874 = _2868 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _2876 = _2870 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _2878 = _2854;
    float _2880 = _2848;
    int _3012;
    int _3014;
    int _3016;
    int _3018;
    if (!_2852)
    {
        float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _2884 = _2850 + _2882;
        float _2886 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _2888 = _2848 + _2886;
        float _2890 = _2884 * _2884;
        float _2892 = fma(_2888, _2888, _2890);
        float _2894 = sqrt(_2892);
        bool _2896 = _2894 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _2898 = _2890;
        if (!_2896)
        {
            _2878 = _2876;
        }
        float _2900 = _2878;
        float _2902 = _2900;
        if (!_2896)
        {
            _2880 = _2874;
        }
        float _2904 = _2880;
        float _2906 = _2904;
        if (!_2896)
        {
            _2898 = _2872;
        }
        float _2908 = _2898;
        bool _2910 = !_2896;
        float _2912 = _2908;
        if (!_2910)
        {
            float _2914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _2918 = _2894 + _2916;
            float _2920 = _2846 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2922 = rsqrt(_2892);
            float _2924 = _2918 * _2914;
            float _2926 = _2924 * 0.15915493667125701904296875;
            float _2928 = _2926 * 6.283185482025146484375;
            float _2930 = cos(_2928);
            float _2932 = _2926 * 6.283185482025146484375;
            float _2934 = sin(_2932);
            float _2936 = _2930 + (-1.0);
            float _2938 = fma(_2934, _2920, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _2940 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2942 = _2922 * _2938;
            float _2944 = fma(_2930, _2846, _2940);
            float _2946 = fma(_2888, _2942, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _2948 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _2950 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _2952 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _2954 = fma(_2884, _2942, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _2956 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[0].x, _2948);
            float _2958 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[1].x, _2950);
            float _2960 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[2].x, _2952);
            float _2962 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[0].z, _2956);
            float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[1].z, _2958);
            float _2966 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[2].z, _2960);
            float _2968 = _2962 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _2970 = _2964 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _2972 = _2966 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _2906 = _2970;
            _2912 = _2968;
            _2902 = _2972;
        }
        float _2974 = _2906;
        float _2976 = _2912;
        float _2978 = _2902;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _2982 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _2984 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _2986 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[7].x, _2980);
        float _2990 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[8].x, _2982);
        float _2992 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[9].x, _2984);
        float _2994 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[10].x, _2986);
        float _2996 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[7].z, _2988);
        float _2998 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[8].z, _2990);
        float _3000 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[9].z, _2992);
        float _3002 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[10].z, _2994);
        float _3004 = _2996 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _3006 = _2998 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _3008 = _3000 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _3010 = _3002 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _3012 = as_type<int>(_3004);
        _3014 = as_type<int>(_3006);
        _3016 = as_type<int>(_3008);
        _3018 = as_type<int>(_3010);
        _3020 = true;
    }
    else
    {
        float _3022 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _3024 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _3026 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _3028 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _3030 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[7].x, _3022);
        float _3032 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[8].x, _3024);
        float _3034 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[9].x, _3026);
        float _3036 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[10].x, _3028);
        float _3038 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[7].z, _3030);
        float _3040 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[8].z, _3032);
        float _3042 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[9].z, _3034);
        float _3044 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[10].z, _3036);
        float _3046 = _3038 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _3048 = _3040 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _3050 = _3042 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _3052 = _3044 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _3012 = as_type<int>(_3046);
        _3014 = as_type<int>(_3048);
        _3016 = as_type<int>(_3050);
        _3018 = as_type<int>(_3052);
    }
    _3020 = false;
    int _3054 = _3012;
    int _3056 = _3014;
    int _3058 = _3016;
    int _3060 = _3018;
    float _7743 = as_type<float>(_3054);
    out.gl_Position.x = _7743;
    float _7746 = as_type<float>(_3056);
    out.gl_Position.y = _7746;
    float _7749 = as_type<float>(_3058);
    out.gl_Position.z = _7749;
    float _7752 = as_type<float>(_3060);
    out.gl_Position.w = _7752;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _3020 = false;
    bool _188 = false;
    bool _2146 = false;
    bool _800 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    bool _63 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[8].w);
    bool _65 = !_63;
    float _182;
    float _184;
    float _186;
    if (!_65)
    {
        bool _67 = 0 != as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
        if (!_67)
        {
            float _70 = as_type<float>(int(gl_InstanceIndex));
            float _72 = as_type<float>(int(gl_BaseInstance));
            int _75 = as_type<int>(_70) - as_type<int>(_72);
            float _77 = in.m_42.x;
            float _79 = in.m_42.y;
            float _81 = in.m_42.z;
            int _83 = _75 + as_type<int>(as_type<float>(gl_BaseInstance));
            int _85 = _83 * 80;
            int _87 = _85 + 16;
            int _89 = _85 + 32;
            uint _92 = uint(int(uint(_85) >> uint(2)));
            packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_92)];
            float _94 = as_type<float>(_dmw0.x);
            int _96 = _85 + 4;
            uint _98 = uint(int(uint(_96) >> uint(2)));
            float _100 = as_type<float>(_dmw0.y);
            int _102 = _85 + 8;
            uint _104 = uint(int(uint(_102) >> uint(2)));
            float _106 = as_type<float>(_dmw0.z);
            int _108 = _85 + 12;
            uint _110 = uint(int(uint(_108) >> uint(2)));
            float _112 = as_type<float>(_dmw0.w);
            uint _114 = uint(int(uint(_87) >> uint(2)));
            packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_114)];
            float _116 = as_type<float>(_dmw1.x);
            int _118 = _87 + 4;
            uint _120 = uint(int(uint(_118) >> uint(2)));
            float _122 = as_type<float>(_dmw1.y);
            int _124 = _87 + 8;
            uint _126 = uint(int(uint(_124) >> uint(2)));
            float _128 = as_type<float>(_dmw1.z);
            int _130 = _87 + 12;
            uint _132 = uint(int(uint(_130) >> uint(2)));
            float _134 = as_type<float>(_dmw1.w);
            uint _136 = uint(int(uint(_89) >> uint(2)));
            packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_136)];
            float _138 = as_type<float>(_dmw2.x);
            int _140 = _89 + 4;
            uint _142 = uint(int(uint(_140) >> uint(2)));
            float _144 = as_type<float>(_dmw2.y);
            int _146 = _89 + 8;
            uint _148 = uint(int(uint(_146) >> uint(2)));
            float _150 = as_type<float>(_dmw2.z);
            int _152 = _89 + 12;
            uint _154 = uint(int(uint(_152) >> uint(2)));
            float _156 = as_type<float>(_dmw2.w);
            float _158 = _100 * _79;
            float _160 = _122 * _79;
            float _162 = fma(_94, _77, _158);
            float _164 = _144 * _79;
            float _166 = fma(_116, _77, _160);
            float _168 = fma(_106, _81, _162);
            float _170 = fma(_138, _77, _164);
            float _172 = fma(_128, _81, _166);
            float _174 = _112 + _168;
            float _176 = fma(_150, _81, _170);
            float _178 = _134 + _172;
            float _180 = _156 + _176;
            _182 = _178;
            _184 = _174;
            _186 = _180;
            _188 = true;
        }
        else
        {
            float _190 = as_type<float>(in.m_46.x);
            float _192 = as_type<float>(in.m_46.y);
            float _194 = as_type<float>(in.m_46.z);
            float _196 = as_type<float>(in.m_46.w);
            float _198 = in.m_42.x;
            float _200 = in.m_42.y;
            float _202 = in.m_42.z;
            int _204 = as_type<int>(_190) * 48;
            int _206 = _204 + 16;
            uint _208 = uint(int(uint(_206) >> uint(2)));
            uint _210 = uint(int(uint(int(_208)) >> uint(2)));
            int _212 = int(_208) & 3;
            float _214 = (*spvDescriptorSet0.vp_c5)._m0[int(_210)][_212];
            int _216 = int(_208) + 1;
            uint _218 = uint(int(uint(_216) >> uint(2)));
            int _220 = _216 & 3;
            float _222 = (*spvDescriptorSet0.vp_c5)._m0[int(_218)][_220];
            bool _224 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x) > 1;
            uint _226 = uint(int(uint(_204) >> uint(2)));
            uint _228 = uint(int(uint(int(_226)) >> uint(2)));
            int _230 = int(_226) & 3;
            float _232 = (*spvDescriptorSet0.vp_c5)._m0[int(_228)][_230];
            int _234 = int(_226) + 1;
            uint _236 = uint(int(uint(_234) >> uint(2)));
            int _238 = _234 & 3;
            float _240 = (*spvDescriptorSet0.vp_c5)._m0[int(_236)][_238];
            int _242 = _204 + 32;
            uint _244 = uint(int(uint(_242) >> uint(2)));
            uint _246 = uint(int(uint(int(_244)) >> uint(2)));
            int _248 = int(_244) & 3;
            float _250 = (*spvDescriptorSet0.vp_c5)._m0[int(_246)][_248];
            int _252 = int(_244) + 1;
            uint _254 = uint(int(uint(_252) >> uint(2)));
            int _256 = _252 & 3;
            float _258 = (*spvDescriptorSet0.vp_c5)._m0[int(_254)][_256];
            int _260 = _204 + 24;
            uint _262 = uint(int(uint(_260) >> uint(2)));
            uint _264 = uint(int(uint(int(_262)) >> uint(2)));
            int _266 = int(_262) & 3;
            float _268 = (*spvDescriptorSet0.vp_c5)._m0[int(_264)][_266];
            int _270 = int(_262) + 1;
            uint _272 = uint(int(uint(_270) >> uint(2)));
            int _274 = _270 & 3;
            float _276 = (*spvDescriptorSet0.vp_c5)._m0[int(_272)][_274];
            int _278 = _204 + 8;
            uint _280 = uint(int(uint(_278) >> uint(2)));
            uint _282 = uint(int(uint(int(_280)) >> uint(2)));
            int _284 = int(_280) & 3;
            float _286 = (*spvDescriptorSet0.vp_c5)._m0[int(_282)][_284];
            int _288 = int(_280) + 1;
            uint _290 = uint(int(uint(_288) >> uint(2)));
            int _292 = _288 & 3;
            float _294 = (*spvDescriptorSet0.vp_c5)._m0[int(_290)][_292];
            int _296 = _204 + 40;
            uint _298 = uint(int(uint(_296) >> uint(2)));
            uint _300 = uint(int(uint(int(_298)) >> uint(2)));
            int _302 = int(_298) & 3;
            float _304 = (*spvDescriptorSet0.vp_c5)._m0[int(_300)][_302];
            int _306 = int(_298) + 1;
            uint _308 = uint(int(uint(_306) >> uint(2)));
            int _310 = _306 & 3;
            float _312 = (*spvDescriptorSet0.vp_c5)._m0[int(_308)][_310];
            float _314 = _200 * _222;
            float _316 = fma(_198, _214, _314);
            float _318 = _200 * _240;
            float _320 = fma(_198, _232, _318);
            float _322 = _200 * _258;
            float _324 = fma(_198, _250, _322);
            float _326 = fma(_202, _268, _316);
            float _328 = _326 + _276;
            float _330 = fma(_202, _286, _320);
            float _332 = _320;
            float _334 = _326;
            float _336 = _330;
            float _338 = _328;
            float _340 = _200;
            float _342 = _198;
            if (!_224)
            {
                _332 = _328;
            }
            float _344 = _332;
            float _346 = _330 + _294;
            float _348 = fma(_202, _304, _324);
            float _350 = _346;
            float _352 = _344;
            if (!_224)
            {
                _334 = _346;
            }
            float _354 = _334;
            float _356 = _348 + _312;
            float _358 = _356;
            float _360 = _354;
            if (!_224)
            {
                _336 = _356;
            }
            float _362 = _336;
            bool _364 = !_224;
            float _366 = _362;
            if (!_364)
            {
                int _368 = as_type<int>(_192) * 48;
                int _370 = as_type<int>(_194) * 48;
                int _372 = as_type<int>(_196) * 48;
                uint _374 = uint(int(uint(_368) >> uint(2)));
                uint _376 = uint(int(uint(int(_374)) >> uint(2)));
                int _378 = int(_374) & 3;
                float _380 = (*spvDescriptorSet0.vp_c5)._m0[int(_376)][_378];
                int _382 = int(_374) + 1;
                uint _384 = uint(int(uint(_382) >> uint(2)));
                int _386 = _382 & 3;
                float _388 = (*spvDescriptorSet0.vp_c5)._m0[int(_384)][_386];
                int _390 = _368 + 8;
                uint _392 = uint(int(uint(_390) >> uint(2)));
                uint _394 = uint(int(uint(int(_392)) >> uint(2)));
                int _396 = int(_392) & 3;
                float _398 = (*spvDescriptorSet0.vp_c5)._m0[int(_394)][_396];
                int _400 = int(_392) + 1;
                uint _402 = uint(int(uint(_400) >> uint(2)));
                int _404 = _400 & 3;
                float _406 = (*spvDescriptorSet0.vp_c5)._m0[int(_402)][_404];
                int _408 = _368 + 16;
                uint _410 = uint(int(uint(_408) >> uint(2)));
                uint _412 = uint(int(uint(int(_410)) >> uint(2)));
                int _414 = int(_410) & 3;
                float _416 = (*spvDescriptorSet0.vp_c5)._m0[int(_412)][_414];
                int _418 = int(_410) + 1;
                uint _420 = uint(int(uint(_418) >> uint(2)));
                int _422 = _418 & 3;
                float _424 = (*spvDescriptorSet0.vp_c5)._m0[int(_420)][_422];
                int _426 = _368 + 24;
                uint _428 = uint(int(uint(_426) >> uint(2)));
                uint _430 = uint(int(uint(int(_428)) >> uint(2)));
                int _432 = int(_428) & 3;
                float _434 = (*spvDescriptorSet0.vp_c5)._m0[int(_430)][_432];
                int _436 = int(_428) + 1;
                uint _438 = uint(int(uint(_436) >> uint(2)));
                int _440 = _436 & 3;
                float _442 = (*spvDescriptorSet0.vp_c5)._m0[int(_438)][_440];
                int _444 = _368 + 32;
                uint _446 = uint(int(uint(_444) >> uint(2)));
                uint _448 = uint(int(uint(int(_446)) >> uint(2)));
                int _450 = int(_446) & 3;
                float _452 = (*spvDescriptorSet0.vp_c5)._m0[int(_448)][_450];
                int _454 = int(_446) + 1;
                uint _456 = uint(int(uint(_454) >> uint(2)));
                int _458 = _454 & 3;
                float _460 = (*spvDescriptorSet0.vp_c5)._m0[int(_456)][_458];
                int _462 = _368 + 40;
                uint _464 = uint(int(uint(_462) >> uint(2)));
                uint _466 = uint(int(uint(int(_464)) >> uint(2)));
                int _468 = int(_464) & 3;
                float _470 = (*spvDescriptorSet0.vp_c5)._m0[int(_466)][_468];
                int _472 = int(_464) + 1;
                uint _474 = uint(int(uint(_472) >> uint(2)));
                int _476 = _472 & 3;
                float _478 = (*spvDescriptorSet0.vp_c5)._m0[int(_474)][_476];
                uint _480 = uint(int(uint(_370) >> uint(2)));
                uint _482 = uint(int(uint(int(_480)) >> uint(2)));
                int _484 = int(_480) & 3;
                float _486 = (*spvDescriptorSet0.vp_c5)._m0[int(_482)][_484];
                int _488 = int(_480) + 1;
                uint _490 = uint(int(uint(_488) >> uint(2)));
                int _492 = _488 & 3;
                float _494 = (*spvDescriptorSet0.vp_c5)._m0[int(_490)][_492];
                int _496 = _370 + 8;
                uint _498 = uint(int(uint(_496) >> uint(2)));
                uint _500 = uint(int(uint(int(_498)) >> uint(2)));
                int _502 = int(_498) & 3;
                float _504 = (*spvDescriptorSet0.vp_c5)._m0[int(_500)][_502];
                int _506 = int(_498) + 1;
                uint _508 = uint(int(uint(_506) >> uint(2)));
                int _510 = _506 & 3;
                float _512 = (*spvDescriptorSet0.vp_c5)._m0[int(_508)][_510];
                int _514 = _370 + 16;
                uint _516 = uint(int(uint(_514) >> uint(2)));
                uint _518 = uint(int(uint(int(_516)) >> uint(2)));
                int _520 = int(_516) & 3;
                float _522 = (*spvDescriptorSet0.vp_c5)._m0[int(_518)][_520];
                int _524 = int(_516) + 1;
                uint _526 = uint(int(uint(_524) >> uint(2)));
                int _528 = _524 & 3;
                float _530 = (*spvDescriptorSet0.vp_c5)._m0[int(_526)][_528];
                int _532 = _370 + 24;
                uint _534 = uint(int(uint(_532) >> uint(2)));
                uint _536 = uint(int(uint(int(_534)) >> uint(2)));
                int _538 = int(_534) & 3;
                float _540 = (*spvDescriptorSet0.vp_c5)._m0[int(_536)][_538];
                int _542 = int(_534) + 1;
                uint _544 = uint(int(uint(_542) >> uint(2)));
                int _546 = _542 & 3;
                float _548 = (*spvDescriptorSet0.vp_c5)._m0[int(_544)][_546];
                int _550 = _370 + 32;
                uint _552 = uint(int(uint(_550) >> uint(2)));
                uint _554 = uint(int(uint(int(_552)) >> uint(2)));
                int _556 = int(_552) & 3;
                float _558 = (*spvDescriptorSet0.vp_c5)._m0[int(_554)][_556];
                int _560 = int(_552) + 1;
                uint _562 = uint(int(uint(_560) >> uint(2)));
                int _564 = _560 & 3;
                float _566 = (*spvDescriptorSet0.vp_c5)._m0[int(_562)][_564];
                int _568 = _370 + 40;
                uint _570 = uint(int(uint(_568) >> uint(2)));
                uint _572 = uint(int(uint(int(_570)) >> uint(2)));
                int _574 = int(_570) & 3;
                float _576 = (*spvDescriptorSet0.vp_c5)._m0[int(_572)][_574];
                int _578 = int(_570) + 1;
                uint _580 = uint(int(uint(_578) >> uint(2)));
                int _582 = _578 & 3;
                float _584 = (*spvDescriptorSet0.vp_c5)._m0[int(_580)][_582];
                uint _586 = uint(int(uint(_372) >> uint(2)));
                uint _588 = uint(int(uint(int(_586)) >> uint(2)));
                int _590 = int(_586) & 3;
                float _592 = (*spvDescriptorSet0.vp_c5)._m0[int(_588)][_590];
                int _594 = int(_586) + 1;
                uint _596 = uint(int(uint(_594) >> uint(2)));
                int _598 = _594 & 3;
                float _600 = (*spvDescriptorSet0.vp_c5)._m0[int(_596)][_598];
                int _602 = _372 + 8;
                uint _604 = uint(int(uint(_602) >> uint(2)));
                uint _606 = uint(int(uint(int(_604)) >> uint(2)));
                int _608 = int(_604) & 3;
                float _610 = (*spvDescriptorSet0.vp_c5)._m0[int(_606)][_608];
                int _612 = int(_604) + 1;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                int _616 = _612 & 3;
                float _618 = (*spvDescriptorSet0.vp_c5)._m0[int(_614)][_616];
                int _620 = _372 + 16;
                uint _622 = uint(int(uint(_620) >> uint(2)));
                uint _624 = uint(int(uint(int(_622)) >> uint(2)));
                int _626 = int(_622) & 3;
                float _628 = (*spvDescriptorSet0.vp_c5)._m0[int(_624)][_626];
                int _630 = int(_622) + 1;
                uint _632 = uint(int(uint(_630) >> uint(2)));
                int _634 = _630 & 3;
                float _636 = (*spvDescriptorSet0.vp_c5)._m0[int(_632)][_634];
                int _638 = _372 + 24;
                uint _640 = uint(int(uint(_638) >> uint(2)));
                uint _642 = uint(int(uint(int(_640)) >> uint(2)));
                int _644 = int(_640) & 3;
                float _646 = (*spvDescriptorSet0.vp_c5)._m0[int(_642)][_644];
                int _648 = int(_640) + 1;
                uint _650 = uint(int(uint(_648) >> uint(2)));
                int _652 = _648 & 3;
                float _654 = (*spvDescriptorSet0.vp_c5)._m0[int(_650)][_652];
                int _656 = _372 + 32;
                uint _658 = uint(int(uint(_656) >> uint(2)));
                uint _660 = uint(int(uint(int(_658)) >> uint(2)));
                int _662 = int(_658) & 3;
                float _664 = (*spvDescriptorSet0.vp_c5)._m0[int(_660)][_662];
                int _666 = int(_658) + 1;
                uint _668 = uint(int(uint(_666) >> uint(2)));
                int _670 = _666 & 3;
                float _672 = (*spvDescriptorSet0.vp_c5)._m0[int(_668)][_670];
                int _674 = _372 + 40;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                uint _678 = uint(int(uint(int(_676)) >> uint(2)));
                int _680 = int(_676) & 3;
                float _682 = (*spvDescriptorSet0.vp_c5)._m0[int(_678)][_680];
                int _684 = int(_676) + 1;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                int _688 = _684 & 3;
                float _690 = (*spvDescriptorSet0.vp_c5)._m0[int(_686)][_688];
                int _692 = 1;
                float _694 = 0.0;
                float _696 = 0.0;
                float _698 = 0.0;
                float _700 = 0.0;
                float _702 = 0.0;
                float _704 = 0.0;
                float _706 = 0.0;
                float _708 = 0.0;
                float _710 = 0.0;
                float _712 = 0.0;
                bool _714;
                float _1476;
                float _1482;
                float _1484;
                do
                {
                    int _716 = _692;
                    float _718 = _350;
                    float _720 = _338;
                    float _722 = _358;
                    float _724 = _694;
                    float _726 = _696;
                    float _728 = _698;
                    float _730 = _700;
                    float _732 = _702;
                    float _734 = _704;
                    float _736 = _706;
                    float _738 = _708;
                    float _740 = _710;
                    float _742 = _712;
                    float _744 = in.m_48.x;
                    int _746 = _716 & 3;
                    bool _748 = _716 != 1;
                    bool _750 = _746 >= 2;
                    float _752 = _718;
                    float _754 = _720;
                    float _756 = _722;
                    float _758 = _744;
                    float _760 = _724;
                    float _762 = _726;
                    float _764 = _734;
                    float _766 = _732;
                    float _768 = _728;
                    float _770 = _740;
                    float _772 = _730;
                    float _774 = _736;
                    float _776 = _742;
                    float _778 = _738;
                    if (!_748)
                    {
                        float _780 = _718 * _744;
                        _752 = _780;
                    }
                    float _782 = _752;
                    if (!_748)
                    {
                        float _784 = _720 * _744;
                        _754 = _784;
                    }
                    float _786 = _754;
                    if (!_748)
                    {
                        float _788 = _722 * _744;
                        _756 = _788;
                    }
                    float _790 = _756;
                    bool _792 = !_750;
                    if (!_792)
                    {
                        bool _794 = _746 >= 3;
                        bool _796 = !_794;
                        if (!_796)
                        {
                            bool _798 = _746 != 3;
                            _800 = _798;
                            if (!_800)
                            {
                                float _802 = in.m_48.w;
                                _758 = _802;
                                _800 = true;
                            }
                        }
                        else
                        {
                            float _804 = in.m_48.z;
                            _758 = _804;
                            _800 = true;
                        }
                    }
                    else
                    {
                        bool _806 = _746 != 1;
                        if (!_806)
                        {
                            float _808 = in.m_48.y;
                            _758 = _808;
                        }
                    }
                    _800 = false;
                    float _810 = _758;
                    int _812 = _716 * 3;
                    int _814 = _716 + 1;
                    int _816 = _812 * 16;
                    int _818 = _812 + 1;
                    int _820 = _812 + 2;
                    bool _822 = _816 == 0;
                    bool _824 = _816 == 16;
                    int _826 = _820 * 16;
                    bool _828 = _816 == 32;
                    bool _830 = _816 == 48;
                    bool _832 = _816 == 64;
                    bool _834 = _816 == 80;
                    int _836 = _818 << 4;
                    _692 = _814;
                    float _838 = as_type<float>(_820);
                    float _840 = as_type<float>(_816);
                    if (_822)
                    {
                        _760 = _240;
                    }
                    float _842 = _760;
                    float _844 = _842;
                    if (_822)
                    {
                        _762 = _232;
                    }
                    float _846 = _762;
                    float _848 = _846;
                    if (_822)
                    {
                        _764 = _294;
                    }
                    float _850 = _764;
                    float _852 = _850;
                    if (_822)
                    {
                        _766 = _286;
                    }
                    float _854 = _766;
                    float _856 = _854;
                    if (_824)
                    {
                        _844 = _222;
                    }
                    float _858 = _844;
                    bool _860 = _816 == 96;
                    float _862 = _858;
                    if (_824)
                    {
                        _852 = _276;
                    }
                    float _864 = _852;
                    float _866 = _864;
                    if (_824)
                    {
                        _848 = _214;
                    }
                    float _868 = _848;
                    float _870 = _868;
                    if (_828)
                    {
                        _862 = _258;
                    }
                    float _872 = _862;
                    float _874 = _872;
                    if (_824)
                    {
                        _856 = _268;
                    }
                    float _876 = _856;
                    float _878 = _876;
                    if (_828)
                    {
                        _866 = _312;
                    }
                    float _880 = _866;
                    bool _882 = _816 == 112;
                    float _884 = _880;
                    if (_830)
                    {
                        _874 = _388;
                    }
                    float _886 = _874;
                    float _888 = _886;
                    if (_828)
                    {
                        _870 = _250;
                    }
                    float _890 = _870;
                    float _892 = _890;
                    if (_830)
                    {
                        _884 = _406;
                    }
                    float _894 = _884;
                    float _896 = _894;
                    if (_828)
                    {
                        _878 = _304;
                    }
                    float _898 = _878;
                    float _900 = _898;
                    if (_832)
                    {
                        _888 = _424;
                    }
                    float _902 = _888;
                    float _904 = _902;
                    if (_830)
                    {
                        _892 = _380;
                    }
                    float _906 = _892;
                    float _908 = _906;
                    if (_832)
                    {
                        _896 = _442;
                    }
                    float _910 = _896;
                    float _912 = _910;
                    if (_830)
                    {
                        _900 = _398;
                    }
                    float _914 = _900;
                    float _916 = _914;
                    if (_834)
                    {
                        _904 = _460;
                    }
                    float _918 = _904;
                    bool _920 = _816 == 128;
                    float _922 = _918;
                    if (_834)
                    {
                        _912 = _478;
                    }
                    float _924 = _912;
                    float _926 = _924;
                    if (_832)
                    {
                        _908 = _416;
                    }
                    float _928 = _908;
                    float _930 = _928;
                    if (_860)
                    {
                        _922 = _494;
                    }
                    float _932 = _922;
                    float _934 = _932;
                    if (_832)
                    {
                        _916 = _434;
                    }
                    float _936 = _916;
                    float _938 = _936;
                    if (_860)
                    {
                        _926 = _512;
                    }
                    float _940 = _926;
                    bool _942 = _816 == 144;
                    float _944 = _940;
                    if (_882)
                    {
                        _934 = _530;
                    }
                    float _946 = _934;
                    float _948 = _946;
                    if (_834)
                    {
                        _930 = _452;
                    }
                    float _950 = _930;
                    float _952 = _950;
                    if (_882)
                    {
                        _944 = _548;
                    }
                    float _954 = _944;
                    float _956 = _954;
                    if (_834)
                    {
                        _938 = _470;
                    }
                    float _958 = _938;
                    bool _960 = _816 == 160;
                    float _962 = _958;
                    if (_920)
                    {
                        _948 = _566;
                    }
                    float _964 = _948;
                    float _966 = _964;
                    if (_860)
                    {
                        _952 = _486;
                    }
                    float _968 = _952;
                    float _970 = _968;
                    if (_920)
                    {
                        _956 = _584;
                    }
                    float _972 = _956;
                    float _974 = _972;
                    if (_860)
                    {
                        _962 = _504;
                    }
                    float _976 = _962;
                    bool _978 = _836 == 0;
                    float _980 = _976;
                    if (_942)
                    {
                        _966 = _600;
                    }
                    float _982 = _966;
                    float _984 = _982;
                    if (_882)
                    {
                        _970 = _522;
                    }
                    float _986 = _970;
                    float _988 = _986;
                    if (_942)
                    {
                        _974 = _618;
                    }
                    float _990 = _974;
                    float _992 = _990;
                    if (_882)
                    {
                        _980 = _540;
                    }
                    float _994 = _980;
                    bool _996 = _836 == 16;
                    float _998 = _994;
                    if (_960)
                    {
                        _984 = _636;
                    }
                    float _1000 = _984;
                    float _1002 = _1000;
                    if (_920)
                    {
                        _988 = _558;
                    }
                    float _1004 = _988;
                    float _1006 = _1004;
                    if (_960)
                    {
                        _992 = _654;
                    }
                    float _1008 = _992;
                    float _1010 = _1008;
                    if (_920)
                    {
                        _998 = _576;
                    }
                    float _1012 = _998;
                    bool _1014 = _836 == 32;
                    float _1016 = _1012;
                    if (_978)
                    {
                        _768 = _240;
                    }
                    float _1018 = _768;
                    float _1020 = _1018;
                    if (_942)
                    {
                        _1006 = _592;
                    }
                    float _1022 = _1006;
                    float _1024 = _1022;
                    if (_978)
                    {
                        _770 = _294;
                    }
                    float _1026 = _770;
                    float _1028 = _1026;
                    if (_942)
                    {
                        _1016 = _610;
                    }
                    float _1030 = _1016;
                    bool _1032 = _836 == 48;
                    float _1034 = _1030;
                    if (_996)
                    {
                        _1020 = _222;
                    }
                    float _1036 = _1020;
                    float _1038 = _1036;
                    if (_960)
                    {
                        _1024 = _628;
                    }
                    float _1040 = _1024;
                    float _1042 = _1040;
                    if (_996)
                    {
                        _1028 = _276;
                    }
                    float _1044 = _1028;
                    float _1046 = _1044;
                    if (_960)
                    {
                        _1034 = _646;
                    }
                    float _1048 = _1034;
                    bool _1050 = _836 == 64;
                    float _1052 = _1048;
                    if (_1014)
                    {
                        _1038 = _258;
                    }
                    float _1054 = _1038;
                    float _1056 = _1054;
                    if (_978)
                    {
                        _772 = _232;
                    }
                    float _1058 = _772;
                    float _1060 = _1058;
                    if (_1014)
                    {
                        _1046 = _312;
                    }
                    float _1062 = _1046;
                    float _1064 = _1062;
                    if (_978)
                    {
                        _774 = _286;
                    }
                    float _1066 = _774;
                    bool _1068 = _836 == 80;
                    float _1070 = _1066;
                    if (_1032)
                    {
                        _1056 = _388;
                    }
                    float _1072 = _1056;
                    float _1074 = _1072;
                    if (_996)
                    {
                        _1060 = _214;
                    }
                    float _1076 = _1060;
                    float _1078 = _1076;
                    if (_1032)
                    {
                        _1064 = _406;
                    }
                    float _1080 = _1064;
                    float _1082 = _1080;
                    if (_996)
                    {
                        _1070 = _268;
                    }
                    float _1084 = _1070;
                    bool _1086 = _836 == 96;
                    float _1088 = _1084;
                    if (_1050)
                    {
                        _1074 = _424;
                    }
                    float _1090 = _1074;
                    float _1092 = _1090;
                    if (_1014)
                    {
                        _1078 = _250;
                    }
                    float _1094 = _1078;
                    float _1096 = _1094;
                    if (_1050)
                    {
                        _1082 = _442;
                    }
                    float _1098 = _1082;
                    float _1100 = _1098;
                    if (_1014)
                    {
                        _1088 = _304;
                    }
                    float _1102 = _1088;
                    float _1104 = _1102;
                    if (_1032)
                    {
                        _1096 = _380;
                    }
                    float _1106 = _1096;
                    float _1108 = _1106;
                    if (_1068)
                    {
                        _1092 = _460;
                    }
                    float _1110 = _1092;
                    float _1112 = _1110;
                    if (_1032)
                    {
                        _1104 = _398;
                    }
                    float _1114 = _1104;
                    float _1116 = _1114;
                    if (_1068)
                    {
                        _1100 = _478;
                    }
                    float _1118 = _1100;
                    bool _1120 = _836 == 112;
                    float _1122 = _1118;
                    if (_1050)
                    {
                        _1108 = _416;
                    }
                    float _1124 = _1108;
                    float _1126 = _1124;
                    if (_1086)
                    {
                        _1112 = _494;
                    }
                    float _1128 = _1112;
                    float _1130 = _1128;
                    if (_1050)
                    {
                        _1116 = _434;
                    }
                    float _1132 = _1116;
                    float _1134 = _1132;
                    if (_1086)
                    {
                        _1122 = _512;
                    }
                    float _1136 = _1122;
                    bool _1138 = _836 == 128;
                    float _1140 = _1136;
                    if (_1068)
                    {
                        _1126 = _452;
                    }
                    float _1142 = _1126;
                    float _1144 = _1142;
                    if (_1068)
                    {
                        _1134 = _470;
                    }
                    float _1146 = _1134;
                    bool _1148 = _836 == 144;
                    float _1150 = _1146;
                    if (_1120)
                    {
                        _1130 = _530;
                    }
                    float _1152 = _1130;
                    float _1154 = _1152;
                    if (_1086)
                    {
                        _1144 = _486;
                    }
                    float _1156 = _1144;
                    float _1158 = _1156;
                    if (_1120)
                    {
                        _1140 = _548;
                    }
                    float _1160 = _1140;
                    float _1162 = _1160;
                    if (_1086)
                    {
                        _1150 = _504;
                    }
                    float _1164 = _1150;
                    bool _1166 = _826 == 0;
                    float _1168 = _1164;
                    if (_1138)
                    {
                        _1154 = _566;
                    }
                    float _1170 = _1154;
                    float _1172 = _1170;
                    if (_1120)
                    {
                        _1158 = _522;
                    }
                    float _1174 = _1158;
                    float _1176 = _1174;
                    if (_1138)
                    {
                        _1162 = _584;
                    }
                    float _1178 = _1162;
                    float _1180 = _1178;
                    if (_1120)
                    {
                        _1168 = _540;
                    }
                    float _1182 = _1168;
                    bool _1184 = _826 == 16;
                    float _1186 = _1182;
                    if (_1148)
                    {
                        _1172 = _600;
                    }
                    float _1188 = _1172;
                    float _1190 = _1188;
                    if (_1138)
                    {
                        _1176 = _558;
                    }
                    float _1192 = _1176;
                    float _1194 = _1192;
                    if (_1148)
                    {
                        _1180 = _618;
                    }
                    float _1196 = _1180;
                    float _1198 = _1196;
                    if (_1138)
                    {
                        _1186 = _576;
                    }
                    float _1200 = _1186;
                    bool _1202 = _816 == 176;
                    float _1204 = _1200;
                    if (_1166)
                    {
                        _838 = _240;
                    }
                    float _1206 = _838;
                    bool _1208 = _826 == 32;
                    float _1210 = _1206;
                    if (_1166)
                    {
                        _776 = _294;
                    }
                    float _1212 = _776;
                    float _1214 = _1212;
                    if (_1148)
                    {
                        _1194 = _592;
                    }
                    float _1216 = _1194;
                    float _1218 = _1216;
                    if (_1148)
                    {
                        _1204 = _610;
                    }
                    float _1220 = _1204;
                    float _1222 = _1220;
                    if (_1184)
                    {
                        _1210 = _222;
                    }
                    float _1224 = _1210;
                    bool _1226 = _826 == 48;
                    float _1228 = _1224;
                    if (_1184)
                    {
                        _1214 = _276;
                    }
                    float _1230 = _1214;
                    float _1232 = _1230;
                    if (_1166)
                    {
                        _840 = _232;
                    }
                    float _1234 = _840;
                    float _1236 = _1234;
                    if (_1166)
                    {
                        _778 = _286;
                    }
                    float _1238 = _778;
                    float _1240 = _1238;
                    if (_1202)
                    {
                        _1042 = _664;
                    }
                    float _1242 = _1042;
                    bool _1244 = _826 == 64;
                    if (_1208)
                    {
                        _1228 = _258;
                    }
                    float _1246 = _1228;
                    float _1248 = _1246;
                    if (_1184)
                    {
                        _1236 = _214;
                    }
                    float _1250 = _1236;
                    float _1252 = _1250;
                    if (_1208)
                    {
                        _1232 = _312;
                    }
                    float _1254 = _1232;
                    float _1256 = _1254;
                    if (_1184)
                    {
                        _1240 = _268;
                    }
                    float _1258 = _1240;
                    float _1260 = _1258;
                    if (_1202)
                    {
                        _1052 = _682;
                    }
                    float _1262 = _1052;
                    bool _1264 = _826 == 80;
                    _702 = _1262;
                    if (_1226)
                    {
                        _1248 = _388;
                    }
                    float _1266 = _1248;
                    float _1268 = _1266;
                    if (_1208)
                    {
                        _1252 = _250;
                    }
                    float _1270 = _1252;
                    float _1272 = _1270;
                    if (_1226)
                    {
                        _1256 = _406;
                    }
                    float _1274 = _1256;
                    float _1276 = _1274;
                    if (_1208)
                    {
                        _1260 = _304;
                    }
                    float _1278 = _1260;
                    bool _1280 = _826 == 96;
                    float _1282 = _1278;
                    if (_1244)
                    {
                        _1268 = _424;
                    }
                    float _1284 = _1268;
                    float _1286 = _1284;
                    if (_1226)
                    {
                        _1272 = _380;
                    }
                    float _1288 = _1272;
                    float _1290 = _1288;
                    if (_1244)
                    {
                        _1276 = _442;
                    }
                    float _1292 = _1276;
                    float _1294 = _1292;
                    if (_1226)
                    {
                        _1282 = _398;
                    }
                    float _1296 = _1282;
                    bool _1298 = _826 == 112;
                    float _1300 = _1296;
                    if (_1264)
                    {
                        _1286 = _460;
                    }
                    float _1302 = _1286;
                    float _1304 = _1302;
                    if (_1244)
                    {
                        _1290 = _416;
                    }
                    float _1306 = _1290;
                    float _1308 = _1306;
                    if (_1264)
                    {
                        _1294 = _478;
                    }
                    float _1310 = _1294;
                    float _1312 = _1310;
                    if (_1244)
                    {
                        _1300 = _434;
                    }
                    float _1314 = _1300;
                    bool _1316 = _826 == 128;
                    float _1318 = _1314;
                    if (_1280)
                    {
                        _1304 = _494;
                    }
                    float _1320 = _1304;
                    float _1322 = _1320;
                    if (_1264)
                    {
                        _1308 = _452;
                    }
                    float _1324 = _1308;
                    float _1326 = _1324;
                    if (_1280)
                    {
                        _1312 = _512;
                    }
                    float _1328 = _1312;
                    float _1330 = _1328;
                    if (_1264)
                    {
                        _1318 = _470;
                    }
                    float _1332 = _1318;
                    float _1334 = _1332;
                    if (_1280)
                    {
                        _1326 = _486;
                    }
                    float _1336 = _1326;
                    float _1338 = _1336;
                    if (_1298)
                    {
                        _1322 = _530;
                    }
                    float _1340 = _1322;
                    float _1342 = _1340;
                    if (_1280)
                    {
                        _1334 = _504;
                    }
                    float _1344 = _1334;
                    float _1346 = _1344;
                    if (_1298)
                    {
                        _1330 = _548;
                    }
                    float _1348 = _1330;
                    bool _1350 = _826 == 144;
                    float _1352 = _1348;
                    if (_1298)
                    {
                        _1338 = _522;
                    }
                    float _1354 = _1338;
                    float _1356 = _1354;
                    if (_1316)
                    {
                        _1342 = _566;
                    }
                    float _1358 = _1342;
                    float _1360 = _1358;
                    if (_1298)
                    {
                        _1346 = _540;
                    }
                    float _1362 = _1346;
                    float _1364 = _1362;
                    if (_1316)
                    {
                        _1364 = _576;
                    }
                    float _1366 = _1364;
                    bool _1368 = _826 == 160;
                    float _1370 = _1366;
                    if (_1316)
                    {
                        _1356 = _558;
                    }
                    float _1372 = _1356;
                    float _1374 = _1372;
                    if (_1316)
                    {
                        _1352 = _584;
                    }
                    float _1376 = _1352;
                    bool _1378 = _836 == 160;
                    float _1380 = _1376;
                    if (_1350)
                    {
                        _1374 = _592;
                    }
                    float _1382 = _1374;
                    bool _1384 = _826 == 176;
                    float _1386 = _1382;
                    if (_1350)
                    {
                        _1370 = _610;
                    }
                    float _1388 = _1370;
                    bool _1390 = _836 == 176;
                    float _1392 = _1388;
                    if (_1202)
                    {
                        _1002 = _672;
                    }
                    float _1394 = _1002;
                    if (_1368)
                    {
                        _1392 = _646;
                    }
                    float _1396 = _1392;
                    float _1398 = _1396;
                    if (_1350)
                    {
                        _1360 = _600;
                    }
                    float _1400 = _1360;
                    float _1402 = _1400;
                    if (_1368)
                    {
                        _1402 = _636;
                    }
                    float _1404 = _1402;
                    float _1406 = _200 * _1394;
                    float _1408 = _1404;
                    if (_1368)
                    {
                        _1386 = _628;
                    }
                    float _1410 = _1386;
                    float _1412 = _1410;
                    if (_1378)
                    {
                        _1190 = _636;
                    }
                    float _1414 = _1190;
                    float _1416 = fma(_198, _1242, _1406);
                    _696 = _1416;
                    float _1418 = _1414;
                    if (_1384)
                    {
                        _1408 = _672;
                    }
                    float _1420 = _1408;
                    if (_1390)
                    {
                        _1418 = _672;
                    }
                    float _1422 = _1418;
                    if (_1378)
                    {
                        _1218 = _628;
                    }
                    float _1424 = _1218;
                    float _1426 = _1424;
                    if (_1390)
                    {
                        _1426 = _664;
                    }
                    float _1428 = _1426;
                    float _1430 = _200 * _1422;
                    _698 = _1430;
                    if (_1384)
                    {
                        _1412 = _664;
                    }
                    float _1432 = _1412;
                    float _1434 = _200 * _1420;
                    if (_1202)
                    {
                        _1010 = _690;
                    }
                    float _1436 = _1010;
                    float _1438 = fma(_198, _1428, _1430);
                    bool _1440 = _814 >= as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
                    float _1442 = fma(_198, _1432, _1434);
                    _694 = _1442;
                    _704 = _1436;
                    if (_1378)
                    {
                        _1222 = _646;
                    }
                    float _1444 = _1222;
                    float _1446 = fma(_202, _1262, _1416);
                    float _1448 = _1444;
                    if (_1390)
                    {
                        _1448 = _682;
                    }
                    float _1450 = _1448;
                    _706 = _1450;
                    if (_1384)
                    {
                        _1398 = _682;
                    }
                    float _1452 = _1398;
                    float _1454 = _1446 + _1436;
                    _708 = _1452;
                    if (_1350)
                    {
                        _1380 = _618;
                    }
                    float _1456 = _1380;
                    float _1458 = _1456;
                    if (_1368)
                    {
                        _1458 = _654;
                    }
                    float _1460 = _1458;
                    float _1462 = _1460;
                    if (_1378)
                    {
                        _1198 = _654;
                    }
                    float _1464 = _1198;
                    float _1466 = _1464;
                    if (_1390)
                    {
                        _1466 = _690;
                    }
                    float _1468 = _1466;
                    _710 = _1468;
                    if (_1384)
                    {
                        _1462 = _690;
                    }
                    float _1470 = _1462;
                    float _1472 = fma(_202, _1450, _1438);
                    float _1474 = fma(_202, _1452, _1442);
                    _1476 = fma(_1454, _810, _782);
                    float _1478 = _1472 + _1468;
                    float _1480 = _1474 + _1470;
                    _1482 = fma(_1478, _810, _786);
                    _1484 = fma(_1480, _810, _790);
                    _714 = !_1440;
                    _350 = _1476;
                    _338 = _1482;
                    _358 = _1484;
                    _700 = _1478;
                    _712 = _1470;
                } while (_714);
                _360 = _1476;
                _366 = _1484;
                _352 = _1482;
            }
            float _1486 = _360;
            float _1488 = _366;
            float _1490 = _352;
            _182 = _1490;
            if (!_224)
            {
                _340 = _1486;
            }
            float _1492 = _340;
            float _1494 = _1492;
            if (!_224)
            {
                _342 = _1488;
            }
            float _1496 = _342;
            float _1498 = _1496;
            if (_224)
            {
                _1494 = _1486;
            }
            float _1500 = _1494;
            _184 = _1500;
            if (_224)
            {
                _1498 = _1488;
            }
            float _1502 = _1498;
            _186 = _1502;
            _188 = true;
        }
    }
    else
    {
        bool _1504 = 0 != as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
        if (!_1504)
        {
            float _1506 = in.m_42.x;
            float _1508 = in.m_42.y;
            float _1510 = in.m_42.z;
            float _1512 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
            float _1514 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
            float _1516 = _1508 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
            float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[0].x, _1512);
            float _1520 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[1].x, _1514);
            float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c7)._m0[2].x, _1516);
            float _1524 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[0].z, _1518);
            float _1526 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[1].z, _1520);
            float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c7)._m0[2].z, _1522);
            float _1530 = _1524 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
            float _1532 = _1526 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
            float _1534 = _1528 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
            _182 = _1532;
            _184 = _1530;
            _186 = _1534;
            _188 = true;
        }
        else
        {
            float _1536 = as_type<float>(in.m_46.x);
            float _1538 = as_type<float>(in.m_46.y);
            float _1540 = as_type<float>(in.m_46.z);
            float _1542 = as_type<float>(in.m_46.w);
            float _1544 = in.m_42.x;
            float _1546 = in.m_42.y;
            float _1548 = in.m_42.z;
            int _1550 = as_type<int>(_1536) * 48;
            uint _1552 = uint(int(uint(_1550) >> uint(2)));
            uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
            int _1556 = int(_1552) & 3;
            float _1558 = (*spvDescriptorSet0.vp_c5)._m0[int(_1554)][_1556];
            int _1560 = int(_1552) + 1;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            int _1564 = _1560 & 3;
            float _1566 = (*spvDescriptorSet0.vp_c5)._m0[int(_1562)][_1564];
            bool _1568 = as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x) > 1;
            int _1570 = _1550 + 16;
            uint _1572 = uint(int(uint(_1570) >> uint(2)));
            uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
            int _1576 = int(_1572) & 3;
            float _1578 = (*spvDescriptorSet0.vp_c5)._m0[int(_1574)][_1576];
            int _1580 = int(_1572) + 1;
            uint _1582 = uint(int(uint(_1580) >> uint(2)));
            int _1584 = _1580 & 3;
            float _1586 = (*spvDescriptorSet0.vp_c5)._m0[int(_1582)][_1584];
            int _1588 = _1550 + 32;
            uint _1590 = uint(int(uint(_1588) >> uint(2)));
            uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
            int _1594 = int(_1590) & 3;
            float _1596 = (*spvDescriptorSet0.vp_c5)._m0[int(_1592)][_1594];
            int _1598 = int(_1590) + 1;
            uint _1600 = uint(int(uint(_1598) >> uint(2)));
            int _1602 = _1598 & 3;
            float _1604 = (*spvDescriptorSet0.vp_c5)._m0[int(_1600)][_1602];
            int _1606 = _1550 + 8;
            uint _1608 = uint(int(uint(_1606) >> uint(2)));
            uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
            int _1612 = int(_1608) & 3;
            float _1614 = (*spvDescriptorSet0.vp_c5)._m0[int(_1610)][_1612];
            int _1616 = int(_1608) + 1;
            uint _1618 = uint(int(uint(_1616) >> uint(2)));
            int _1620 = _1616 & 3;
            float _1622 = (*spvDescriptorSet0.vp_c5)._m0[int(_1618)][_1620];
            int _1624 = _1550 + 24;
            uint _1626 = uint(int(uint(_1624) >> uint(2)));
            uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
            int _1630 = int(_1626) & 3;
            float _1632 = (*spvDescriptorSet0.vp_c5)._m0[int(_1628)][_1630];
            int _1634 = int(_1626) + 1;
            uint _1636 = uint(int(uint(_1634) >> uint(2)));
            int _1638 = _1634 & 3;
            float _1640 = (*spvDescriptorSet0.vp_c5)._m0[int(_1636)][_1638];
            int _1642 = _1550 + 40;
            uint _1644 = uint(int(uint(_1642) >> uint(2)));
            uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
            int _1648 = int(_1644) & 3;
            float _1650 = (*spvDescriptorSet0.vp_c5)._m0[int(_1646)][_1648];
            int _1652 = int(_1644) + 1;
            uint _1654 = uint(int(uint(_1652) >> uint(2)));
            int _1656 = _1652 & 3;
            float _1658 = (*spvDescriptorSet0.vp_c5)._m0[int(_1654)][_1656];
            float _1660 = _1546 * _1566;
            float _1662 = fma(_1544, _1558, _1660);
            float _1664 = _1546 * _1586;
            float _1666 = fma(_1544, _1578, _1664);
            float _1668 = _1546 * _1604;
            float _1670 = fma(_1544, _1596, _1668);
            float _1672 = fma(_1548, _1614, _1662);
            float _1674 = _1672 + _1622;
            float _1676 = fma(_1548, _1632, _1666);
            float _1678 = _1676 + _1640;
            float _1680 = _1676;
            float _1682 = _1662;
            float _1684 = _1672;
            float _1686 = _1674;
            float _1688 = _1678;
            float _1690 = _1546;
            float _1692 = _1544;
            if (!_1568)
            {
                _1680 = _1674;
            }
            float _1694 = _1680;
            float _1696 = fma(_1548, _1650, _1670);
            float _1698 = _1694;
            if (!_1568)
            {
                _1682 = _1678;
            }
            float _1700 = _1682;
            float _1702 = _1696 + _1658;
            float _1704 = _1702;
            float _1706 = _1700;
            if (!_1568)
            {
                _1684 = _1702;
            }
            float _1708 = _1684;
            bool _1710 = !_1568;
            float _1712 = _1708;
            if (!_1710)
            {
                int _1714 = as_type<int>(_1538) * 48;
                int _1716 = as_type<int>(_1540) * 48;
                int _1718 = as_type<int>(_1542) * 48;
                uint _1720 = uint(int(uint(_1714) >> uint(2)));
                uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
                int _1724 = int(_1720) & 3;
                float _1726 = (*spvDescriptorSet0.vp_c5)._m0[int(_1722)][_1724];
                int _1728 = int(_1720) + 1;
                uint _1730 = uint(int(uint(_1728) >> uint(2)));
                int _1732 = _1728 & 3;
                float _1734 = (*spvDescriptorSet0.vp_c5)._m0[int(_1730)][_1732];
                int _1736 = _1714 + 8;
                uint _1738 = uint(int(uint(_1736) >> uint(2)));
                uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
                int _1742 = int(_1738) & 3;
                float _1744 = (*spvDescriptorSet0.vp_c5)._m0[int(_1740)][_1742];
                int _1746 = int(_1738) + 1;
                uint _1748 = uint(int(uint(_1746) >> uint(2)));
                int _1750 = _1746 & 3;
                float _1752 = (*spvDescriptorSet0.vp_c5)._m0[int(_1748)][_1750];
                int _1754 = _1714 + 16;
                uint _1756 = uint(int(uint(_1754) >> uint(2)));
                uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
                int _1760 = int(_1756) & 3;
                float _1762 = (*spvDescriptorSet0.vp_c5)._m0[int(_1758)][_1760];
                int _1764 = int(_1756) + 1;
                uint _1766 = uint(int(uint(_1764) >> uint(2)));
                int _1768 = _1764 & 3;
                float _1770 = (*spvDescriptorSet0.vp_c5)._m0[int(_1766)][_1768];
                int _1772 = _1714 + 24;
                uint _1774 = uint(int(uint(_1772) >> uint(2)));
                uint _1776 = uint(int(uint(int(_1774)) >> uint(2)));
                int _1778 = int(_1774) & 3;
                float _1780 = (*spvDescriptorSet0.vp_c5)._m0[int(_1776)][_1778];
                int _1782 = int(_1774) + 1;
                uint _1784 = uint(int(uint(_1782) >> uint(2)));
                int _1786 = _1782 & 3;
                float _1788 = (*spvDescriptorSet0.vp_c5)._m0[int(_1784)][_1786];
                int _1790 = _1714 + 32;
                uint _1792 = uint(int(uint(_1790) >> uint(2)));
                uint _1794 = uint(int(uint(int(_1792)) >> uint(2)));
                int _1796 = int(_1792) & 3;
                float _1798 = (*spvDescriptorSet0.vp_c5)._m0[int(_1794)][_1796];
                int _1800 = int(_1792) + 1;
                uint _1802 = uint(int(uint(_1800) >> uint(2)));
                int _1804 = _1800 & 3;
                float _1806 = (*spvDescriptorSet0.vp_c5)._m0[int(_1802)][_1804];
                int _1808 = _1714 + 40;
                uint _1810 = uint(int(uint(_1808) >> uint(2)));
                uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
                int _1814 = int(_1810) & 3;
                float _1816 = (*spvDescriptorSet0.vp_c5)._m0[int(_1812)][_1814];
                int _1818 = int(_1810) + 1;
                uint _1820 = uint(int(uint(_1818) >> uint(2)));
                int _1822 = _1818 & 3;
                float _1824 = (*spvDescriptorSet0.vp_c5)._m0[int(_1820)][_1822];
                uint _1826 = uint(int(uint(_1716) >> uint(2)));
                uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
                int _1830 = int(_1826) & 3;
                float _1832 = (*spvDescriptorSet0.vp_c5)._m0[int(_1828)][_1830];
                int _1834 = int(_1826) + 1;
                uint _1836 = uint(int(uint(_1834) >> uint(2)));
                int _1838 = _1834 & 3;
                float _1840 = (*spvDescriptorSet0.vp_c5)._m0[int(_1836)][_1838];
                int _1842 = _1716 + 8;
                uint _1844 = uint(int(uint(_1842) >> uint(2)));
                uint _1846 = uint(int(uint(int(_1844)) >> uint(2)));
                int _1848 = int(_1844) & 3;
                float _1850 = (*spvDescriptorSet0.vp_c5)._m0[int(_1846)][_1848];
                int _1852 = int(_1844) + 1;
                uint _1854 = uint(int(uint(_1852) >> uint(2)));
                int _1856 = _1852 & 3;
                float _1858 = (*spvDescriptorSet0.vp_c5)._m0[int(_1854)][_1856];
                int _1860 = _1716 + 16;
                uint _1862 = uint(int(uint(_1860) >> uint(2)));
                uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
                int _1866 = int(_1862) & 3;
                float _1868 = (*spvDescriptorSet0.vp_c5)._m0[int(_1864)][_1866];
                int _1870 = int(_1862) + 1;
                uint _1872 = uint(int(uint(_1870) >> uint(2)));
                int _1874 = _1870 & 3;
                float _1876 = (*spvDescriptorSet0.vp_c5)._m0[int(_1872)][_1874];
                int _1878 = _1716 + 24;
                uint _1880 = uint(int(uint(_1878) >> uint(2)));
                uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
                int _1884 = int(_1880) & 3;
                float _1886 = (*spvDescriptorSet0.vp_c5)._m0[int(_1882)][_1884];
                int _1888 = int(_1880) + 1;
                uint _1890 = uint(int(uint(_1888) >> uint(2)));
                int _1892 = _1888 & 3;
                float _1894 = (*spvDescriptorSet0.vp_c5)._m0[int(_1890)][_1892];
                int _1896 = _1716 + 32;
                uint _1898 = uint(int(uint(_1896) >> uint(2)));
                uint _1900 = uint(int(uint(int(_1898)) >> uint(2)));
                int _1902 = int(_1898) & 3;
                float _1904 = (*spvDescriptorSet0.vp_c5)._m0[int(_1900)][_1902];
                int _1906 = int(_1898) + 1;
                uint _1908 = uint(int(uint(_1906) >> uint(2)));
                int _1910 = _1906 & 3;
                float _1912 = (*spvDescriptorSet0.vp_c5)._m0[int(_1908)][_1910];
                int _1914 = _1716 + 40;
                uint _1916 = uint(int(uint(_1914) >> uint(2)));
                uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
                int _1920 = int(_1916) & 3;
                float _1922 = (*spvDescriptorSet0.vp_c5)._m0[int(_1918)][_1920];
                int _1924 = int(_1916) + 1;
                uint _1926 = uint(int(uint(_1924) >> uint(2)));
                int _1928 = _1924 & 3;
                float _1930 = (*spvDescriptorSet0.vp_c5)._m0[int(_1926)][_1928];
                uint _1932 = uint(int(uint(_1718) >> uint(2)));
                uint _1934 = uint(int(uint(int(_1932)) >> uint(2)));
                int _1936 = int(_1932) & 3;
                float _1938 = (*spvDescriptorSet0.vp_c5)._m0[int(_1934)][_1936];
                int _1940 = int(_1932) + 1;
                uint _1942 = uint(int(uint(_1940) >> uint(2)));
                int _1944 = _1940 & 3;
                float _1946 = (*spvDescriptorSet0.vp_c5)._m0[int(_1942)][_1944];
                int _1948 = _1718 + 8;
                uint _1950 = uint(int(uint(_1948) >> uint(2)));
                uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
                int _1954 = int(_1950) & 3;
                float _1956 = (*spvDescriptorSet0.vp_c5)._m0[int(_1952)][_1954];
                int _1958 = int(_1950) + 1;
                uint _1960 = uint(int(uint(_1958) >> uint(2)));
                int _1962 = _1958 & 3;
                float _1964 = (*spvDescriptorSet0.vp_c5)._m0[int(_1960)][_1962];
                int _1966 = _1718 + 16;
                uint _1968 = uint(int(uint(_1966) >> uint(2)));
                uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
                int _1972 = int(_1968) & 3;
                float _1974 = (*spvDescriptorSet0.vp_c5)._m0[int(_1970)][_1972];
                int _1976 = int(_1968) + 1;
                uint _1978 = uint(int(uint(_1976) >> uint(2)));
                int _1980 = _1976 & 3;
                float _1982 = (*spvDescriptorSet0.vp_c5)._m0[int(_1978)][_1980];
                int _1984 = _1718 + 24;
                uint _1986 = uint(int(uint(_1984) >> uint(2)));
                uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
                int _1990 = int(_1986) & 3;
                float _1992 = (*spvDescriptorSet0.vp_c5)._m0[int(_1988)][_1990];
                int _1994 = int(_1986) + 1;
                uint _1996 = uint(int(uint(_1994) >> uint(2)));
                int _1998 = _1994 & 3;
                float _2000 = (*spvDescriptorSet0.vp_c5)._m0[int(_1996)][_1998];
                int _2002 = _1718 + 32;
                uint _2004 = uint(int(uint(_2002) >> uint(2)));
                uint _2006 = uint(int(uint(int(_2004)) >> uint(2)));
                int _2008 = int(_2004) & 3;
                float _2010 = (*spvDescriptorSet0.vp_c5)._m0[int(_2006)][_2008];
                int _2012 = int(_2004) + 1;
                uint _2014 = uint(int(uint(_2012) >> uint(2)));
                int _2016 = _2012 & 3;
                float _2018 = (*spvDescriptorSet0.vp_c5)._m0[int(_2014)][_2016];
                int _2020 = _1718 + 40;
                uint _2022 = uint(int(uint(_2020) >> uint(2)));
                uint _2024 = uint(int(uint(int(_2022)) >> uint(2)));
                int _2026 = int(_2022) & 3;
                float _2028 = (*spvDescriptorSet0.vp_c5)._m0[int(_2024)][_2026];
                int _2030 = int(_2022) + 1;
                uint _2032 = uint(int(uint(_2030) >> uint(2)));
                int _2034 = _2030 & 3;
                float _2036 = (*spvDescriptorSet0.vp_c5)._m0[int(_2032)][_2034];
                int _2038 = 1;
                float _2040 = 0.0;
                float _2042 = 0.0;
                float _2044 = 0.0;
                float _2046 = 0.0;
                float _2048 = 0.0;
                float _2050 = 0.0;
                float _2052 = 0.0;
                float _2054 = 0.0;
                float _2056 = 0.0;
                float _2058 = 0.0;
                bool _2060;
                float _2826;
                float _2828;
                float _2830;
                do
                {
                    int _2062 = _2038;
                    float _2064 = _1686;
                    float _2066 = _1688;
                    float _2068 = _1704;
                    float _2070 = _2040;
                    float _2072 = _2042;
                    float _2074 = _2044;
                    float _2076 = _2046;
                    float _2078 = _2048;
                    float _2080 = _2050;
                    float _2082 = _2052;
                    float _2084 = _2054;
                    float _2086 = _2056;
                    float _2088 = _2058;
                    float _2090 = in.m_48.x;
                    int _2092 = _2062 & 3;
                    bool _2094 = _2062 != 1;
                    bool _2096 = _2092 >= 2;
                    float _2098 = _2064;
                    float _2100 = _2066;
                    float _2102 = _2068;
                    float _2104 = _2090;
                    float _2106 = _2072;
                    float _2108 = _2070;
                    float _2110 = _2084;
                    float _2112 = _2078;
                    float _2114 = _2080;
                    float _2116 = _2076;
                    float _2118 = _2074;
                    float _2120 = _2086;
                    float _2122 = _2082;
                    float _2124 = _2088;
                    if (!_2094)
                    {
                        float _2126 = _2064 * _2090;
                        _2098 = _2126;
                    }
                    float _2128 = _2098;
                    if (!_2094)
                    {
                        float _2130 = _2066 * _2090;
                        _2100 = _2130;
                    }
                    float _2132 = _2100;
                    if (!_2094)
                    {
                        float _2134 = _2068 * _2090;
                        _2102 = _2134;
                    }
                    float _2136 = _2102;
                    bool _2138 = !_2096;
                    if (!_2138)
                    {
                        bool _2140 = _2092 >= 3;
                        bool _2142 = !_2140;
                        if (!_2142)
                        {
                            bool _2144 = _2092 != 3;
                            _2146 = _2144;
                            if (!_2146)
                            {
                                float _2148 = in.m_48.w;
                                _2104 = _2148;
                                _2146 = true;
                            }
                        }
                        else
                        {
                            float _2150 = in.m_48.z;
                            _2104 = _2150;
                            _2146 = true;
                        }
                    }
                    else
                    {
                        bool _2152 = _2092 != 1;
                        if (!_2152)
                        {
                            float _2154 = in.m_48.y;
                            _2104 = _2154;
                        }
                    }
                    _2146 = false;
                    float _2156 = _2104;
                    int _2158 = _2062 * 3;
                    int _2160 = _2062 + 1;
                    int _2162 = _2158 << 4;
                    int _2164 = _2158 + 1;
                    bool _2166 = _2162 == 0;
                    bool _2168 = _2162 == 16;
                    int _2170 = _2164 * 16;
                    bool _2172 = _2162 == 32;
                    bool _2174 = _2162 == 48;
                    bool _2176 = _2162 == 64;
                    bool _2178 = _2162 == 80;
                    int _2180 = _2158 + 2;
                    _2038 = _2160;
                    float _2182 = as_type<float>(_2180);
                    float _2184 = as_type<float>(_2162);
                    if (_2166)
                    {
                        _2106 = _1558;
                    }
                    float _2186 = _2106;
                    float _2188 = _2186;
                    if (_2166)
                    {
                        _2108 = _1566;
                    }
                    float _2190 = _2108;
                    float _2192 = _2190;
                    if (_2166)
                    {
                        _2110 = _1622;
                    }
                    float _2194 = _2110;
                    float _2196 = _2194;
                    if (_2166)
                    {
                        _2112 = _1614;
                    }
                    float _2198 = _2112;
                    float _2200 = _2198;
                    if (_2168)
                    {
                        _2200 = _1632;
                    }
                    float _2202 = _2200;
                    bool _2204 = _2162 == 96;
                    float _2206 = _2202;
                    if (_2168)
                    {
                        _2188 = _1578;
                    }
                    float _2208 = _2188;
                    float _2210 = _2208;
                    if (_2168)
                    {
                        _2192 = _1586;
                    }
                    float _2212 = _2192;
                    float _2214 = _2212;
                    if (_2172)
                    {
                        _2214 = _1604;
                    }
                    float _2216 = _2214;
                    float _2218 = _2216;
                    if (_2168)
                    {
                        _2196 = _1640;
                    }
                    float _2220 = _2196;
                    bool _2222 = _2162 == 112;
                    float _2224 = _2220;
                    if (_2172)
                    {
                        _2210 = _1596;
                    }
                    float _2226 = _2210;
                    float _2228 = _2226;
                    if (_2174)
                    {
                        _2228 = _1726;
                    }
                    float _2230 = _2228;
                    float _2232 = _2230;
                    if (_2172)
                    {
                        _2206 = _1650;
                    }
                    float _2234 = _2206;
                    float _2236 = _2234;
                    if (_2172)
                    {
                        _2224 = _1658;
                    }
                    float _2238 = _2224;
                    float _2240 = _2238;
                    if (_2174)
                    {
                        _2240 = _1752;
                    }
                    float _2242 = _2240;
                    float _2244 = _2242;
                    if (_2174)
                    {
                        _2218 = _1734;
                    }
                    float _2246 = _2218;
                    float _2248 = _2246;
                    if (_2174)
                    {
                        _2236 = _1744;
                    }
                    float _2250 = _2236;
                    float _2252 = _2250;
                    if (_2176)
                    {
                        _2252 = _1780;
                    }
                    float _2254 = _2252;
                    bool _2256 = _2162 == 128;
                    float _2258 = _2254;
                    if (_2176)
                    {
                        _2232 = _1762;
                    }
                    float _2260 = _2232;
                    float _2262 = _2260;
                    if (_2176)
                    {
                        _2248 = _1770;
                    }
                    float _2264 = _2248;
                    float _2266 = _2264;
                    if (_2178)
                    {
                        _2266 = _1806;
                    }
                    float _2268 = _2266;
                    float _2270 = _2268;
                    if (_2176)
                    {
                        _2244 = _1788;
                    }
                    float _2272 = _2244;
                    float _2274 = _2272;
                    if (_2204)
                    {
                        _2270 = _1840;
                    }
                    float _2276 = _2270;
                    bool _2278 = _2162 == 144;
                    float _2280 = _2276;
                    if (_2178)
                    {
                        _2262 = _1798;
                    }
                    float _2282 = _2262;
                    float _2284 = _2282;
                    if (_2178)
                    {
                        _2258 = _1816;
                    }
                    float _2286 = _2258;
                    float _2288 = _2286;
                    if (_2178)
                    {
                        _2274 = _1824;
                    }
                    float _2290 = _2274;
                    bool _2292 = _2162 == 160;
                    float _2294 = _2290;
                    if (_2204)
                    {
                        _2284 = _1832;
                    }
                    float _2296 = _2284;
                    float _2298 = _2296;
                    if (_2222)
                    {
                        _2298 = _1868;
                    }
                    float _2300 = _2298;
                    float _2302 = _2300;
                    if (_2204)
                    {
                        _2288 = _1850;
                    }
                    float _2304 = _2288;
                    float _2306 = _2304;
                    if (_2204)
                    {
                        _2294 = _1858;
                    }
                    float _2308 = _2294;
                    float _2310 = _2308;
                    if (_2222)
                    {
                        _2310 = _1894;
                    }
                    float _2312 = _2310;
                    bool _2314 = _2170 == 0;
                    float _2316 = _2312;
                    if (_2222)
                    {
                        _2280 = _1876;
                    }
                    float _2318 = _2280;
                    float _2320 = _2318;
                    if (_2222)
                    {
                        _2306 = _1886;
                    }
                    float _2322 = _2306;
                    float _2324 = _2322;
                    if (_2256)
                    {
                        _2324 = _1922;
                    }
                    float _2326 = _2324;
                    bool _2328 = _2170 == 16;
                    float _2330 = _2326;
                    if (_2256)
                    {
                        _2302 = _1904;
                    }
                    float _2332 = _2302;
                    float _2334 = _2332;
                    if (_2256)
                    {
                        _2320 = _1912;
                    }
                    float _2336 = _2320;
                    float _2338 = _2336;
                    if (_2278)
                    {
                        _2338 = _1946;
                    }
                    float _2340 = _2338;
                    float _2342 = _2340;
                    if (_2256)
                    {
                        _2316 = _1930;
                    }
                    float _2344 = _2316;
                    float _2346 = _2344;
                    if (_2314)
                    {
                        _2114 = _1614;
                    }
                    float _2348 = _2114;
                    bool _2350 = _2170 == 32;
                    float _2352 = _2348;
                    if (_2278)
                    {
                        _2334 = _1938;
                    }
                    float _2354 = _2334;
                    float _2356 = _2354;
                    if (_2292)
                    {
                        _2356 = _1974;
                    }
                    float _2358 = _2356;
                    float _2360 = _2358;
                    if (_2278)
                    {
                        _2330 = _1956;
                    }
                    float _2362 = _2330;
                    float _2364 = _2362;
                    if (_2278)
                    {
                        _2346 = _1964;
                    }
                    float _2366 = _2346;
                    float _2368 = _2366;
                    if (_2292)
                    {
                        _2368 = _2000;
                    }
                    float _2370 = _2368;
                    bool _2372 = _2170 == 48;
                    float _2374 = _2370;
                    if (_2292)
                    {
                        _2342 = _1982;
                    }
                    float _2376 = _2342;
                    float _2378 = _2376;
                    if (_2292)
                    {
                        _2364 = _1992;
                    }
                    float _2380 = _2364;
                    bool _2382 = _2170 == 64;
                    float _2384 = _2380;
                    if (_2314)
                    {
                        _2116 = _1558;
                    }
                    float _2386 = _2116;
                    float _2388 = _2386;
                    if (_2314)
                    {
                        _2118 = _1566;
                    }
                    float _2390 = _2118;
                    float _2392 = _2390;
                    if (_2328)
                    {
                        _2392 = _1586;
                    }
                    float _2394 = _2392;
                    float _2396 = _2394;
                    if (_2314)
                    {
                        _2120 = _1622;
                    }
                    float _2398 = _2120;
                    bool _2400 = _2170 == 80;
                    float _2402 = _2398;
                    if (_2328)
                    {
                        _2388 = _1578;
                    }
                    float _2404 = _2388;
                    float _2406 = _2404;
                    if (_2350)
                    {
                        _2406 = _1596;
                    }
                    float _2408 = _2406;
                    float _2410 = _2408;
                    if (_2328)
                    {
                        _2352 = _1632;
                    }
                    float _2412 = _2352;
                    float _2414 = _2412;
                    if (_2328)
                    {
                        _2402 = _1640;
                    }
                    float _2416 = _2402;
                    float _2418 = _2416;
                    if (_2350)
                    {
                        _2418 = _1658;
                    }
                    float _2420 = _2418;
                    bool _2422 = _2170 == 96;
                    float _2424 = _2420;
                    if (_2350)
                    {
                        _2396 = _1604;
                    }
                    float _2426 = _2396;
                    float _2428 = _2426;
                    if (_2350)
                    {
                        _2414 = _1650;
                    }
                    float _2430 = _2414;
                    float _2432 = _2430;
                    if (_2372)
                    {
                        _2432 = _1744;
                    }
                    float _2434 = _2432;
                    int _2436 = _2180 << 4;
                    float _2438 = _2434;
                    if (_2372)
                    {
                        _2410 = _1726;
                    }
                    float _2440 = _2410;
                    float _2442 = _2440;
                    if (_2372)
                    {
                        _2428 = _1734;
                    }
                    float _2444 = _2428;
                    float _2446 = _2444;
                    if (_2382)
                    {
                        _2446 = _1770;
                    }
                    float _2448 = _2446;
                    float _2450 = _2448;
                    if (_2372)
                    {
                        _2424 = _1752;
                    }
                    float _2452 = _2424;
                    bool _2454 = _2170 == 112;
                    float _2456 = _2452;
                    if (_2382)
                    {
                        _2442 = _1762;
                    }
                    float _2458 = _2442;
                    float _2460 = _2458;
                    if (_2400)
                    {
                        _2460 = _1798;
                    }
                    float _2462 = _2460;
                    float _2464 = _2462;
                    if (_2382)
                    {
                        _2438 = _1780;
                    }
                    float _2466 = _2438;
                    float _2468 = _2466;
                    if (_2382)
                    {
                        _2456 = _1788;
                    }
                    float _2470 = _2456;
                    float _2472 = _2470;
                    if (_2400)
                    {
                        _2472 = _1824;
                    }
                    float _2474 = _2472;
                    bool _2476 = _2170 == 128;
                    float _2478 = _2474;
                    if (_2400)
                    {
                        _2450 = _1806;
                    }
                    float _2480 = _2450;
                    float _2482 = _2480;
                    if (_2400)
                    {
                        _2468 = _1816;
                    }
                    float _2484 = _2468;
                    float _2486 = _2484;
                    if (_2422)
                    {
                        _2486 = _1850;
                    }
                    float _2488 = _2486;
                    bool _2490 = _2170 == 144;
                    float _2492 = _2488;
                    if (_2422)
                    {
                        _2464 = _1832;
                    }
                    float _2494 = _2464;
                    float _2496 = _2494;
                    if (_2422)
                    {
                        _2482 = _1840;
                    }
                    float _2498 = _2482;
                    float _2500 = _2498;
                    if (_2454)
                    {
                        _2500 = _1876;
                    }
                    float _2502 = _2500;
                    float _2504 = _2502;
                    if (_2422)
                    {
                        _2478 = _1858;
                    }
                    float _2506 = _2478;
                    bool _2508 = _2436 == 0;
                    float _2510 = _2506;
                    if (_2454)
                    {
                        _2496 = _1868;
                    }
                    float _2512 = _2496;
                    float _2514 = _2512;
                    if (_2476)
                    {
                        _2514 = _1904;
                    }
                    float _2516 = _2514;
                    float _2518 = _2516;
                    if (_2454)
                    {
                        _2492 = _1886;
                    }
                    float _2520 = _2492;
                    float _2522 = _2520;
                    if (_2454)
                    {
                        _2510 = _1894;
                    }
                    float _2524 = _2510;
                    float _2526 = _2524;
                    if (_2476)
                    {
                        _2526 = _1930;
                    }
                    float _2528 = _2526;
                    bool _2530 = _2436 == 16;
                    float _2532 = _2528;
                    if (_2476)
                    {
                        _2504 = _1912;
                    }
                    float _2534 = _2504;
                    float _2536 = _2534;
                    if (_2476)
                    {
                        _2522 = _1922;
                    }
                    float _2538 = _2522;
                    float _2540 = _2538;
                    if (_2490)
                    {
                        _2540 = _1956;
                    }
                    float _2542 = _2540;
                    bool _2544 = _2162 == 176;
                    float _2546 = _2542;
                    if (_2508)
                    {
                        _2182 = _1566;
                    }
                    float _2548 = _2182;
                    bool _2550 = _2436 == 32;
                    float _2552 = _2548;
                    if (_2490)
                    {
                        _2518 = _1938;
                    }
                    float _2554 = _2518;
                    float _2556 = _2554;
                    if (_2490)
                    {
                        _2536 = _1946;
                    }
                    float _2558 = _2536;
                    float _2560 = _2558;
                    if (_2490)
                    {
                        _2532 = _1964;
                    }
                    float _2562 = _2532;
                    bool _2564 = _2436 == 48;
                    float _2566 = _2562;
                    if (_2508)
                    {
                        _2184 = _1558;
                    }
                    float _2568 = _2184;
                    float _2570 = _2568;
                    if (_2530)
                    {
                        _2570 = _1578;
                    }
                    float _2572 = _2570;
                    float _2574 = _2572;
                    if (_2508)
                    {
                        _2122 = _1614;
                    }
                    float _2576 = _2122;
                    float _2578 = _2576;
                    if (_2544)
                    {
                        _2378 = _2018;
                    }
                    float _2580 = _2378;
                    if (_2508)
                    {
                        _2124 = _1622;
                    }
                    float _2582 = _2124;
                    float _2584 = _2582;
                    if (_2530)
                    {
                        _2584 = _1640;
                    }
                    float _2586 = _2584;
                    bool _2588 = _2436 == 64;
                    float _2590 = _2586;
                    if (_2544)
                    {
                        _2360 = _2010;
                    }
                    float _2592 = _2360;
                    if (_2530)
                    {
                        _2552 = _1586;
                    }
                    float _2594 = _2552;
                    float _2596 = _1546 * _2580;
                    float _2598 = _2594;
                    if (_2530)
                    {
                        _2578 = _1632;
                    }
                    float _2600 = _2578;
                    float _2602 = _2600;
                    if (_2550)
                    {
                        _2602 = _1650;
                    }
                    float _2604 = _2602;
                    bool _2606 = _2436 == 80;
                    float _2608 = fma(_1544, _2592, _2596);
                    _2042 = _2608;
                    float _2610 = _2604;
                    if (_2550)
                    {
                        _2574 = _1596;
                    }
                    float _2612 = _2574;
                    float _2614 = _2612;
                    if (_2544)
                    {
                        _2384 = _2028;
                    }
                    float _2616 = _2384;
                    _2048 = _2616;
                    if (_2550)
                    {
                        _2598 = _1604;
                    }
                    float _2618 = _2598;
                    float _2620 = _2618;
                    if (_2564)
                    {
                        _2620 = _1734;
                    }
                    float _2622 = _2620;
                    float _2624 = _2622;
                    if (_2550)
                    {
                        _2590 = _1658;
                    }
                    float _2626 = _2590;
                    bool _2628 = _2436 == 96;
                    float _2630 = _2626;
                    if (_2564)
                    {
                        _2614 = _1726;
                    }
                    float _2632 = _2614;
                    float _2634 = _2632;
                    if (_2588)
                    {
                        _2634 = _1762;
                    }
                    float _2636 = _2634;
                    float _2638 = _2636;
                    if (_2564)
                    {
                        _2610 = _1744;
                    }
                    float _2640 = _2610;
                    float _2642 = _2640;
                    if (_2564)
                    {
                        _2630 = _1752;
                    }
                    float _2644 = _2630;
                    float _2646 = _2644;
                    if (_2588)
                    {
                        _2646 = _1788;
                    }
                    float _2648 = _2646;
                    bool _2650 = _2436 == 112;
                    float _2652 = _2648;
                    if (_2588)
                    {
                        _2624 = _1770;
                    }
                    float _2654 = _2624;
                    float _2656 = _2654;
                    if (_2588)
                    {
                        _2642 = _1780;
                    }
                    float _2658 = _2642;
                    float _2660 = _2658;
                    if (_2606)
                    {
                        _2660 = _1816;
                    }
                    float _2662 = _2660;
                    bool _2664 = _2436 == 128;
                    float _2666 = _2662;
                    if (_2606)
                    {
                        _2638 = _1798;
                    }
                    float _2668 = _2638;
                    float _2670 = _2668;
                    if (_2606)
                    {
                        _2656 = _1806;
                    }
                    float _2672 = _2656;
                    float _2674 = _2672;
                    if (_2628)
                    {
                        _2674 = _1840;
                    }
                    float _2676 = _2674;
                    float _2678 = _2676;
                    if (_2606)
                    {
                        _2652 = _1824;
                    }
                    float _2680 = _2652;
                    float _2682 = _2680;
                    if (_2628)
                    {
                        _2670 = _1832;
                    }
                    float _2684 = _2670;
                    float _2686 = _2684;
                    if (_2650)
                    {
                        _2686 = _1868;
                    }
                    float _2688 = _2686;
                    float _2690 = _2688;
                    if (_2628)
                    {
                        _2666 = _1850;
                    }
                    float _2692 = _2666;
                    float _2694 = _2692;
                    if (_2628)
                    {
                        _2682 = _1858;
                    }
                    float _2696 = _2682;
                    float _2698 = _2696;
                    if (_2650)
                    {
                        _2698 = _1894;
                    }
                    float _2700 = _2698;
                    bool _2702 = _2436 == 144;
                    float _2704 = _2700;
                    if (_2650)
                    {
                        _2678 = _1876;
                    }
                    float _2706 = _2678;
                    float _2708 = _2706;
                    if (_2650)
                    {
                        _2694 = _1886;
                    }
                    float _2710 = _2694;
                    bool _2712 = _2436 == 160;
                    float _2714 = _2710;
                    if (_2664)
                    {
                        _2690 = _1904;
                    }
                    float _2716 = _2690;
                    float _2718 = _2716;
                    if (_2664)
                    {
                        _2708 = _1912;
                    }
                    float _2720 = _2708;
                    float _2722 = _2720;
                    if (_2664)
                    {
                        _2714 = _1922;
                    }
                    float _2724 = _2714;
                    float _2726 = _2724;
                    if (_2702)
                    {
                        _2718 = _1938;
                    }
                    float _2728 = _2718;
                    float _2730 = _2728;
                    if (_2664)
                    {
                        _2704 = _1930;
                    }
                    float _2732 = _2704;
                    float _2734 = _2732;
                    if (_2702)
                    {
                        _2726 = _1956;
                    }
                    float _2736 = _2726;
                    bool _2738 = _2170 == 160;
                    bool _2740 = _2436 == 176;
                    float _2742 = _2736;
                    if (_2712)
                    {
                        _2742 = _1992;
                    }
                    float _2744 = _2742;
                    bool _2746 = _2170 == 176;
                    float _2748 = _2744;
                    if (_2702)
                    {
                        _2722 = _1946;
                    }
                    float _2750 = _2722;
                    float _2752 = _2750;
                    if (_2712)
                    {
                        _2752 = _1982;
                    }
                    float _2754 = _2752;
                    float _2756 = _2754;
                    if (_2712)
                    {
                        _2730 = _1974;
                    }
                    float _2758 = _2730;
                    float _2760 = _2758;
                    if (_2544)
                    {
                        _2374 = _2036;
                    }
                    float _2762 = _2374;
                    _2054 = _2762;
                    if (_2738)
                    {
                        _2560 = _1982;
                    }
                    float _2764 = _2560;
                    float _2766 = _2764;
                    if (_2740)
                    {
                        _2756 = _2018;
                    }
                    float _2768 = _2756;
                    if (_2746)
                    {
                        _2766 = _2018;
                    }
                    float _2770 = _2766;
                    if (_2738)
                    {
                        _2556 = _1974;
                    }
                    float _2772 = _2556;
                    float _2774 = _2772;
                    if (_2746)
                    {
                        _2774 = _2010;
                    }
                    float _2776 = _2774;
                    float _2778 = _1546 * _2770;
                    _2044 = _2778;
                    if (_2740)
                    {
                        _2760 = _2010;
                    }
                    float _2780 = _2760;
                    float _2782 = _1546 * _2768;
                    bool _2784 = _2160 >= as_type<int>((*spvDescriptorSet0.vp_c7)._m0[3].x);
                    float _2786 = fma(_1544, _2776, _2778);
                    if (_2738)
                    {
                        _2546 = _1992;
                    }
                    float _2788 = _2546;
                    float _2790 = fma(_1544, _2780, _2782);
                    _2040 = _2790;
                    float _2792 = _2788;
                    if (_2746)
                    {
                        _2792 = _2028;
                    }
                    float _2794 = _2792;
                    float _2796 = fma(_1548, _2616, _2608);
                    _2050 = _2794;
                    if (_2740)
                    {
                        _2748 = _2028;
                    }
                    float _2798 = _2748;
                    _2052 = _2798;
                    if (_2702)
                    {
                        _2734 = _1964;
                    }
                    float _2800 = _2734;
                    float _2802 = _2800;
                    if (_2712)
                    {
                        _2802 = _2000;
                    }
                    float _2804 = _2802;
                    float _2806 = _2804;
                    if (_2738)
                    {
                        _2566 = _2000;
                    }
                    float _2808 = _2566;
                    float _2810 = _2808;
                    if (_2746)
                    {
                        _2810 = _2036;
                    }
                    float _2812 = _2810;
                    _2056 = _2812;
                    if (_2740)
                    {
                        _2806 = _2036;
                    }
                    float _2814 = _2806;
                    float _2816 = fma(_1548, _2794, _2786);
                    float _2818 = fma(_1548, _2798, _2790);
                    float _2820 = _2796 + _2762;
                    float _2822 = _2816 + _2812;
                    float _2824 = _2818 + _2814;
                    _2826 = fma(_2820, _2156, _2128);
                    _2828 = fma(_2822, _2156, _2132);
                    _2830 = fma(_2824, _2156, _2136);
                    _2060 = !_2784;
                    _1686 = _2826;
                    _1688 = _2828;
                    _1704 = _2830;
                    _2046 = _2822;
                    _2058 = _2814;
                } while (_2060);
                _1698 = _2826;
                _1712 = _2830;
                _1706 = _2828;
            }
            float _2832 = _1698;
            float _2834 = _1712;
            float _2836 = _1706;
            _182 = _2836;
            if (!_1568)
            {
                _1690 = _2832;
            }
            float _2838 = _1690;
            float _2840 = _2838;
            if (!_1568)
            {
                _1692 = _2834;
            }
            float _2842 = _1692;
            _186 = _2842;
            if (_1568)
            {
                _2840 = _2832;
            }
            float _2844 = _2840;
            _184 = _2844;
            if (_1568)
            {
                _186 = _2834;
            }
        }
    }
    _188 = false;
    float _2846 = _182;
    float _2848 = _184;
    float _2850 = _186;
    bool _2852 = 0 != as_type<int>((*spvDescriptorSet0.vp_c12)._m0[4].y);
    float _2854 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _2856 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _2860 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[0].x, _2854);
    float _2862 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[1].x, _2856);
    float _2864 = fma(_2848, (*spvDescriptorSet0.vp_c4)._m0[2].x, _2858);
    float _2866 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[0].z, _2860);
    float _2868 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[1].z, _2862);
    float _2870 = fma(_2850, (*spvDescriptorSet0.vp_c4)._m0[2].z, _2864);
    float _2872 = _2866 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _2874 = _2868 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _2876 = _2870 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _2878 = _2854;
    float _2880 = _2848;
    int _3012;
    int _3014;
    int _3016;
    int _3018;
    if (!_2852)
    {
        float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
        float _2884 = _2850 + _2882;
        float _2886 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
        float _2888 = _2848 + _2886;
        float _2890 = _2884 * _2884;
        float _2892 = fma(_2888, _2888, _2890);
        float _2894 = sqrt(_2892);
        bool _2896 = _2894 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _2898 = _2890;
        if (!_2896)
        {
            _2878 = _2876;
        }
        float _2900 = _2878;
        float _2902 = _2900;
        if (!_2896)
        {
            _2880 = _2874;
        }
        float _2904 = _2880;
        float _2906 = _2904;
        if (!_2896)
        {
            _2898 = _2872;
        }
        float _2908 = _2898;
        bool _2910 = !_2896;
        float _2912 = _2908;
        if (!_2910)
        {
            float _2914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
            float _2918 = _2894 + _2916;
            float _2920 = _2846 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2922 = rsqrt(_2892);
            float _2924 = _2918 * _2914;
            float _2926 = _2924 * 0.15915493667125701904296875;
            float _2928 = _2926 * 6.283185482025146484375;
            float _2930 = cos(_2928);
            float _2932 = _2926 * 6.283185482025146484375;
            float _2934 = sin(_2932);
            float _2936 = _2930 + (-1.0);
            float _2938 = fma(_2934, _2920, (*spvDescriptorSet0.vp_c9)._m0[42].y);
            float _2940 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
            float _2942 = _2922 * _2938;
            float _2944 = fma(_2930, _2846, _2940);
            float _2946 = fma(_2888, _2942, (*spvDescriptorSet0.vp_c9)._m0[26].x);
            float _2948 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
            float _2950 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
            float _2952 = _2944 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
            float _2954 = fma(_2884, _2942, (*spvDescriptorSet0.vp_c9)._m0[26].z);
            float _2956 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[0].x, _2948);
            float _2958 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[1].x, _2950);
            float _2960 = fma(_2946, (*spvDescriptorSet0.vp_c4)._m0[2].x, _2952);
            float _2962 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[0].z, _2956);
            float _2964 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[1].z, _2958);
            float _2966 = fma(_2954, (*spvDescriptorSet0.vp_c4)._m0[2].z, _2960);
            float _2968 = _2962 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
            float _2970 = _2964 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
            float _2972 = _2966 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
            _2906 = _2970;
            _2912 = _2968;
            _2902 = _2972;
        }
        float _2974 = _2906;
        float _2976 = _2912;
        float _2978 = _2902;
        float _2980 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _2982 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _2984 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _2986 = _2974 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _2988 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[7].x, _2980);
        float _2990 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[8].x, _2982);
        float _2992 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[9].x, _2984);
        float _2994 = fma(_2976, (*spvDescriptorSet0.vp_c4)._m0[10].x, _2986);
        float _2996 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[7].z, _2988);
        float _2998 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[8].z, _2990);
        float _3000 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[9].z, _2992);
        float _3002 = fma(_2978, (*spvDescriptorSet0.vp_c4)._m0[10].z, _2994);
        float _3004 = _2996 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _3006 = _2998 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _3008 = _3000 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _3010 = _3002 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _3012 = as_type<int>(_3004);
        _3014 = as_type<int>(_3006);
        _3016 = as_type<int>(_3008);
        _3018 = as_type<int>(_3010);
        _3020 = true;
    }
    else
    {
        float _3022 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
        float _3024 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
        float _3026 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
        float _3028 = _2874 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
        float _3030 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[7].x, _3022);
        float _3032 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[8].x, _3024);
        float _3034 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[9].x, _3026);
        float _3036 = fma(_2872, (*spvDescriptorSet0.vp_c4)._m0[10].x, _3028);
        float _3038 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[7].z, _3030);
        float _3040 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[8].z, _3032);
        float _3042 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[9].z, _3034);
        float _3044 = fma(_2876, (*spvDescriptorSet0.vp_c4)._m0[10].z, _3036);
        float _3046 = _3038 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
        float _3048 = _3040 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
        float _3050 = _3042 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
        float _3052 = _3044 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
        _3012 = as_type<int>(_3046);
        _3014 = as_type<int>(_3048);
        _3016 = as_type<int>(_3050);
        _3018 = as_type<int>(_3052);
    }
    _3020 = false;
    int _3054 = _3012;
    int _3056 = _3014;
    int _3058 = _3016;
    int _3060 = _3018;
    float _7743 = as_type<float>(_3054);
    out.gl_Position.x = _7743;
    float _7746 = as_type<float>(_3056);
    out.gl_Position.y = _7746;
    float _7749 = as_type<float>(_3058);
    out.gl_Position.z = _7749;
    float _7752 = as_type<float>(_3060);
    out.gl_Position.w = _7752;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

