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
    texture3d<float> cp_t_tcb_12 [[id(12)]];
    sampler cp_t_tcb_12Smplr [[id(13)]];
    sampler cp_t_tcb_12Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _4928 = false;
    bool _4668 = false;
    bool _4280 = false;
    bool _3800 = false;
    bool _2828 = false;
    bool _2066 = false;
    bool _1150 = false;
    float _64 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    float _68 = as_type<float>(gl_WorkGroupID.x);
    int _71 = as_type<int>(_68) << 5;
    int _73 = _71 + as_type<int>(_66);
    float _75 = trunc(_64);
    int _77 = int(_75);
    bool _81 = _73 >= _77;
    int _83 = 0;
    if (_81)
    {
        _83 = 0;
    }
    int _85 = _83;
    int _87 = _85;
    int _89 = _85;
    if (!_81)
    {
        int _91 = _73 << 4;
        int _93 = _91 + 12;
        uint _96 = uint(int(uint(_93) >> uint(2)));
        float _98 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_96)]);
        float _100 = trunc(_98);
        int _102 = int(_100);
        bool _104 = _102 >= 1;
        int _106 = _104 ? (-1) : 0;
        if (!_104)
        {
            _87 = 0;
        }
        int _108 = _87;
        bool _110 = !_104;
        _89 = _108;
        if (!_110)
        {
            float _112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _114 = uint(int(uint(_93) >> uint(2)));
            float _116 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_114)]);
            float _118 = float(_102);
            float _120 = -_116;
            float _122 = _112 + _120;
            bool _124 = _122 > _118;
            int _126 = as_type<int>(_112);
            if (!_124)
            {
                bool _128 = _112 >= _116;
                bool _130 = isnan(_112);
                bool _132 = _128 || _130;
                bool _134 = isnan(_116);
                bool _136 = _132 || _134;
                _106 = _136 ? (-1) : 0;
            }
            int _138 = _106;
            if (_124)
            {
                _126 = 0;
            }
            int _140 = _126;
            _89 = _140;
            if (!_124)
            {
                int _142 = ~_138;
                int _144 = (_142 != 0) ? 0 : 1;
                _89 = _144;
            }
        }
    }
    int _146 = _89;
    int _148 = _146 & 1;
    bool _150 = _148 != 0;
    if (!_150)
    {
        return;
    }
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _154 = _73 << 4;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_156)]);
    int _160 = _154 + 4;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_162)]);
    int _166 = _154 + 8;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    int _172 = as_type<int>(_152) & 512;
    bool _174 = _172 != 0;
    int _176 = _154 + 12;
    uint _178 = uint(int(uint(_154) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_178)]);
    int _182 = _154 + 4;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_184)]);
    int _188 = _154 + 8;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    uint _194 = uint(int(uint(_154) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_194)]);
    int _198 = _154 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_200)]);
    int _204 = _154 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_206)]);
    float _210 = 0.0;
    float _212 = 0.0;
    float _214 = 0.0;
    if (_174)
    {
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _210 = _216;
        _212 = _218;
        _214 = _220;
    }
    float _222 = _210;
    float _224 = _212;
    float _226 = _214;
    float _228 = 0.0;
    float _230 = 0.0;
    float _232 = 0.0;
    if (_174)
    {
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _228 = _234;
        _230 = _236;
        _232 = _238;
    }
    float _240 = _228;
    float _242 = _230;
    float _244 = _232;
    float _246 = 0.0;
    float _248 = 0.0;
    float _250 = 0.0;
    if (_174)
    {
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _246 = _252;
        _248 = _254;
        _250 = _256;
    }
    float _258 = _246;
    float _260 = _248;
    float _262 = _250;
    uint _264 = uint(int(uint(_154) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_264)]);
    int _268 = _154 + 4;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_270)]);
    int _274 = _154 + 8;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
    uint _280 = uint(int(uint(_176) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_280)]);
    uint _284 = uint(int(uint(_176) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_284)]);
    float _288 = _224;
    float _290 = _240;
    float _292 = _242;
    float _294 = _244;
    float _296 = _222;
    float _298 = _224;
    float _300 = _226;
    float _302 = _260;
    float _304 = _258;
    float _306 = _262;
    float _308 = _192;
    float _310 = _192;
    int _312 = as_type<int>(_196);
    int _314 = as_type<int>(_202);
    int _316 = as_type<int>(_208);
    int _318 = as_type<int>(_196);
    int _320 = as_type<int>(_202);
    int _322 = as_type<int>(_208);
    int _324 = as_type<int>(_196);
    int _326 = as_type<int>(_202);
    int _328 = as_type<int>(_208);
    if (!_174)
    {
        int _330 = _154 + 4;
        int _332 = _154 + 8;
        uint _334 = uint(int(uint(_154) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_334)]);
        uint _338 = uint(int(uint(_330) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_338)]);
        uint _342 = uint(int(uint(_332) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_342)]);
        uint _346 = uint(int(uint(_330) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_154) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_350)]);
        uint _354 = uint(int(uint(_332) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_330) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_358)]);
        uint _362 = uint(int(uint(_154) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        uint _366 = uint(int(uint(_332) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        float _370 = _336 * _336;
        float _372 = _340 * _340;
        float _374 = _344 * _344;
        float _376 = fma(_348, _348, _372);
        float _378 = fma(_352, _352, _370);
        float _380 = fma(_356, _356, _374);
        float _382 = fma(_360, _360, _376);
        float _384 = fma(_364, _364, _378);
        float _386 = sqrt(_382);
        float _388 = fma(_368, _368, _380);
        float _390 = sqrt(_384);
        float _392 = sqrt(_388);
        bool _394 = _386 > 0.0;
        bool _396 = _390 > 0.0;
        bool _398 = _392 > 0.0;
        float _400 = _226;
        float _402 = _372;
        float _404 = _384;
        float _406 = _390;
        float _408 = _380;
        float _410 = _392;
        float _412 = _382;
        float _414 = _348;
        if (_394)
        {
            float _416 = rsqrt(_382);
            _400 = _416;
        }
        float _418 = _400;
        float _420 = _386;
        if (_396)
        {
            float _422 = rsqrt(_384);
            _420 = _422;
        }
        float _424 = _420;
        float _426 = 0.0;
        if (_398)
        {
            float _428 = rsqrt(_388);
            _426 = _428;
        }
        float _430 = _426;
        if (!_394)
        {
            _402 = 0.0;
        }
        float _432 = _402;
        float _434 = _432;
        float _436 = _418;
        if (_394)
        {
            float _438 = _340 * _418;
            _434 = _438;
        }
        float _440 = _434;
        _292 = _440;
        if (!_394)
        {
            _288 = 0.0;
        }
        float _442 = _288;
        float _444 = _442;
        if (_394)
        {
            float _446 = _348 * _418;
            _444 = _446;
        }
        float _448 = _444;
        _298 = _448;
        if (!_394)
        {
            _404 = 0.0;
        }
        float _450 = _404;
        float _452 = _450;
        if (_394)
        {
            float _454 = _360 * _418;
            _452 = _454;
        }
        float _456 = _452;
        _302 = _456;
        if (!_396)
        {
            _406 = 0.0;
        }
        float _458 = _406;
        float _460 = _458;
        if (_396)
        {
            float _462 = _336 * _424;
            _460 = _462;
        }
        float _464 = _460;
        _290 = _464;
        if (!_396)
        {
            _408 = 0.0;
        }
        float _466 = _408;
        float _468 = _466;
        if (_396)
        {
            float _470 = _352 * _424;
            _468 = _470;
        }
        float _472 = _468;
        _296 = _472;
        if (!_396)
        {
            _410 = 0.0;
        }
        float _474 = _410;
        float _476 = _474;
        if (_396)
        {
            float _478 = _364 * _424;
            _476 = _478;
        }
        float _480 = _476;
        _304 = _480;
        if (!_398)
        {
            _412 = 0.0;
        }
        float _482 = _412;
        float _484 = _482;
        if (!_398)
        {
            _436 = 0.0;
        }
        float _486 = _436;
        float _488 = _486;
        if (_398)
        {
            float _490 = _344 * _430;
            _484 = _490;
        }
        float _492 = _484;
        _294 = _492;
        if (!_398)
        {
            _414 = 0.0;
        }
        float _494 = _414;
        _306 = _494;
        if (_398)
        {
            float _496 = _356 * _430;
            _488 = _496;
        }
        float _498 = _488;
        _300 = _498;
        if (_398)
        {
            float _500 = _368 * _430;
            _306 = _500;
        }
    }
    float _502 = _290;
    float _504 = _292;
    float _506 = _294;
    float _508 = _296;
    float _510 = _298;
    float _512 = _300;
    float _514 = _302;
    float _516 = _304;
    float _518 = _306;
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    bool _544 = _526 != 1.0;
    bool _546 = isnan(_526);
    bool _548 = _544 || _546;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    float _560 = _552 ? _266 : 0.0;
    float _562 = _528 * 0.00999999977648258209228515625;
    float _564 = _552 ? _272 : 0.3141500055789947509765625;
    float _566 = _552 ? _278 : 0.92653000354766845703125;
    float _568 = _532 * _560;
    float _570 = _532 * _562;
    float _572 = _532 * _564;
    float _574 = _532 * _566;
    float _576 = _564;
    float _578 = _562;
    float _580 = _568;
    float _582 = _572;
    float _584 = _574;
    float _586 = _530;
    float _588 = _566;
    float _590 = _542;
    float _592 = _570;
    float _594 = _570;
    float _596 = _502;
    float _598 = _556;
    float _600 = _504;
    float _602 = _510;
    float _604 = _558;
    float _606 = _514;
    float _608 = _516;
    float _610 = _518;
    if (!_552)
    {
        float _612 = _530 * 0.00999999977648258209228515625;
        float _614 = _540 * _570;
        float _616 = fma(_272, 2.0, -1.0);
        float _618 = _532 * _612;
        float _620 = fma(_266, 2.0, -1.0);
        float _622 = fma(_278, 2.0, -1.0);
        float _624 = fma(_618, _616, _614);
        float _626 = fma(_618, _620, _614);
        float _628 = fma(_618, _622, _614);
        float _630 = _572 + _624;
        float _632 = _568 + _626;
        float _634 = _574 + _628;
        _576 = _628;
        _578 = _626;
        _580 = _632;
        _582 = _630;
        _584 = _634;
    }
    float _636 = _576;
    float _638 = _578;
    float _640 = _580;
    float _642 = _582;
    float _644 = _584;
    float _646 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _648 = -_534;
    float _650 = _648 + 1.0;
    float _652 = -_536;
    float _654 = _652 + 1.0;
    float _656 = _636;
    if (_552)
    {
        _656 = 0.0;
    }
    float _658 = _656;
    float _660 = _658;
    if (!_552)
    {
        float _662 = _534 * _570;
        _660 = _662;
    }
    float _664 = _660;
    float _666 = _520 * _538;
    float _668 = fma(_650, _654, _536);
    float _670 = -_282;
    float _672 = _540 + _670;
    float _674 = abs(_536);
    float _676 = log2(_674);
    bool _678 = _664 != 0.0;
    bool _680 = isnan(_664);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _524 * _538;
    bool _690 = _668 != 1.0;
    bool _692 = isnan(_668);
    bool _694 = _690 || _692;
    bool _696 = isnan(1.0);
    bool _698 = _694 || _696;
    bool _700 = _542 != 1.0;
    bool _702 = isnan(_542);
    bool _704 = _700 || _702;
    bool _706 = isnan(1.0);
    bool _708 = _704 || _706;
    bool _710 = !_698;
    bool _712 = _708 || _710;
    float _714 = _534 * _666;
    float _716 = _534 * _676;
    float _718 = _638;
    float _720 = _688;
    float _722 = _688;
    float _724 = _664;
    float _726 = _672;
    if (!_712)
    {
        float _728 = abs(_668);
        float _730 = log2(_728);
        _718 = _730;
    }
    float _732 = _718;
    if (!_712)
    {
        float _734 = -_668;
        float _736 = _734 + 1.0;
        _586 = _736;
    }
    float _738 = _586;
    if (_712)
    {
        _588 = _672;
    }
    float _740 = _588;
    float _742 = 0.0;
    float _744 = _740;
    if (!_712)
    {
        float _746 = 1.0 / _738;
        _742 = _746;
    }
    float _748 = _742;
    float _750 = _522 * _538;
    float _752 = _534 * _688;
    float _754 = _534 * _750;
    float _756 = _732;
    float _758 = _748;
    float _760 = _748;
    if (!_712)
    {
        float _762 = _672 * _732;
        _756 = _762;
    }
    float _764 = _756;
    float _766 = exp2(_716);
    float _768 = _764;
    if (!_712)
    {
        float _770 = exp2(_764);
        _768 = _770;
    }
    float _772 = _768;
    float _774 = fma(_186, _766, _754);
    float _776 = fma(_192, _766, _752);
    if (!_712)
    {
        float _778 = -_772;
        float _780 = _778 + 1.0;
        _590 = _780;
    }
    float _782 = _590;
    float _784 = fma(_180, _766, _714);
    if (!_712)
    {
        float _786 = _782 * _748;
        _744 = _786;
    }
    float _788 = _744;
    float _790 = _788 + _640;
    float _792 = _534 + _790;
    float _794 = _792 + _664;
    bool _796 = _646 != 1.0;
    bool _798 = isnan(_646);
    bool _800 = _796 || _798;
    bool _802 = isnan(1.0);
    bool _804 = _800 || _802;
    float _886;
    float _898;
    float _900;
    float _902;
    float _1042;
    float _1072;
    float _1092;
    float _1110;
    float _1112;
    float _1116;
    float _1124;
    float _1126;
    float _1130;
    float _1134;
    float _1138;
    float _1142;
    float _1146;
    float _1148;
    if (!_686)
    {
        if (_804)
        {
            _592 = 0.60000002384185791015625;
        }
        float _806 = _592;
        float _808 = 0.0;
        if (!_804)
        {
            float _810 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _808 = _810;
        }
        float _812 = _808;
        if (_804)
        {
            _758 = 0.4199999868869781494140625;
        }
        float _814 = _758;
        float _816 = 0.0;
        if (_804)
        {
            _816 = 0.23000000417232513427734375;
        }
        float _818 = _816;
        float _820 = 0.0;
        if (!_804)
        {
            float _822 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _820 = _822;
        }
        float _824 = _820;
        float _826 = _806;
        if (!_804)
        {
            float _828 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _826 = _828;
        }
        float _830 = _826;
        float _832 = _814;
        if (!_804)
        {
            float _834 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _832 = _834;
        }
        float _836 = _832;
        float _838 = 0.0;
        if (_804)
        {
            _838 = 0.1500000059604644775390625;
        }
        float _840 = _838;
        float _842 = _818;
        if (!_804)
        {
            float _844 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _842 = _844;
        }
        float _846 = _842;
        float _848 = _840;
        if (!_804)
        {
            float _850 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _848 = _850;
        }
        float _852 = _848;
        float _854 = 0.0;
        if (!_804)
        {
            float _856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _854 = _856;
        }
        float _858 = _854;
        float _860 = 0.0;
        if (!_804)
        {
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _860 = _862;
        }
        float _864 = _860;
        if (_804)
        {
            _720 = 0.60000002384185791015625;
        }
        float _866 = _720;
        float _868 = _532 * _830;
        float _870 = _866;
        float _872 = _830;
        if (!_804)
        {
            _870 = _830;
        }
        float _874 = _870;
        float _876 = _874;
        if (_804)
        {
            _872 = 0.4199999868869781494140625;
        }
        float _878 = _872;
        float _880 = _532 * _836;
        float _882 = 1.0 / _868;
        float _884 = _878;
        _886 = _812;
        if (!_804)
        {
            _884 = _836;
        }
        float _888 = _884;
        float _890 = _532 * _846;
        float _892 = _532 * _874;
        float _894 = 1.0 / _880;
        float _896 = _888;
        _898 = _824;
        _900 = _858;
        _902 = _864;
        if (_804)
        {
            _876 = 0.23000000417232513427734375;
        }
        float _904 = _876;
        float _906 = _532 * _852;
        float _908 = _904;
        if (!_804)
        {
            _908 = _846;
        }
        float _910 = _908;
        float _912 = _794 * 6.283184051513671875;
        float _914 = _532 * _888;
        float _916 = 1.0 / _890;
        if (_804)
        {
            _896 = 0.1500000059604644775390625;
        }
        float _918 = _896;
        float _920 = _882 * _912;
        float _922 = _918;
        if (!_804)
        {
            _922 = _852;
        }
        float _924 = _922;
        float _926 = 1.0 / _914;
        float _928 = _532 * _910;
        float _930 = _920 * 0.15915493667125701904296875;
        float _932 = 1.0 / _906;
        float _934 = _894 * _912;
        float _936 = 1.0 / _892;
        float _938 = _532 * _924;
        float _940 = _934 * 0.15915493667125701904296875;
        float _942 = _916 * _912;
        float _944 = _790 * _926;
        float _946 = 1.0 / _928;
        float _948 = _942 * 0.15915493667125701904296875;
        float _950 = _932 * _912;
        float _952 = _944 * 6.283184051513671875;
        float _954 = 1.0 / _938;
        float _956 = _950 * 0.15915493667125701904296875;
        float _958 = _790 * _936;
        float _960 = _952 * 0.15915493667125701904296875;
        float _962 = _940 * 6.283185482025146484375;
        float _964 = sin(_962);
        float _966 = _958 * 6.283184051513671875;
        float _968 = _790 * _946;
        float _970 = _946;
        float _972 = _968;
        if (_804)
        {
            _970 = 3.0;
        }
        float _974 = _970;
        float _976 = _966 * 0.15915493667125701904296875;
        float _978 = _960 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _790 * _954;
        float _984 = _968 * 6.283184051513671875;
        float _986 = _974;
        float _988 = _984;
        if (!_804)
        {
            _986 = _812;
        }
        float _990 = _986;
        float _992 = _982 * 6.283184051513671875;
        float _994 = _930 * 6.283185482025146484375;
        float _996 = sin(_994);
        float _998 = _984 * 0.15915493667125701904296875;
        float _1000 = _964 * _990;
        float _1002 = _992 * 0.15915493667125701904296875;
        float _1004 = _992;
        float _1006 = _998;
        float _1008 = _1000;
        if (_804)
        {
            _972 = 3.0;
        }
        float _1010 = _972;
        float _1012 = _976 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        float _1016 = _1010;
        if (!_804)
        {
            _1016 = _812;
        }
        float _1018 = _1016;
        float _1020 = _1018;
        if (_804)
        {
            _988 = 4.0;
        }
        float _1022 = _988;
        float _1024 = _948 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        float _1028 = _1022;
        if (!_804)
        {
            _1028 = _824;
        }
        float _1030 = _1028;
        float _1032 = _980 * _1018;
        float _1034 = _998 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1030;
        float _1040 = _1032;
        _1042 = _980;
        if (_804)
        {
            _1020 = 4.0;
        }
        float _1044 = _1020;
        float _1046 = _1044;
        if (!_804)
        {
            _1046 = _824;
        }
        float _1048 = _1046;
        float _1050 = _956 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = fma(_996, _1030, _1000);
        float _1056 = _1054;
        if (_804)
        {
            _1004 = 2.0;
        }
        float _1058 = _1004;
        float _1060 = _1002 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058;
        if (_804)
        {
            _1038 = 2.0;
        }
        float _1066 = _1038;
        float _1068 = fma(_1014, _1048, _1032);
        float _1070 = _1066;
        _1072 = _1014;
        if (!_804)
        {
            _1064 = _858;
        }
        float _1074 = _1064;
        if (!_804)
        {
            _1070 = _858;
        }
        float _1076 = _1070;
        float _1078 = _1076;
        if (_804)
        {
            _1006 = 1.5;
        }
        float _1080 = _1006;
        float _1082 = _1080;
        if (_804)
        {
            _1008 = 1.5;
        }
        float _1084 = _1008;
        float _1086 = fma(_1026, _1074, _1054);
        float _1088 = _1084;
        float _1090 = _1086;
        _1092 = _1026;
        if (!_804)
        {
            _1082 = _864;
        }
        float _1094 = _1082;
        float _1096 = fma(_1036, _1076, _1068);
        float _1098 = _1094;
        float _1100 = _1036;
        if (!_804)
        {
            _1088 = _864;
        }
        float _1102 = _1088;
        float _1104 = fma(_1052, _1094, _1086);
        float _1106 = fma(_1062, _1102, _1096);
        float _1108 = _1102;
        _1110 = _1062;
        _1112 = _1104;
        if (_804)
        {
            _1090 = 1.5;
        }
        float _1114 = _1090;
        _1116 = _1114;
        if (_804)
        {
            _1098 = 2.0;
        }
        float _1118 = _1098;
        float _1120 = -_1106;
        float _1122 = _1104 + _1120;
        _1124 = _1118;
        _1126 = _1122;
        if (_804)
        {
            _1108 = 3.0;
        }
        float _1128 = _1108;
        _1130 = _1128;
        if (_804)
        {
            _1078 = 4.0;
        }
        float _1132 = _1078;
        _1134 = _1132;
        if (_804)
        {
            _1056 = 0.1500000059604644775390625;
        }
        float _1136 = _1056;
        _1138 = _1136;
        if (_804)
        {
            _1040 = 0.23000000417232513427734375;
        }
        float _1140 = _1040;
        _1142 = _1140;
        if (_804)
        {
            _1100 = 0.4199999868869781494140625;
        }
        float _1144 = _1100;
        _1146 = _1144;
        _1148 = 0.0;
        _1150 = true;
    }
    else
    {
        if (_804)
        {
            _760 = 0.4199999868869781494140625;
        }
        float _1152 = _760;
        float _1154 = 0.0;
        if (!_804)
        {
            float _1156 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1154 = _1156;
        }
        float _1158 = _1154;
        float _1160 = 0.0;
        if (_804)
        {
            _1160 = 0.60000002384185791015625;
        }
        float _1162 = _1160;
        float _1164 = 0.0;
        if (_804)
        {
            _1164 = 0.23000000417232513427734375;
        }
        float _1166 = _1164;
        float _1168 = 0.0;
        if (!_804)
        {
            float _1170 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1168 = _1170;
        }
        float _1172 = _1168;
        float _1174 = _1152;
        if (!_804)
        {
            float _1176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1174 = _1176;
        }
        float _1178 = _1174;
        float _1180 = 0.0;
        if (_804)
        {
            _1180 = 0.1500000059604644775390625;
        }
        float _1182 = _1180;
        float _1184 = _1162;
        if (!_804)
        {
            float _1186 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1184 = _1186;
        }
        float _1188 = _1184;
        float _1190 = _1166;
        if (!_804)
        {
            float _1192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1190 = _1192;
        }
        float _1194 = _1190;
        float _1196 = _1182;
        if (!_804)
        {
            float _1198 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1196 = _1198;
        }
        float _1200 = _1196;
        float _1202 = 0.0;
        if (!_804)
        {
            float _1204 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1202 = _1204;
        }
        float _1206 = _1202;
        float _1208 = 0.0;
        if (!_804)
        {
            float _1210 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1208 = _1210;
        }
        float _1212 = _1208;
        if (_804)
        {
            _722 = 0.4199999868869781494140625;
        }
        float _1214 = _722;
        float _1216 = _1214;
        if (_804)
        {
            _594 = 0.4199999868869781494140625;
        }
        float _1218 = _594;
        float _1220 = _640 * 6.283184051513671875;
        float _1222 = _1218;
        float _1224 = _1178;
        if (!_804)
        {
            _1216 = _1178;
        }
        float _1226 = _1216;
        float _1228 = _532 * _1178;
        float _1230 = _1226;
        if (!_804)
        {
            _1222 = _1178;
        }
        float _1232 = _1222;
        float _1234 = _532 * _1226;
        float _1236 = _1232;
        if (_804)
        {
            _1230 = 0.4199999868869781494140625;
        }
        float _1238 = _1230;
        float _1240 = 1.0 / _1228;
        float _1242 = _1238;
        if (!_804)
        {
            _1242 = _1178;
        }
        float _1244 = _1242;
        float _1246 = _532 * _1188;
        float _1248 = _1244;
        _886 = _1158;
        if (_804)
        {
            _1224 = 0.60000002384185791015625;
        }
        float _1250 = _1224;
        float _1252 = _532 * _1194;
        float _1254 = _1250;
        if (!_804)
        {
            _1254 = _1188;
        }
        float _1256 = _1254;
        float _1258 = _532 * _1232;
        float _1260 = _1256;
        if (_804)
        {
            _1236 = 0.60000002384185791015625;
        }
        float _1262 = _1236;
        float _1264 = _1262;
        if (!_804)
        {
            _1264 = _1188;
        }
        float _1266 = _1264;
        float _1268 = _532 * _1244;
        float _1270 = 1.0 / _1246;
        float _1272 = _1266;
        if (_804)
        {
            _1248 = 0.60000002384185791015625;
        }
        float _1274 = _1248;
        float _1276 = _1274;
        if (!_804)
        {
            _1276 = _1188;
        }
        float _1278 = _1276;
        float _1280 = _532 * _1200;
        float _1282 = 1.0 / _1252;
        float _1284 = _532 * _1256;
        float _1286 = _1278;
        _898 = _1172;
        _900 = _1206;
        _902 = _1212;
        if (_804)
        {
            _1260 = 0.23000000417232513427734375;
        }
        float _1288 = _1260;
        float _1290 = _1288;
        if (!_804)
        {
            _1290 = _1194;
        }
        float _1292 = _1290;
        float _1294 = _532 * _1266;
        float _1296 = _1292;
        if (_804)
        {
            _1272 = 0.23000000417232513427734375;
        }
        float _1298 = _1272;
        float _1300 = 1.0 / _1268;
        float _1302 = _1298;
        if (!_804)
        {
            _1302 = _1194;
        }
        float _1304 = _1302;
        float _1306 = 1.0 / _1234;
        float _1308 = 1.0 / _1258;
        float _1310 = _532 * _1278;
        float _1312 = _1304;
        if (_804)
        {
            _1286 = 0.23000000417232513427734375;
        }
        float _1314 = _1286;
        float _1316 = _1314;
        if (!_804)
        {
            _1316 = _1194;
        }
        float _1318 = _1316;
        float _1320 = _794 * 6.283184051513671875;
        float _1322 = 1.0 / _1280;
        float _1324 = _532 * _1292;
        float _1326 = _532 * _1318;
        float _1328 = 1.0 / _1294;
        float _1330 = _532 * _1304;
        float _1332 = _1318;
        if (_804)
        {
            _1312 = 0.1500000059604644775390625;
        }
        float _1334 = _1312;
        float _1336 = _1334;
        if (!_804)
        {
            _1336 = _1200;
        }
        float _1338 = _1336;
        float _1340 = 1.0 / _1284;
        if (_804)
        {
            _1332 = 0.1500000059604644775390625;
        }
        float _1342 = _1332;
        float _1344 = _1342;
        if (!_804)
        {
            _1344 = _1200;
        }
        float _1346 = _1344;
        float _1348 = 1.0 / _1324;
        if (_804)
        {
            _1296 = 0.1500000059604644775390625;
        }
        float _1350 = _1296;
        float _1352 = 1.0 / _1310;
        float _1354 = _1240 * _1320;
        float _1356 = _1350;
        if (!_804)
        {
            _1356 = _1200;
        }
        float _1358 = _1356;
        float _1360 = _532 * _1346;
        float _1362 = 1.0 / _1330;
        float _1364 = _532 * _1338;
        float _1366 = _1354 * 0.15915493667125701904296875;
        float _1368 = _1270 * _1320;
        float _1370 = _640 + _664;
        float _1372 = _1300 * _1220;
        float _1374 = _1368 * 0.15915493667125701904296875;
        float _1376 = _1370 * 6.283184051513671875;
        float _1378 = _1282 * _1320;
        float _1380 = _1372 * 0.15915493667125701904296875;
        float _1382 = _1366 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1328 * _1376;
        float _1388 = _532 * _1358;
        float _1390 = _1378 * 0.15915493667125701904296875;
        float _1392 = _1308 * _1376;
        float _1394 = _1322 * _1320;
        float _1396 = _1386 * 0.15915493667125701904296875;
        float _1398 = 1.0 / _1326;
        float _1400 = _1352 * _1220;
        float _1402 = _1392 * 0.15915493667125701904296875;
        float _1404 = _790 * _1306;
        float _1406 = _1400 * 0.15915493667125701904296875;
        float _1408 = 1.0 / _1364;
        float _1410 = _1400;
        float _1412 = _1364;
        if (_804)
        {
            _1410 = 3.0;
        }
        float _1414 = _1410;
        float _1416 = _1404 * 6.283184051513671875;
        float _1418 = _1414;
        if (!_804)
        {
            _1418 = _1158;
        }
        float _1420 = _1418;
        float _1422 = _1380 * 6.283185482025146484375;
        float _1424 = sin(_1422);
        float _1426 = _1416 * 0.15915493667125701904296875;
        float _1428 = _1384 * _1420;
        float _1430 = _1420;
        if (_804)
        {
            _1430 = 3.0;
        }
        float _1432 = _1430;
        float _1434 = _1432;
        if (!_804)
        {
            _1434 = _1158;
        }
        float _1436 = _1434;
        float _1438 = 1.0 / _1360;
        float _1440 = _1398 * _1220;
        float _1442 = _1426 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = _1424 * _1436;
        float _1448 = _1440 * 0.15915493667125701904296875;
        float _1450 = _1408 * _1376;
        float _1452 = _790 * _1340;
        float _1454 = _1406 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = _1450 * 0.15915493667125701904296875;
        float _1460 = _1452 * 6.283184051513671875;
        float _1462 = _1452;
        if (_804)
        {
            _1412 = 3.0;
        }
        float _1464 = _1412;
        float _1466 = 1.0 / _1388;
        float _1468 = _1464;
        if (!_804)
        {
            _1468 = _1158;
        }
        float _1470 = _1468;
        float _1472 = _1460 * 0.15915493667125701904296875;
        float _1474 = _1374 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1470;
        if (_804)
        {
            _1462 = 4.0;
        }
        float _1480 = _1462;
        float _1482 = _1362 * _1376;
        float _1484 = _1480;
        float _1486 = _1482;
        if (!_804)
        {
            _1484 = _1172;
        }
        float _1488 = _1484;
        float _1490 = _1402 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1444 * _1470;
        float _1496 = _790 * _1348;
        float _1498 = _1496;
        if (_804)
        {
            _1478 = 4.0;
        }
        float _1500 = _1478;
        float _1502 = _1482 * 0.15915493667125701904296875;
        float _1504 = _1500;
        if (!_804)
        {
            _1504 = _1172;
        }
        float _1506 = _1504;
        float _1508 = fma(_1456, _1488, _1446);
        float _1510 = _1396 * 6.283185482025146484375;
        float _1512 = sin(_1510);
        if (_804)
        {
            _1486 = 3.0;
        }
        float _1514 = _1486;
        float _1516 = _1496 * 6.283184051513671875;
        float _1518 = _1514;
        float _1520 = _1516;
        if (!_804)
        {
            _1518 = _1158;
        }
        float _1522 = _1518;
        float _1524 = _1472 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = _790 * _1466;
        float _1530 = fma(_1476, _1506, _1428);
        float _1532 = _1516 * 0.15915493667125701904296875;
        float _1534 = _1492 * _1522;
        float _1536 = _1438 * _1220;
        float _1538 = _1528 * 6.283184051513671875;
        float _1540 = _1522;
        float _1542 = _1466;
        float _1544 = _1538;
        float _1546 = _1530;
        _1042 = _1492;
        if (_804)
        {
            _1540 = 4.0;
        }
        float _1548 = _1540;
        float _1550 = _1390 * 6.283185482025146484375;
        float _1552 = sin(_1550);
        float _1554 = _1548;
        if (_804)
        {
            _1542 = 4.0;
        }
        float _1556 = _1542;
        float _1558 = _1394 * 0.15915493667125701904296875;
        float _1560 = _1556;
        if (!_804)
        {
            _1554 = _1172;
        }
        float _1562 = _1554;
        float _1564 = _1562;
        if (!_804)
        {
            _1560 = _1172;
        }
        float _1566 = _1560;
        float _1568 = _1502 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        float _1572 = _1536 * 0.15915493667125701904296875;
        float _1574 = _1538 * 0.15915493667125701904296875;
        float _1576 = _1448 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = fma(_1512, _1562, _1534);
        float _1582 = fma(_1526, _1566, _1494);
        float _1584 = _1532 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1566;
        float _1590 = _1574;
        if (_804)
        {
            _1564 = 2.0;
        }
        float _1592 = _1564;
        float _1594 = _1592;
        if (_804)
        {
            _1498 = 2.0;
        }
        float _1596 = _1498;
        float _1598 = _1596;
        if (_804)
        {
            _1520 = 2.0;
        }
        float _1600 = _1520;
        float _1602 = _1558 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600;
        if (!_804)
        {
            _1594 = _1206;
        }
        float _1608 = _1594;
        float _1610 = _1608;
        if (!_804)
        {
            _1598 = _1206;
        }
        float _1612 = _1598;
        float _1614 = _1458 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612;
        if (!_804)
        {
            _1606 = _1206;
        }
        float _1620 = _1606;
        float _1622 = _1572 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        float _1626 = _1620;
        if (_804)
        {
            _1588 = 2.0;
        }
        float _1628 = _1588;
        float _1630 = _1574 * 6.283185482025146484375;
        float _1632 = sin(_1630);
        float _1634 = _1628;
        if (!_804)
        {
            _1634 = _1206;
        }
        float _1636 = _1634;
        float _1638 = fma(_1552, _1608, _1530);
        float _1640 = fma(_1570, _1612, _1580);
        float _1642 = fma(_1578, _1620, _1508);
        _1092 = _1638;
        _1148 = _1570;
        if (_804)
        {
            _1544 = 1.5;
        }
        float _1644 = _1544;
        float _1646 = _1644;
        if (_804)
        {
            _1610 = 1.5;
        }
        float _1648 = _1610;
        float _1650 = _1648;
        if (_804)
        {
            _1618 = 1.5;
        }
        float _1652 = _1618;
        float _1654 = _1652;
        if (_804)
        {
            _1626 = 1.5;
        }
        float _1656 = _1626;
        float _1658 = fma(_1586, _1636, _1582);
        float _1660 = _1656;
        _1072 = _1624;
        if (!_804)
        {
            _1646 = _1212;
        }
        float _1662 = _1646;
        if (!_804)
        {
            _1654 = _1212;
        }
        float _1664 = _1654;
        float _1666 = _1664;
        if (!_804)
        {
            _1660 = _1212;
        }
        float _1668 = _1660;
        if (!_804)
        {
            _1650 = _1212;
        }
        float _1670 = _1650;
        float _1672 = fma(_1604, _1662, _1638);
        float _1674 = fma(_1616, _1664, _1640);
        float _1676 = fma(_1624, _1668, _1642);
        float _1678 = fma(_1632, _1670, _1658);
        float _1680 = -_1674;
        float _1682 = _1680 + _1676;
        float _1684 = -_1678;
        float _1686 = _1672 + _1684;
        float _1688 = _1678;
        float _1690 = _1670;
        float _1692 = _1604;
        _1146 = _1686;
        _1110 = _1632;
        _1112 = _1674;
        if (_804)
        {
            _1688 = 1.5;
        }
        float _1694 = _1688;
        _1116 = _1694;
        if (_804)
        {
            _1690 = 2.0;
        }
        float _1696 = _1690;
        float _1698 = _1686 + _1682;
        _1124 = _1696;
        _1126 = _1698;
        if (_804)
        {
            _1692 = 3.0;
        }
        float _1700 = _1692;
        _1130 = _1700;
        if (_804)
        {
            _1666 = 4.0;
        }
        float _1702 = _1666;
        _1134 = _1702;
        if (_804)
        {
            _1546 = 0.1500000059604644775390625;
        }
        float _1704 = _1546;
        _1138 = _1704;
        if (_804)
        {
            _1590 = 0.23000000417232513427734375;
        }
        float _1706 = _1590;
        _1142 = _1706;
        if (_804)
        {
            _1146 = 0.4199999868869781494140625;
        }
    }
    _1150 = false;
    float _1708 = _1146;
    float _1710 = _1110;
    float _1712 = _1142;
    float _1714 = _1112;
    float _1716 = _1138;
    float _1718 = _1072;
    float _1720 = _1042;
    float _1722 = _1092;
    float _1724 = _1148;
    float _1726 = _1130;
    float _1728 = _886;
    float _1730 = _1134;
    float _1732 = _898;
    float _1734 = _1124;
    float _1736 = _900;
    float _1738 = _1116;
    float _1740 = _902;
    float _1742 = _1126;
    float _1744 = _788 + _642;
    float _1746 = _534 + _1744;
    float _1748 = _1746 + _664;
    float _1750 = _1710;
    float _1752 = _1714;
    float _1754 = _1718;
    float _1756 = _1720;
    float _1758 = _1722;
    float _1760 = _1714;
    float _1762 = _1718;
    float _1764 = _1720;
    float _1766 = _1724;
    float _1768 = _1710;
    float _1770 = _1722;
    float _1772 = _1744;
    float _1774 = _1708;
    float _1776 = _1712;
    float _1778 = _1716;
    float _1780 = _1726;
    float _1782 = _1730;
    float _1784 = _1734;
    float _1786 = _1738;
    float _1788 = _1708;
    float _1790 = _1712;
    float _1792 = _1716;
    float _1794 = _1738;
    float _1796 = _1740;
    float _1798 = _1734;
    float _1800 = _1730;
    float _1802 = _1726;
    float _1986;
    float _2004;
    float _2038;
    float _2062;
    float _2064;
    if (!_686)
    {
        if (_804)
        {
            _1750 = _1708;
        }
        float _1804 = _1750;
        if (_804)
        {
            _1752 = 0.60000002384185791015625;
        }
        float _1806 = _1752;
        float _1808 = _1804;
        if (!_804)
        {
            float _1810 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1808 = _1810;
        }
        float _1812 = _1808;
        if (_804)
        {
            _1754 = _1712;
        }
        float _1814 = _1754;
        float _1816 = _1806;
        if (!_804)
        {
            float _1818 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1816 = _1818;
        }
        float _1820 = _1816;
        if (_804)
        {
            _1756 = _1716;
        }
        float _1822 = _1756;
        float _1824 = _1814;
        if (!_804)
        {
            float _1826 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1824 = _1826;
        }
        float _1828 = _1824;
        float _1830 = _1822;
        if (!_804)
        {
            float _1832 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1830 = _1832;
        }
        float _1834 = _1830;
        if (_804)
        {
            _1758 = _1708;
        }
        float _1836 = _1758;
        float _1838 = _1748 * 6.283184051513671875;
        float _1840 = _532 * _1812;
        float _1842 = _1836;
        float _1844 = _1812;
        if (!_804)
        {
            _1842 = _1812;
        }
        float _1846 = _1842;
        float _1848 = _1846;
        if (_804)
        {
            _1844 = 0.60000002384185791015625;
        }
        float _1850 = _1844;
        float _1852 = 1.0 / _1840;
        float _1854 = _532 * _1820;
        float _1856 = _532 * _1846;
        float _1858 = _1850;
        if (!_804)
        {
            _1858 = _1820;
        }
        float _1860 = _1858;
        float _1862 = _532 * _1828;
        float _1864 = _1860;
        if (_804)
        {
            _1848 = _1712;
        }
        float _1866 = _1848;
        float _1868 = _1866;
        if (!_804)
        {
            _1868 = _1828;
        }
        float _1870 = _1868;
        float _1872 = 1.0 / _1854;
        float _1874 = _532 * _1834;
        float _1876 = _532 * _1860;
        if (_804)
        {
            _1864 = _1716;
        }
        float _1878 = _1864;
        float _1880 = _1878;
        if (!_804)
        {
            _1880 = _1834;
        }
        float _1882 = _1880;
        float _1884 = 1.0 / _1862;
        float _1886 = _1852 * _1838;
        float _1888 = 1.0 / _1856;
        float _1890 = _532 * _1870;
        float _1892 = _1886 * 0.15915493667125701904296875;
        float _1894 = _1872 * _1838;
        float _1896 = 1.0 / _1874;
        float _1898 = 1.0 / _1876;
        float _1900 = _532 * _1882;
        float _1902 = _1894 * 0.15915493667125701904296875;
        float _1904 = _1884 * _1838;
        float _1906 = _1904 * 0.15915493667125701904296875;
        float _1908 = 1.0 / _1890;
        float _1910 = _1744 * _1888;
        float _1912 = _1896 * _1838;
        float _1914 = _1910 * 6.283184051513671875;
        float _1916 = _1912 * 0.15915493667125701904296875;
        float _1918 = 1.0 / _1900;
        float _1920 = _1744 * _1898;
        float _1922 = _1914 * 0.15915493667125701904296875;
        float _1924 = _1920 * 6.283184051513671875;
        float _1926 = _1744 * _1908;
        float _1928 = _1892 * 6.283185482025146484375;
        float _1930 = sin(_1928);
        float _1932 = _1924 * 0.15915493667125701904296875;
        float _1934 = _1908;
        float _1936 = _1926;
        if (_804)
        {
            _1934 = _1726;
        }
        float _1938 = _1934;
        float _1940 = _1926 * 6.283184051513671875;
        float _1942 = _1938;
        float _1944 = _1940;
        if (_804)
        {
            _1936 = _1726;
        }
        float _1946 = _1936;
        float _1948 = _1946;
        if (!_804)
        {
            _1942 = _1728;
        }
        float _1950 = _1942;
        float _1952 = _1744 * _1918;
        float _1954 = _1922 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        float _1958 = _1940 * 0.15915493667125701904296875;
        float _1960 = _1950;
        if (!_804)
        {
            _1948 = _1728;
        }
        float _1962 = _1948;
        float _1964 = _1952 * 6.283184051513671875;
        float _1966 = _1964;
        float _1968 = _1962;
        if (_804)
        {
            _1944 = _1730;
        }
        float _1970 = _1944;
        float _1972 = _1970;
        if (!_804)
        {
            _1972 = _1732;
        }
        float _1974 = _1972;
        float _1976 = _1964 * 0.15915493667125701904296875;
        float _1978 = _1902 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        float _1982 = _1930 * _1950;
        float _1984 = _1974;
        _1986 = _1930;
        if (_804)
        {
            _1960 = _1734;
        }
        float _1988 = _1960;
        float _1990 = _1988;
        if (!_804)
        {
            _1990 = _1736;
        }
        float _1992 = _1990;
        if (_804)
        {
            _1966 = _1738;
        }
        float _1994 = _1966;
        float _1996 = _1932 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = _1956 * _1962;
        float _2002 = _1994;
        _2004 = _1956;
        if (_804)
        {
            _1968 = _1730;
        }
        float _2006 = _1968;
        float _2008 = _2006;
        if (!_804)
        {
            _2008 = _1732;
        }
        float _2010 = _2008;
        if (!_804)
        {
            _2002 = _1740;
        }
        float _2012 = _2002;
        float _2014 = _1906 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = fma(_1980, _1974, _1982);
        float _2020 = _1980;
        if (_804)
        {
            _1984 = _1734;
        }
        float _2022 = _1984;
        float _2024 = _2022;
        if (!_804)
        {
            _2024 = _1736;
        }
        float _2026 = _2024;
        if (_804)
        {
            _2020 = _1738;
        }
        float _2028 = _2020;
        float _2030 = _1958 * 6.283185482025146484375;
        float _2032 = sin(_2030);
        float _2034 = fma(_1998, _2010, _2000);
        float _2036 = _2028;
        _2038 = _1998;
        if (!_804)
        {
            _2036 = _1740;
        }
        float _2040 = _2036;
        float _2042 = _1916 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = fma(_2016, _1992, _2018);
        float _2048 = _1976 * 6.283185482025146484375;
        float _2050 = sin(_2048);
        float _2052 = fma(_2032, _2026, _2034);
        float _2054 = fma(_2044, _2040, _2046);
        float _2056 = fma(_2050, _2012, _2052);
        float _2058 = -_2056;
        float _2060 = _2054 + _2058;
        _2062 = _2054;
        _2064 = _2060;
        _2066 = true;
    }
    else
    {
        if (_804)
        {
            _1760 = _1708;
        }
        float _2068 = _1760;
        if (_804)
        {
            _1762 = 0.60000002384185791015625;
        }
        float _2070 = _1762;
        float _2072 = _2068;
        if (!_804)
        {
            float _2074 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2072 = _2074;
        }
        float _2076 = _2072;
        if (_804)
        {
            _1764 = _1712;
        }
        float _2078 = _1764;
        float _2080 = _2070;
        if (!_804)
        {
            float _2082 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2080 = _2082;
        }
        float _2084 = _2080;
        if (_804)
        {
            _1766 = _1716;
        }
        float _2086 = _1766;
        float _2088 = _2078;
        if (!_804)
        {
            float _2090 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2088 = _2090;
        }
        float _2092 = _2088;
        float _2094 = _2086;
        if (!_804)
        {
            float _2096 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2094 = _2096;
        }
        float _2098 = _2094;
        if (_804)
        {
            _1768 = _1708;
        }
        float _2100 = _1768;
        float _2102 = _2100;
        if (_804)
        {
            _1770 = _1708;
        }
        float _2104 = _1770;
        float _2106 = _2104;
        float _2108 = _2076;
        if (!_804)
        {
            _2102 = _2076;
        }
        float _2110 = _2102;
        float _2112 = _532 * _2076;
        float _2114 = _2110;
        if (!_804)
        {
            _2106 = _2076;
        }
        float _2116 = _2106;
        float _2118 = _532 * _2084;
        float _2120 = _532 * _2110;
        float _2122 = _2116;
        if (_804)
        {
            _2114 = _1708;
        }
        float _2124 = _2114;
        float _2126 = 1.0 / _2112;
        float _2128 = _2124;
        if (!_804)
        {
            _2128 = _2076;
        }
        float _2130 = _2128;
        float _2132 = _532 * _2092;
        float _2134 = _2130;
        if (_804)
        {
            _2108 = 0.60000002384185791015625;
        }
        float _2136 = _2108;
        float _2138 = _532 * _2098;
        float _2140 = _532 * _2130;
        float _2142 = _2136;
        if (_804)
        {
            _2134 = 0.60000002384185791015625;
        }
        float _2144 = _2134;
        float _2146 = 1.0 / _2118;
        float _2148 = _2144;
        if (!_804)
        {
            _2142 = _2084;
        }
        float _2150 = _2142;
        float _2152 = _2150;
        if (!_804)
        {
            _2148 = _2084;
        }
        float _2154 = _2148;
        float _2156 = 1.0 / _2132;
        float _2158 = _532 * _2116;
        float _2160 = _2154;
        if (_804)
        {
            _2122 = 0.60000002384185791015625;
        }
        float _2162 = _2122;
        float _2164 = _2162;
        if (!_804)
        {
            _2164 = _2084;
        }
        float _2166 = _2164;
        float _2168 = 1.0 / _2138;
        float _2170 = _532 * _2166;
        float _2172 = _532 * _2154;
        float _2174 = _2166;
        if (_804)
        {
            _2174 = _1712;
        }
        float _2176 = _2174;
        float _2178 = _2176;
        if (!_804)
        {
            _2178 = _2092;
        }
        float _2180 = _2178;
        float _2182 = _2180;
        if (_804)
        {
            _2160 = _1712;
        }
        float _2184 = _2160;
        float _2186 = 1.0 / _2158;
        float _2188 = _532 * _2150;
        float _2190 = _2184;
        if (_804)
        {
            _2152 = _1712;
        }
        float _2192 = _2152;
        float _2194 = _2192;
        if (!_804)
        {
            _2194 = _2092;
        }
        float _2196 = _2194;
        float _2198 = _2196;
        if (!_804)
        {
            _2190 = _2092;
        }
        float _2200 = _2190;
        float _2202 = 1.0 / _2120;
        float _2204 = _532 * _2196;
        float _2206 = _2200;
        if (_804)
        {
            _2198 = _1716;
        }
        float _2208 = _2198;
        float _2210 = _2208;
        if (!_804)
        {
            _2210 = _2098;
        }
        float _2212 = _2210;
        float _2214 = 1.0 / _2170;
        float _2216 = _532 * _2180;
        if (_804)
        {
            _2182 = _1716;
        }
        float _2218 = _2182;
        float _2220 = _2218;
        if (!_804)
        {
            _2220 = _2098;
        }
        float _2222 = _2220;
        float _2224 = 1.0 / _2140;
        float _2226 = _532 * _2200;
        if (_804)
        {
            _2206 = _1716;
        }
        float _2228 = _2206;
        float _2230 = _532 * _2222;
        float _2232 = _2228;
        if (!_804)
        {
            _2232 = _2098;
        }
        float _2234 = _2232;
        float _2236 = _1748 * 6.283184051513671875;
        float _2238 = 1.0 / _2216;
        float _2240 = _532 * _2234;
        float _2242 = 1.0 / _2226;
        float _2244 = _642 + _664;
        float _2246 = 1.0 / _2172;
        float _2248 = _2126 * _2236;
        float _2250 = _2244 * 6.283184051513671875;
        float _2252 = _2248 * 0.15915493667125701904296875;
        float _2254 = _2186 * _2250;
        float _2256 = _2146 * _2236;
        float _2258 = _642 * 6.283184051513671875;
        float _2260 = _532 * _2212;
        float _2262 = 1.0 / _2240;
        float _2264 = _2256 * 0.15915493667125701904296875;
        float _2266 = _2224 * _2258;
        float _2268 = _2156 * _2236;
        float _2270 = _2254 * 0.15915493667125701904296875;
        float _2272 = _1744 * _2202;
        float _2274 = _2268 * 0.15915493667125701904296875;
        float _2276 = _2252 * 6.283185482025146484375;
        float _2278 = sin(_2276);
        float _2280 = _2266 * 0.15915493667125701904296875;
        float _2282 = _2214 * _2250;
        float _2284 = _2272 * 6.283184051513671875;
        float _2286 = _2168 * _2236;
        float _2288 = _2282 * 0.15915493667125701904296875;
        float _2290 = _2246 * _2258;
        float _2292 = 1.0 / _2230;
        float _2294 = _2286 * 0.15915493667125701904296875;
        float _2296 = _2290 * 0.15915493667125701904296875;
        float _2298 = _2290;
        if (_804)
        {
            _2298 = _1726;
        }
        float _2300 = _2298;
        float _2302 = _2300;
        if (!_804)
        {
            _2302 = _1728;
        }
        float _2304 = _2302;
        float _2306 = _2270 * 6.283185482025146484375;
        float _2308 = sin(_2306);
        float _2310 = _2284 * 0.15915493667125701904296875;
        float _2312 = _2238 * _2250;
        float _2314 = _2278 * _2304;
        float _2316 = _2278;
        float _2318 = _2304;
        float _2320 = _2312;
        if (_804)
        {
            _2316 = _1726;
        }
        float _2322 = _2316;
        float _2324 = _2322;
        if (_804)
        {
            _2318 = _1726;
        }
        float _2326 = _2318;
        float _2328 = _2312 * 0.15915493667125701904296875;
        float _2330 = _2280 * 6.283185482025146484375;
        float _2332 = sin(_2330);
        float _2334 = _2326;
        if (!_804)
        {
            _2324 = _1728;
        }
        float _2336 = _2324;
        float _2338 = _2292 * _2250;
        float _2340 = _2336;
        if (!_804)
        {
            _2334 = _1728;
        }
        float _2342 = _2334;
        if (_804)
        {
            _2320 = _1726;
        }
        float _2344 = _2320;
        float _2346 = _2338 * 0.15915493667125701904296875;
        float _2348 = _2344;
        if (!_804)
        {
            _2348 = _1728;
        }
        float _2350 = _2348;
        float _2352 = 1.0 / _2188;
        float _2354 = _2242 * _2258;
        float _2356 = _2354 * 0.15915493667125701904296875;
        float _2358 = _2308 * _2336;
        if (_804)
        {
            _2340 = _1730;
        }
        float _2360 = _2340;
        float _2362 = _2310 * 6.283185482025146484375;
        float _2364 = sin(_2362);
        float _2366 = _2332 * _2342;
        float _2368 = _2360;
        if (!_804)
        {
            _2368 = _1732;
        }
        float _2370 = _2368;
        float _2372 = 1.0 / _2204;
        float _2374 = _1744 * _2352;
        float _2376 = _2352;
        float _2378 = _2374;
        if (_804)
        {
            _2376 = _1730;
        }
        float _2380 = _2376;
        float _2382 = _2380;
        if (!_804)
        {
            _2382 = _1732;
        }
        float _2384 = _2382;
        float _2386 = _2296 * 6.283185482025146484375;
        float _2388 = sin(_2386);
        float _2390 = _2364 * _2350;
        float _2392 = _2374 * 6.283184051513671875;
        if (_804)
        {
            _2378 = _1730;
        }
        float _2394 = _2378;
        float _2396 = _2394;
        if (!_804)
        {
            _2396 = _1732;
        }
        float _2398 = _2396;
        float _2400 = _2392 * 0.15915493667125701904296875;
        float _2402 = _2288 * 6.283185482025146484375;
        float _2404 = sin(_2402);
        float _2406 = _1744 * _2372;
        float _2408 = 1.0 / _2260;
        float _2410 = fma(_2388, _2398, _2366);
        float _2412 = _2406 * 6.283184051513671875;
        float _2414 = _2406;
        float _2416 = _2412;
        if (_804)
        {
            _2414 = _1734;
        }
        float _2418 = _2414;
        float _2420 = _2418;
        if (!_804)
        {
            _2420 = _1736;
        }
        float _2422 = _2420;
        float _2424 = _2264 * 6.283185482025146484375;
        float _2426 = sin(_2424);
        float _2428 = fma(_2404, _2370, _2358);
        float _2430 = _2274 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = _1744 * _2408;
        float _2436 = _2408;
        float _2438 = _2422;
        if (_804)
        {
            _2436 = _1734;
        }
        float _2440 = _2436;
        float _2442 = _2440;
        if (!_804)
        {
            _2442 = _1736;
        }
        float _2444 = _2442;
        float _2446 = _2434 * 6.283184051513671875;
        float _2448 = _2446;
        if (_804)
        {
            _1772 = _1730;
        }
        float _2450 = _1772;
        float _2452 = _2356 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = fma(_2426, _2384, _2314);
        float _2458 = _2412 * 0.15915493667125701904296875;
        float _2460 = _2446 * 0.15915493667125701904296875;
        float _2462 = _2450;
        if (!_804)
        {
            _2462 = _1732;
        }
        float _2464 = _2462;
        float _2466 = _2464;
        if (_804)
        {
            _2416 = _1734;
        }
        float _2468 = _2416;
        float _2470 = _2400 * 6.283185482025146484375;
        float _2472 = sin(_2470);
        float _2474 = _2262 * _2258;
        float _2476 = fma(_2432, _2444, _2456);
        float _2478 = _2468;
        float _2480 = _2432;
        if (!_804)
        {
            _2478 = _1736;
        }
        float _2482 = _2478;
        float _2484 = _2474 * 0.15915493667125701904296875;
        float _2486 = _2482;
        if (_804)
        {
            _2448 = _1738;
        }
        float _2488 = _2448;
        float _2490 = _2328 * 6.283185482025146484375;
        float _2492 = sin(_2490);
        float _2494 = fma(_2454, _2482, _2410);
        float _2496 = _2488;
        if (_804)
        {
            _2480 = _1738;
        }
        float _2498 = _2480;
        float _2500 = _2498;
        if (_804)
        {
            _2486 = _1738;
        }
        float _2502 = _2486;
        float _2504 = _2502;
        if (!_804)
        {
            _2496 = _1740;
        }
        float _2506 = _2496;
        float _2508 = _2458 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = fma(_2472, _2464, _2390);
        _1986 = _2506;
        if (_804)
        {
            _2466 = _1734;
        }
        float _2514 = _2466;
        float _2516 = _2514;
        if (!_804)
        {
            _2516 = _1736;
        }
        float _2518 = _2516;
        if (!_804)
        {
            _2504 = _1740;
        }
        float _2520 = _2504;
        float _2522 = _2294 * 6.283185482025146484375;
        float _2524 = sin(_2522);
        float _2526 = fma(_2492, _2422, _2428);
        if (_804)
        {
            _2438 = _1738;
        }
        float _2528 = _2438;
        float _2530 = _2528;
        if (!_804)
        {
            _2530 = _1740;
        }
        float _2532 = _2530;
        if (!_804)
        {
            _2500 = _1740;
        }
        float _2534 = _2500;
        float _2536 = _2346 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        float _2540 = fma(_2510, _2518, _2512);
        float _2542 = _2484 * 6.283185482025146484375;
        float _2544 = sin(_2542);
        float _2546 = fma(_2524, _2506, _2476);
        float _2548 = _2460 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        float _2552 = fma(_2538, _2532, _2526);
        float _2554 = fma(_2544, _2520, _2494);
        float _2556 = -_2552;
        float _2558 = _2556 + _2554;
        float _2560 = fma(_2550, _2534, _2540);
        float _2562 = -_2560;
        float _2564 = _2546 + _2562;
        float _2566 = _2564 + _2558;
        _2062 = _2546;
        _2038 = _2540;
        _2004 = _2558;
        _2064 = _2566;
    }
    _2066 = false;
    float _2568 = _1986;
    float _2570 = _2062;
    float _2572 = _2038;
    float _2574 = _2004;
    float _2576 = _2064;
    float _2578 = _788 + _644;
    float _2580 = _186 * _534;
    float _2582 = _192 * _534;
    float _2584 = _180 * _534;
    float _2586 = _534 + _2578;
    float _2588 = fma(_286, _2580, _164);
    float _2590 = fma(_286, _2582, _170);
    float _2592 = fma(_286, _2584, _158);
    float _2594 = _2586 + _664;
    float _2596 = _2580;
    float _2598 = _2568;
    float _2600 = _2570;
    float _2602 = _2568;
    float _2604 = _2572;
    float _2606 = _2574;
    float _2608 = _2580;
    float _2610 = _2578;
    float _2612 = _2588;
    float _2826;
    if (!_686)
    {
        if (_804)
        {
            _308 = _1708;
        }
        float _2614 = _308;
        if (_804)
        {
            _724 = 0.60000002384185791015625;
        }
        float _2616 = _724;
        float _2618 = _2614;
        if (!_804)
        {
            float _2620 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2618 = _2620;
        }
        float _2622 = _2618;
        if (_804)
        {
            _2596 = _1712;
        }
        float _2624 = _2596;
        float _2626 = _2616;
        if (!_804)
        {
            float _2628 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2626 = _2628;
        }
        float _2630 = _2626;
        if (_804)
        {
            _2598 = _1716;
        }
        float _2632 = _2598;
        float _2634 = _2624;
        if (!_804)
        {
            float _2636 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2634 = _2636;
        }
        float _2638 = _2634;
        float _2640 = _2632;
        if (!_804)
        {
            float _2642 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2640 = _2642;
        }
        float _2644 = _2640;
        float _2646 = _2594 * 6.283184051513671875;
        float _2648 = _532 * _2622;
        float _2650 = _2622;
        if (!_804)
        {
            _1774 = _2622;
        }
        float _2652 = _1774;
        if (_804)
        {
            _2650 = 0.60000002384185791015625;
        }
        float _2654 = _2650;
        float _2656 = _532 * _2630;
        float _2658 = _2654;
        if (!_804)
        {
            _2658 = _2630;
        }
        float _2660 = _2658;
        float _2662 = 1.0 / _2648;
        float _2664 = _532 * _2652;
        float _2666 = _532 * _2638;
        if (!_804)
        {
            _1776 = _2638;
        }
        float _2668 = _1776;
        float _2670 = _532 * _2660;
        float _2672 = _532 * _2644;
        if (!_804)
        {
            _1778 = _2644;
        }
        float _2674 = _1778;
        float _2676 = 1.0 / _2656;
        float _2678 = _532 * _2668;
        float _2680 = 1.0 / _2666;
        float _2682 = _532 * _2674;
        float _2684 = _2662 * _2646;
        float _2686 = _2684 * 0.15915493667125701904296875;
        float _2688 = 1.0 / _2672;
        float _2690 = _2676 * _2646;
        float _2692 = _2690 * 0.15915493667125701904296875;
        float _2694 = 1.0 / _2664;
        float _2696 = _2680 * _2646;
        float _2698 = 1.0 / _2670;
        float _2700 = _2696 * 0.15915493667125701904296875;
        float _2702 = _2688 * _2646;
        float _2704 = _2702 * 0.15915493667125701904296875;
        float _2706 = 1.0 / _2678;
        float _2708 = _2578 * _2694;
        float _2710 = _2708 * 6.283184051513671875;
        float _2712 = 1.0 / _2682;
        float _2714 = _2578 * _2698;
        float _2716 = _2710 * 0.15915493667125701904296875;
        float _2718 = _2714 * 6.283184051513671875;
        float _2720 = _2578 * _2706;
        float _2722 = _2718 * 0.15915493667125701904296875;
        float _2724 = _2686 * 6.283185482025146484375;
        float _2726 = sin(_2724);
        float _2728 = _2718;
        float _2730 = _2682;
        if (_804)
        {
            _2728 = _1726;
        }
        float _2732 = _2728;
        float _2734 = _2720 * 6.283184051513671875;
        float _2736 = _2732;
        float _2738 = _2734;
        if (!_804)
        {
            _2736 = _1728;
        }
        float _2740 = _2736;
        if (!_804)
        {
            _1780 = _1728;
        }
        float _2742 = _1780;
        float _2744 = _2578 * _2712;
        float _2746 = _2734 * 0.15915493667125701904296875;
        float _2748 = _2716 * 6.283185482025146484375;
        float _2750 = sin(_2748);
        float _2752 = _2742;
        if (_804)
        {
            _2738 = _1730;
        }
        float _2754 = _2738;
        float _2756 = _2744 * 6.283184051513671875;
        float _2758 = _2754;
        if (!_804)
        {
            _2758 = _1732;
        }
        float _2760 = _2758;
        if (!_804)
        {
            _1782 = _1732;
        }
        float _2762 = _1782;
        float _2764 = _2756 * 0.15915493667125701904296875;
        if (_804)
        {
            _2730 = _1734;
        }
        float _2766 = _2730;
        float _2768 = _2692 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = _2726 * _2740;
        float _2774 = _2766;
        if (!_804)
        {
            _2774 = _1736;
        }
        float _2776 = _2774;
        if (!_804)
        {
            _1784 = _1736;
        }
        float _2778 = _1784;
        float _2780 = _2722 * 6.283185482025146484375;
        float _2782 = sin(_2780);
        float _2784 = _2750 * _2742;
        if (_804)
        {
            _2752 = _1738;
        }
        float _2786 = _2752;
        float _2788 = _2786;
        if (!_804)
        {
            _2788 = _1740;
        }
        float _2790 = _2788;
        if (!_804)
        {
            _1786 = _1740;
        }
        float _2792 = _1786;
        float _2794 = _2700 * 6.283185482025146484375;
        float _2796 = sin(_2794);
        float _2798 = fma(_2770, _2760, _2772);
        float _2800 = _2746 * 6.283185482025146484375;
        float _2802 = sin(_2800);
        float _2804 = fma(_2782, _2762, _2784);
        float _2806 = _2704 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        float _2810 = fma(_2796, _2776, _2798);
        float _2812 = _2764 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        float _2816 = fma(_2802, _2778, _2804);
        float _2818 = fma(_2808, _2790, _2810);
        float _2820 = fma(_2814, _2792, _2816);
        float _2822 = -_2820;
        float _2824 = _2818 + _2822;
        _2826 = _2824;
        _2828 = true;
    }
    else
    {
        if (_804)
        {
            _2600 = _1708;
        }
        float _2830 = _2600;
        if (_804)
        {
            _2602 = 0.60000002384185791015625;
        }
        float _2832 = _2602;
        if (_804)
        {
            _2604 = _1712;
        }
        float _2834 = _2604;
        float _2836 = _2830;
        if (!_804)
        {
            float _2838 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2836 = _2838;
        }
        float _2840 = _2836;
        float _2842 = _2832;
        if (!_804)
        {
            float _2844 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2842 = _2844;
        }
        float _2846 = _2842;
        if (_804)
        {
            _2606 = _1716;
        }
        float _2848 = _2606;
        float _2850 = _2834;
        if (!_804)
        {
            float _2852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2850 = _2852;
        }
        float _2854 = _2850;
        float _2856 = _2848;
        if (!_804)
        {
            float _2858 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2856 = _2858;
        }
        float _2860 = _2856;
        if (_804)
        {
            _310 = _1708;
        }
        float _2862 = _310;
        float _2864 = _2594 * 6.283184051513671875;
        float _2866 = _2862;
        if (_804)
        {
            _2608 = _1708;
        }
        float _2868 = _2608;
        float _2870 = _644 * 6.283184051513671875;
        float _2872 = _644 + _664;
        float _2874 = _2868;
        if (!_804)
        {
            _2866 = _2840;
        }
        float _2876 = _2866;
        float _2878 = _532 * _2840;
        float _2880 = _2876;
        if (!_804)
        {
            _1788 = _2840;
        }
        float _2882 = _1788;
        float _2884 = _532 * _2846;
        float _2886 = _2882;
        if (!_804)
        {
            _2874 = _2840;
        }
        float _2888 = _2874;
        float _2890 = 1.0 / _2878;
        float _2892 = _532 * _2882;
        float _2894 = _532 * _2854;
        if (_804)
        {
            _2886 = 0.60000002384185791015625;
        }
        float _2896 = _2886;
        float _2898 = _532 * _2888;
        float _2900 = _2896;
        if (!_804)
        {
            _2900 = _2846;
        }
        float _2902 = _2900;
        float _2904 = _532 * _2860;
        float _2906 = 1.0 / _2884;
        float _2908 = 1.0 / _2894;
        float _2910 = _532 * _2876;
        float _2912 = _2902;
        if (_804)
        {
            _2880 = 0.60000002384185791015625;
        }
        float _2914 = _2880;
        float _2916 = _2914;
        if (!_804)
        {
            _2916 = _2846;
        }
        float _2918 = _2916;
        float _2920 = 1.0 / _2904;
        float _2922 = _532 * _2918;
        float _2924 = _2918;
        if (_804)
        {
            _2924 = 0.60000002384185791015625;
        }
        float _2926 = _2924;
        float _2928 = _2926;
        if (!_804)
        {
            _2928 = _2846;
        }
        float _2930 = _2928;
        float _2932 = 1.0 / _2898;
        float _2934 = _532 * _2930;
        float _2936 = _2930;
        if (_804)
        {
            _2936 = _1712;
        }
        float _2938 = _2936;
        float _2940 = _2938;
        if (!_804)
        {
            _2940 = _2854;
        }
        float _2942 = _2940;
        float _2944 = 1.0 / _2910;
        float _2946 = _532 * _2902;
        float _2948 = _2942;
        if (_804)
        {
            _2912 = _1712;
        }
        float _2950 = _2912;
        float _2952 = _532 * _2942;
        float _2954 = _2950;
        if (!_804)
        {
            _2954 = _2854;
        }
        float _2956 = _2954;
        float _2958 = _2956;
        if (!_804)
        {
            _1790 = _2854;
        }
        float _2960 = _1790;
        if (_804)
        {
            _2948 = _1716;
        }
        float _2962 = _2948;
        float _2964 = _532 * _2956;
        float _2966 = _2962;
        if (_804)
        {
            _2958 = _1716;
        }
        float _2968 = _2958;
        float _2970 = 1.0 / _2892;
        float _2972 = _2968;
        if (!_804)
        {
            _2972 = _2860;
        }
        float _2974 = _2972;
        float _2976 = _2578 * _2932;
        if (!_804)
        {
            _2966 = _2860;
        }
        float _2978 = _2966;
        if (!_804)
        {
            _1792 = _2860;
        }
        float _2980 = _1792;
        float _2982 = _2976 * 6.283184051513671875;
        float _2984 = 1.0 / _2946;
        float _2986 = _532 * _2978;
        float _2988 = _2982 * 0.15915493667125701904296875;
        float _2990 = _2982;
        if (_804)
        {
            _2990 = _1726;
        }
        float _2992 = _2990;
        float _2994 = _2992;
        if (!_804)
        {
            _2994 = _1728;
        }
        float _2996 = _2994;
        float _2998 = 1.0 / _2952;
        float _3000 = _532 * _2960;
        float _3002 = _532 * _2974;
        float _3004 = _2970 * _2870;
        float _3006 = 1.0 / _2934;
        float _3008 = _532 * _2980;
        float _3010 = _2890 * _2864;
        float _3012 = _3010 * 0.15915493667125701904296875;
        float _3014 = _2906 * _2864;
        float _3016 = 1.0 / _3008;
        float _3018 = _3014 * 0.15915493667125701904296875;
        float _3020 = _2908 * _2864;
        float _3022 = 1.0 / _2986;
        float _3024 = _2872 * 6.283184051513671875;
        float _3026 = _2944 * _3024;
        float _3028 = 1.0 / _2922;
        float _3030 = _3020 * 0.15915493667125701904296875;
        float _3032 = _2920 * _2864;
        float _3034 = _3004 * 0.15915493667125701904296875;
        float _3036 = _2984 * _3024;
        float _3038 = _3026 * 0.15915493667125701904296875;
        float _3040 = _2984;
        float _3042 = _2998;
        float _3044 = _3024;
        float _3046 = _3028;
        if (_804)
        {
            _3040 = _1738;
        }
        float _3048 = _3040;
        float _3050 = _3032 * 0.15915493667125701904296875;
        float _3052 = _3036 * 0.15915493667125701904296875;
        float _3054 = _3006 * _2870;
        float _3056 = 1.0 / _2964;
        float _3058 = _3048;
        if (!_804)
        {
            _3058 = _1740;
        }
        float _3060 = _3058;
        float _3062 = _3054 * 0.15915493667125701904296875;
        float _3064 = _2998 * _3024;
        if (_804)
        {
            _3042 = _1738;
        }
        float _3066 = _3042;
        float _3068 = _3066;
        if (!_804)
        {
            _3068 = _1740;
        }
        float _3070 = _3068;
        float _3072 = _3064 * 0.15915493667125701904296875;
        float _3074 = _3022 * _3024;
        float _3076 = 1.0 / _3000;
        float _3078 = _3022;
        if (_804)
        {
            _3044 = _1738;
        }
        float _3080 = _3044;
        float _3082 = _3074 * 0.15915493667125701904296875;
        float _3084 = _3016 * _2870;
        float _3086 = _3080;
        if (!_804)
        {
            _3086 = _1740;
        }
        float _3088 = _3086;
        float _3090 = _2578 * _3056;
        if (!_804)
        {
            _1794 = _1740;
        }
        float _3092 = _1794;
        float _3094 = 1.0 / _3002;
        float _3096 = _3084 * 0.15915493667125701904296875;
        float _3098 = _2578 * _3028;
        float _3100 = _3090 * 6.283184051513671875;
        if (_804)
        {
            _1796 = _1734;
        }
        float _3102 = _1796;
        float _3104 = _3098 * 6.283184051513671875;
        float _3106 = _3102;
        if (_804)
        {
            _3078 = _1734;
        }
        float _3108 = _3078;
        float _3110 = _3038 * 6.283185482025146484375;
        float _3112 = sin(_3110);
        float _3114 = _3108;
        if (!_804)
        {
            _3106 = _1736;
        }
        float _3116 = _3106;
        float _3118 = _3104 * 0.15915493667125701904296875;
        if (!_804)
        {
            _3114 = _1736;
        }
        float _3120 = _3114;
        if (_804)
        {
            _3046 = _1726;
        }
        float _3122 = _3046;
        float _3124 = _3122;
        if (!_804)
        {
            _3124 = _1728;
        }
        float _3126 = _3124;
        float _3128 = _3012 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        float _3132 = _3076 * _2870;
        float _3134 = _3076;
        if (_804)
        {
            _3134 = _1734;
        }
        float _3136 = _3134;
        float _3138 = _2578 * _3094;
        float _3140 = _3136;
        float _3142 = _3094;
        float _3144 = _3138;
        if (!_804)
        {
            _3140 = _1736;
        }
        float _3146 = _3140;
        float _3148 = _3132 * 0.15915493667125701904296875;
        float _3150 = _3148;
        if (!_804)
        {
            _1798 = _1736;
        }
        float _3152 = _1798;
        float _3154 = _3100 * 0.15915493667125701904296875;
        float _3156 = _3034 * 6.283185482025146484375;
        float _3158 = sin(_3156);
        float _3160 = _3138 * 6.283184051513671875;
        if (_804)
        {
            _2610 = _1730;
        }
        float _3162 = _2610;
        float _3164 = _3162;
        if (_804)
        {
            _3142 = _1730;
        }
        float _3166 = _3142;
        float _3168 = _3160 * 0.15915493667125701904296875;
        float _3170 = _3166;
        if (_804)
        {
            _3144 = _1730;
        }
        float _3172 = _3144;
        float _3174 = _2988 * 6.283185482025146484375;
        float _3176 = sin(_3174);
        float _3178 = _3172;
        if (!_804)
        {
            _3164 = _1732;
        }
        float _3180 = _3164;
        float _3182 = _3130 * _3126;
        if (!_804)
        {
            _3170 = _1732;
        }
        float _3184 = _3170;
        if (!_804)
        {
            _3178 = _1732;
        }
        float _3186 = _3178;
        if (!_804)
        {
            _1800 = _1732;
        }
        float _3188 = _1800;
        float _3190 = _3018 * 6.283185482025146484375;
        float _3192 = sin(_3190);
        float _3194 = _3052 * 6.283185482025146484375;
        float _3196 = sin(_3194);
        float _3198 = _3176 * _2996;
        float _3200 = _3062 * 6.283185482025146484375;
        float _3202 = sin(_3200);
        float _3204 = fma(_3192, _3180, _3182);
        float _3206 = _3118 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        float _3210 = _3030 * 6.283185482025146484375;
        float _3212 = sin(_3210);
        float _3214 = _3072 * 6.283185482025146484375;
        float _3216 = sin(_3214);
        float _3218 = fma(_3208, _3184, _3198);
        float _3220 = _3148 * 6.283185482025146484375;
        float _3222 = sin(_3220);
        float _3224 = fma(_3212, _3116, _3204);
        float _3226 = _3154 * 6.283185482025146484375;
        float _3228 = sin(_3226);
        if (_804)
        {
            _3150 = _1726;
        }
        float _3230 = _3150;
        float _3232 = _3230;
        if (!_804)
        {
            _3232 = _1728;
        }
        float _3234 = _3232;
        if (!_804)
        {
            _1802 = _1728;
        }
        float _3236 = _1802;
        float _3238 = _3050 * 6.283185482025146484375;
        float _3240 = sin(_3238);
        float _3242 = _3112 * _3234;
        float _3244 = _3158 * _3236;
        float _3246 = fma(_3196, _3186, _3242);
        float _3248 = fma(_3202, _3188, _3244);
        float _3250 = _3082 * 6.283185482025146484375;
        float _3252 = sin(_3250);
        float _3254 = fma(_3216, _3146, _3246);
        float _3256 = fma(_3222, _3152, _3248);
        float _3258 = fma(_3228, _3120, _3218);
        float _3260 = _3096 * 6.283185482025146484375;
        float _3262 = sin(_3260);
        float _3264 = fma(_3240, _3060, _3224);
        float _3266 = _3168 * 6.283185482025146484375;
        float _3268 = sin(_3266);
        float _3270 = fma(_3252, _3088, _3254);
        float _3272 = fma(_3262, _3092, _3256);
        float _3274 = -_3270;
        float _3276 = _3274 + _3272;
        float _3278 = fma(_3268, _3070, _3258);
        float _3280 = -_3278;
        float _3282 = _3264 + _3280;
        float _3284 = _3282 + _3276;
        _2826 = _3284;
    }
    _2828 = false;
    float _3286 = _2826;
    float _3288 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _3290 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[50]);
    float _3292 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _3294 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _3296 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _3298 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _3300 = fma(_554, _1742, _2592);
    float _3302 = fma(_556, _2576, _2588);
    float _3304 = fma(_558, _3286, _2590);
    float _3306 = trunc(_3288);
    int _3308 = int(_3306);
    float _3310 = trunc(_3290);
    int _3312 = int(_3310);
    float _3314 = _286 * _3294;
    bool _3316 = _3308 != 1;
    float _3318 = _286 * _3292;
    float _3320 = _534 * _3314;
    float _3322 = _286 * _3296;
    float _3324 = _534 * _3318;
    float _3326 = _534 * _3322;
    bool _3328 = _3312 != 0;
    float _3330 = as_type<float>(_3308);
    float _3332 = _3326;
    if (!_3316)
    {
        float _3334 = _3320 * _502;
        _596 = _3334;
    }
    float _3336 = _596;
    float _3338 = _3336;
    if (!_3316)
    {
        float _3340 = _3320 * _504;
        _2612 = _3340;
    }
    float _3342 = _2612;
    float _3344 = _3342;
    if (!_3316)
    {
        float _3346 = _3320 * _506;
        _598 = _3346;
    }
    float _3348 = _598;
    float _3350 = _3348;
    if (!_3316)
    {
        float _3352 = fma(_3324, _508, _3336);
        _600 = _3352;
    }
    float _3354 = _600;
    if (!_3316)
    {
        float _3356 = fma(_3324, _510, _3342);
        _602 = _3356;
    }
    float _3358 = _602;
    if (!_3316)
    {
        float _3360 = fma(_3324, _512, _3348);
        _3330 = _3360;
    }
    float _3362 = _3330;
    if (_3316)
    {
        _3350 = _3320;
    }
    float _3364 = _3350;
    float _3366 = _3364;
    if (_3316)
    {
        _3338 = _3324;
    }
    float _3368 = _3338;
    float _3370 = _3368;
    if (!_3316)
    {
        float _3372 = fma(_3326, _514, _3358);
        _3366 = _3372;
    }
    float _3374 = _3366;
    float _3376 = _3374;
    if (!_3316)
    {
        float _3378 = fma(_3326, _516, _3354);
        _3370 = _3378;
    }
    float _3380 = _3370;
    if (!_3316)
    {
        float _3382 = fma(_3326, _518, _3362);
        _3332 = _3382;
    }
    float _3384 = _3332;
    float _3386 = _3302 + _3374;
    float _3388 = _3304 + _3384;
    bool _3390 = _3312 != 1;
    float _3392 = _3300 + _3380;
    bool _3394 = _3312 != 2;
    bool _3396 = _3298 > 0.0;
    float _3398 = _3384;
    bool _3400 = _3396;
    if (_3328)
    {
        _3398 = _3386;
    }
    float _3402 = _3398;
    float _3404 = _3402;
    if (_3328)
    {
        _3376 = _3388;
    }
    float _3406 = _3376;
    float _3408 = _3406;
    if (!_3328)
    {
        float _3410 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[48]);
        float _3412 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[49]);
        float _3414 = _286 * _3410;
        float _3416 = _534 * _3414;
        bool _3418 = _3412 != 0.0;
        bool _3420 = isnan(_3412);
        bool _3422 = _3418 || _3420;
        bool _3424 = isnan(0.0);
        bool _3426 = _3422 || _3424;
        float _3428 = _3416 * 0.15915493667125701904296875;
        float _3430 = _3428 * 6.283185482025146484375;
        float _3432 = sin(_3430);
        float _3434 = _3428 * 6.283185482025146484375;
        float _3436 = cos(_3434);
        float _3438 = _3388 * _3432;
        float _3440 = _3386 * _3432;
        float _3442 = fma(_3386, _3436, _3438);
        float _3444 = -_3440;
        float _3446 = fma(_3388, _3436, _3444);
        float _3448 = _3440;
        float _3450 = _3436;
        float _3452 = _3412;
        _604 = _3438;
        _606 = _3428;
        _608 = _3412;
        if (!_3426)
        {
            _3448 = _3442;
        }
        float _3454 = _3448;
        _3404 = _3454;
        if (!_3426)
        {
            _3450 = _3446;
        }
        float _3456 = _3450;
        bool _3458 = !_3426;
        _3408 = _3456;
        if (!_3458)
        {
            float _3460 = _3446 * _3446;
            float _3462 = fma(_3442, _3442, _3460);
            bool _3464 = _3462 > 0.0;
            float _3466 = _3456;
            float _3468 = _3460;
            _604 = _3462;
            if (_3464)
            {
                float _3470 = rsqrt(_3462);
                _3466 = _3470;
            }
            float _3472 = _3466;
            if (!_3464)
            {
                _3468 = _3442;
            }
            float _3474 = _3468;
            float _3476 = _3472;
            float _3478 = _3474;
            if (_3464)
            {
                float _3480 = _3412 * _3472;
                _3452 = _3480;
            }
            float _3482 = _3452;
            float _3484 = _3482;
            if (!_3464)
            {
                _3476 = _3446;
            }
            float _3486 = _3476;
            _3408 = _3486;
            if (_3464)
            {
                float _3488 = _286 * _3482;
                _3484 = _3488;
            }
            float _3490 = _3484;
            float _3492 = _3490;
            if (_3464)
            {
                float _3494 = _534 * _3490;
                _3492 = _3494;
            }
            float _3496 = _3492;
            _608 = _3496;
            if (_3464)
            {
                float _3498 = fma(_3442, _3496, _3442);
                _3478 = _3498;
            }
            float _3500 = _3478;
            _3404 = _3500;
            if (_3464)
            {
                float _3502 = fma(_3446, _3496, _3446);
                _3408 = _3502;
            }
        }
    }
    float _3504 = _604;
    float _3506 = _3408;
    float _3508 = _3404;
    float _3510 = _606;
    float _3512 = _608;
    float _3514 = _3510;
    float _3516 = _3506;
    float _3518 = _3504;
    float _3520 = _3506;
    float _3522 = _3512;
    float _3524 = _3508;
    float _3526 = _3508;
    if (_3390)
    {
        _3514 = _3392;
    }
    float _3528 = _3514;
    float _3530 = _3528;
    if (!_3390)
    {
        float _3532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[48]);
        float _3534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[49]);
        float _3536 = _286 * _3532;
        float _3538 = _534 * _3536;
        bool _3540 = _3534 != 0.0;
        bool _3542 = isnan(_3534);
        bool _3544 = _3540 || _3542;
        bool _3546 = isnan(0.0);
        bool _3548 = _3544 || _3546;
        float _3550 = _3538 * 0.15915493667125701904296875;
        float _3552 = _3550 * 6.283185482025146484375;
        float _3554 = sin(_3552);
        float _3556 = _3550 * 6.283185482025146484375;
        float _3558 = cos(_3556);
        float _3560 = _3554 * _3506;
        float _3562 = _3392 * _3554;
        float _3564 = -_3560;
        float _3566 = fma(_3392, _3558, _3564);
        float _3568 = fma(_3558, _3506, _3562);
        _3518 = _3562;
        _3530 = _3566;
        _610 = _3550;
        _3522 = _3568;
        if (!_3548)
        {
            _3516 = _3568;
        }
        float _3570 = _3516;
        bool _3572 = !_3548;
        _3520 = _3570;
        if (!_3572)
        {
            float _3574 = _3566 * _3566;
            float _3576 = fma(_3568, _3568, _3574);
            bool _3578 = _3576 > 0.0;
            float _3580 = _3562;
            float _3582 = _3574;
            _610 = _3576;
            if (_3578)
            {
                float _3584 = rsqrt(_3576);
                _3580 = _3584;
            }
            float _3586 = _3580;
            if (!_3578)
            {
                _3582 = _3568;
            }
            float _3588 = _3582;
            float _3590 = _3586;
            float _3592 = _3588;
            if (_3578)
            {
                float _3594 = _3534 * _3586;
                _3590 = _3594;
            }
            float _3596 = _3590;
            float _3598 = _3596;
            if (_3578)
            {
                float _3600 = _286 * _3596;
                _3598 = _3600;
            }
            float _3602 = _3598;
            float _3604 = _3602;
            if (_3578)
            {
                float _3606 = _534 * _3602;
                _3604 = _3606;
            }
            float _3608 = _3604;
            _3518 = _3608;
            if (_3578)
            {
                float _3610 = fma(_3568, _3608, _3568);
                _3592 = _3610;
            }
            float _3612 = _3592;
            _3520 = _3612;
            if (_3578)
            {
                float _3614 = fma(_3566, _3608, _3566);
                _3530 = _3614;
            }
        }
    }
    float _3616 = _3518;
    float _3618 = _3530;
    float _3620 = _3520;
    float _3622 = _610;
    float _3624 = _3522;
    float _3626 = _3618;
    float _3628 = _3624;
    float _3630 = _3616;
    float _3632 = _3622;
    if (!_3394)
    {
        float _3634 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[48]);
        float _3636 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[49]);
        float _3638 = _286 * _3634;
        float _3640 = _534 * _3638;
        bool _3642 = _3636 != 0.0;
        bool _3644 = isnan(_3636);
        bool _3646 = _3642 || _3644;
        bool _3648 = isnan(0.0);
        bool _3650 = _3646 || _3648;
        float _3652 = _3640 * 0.15915493667125701904296875;
        float _3654 = _3652 * 6.283185482025146484375;
        float _3656 = sin(_3654);
        float _3658 = _3652 * 6.283185482025146484375;
        float _3660 = cos(_3658);
        float _3662 = _3656 * _3508;
        float _3664 = _3656 * _3618;
        float _3666 = -_3664;
        float _3668 = fma(_3660, _3508, _3666);
        float _3670 = fma(_3660, _3618, _3662);
        float _3672 = _3662;
        float _3674 = _3670;
        _3626 = _3670;
        _3628 = _3652;
        _3630 = _3662;
        if (!_3650)
        {
            _3524 = _3668;
        }
        float _3676 = _3524;
        bool _3678 = !_3650;
        _3526 = _3676;
        if (!_3678)
        {
            float _3680 = _3668 * _3668;
            float _3682 = fma(_3670, _3670, _3680);
            bool _3684 = _3682 > 0.0;
            float _3686 = _3680;
            _3628 = _3682;
            if (_3684)
            {
                float _3688 = rsqrt(_3682);
                _3686 = _3688;
            }
            float _3690 = _3686;
            float _3692 = _3690;
            if (_3684)
            {
                float _3694 = _3636 * _3690;
                _3692 = _3694;
            }
            float _3696 = _3692;
            float _3698 = _3696;
            if (_3684)
            {
                float _3700 = _286 * _3696;
                _3672 = _3700;
            }
            float _3702 = _3672;
            float _3704 = _3702;
            if (!_3684)
            {
                _3698 = _3668;
            }
            float _3706 = _3698;
            _3526 = _3706;
            if (_3684)
            {
                float _3708 = _534 * _3702;
                _3704 = _3708;
            }
            float _3710 = _3704;
            _3630 = _3710;
            if (_3684)
            {
                float _3712 = fma(_3670, _3710, _3670);
                _3674 = _3712;
            }
            float _3714 = _3674;
            _3626 = _3714;
            if (_3684)
            {
                float _3716 = fma(_3668, _3710, _3668);
                _3526 = _3716;
            }
        }
    }
    float _3718 = _3626;
    float _3720 = _3526;
    float _3722 = _3628;
    float _3724 = _3630;
    float _3726 = _3722;
    float _3728 = _3724;
    if (!_3396)
    {
        _3632 = _3718;
    }
    float _3730 = _3632;
    float _3732 = _3730;
    float _3734 = _3730;
    if (!_3396)
    {
        _3726 = _3720;
    }
    float _3736 = _3726;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3396)
    {
        _3728 = _3620;
    }
    float _3742 = _3728;
    bool _3744 = !_3396;
    float _3746 = _3742;
    float _3748 = _3742;
    if (!_3744)
    {
        bool _3750 = !_174;
        if (!_3750)
        {
            float _3752 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3754 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3756 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3762 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3764 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3766 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3768 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3776 = _3754 * _3720;
            float _3778 = _3762 * _3720;
            float _3780 = fma(_3752, _3718, _3776);
            float _3782 = _3770 * _3720;
            float _3784 = fma(_3760, _3718, _3778);
            float _3786 = fma(_3756, _3620, _3780);
            float _3788 = fma(_3768, _3718, _3782);
            float _3790 = fma(_3764, _3620, _3784);
            float _3792 = _3758 + _3786;
            float _3794 = fma(_3772, _3620, _3788);
            float _3796 = _3766 + _3790;
            float _3798 = _3774 + _3794;
            _3734 = _3792;
            _3748 = _3798;
            _3740 = _3796;
            _3344 = _3760;
            _3800 = true;
        }
        else
        {
            int _3802 = as_type<int>(_152) & 1024;
            bool _3804 = _3802 != 0;
            bool _3806 = !_3804;
            if (!_3806)
            {
                float _3808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _3810 = uint(int(uint(_154) >> uint(2)));
                float _3812 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3810)]);
                int _3814 = _154 + 4;
                uint _3816 = uint(int(uint(_3814) >> uint(2)));
                float _3818 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3816)]);
                int _3820 = _154 + 8;
                uint _3822 = uint(int(uint(_3820) >> uint(2)));
                float _3824 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3822)]);
                uint _3826 = uint(int(uint(_154) >> uint(2)));
                float _3828 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3826)]);
                int _3830 = _154 + 4;
                uint _3832 = uint(int(uint(_3830) >> uint(2)));
                float _3834 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3832)]);
                int _3836 = _154 + 8;
                uint _3838 = uint(int(uint(_3836) >> uint(2)));
                float _3840 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3838)]);
                uint _3842 = uint(int(uint(_154) >> uint(2)));
                float _3844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3842)]);
                int _3846 = _154 + 4;
                uint _3848 = uint(int(uint(_3846) >> uint(2)));
                float _3850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3848)]);
                int _3852 = _154 + 8;
                uint _3854 = uint(int(uint(_3852) >> uint(2)));
                float _3856 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3854)]);
                float _3858 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _3860 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3862 = _3818 * _3720;
                float _3864 = _3834 * _3720;
                float _3866 = _3850 * _3720;
                float _3868 = fma(_3812, _3718, _3862);
                float _3870 = fma(_3828, _3718, _3864);
                float _3872 = fma(_3844, _3718, _3866);
                float _3874 = fma(_3824, _3620, _3868);
                float _3876 = fma(_3840, _3620, _3870);
                float _3878 = fma(_3856, _3620, _3872);
                float _3880 = _3808 + _3874;
                float _3882 = _3858 + _3876;
                float _3884 = _3860 + _3878;
                _3734 = _3880;
                _3748 = _3884;
                _3740 = _3882;
                _3344 = _3828;
                _3800 = true;
            }
            else
            {
                int _3886 = as_type<int>(_152) & 2048;
                bool _3888 = _3886 != 0;
                if (!_3888)
                {
                    _3732 = _3718;
                }
                float _3890 = _3732;
                _3734 = _3890;
                if (!_3888)
                {
                    _3738 = _3720;
                }
                float _3892 = _3738;
                _3740 = _3892;
                if (!_3888)
                {
                    _3746 = _3620;
                }
                float _3894 = _3746;
                bool _3896 = !_3888;
                _3748 = _3894;
                if (!_3896)
                {
                    uint _3898 = uint(int(uint(_154) >> uint(2)));
                    float _3900 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3898)]);
                    int _3902 = _154 + 4;
                    uint _3904 = uint(int(uint(_3902) >> uint(2)));
                    float _3906 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3904)]);
                    int _3908 = _154 + 8;
                    uint _3910 = uint(int(uint(_3908) >> uint(2)));
                    float _3912 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3910)]);
                    int _3914 = _154 + 12;
                    uint _3916 = uint(int(uint(_3914) >> uint(2)));
                    float _3918 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3916)]);
                    uint _3920 = uint(int(uint(_154) >> uint(2)));
                    float _3922 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3920)]);
                    int _3924 = _154 + 4;
                    uint _3926 = uint(int(uint(_3924) >> uint(2)));
                    float _3928 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3926)]);
                    int _3930 = _154 + 8;
                    uint _3932 = uint(int(uint(_3930) >> uint(2)));
                    float _3934 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3932)]);
                    int _3936 = _154 + 12;
                    uint _3938 = uint(int(uint(_3936) >> uint(2)));
                    float _3940 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3938)]);
                    uint _3942 = uint(int(uint(_154) >> uint(2)));
                    float _3944 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3942)]);
                    int _3946 = _154 + 4;
                    uint _3948 = uint(int(uint(_3946) >> uint(2)));
                    float _3950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3948)]);
                    int _3952 = _154 + 8;
                    uint _3954 = uint(int(uint(_3952) >> uint(2)));
                    float _3956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3954)]);
                    int _3958 = _154 + 12;
                    uint _3960 = uint(int(uint(_3958) >> uint(2)));
                    float _3962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3960)]);
                    float _3964 = _3906 * _3720;
                    float _3966 = _3928 * _3720;
                    float _3968 = _3950 * _3720;
                    float _3970 = fma(_3900, _3718, _3964);
                    float _3972 = fma(_3922, _3718, _3966);
                    float _3974 = fma(_3944, _3718, _3968);
                    float _3976 = fma(_3912, _3620, _3970);
                    float _3978 = fma(_3934, _3620, _3972);
                    float _3980 = fma(_3956, _3620, _3974);
                    float _3982 = _3976 + _3918;
                    float _3984 = _3978 + _3940;
                    float _3986 = _3980 + _3962;
                    _3734 = _3982;
                    _3748 = _3986;
                    _3740 = _3984;
                    _3344 = _3922;
                }
            }
        }
    }
    _3800 = false;
    float _3988 = _3734;
    float _3990 = _3748;
    float _3992 = _3740;
    float _3994 = _3344;
    float _3996 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _3998 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _4000 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _4002 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _4004 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _4006 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _4008 = _3996 != 0.0;
    bool _4010 = isnan(_3996);
    bool _4012 = _4008 || _4010;
    bool _4014 = isnan(0.0);
    bool _4016 = _4012 || _4014;
    float _4018 = _540 * _3998;
    float _4020 = _540 * _4000;
    float _4022 = _540 * _4002;
    float _4024 = fma(_4004, _3988, _4018);
    float _4026 = fma(_4004, _3990, _4020);
    float _4028 = fma(_4004, _3992, _4022);
    float _4030 = _4006;
    float _4032 = _3994;
    if (_4016)
    {
        float _4034 = _266 * _4006;
        _4030 = _4034;
    }
    float _4036 = _4030;
    float _4038 = _4028 + _4036;
    float _4040 = -_4036;
    bool _4042 = _4024 >= _4040;
    bool _4044 = isnan(_4024);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan(_4040);
    bool _4050 = _4046 || _4048;
    float _4052 = _4024 + _4036;
    float _4054 = -_4036;
    bool _4056 = _4026 >= _4054;
    bool _4058 = isnan(_4026);
    bool _4060 = _4056 || _4058;
    bool _4062 = isnan(_4054);
    bool _4064 = _4060 || _4062;
    float _4066 = _4026 + _4036;
    float _4068 = -_4036;
    bool _4070 = _4028 >= _4068;
    bool _4072 = isnan(_4028);
    bool _4074 = _4070 || _4072;
    bool _4076 = isnan(_4068);
    bool _4078 = _4074 || _4076;
    bool _4080 = !_4050;
    float _4082 = -_4052;
    float _4084 = _4080 ? _4082 : _4052;
    bool _4086 = !_4064;
    float _4088 = -_4066;
    float _4090 = _4086 ? _4088 : _4066;
    bool _4092 = !_4078;
    float _4094 = -_4038;
    float _4096 = _4092 ? _4094 : _4038;
    float _4098 = _4084 * 0.03125;
    float _4100 = _4090 * 0.03125;
    float _4102 = _4096 * 0.03125;
    float3 _10922 = float3(_4098, _4102, _4100);
    float3 _4106 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_10922, float3(0.0), isnan(_10922)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_10922, float3(0.0), isnan(_10922)), level(0.0)).xyz;
    float _4108 = _4106.x;
    float _4110 = _4106.y;
    float _4112 = _4106.z;
    float _4114 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _4116 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _4118 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _4120 = _4108 + (-0.5);
    float _4122 = _4110 + (-0.5);
    float _4124 = _4112 + (-0.5);
    float _4126 = _4120 * _4114;
    float _4128 = _4122 * _4116;
    float _4130 = _4124 * _4118;
    float _4132 = _4124;
    float _4134 = _4116;
    float _4136 = _4122;
    if (!_3396)
    {
        _4132 = _4126;
    }
    float _4138 = _4132;
    float _4140 = _4138;
    float _4142 = _4138;
    if (!_3396)
    {
        _4134 = _4128;
    }
    float _4144 = _4134;
    float _4146 = _4144;
    float _4148 = _4144;
    if (!_3396)
    {
        _4136 = _4130;
    }
    float _4150 = _4136;
    bool _4152 = !_3396;
    float _4154 = _4150;
    float _4156 = _4150;
    if (!_4152)
    {
        bool _4158 = !_174;
        if (!_4158)
        {
            float _4160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _4162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _4164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _4166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _4168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _4170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _4172 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _4174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _4176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _4178 = _4164 * _4166;
            float _4180 = _4164 * _4168;
            float _4182 = _4162 * _4166;
            float _4184 = -_4178;
            float _4186 = fma(_4160, _4170, _4184);
            float _4188 = -_4180;
            float _4190 = fma(_4162, _4170, _4188);
            float _4192 = -_4182;
            float _4194 = fma(_4160, _4168, _4192);
            float _4196 = _4174 * _4160;
            float _4198 = _4174 * _4186;
            float _4200 = _4176 * _4162;
            float _4202 = _4172 * _4168;
            float _4204 = -_4196;
            float _4206 = fma(_4172, _4162, _4204);
            float _4208 = -_4198;
            float _4210 = fma(_4172, _4190, _4208);
            float _4212 = _4174 * _4170;
            float _4214 = _4176 * _4166;
            float _4216 = -_4202;
            float _4218 = fma(_4174, _4166, _4216);
            float _4220 = fma(_4176, _4194, _4210);
            float _4222 = -_4212;
            float _4224 = fma(_4176, _4168, _4222);
            float _4226 = -_4214;
            float _4228 = fma(_4172, _4170, _4226);
            float _4230 = _4172 * _4164;
            float _4232 = -_4160;
            float _4234 = fma(_4232, _4170, _4178);
            float _4236 = -_4200;
            float _4238 = fma(_4174, _4164, _4236);
            float _4240 = 1.0 / _4220;
            float _4242 = -_4230;
            float _4244 = fma(_4176, _4160, _4242);
            float _4246 = _4224 * _4240;
            float _4248 = _4228 * _4240;
            float _4250 = _4218 * _4240;
            float _4252 = _4126 * _4240;
            float _4254 = _4128 * _4246;
            float _4256 = _4128 * _4248;
            float _4258 = _4128 * _4250;
            float _4260 = _4234 * _4240;
            float _4262 = _4238 * _4240;
            float _4264 = _4244 * _4240;
            float _4266 = _4206 * _4240;
            float _4268 = fma(_4190, _4252, _4254);
            float _4270 = fma(_4126, _4260, _4256);
            float _4272 = fma(_4194, _4252, _4258);
            float _4274 = fma(_4130, _4262, _4268);
            float _4276 = fma(_4130, _4264, _4270);
            float _4278 = fma(_4130, _4266, _4272);
            _4148 = _4276;
            _4156 = _4278;
            _4142 = _4274;
            _4032 = _4160;
            _4280 = true;
        }
        else
        {
            int _4282 = as_type<int>(_152) & 1024;
            bool _4284 = _4282 != 0;
            if (_4284)
            {
                _3400 = true;
            }
            bool _4286 = _3400;
            bool _4288 = _4286;
            if (!_4284)
            {
                int _4290 = as_type<int>(_152) & 2048;
                bool _4292 = _4290 != 0;
                _4288 = _4292;
            }
            bool _4294 = _4288;
            if (!_4294)
            {
                _4140 = _4126;
            }
            float _4296 = _4140;
            _4142 = _4296;
            if (!_4294)
            {
                _4146 = _4128;
            }
            float _4298 = _4146;
            _4148 = _4298;
            if (!_4294)
            {
                _4154 = _4130;
            }
            float _4300 = _4154;
            bool _4302 = !_4294;
            _4156 = _4300;
            if (!_4302)
            {
                uint _4304 = uint(int(uint(_154) >> uint(2)));
                float _4306 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4304)]);
                int _4308 = _154 + 4;
                uint _4310 = uint(int(uint(_4308) >> uint(2)));
                float _4312 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4310)]);
                int _4314 = _154 + 8;
                uint _4316 = uint(int(uint(_4314) >> uint(2)));
                float _4318 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4316)]);
                uint _4320 = uint(int(uint(_154) >> uint(2)));
                float _4322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4320)]);
                int _4324 = _154 + 4;
                uint _4326 = uint(int(uint(_4324) >> uint(2)));
                float _4328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4326)]);
                int _4330 = _154 + 8;
                uint _4332 = uint(int(uint(_4330) >> uint(2)));
                float _4334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4332)]);
                uint _4336 = uint(int(uint(_154) >> uint(2)));
                float _4338 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4336)]);
                int _4340 = _154 + 4;
                uint _4342 = uint(int(uint(_4340) >> uint(2)));
                float _4344 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4342)]);
                int _4346 = _154 + 8;
                uint _4348 = uint(int(uint(_4346) >> uint(2)));
                float _4350 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4348)]);
                float _4352 = _4318 * _4322;
                float _4354 = _4318 * _4328;
                float _4356 = _4312 * _4322;
                float _4358 = -_4352;
                float _4360 = fma(_4306, _4334, _4358);
                float _4362 = -_4354;
                float _4364 = fma(_4312, _4334, _4362);
                float _4366 = -_4356;
                float _4368 = fma(_4306, _4328, _4366);
                float _4370 = _4344 * _4306;
                float _4372 = _4344 * _4360;
                float _4374 = _4350 * _4312;
                float _4376 = _4338 * _4328;
                float _4378 = -_4370;
                float _4380 = fma(_4338, _4312, _4378);
                float _4382 = -_4372;
                float _4384 = fma(_4338, _4364, _4382);
                float _4386 = _4344 * _4334;
                float _4388 = _4350 * _4322;
                float _4390 = -_4376;
                float _4392 = fma(_4344, _4322, _4390);
                float _4394 = fma(_4350, _4368, _4384);
                float _4396 = -_4386;
                float _4398 = fma(_4350, _4328, _4396);
                float _4400 = -_4388;
                float _4402 = fma(_4338, _4334, _4400);
                float _4404 = _4338 * _4318;
                float _4406 = -_4306;
                float _4408 = fma(_4406, _4334, _4352);
                float _4410 = -_4374;
                float _4412 = fma(_4344, _4318, _4410);
                float _4414 = 1.0 / _4394;
                float _4416 = -_4404;
                float _4418 = fma(_4350, _4306, _4416);
                float _4420 = _4398 * _4414;
                float _4422 = _4402 * _4414;
                float _4424 = _4392 * _4414;
                float _4426 = _4126 * _4414;
                float _4428 = _4128 * _4420;
                float _4430 = _4128 * _4422;
                float _4432 = _4128 * _4424;
                float _4434 = _4408 * _4414;
                float _4436 = _4412 * _4414;
                float _4438 = _4418 * _4414;
                float _4440 = _4380 * _4414;
                float _4442 = fma(_4364, _4426, _4428);
                float _4444 = fma(_4126, _4434, _4430);
                float _4446 = fma(_4368, _4426, _4432);
                float _4448 = fma(_4130, _4436, _4442);
                float _4450 = fma(_4130, _4438, _4444);
                float _4452 = fma(_4130, _4440, _4446);
                _4148 = _4450;
                _4156 = _4452;
                _4142 = _4448;
                _4032 = _4306;
            }
        }
    }
    _4280 = false;
    float _4454 = _4148;
    float _4456 = _4156;
    float _4458 = _4142;
    float _4460 = _4032;
    float _4462 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _4464 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _4466 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _4468 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _4470 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _4472 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _4474 = uint(int(uint(_176) >> uint(2)));
    float _4476 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_4474)]);
    float _4478 = fma(_534, _4454, _774);
    float _4480 = fma(_534, _4456, _776);
    bool _4482 = _4462 > 0.0;
    bool _4484 = _4464 > 0.0;
    float _4486 = _4466 * _4464;
    float _4488 = _534 * _4468;
    float _4490 = _4462;
    float _4492 = _4466;
    float _4494 = _4460;
    bool _4496 = _4484;
    float _4498 = _4486;
    if (_4482)
    {
        float _4500 = 1.0 / _4462;
        _4490 = _4500;
    }
    float _4502 = _4490;
    float _4504 = _534 * _4472;
    if (_4484)
    {
        float _4506 = -_4486;
        float _4508 = fma(_266, _4506, _4466);
        _4492 = _4508;
    }
    float _4510 = _4492;
    float _4512 = _4510;
    if (_4482)
    {
        float _4514 = _672 * _4502;
        _726 = _4514;
    }
    float _4516 = _726;
    if (_4482)
    {
        float _4518 = precise::min(_4516, 1.0);
        _4494 = _4518;
    }
    float _4520 = _4494;
    float _4522 = fma(_534, _4458, _784);
    float _4524 = _534 * _4470;
    float _4526 = _4524;
    if (_4482)
    {
        float _4528 = _4520 * _4510;
        _4512 = _4528;
    }
    float _4530 = _4512;
    float _4532 = _4488 * _4530;
    float _4534 = _4524 * _4530;
    float _4536 = _4504 * _4530;
    bool _4538 = !_174;
    float _4540 = _4530;
    float _4662;
    float _4664;
    float _4666;
    if (!_4538)
    {
        float _4542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4548 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4552 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4554 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4558 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4560 = _4546 * _4548;
        float _4562 = _4546 * _4550;
        float _4564 = _4544 * _4548;
        float _4566 = -_4560;
        float _4568 = fma(_4542, _4552, _4566);
        float _4570 = -_4562;
        float _4572 = fma(_4544, _4552, _4570);
        float _4574 = -_4564;
        float _4576 = fma(_4542, _4550, _4574);
        float _4578 = _4556 * _4542;
        float _4580 = _4556 * _4568;
        float _4582 = _4558 * _4544;
        float _4584 = _4554 * _4550;
        float _4586 = -_4578;
        float _4588 = fma(_4554, _4544, _4586);
        float _4590 = -_4580;
        float _4592 = fma(_4554, _4572, _4590);
        float _4594 = _4556 * _4552;
        float _4596 = _4558 * _4548;
        float _4598 = -_4582;
        float _4600 = fma(_4556, _4546, _4598);
        float _4602 = fma(_4558, _4576, _4592);
        float _4604 = -_4594;
        float _4606 = fma(_4558, _4550, _4604);
        float _4608 = -_4596;
        float _4610 = fma(_4554, _4552, _4608);
        float _4612 = -_4584;
        float _4614 = fma(_4556, _4548, _4612);
        float _4616 = 1.0 / _4602;
        float _4618 = _4554 * _4546;
        float _4620 = -_4542;
        float _4622 = fma(_4620, _4552, _4560);
        float _4624 = -_4618;
        float _4626 = fma(_4558, _4542, _4624);
        float _4628 = _4606 * _4616;
        float _4630 = _4610 * _4616;
        float _4632 = _4614 * _4616;
        float _4634 = _4532 * _4616;
        float _4636 = _4628 * _4534;
        float _4638 = _4630 * _4534;
        float _4640 = _4632 * _4534;
        float _4642 = _4622 * _4616;
        float _4644 = _4600 * _4616;
        float _4646 = fma(_4572, _4634, _4636);
        float _4648 = _4626 * _4616;
        float _4650 = _4588 * _4616;
        float _4652 = fma(_4642, _4532, _4638);
        float _4654 = fma(_4576, _4634, _4640);
        float _4656 = fma(_4644, _4536, _4646);
        float _4658 = fma(_4648, _4536, _4652);
        float _4660 = fma(_4650, _4536, _4654);
        _4662 = _4656;
        _4664 = _4658;
        _4666 = _4660;
        _4668 = true;
    }
    else
    {
        int _4670 = as_type<int>(_152) & 1024;
        bool _4672 = _4670 != 0;
        if (_4672)
        {
            _4496 = true;
        }
        bool _4674 = _4496;
        bool _4676 = _4674;
        if (!_4672)
        {
            int _4678 = as_type<int>(_152) & 2048;
            bool _4680 = _4678 != 0;
            _4676 = _4680;
        }
        bool _4682 = _4676;
        if (!_4682)
        {
            _4498 = _4532;
        }
        float _4684 = _4498;
        _4662 = _4684;
        if (!_4682)
        {
            _4540 = _4534;
        }
        float _4686 = _4540;
        _4664 = _4686;
        if (!_4682)
        {
            _4526 = _4536;
        }
        float _4688 = _4526;
        bool _4690 = !_4682;
        _4666 = _4688;
        if (!_4690)
        {
            uint _4692 = uint(int(uint(_154) >> uint(2)));
            float _4694 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4692)]);
            int _4696 = _154 + 4;
            uint _4698 = uint(int(uint(_4696) >> uint(2)));
            float _4700 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4698)]);
            int _4702 = _154 + 8;
            uint _4704 = uint(int(uint(_4702) >> uint(2)));
            float _4706 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4704)]);
            uint _4708 = uint(int(uint(_154) >> uint(2)));
            float _4710 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4708)]);
            int _4712 = _154 + 4;
            uint _4714 = uint(int(uint(_4712) >> uint(2)));
            float _4716 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4714)]);
            int _4718 = _154 + 8;
            uint _4720 = uint(int(uint(_4718) >> uint(2)));
            float _4722 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4720)]);
            uint _4724 = uint(int(uint(_154) >> uint(2)));
            float _4726 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4724)]);
            int _4728 = _154 + 4;
            uint _4730 = uint(int(uint(_4728) >> uint(2)));
            float _4732 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4730)]);
            int _4734 = _154 + 8;
            uint _4736 = uint(int(uint(_4734) >> uint(2)));
            float _4738 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4736)]);
            float _4740 = _4706 * _4710;
            float _4742 = _4706 * _4716;
            float _4744 = _4700 * _4710;
            float _4746 = -_4740;
            float _4748 = fma(_4694, _4722, _4746);
            float _4750 = -_4742;
            float _4752 = fma(_4700, _4722, _4750);
            float _4754 = -_4744;
            float _4756 = fma(_4694, _4716, _4754);
            float _4758 = _4732 * _4694;
            float _4760 = _4732 * _4748;
            float _4762 = _4738 * _4700;
            float _4764 = _4726 * _4716;
            float _4766 = -_4758;
            float _4768 = fma(_4726, _4700, _4766);
            float _4770 = -_4760;
            float _4772 = fma(_4726, _4752, _4770);
            float _4774 = _4732 * _4722;
            float _4776 = _4738 * _4710;
            float _4778 = -_4762;
            float _4780 = fma(_4732, _4706, _4778);
            float _4782 = fma(_4738, _4756, _4772);
            float _4784 = -_4774;
            float _4786 = fma(_4738, _4716, _4784);
            float _4788 = -_4776;
            float _4790 = fma(_4726, _4722, _4788);
            float _4792 = -_4764;
            float _4794 = fma(_4732, _4710, _4792);
            float _4796 = 1.0 / _4782;
            float _4798 = _4726 * _4706;
            float _4800 = -_4694;
            float _4802 = fma(_4800, _4722, _4740);
            float _4804 = -_4798;
            float _4806 = fma(_4738, _4694, _4804);
            float _4808 = _4786 * _4796;
            float _4810 = _4790 * _4796;
            float _4812 = _4794 * _4796;
            float _4814 = _4532 * _4796;
            float _4816 = _4808 * _4534;
            float _4818 = _4810 * _4534;
            float _4820 = _4812 * _4534;
            float _4822 = _4802 * _4796;
            float _4824 = _4780 * _4796;
            float _4826 = fma(_4752, _4814, _4816);
            float _4828 = _4806 * _4796;
            float _4830 = _4768 * _4796;
            float _4832 = fma(_4822, _4532, _4818);
            float _4834 = fma(_4756, _4814, _4820);
            float _4836 = fma(_4824, _4536, _4826);
            float _4838 = fma(_4828, _4536, _4832);
            float _4840 = fma(_4830, _4536, _4834);
            _4662 = _4836;
            _4664 = _4838;
            _4666 = _4840;
        }
    }
    _4668 = false;
    float _4842 = _4662;
    float _4844 = _4664;
    float _4846 = _4666;
    float _4848 = _3718 + _4842;
    float _4850 = _3720 + _4844;
    int _4852 = _154 + 4;
    float _4854 = _3620 + _4846;
    int _4856 = _154 + 8;
    uint _4858 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4858)] = as_type<uint>(_4476);
    float _4860 = -_158;
    float _4862 = _4860 + _4848;
    float _4864 = -_164;
    float _4866 = _4864 + _4850;
    uint _4868 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4868)] = as_type<uint>(_4848);
    float _4870 = -_170;
    float _4872 = _4870 + _4854;
    uint _4874 = uint(int(uint(_4852) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4874)] = as_type<uint>(_4850);
    uint _4876 = uint(int(uint(_4856) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4876)] = as_type<uint>(_4854);
    uint _4878 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4878)] = as_type<uint>(_4522);
    uint _4880 = uint(int(uint(_4852) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4880)] = as_type<uint>(_4478);
    uint _4882 = uint(int(uint(_4856) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4882)] = as_type<uint>(_4480);
    uint _4884 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4884)] = as_type<uint>(_4862);
    uint _4886 = uint(int(uint(_4852) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4886)] = as_type<uint>(_4866);
    uint _4888 = uint(int(uint(_4856) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4888)] = as_type<uint>(_4872);
    float _4890 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4892 = _4866 * _4866;
    float _4894 = _4478 * _4478;
    float _4896 = fma(_4862, _4862, _4892);
    float _4898 = fma(_4522, _4522, _4894);
    float _4900 = fma(_4872, _4872, _4896);
    float _4902 = fma(_4480, _4480, _4898);
    float _4904 = sqrt(_4900);
    float _4906 = sqrt(_4902);
    bool _4908 = _4904 >= 9.9999999747524270787835121154785e-07;
    bool _4910 = isnan(_4904);
    bool _4912 = _4908 || _4910;
    bool _4914 = isnan(9.9999999747524270787835121154785e-07);
    bool _4916 = _4912 || _4914;
    if (!_4916)
    {
        bool _4918 = _540 != _282;
        bool _4920 = isnan(_540);
        bool _4922 = _4918 || _4920;
        bool _4924 = isnan(_282);
        bool _4926 = _4922 || _4924;
        _4928 = _4926;
        if (!_4928)
        {
            float _4930 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _4932 = _4930 > 0.0;
            bool _4934 = !_4932;
            if (!_4934)
            {
                float _4936 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _4938 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _4940 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _4942 = _4938 * _4938;
                float _4944 = fma(_4936, _4936, _4942);
                float _4946 = fma(_4940, _4940, _4944);
                float _4948 = rsqrt(_4946);
                float _4950 = _4948 * 9.9999999747524270787835121154785e-07;
                float _4952 = _4936 * _4950;
                float _4954 = _4938 * _4950;
                float _4956 = _4940 * _4950;
                _324 = as_type<int>(_4952);
                _326 = as_type<int>(_4954);
                _328 = as_type<int>(_4956);
                _4928 = true;
            }
            else
            {
                bool _4958 = _4906 >= 9.9999999747524270787835121154785e-07;
                bool _4960 = isnan(_4906);
                bool _4962 = _4958 || _4960;
                bool _4964 = isnan(9.9999999747524270787835121154785e-07);
                bool _4966 = _4962 || _4964;
                if (!_4966)
                {
                    float _4968 = _4850 * _4850;
                    float _4970 = fma(_4848, _4848, _4968);
                    float _4972 = fma(_4854, _4854, _4970);
                    float _4974 = sqrt(_4972);
                    bool _4976 = _4974 >= 9.9999999747524270787835121154785e-07;
                    bool _4978 = isnan(_4974);
                    bool _4980 = _4976 || _4978;
                    bool _4982 = isnan(9.9999999747524270787835121154785e-07);
                    bool _4984 = _4980 || _4982;
                    float _4986 = _4974;
                    if (_4984)
                    {
                        float _4988 = rsqrt(_4972);
                        _4986 = _4988;
                    }
                    float _4990 = _4986;
                    if (!_4984)
                    {
                        _312 = 0;
                    }
                    int _4992 = _312;
                    int _4994 = _4992;
                    if (!_4984)
                    {
                        _314 = 897988541;
                    }
                    int _4996 = _314;
                    int _4998 = _4996;
                    if (!_4984)
                    {
                        _316 = 0;
                    }
                    int _5000 = _316;
                    float _5002 = _4990;
                    int _5004 = _5000;
                    if (_4984)
                    {
                        float _5006 = _4990 * 9.9999999747524270787835121154785e-07;
                        _5002 = _5006;
                    }
                    float _5008 = _5002;
                    if (_4984)
                    {
                        float _5010 = _4848 * _5008;
                        _4994 = as_type<int>(_5010);
                    }
                    int _5012 = _4994;
                    _324 = _5012;
                    if (_4984)
                    {
                        float _5014 = _4850 * _5008;
                        _4998 = as_type<int>(_5014);
                    }
                    int _5016 = _4998;
                    _326 = _5016;
                    if (_4984)
                    {
                        float _5018 = _4854 * _5008;
                        _5004 = as_type<int>(_5018);
                    }
                    int _5020 = _5004;
                    _328 = _5020;
                    _4928 = true;
                }
                else
                {
                    float _5022 = rsqrt(_4902);
                    float _5024 = _5022 * 9.9999999747524270787835121154785e-07;
                    float _5026 = _4522 * _5024;
                    float _5028 = _4478 * _5024;
                    float _5030 = _4480 * _5024;
                    _324 = as_type<int>(_5026);
                    _326 = as_type<int>(_5028);
                    _328 = as_type<int>(_5030);
                    _4928 = true;
                }
            }
        }
    }
    else
    {
        float _5032 = _4906 * _4890;
        bool _5034 = _5032 >= 0.001000000047497451305389404296875;
        bool _5036 = isnan(_5032);
        bool _5038 = _5034 || _5036;
        bool _5040 = isnan(0.001000000047497451305389404296875);
        bool _5042 = _5038 || _5040;
        bool _5044 = _5032 > 0.0;
        bool _5046 = !_5042;
        bool _5048 = _5044 && _5046;
        bool _5050 = _4904 < 0.001000000047497451305389404296875;
        bool _5052 = _5050 && _5048;
        if (!_5052)
        {
            _318 = as_type<int>(_4862);
        }
        int _5054 = _318;
        int _5056 = _5054;
        if (_5052)
        {
            float _5058 = _4522 * _4890;
            _5056 = as_type<int>(_5058);
        }
        int _5060 = _5056;
        _324 = _5060;
        if (!_5052)
        {
            _320 = as_type<int>(_4866);
        }
        int _5062 = _320;
        int _5064 = _5062;
        if (_5052)
        {
            float _5066 = _4478 * _4890;
            _5064 = as_type<int>(_5066);
        }
        int _5068 = _5064;
        _326 = _5068;
        if (!_5052)
        {
            _322 = as_type<int>(_4872);
        }
        int _5070 = _322;
        _328 = _5070;
        if (_5052)
        {
            float _5072 = _4480 * _4890;
            _328 = as_type<int>(_5072);
        }
    }
    _4928 = false;
    int _5074 = _324;
    int _5076 = _326;
    int _5078 = _328;
    uint _5080 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5080)] = uint(_5074);
    uint _5082 = uint(int(uint(_4852) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5082)] = uint(_5076);
    uint _5084 = uint(int(uint(_4856) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5084)] = uint(_5078);
}

