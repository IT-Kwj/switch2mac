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
    device _21* cp_s12 [[id(12)]];
    texture2d<float> cp_t_tcb_2C [[id(13)]];
    sampler cp_t_tcb_2CSmplr [[id(14)]];
    sampler cp_t_tcb_2CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1498 = false;
    bool _812 = false;
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
    int _226 = _184 ? (-1) : 0;
    if (_184)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _220 = _228;
        _222 = _230;
        _224 = _232;
    }
    float _234 = _220;
    float _236 = _222;
    float _238 = _224;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    if (_184)
    {
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _240 = _246;
        _242 = _248;
        _244 = _250;
    }
    float _252 = _240;
    float _254 = _242;
    float _256 = _244;
    float _258 = as_type<float>(_152);
    float _260 = _154;
    float _262 = _156;
    if (_184)
    {
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _258 = _264;
        _260 = _266;
        _262 = _268;
    }
    float _270 = _258;
    float _272 = _260;
    float _274 = _262;
    uint _276 = uint(int(uint(_164) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
    uint _280 = uint(int(uint(_186) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_280)]);
    uint _284 = uint(int(uint(_186) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_284)]);
    float _288 = _252;
    float _290 = _254;
    float _292 = _256;
    float _294 = _234;
    float _296 = _236;
    float _298 = _238;
    float _300 = _270;
    float _302 = _272;
    float _304 = _274;
    float _306 = _196;
    float _308 = _202;
    int _310 = as_type<int>(_206);
    int _312 = as_type<int>(_212);
    int _314 = as_type<int>(_218);
    int _316 = as_type<int>(_206);
    int _318 = as_type<int>(_212);
    int _320 = as_type<int>(_218);
    int _322 = as_type<int>(_206);
    int _324 = as_type<int>(_212);
    int _326 = as_type<int>(_218);
    if (!_184)
    {
        int _328 = _164 + 4;
        uint _330 = uint(int(uint(_164) >> uint(2)));
        float _332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_330)]);
        int _334 = _164 + 8;
        uint _336 = uint(int(uint(_164) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_336)]);
        uint _340 = uint(int(uint(_328) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_340)]);
        uint _344 = uint(int(uint(_328) >> uint(2)));
        float _346 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_344)]);
        uint _348 = uint(int(uint(_334) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_348)]);
        uint _352 = uint(int(uint(_164) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_352)]);
        uint _356 = uint(int(uint(_334) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_356)]);
        uint _360 = uint(int(uint(_328) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_360)]);
        uint _364 = uint(int(uint(_334) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_364)]);
        float _368 = _332 * _332;
        float _370 = fma(_338, _338, _368);
        float _372 = _342 * _342;
        float _374 = fma(_346, _346, _372);
        float _376 = _350 * _350;
        float _378 = fma(_354, _354, _370);
        float _380 = fma(_358, _358, _376);
        float _382 = sqrt(_378);
        float _384 = fma(_362, _362, _374);
        float _386 = fma(_366, _366, _380);
        float _388 = sqrt(_384);
        float _390 = sqrt(_386);
        bool _392 = _382 > 0.0;
        bool _394 = _388 > 0.0;
        bool _396 = _390 > 0.0;
        float _398 = _388;
        float _400 = _390;
        float _402 = _380;
        float _404 = _332;
        float _406 = _382;
        float _408 = _338;
        float _410 = _374;
        float _412 = _342;
        float _414 = _362;
        float _416 = _354;
        if (_392)
        {
            float _418 = rsqrt(_378);
            _398 = _418;
        }
        float _420 = _398;
        float _422 = 0.0;
        if (_394)
        {
            float _424 = rsqrt(_384);
            _422 = _424;
        }
        float _426 = _422;
        float _428 = 0.0;
        if (_396)
        {
            float _430 = rsqrt(_386);
            _428 = _430;
        }
        float _432 = _428;
        if (!_392)
        {
            _400 = 0.0;
        }
        float _434 = _400;
        float _436 = _434;
        if (_392)
        {
            float _438 = _332 * _420;
            _436 = _438;
        }
        float _440 = _436;
        _288 = _440;
        if (!_392)
        {
            _402 = 0.0;
        }
        float _442 = _402;
        float _444 = _442;
        if (_392)
        {
            float _446 = _338 * _420;
            _444 = _446;
        }
        float _448 = _444;
        _294 = _448;
        if (!_392)
        {
            _404 = 0.0;
        }
        float _450 = _404;
        float _452 = _450;
        if (_392)
        {
            float _454 = _354 * _420;
            _452 = _454;
        }
        float _456 = _452;
        _300 = _456;
        if (!_394)
        {
            _406 = 0.0;
        }
        float _458 = _406;
        float _460 = _458;
        if (_394)
        {
            float _462 = _342 * _426;
            _460 = _462;
        }
        float _464 = _460;
        _290 = _464;
        if (!_394)
        {
            _408 = 0.0;
        }
        float _466 = _408;
        float _468 = _466;
        if (_394)
        {
            float _470 = _362 * _426;
            _468 = _470;
        }
        float _472 = _468;
        _302 = _472;
        if (!_394)
        {
            _410 = 0.0;
        }
        float _474 = _410;
        float _476 = _474;
        if (_394)
        {
            float _478 = _346 * _426;
            _476 = _478;
        }
        float _480 = _476;
        _296 = _480;
        if (!_396)
        {
            _412 = 0.0;
        }
        float _482 = _412;
        float _484 = _482;
        if (!_396)
        {
            _414 = 0.0;
        }
        float _486 = _414;
        float _488 = _486;
        if (_396)
        {
            float _490 = _350 * _432;
            _484 = _490;
        }
        float _492 = _484;
        _292 = _492;
        if (!_396)
        {
            _416 = 0.0;
        }
        float _494 = _416;
        _304 = _494;
        if (_396)
        {
            float _496 = _358 * _432;
            _488 = _496;
        }
        float _498 = _488;
        _298 = _498;
        if (_396)
        {
            float _500 = _366 * _432;
            _304 = _500;
        }
    }
    float _502 = _288;
    float _504 = _290;
    float _506 = _292;
    float _508 = _294;
    float _510 = _296;
    float _512 = _298;
    float _514 = _300;
    float _516 = _302;
    float _518 = _304;
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _548 = uint(int(uint(_186) >> uint(2)));
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_548)]);
    bool _552 = _522 > 0.0;
    float _554 = abs(_520);
    float _556 = log2(_554);
    bool _558 = _524 > 0.0;
    float _560 = 0.0;
    float _562 = _528;
    float _564 = _530;
    float _566 = _534;
    float _568 = _538;
    float _570 = _540;
    float _572 = _542;
    float _574 = _544;
    float _576 = _546;
    if (_552)
    {
        float _578 = 1.0 / _522;
        _560 = _578;
    }
    float _580 = _560;
    float _582 = -_286;
    float _584 = _526 + _582;
    float _586 = _528 * _524;
    float _588 = _532 * _536;
    if (_558)
    {
        float _590 = -_586;
        float _592 = fma(_278, _590, _528);
        _562 = _592;
    }
    float _594 = _562;
    float _596 = _530 * _536;
    float _598 = _588 * _502;
    float _600 = 0.0;
    float _602 = _594;
    float _604 = _580;
    if (_552)
    {
        float _606 = _584 * _580;
        _600 = _606;
    }
    float _608 = _600;
    float _610 = _538 * _556;
    float _612 = _588 * _504;
    float _614 = _588 * _506;
    float _616 = exp2(_610);
    float _618 = _534 * _536;
    if (_552)
    {
        float _620 = precise::min(_608, 1.0);
        _564 = _620;
    }
    float _622 = _564;
    float _624 = fma(_596, _508, _598);
    float _626 = fma(_596, _510, _612);
    float _628 = fma(_596, _512, _614);
    float _630 = fma(_618, _514, _624);
    float _632 = fma(_618, _516, _626);
    float _634 = _622;
    float _636 = _626;
    if (_552)
    {
        float _638 = _622 * _594;
        _602 = _638;
    }
    float _640 = _602;
    float _642 = fma(_618, _518, _628);
    float _644 = _282 * _538;
    float _646 = _538 * _630;
    float _648 = _538 * _632;
    float _650 = _538 * _640;
    float _652 = _538 * _642;
    float _654 = fma(_190, _616, _646);
    float _656 = fma(_190, _644, _168);
    float _658 = fma(_196, _616, _648);
    float _660 = fma(_196, _644, _174);
    float _662 = fma(_202, _644, _180);
    float _664 = fma(_202, _616, _652);
    float _666 = _540 * _650;
    float _668 = _542 * _650;
    float _670 = _544 * _650;
    bool _672 = !_184;
    float _674 = _652;
    float _676 = _650;
    float _678 = _646;
    float _680 = _668;
    float _682 = _666;
    float _684 = _670;
    float _686 = _660;
    float _688 = _656;
    float _810;
    if (!_672)
    {
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _708 = _694 * _696;
        float _710 = _694 * _698;
        float _712 = _692 * _696;
        float _714 = -_708;
        float _716 = fma(_690, _700, _714);
        float _718 = -_710;
        float _720 = fma(_692, _700, _718);
        float _722 = -_712;
        float _724 = fma(_690, _698, _722);
        float _726 = _704 * _690;
        float _728 = _704 * _716;
        float _730 = _706 * _692;
        float _732 = _702 * _698;
        float _734 = -_726;
        float _736 = fma(_702, _692, _734);
        float _738 = -_728;
        float _740 = fma(_702, _720, _738);
        float _742 = _704 * _700;
        float _744 = _706 * _696;
        float _746 = _702 * _694;
        float _748 = fma(_706, _724, _740);
        float _750 = -_742;
        float _752 = fma(_706, _698, _750);
        float _754 = -_744;
        float _756 = fma(_702, _700, _754);
        float _758 = -_732;
        float _760 = fma(_704, _696, _758);
        float _762 = -_746;
        float _764 = fma(_706, _690, _762);
        float _766 = -_690;
        float _768 = fma(_766, _700, _708);
        float _770 = 1.0 / _748;
        float _772 = -_730;
        float _774 = fma(_704, _694, _772);
        float _776 = _752 * _770;
        float _778 = _756 * _770;
        float _780 = _760 * _770;
        float _782 = _666 * _770;
        float _784 = _668 * _776;
        float _786 = _668 * _778;
        float _788 = _768 * _770;
        float _790 = _668 * _780;
        float _792 = _774 * _770;
        float _794 = _764 * _770;
        float _796 = fma(_720, _782, _784);
        float _798 = fma(_666, _788, _786);
        float _800 = _736 * _770;
        float _802 = fma(_724, _782, _790);
        float _804 = fma(_670, _792, _796);
        float _806 = fma(_670, _794, _798);
        float _808 = fma(_670, _800, _802);
        _634 = _774;
        _674 = _724;
        _566 = _802;
        _604 = _736;
        _810 = _794;
        _568 = _702;
        _676 = _704;
        _636 = _706;
        _306 = _792;
        _308 = _784;
        _678 = _796;
        _570 = _786;
        _572 = _800;
        _574 = _782;
        _576 = _708;
        _680 = _806;
        _682 = _804;
        _684 = _808;
        _812 = true;
    }
    else
    {
        int _814 = as_type<int>(_162) & 1024;
        bool _816 = _814 != 0;
        if (_816)
        {
            _226 = -1;
        }
        int _818 = _226;
        int _820 = _818;
        if (!_816)
        {
            int _822 = as_type<int>(_162) & 2048;
            bool _824 = _822 != 0;
            _820 = _824 ? (-1) : 0;
        }
        int _826 = _820;
        int _828 = ~_826;
        _810 = 0.0;
        if (!(_828 != 0))
        {
            uint _830 = uint(int(uint(_164) >> uint(2)));
            float _832 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_830)]);
            int _834 = _164 + 4;
            uint _836 = uint(int(uint(_834) >> uint(2)));
            float _838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_836)]);
            int _840 = _164 + 8;
            uint _842 = uint(int(uint(_840) >> uint(2)));
            float _844 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_842)]);
            uint _846 = uint(int(uint(_164) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_846)]);
            int _850 = _164 + 4;
            uint _852 = uint(int(uint(_850) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_852)]);
            int _856 = _164 + 8;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_858)]);
            uint _862 = uint(int(uint(_164) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_862)]);
            int _866 = _164 + 4;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_868)]);
            int _872 = _164 + 8;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_874)]);
            float _878 = _844 * _848;
            float _880 = _844 * _854;
            float _882 = _838 * _848;
            float _884 = -_878;
            float _886 = fma(_832, _860, _884);
            float _888 = -_880;
            float _890 = fma(_838, _860, _888);
            float _892 = -_882;
            float _894 = fma(_832, _854, _892);
            float _896 = _870 * _832;
            float _898 = _870 * _886;
            float _900 = _876 * _838;
            float _902 = _864 * _854;
            float _904 = -_896;
            float _906 = fma(_864, _838, _904);
            float _908 = -_898;
            float _910 = fma(_864, _890, _908);
            float _912 = _870 * _860;
            float _914 = _876 * _848;
            float _916 = _864 * _844;
            float _918 = fma(_876, _894, _910);
            float _920 = -_912;
            float _922 = fma(_876, _854, _920);
            float _924 = -_914;
            float _926 = fma(_864, _860, _924);
            float _928 = -_902;
            float _930 = fma(_870, _848, _928);
            float _932 = -_916;
            float _934 = fma(_876, _832, _932);
            float _936 = -_832;
            float _938 = fma(_936, _860, _878);
            float _940 = 1.0 / _918;
            float _942 = -_900;
            float _944 = fma(_870, _844, _942);
            float _946 = _922 * _940;
            float _948 = _926 * _940;
            float _950 = _930 * _940;
            float _952 = _666 * _940;
            float _954 = _668 * _946;
            float _956 = _668 * _948;
            float _958 = _938 * _940;
            float _960 = _668 * _950;
            float _962 = _944 * _940;
            float _964 = _934 * _940;
            float _966 = fma(_890, _952, _954);
            float _968 = fma(_666, _958, _956);
            float _970 = _906 * _940;
            float _972 = fma(_894, _952, _960);
            float _974 = fma(_670, _962, _966);
            float _976 = fma(_670, _964, _968);
            float _978 = fma(_670, _970, _972);
            _634 = _944;
            _674 = _894;
            _566 = _972;
            _604 = _906;
            _810 = _964;
            _568 = _864;
            _676 = _870;
            _636 = _876;
            _306 = _962;
            _308 = _954;
            _678 = _966;
            _570 = _956;
            _572 = _970;
            _574 = _952;
            _576 = _878;
            _680 = _976;
            _682 = _974;
            _684 = _978;
        }
    }
    _812 = false;
    float _980 = _634;
    float _982 = _674;
    float _984 = _566;
    float _986 = _604;
    float _988 = _810;
    float _990 = _568;
    float _992 = _676;
    float _994 = _636;
    float _996 = _306;
    float _998 = _308;
    float _1000 = _678;
    float _1002 = _570;
    float _1004 = _572;
    float _1006 = _574;
    float _1008 = _576;
    float _1010 = _680;
    float _1012 = _682;
    float _1014 = _684;
    uint _1016 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1016)] = as_type<uint>(_550);
    float _1018 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1020 = as_type<int>(_1018) & 512;
    bool _1022 = _1020 != 0;
    int _1024 = as_type<int>(_1018) & 1024;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>(_1018) & 2048;
    bool _1030 = _1028 != 0;
    float _1032 = 0.0;
    float _1034 = 0.0;
    float _1036 = 0.0;
    float _1038 = 0.0;
    float _1040 = _1014;
    if (_1022)
    {
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1032 = _1042;
        _1034 = _1044;
        _1036 = _1046;
        _1038 = _1048;
    }
    float _1050 = _1032;
    float _1052 = _1034;
    float _1054 = _1036;
    float _1056 = _1038;
    float _1058 = _980;
    float _1060 = _982;
    float _1062 = _984;
    if (_1026)
    {
        uint _1064 = uint(int(uint(_164) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1064)]);
        int _1068 = _164 + 4;
        uint _1070 = uint(int(uint(_1068) >> uint(2)));
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1070)]);
        int _1074 = _164 + 8;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1076)]);
        _1058 = _1066;
        _1060 = _1072;
        _1062 = _1078;
    }
    float _1080 = _1058;
    float _1082 = _1060;
    float _1084 = _1062;
    float _1086 = _986;
    float _1088 = _988;
    float _1090 = 0.0;
    float _1092 = 0.0;
    if (_1022)
    {
        float _1094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1086 = _1094;
        _1088 = _1096;
        _1090 = _1098;
        _1092 = _1100;
    }
    float _1102 = _1086;
    float _1104 = _1088;
    float _1106 = _1090;
    float _1108 = _1092;
    float _1110 = _990;
    float _1112 = _992;
    float _1114 = _994;
    if (_1026)
    {
        uint _1116 = uint(int(uint(_164) >> uint(2)));
        float _1118 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1116)]);
        int _1120 = _164 + 4;
        uint _1122 = uint(int(uint(_1120) >> uint(2)));
        float _1124 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1122)]);
        int _1126 = _164 + 8;
        uint _1128 = uint(int(uint(_1126) >> uint(2)));
        float _1130 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1128)]);
        _1110 = _1118;
        _1112 = _1124;
        _1114 = _1130;
    }
    float _1132 = _1110;
    float _1134 = _1112;
    float _1136 = _1114;
    float _1138 = _1018;
    float _1140 = _996;
    float _1142 = _998;
    float _1144 = _1000;
    if (_1030)
    {
        uint _1146 = uint(int(uint(_164) >> uint(2)));
        float _1148 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1146)]);
        int _1150 = _164 + 4;
        uint _1152 = uint(int(uint(_1150) >> uint(2)));
        float _1154 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1152)]);
        int _1156 = _164 + 8;
        uint _1158 = uint(int(uint(_1156) >> uint(2)));
        float _1160 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1158)]);
        int _1162 = _164 + 12;
        uint _1164 = uint(int(uint(_1162) >> uint(2)));
        float _1166 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1164)]);
        _1138 = _1148;
        _1140 = _1154;
        _1142 = _1160;
        _1144 = _1166;
    }
    float _1168 = _1138;
    float _1170 = _1140;
    float _1172 = _1142;
    float _1174 = _1144;
    float _1176 = _1002;
    float _1178 = _1004;
    float _1180 = _1006;
    float _1182 = _1008;
    if (_1030)
    {
        uint _1184 = uint(int(uint(_164) >> uint(2)));
        float _1186 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1184)]);
        int _1188 = _164 + 4;
        uint _1190 = uint(int(uint(_1188) >> uint(2)));
        float _1192 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1190)]);
        int _1194 = _164 + 8;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        float _1198 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1196)]);
        int _1200 = _164 + 12;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        float _1204 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1202)]);
        _1176 = _1186;
        _1178 = _1192;
        _1180 = _1198;
        _1182 = _1204;
    }
    float _1206 = _1176;
    float _1208 = _1178;
    float _1210 = _1180;
    float _1212 = _1182;
    float _1214 = 0.0;
    if (_1026)
    {
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = 0.0;
    if (_1026)
    {
        float _1222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1220 = _1222;
    }
    float _1224 = _1220;
    float _1226 = _660 + _1010;
    float _1228 = _656 + _1012;
    float _1230 = _662 + _1014;
    if (!_1022)
    {
        _686 = 0.0;
    }
    float _1232 = _686;
    float _1234 = _1232;
    if (!_1022)
    {
        _688 = 0.0;
    }
    float _1236 = _688;
    float _1238 = _1052;
    float _1240 = _1054;
    float _1242 = _1236;
    if (_1022)
    {
        float _1244 = _1226 * _1052;
        _1238 = _1244;
    }
    float _1246 = _1238;
    float _1248 = _1082;
    float _1250 = _1246;
    float _1252 = _1104;
    float _1254 = _1134;
    float _1256 = _1084;
    float _1258 = _1208;
    float _1260 = _1168;
    float _1262 = _1106;
    float _1264 = _1172;
    float _1266 = _1210;
    if (_1026)
    {
        float _1268 = _1226 * _1082;
        _1248 = _1268;
    }
    float _1270 = _1248;
    float _1272 = _1270;
    if (_1022)
    {
        float _1274 = fma(_1228, _1050, _1246);
        _1250 = _1274;
    }
    float _1276 = _1250;
    if (_1022)
    {
        float _1278 = _1226 * _1104;
        _1252 = _1278;
    }
    float _1280 = _1252;
    float _1282 = _1280;
    if (_1026)
    {
        float _1284 = fma(_1228, _1080, _1270);
        _1272 = _1284;
    }
    float _1286 = _1272;
    if (_1022)
    {
        float _1288 = fma(_1230, _1054, _1276);
        _1240 = _1288;
    }
    float _1290 = _1240;
    if (_1026)
    {
        float _1292 = _1226 * _1134;
        _1254 = _1292;
    }
    float _1294 = _1254;
    float _1296 = _1294;
    if (_1022)
    {
        float _1298 = fma(_1228, _1102, _1280);
        _1282 = _1298;
    }
    float _1300 = _1282;
    if (_1026)
    {
        float _1302 = fma(_1230, _1084, _1286);
        _1256 = _1302;
    }
    float _1304 = _1256;
    if (_1030)
    {
        float _1306 = _1226 * _1170;
        _1040 = _1306;
    }
    float _1308 = _1040;
    if (_1026)
    {
        float _1310 = fma(_1228, _1132, _1294);
        _1296 = _1310;
    }
    float _1312 = _1296;
    float _1314 = _1312;
    if (_1030)
    {
        float _1316 = _1226 * _1208;
        _1258 = _1316;
    }
    float _1318 = _1258;
    float _1320 = _1318;
    if (_1030)
    {
        float _1322 = fma(_1228, _1168, _1308);
        _1260 = _1322;
    }
    float _1324 = _1260;
    float _1326 = _1324;
    if (_1022)
    {
        float _1328 = _1056 + _1290;
        _1234 = _1328;
    }
    float _1330 = _1234;
    float _1332 = _1330;
    if (_1030)
    {
        float _1334 = fma(_1228, _1206, _1318);
        _1320 = _1334;
    }
    float _1336 = _1320;
    if (_1022)
    {
        float _1338 = fma(_1230, _1106, _1300);
        _1262 = _1338;
    }
    float _1340 = _1262;
    if (_1026)
    {
        float _1342 = _1218 + _1304;
        _1332 = _1342;
    }
    float _1344 = _1332;
    if (_1026)
    {
        float _1346 = fma(_1230, _1136, _1312);
        _1314 = _1346;
    }
    float _1348 = _1314;
    if (_1030)
    {
        float _1350 = fma(_1230, _1172, _1324);
        _1264 = _1350;
    }
    float _1352 = _1264;
    if (_1030)
    {
        float _1354 = fma(_1230, _1210, _1336);
        _1266 = _1354;
    }
    float _1356 = _1266;
    if (_1022)
    {
        float _1358 = _1108 + _1340;
        _1242 = _1358;
    }
    float _1360 = _1242;
    float _1362 = _1360;
    if (_1026)
    {
        float _1364 = _1224 + _1348;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = _1366;
    if (!_1030)
    {
        _1326 = _1344;
    }
    float _1370 = _1326;
    float _1372 = _1370;
    if (_1030)
    {
        float _1374 = _1174 + _1352;
        _1372 = _1374;
    }
    float _1376 = _1372;
    if (_1030)
    {
        float _1378 = _1212 + _1356;
        _1368 = _1378;
    }
    float _1380 = _1368;
    float _1382 = fma(_1376, 6.2500002968590706586837768554688e-05, 0.5);
    float _1384 = fma(_1380, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3655 = float2(_1382, _1384);
    float2 _1388 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3655, float2(0.0), isnan(_3655)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3655, float2(0.0), isnan(_3655)), level(0.0)).xy;
    float _1390 = _1388.x;
    float _1392 = _1388.y;
    bool _1394 = _1390 != 0.0;
    bool _1396 = isnan(_1390);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    float _1404 = _1380;
    float _1406 = _1392;
    if (_1402)
    {
        _1404 = _1392;
    }
    float _1408 = _1404;
    if (!_1402)
    {
        _1406 = 4.0;
    }
    float _1410 = _1406;
    float _1412 = _1408;
    if (!_1402)
    {
        float2 _3697 = float2(_1382, _1384);
        float _1414 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3697, float2(0.0), isnan(_3697)), level(_1410)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3697, float2(0.0), isnan(_3697)), level(_1410)).y;
        _1412 = _1414;
    }
    float _1416 = _1412;
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    int _1420 = _164 + 4;
    float _1422 = -_168;
    float _1424 = _1422 + _1228;
    float _1426 = -_174;
    float _1428 = _1426 + _1226;
    float _1430 = -_180;
    float _1432 = _1430 + _1230;
    int _1434 = _164 + 8;
    float _1436 = _1428 * _1428;
    float _1438 = fma(_1424, _1424, _1436);
    float _1440 = fma(_1432, _1432, _1438);
    float _1442 = fma(_1416, 2000.0, _1418);
    uint _1444 = uint(int(uint(_1420) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1444)] = as_type<uint>(_1442);
    uint _1446 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1446)] = as_type<uint>(_550);
    uint _1448 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1448)] = as_type<uint>(_1228);
    uint _1450 = uint(int(uint(_1420) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1450)] = as_type<uint>(_1226);
    uint _1452 = uint(int(uint(_1434) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1452)] = as_type<uint>(_1230);
    uint _1454 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1454)] = as_type<uint>(_654);
    uint _1456 = uint(int(uint(_1420) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1456)] = as_type<uint>(_658);
    uint _1458 = uint(int(uint(_1434) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1458)] = as_type<uint>(_664);
    uint _1460 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1460)] = as_type<uint>(_1424);
    uint _1462 = uint(int(uint(_1420) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1462)] = as_type<uint>(_1428);
    uint _1464 = uint(int(uint(_1434) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1464)] = as_type<uint>(_1432);
    float _1466 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1468 = sqrt(_1440);
    float _1470 = _658 * _658;
    float _1472 = fma(_654, _654, _1470);
    float _1474 = fma(_664, _664, _1472);
    float _1476 = sqrt(_1474);
    bool _1478 = _1468 >= 9.9999999747524270787835121154785e-07;
    bool _1480 = isnan(_1468);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(9.9999999747524270787835121154785e-07);
    bool _1486 = _1482 || _1484;
    if (!_1486)
    {
        bool _1488 = _526 != _286;
        bool _1490 = isnan(_526);
        bool _1492 = _1488 || _1490;
        bool _1494 = isnan(_286);
        bool _1496 = _1492 || _1494;
        _1498 = _1496;
        if (!_1498)
        {
            float _1500 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1502 = _1500 > 0.0;
            bool _1504 = !_1502;
            if (!_1504)
            {
                float _1506 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1508 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1510 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1512 = _1508 * _504;
                float _1514 = _1508 * _502;
                float _1516 = _1508 * _506;
                float _1518 = fma(_1506, _510, _1512);
                float _1520 = fma(_1506, _508, _1514);
                float _1522 = fma(_1506, _512, _1516);
                float _1524 = fma(_1510, _516, _1518);
                float _1526 = fma(_1510, _514, _1520);
                float _1528 = fma(_1510, _518, _1522);
                float _1530 = _1524 * _1524;
                float _1532 = fma(_1526, _1526, _1530);
                float _1534 = fma(_1528, _1528, _1532);
                float _1536 = rsqrt(_1534);
                float _1538 = _1536 * 9.9999999747524270787835121154785e-07;
                float _1540 = _1526 * _1538;
                float _1542 = _1524 * _1538;
                float _1544 = _1528 * _1538;
                _322 = as_type<int>(_1540);
                _324 = as_type<int>(_1542);
                _326 = as_type<int>(_1544);
                _1498 = true;
            }
            else
            {
                bool _1546 = _1476 >= 9.9999999747524270787835121154785e-07;
                bool _1548 = isnan(_1476);
                bool _1550 = _1546 || _1548;
                bool _1552 = isnan(9.9999999747524270787835121154785e-07);
                bool _1554 = _1550 || _1552;
                if (!_1554)
                {
                    float _1556 = _1226 * _1226;
                    float _1558 = fma(_1228, _1228, _1556);
                    float _1560 = fma(_1230, _1230, _1558);
                    float _1562 = sqrt(_1560);
                    bool _1564 = _1562 >= 9.9999999747524270787835121154785e-07;
                    bool _1566 = isnan(_1562);
                    bool _1568 = _1564 || _1566;
                    bool _1570 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1572 = _1568 || _1570;
                    float _1574 = _1562;
                    if (_1572)
                    {
                        float _1576 = rsqrt(_1560);
                        _1574 = _1576;
                    }
                    float _1578 = _1574;
                    if (!_1572)
                    {
                        _310 = 0;
                    }
                    int _1580 = _310;
                    int _1582 = _1580;
                    if (!_1572)
                    {
                        _312 = 897988541;
                    }
                    int _1584 = _312;
                    int _1586 = _1584;
                    if (!_1572)
                    {
                        _314 = 0;
                    }
                    int _1588 = _314;
                    float _1590 = _1578;
                    int _1592 = _1588;
                    if (_1572)
                    {
                        float _1594 = _1578 * 9.9999999747524270787835121154785e-07;
                        _1590 = _1594;
                    }
                    float _1596 = _1590;
                    if (_1572)
                    {
                        float _1598 = _1228 * _1596;
                        _1582 = as_type<int>(_1598);
                    }
                    int _1600 = _1582;
                    _322 = _1600;
                    if (_1572)
                    {
                        float _1602 = _1226 * _1596;
                        _1586 = as_type<int>(_1602);
                    }
                    int _1604 = _1586;
                    _324 = _1604;
                    if (_1572)
                    {
                        float _1606 = _1230 * _1596;
                        _1592 = as_type<int>(_1606);
                    }
                    int _1608 = _1592;
                    _326 = _1608;
                    _1498 = true;
                }
                else
                {
                    float _1610 = rsqrt(_1474);
                    float _1612 = _1610 * 9.9999999747524270787835121154785e-07;
                    float _1614 = _654 * _1612;
                    float _1616 = _658 * _1612;
                    float _1618 = _664 * _1612;
                    _322 = as_type<int>(_1614);
                    _324 = as_type<int>(_1616);
                    _326 = as_type<int>(_1618);
                    _1498 = true;
                }
            }
        }
    }
    else
    {
        float _1620 = _1476 * _1466;
        bool _1622 = _1620 >= 0.001000000047497451305389404296875;
        bool _1624 = isnan(_1620);
        bool _1626 = _1622 || _1624;
        bool _1628 = isnan(0.001000000047497451305389404296875);
        bool _1630 = _1626 || _1628;
        bool _1632 = _1620 > 0.0;
        bool _1634 = !_1630;
        bool _1636 = _1632 && _1634;
        bool _1638 = _1468 < 0.001000000047497451305389404296875;
        bool _1640 = _1638 && _1636;
        if (!_1640)
        {
            _316 = as_type<int>(_1424);
        }
        int _1642 = _316;
        int _1644 = _1642;
        if (_1640)
        {
            float _1646 = _654 * _1466;
            _1644 = as_type<int>(_1646);
        }
        int _1648 = _1644;
        _322 = _1648;
        if (!_1640)
        {
            _318 = as_type<int>(_1428);
        }
        int _1650 = _318;
        int _1652 = _1650;
        if (_1640)
        {
            float _1654 = _658 * _1466;
            _1652 = as_type<int>(_1654);
        }
        int _1656 = _1652;
        _324 = _1656;
        if (!_1640)
        {
            _320 = as_type<int>(_1432);
        }
        int _1658 = _320;
        _326 = _1658;
        if (_1640)
        {
            float _1660 = _664 * _1466;
            _326 = as_type<int>(_1660);
        }
    }
    _1498 = false;
    int _1662 = _322;
    int _1664 = _324;
    int _1666 = _326;
    uint _1668 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1668)] = uint(_1662);
    uint _1670 = uint(int(uint(_1420) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1670)] = uint(_1664);
    uint _1672 = uint(int(uint(_1434) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1672)] = uint(_1666);
}

