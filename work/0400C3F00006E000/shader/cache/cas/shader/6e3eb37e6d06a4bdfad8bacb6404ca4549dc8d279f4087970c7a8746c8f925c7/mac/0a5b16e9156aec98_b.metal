#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    device _21* cp_s0 [[id(0)]];
    device _21* cp_s1 [[id(1)]];
    device _21* cp_s2 [[id(2)]];
    device _21* cp_s3 [[id(3)]];
    device _21* cp_s4 [[id(4)]];
    device _21* cp_s5 [[id(5)]];
    device _21* cp_s6 [[id(6)]];
    device _21* cp_s7 [[id(7)]];
    device _21* cp_s8 [[id(8)]];
    device _21* cp_s9 [[id(9)]];
    device _21* cp_s10 [[id(10)]];
    device _21* cp_s11 [[id(11)]];
    texture2d<float> cp_t_tcb_2A [[id(12)]];
    sampler cp_t_tcb_2ASmplr [[id(13)]];
    texture2d<float> cp_t_tcb_2C [[id(14)]];
    sampler cp_t_tcb_2CSmplr [[id(15)]];
    sampler cp_t_tcb_2ASmplr_w [[id(16)]];
    sampler cp_t_tcb_2CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2680 = false;
    bool _2516 = false;
    bool _1752 = false;
    bool _798 = false;
    float _66 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    float _70 = as_type<float>(gl_WorkGroupID.x);
    int _73 = as_type<int>(_70) << 5;
    int _75 = _73 + as_type<int>(_68);
    float _77 = trunc(_66);
    int _79 = int(_77);
    bool _83 = _75 >= _79;
    int _85 = 0;
    float _87 = as_type<float>(_79);
    if (_83)
    {
        _85 = 0;
    }
    int _89 = _85;
    int _91 = _89;
    int _93 = _89;
    float _95 = 0.0;
    if (!_83)
    {
        int _97 = _75 << 4;
        int _99 = _97 + 12;
        uint _102 = uint(int(uint(_99) >> uint(2)));
        float _104 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_102)]);
        float _106 = trunc(_104);
        int _108 = int(_106);
        bool _110 = _108 >= 1;
        int _112 = _110 ? (-1) : 0;
        _87 = as_type<float>(_99);
        _95 = as_type<float>(_108);
        if (!_110)
        {
            _91 = 0;
        }
        int _114 = _91;
        bool _116 = !_110;
        _93 = _114;
        if (!_116)
        {
            float _118 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _120 = uint(int(uint(_99) >> uint(2)));
            float _122 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_120)]);
            float _124 = float(_108);
            float _126 = -_122;
            float _128 = _118 + _126;
            bool _130 = _128 > _124;
            int _132 = as_type<int>(_118);
            _87 = _122;
            _95 = _124;
            if (!_130)
            {
                bool _134 = _118 >= _122;
                bool _136 = isnan(_118);
                bool _138 = _134 || _136;
                bool _140 = isnan(_122);
                bool _142 = _138 || _140;
                _112 = _142 ? (-1) : 0;
            }
            int _144 = _112;
            if (_130)
            {
                _132 = 0;
            }
            int _146 = _132;
            _93 = _146;
            if (!_130)
            {
                int _148 = ~_144;
                int _150 = (_148 != 0) ? 0 : 1;
                _93 = _150;
            }
        }
    }
    int _152 = _93;
    float _154 = _87;
    float _156 = _95;
    int _158 = _152 & 1;
    bool _160 = _158 != 0;
    if (!_160)
    {
        return;
    }
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _164 = _75 << 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_166)]);
    int _170 = _164 + 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_172)]);
    int _176 = _164 + 8;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_178)]);
    int _182 = as_type<int>(_162) & 512;
    bool _184 = _182 != 0;
    int _186 = _164 + 12;
    uint _188 = uint(int(uint(_164) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    int _192 = _164 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    int _198 = _164 + 8;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    uint _204 = uint(int(uint(_164) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_204)]);
    int _208 = _164 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_210)]);
    int _214 = _164 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_216)]);
    float _220 = 0.0;
    float _222 = 0.0;
    float _224 = 0.0;
    bool _226 = _184;
    float _228 = _162;
    if (_184)
    {
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _220 = _230;
        _222 = _232;
        _224 = _234;
    }
    float _236 = _220;
    float _238 = _222;
    float _240 = _224;
    float _242 = 0.0;
    float _244 = 0.0;
    float _246 = 0.0;
    if (_184)
    {
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _242 = _248;
        _244 = _250;
        _246 = _252;
    }
    float _254 = _242;
    float _256 = _244;
    float _258 = _246;
    float _260 = as_type<float>(_152);
    float _262 = _154;
    float _264 = _156;
    if (_184)
    {
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _260 = _266;
        _262 = _268;
        _264 = _270;
    }
    float _272 = _260;
    float _274 = _262;
    float _276 = _264;
    uint _278 = uint(int(uint(_164) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_278)]);
    uint _282 = uint(int(uint(_186) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_282)]);
    uint _286 = uint(int(uint(_186) >> uint(2)));
    float _288 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_286)]);
    float _290 = _236;
    float _292 = _254;
    float _294 = _238;
    float _296 = _256;
    float _298 = _240;
    float _300 = _258;
    float _302 = _272;
    float _304 = _274;
    float _306 = _276;
    float _308 = _202;
    float _310 = _190;
    int _312 = as_type<int>(_206);
    int _314 = as_type<int>(_212);
    int _316 = as_type<int>(_218);
    int _318 = as_type<int>(_206);
    int _320 = as_type<int>(_212);
    int _322 = as_type<int>(_218);
    int _324 = as_type<int>(_206);
    int _326 = as_type<int>(_212);
    int _328 = as_type<int>(_218);
    if (!_184)
    {
        int _330 = _164 + 4;
        uint _332 = uint(int(uint(_164) >> uint(2)));
        float _334 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_332)]);
        int _336 = _164 + 8;
        uint _338 = uint(int(uint(_164) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_338)]);
        uint _342 = uint(int(uint(_330) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_342)]);
        uint _346 = uint(int(uint(_330) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_336) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_164) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_354)]);
        uint _358 = uint(int(uint(_336) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_330) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        uint _366 = uint(int(uint(_336) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        float _370 = _334 * _334;
        float _372 = fma(_340, _340, _370);
        float _374 = _344 * _344;
        float _376 = fma(_348, _348, _374);
        float _378 = _352 * _352;
        float _380 = fma(_356, _356, _372);
        float _382 = fma(_360, _360, _378);
        float _384 = sqrt(_380);
        float _386 = fma(_364, _364, _376);
        float _388 = fma(_368, _368, _382);
        float _390 = sqrt(_386);
        float _392 = sqrt(_388);
        bool _394 = _384 > 0.0;
        bool _396 = _390 > 0.0;
        bool _398 = _392 > 0.0;
        float _400 = _390;
        float _402 = _392;
        float _404 = _382;
        float _406 = _334;
        float _408 = _384;
        float _410 = _340;
        float _412 = _376;
        float _414 = _344;
        float _416 = _364;
        float _418 = _356;
        if (_394)
        {
            float _420 = rsqrt(_380);
            _400 = _420;
        }
        float _422 = _400;
        float _424 = 0.0;
        if (_396)
        {
            float _426 = rsqrt(_386);
            _424 = _426;
        }
        float _428 = _424;
        float _430 = 0.0;
        if (_398)
        {
            float _432 = rsqrt(_388);
            _430 = _432;
        }
        float _434 = _430;
        if (!_394)
        {
            _402 = 0.0;
        }
        float _436 = _402;
        float _438 = _436;
        if (_394)
        {
            float _440 = _334 * _422;
            _438 = _440;
        }
        float _442 = _438;
        _292 = _442;
        if (!_394)
        {
            _404 = 0.0;
        }
        float _444 = _404;
        float _446 = _444;
        if (_394)
        {
            float _448 = _340 * _422;
            _446 = _448;
        }
        float _450 = _446;
        _290 = _450;
        if (!_394)
        {
            _406 = 0.0;
        }
        float _452 = _406;
        float _454 = _452;
        if (_394)
        {
            float _456 = _356 * _422;
            _454 = _456;
        }
        float _458 = _454;
        _302 = _458;
        if (!_396)
        {
            _408 = 0.0;
        }
        float _460 = _408;
        float _462 = _460;
        if (_396)
        {
            float _464 = _344 * _428;
            _462 = _464;
        }
        float _466 = _462;
        _296 = _466;
        if (!_396)
        {
            _410 = 0.0;
        }
        float _468 = _410;
        float _470 = _468;
        if (_396)
        {
            float _472 = _364 * _428;
            _470 = _472;
        }
        float _474 = _470;
        _304 = _474;
        if (!_396)
        {
            _412 = 0.0;
        }
        float _476 = _412;
        float _478 = _476;
        if (_396)
        {
            float _480 = _348 * _428;
            _478 = _480;
        }
        float _482 = _478;
        _294 = _482;
        if (!_398)
        {
            _414 = 0.0;
        }
        float _484 = _414;
        float _486 = _484;
        if (!_398)
        {
            _416 = 0.0;
        }
        float _488 = _416;
        float _490 = _488;
        if (_398)
        {
            float _492 = _352 * _434;
            _486 = _492;
        }
        float _494 = _486;
        _300 = _494;
        if (!_398)
        {
            _418 = 0.0;
        }
        float _496 = _418;
        _306 = _496;
        if (_398)
        {
            float _498 = _360 * _434;
            _490 = _498;
        }
        float _500 = _490;
        _298 = _500;
        if (_398)
        {
            float _502 = _368 * _434;
            _306 = _502;
        }
    }
    float _504 = _290;
    float _506 = _292;
    float _508 = _294;
    float _510 = _296;
    float _512 = _298;
    float _514 = _300;
    float _516 = _302;
    float _518 = _304;
    float _520 = _306;
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _550 = uint(int(uint(_186) >> uint(2)));
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_550)]);
    bool _554 = _524 > 0.0;
    float _556 = abs(_522);
    float _558 = log2(_556);
    bool _560 = _526 > 0.0;
    float _562 = 0.0;
    float _564 = _532;
    float _566 = _530;
    float _568 = _536;
    float _570 = _538;
    float _572 = _540;
    float _574 = _542;
    float _576 = _544;
    float _578 = _548;
    if (_554)
    {
        float _580 = 1.0 / _524;
        _562 = _580;
    }
    float _582 = _562;
    float _584 = -_288;
    float _586 = _528 + _584;
    float _588 = _530 * _558;
    float _590 = _532 * _526;
    float _592 = exp2(_588);
    float _594 = _586;
    float _596 = _590;
    if (_560)
    {
        float _598 = -_590;
        float _600 = fma(_280, _598, _532);
        _564 = _600;
    }
    float _602 = _564;
    float _604 = _582;
    float _606 = _602;
    if (_554)
    {
        float _608 = _586 * _582;
        _594 = _608;
    }
    float _610 = _594;
    float _612 = _530 * _534;
    if (_554)
    {
        float _614 = precise::min(_610, 1.0);
        _604 = _614;
    }
    float _616 = _604;
    float _618 = _536 * _612;
    float _620 = _538 * _612;
    float _622 = _616;
    if (_554)
    {
        float _624 = _616 * _602;
        _606 = _624;
    }
    float _626 = _606;
    float _628 = _540 * _612;
    float _630 = _284 * _530;
    float _632 = _530 * _626;
    float _634 = fma(_190, _592, _618);
    float _636 = fma(_190, _630, _168);
    float _638 = fma(_196, _592, _620);
    float _640 = fma(_196, _630, _174);
    float _642 = fma(_202, _592, _628);
    float _644 = fma(_202, _630, _180);
    float _646 = _544 * _632;
    float _648 = _546 * _632;
    float _650 = _548 * _632;
    bool _652 = !_184;
    float _654 = _646;
    float _656 = _632;
    float _658 = _648;
    float _660 = _638;
    float _662 = _648;
    float _664 = _640;
    float _666 = _634;
    float _668 = _642;
    float _790;
    float _792;
    float _794;
    float _796;
    if (!_652)
    {
        float _670 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _672 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _674 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _688 = _674 * _676;
        float _690 = _674 * _678;
        float _692 = _672 * _676;
        float _694 = -_688;
        float _696 = fma(_670, _680, _694);
        float _698 = -_690;
        float _700 = fma(_672, _680, _698);
        float _702 = -_692;
        float _704 = fma(_670, _678, _702);
        float _706 = _684 * _670;
        float _708 = _684 * _696;
        float _710 = _686 * _672;
        float _712 = _682 * _678;
        float _714 = -_706;
        float _716 = fma(_682, _672, _714);
        float _718 = -_708;
        float _720 = fma(_682, _700, _718);
        float _722 = _686 * _676;
        float _724 = _684 * _680;
        float _726 = _682 * _674;
        float _728 = fma(_686, _704, _720);
        float _730 = -_722;
        float _732 = fma(_682, _680, _730);
        float _734 = -_724;
        float _736 = fma(_686, _678, _734);
        float _738 = -_712;
        float _740 = fma(_684, _676, _738);
        float _742 = -_726;
        float _744 = fma(_686, _670, _742);
        float _746 = -_670;
        float _748 = fma(_746, _680, _688);
        float _750 = 1.0 / _728;
        float _752 = -_710;
        float _754 = fma(_684, _674, _752);
        float _756 = _732 * _750;
        float _758 = _736 * _750;
        float _760 = _740 * _750;
        float _762 = _748 * _750;
        float _764 = _648 * _756;
        float _766 = _648 * _758;
        float _768 = _648 * _760;
        float _770 = _646 * _750;
        float _772 = _744 * _750;
        float _774 = fma(_646, _762, _764);
        float _776 = _754 * _750;
        float _778 = _716 * _750;
        float _780 = fma(_700, _770, _766);
        float _782 = fma(_704, _770, _768);
        float _784 = fma(_650, _772, _774);
        float _786 = fma(_650, _776, _780);
        float _788 = fma(_650, _778, _782);
        _790 = _784;
        _654 = _786;
        _792 = _788;
        _656 = _780;
        _566 = _754;
        _228 = _704;
        _596 = _782;
        _794 = _756;
        _568 = _682;
        _570 = _684;
        _572 = _686;
        _574 = _750;
        _576 = _764;
        _578 = _770;
        _622 = _716;
        _796 = _772;
        _798 = true;
    }
    else
    {
        int _800 = as_type<int>(_162) & 1024;
        bool _802 = _800 != 0;
        if (_802)
        {
            _226 = true;
        }
        bool _804 = _226;
        bool _806 = _804;
        if (!_802)
        {
            int _808 = as_type<int>(_162) & 2048;
            bool _810 = _808 != 0;
            _806 = _810;
        }
        bool _812 = _806;
        if (!_812)
        {
            _308 = _648;
        }
        float _814 = _308;
        _790 = _814;
        if (!_812)
        {
            _310 = _650;
        }
        float _816 = _310;
        bool _818 = !_812;
        _792 = _816;
        _794 = 0.0;
        _796 = 0.0;
        if (!_818)
        {
            uint _820 = uint(int(uint(_164) >> uint(2)));
            float _822 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_820)]);
            int _824 = _164 + 4;
            uint _826 = uint(int(uint(_824) >> uint(2)));
            float _828 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_826)]);
            int _830 = _164 + 8;
            uint _832 = uint(int(uint(_830) >> uint(2)));
            float _834 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_832)]);
            uint _836 = uint(int(uint(_164) >> uint(2)));
            float _838 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_836)]);
            int _840 = _164 + 4;
            uint _842 = uint(int(uint(_840) >> uint(2)));
            float _844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_842)]);
            int _846 = _164 + 8;
            uint _848 = uint(int(uint(_846) >> uint(2)));
            float _850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_848)]);
            uint _852 = uint(int(uint(_164) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_852)]);
            int _856 = _164 + 4;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_858)]);
            int _862 = _164 + 8;
            uint _864 = uint(int(uint(_862) >> uint(2)));
            float _866 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_864)]);
            float _868 = _834 * _838;
            float _870 = _834 * _844;
            float _872 = _828 * _838;
            float _874 = -_868;
            float _876 = fma(_822, _850, _874);
            float _878 = -_870;
            float _880 = fma(_828, _850, _878);
            float _882 = -_872;
            float _884 = fma(_822, _844, _882);
            float _886 = _860 * _822;
            float _888 = _860 * _876;
            float _890 = _866 * _828;
            float _892 = _854 * _844;
            float _894 = -_886;
            float _896 = fma(_854, _828, _894);
            float _898 = -_888;
            float _900 = fma(_854, _880, _898);
            float _902 = _866 * _838;
            float _904 = _860 * _850;
            float _906 = _854 * _834;
            float _908 = fma(_866, _884, _900);
            float _910 = -_902;
            float _912 = fma(_854, _850, _910);
            float _914 = -_904;
            float _916 = fma(_866, _844, _914);
            float _918 = -_892;
            float _920 = fma(_860, _838, _918);
            float _922 = -_906;
            float _924 = fma(_866, _822, _922);
            float _926 = -_822;
            float _928 = fma(_926, _850, _868);
            float _930 = 1.0 / _908;
            float _932 = -_890;
            float _934 = fma(_860, _834, _932);
            float _936 = _912 * _930;
            float _938 = _916 * _930;
            float _940 = _920 * _930;
            float _942 = _928 * _930;
            float _944 = _648 * _936;
            float _946 = _648 * _938;
            float _948 = _648 * _940;
            float _950 = _646 * _930;
            float _952 = _924 * _930;
            float _954 = fma(_646, _942, _944);
            float _956 = _934 * _930;
            float _958 = _896 * _930;
            float _960 = fma(_880, _950, _946);
            float _962 = fma(_884, _950, _948);
            float _964 = fma(_650, _952, _954);
            float _966 = fma(_650, _956, _960);
            float _968 = fma(_650, _958, _962);
            _790 = _964;
            _654 = _966;
            _792 = _968;
            _656 = _960;
            _566 = _934;
            _228 = _884;
            _596 = _962;
            _794 = _936;
            _568 = _854;
            _570 = _860;
            _572 = _866;
            _574 = _930;
            _576 = _944;
            _578 = _950;
            _622 = _896;
            _796 = _952;
        }
    }
    _798 = false;
    float _970 = _790;
    float _972 = _654;
    float _974 = _792;
    float _976 = _656;
    float _978 = _566;
    float _980 = _228;
    float _982 = _596;
    float _984 = _794;
    float _986 = _568;
    float _988 = _570;
    float _990 = _572;
    float _992 = _574;
    float _994 = _576;
    float _996 = _578;
    float _998 = _622;
    float _1000 = _796;
    uint _1002 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1002)] = as_type<uint>(_552);
    float _1004 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    bool _1006 = _638 >= 0.0;
    bool _1008 = isnan(_638);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    float _1016 = _640 + _970;
    float _1018 = _636 + _972;
    float _1020 = _644 + _974;
    int _1022 = as_type<int>(_1004) & 512;
    bool _1024 = _1022 != 0;
    int _1026 = as_type<int>(_1004) & 1024;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>(_1004) & 2048;
    bool _1032 = _1030 != 0;
    float _1034 = _994;
    float _1036 = _996;
    float _1038 = _986;
    float _1040 = _988;
    float _1042 = _990;
    float _1044 = _992;
    float _1046 = _978;
    float _1048 = _980;
    float _1050 = _982;
    float _1052 = _984;
    float _1054 = _998;
    float _1056 = _1000;
    float _1058 = 0.0;
    float _1060 = _1016;
    float _1062 = _974;
    float _1064 = _972;
    float _1066 = _996;
    float _1068 = _970;
    float _1070 = _994;
    float _1072 = _1004;
    if (!_1014)
    {
        float _1074 = _974;
        float _1076 = _1004;
        float _1078 = _970;
        float _1080 = _976;
        if (_1024)
        {
            float _1082 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1074 = _1082;
            _1076 = _1084;
            _1078 = _1086;
            _1080 = _1088;
        }
        float _1090 = _1074;
        float _1092 = _1076;
        float _1094 = _1078;
        float _1096 = _1080;
        float _1098 = _978;
        float _1100 = _980;
        float _1102 = _982;
        float _1104 = _984;
        if (_1024)
        {
            float _1106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1108 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1098 = _1106;
            _1100 = _1108;
            _1102 = _1110;
            _1104 = _1112;
        }
        float _1114 = _1098;
        float _1116 = _1100;
        float _1118 = _1102;
        float _1120 = _1104;
        float _1122 = _986;
        float _1124 = _988;
        float _1126 = _990;
        float _1128 = _992;
        if (_1024)
        {
            float _1130 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1132 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1122 = _1130;
            _1124 = _1132;
            _1126 = _1134;
            _1128 = _1136;
        }
        float _1138 = _1122;
        float _1140 = _1124;
        float _1142 = _1126;
        float _1144 = _1128;
        float _1146 = _1090;
        float _1148 = _1094;
        float _1150 = _1092;
        if (_1024)
        {
            float _1152 = _1016 * _1092;
            _1034 = _1152;
        }
        float _1154 = _1034;
        float _1156 = _1116;
        float _1158 = _1154;
        float _1160 = _1114;
        if (_1024)
        {
            float _1162 = _1016 * _1116;
            _1156 = _1162;
        }
        float _1164 = _1156;
        if (_1024)
        {
            float _1166 = fma(_1018, _1090, _1154);
            _1146 = _1166;
        }
        float _1168 = _1146;
        float _1170 = _1140;
        float _1172 = _1142;
        float _1174 = _1168;
        float _1176 = _1138;
        float _1178 = _1144;
        if (_1024)
        {
            float _1180 = _1016 * _1140;
            _1170 = _1180;
        }
        float _1182 = _1170;
        float _1184 = _1182;
        if (_1024)
        {
            float _1186 = fma(_1018, _1114, _1164);
            _1158 = _1186;
        }
        float _1188 = _1158;
        float _1190 = _1188;
        if (_1024)
        {
            float _1192 = fma(_1018, _1138, _1182);
            _1184 = _1192;
        }
        float _1194 = _1184;
        float _1196 = _1194;
        if (_1024)
        {
            float _1198 = fma(_1020, _1118, _1188);
            _1190 = _1198;
        }
        float _1200 = _1190;
        float _1202 = _1200;
        if (_1024)
        {
            float _1204 = fma(_1020, _1094, _1168);
            _1148 = _1204;
        }
        float _1206 = _1148;
        float _1208 = _1206;
        if (_1024)
        {
            float _1210 = fma(_1020, _1142, _1194);
            _1172 = _1210;
        }
        float _1212 = _1172;
        float _1214 = _1212;
        if (!_1024)
        {
            _1174 = 0.0;
            _1150 = 0.0;
        }
        float _1216 = _1174;
        float _1218 = _1150;
        float _1220 = _1216;
        float _1222 = _1218;
        if (!_1024)
        {
            _1160 = 0.0;
        }
        float _1224 = _1160;
        float _1226 = _1224;
        if (_1024)
        {
            float _1228 = _1120 + _1200;
            _1220 = _1228;
        }
        float _1230 = _1220;
        float _1232 = _1230;
        if (_1024)
        {
            float _1234 = _1096 + _1206;
            _1222 = _1234;
        }
        float _1236 = _1222;
        float _1238 = _1236;
        if (_1024)
        {
            float _1240 = _1144 + _1212;
            _1226 = _1240;
        }
        float _1242 = _1226;
        bool _1244 = !_1028;
        float _1246 = _1242;
        _1052 = 6.2500002968590706586837768554688e-05;
        if (!_1244)
        {
            float _1248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _1250 = uint(int(uint(_164) >> uint(2)));
            float _1252 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1250)]);
            int _1254 = _164 + 4;
            uint _1256 = uint(int(uint(_1254) >> uint(2)));
            float _1258 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1256)]);
            int _1260 = _164 + 8;
            uint _1262 = uint(int(uint(_1260) >> uint(2)));
            float _1264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1262)]);
            uint _1266 = uint(int(uint(_164) >> uint(2)));
            float _1268 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1266)]);
            int _1270 = _164 + 4;
            uint _1272 = uint(int(uint(_1270) >> uint(2)));
            float _1274 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1272)]);
            int _1276 = _164 + 8;
            uint _1278 = uint(int(uint(_1276) >> uint(2)));
            float _1280 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1278)]);
            uint _1282 = uint(int(uint(_164) >> uint(2)));
            float _1284 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1282)]);
            int _1286 = _164 + 4;
            uint _1288 = uint(int(uint(_1286) >> uint(2)));
            float _1290 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1288)]);
            int _1292 = _164 + 8;
            uint _1294 = uint(int(uint(_1292) >> uint(2)));
            float _1296 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1294)]);
            int _1298 = _164 + 12;
            uint _1300 = uint(int(uint(_1298) >> uint(2)));
            float _1302 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1300)]);
            float _1304 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _1306 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1308 = _1016 * _1258;
            float _1310 = _1016 * _1274;
            float _1312 = fma(_1018, _1252, _1308);
            float _1314 = _1016 * _1290;
            float _1316 = fma(_1018, _1268, _1310);
            float _1318 = fma(_1018, _1284, _1314);
            float _1320 = fma(_1020, _1264, _1312);
            float _1322 = fma(_1020, _1280, _1316);
            float _1324 = fma(_1020, _1296, _1318);
            float _1326 = _1248 + _1320;
            float _1328 = _1304 + _1322;
            float _1330 = _1306 + _1324;
            _1232 = _1330;
            _1238 = _1326;
            _1208 = _1264;
            _1176 = _1284;
            _1196 = _1318;
            _1214 = _1324;
            _1178 = _1302;
            _1246 = _1328;
            _1036 = _1280;
            _1202 = _1268;
        }
        float _1332 = _1232;
        float _1334 = _1238;
        float _1336 = _1208;
        float _1338 = _1176;
        float _1340 = _1196;
        float _1342 = _1214;
        float _1344 = _1178;
        float _1346 = _1246;
        float _1348 = _1036;
        float _1350 = _1202;
        bool _1352 = !_1032;
        float _1354 = _1334;
        float _1356 = _1332;
        float _1358 = _1346;
        float _1360 = 0.0;
        float _1362 = _1338;
        float _1364 = _1340;
        float _1366 = _1342;
        float _1368 = _1344;
        float _1370 = _1336;
        float _1372 = _1350;
        _1066 = _1348;
        if (!_1352)
        {
            uint _1374 = uint(int(uint(_164) >> uint(2)));
            float _1376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1374)]);
            int _1378 = _164 + 4;
            uint _1380 = uint(int(uint(_1378) >> uint(2)));
            float _1382 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1380)]);
            int _1384 = _164 + 8;
            uint _1386 = uint(int(uint(_1384) >> uint(2)));
            float _1388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1386)]);
            int _1390 = _164 + 12;
            uint _1392 = uint(int(uint(_1390) >> uint(2)));
            float _1394 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1392)]);
            uint _1396 = uint(int(uint(_164) >> uint(2)));
            float _1398 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1396)]);
            int _1400 = _164 + 4;
            uint _1402 = uint(int(uint(_1400) >> uint(2)));
            float _1404 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1402)]);
            int _1406 = _164 + 8;
            uint _1408 = uint(int(uint(_1406) >> uint(2)));
            float _1410 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1408)]);
            int _1412 = _164 + 12;
            uint _1414 = uint(int(uint(_1412) >> uint(2)));
            float _1416 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1414)]);
            uint _1418 = uint(int(uint(_164) >> uint(2)));
            float _1420 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1418)]);
            int _1422 = _164 + 4;
            uint _1424 = uint(int(uint(_1422) >> uint(2)));
            float _1426 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1424)]);
            int _1428 = _164 + 8;
            uint _1430 = uint(int(uint(_1428) >> uint(2)));
            float _1432 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1430)]);
            int _1434 = _164 + 12;
            uint _1436 = uint(int(uint(_1434) >> uint(2)));
            float _1438 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1436)]);
            float _1440 = _1016 * _1382;
            float _1442 = _1016 * _1404;
            float _1444 = fma(_1018, _1376, _1440);
            float _1446 = _1016 * _1426;
            float _1448 = fma(_1018, _1398, _1442);
            float _1450 = fma(_1018, _1420, _1446);
            float _1452 = fma(_1020, _1388, _1444);
            float _1454 = fma(_1020, _1410, _1448);
            float _1456 = fma(_1020, _1432, _1450);
            float _1458 = _1452 + _1394;
            float _1460 = _1454 + _1416;
            float _1462 = _1456 + _1438;
            _1354 = _1458;
            _1356 = _1462;
            _1358 = _1460;
            _1360 = _1438;
            _1362 = _1398;
            _1364 = _1448;
            _1366 = _1454;
            _1368 = _1416;
            _658 = _1456;
            _1370 = _1388;
            _1372 = _1440;
        }
        float _1464 = _1354;
        float _1466 = _1356;
        float _1468 = _1358;
        float _1470 = _1360;
        float _1472 = _1362;
        float _1474 = _1364;
        float _1476 = _1366;
        float _1478 = _1368;
        float _1480 = _658;
        float _1482 = _1370;
        float _1484 = _1372;
        float _1486 = fma(_1464, 6.2500002968590706586837768554688e-05, 0.5);
        float _1488 = fma(_1466, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _4908 = float2(_1486, _1488);
        float _1490 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4908, float2(0.0), isnan(_4908)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4908, float2(0.0), isnan(_4908)), level(0.0)).x;
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _1494 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _1496 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _1498 = _1490 * 2000.0;
        float _1500 = -_1492;
        float _1502 = _1500 + _1468;
        float _1504 = _1498 + (-0.300000011920928955078125);
        bool _1506 = _1502 > _1504;
        bool _1508 = _1502 < _1498;
        bool _1510 = _1508 && _1506;
        bool _1512 = !_1510;
        float _1514 = _1486;
        float _1516 = _1490;
        float _1518 = _1480;
        _1038 = _1472;
        _1040 = _1474;
        _1042 = _1476;
        _1044 = _1478;
        _1046 = _1502;
        _1048 = _1498;
        _1050 = _1486;
        _1054 = _1490;
        _1056 = _1488;
        _662 = _1480;
        _1058 = _1470;
        _1062 = _1466;
        _664 = _1496;
        _1064 = _1494;
        _1068 = _1482;
        _1070 = _1484;
        _1072 = _1464;
        if (!_1512)
        {
            float _1520 = fma(_1464, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1522 = fma(_1464, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _1524 = fma(_1466, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1526 = fma(_1466, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _4984 = float2(_1520, _1488);
            float _1528 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4984, float2(0.0), isnan(_4984)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4984, float2(0.0), isnan(_4984)), level(0.0)).x;
            float2 _4992 = float2(_1522, _1488);
            float _1530 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4992, float2(0.0), isnan(_4992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4992, float2(0.0), isnan(_4992)), level(0.0)).x;
            float2 _5000 = float2(_1486, _1524);
            float _1532 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5000, float2(0.0), isnan(_5000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5000, float2(0.0), isnan(_5000)), level(0.0)).x;
            float2 _5008 = float2(_1486, _1526);
            float _1534 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5008, float2(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5008, float2(0.0), isnan(_5008)), level(0.0)).x;
            float2 _5016 = float2(_1520, _1524);
            float _1536 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5016, float2(0.0), isnan(_5016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5016, float2(0.0), isnan(_5016)), level(0.0)).x;
            float2 _5024 = float2(_1520, _1526);
            float _1538 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5024, float2(0.0), isnan(_5024)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5024, float2(0.0), isnan(_5024)), level(0.0)).x;
            float2 _5032 = float2(_1522, _1524);
            float _1540 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5032, float2(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5032, float2(0.0), isnan(_5032)), level(0.0)).x;
            float2 _5040 = float2(_1522, _1526);
            float _1542 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5040, float2(0.0), isnan(_5040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5040, float2(0.0), isnan(_5040)), level(0.0)).x;
            float _1544 = -_1528;
            float _1546 = _1490 + _1544;
            float _1548 = -_1530;
            float _1550 = _1490 + _1548;
            float _1552 = -_1532;
            float _1554 = _1490 + _1552;
            float _1556 = -_1534;
            float _1558 = _1490 + _1556;
            float _1560 = -_1536;
            float _1562 = _1490 + _1560;
            float _1564 = -_1538;
            float _1566 = _1490 + _1564;
            float _1568 = -_1540;
            float _1570 = _1490 + _1568;
            float _1572 = -_1542;
            float _1574 = _1490 + _1572;
            float _1576 = abs(_1546);
            float _1578 = abs(_1550);
            float _1580 = precise::max(_1576, _1578);
            float _1582 = abs(_1554);
            float _1584 = abs(_1558);
            float _1586 = precise::max(_1582, _1584);
            float _1588 = abs(_1562);
            float _1590 = abs(_1566);
            float _1592 = precise::max(_1588, _1590);
            float _1594 = precise::max(_1580, _1586);
            float _1596 = abs(_1570);
            float _1598 = abs(_1574);
            float _1600 = precise::max(_1596, _1598);
            bool _1602 = _1594 > 0.00150000001303851604461669921875;
            float _1604 = precise::max(_1592, _1600);
            bool _1606 = _1604 <= 0.00150000001303851604461669921875;
            bool _1608 = isnan(_1604);
            bool _1610 = _1606 || _1608;
            bool _1612 = isnan(0.00150000001303851604461669921875);
            bool _1614 = _1610 || _1612;
            bool _1616 = !_1602;
            bool _1618 = _1614 && _1616;
            bool _1620 = !_1618;
            float _1622 = _1600;
            float _1624 = _1550;
            float _1626 = _1528;
            _1038 = _1570;
            _1040 = _1600;
            _1042 = _1580;
            _1044 = _1550;
            _1052 = _1528;
            _1058 = _1532;
            _1062 = _1554;
            _1066 = _1604;
            _1068 = _1520;
            _1070 = _1526;
            _1072 = _1522;
            if (!_1620)
            {
                float _1628 = -_1490;
                float _1630 = _1628 + _1528;
                float _1632 = -_1490;
                float _1634 = _1632 + _1532;
                float _1636 = _1630 * 2000.0;
                float _1638 = _1634 * 2000.0;
                bool _1640 = !_1024;
                _1056 = _1636;
                float _1746;
                float _1748;
                float _1750;
                if (!_1640)
                {
                    float _1642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _1644 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _1646 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _1648 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _1650 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _1652 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _1654 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _1656 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _1658 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _1660 = _1646 * _1648;
                    float _1662 = _1646 * _1650;
                    float _1664 = _1644 * _1648;
                    float _1666 = -_1660;
                    float _1668 = fma(_1642, _1652, _1666);
                    float _1670 = -_1662;
                    float _1672 = fma(_1644, _1652, _1670);
                    float _1674 = -_1664;
                    float _1676 = fma(_1642, _1650, _1674);
                    float _1678 = _1658 * _1644;
                    float _1680 = _1668 * _1656;
                    float _1682 = _1654 * _1646;
                    float _1684 = _1656 * _1642;
                    float _1686 = -_1678;
                    float _1688 = fma(_1656, _1646, _1686);
                    float _1690 = -_1680;
                    float _1692 = fma(_1672, _1654, _1690);
                    float _1694 = _1656 * _1652;
                    float _1696 = -_1682;
                    float _1698 = fma(_1658, _1642, _1696);
                    float _1700 = _1658 * _1648;
                    float _1702 = fma(_1676, _1658, _1692);
                    float _1704 = -_1694;
                    float _1706 = fma(_1658, _1650, _1704);
                    float _1708 = _1654 * _1650;
                    float _1710 = -_1642;
                    float _1712 = fma(_1710, _1652, _1660);
                    float _1714 = -_1700;
                    float _1716 = fma(_1654, _1652, _1714);
                    float _1718 = -_1684;
                    float _1720 = fma(_1654, _1644, _1718);
                    float _1722 = 1.0 / _1702;
                    float _1724 = -_1708;
                    float _1726 = fma(_1656, _1648, _1724);
                    float _1728 = fma(_1636, _1672, _1706);
                    float _1730 = fma(_1636, _1712, _1716);
                    float _1732 = fma(_1636, _1676, _1726);
                    float _1734 = fma(_1638, _1688, _1728);
                    float _1736 = fma(_1638, _1698, _1730);
                    float _1738 = fma(_1638, _1720, _1732);
                    float _1740 = _1722 * _1734;
                    float _1742 = _1722 * _1736;
                    float _1744 = _1722 * _1738;
                    _1746 = _1742;
                    _1748 = _1740;
                    _1750 = _1744;
                    _1622 = _1644;
                    _1624 = _1660;
                    _1514 = _1676;
                    _1626 = _1730;
                    _1516 = _1706;
                    _1518 = _1734;
                    _1752 = true;
                }
                else
                {
                    float _1754 = fma(_1636, _504, _506);
                    float _1756 = fma(_1636, _508, _510);
                    float _1758 = fma(_1636, _512, _514);
                    float _1760 = fma(_1638, _516, _1754);
                    float _1762 = fma(_1638, _518, _1756);
                    float _1764 = fma(_1638, _520, _1758);
                    _1746 = _1762;
                    _1748 = _1760;
                    _1750 = _1764;
                }
                _1752 = false;
                float _1766 = _1746;
                float _1768 = _1748;
                float _1770 = _1750;
                float _1772 = _1622;
                float _1774 = _1624;
                float _1776 = _1514;
                float _1778 = _1626;
                float _1780 = _1516;
                float _1782 = _1518;
                float _1784 = _1766 * _1766;
                float _1786 = -_1502;
                float _1788 = _1786 + _1498;
                float _1790 = fma(_1768, _1768, _1784);
                float _1792 = _1016 + _1788;
                float _1794 = fma(_1770, _1770, _1790);
                float _1796 = rsqrt(_1794);
                float _1798 = _1796 * _1766;
                float _1800 = _1796 * _1768;
                float _1802 = _1796 * _1770;
                float _1804 = _638 * _1798;
                float _1806 = fma(_634, _1800, _1804);
                float _1808 = fma(_642, _1802, _1806);
                float _1810 = _1800 * _1808;
                float _1812 = _1798 * _1808;
                float _1814 = _1802 * _1808;
                float _1816 = -_1810;
                float _1818 = _634 + _1816;
                float _1820 = -_1812;
                float _1822 = _638 + _1820;
                float _1824 = -_1814;
                float _1826 = _642 + _1824;
                float _1828 = _1494 * _1810;
                float _1830 = _1494 * _1812;
                float _1832 = _1494 * _1814;
                float _1834 = -_1828;
                float _1836 = fma(_1496, _1818, _1834);
                float _1838 = -_1830;
                float _1840 = fma(_1496, _1822, _1838);
                float _1842 = -_1832;
                float _1844 = fma(_1496, _1826, _1842);
                _660 = _1840;
                _1038 = _1822;
                _1040 = _1772;
                _1042 = _1826;
                _1044 = _1774;
                _1048 = _1788;
                _1050 = _1776;
                _1052 = _1778;
                _1054 = _1780;
                _662 = _1782;
                _1060 = _1792;
                _1062 = _1814;
                _1066 = _1818;
                _1068 = _1828;
                _1070 = _1812;
                _1072 = _1808;
                _666 = _1836;
                _668 = _1844;
            }
        }
    }
    float _1846 = _660;
    float _1848 = _1038;
    float _1850 = _1040;
    float _1852 = _1042;
    float _1854 = _1044;
    float _1856 = _1046;
    float _1858 = _1048;
    float _1860 = _1050;
    float _1862 = _1052;
    float _1864 = _1054;
    float _1866 = _1056;
    float _1868 = _662;
    float _1870 = _1058;
    float _1872 = _1060;
    float _1874 = _1062;
    float _1876 = _664;
    float _1878 = _1064;
    float _1880 = _1066;
    float _1882 = _1068;
    float _1884 = _1070;
    float _1886 = _1072;
    float _1888 = _666;
    float _1890 = _668;
    bool _1892 = _1846 >= 0.0;
    bool _1894 = isnan(_1846);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.0);
    bool _1900 = _1896 || _1898;
    float _1902 = _1874;
    float _1904 = _1876;
    float _1906 = _1878;
    float _1908 = _1882;
    float _1910 = _1880;
    float _1912 = _1884;
    float _1914 = _1886;
    float _1916 = _1872;
    float _1918 = _1888;
    float _1920 = _1846;
    float _1922 = _1890;
    if (!_1900)
    {
        float _1924 = _1848;
        float _1926 = _1850;
        float _1928 = _1852;
        float _1930 = _1854;
        if (_1024)
        {
            float _1932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1936 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1938 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1924 = _1932;
            _1926 = _1934;
            _1928 = _1936;
            _1930 = _1938;
        }
        float _1940 = _1924;
        float _1942 = _1926;
        float _1944 = _1928;
        float _1946 = _1930;
        float _1948 = _1856;
        float _1950 = _1858;
        float _1952 = _1860;
        float _1954 = _1862;
        if (_1024)
        {
            float _1956 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1958 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1960 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1962 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1948 = _1956;
            _1950 = _1958;
            _1952 = _1960;
            _1954 = _1962;
        }
        float _1964 = _1948;
        float _1966 = _1950;
        float _1968 = _1952;
        float _1970 = _1954;
        float _1972 = _1864;
        float _1974 = _1866;
        float _1976 = _1868;
        float _1978 = _1870;
        if (_1024)
        {
            float _1980 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1982 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1972 = _1980;
            _1974 = _1982;
            _1976 = _1984;
            _1978 = _1986;
        }
        float _1988 = _1972;
        float _1990 = _1974;
        float _1992 = _1976;
        float _1994 = _1978;
        if (_1024)
        {
            float _1996 = _1942 * _1872;
            _1902 = _1996;
        }
        float _1998 = _1902;
        float _2000 = _1998;
        float _2002 = _1964;
        if (_1024)
        {
            float _2004 = _1966 * _1872;
            _1904 = _2004;
        }
        float _2006 = _1904;
        float _2008 = _2006;
        if (_1024)
        {
            float _2010 = fma(_1018, _1940, _1998);
            _2000 = _2010;
        }
        float _2012 = _2000;
        float _2014 = _2012;
        if (_1024)
        {
            float _2016 = _1990 * _1872;
            _1906 = _2016;
        }
        float _2018 = _1906;
        if (_1024)
        {
            float _2020 = fma(_1018, _1964, _2006);
            _2008 = _2020;
        }
        float _2022 = _2008;
        if (_1024)
        {
            float _2024 = fma(_1020, _1944, _2012);
            _1908 = _2024;
        }
        float _2026 = _1908;
        if (!_1024)
        {
            _2002 = 0.0;
        }
        float _2028 = _2002;
        float _2030 = _2028;
        if (_1024)
        {
            float _2032 = fma(_1018, _1988, _2018);
            _1910 = _2032;
        }
        float _2034 = _1910;
        float _2036 = _2034;
        if (_1024)
        {
            float _2038 = fma(_1020, _1968, _2022);
            _1912 = _2038;
        }
        float _2040 = _1912;
        if (!_1024)
        {
            _1914 = 0.0;
            _2014 = 0.0;
        }
        float _2042 = _1914;
        float _2044 = _2014;
        float _2046 = _2042;
        float _2048 = _2044;
        if (_1024)
        {
            float _2050 = fma(_1020, _1992, _2034);
            _2036 = _2050;
        }
        float _2052 = _2036;
        if (_1024)
        {
            float _2054 = _1946 + _2026;
            _2046 = _2054;
        }
        float _2056 = _2046;
        float _2058 = _2056;
        if (_1024)
        {
            float _2060 = _1970 + _2040;
            _2030 = _2060;
        }
        float _2062 = _2030;
        float _2064 = _2062;
        if (_1024)
        {
            float _2066 = _1994 + _2052;
            _2048 = _2066;
        }
        float _2068 = _2048;
        bool _2070 = !_1028;
        float _2072 = _2068;
        if (!_2070)
        {
            float _2074 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2076 = uint(int(uint(_164) >> uint(2)));
            float _2078 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2076)]);
            int _2080 = _164 + 4;
            uint _2082 = uint(int(uint(_2080) >> uint(2)));
            float _2084 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2082)]);
            int _2086 = _164 + 8;
            uint _2088 = uint(int(uint(_2086) >> uint(2)));
            float _2090 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2088)]);
            uint _2092 = uint(int(uint(_164) >> uint(2)));
            float _2094 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2092)]);
            int _2096 = _164 + 4;
            uint _2098 = uint(int(uint(_2096) >> uint(2)));
            float _2100 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2098)]);
            int _2102 = _164 + 8;
            uint _2104 = uint(int(uint(_2102) >> uint(2)));
            float _2106 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2104)]);
            uint _2108 = uint(int(uint(_164) >> uint(2)));
            float _2110 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2108)]);
            int _2112 = _164 + 4;
            uint _2114 = uint(int(uint(_2112) >> uint(2)));
            float _2116 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2114)]);
            int _2118 = _164 + 8;
            uint _2120 = uint(int(uint(_2118) >> uint(2)));
            float _2122 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2120)]);
            float _2124 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2128 = _2084 * _1872;
            float _2130 = _2100 * _1872;
            float _2132 = fma(_1018, _2078, _2128);
            float _2134 = _2116 * _1872;
            float _2136 = fma(_1018, _2094, _2130);
            float _2138 = fma(_1018, _2110, _2134);
            float _2140 = fma(_1020, _2090, _2132);
            float _2142 = fma(_1020, _2106, _2136);
            float _2144 = fma(_1020, _2122, _2138);
            float _2146 = _2074 + _2140;
            float _2148 = _2124 + _2142;
            float _2150 = _2126 + _2144;
            _2072 = _2150;
            _2058 = _2146;
            _2064 = _2148;
        }
        float _2152 = _2072;
        float _2154 = _2058;
        float _2156 = _2064;
        bool _2158 = !_1032;
        float _2160 = _2154;
        float _2162 = _2152;
        float _2164 = _2156;
        if (!_2158)
        {
            uint _2166 = uint(int(uint(_164) >> uint(2)));
            float _2168 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2166)]);
            int _2170 = _164 + 4;
            uint _2172 = uint(int(uint(_2170) >> uint(2)));
            float _2174 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2172)]);
            int _2176 = _164 + 8;
            uint _2178 = uint(int(uint(_2176) >> uint(2)));
            float _2180 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2178)]);
            int _2182 = _164 + 12;
            uint _2184 = uint(int(uint(_2182) >> uint(2)));
            float _2186 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2184)]);
            uint _2188 = uint(int(uint(_164) >> uint(2)));
            float _2190 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2188)]);
            int _2192 = _164 + 4;
            uint _2194 = uint(int(uint(_2192) >> uint(2)));
            float _2196 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2194)]);
            int _2198 = _164 + 8;
            uint _2200 = uint(int(uint(_2198) >> uint(2)));
            float _2202 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2200)]);
            int _2204 = _164 + 12;
            uint _2206 = uint(int(uint(_2204) >> uint(2)));
            float _2208 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2206)]);
            uint _2210 = uint(int(uint(_164) >> uint(2)));
            float _2212 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2210)]);
            int _2214 = _164 + 4;
            uint _2216 = uint(int(uint(_2214) >> uint(2)));
            float _2218 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2216)]);
            int _2220 = _164 + 8;
            uint _2222 = uint(int(uint(_2220) >> uint(2)));
            float _2224 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2222)]);
            int _2226 = _164 + 12;
            uint _2228 = uint(int(uint(_2226) >> uint(2)));
            float _2230 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2228)]);
            float _2232 = _2174 * _1872;
            float _2234 = _2196 * _1872;
            float _2236 = fma(_1018, _2168, _2232);
            float _2238 = _2218 * _1872;
            float _2240 = fma(_1018, _2190, _2234);
            float _2242 = fma(_1018, _2212, _2238);
            float _2244 = fma(_1020, _2180, _2236);
            float _2246 = fma(_1020, _2202, _2240);
            float _2248 = fma(_1020, _2224, _2242);
            float _2250 = _2244 + _2186;
            float _2252 = _2246 + _2208;
            float _2254 = _2248 + _2230;
            _2160 = _2250;
            _2162 = _2254;
            _2164 = _2252;
        }
        float _2256 = _2160;
        float _2258 = _2162;
        float _2260 = _2164;
        float _2262 = fma(_2256, 6.2500002968590706586837768554688e-05, 0.5);
        float _2264 = fma(_2258, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _6077 = float2(_2262, _2264);
        float _2266 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6077, float2(0.0), isnan(_6077)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6077, float2(0.0), isnan(_6077)), level(0.0)).x;
        float _2268 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _2270 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _2272 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _2274 = _2266 * 2000.0;
        float _2276 = -_2268;
        float _2278 = _2276 + _2260;
        float _2280 = _2274 + (-0.300000011920928955078125);
        bool _2282 = _2278 > _2280;
        bool _2284 = _2278 < _2274;
        bool _2286 = _2284 && _2282;
        bool _2288 = !_2286;
        if (!_2288)
        {
            float _2290 = fma(_2256, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2292 = fma(_2256, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2294 = fma(_2258, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2296 = fma(_2258, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _6125 = float2(_2290, _2264);
            float _2298 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6125, float2(0.0), isnan(_6125)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6125, float2(0.0), isnan(_6125)), level(0.0)).x;
            float2 _6133 = float2(_2292, _2264);
            float _2300 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6133, float2(0.0), isnan(_6133)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6133, float2(0.0), isnan(_6133)), level(0.0)).x;
            float2 _6141 = float2(_2262, _2294);
            float _2302 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6141, float2(0.0), isnan(_6141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6141, float2(0.0), isnan(_6141)), level(0.0)).x;
            float2 _6149 = float2(_2262, _2296);
            float _2304 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6149, float2(0.0), isnan(_6149)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6149, float2(0.0), isnan(_6149)), level(0.0)).x;
            float2 _6157 = float2(_2290, _2294);
            float _2306 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
            float2 _6165 = float2(_2290, _2296);
            float _2308 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6165, float2(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6165, float2(0.0), isnan(_6165)), level(0.0)).x;
            float2 _6173 = float2(_2292, _2294);
            float _2310 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6173, float2(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6173, float2(0.0), isnan(_6173)), level(0.0)).x;
            float2 _6181 = float2(_2292, _2296);
            float _2312 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6181, float2(0.0), isnan(_6181)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6181, float2(0.0), isnan(_6181)), level(0.0)).x;
            float _2314 = -_2298;
            float _2316 = _2266 + _2314;
            float _2318 = -_2300;
            float _2320 = _2266 + _2318;
            float _2322 = -_2302;
            float _2324 = _2266 + _2322;
            float _2326 = -_2304;
            float _2328 = _2266 + _2326;
            float _2330 = -_2306;
            float _2332 = _2266 + _2330;
            float _2334 = -_2308;
            float _2336 = _2266 + _2334;
            float _2338 = -_2310;
            float _2340 = _2266 + _2338;
            float _2342 = -_2312;
            float _2344 = _2266 + _2342;
            float _2346 = abs(_2316);
            float _2348 = abs(_2320);
            float _2350 = precise::max(_2346, _2348);
            float _2352 = abs(_2324);
            float _2354 = abs(_2328);
            float _2356 = precise::max(_2352, _2354);
            float _2358 = abs(_2332);
            float _2360 = abs(_2336);
            float _2362 = precise::max(_2358, _2360);
            float _2364 = precise::max(_2350, _2356);
            float _2366 = abs(_2340);
            float _2368 = abs(_2344);
            float _2370 = precise::max(_2366, _2368);
            bool _2372 = _2364 > 0.00150000001303851604461669921875;
            float _2374 = precise::max(_2362, _2370);
            bool _2376 = _2374 <= 0.00150000001303851604461669921875;
            bool _2378 = isnan(_2374);
            bool _2380 = _2376 || _2378;
            bool _2382 = isnan(0.00150000001303851604461669921875);
            bool _2384 = _2380 || _2382;
            bool _2386 = !_2372;
            bool _2388 = _2384 && _2386;
            bool _2390 = !_2388;
            if (!_2390)
            {
                float _2392 = -_2266;
                float _2394 = _2392 + _2298;
                float _2396 = -_2266;
                float _2398 = _2396 + _2302;
                float _2400 = _2394 * 2000.0;
                float _2402 = _2398 * 2000.0;
                bool _2404 = !_1024;
                float _2510;
                float _2512;
                float _2514;
                if (!_2404)
                {
                    float _2406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2424 = _2410 * _2412;
                    float _2426 = _2410 * _2414;
                    float _2428 = _2408 * _2412;
                    float _2430 = -_2424;
                    float _2432 = fma(_2406, _2416, _2430);
                    float _2434 = -_2426;
                    float _2436 = fma(_2408, _2416, _2434);
                    float _2438 = _2422 * _2408;
                    float _2440 = _2420 * _2416;
                    float _2442 = _2432 * _2420;
                    float _2444 = -_2428;
                    float _2446 = fma(_2406, _2414, _2444);
                    float _2448 = _2418 * _2410;
                    float _2450 = -_2438;
                    float _2452 = fma(_2420, _2410, _2450);
                    float _2454 = -_2442;
                    float _2456 = fma(_2436, _2418, _2454);
                    float _2458 = _2422 * _2412;
                    float _2460 = -_2448;
                    float _2462 = fma(_2422, _2406, _2460);
                    float _2464 = -_2440;
                    float _2466 = fma(_2422, _2414, _2464);
                    float _2468 = fma(_2446, _2422, _2456);
                    float _2470 = _2418 * _2414;
                    float _2472 = _2420 * _2406;
                    float _2474 = -_2406;
                    float _2476 = fma(_2474, _2416, _2424);
                    float _2478 = -_2458;
                    float _2480 = fma(_2418, _2416, _2478);
                    float _2482 = -_2470;
                    float _2484 = fma(_2420, _2412, _2482);
                    float _2486 = 1.0 / _2468;
                    float _2488 = -_2472;
                    float _2490 = fma(_2418, _2408, _2488);
                    float _2492 = fma(_2436, _2400, _2466);
                    float _2494 = fma(_2476, _2400, _2480);
                    float _2496 = fma(_2446, _2400, _2484);
                    float _2498 = fma(_2452, _2402, _2492);
                    float _2500 = fma(_2462, _2402, _2494);
                    float _2502 = fma(_2490, _2402, _2496);
                    float _2504 = _2486 * _2498;
                    float _2506 = _2486 * _2500;
                    float _2508 = _2486 * _2502;
                    _2510 = _2506;
                    _2512 = _2504;
                    _2514 = _2508;
                    _2516 = true;
                }
                else
                {
                    float _2518 = fma(_2400, _504, _506);
                    float _2520 = fma(_2400, _508, _510);
                    float _2522 = fma(_2400, _512, _514);
                    float _2524 = fma(_2402, _516, _2518);
                    float _2526 = fma(_2402, _518, _2520);
                    float _2528 = fma(_2402, _520, _2522);
                    _2510 = _2526;
                    _2512 = _2524;
                    _2514 = _2528;
                }
                _2516 = false;
                float _2530 = _2510;
                float _2532 = _2512;
                float _2534 = _2514;
                float _2536 = _2530 * _2530;
                float _2538 = -_2278;
                float _2540 = _2538 + _2274;
                float _2542 = fma(_2532, _2532, _2536);
                float _2544 = _2540 + _1872;
                float _2546 = fma(_2534, _2534, _2542);
                float _2548 = rsqrt(_2546);
                float _2550 = _2548 * _2530;
                float _2552 = _2548 * _2532;
                float _2554 = _2548 * _2534;
                float _2556 = _2550 * _1846;
                float _2558 = fma(_2552, _1888, _2556);
                float _2560 = fma(_2554, _1890, _2558);
                float _2562 = _2552 * _2560;
                float _2564 = _2550 * _2560;
                float _2566 = _2554 * _2560;
                float _2568 = -_2562;
                float _2570 = _2568 + _1888;
                float _2572 = -_2564;
                float _2574 = _2572 + _1846;
                float _2576 = -_2566;
                float _2578 = _2576 + _1890;
                float _2580 = _2270 * _2562;
                float _2582 = _2270 * _2564;
                float _2584 = _2270 * _2566;
                float _2586 = -_2580;
                float _2588 = fma(_2272, _2570, _2586);
                float _2590 = -_2582;
                float _2592 = fma(_2272, _2574, _2590);
                float _2594 = -_2584;
                float _2596 = fma(_2272, _2578, _2594);
                _1916 = _2544;
                _1918 = _2588;
                _1920 = _2592;
                _1922 = _2596;
            }
        }
    }
    float _2598 = _1916;
    float _2600 = _1918;
    float _2602 = _1920;
    float _2604 = _1922;
    int _2606 = _164 + 4;
    int _2608 = _164 + 8;
    uint _2610 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2610)] = as_type<uint>(_552);
    float _2612 = -_168;
    float _2614 = _2612 + _1018;
    float _2616 = -_174;
    float _2618 = _2616 + _2598;
    uint _2620 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2620)] = as_type<uint>(_1018);
    float _2622 = -_180;
    float _2624 = _2622 + _1020;
    uint _2626 = uint(int(uint(_2606) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2626)] = as_type<uint>(_2598);
    uint _2628 = uint(int(uint(_2608) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2628)] = as_type<uint>(_1020);
    uint _2630 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2630)] = as_type<uint>(_2600);
    uint _2632 = uint(int(uint(_2606) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2632)] = as_type<uint>(_2602);
    uint _2634 = uint(int(uint(_2608) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2634)] = as_type<uint>(_2604);
    uint _2636 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2636)] = as_type<uint>(_2614);
    uint _2638 = uint(int(uint(_2606) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2638)] = as_type<uint>(_2618);
    uint _2640 = uint(int(uint(_2608) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2640)] = as_type<uint>(_2624);
    float _2642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2644 = _2618 * _2618;
    float _2646 = _2602 * _2602;
    float _2648 = fma(_2614, _2614, _2644);
    float _2650 = fma(_2600, _2600, _2646);
    float _2652 = fma(_2624, _2624, _2648);
    float _2654 = fma(_2604, _2604, _2650);
    float _2656 = sqrt(_2652);
    float _2658 = sqrt(_2654);
    bool _2660 = _2656 >= 9.9999999747524270787835121154785e-07;
    bool _2662 = isnan(_2656);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan(9.9999999747524270787835121154785e-07);
    bool _2668 = _2664 || _2666;
    if (!_2668)
    {
        bool _2670 = _528 != _288;
        bool _2672 = isnan(_528);
        bool _2674 = _2670 || _2672;
        bool _2676 = isnan(_288);
        bool _2678 = _2674 || _2676;
        _2680 = _2678;
        if (!_2680)
        {
            float _2682 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2684 = _2682 > 0.0;
            bool _2686 = !_2684;
            if (!_2686)
            {
                float _2688 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2690 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2692 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2694 = _2690 * _2690;
                float _2696 = fma(_2688, _2688, _2694);
                float _2698 = fma(_2692, _2692, _2696);
                float _2700 = rsqrt(_2698);
                float _2702 = _2700 * 9.9999999747524270787835121154785e-07;
                float _2704 = _2688 * _2702;
                float _2706 = _2690 * _2702;
                float _2708 = _2692 * _2702;
                _324 = as_type<int>(_2704);
                _326 = as_type<int>(_2706);
                _328 = as_type<int>(_2708);
                _2680 = true;
            }
            else
            {
                bool _2710 = _2658 >= 9.9999999747524270787835121154785e-07;
                bool _2712 = isnan(_2658);
                bool _2714 = _2710 || _2712;
                bool _2716 = isnan(9.9999999747524270787835121154785e-07);
                bool _2718 = _2714 || _2716;
                if (!_2718)
                {
                    float _2720 = _2598 * _2598;
                    float _2722 = fma(_1018, _1018, _2720);
                    float _2724 = fma(_1020, _1020, _2722);
                    float _2726 = sqrt(_2724);
                    bool _2728 = _2726 >= 9.9999999747524270787835121154785e-07;
                    bool _2730 = isnan(_2726);
                    bool _2732 = _2728 || _2730;
                    bool _2734 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2736 = _2732 || _2734;
                    float _2738 = _2726;
                    if (_2736)
                    {
                        float _2740 = rsqrt(_2724);
                        _2738 = _2740;
                    }
                    float _2742 = _2738;
                    if (!_2736)
                    {
                        _312 = 0;
                    }
                    int _2744 = _312;
                    int _2746 = _2744;
                    if (!_2736)
                    {
                        _314 = 897988541;
                    }
                    int _2748 = _314;
                    int _2750 = _2748;
                    if (!_2736)
                    {
                        _316 = 0;
                    }
                    int _2752 = _316;
                    float _2754 = _2742;
                    int _2756 = _2752;
                    if (_2736)
                    {
                        float _2758 = _2742 * 9.9999999747524270787835121154785e-07;
                        _2754 = _2758;
                    }
                    float _2760 = _2754;
                    if (_2736)
                    {
                        float _2762 = _1018 * _2760;
                        _2746 = as_type<int>(_2762);
                    }
                    int _2764 = _2746;
                    _324 = _2764;
                    if (_2736)
                    {
                        float _2766 = _2598 * _2760;
                        _2750 = as_type<int>(_2766);
                    }
                    int _2768 = _2750;
                    _326 = _2768;
                    if (_2736)
                    {
                        float _2770 = _1020 * _2760;
                        _2756 = as_type<int>(_2770);
                    }
                    int _2772 = _2756;
                    _328 = _2772;
                    _2680 = true;
                }
                else
                {
                    float _2774 = rsqrt(_2654);
                    float _2776 = _2774 * 9.9999999747524270787835121154785e-07;
                    float _2778 = _2600 * _2776;
                    float _2780 = _2602 * _2776;
                    float _2782 = _2604 * _2776;
                    _324 = as_type<int>(_2778);
                    _326 = as_type<int>(_2780);
                    _328 = as_type<int>(_2782);
                    _2680 = true;
                }
            }
        }
    }
    else
    {
        float _2784 = _2658 * _2642;
        bool _2786 = _2784 >= 0.001000000047497451305389404296875;
        bool _2788 = isnan(_2784);
        bool _2790 = _2786 || _2788;
        bool _2792 = isnan(0.001000000047497451305389404296875);
        bool _2794 = _2790 || _2792;
        bool _2796 = _2784 > 0.0;
        bool _2798 = !_2794;
        bool _2800 = _2796 && _2798;
        bool _2802 = _2656 < 0.001000000047497451305389404296875;
        bool _2804 = _2802 && _2800;
        if (!_2804)
        {
            _318 = as_type<int>(_2614);
        }
        int _2806 = _318;
        int _2808 = _2806;
        if (_2804)
        {
            float _2810 = _2642 * _2600;
            _2808 = as_type<int>(_2810);
        }
        int _2812 = _2808;
        _324 = _2812;
        if (!_2804)
        {
            _320 = as_type<int>(_2618);
        }
        int _2814 = _320;
        int _2816 = _2814;
        if (_2804)
        {
            float _2818 = _2642 * _2602;
            _2816 = as_type<int>(_2818);
        }
        int _2820 = _2816;
        _326 = _2820;
        if (!_2804)
        {
            _322 = as_type<int>(_2624);
        }
        int _2822 = _322;
        _328 = _2822;
        if (_2804)
        {
            float _2824 = _2642 * _2604;
            _328 = as_type<int>(_2824);
        }
    }
    _2680 = false;
    int _2826 = _324;
    int _2828 = _326;
    int _2830 = _328;
    uint _2832 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2832)] = uint(_2826);
    uint _2834 = uint(int(uint(_2606) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2834)] = uint(_2828);
    uint _2836 = uint(int(uint(_2608) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2836)] = uint(_2830);
}

