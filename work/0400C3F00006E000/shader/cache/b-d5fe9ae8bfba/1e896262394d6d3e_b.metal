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
    bool _4578 = false;
    bool _4318 = false;
    bool _3930 = false;
    bool _3450 = false;
    bool _2824 = false;
    bool _2074 = false;
    bool _1158 = false;
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
    float _302 = _258;
    float _304 = _260;
    float _306 = _262;
    float _308 = _180;
    float _310 = _192;
    float _312 = _180;
    float _314 = _192;
    int _316 = as_type<int>(_196);
    int _318 = as_type<int>(_202);
    int _320 = as_type<int>(_208);
    int _322 = as_type<int>(_196);
    int _324 = as_type<int>(_202);
    int _326 = as_type<int>(_208);
    int _328 = as_type<int>(_196);
    int _330 = as_type<int>(_202);
    int _332 = as_type<int>(_208);
    if (!_174)
    {
        int _334 = _154 + 4;
        int _336 = _154 + 8;
        uint _338 = uint(int(uint(_154) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_338)]);
        uint _342 = uint(int(uint(_334) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_342)]);
        uint _346 = uint(int(uint(_336) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        uint _350 = uint(int(uint(_334) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_350)]);
        uint _354 = uint(int(uint(_154) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_336) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_334) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        uint _366 = uint(int(uint(_154) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        uint _370 = uint(int(uint(_336) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        float _374 = _340 * _340;
        float _376 = _344 * _344;
        float _378 = _348 * _348;
        float _380 = fma(_352, _352, _376);
        float _382 = fma(_356, _356, _374);
        float _384 = fma(_360, _360, _378);
        float _386 = fma(_364, _364, _380);
        float _388 = fma(_368, _368, _382);
        float _390 = sqrt(_386);
        float _392 = fma(_372, _372, _384);
        float _394 = sqrt(_388);
        float _396 = sqrt(_392);
        bool _398 = _390 > 0.0;
        bool _400 = _394 > 0.0;
        bool _402 = _396 > 0.0;
        float _404 = _226;
        float _406 = _376;
        float _408 = _388;
        float _410 = _394;
        float _412 = _384;
        float _414 = _396;
        float _416 = _386;
        float _418 = _352;
        if (_398)
        {
            float _420 = rsqrt(_386);
            _404 = _420;
        }
        float _422 = _404;
        float _424 = _390;
        if (_400)
        {
            float _426 = rsqrt(_388);
            _424 = _426;
        }
        float _428 = _424;
        float _430 = 0.0;
        if (_402)
        {
            float _432 = rsqrt(_392);
            _430 = _432;
        }
        float _434 = _430;
        if (!_398)
        {
            _406 = 0.0;
        }
        float _436 = _406;
        float _438 = _436;
        float _440 = _422;
        if (_398)
        {
            float _442 = _344 * _422;
            _438 = _442;
        }
        float _444 = _438;
        _292 = _444;
        if (!_398)
        {
            _288 = 0.0;
        }
        float _446 = _288;
        float _448 = _446;
        if (_398)
        {
            float _450 = _352 * _422;
            _448 = _450;
        }
        float _452 = _448;
        _298 = _452;
        if (!_398)
        {
            _408 = 0.0;
        }
        float _454 = _408;
        float _456 = _454;
        if (_398)
        {
            float _458 = _364 * _422;
            _456 = _458;
        }
        float _460 = _456;
        _304 = _460;
        if (!_400)
        {
            _410 = 0.0;
        }
        float _462 = _410;
        float _464 = _462;
        if (_400)
        {
            float _466 = _340 * _428;
            _464 = _466;
        }
        float _468 = _464;
        _290 = _468;
        if (!_400)
        {
            _412 = 0.0;
        }
        float _470 = _412;
        float _472 = _470;
        if (_400)
        {
            float _474 = _356 * _428;
            _472 = _474;
        }
        float _476 = _472;
        _296 = _476;
        if (!_400)
        {
            _414 = 0.0;
        }
        float _478 = _414;
        float _480 = _478;
        if (_400)
        {
            float _482 = _368 * _428;
            _480 = _482;
        }
        float _484 = _480;
        _302 = _484;
        if (!_402)
        {
            _416 = 0.0;
        }
        float _486 = _416;
        float _488 = _486;
        if (!_402)
        {
            _440 = 0.0;
        }
        float _490 = _440;
        float _492 = _490;
        if (_402)
        {
            float _494 = _348 * _434;
            _488 = _494;
        }
        float _496 = _488;
        _294 = _496;
        if (!_402)
        {
            _418 = 0.0;
        }
        float _498 = _418;
        _306 = _498;
        if (_402)
        {
            float _500 = _360 * _434;
            _492 = _500;
        }
        float _502 = _492;
        _300 = _502;
        if (_402)
        {
            float _504 = _372 * _434;
            _306 = _504;
        }
    }
    float _506 = _290;
    float _508 = _292;
    float _510 = _294;
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = _302;
    float _520 = _304;
    float _522 = _306;
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    bool _548 = _530 != 1.0;
    bool _550 = isnan(_530);
    bool _552 = _548 || _550;
    bool _554 = isnan(1.0);
    bool _556 = _552 || _554;
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    float _564 = _556 ? _266 : 0.0;
    float _566 = _532 * 0.00999999977648258209228515625;
    float _568 = _556 ? _272 : 0.3141500055789947509765625;
    float _570 = _556 ? _278 : 0.92653000354766845703125;
    float _572 = _536 * _564;
    float _574 = _536 * _566;
    float _576 = _536 * _568;
    float _578 = _536 * _570;
    float _580 = _568;
    float _582 = _566;
    float _584 = _572;
    float _586 = _576;
    float _588 = _578;
    float _590 = _534;
    float _592 = _570;
    float _594 = _546;
    float _596 = _574;
    float _598 = _574;
    float _600 = _506;
    float _602 = _558;
    float _604 = _510;
    float _606 = _560;
    float _608 = _508;
    float _610 = _512;
    float _612 = _514;
    float _614 = _522;
    float _616 = _518;
    float _618 = _562;
    if (!_556)
    {
        float _620 = _534 * 0.00999999977648258209228515625;
        float _622 = _544 * _574;
        float _624 = fma(_272, 2.0, -1.0);
        float _626 = _536 * _620;
        float _628 = fma(_266, 2.0, -1.0);
        float _630 = fma(_278, 2.0, -1.0);
        float _632 = fma(_626, _624, _622);
        float _634 = fma(_626, _628, _622);
        float _636 = fma(_626, _630, _622);
        float _638 = _576 + _632;
        float _640 = _572 + _634;
        float _642 = _578 + _636;
        _580 = _636;
        _582 = _634;
        _584 = _640;
        _586 = _638;
        _588 = _642;
    }
    float _644 = _580;
    float _646 = _582;
    float _648 = _584;
    float _650 = _586;
    float _652 = _588;
    float _654 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _656 = -_538;
    float _658 = _656 + 1.0;
    float _660 = -_540;
    float _662 = _660 + 1.0;
    float _664 = _644;
    if (_556)
    {
        _664 = 0.0;
    }
    float _666 = _664;
    float _668 = _666;
    if (!_556)
    {
        float _670 = _538 * _574;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _524 * _542;
    float _676 = fma(_658, _662, _540);
    float _678 = -_282;
    float _680 = _544 + _678;
    float _682 = abs(_540);
    float _684 = log2(_682);
    bool _686 = _672 != 0.0;
    bool _688 = isnan(_672);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = _528 * _542;
    bool _698 = _676 != 1.0;
    bool _700 = isnan(_676);
    bool _702 = _698 || _700;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = _546 != 1.0;
    bool _710 = isnan(_546);
    bool _712 = _708 || _710;
    bool _714 = isnan(1.0);
    bool _716 = _712 || _714;
    bool _718 = !_706;
    bool _720 = _716 || _718;
    float _722 = _538 * _674;
    float _724 = _538 * _684;
    float _726 = _646;
    float _728 = _696;
    float _730 = _696;
    float _732 = _672;
    float _734 = _680;
    if (!_720)
    {
        float _736 = abs(_676);
        float _738 = log2(_736);
        _726 = _738;
    }
    float _740 = _726;
    if (!_720)
    {
        float _742 = -_676;
        float _744 = _742 + 1.0;
        _590 = _744;
    }
    float _746 = _590;
    if (_720)
    {
        _592 = _680;
    }
    float _748 = _592;
    float _750 = 0.0;
    float _752 = _748;
    if (!_720)
    {
        float _754 = 1.0 / _746;
        _750 = _754;
    }
    float _756 = _750;
    float _758 = _526 * _542;
    float _760 = _538 * _696;
    float _762 = _538 * _758;
    float _764 = _740;
    float _766 = _756;
    float _768 = _756;
    if (!_720)
    {
        float _770 = _680 * _740;
        _764 = _770;
    }
    float _772 = _764;
    float _774 = exp2(_724);
    float _776 = _772;
    if (!_720)
    {
        float _778 = exp2(_772);
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_186, _774, _762);
    float _784 = fma(_192, _774, _760);
    if (!_720)
    {
        float _786 = -_780;
        float _788 = _786 + 1.0;
        _594 = _788;
    }
    float _790 = _594;
    float _792 = fma(_180, _774, _722);
    if (!_720)
    {
        float _794 = _790 * _756;
        _752 = _794;
    }
    float _796 = _752;
    float _798 = _796 + _648;
    float _800 = _538 + _798;
    float _802 = _800 + _672;
    bool _804 = _654 != 1.0;
    bool _806 = isnan(_654);
    bool _808 = _804 || _806;
    bool _810 = isnan(1.0);
    bool _812 = _808 || _810;
    float _894;
    float _906;
    float _908;
    float _910;
    float _1050;
    float _1080;
    float _1100;
    float _1118;
    float _1120;
    float _1124;
    float _1132;
    float _1134;
    float _1138;
    float _1142;
    float _1146;
    float _1150;
    float _1154;
    float _1156;
    if (!_694)
    {
        if (_812)
        {
            _596 = 0.60000002384185791015625;
        }
        float _814 = _596;
        float _816 = 0.0;
        if (!_812)
        {
            float _818 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _816 = _818;
        }
        float _820 = _816;
        if (_812)
        {
            _766 = 0.4199999868869781494140625;
        }
        float _822 = _766;
        float _824 = 0.0;
        if (_812)
        {
            _824 = 0.23000000417232513427734375;
        }
        float _826 = _824;
        float _828 = 0.0;
        if (!_812)
        {
            float _830 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _828 = _830;
        }
        float _832 = _828;
        float _834 = _814;
        if (!_812)
        {
            float _836 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _834 = _836;
        }
        float _838 = _834;
        float _840 = _822;
        if (!_812)
        {
            float _842 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _840 = _842;
        }
        float _844 = _840;
        float _846 = 0.0;
        if (_812)
        {
            _846 = 0.1500000059604644775390625;
        }
        float _848 = _846;
        float _850 = _826;
        if (!_812)
        {
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _850 = _852;
        }
        float _854 = _850;
        float _856 = _848;
        if (!_812)
        {
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _856 = _858;
        }
        float _860 = _856;
        float _862 = 0.0;
        if (!_812)
        {
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _862 = _864;
        }
        float _866 = _862;
        float _868 = 0.0;
        if (!_812)
        {
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _868 = _870;
        }
        float _872 = _868;
        if (_812)
        {
            _728 = 0.60000002384185791015625;
        }
        float _874 = _728;
        float _876 = _536 * _838;
        float _878 = _874;
        float _880 = _838;
        if (!_812)
        {
            _878 = _838;
        }
        float _882 = _878;
        float _884 = _882;
        if (_812)
        {
            _880 = 0.4199999868869781494140625;
        }
        float _886 = _880;
        float _888 = _536 * _844;
        float _890 = 1.0 / _876;
        float _892 = _886;
        _894 = _820;
        if (!_812)
        {
            _892 = _844;
        }
        float _896 = _892;
        float _898 = _536 * _854;
        float _900 = _536 * _882;
        float _902 = 1.0 / _888;
        float _904 = _896;
        _906 = _832;
        _908 = _866;
        _910 = _872;
        if (_812)
        {
            _884 = 0.23000000417232513427734375;
        }
        float _912 = _884;
        float _914 = _536 * _860;
        float _916 = _912;
        if (!_812)
        {
            _916 = _854;
        }
        float _918 = _916;
        float _920 = _802 * 6.283184051513671875;
        float _922 = _536 * _896;
        float _924 = 1.0 / _898;
        if (_812)
        {
            _904 = 0.1500000059604644775390625;
        }
        float _926 = _904;
        float _928 = _890 * _920;
        float _930 = _926;
        if (!_812)
        {
            _930 = _860;
        }
        float _932 = _930;
        float _934 = 1.0 / _922;
        float _936 = _536 * _918;
        float _938 = _928 * 0.15915493667125701904296875;
        float _940 = 1.0 / _914;
        float _942 = _902 * _920;
        float _944 = 1.0 / _900;
        float _946 = _536 * _932;
        float _948 = _942 * 0.15915493667125701904296875;
        float _950 = _924 * _920;
        float _952 = _798 * _934;
        float _954 = 1.0 / _936;
        float _956 = _950 * 0.15915493667125701904296875;
        float _958 = _940 * _920;
        float _960 = _952 * 6.283184051513671875;
        float _962 = 1.0 / _946;
        float _964 = _958 * 0.15915493667125701904296875;
        float _966 = _798 * _944;
        float _968 = _960 * 0.15915493667125701904296875;
        float _970 = _948 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _966 * 6.283184051513671875;
        float _976 = _798 * _954;
        float _978 = _954;
        float _980 = _976;
        if (_812)
        {
            _978 = 3.0;
        }
        float _982 = _978;
        float _984 = _974 * 0.15915493667125701904296875;
        float _986 = _968 * 6.283185482025146484375;
        float _988 = sin(_986);
        float _990 = _798 * _962;
        float _992 = _976 * 6.283184051513671875;
        float _994 = _982;
        float _996 = _992;
        if (!_812)
        {
            _994 = _820;
        }
        float _998 = _994;
        float _1000 = _990 * 6.283184051513671875;
        float _1002 = _938 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        float _1006 = _992 * 0.15915493667125701904296875;
        float _1008 = _972 * _998;
        float _1010 = _1000 * 0.15915493667125701904296875;
        float _1012 = _1000;
        float _1014 = _1006;
        float _1016 = _1008;
        if (_812)
        {
            _980 = 3.0;
        }
        float _1018 = _980;
        float _1020 = _984 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        float _1024 = _1018;
        if (!_812)
        {
            _1024 = _820;
        }
        float _1026 = _1024;
        float _1028 = _1026;
        if (_812)
        {
            _996 = 4.0;
        }
        float _1030 = _996;
        float _1032 = _956 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030;
        if (!_812)
        {
            _1036 = _832;
        }
        float _1038 = _1036;
        float _1040 = _988 * _1026;
        float _1042 = _1006 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        float _1046 = _1038;
        float _1048 = _1040;
        _1050 = _988;
        if (_812)
        {
            _1028 = 4.0;
        }
        float _1052 = _1028;
        float _1054 = _1052;
        if (!_812)
        {
            _1054 = _832;
        }
        float _1056 = _1054;
        float _1058 = _964 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = fma(_1004, _1038, _1008);
        float _1064 = _1062;
        if (_812)
        {
            _1012 = 2.0;
        }
        float _1066 = _1012;
        float _1068 = _1010 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066;
        if (_812)
        {
            _1046 = 2.0;
        }
        float _1074 = _1046;
        float _1076 = fma(_1022, _1056, _1040);
        float _1078 = _1074;
        _1080 = _1022;
        if (!_812)
        {
            _1072 = _866;
        }
        float _1082 = _1072;
        if (!_812)
        {
            _1078 = _866;
        }
        float _1084 = _1078;
        float _1086 = _1084;
        if (_812)
        {
            _1014 = 1.5;
        }
        float _1088 = _1014;
        float _1090 = _1088;
        if (_812)
        {
            _1016 = 1.5;
        }
        float _1092 = _1016;
        float _1094 = fma(_1034, _1082, _1062);
        float _1096 = _1092;
        float _1098 = _1094;
        _1100 = _1034;
        if (!_812)
        {
            _1090 = _872;
        }
        float _1102 = _1090;
        float _1104 = fma(_1044, _1084, _1076);
        float _1106 = _1102;
        float _1108 = _1044;
        if (!_812)
        {
            _1096 = _872;
        }
        float _1110 = _1096;
        float _1112 = fma(_1060, _1102, _1094);
        float _1114 = fma(_1070, _1110, _1104);
        float _1116 = _1110;
        _1118 = _1070;
        _1120 = _1112;
        if (_812)
        {
            _1098 = 1.5;
        }
        float _1122 = _1098;
        _1124 = _1122;
        if (_812)
        {
            _1106 = 2.0;
        }
        float _1126 = _1106;
        float _1128 = -_1114;
        float _1130 = _1112 + _1128;
        _1132 = _1126;
        _1134 = _1130;
        if (_812)
        {
            _1116 = 3.0;
        }
        float _1136 = _1116;
        _1138 = _1136;
        if (_812)
        {
            _1086 = 4.0;
        }
        float _1140 = _1086;
        _1142 = _1140;
        if (_812)
        {
            _1064 = 0.1500000059604644775390625;
        }
        float _1144 = _1064;
        _1146 = _1144;
        if (_812)
        {
            _1048 = 0.23000000417232513427734375;
        }
        float _1148 = _1048;
        _1150 = _1148;
        if (_812)
        {
            _1108 = 0.4199999868869781494140625;
        }
        float _1152 = _1108;
        _1154 = _1152;
        _1156 = 0.0;
        _1158 = true;
    }
    else
    {
        if (_812)
        {
            _768 = 0.4199999868869781494140625;
        }
        float _1160 = _768;
        float _1162 = 0.0;
        if (!_812)
        {
            float _1164 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1162 = _1164;
        }
        float _1166 = _1162;
        float _1168 = 0.0;
        if (_812)
        {
            _1168 = 0.60000002384185791015625;
        }
        float _1170 = _1168;
        float _1172 = 0.0;
        if (_812)
        {
            _1172 = 0.23000000417232513427734375;
        }
        float _1174 = _1172;
        float _1176 = 0.0;
        if (!_812)
        {
            float _1178 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1176 = _1178;
        }
        float _1180 = _1176;
        float _1182 = _1160;
        if (!_812)
        {
            float _1184 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1182 = _1184;
        }
        float _1186 = _1182;
        float _1188 = 0.0;
        if (_812)
        {
            _1188 = 0.1500000059604644775390625;
        }
        float _1190 = _1188;
        float _1192 = _1170;
        if (!_812)
        {
            float _1194 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1192 = _1194;
        }
        float _1196 = _1192;
        float _1198 = _1174;
        if (!_812)
        {
            float _1200 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1198 = _1200;
        }
        float _1202 = _1198;
        float _1204 = _1190;
        if (!_812)
        {
            float _1206 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1204 = _1206;
        }
        float _1208 = _1204;
        float _1210 = 0.0;
        if (!_812)
        {
            float _1212 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1210 = _1212;
        }
        float _1214 = _1210;
        float _1216 = 0.0;
        if (!_812)
        {
            float _1218 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1216 = _1218;
        }
        float _1220 = _1216;
        if (_812)
        {
            _730 = 0.4199999868869781494140625;
        }
        float _1222 = _730;
        float _1224 = _1222;
        if (_812)
        {
            _598 = 0.4199999868869781494140625;
        }
        float _1226 = _598;
        float _1228 = _648 * 6.283184051513671875;
        float _1230 = _1226;
        float _1232 = _1186;
        if (!_812)
        {
            _1224 = _1186;
        }
        float _1234 = _1224;
        float _1236 = _536 * _1186;
        float _1238 = _1234;
        if (!_812)
        {
            _1230 = _1186;
        }
        float _1240 = _1230;
        float _1242 = _536 * _1234;
        float _1244 = _1240;
        if (_812)
        {
            _1238 = 0.4199999868869781494140625;
        }
        float _1246 = _1238;
        float _1248 = 1.0 / _1236;
        float _1250 = _1246;
        if (!_812)
        {
            _1250 = _1186;
        }
        float _1252 = _1250;
        float _1254 = _536 * _1196;
        float _1256 = _1252;
        _894 = _1166;
        if (_812)
        {
            _1232 = 0.60000002384185791015625;
        }
        float _1258 = _1232;
        float _1260 = _536 * _1202;
        float _1262 = _1258;
        if (!_812)
        {
            _1262 = _1196;
        }
        float _1264 = _1262;
        float _1266 = _536 * _1240;
        float _1268 = _1264;
        if (_812)
        {
            _1244 = 0.60000002384185791015625;
        }
        float _1270 = _1244;
        float _1272 = _1270;
        if (!_812)
        {
            _1272 = _1196;
        }
        float _1274 = _1272;
        float _1276 = _536 * _1252;
        float _1278 = 1.0 / _1254;
        float _1280 = _1274;
        if (_812)
        {
            _1256 = 0.60000002384185791015625;
        }
        float _1282 = _1256;
        float _1284 = _1282;
        if (!_812)
        {
            _1284 = _1196;
        }
        float _1286 = _1284;
        float _1288 = _536 * _1208;
        float _1290 = 1.0 / _1260;
        float _1292 = _536 * _1264;
        float _1294 = _1286;
        _906 = _1180;
        _908 = _1214;
        _910 = _1220;
        if (_812)
        {
            _1268 = 0.23000000417232513427734375;
        }
        float _1296 = _1268;
        float _1298 = _1296;
        if (!_812)
        {
            _1298 = _1202;
        }
        float _1300 = _1298;
        float _1302 = _536 * _1274;
        float _1304 = _1300;
        if (_812)
        {
            _1280 = 0.23000000417232513427734375;
        }
        float _1306 = _1280;
        float _1308 = 1.0 / _1276;
        float _1310 = _1306;
        if (!_812)
        {
            _1310 = _1202;
        }
        float _1312 = _1310;
        float _1314 = 1.0 / _1242;
        float _1316 = 1.0 / _1266;
        float _1318 = _536 * _1286;
        float _1320 = _1312;
        if (_812)
        {
            _1294 = 0.23000000417232513427734375;
        }
        float _1322 = _1294;
        float _1324 = _1322;
        if (!_812)
        {
            _1324 = _1202;
        }
        float _1326 = _1324;
        float _1328 = _802 * 6.283184051513671875;
        float _1330 = 1.0 / _1288;
        float _1332 = _536 * _1300;
        float _1334 = _536 * _1326;
        float _1336 = 1.0 / _1302;
        float _1338 = _536 * _1312;
        float _1340 = _1326;
        if (_812)
        {
            _1320 = 0.1500000059604644775390625;
        }
        float _1342 = _1320;
        float _1344 = _1342;
        if (!_812)
        {
            _1344 = _1208;
        }
        float _1346 = _1344;
        float _1348 = 1.0 / _1292;
        if (_812)
        {
            _1340 = 0.1500000059604644775390625;
        }
        float _1350 = _1340;
        float _1352 = _1350;
        if (!_812)
        {
            _1352 = _1208;
        }
        float _1354 = _1352;
        float _1356 = 1.0 / _1332;
        if (_812)
        {
            _1304 = 0.1500000059604644775390625;
        }
        float _1358 = _1304;
        float _1360 = 1.0 / _1318;
        float _1362 = _1248 * _1328;
        float _1364 = _1358;
        if (!_812)
        {
            _1364 = _1208;
        }
        float _1366 = _1364;
        float _1368 = _536 * _1354;
        float _1370 = 1.0 / _1338;
        float _1372 = _536 * _1346;
        float _1374 = _1362 * 0.15915493667125701904296875;
        float _1376 = _1278 * _1328;
        float _1378 = _648 + _672;
        float _1380 = _1308 * _1228;
        float _1382 = _1376 * 0.15915493667125701904296875;
        float _1384 = _1378 * 6.283184051513671875;
        float _1386 = _1290 * _1328;
        float _1388 = _1380 * 0.15915493667125701904296875;
        float _1390 = _1374 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = _1336 * _1384;
        float _1396 = _536 * _1366;
        float _1398 = _1386 * 0.15915493667125701904296875;
        float _1400 = _1316 * _1384;
        float _1402 = _1330 * _1328;
        float _1404 = _1394 * 0.15915493667125701904296875;
        float _1406 = 1.0 / _1334;
        float _1408 = _1360 * _1228;
        float _1410 = _1400 * 0.15915493667125701904296875;
        float _1412 = _798 * _1314;
        float _1414 = _1408 * 0.15915493667125701904296875;
        float _1416 = 1.0 / _1372;
        float _1418 = _1408;
        float _1420 = _1372;
        if (_812)
        {
            _1418 = 3.0;
        }
        float _1422 = _1418;
        float _1424 = _1412 * 6.283184051513671875;
        float _1426 = _1422;
        if (!_812)
        {
            _1426 = _1166;
        }
        float _1428 = _1426;
        float _1430 = _1388 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1424 * 0.15915493667125701904296875;
        float _1436 = _1392 * _1428;
        float _1438 = _1428;
        if (_812)
        {
            _1438 = 3.0;
        }
        float _1440 = _1438;
        float _1442 = _1440;
        if (!_812)
        {
            _1442 = _1166;
        }
        float _1444 = _1442;
        float _1446 = 1.0 / _1368;
        float _1448 = _1406 * _1228;
        float _1450 = _1434 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1432 * _1444;
        float _1456 = _1448 * 0.15915493667125701904296875;
        float _1458 = _1416 * _1384;
        float _1460 = _798 * _1348;
        float _1462 = _1414 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        float _1466 = _1458 * 0.15915493667125701904296875;
        float _1468 = _1460 * 6.283184051513671875;
        float _1470 = _1460;
        if (_812)
        {
            _1420 = 3.0;
        }
        float _1472 = _1420;
        float _1474 = 1.0 / _1396;
        float _1476 = _1472;
        if (!_812)
        {
            _1476 = _1166;
        }
        float _1478 = _1476;
        float _1480 = _1468 * 0.15915493667125701904296875;
        float _1482 = _1382 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1478;
        if (_812)
        {
            _1470 = 4.0;
        }
        float _1488 = _1470;
        float _1490 = _1370 * _1384;
        float _1492 = _1488;
        float _1494 = _1490;
        if (!_812)
        {
            _1492 = _1180;
        }
        float _1496 = _1492;
        float _1498 = _1410 * 6.283185482025146484375;
        float _1500 = sin(_1498);
        float _1502 = _1452 * _1478;
        float _1504 = _798 * _1356;
        float _1506 = _1504;
        if (_812)
        {
            _1486 = 4.0;
        }
        float _1508 = _1486;
        float _1510 = _1490 * 0.15915493667125701904296875;
        float _1512 = _1508;
        if (!_812)
        {
            _1512 = _1180;
        }
        float _1514 = _1512;
        float _1516 = fma(_1464, _1496, _1454);
        float _1518 = _1404 * 6.283185482025146484375;
        float _1520 = sin(_1518);
        if (_812)
        {
            _1494 = 3.0;
        }
        float _1522 = _1494;
        float _1524 = _1504 * 6.283184051513671875;
        float _1526 = _1522;
        float _1528 = _1524;
        if (!_812)
        {
            _1526 = _1166;
        }
        float _1530 = _1526;
        float _1532 = _1480 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        float _1536 = _798 * _1474;
        float _1538 = fma(_1484, _1514, _1436);
        float _1540 = _1524 * 0.15915493667125701904296875;
        float _1542 = _1500 * _1530;
        float _1544 = _1446 * _1228;
        float _1546 = _1536 * 6.283184051513671875;
        float _1548 = _1530;
        float _1550 = _1474;
        float _1552 = _1546;
        float _1554 = _1538;
        _1050 = _1500;
        if (_812)
        {
            _1548 = 4.0;
        }
        float _1556 = _1548;
        float _1558 = _1398 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        float _1562 = _1556;
        if (_812)
        {
            _1550 = 4.0;
        }
        float _1564 = _1550;
        float _1566 = _1402 * 0.15915493667125701904296875;
        float _1568 = _1564;
        if (!_812)
        {
            _1562 = _1180;
        }
        float _1570 = _1562;
        float _1572 = _1570;
        if (!_812)
        {
            _1568 = _1180;
        }
        float _1574 = _1568;
        float _1576 = _1510 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1544 * 0.15915493667125701904296875;
        float _1582 = _1546 * 0.15915493667125701904296875;
        float _1584 = _1456 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = fma(_1520, _1570, _1542);
        float _1590 = fma(_1534, _1574, _1502);
        float _1592 = _1540 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = _1574;
        float _1598 = _1582;
        if (_812)
        {
            _1572 = 2.0;
        }
        float _1600 = _1572;
        float _1602 = _1600;
        if (_812)
        {
            _1506 = 2.0;
        }
        float _1604 = _1506;
        float _1606 = _1604;
        if (_812)
        {
            _1528 = 2.0;
        }
        float _1608 = _1528;
        float _1610 = _1566 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = _1608;
        if (!_812)
        {
            _1602 = _1214;
        }
        float _1616 = _1602;
        float _1618 = _1616;
        if (!_812)
        {
            _1606 = _1214;
        }
        float _1620 = _1606;
        float _1622 = _1466 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        float _1626 = _1620;
        if (!_812)
        {
            _1614 = _1214;
        }
        float _1628 = _1614;
        float _1630 = _1580 * 6.283185482025146484375;
        float _1632 = sin(_1630);
        float _1634 = _1628;
        if (_812)
        {
            _1596 = 2.0;
        }
        float _1636 = _1596;
        float _1638 = _1582 * 6.283185482025146484375;
        float _1640 = sin(_1638);
        float _1642 = _1636;
        if (!_812)
        {
            _1642 = _1214;
        }
        float _1644 = _1642;
        float _1646 = fma(_1560, _1616, _1538);
        float _1648 = fma(_1578, _1620, _1588);
        float _1650 = fma(_1586, _1628, _1516);
        _1100 = _1646;
        _1156 = _1578;
        if (_812)
        {
            _1552 = 1.5;
        }
        float _1652 = _1552;
        float _1654 = _1652;
        if (_812)
        {
            _1618 = 1.5;
        }
        float _1656 = _1618;
        float _1658 = _1656;
        if (_812)
        {
            _1626 = 1.5;
        }
        float _1660 = _1626;
        float _1662 = _1660;
        if (_812)
        {
            _1634 = 1.5;
        }
        float _1664 = _1634;
        float _1666 = fma(_1594, _1644, _1590);
        float _1668 = _1664;
        _1080 = _1632;
        if (!_812)
        {
            _1654 = _1220;
        }
        float _1670 = _1654;
        if (!_812)
        {
            _1662 = _1220;
        }
        float _1672 = _1662;
        float _1674 = _1672;
        if (!_812)
        {
            _1668 = _1220;
        }
        float _1676 = _1668;
        if (!_812)
        {
            _1658 = _1220;
        }
        float _1678 = _1658;
        float _1680 = fma(_1612, _1670, _1646);
        float _1682 = fma(_1624, _1672, _1648);
        float _1684 = fma(_1632, _1676, _1650);
        float _1686 = fma(_1640, _1678, _1666);
        float _1688 = -_1682;
        float _1690 = _1688 + _1684;
        float _1692 = -_1686;
        float _1694 = _1680 + _1692;
        float _1696 = _1686;
        float _1698 = _1678;
        float _1700 = _1612;
        _1154 = _1694;
        _1118 = _1640;
        _1120 = _1682;
        if (_812)
        {
            _1696 = 1.5;
        }
        float _1702 = _1696;
        _1124 = _1702;
        if (_812)
        {
            _1698 = 2.0;
        }
        float _1704 = _1698;
        float _1706 = _1694 + _1690;
        _1132 = _1704;
        _1134 = _1706;
        if (_812)
        {
            _1700 = 3.0;
        }
        float _1708 = _1700;
        _1138 = _1708;
        if (_812)
        {
            _1674 = 4.0;
        }
        float _1710 = _1674;
        _1142 = _1710;
        if (_812)
        {
            _1554 = 0.1500000059604644775390625;
        }
        float _1712 = _1554;
        _1146 = _1712;
        if (_812)
        {
            _1598 = 0.23000000417232513427734375;
        }
        float _1714 = _1598;
        _1150 = _1714;
        if (_812)
        {
            _1154 = 0.4199999868869781494140625;
        }
    }
    _1158 = false;
    float _1716 = _1154;
    float _1718 = _1118;
    float _1720 = _1150;
    float _1722 = _1120;
    float _1724 = _1146;
    float _1726 = _1080;
    float _1728 = _1050;
    float _1730 = _1100;
    float _1732 = _1156;
    float _1734 = _1138;
    float _1736 = _894;
    float _1738 = _1142;
    float _1740 = _906;
    float _1742 = _1132;
    float _1744 = _908;
    float _1746 = _1124;
    float _1748 = _910;
    float _1750 = _1134;
    float _1752 = _796 + _650;
    float _1754 = _538 + _1752;
    float _1756 = _1754 + _672;
    float _1758 = _1718;
    float _1760 = _1722;
    float _1762 = _1726;
    float _1764 = _1728;
    float _1766 = _1730;
    float _1768 = _1722;
    float _1770 = _1726;
    float _1772 = _1728;
    float _1774 = _1732;
    float _1776 = _1718;
    float _1778 = _1730;
    float _1780 = _1752;
    float _1782 = _1716;
    float _1784 = _1720;
    float _1786 = _1724;
    float _1788 = _1742;
    float _1790 = _1734;
    float _1792 = _1738;
    float _1794 = _1746;
    float _1796 = _1716;
    float _1798 = _1720;
    float _1800 = _1724;
    float _1802 = _1746;
    float _1804 = _1748;
    float _1806 = _1742;
    float _1808 = _1734;
    float _1810 = _1738;
    float _1994;
    float _2012;
    float _2046;
    float _2070;
    float _2072;
    if (!_694)
    {
        if (_812)
        {
            _1758 = _1716;
        }
        float _1812 = _1758;
        if (_812)
        {
            _1760 = 0.60000002384185791015625;
        }
        float _1814 = _1760;
        float _1816 = _1812;
        if (!_812)
        {
            float _1818 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1816 = _1818;
        }
        float _1820 = _1816;
        if (_812)
        {
            _1762 = _1720;
        }
        float _1822 = _1762;
        float _1824 = _1814;
        if (!_812)
        {
            float _1826 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1824 = _1826;
        }
        float _1828 = _1824;
        if (_812)
        {
            _1764 = _1724;
        }
        float _1830 = _1764;
        float _1832 = _1822;
        if (!_812)
        {
            float _1834 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1832 = _1834;
        }
        float _1836 = _1832;
        float _1838 = _1830;
        if (!_812)
        {
            float _1840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1838 = _1840;
        }
        float _1842 = _1838;
        if (_812)
        {
            _1766 = _1716;
        }
        float _1844 = _1766;
        float _1846 = _1756 * 6.283184051513671875;
        float _1848 = _536 * _1820;
        float _1850 = _1844;
        float _1852 = _1820;
        if (!_812)
        {
            _1850 = _1820;
        }
        float _1854 = _1850;
        float _1856 = _1854;
        if (_812)
        {
            _1852 = 0.60000002384185791015625;
        }
        float _1858 = _1852;
        float _1860 = 1.0 / _1848;
        float _1862 = _536 * _1828;
        float _1864 = _536 * _1854;
        float _1866 = _1858;
        if (!_812)
        {
            _1866 = _1828;
        }
        float _1868 = _1866;
        float _1870 = _536 * _1836;
        float _1872 = _1868;
        if (_812)
        {
            _1856 = _1720;
        }
        float _1874 = _1856;
        float _1876 = _1874;
        if (!_812)
        {
            _1876 = _1836;
        }
        float _1878 = _1876;
        float _1880 = 1.0 / _1862;
        float _1882 = _536 * _1842;
        float _1884 = _536 * _1868;
        if (_812)
        {
            _1872 = _1724;
        }
        float _1886 = _1872;
        float _1888 = _1886;
        if (!_812)
        {
            _1888 = _1842;
        }
        float _1890 = _1888;
        float _1892 = 1.0 / _1870;
        float _1894 = _1860 * _1846;
        float _1896 = 1.0 / _1864;
        float _1898 = _536 * _1878;
        float _1900 = _1894 * 0.15915493667125701904296875;
        float _1902 = _1880 * _1846;
        float _1904 = 1.0 / _1882;
        float _1906 = 1.0 / _1884;
        float _1908 = _536 * _1890;
        float _1910 = _1902 * 0.15915493667125701904296875;
        float _1912 = _1892 * _1846;
        float _1914 = _1912 * 0.15915493667125701904296875;
        float _1916 = 1.0 / _1898;
        float _1918 = _1752 * _1896;
        float _1920 = _1904 * _1846;
        float _1922 = _1918 * 6.283184051513671875;
        float _1924 = _1920 * 0.15915493667125701904296875;
        float _1926 = 1.0 / _1908;
        float _1928 = _1752 * _1906;
        float _1930 = _1922 * 0.15915493667125701904296875;
        float _1932 = _1928 * 6.283184051513671875;
        float _1934 = _1752 * _1916;
        float _1936 = _1900 * 6.283185482025146484375;
        float _1938 = sin(_1936);
        float _1940 = _1932 * 0.15915493667125701904296875;
        float _1942 = _1916;
        float _1944 = _1934;
        if (_812)
        {
            _1942 = _1734;
        }
        float _1946 = _1942;
        float _1948 = _1934 * 6.283184051513671875;
        float _1950 = _1946;
        float _1952 = _1948;
        if (_812)
        {
            _1944 = _1734;
        }
        float _1954 = _1944;
        float _1956 = _1954;
        if (!_812)
        {
            _1950 = _1736;
        }
        float _1958 = _1950;
        float _1960 = _1752 * _1926;
        float _1962 = _1930 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1948 * 0.15915493667125701904296875;
        float _1968 = _1958;
        if (!_812)
        {
            _1956 = _1736;
        }
        float _1970 = _1956;
        float _1972 = _1960 * 6.283184051513671875;
        float _1974 = _1972;
        float _1976 = _1970;
        if (_812)
        {
            _1952 = _1738;
        }
        float _1978 = _1952;
        float _1980 = _1978;
        if (!_812)
        {
            _1980 = _1740;
        }
        float _1982 = _1980;
        float _1984 = _1972 * 0.15915493667125701904296875;
        float _1986 = _1910 * 6.283185482025146484375;
        float _1988 = sin(_1986);
        float _1990 = _1938 * _1958;
        float _1992 = _1982;
        _1994 = _1938;
        if (_812)
        {
            _1968 = _1742;
        }
        float _1996 = _1968;
        float _1998 = _1996;
        if (!_812)
        {
            _1998 = _1744;
        }
        float _2000 = _1998;
        if (_812)
        {
            _1974 = _1746;
        }
        float _2002 = _1974;
        float _2004 = _1940 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        float _2008 = _1964 * _1970;
        float _2010 = _2002;
        _2012 = _1964;
        if (_812)
        {
            _1976 = _1738;
        }
        float _2014 = _1976;
        float _2016 = _2014;
        if (!_812)
        {
            _2016 = _1740;
        }
        float _2018 = _2016;
        if (!_812)
        {
            _2010 = _1748;
        }
        float _2020 = _2010;
        float _2022 = _1914 * 6.283185482025146484375;
        float _2024 = sin(_2022);
        float _2026 = fma(_1988, _1982, _1990);
        float _2028 = _1988;
        if (_812)
        {
            _1992 = _1742;
        }
        float _2030 = _1992;
        float _2032 = _2030;
        if (!_812)
        {
            _2032 = _1744;
        }
        float _2034 = _2032;
        if (_812)
        {
            _2028 = _1746;
        }
        float _2036 = _2028;
        float _2038 = _1966 * 6.283185482025146484375;
        float _2040 = sin(_2038);
        float _2042 = fma(_2006, _2018, _2008);
        float _2044 = _2036;
        _2046 = _2006;
        if (!_812)
        {
            _2044 = _1748;
        }
        float _2048 = _2044;
        float _2050 = _1924 * 6.283185482025146484375;
        float _2052 = sin(_2050);
        float _2054 = fma(_2024, _2000, _2026);
        float _2056 = _1984 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        float _2060 = fma(_2040, _2034, _2042);
        float _2062 = fma(_2052, _2048, _2054);
        float _2064 = fma(_2058, _2020, _2060);
        float _2066 = -_2064;
        float _2068 = _2062 + _2066;
        _2070 = _2062;
        _2072 = _2068;
        _2074 = true;
    }
    else
    {
        if (_812)
        {
            _1768 = _1716;
        }
        float _2076 = _1768;
        if (_812)
        {
            _1770 = 0.60000002384185791015625;
        }
        float _2078 = _1770;
        float _2080 = _2076;
        if (!_812)
        {
            float _2082 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2080 = _2082;
        }
        float _2084 = _2080;
        if (_812)
        {
            _1772 = _1720;
        }
        float _2086 = _1772;
        float _2088 = _2078;
        if (!_812)
        {
            float _2090 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2088 = _2090;
        }
        float _2092 = _2088;
        if (_812)
        {
            _1774 = _1724;
        }
        float _2094 = _1774;
        float _2096 = _2086;
        if (!_812)
        {
            float _2098 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2096 = _2098;
        }
        float _2100 = _2096;
        float _2102 = _2094;
        if (!_812)
        {
            float _2104 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2102 = _2104;
        }
        float _2106 = _2102;
        if (_812)
        {
            _1776 = _1716;
        }
        float _2108 = _1776;
        float _2110 = _2108;
        if (_812)
        {
            _1778 = _1716;
        }
        float _2112 = _1778;
        float _2114 = _2112;
        float _2116 = _2084;
        if (!_812)
        {
            _2110 = _2084;
        }
        float _2118 = _2110;
        float _2120 = _536 * _2084;
        float _2122 = _2118;
        if (!_812)
        {
            _2114 = _2084;
        }
        float _2124 = _2114;
        float _2126 = _536 * _2092;
        float _2128 = _536 * _2118;
        float _2130 = _2124;
        if (_812)
        {
            _2122 = _1716;
        }
        float _2132 = _2122;
        float _2134 = 1.0 / _2120;
        float _2136 = _2132;
        if (!_812)
        {
            _2136 = _2084;
        }
        float _2138 = _2136;
        float _2140 = _536 * _2100;
        float _2142 = _2138;
        if (_812)
        {
            _2116 = 0.60000002384185791015625;
        }
        float _2144 = _2116;
        float _2146 = _536 * _2106;
        float _2148 = _536 * _2138;
        float _2150 = _2144;
        if (_812)
        {
            _2142 = 0.60000002384185791015625;
        }
        float _2152 = _2142;
        float _2154 = 1.0 / _2126;
        float _2156 = _2152;
        if (!_812)
        {
            _2150 = _2092;
        }
        float _2158 = _2150;
        float _2160 = _2158;
        if (!_812)
        {
            _2156 = _2092;
        }
        float _2162 = _2156;
        float _2164 = 1.0 / _2140;
        float _2166 = _536 * _2124;
        float _2168 = _2162;
        if (_812)
        {
            _2130 = 0.60000002384185791015625;
        }
        float _2170 = _2130;
        float _2172 = _2170;
        if (!_812)
        {
            _2172 = _2092;
        }
        float _2174 = _2172;
        float _2176 = 1.0 / _2146;
        float _2178 = _536 * _2174;
        float _2180 = _536 * _2162;
        float _2182 = _2174;
        if (_812)
        {
            _2182 = _1720;
        }
        float _2184 = _2182;
        float _2186 = _2184;
        if (!_812)
        {
            _2186 = _2100;
        }
        float _2188 = _2186;
        float _2190 = _2188;
        if (_812)
        {
            _2168 = _1720;
        }
        float _2192 = _2168;
        float _2194 = 1.0 / _2166;
        float _2196 = _536 * _2158;
        float _2198 = _2192;
        if (_812)
        {
            _2160 = _1720;
        }
        float _2200 = _2160;
        float _2202 = _2200;
        if (!_812)
        {
            _2202 = _2100;
        }
        float _2204 = _2202;
        float _2206 = _2204;
        if (!_812)
        {
            _2198 = _2100;
        }
        float _2208 = _2198;
        float _2210 = 1.0 / _2128;
        float _2212 = _536 * _2204;
        float _2214 = _2208;
        if (_812)
        {
            _2206 = _1724;
        }
        float _2216 = _2206;
        float _2218 = _2216;
        if (!_812)
        {
            _2218 = _2106;
        }
        float _2220 = _2218;
        float _2222 = 1.0 / _2178;
        float _2224 = _536 * _2188;
        if (_812)
        {
            _2190 = _1724;
        }
        float _2226 = _2190;
        float _2228 = _2226;
        if (!_812)
        {
            _2228 = _2106;
        }
        float _2230 = _2228;
        float _2232 = 1.0 / _2148;
        float _2234 = _536 * _2208;
        if (_812)
        {
            _2214 = _1724;
        }
        float _2236 = _2214;
        float _2238 = _536 * _2230;
        float _2240 = _2236;
        if (!_812)
        {
            _2240 = _2106;
        }
        float _2242 = _2240;
        float _2244 = _1756 * 6.283184051513671875;
        float _2246 = 1.0 / _2224;
        float _2248 = _536 * _2242;
        float _2250 = 1.0 / _2234;
        float _2252 = _650 + _672;
        float _2254 = 1.0 / _2180;
        float _2256 = _2134 * _2244;
        float _2258 = _2252 * 6.283184051513671875;
        float _2260 = _2256 * 0.15915493667125701904296875;
        float _2262 = _2194 * _2258;
        float _2264 = _2154 * _2244;
        float _2266 = _650 * 6.283184051513671875;
        float _2268 = _536 * _2220;
        float _2270 = 1.0 / _2248;
        float _2272 = _2264 * 0.15915493667125701904296875;
        float _2274 = _2232 * _2266;
        float _2276 = _2164 * _2244;
        float _2278 = _2262 * 0.15915493667125701904296875;
        float _2280 = _1752 * _2210;
        float _2282 = _2276 * 0.15915493667125701904296875;
        float _2284 = _2260 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = _2274 * 0.15915493667125701904296875;
        float _2290 = _2222 * _2258;
        float _2292 = _2280 * 6.283184051513671875;
        float _2294 = _2176 * _2244;
        float _2296 = _2290 * 0.15915493667125701904296875;
        float _2298 = _2254 * _2266;
        float _2300 = 1.0 / _2238;
        float _2302 = _2294 * 0.15915493667125701904296875;
        float _2304 = _2298 * 0.15915493667125701904296875;
        float _2306 = _2298;
        if (_812)
        {
            _2306 = _1734;
        }
        float _2308 = _2306;
        float _2310 = _2308;
        if (!_812)
        {
            _2310 = _1736;
        }
        float _2312 = _2310;
        float _2314 = _2278 * 6.283185482025146484375;
        float _2316 = sin(_2314);
        float _2318 = _2292 * 0.15915493667125701904296875;
        float _2320 = _2246 * _2258;
        float _2322 = _2286 * _2312;
        float _2324 = _2286;
        float _2326 = _2312;
        float _2328 = _2320;
        if (_812)
        {
            _2324 = _1734;
        }
        float _2330 = _2324;
        float _2332 = _2330;
        if (_812)
        {
            _2326 = _1734;
        }
        float _2334 = _2326;
        float _2336 = _2320 * 0.15915493667125701904296875;
        float _2338 = _2288 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        float _2342 = _2334;
        if (!_812)
        {
            _2332 = _1736;
        }
        float _2344 = _2332;
        float _2346 = _2300 * _2258;
        float _2348 = _2344;
        if (!_812)
        {
            _2342 = _1736;
        }
        float _2350 = _2342;
        if (_812)
        {
            _2328 = _1734;
        }
        float _2352 = _2328;
        float _2354 = _2346 * 0.15915493667125701904296875;
        float _2356 = _2352;
        if (!_812)
        {
            _2356 = _1736;
        }
        float _2358 = _2356;
        float _2360 = 1.0 / _2196;
        float _2362 = _2250 * _2266;
        float _2364 = _2362 * 0.15915493667125701904296875;
        float _2366 = _2316 * _2344;
        if (_812)
        {
            _2348 = _1738;
        }
        float _2368 = _2348;
        float _2370 = _2318 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        float _2374 = _2340 * _2350;
        float _2376 = _2368;
        if (!_812)
        {
            _2376 = _1740;
        }
        float _2378 = _2376;
        float _2380 = 1.0 / _2212;
        float _2382 = _1752 * _2360;
        float _2384 = _2360;
        float _2386 = _2382;
        if (_812)
        {
            _2384 = _1738;
        }
        float _2388 = _2384;
        float _2390 = _2388;
        if (!_812)
        {
            _2390 = _1740;
        }
        float _2392 = _2390;
        float _2394 = _2304 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = _2372 * _2358;
        float _2400 = _2382 * 6.283184051513671875;
        if (_812)
        {
            _2386 = _1738;
        }
        float _2402 = _2386;
        float _2404 = _2402;
        if (!_812)
        {
            _2404 = _1740;
        }
        float _2406 = _2404;
        float _2408 = _2400 * 0.15915493667125701904296875;
        float _2410 = _2296 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = _1752 * _2380;
        float _2416 = 1.0 / _2268;
        float _2418 = fma(_2396, _2406, _2374);
        float _2420 = _2414 * 6.283184051513671875;
        float _2422 = _2414;
        float _2424 = _2420;
        if (_812)
        {
            _2422 = _1742;
        }
        float _2426 = _2422;
        float _2428 = _2426;
        if (!_812)
        {
            _2428 = _1744;
        }
        float _2430 = _2428;
        float _2432 = _2272 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = fma(_2412, _2378, _2366);
        float _2438 = _2282 * 6.283185482025146484375;
        float _2440 = sin(_2438);
        float _2442 = _1752 * _2416;
        float _2444 = _2416;
        float _2446 = _2430;
        if (_812)
        {
            _2444 = _1742;
        }
        float _2448 = _2444;
        float _2450 = _2448;
        if (!_812)
        {
            _2450 = _1744;
        }
        float _2452 = _2450;
        float _2454 = _2442 * 6.283184051513671875;
        float _2456 = _2454;
        if (_812)
        {
            _1780 = _1738;
        }
        float _2458 = _1780;
        float _2460 = _2364 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        float _2464 = fma(_2434, _2392, _2322);
        float _2466 = _2420 * 0.15915493667125701904296875;
        float _2468 = _2454 * 0.15915493667125701904296875;
        float _2470 = _2458;
        if (!_812)
        {
            _2470 = _1740;
        }
        float _2472 = _2470;
        float _2474 = _2472;
        if (_812)
        {
            _2424 = _1742;
        }
        float _2476 = _2424;
        float _2478 = _2408 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        float _2482 = _2270 * _2266;
        float _2484 = fma(_2440, _2452, _2464);
        float _2486 = _2476;
        float _2488 = _2440;
        if (!_812)
        {
            _2486 = _1744;
        }
        float _2490 = _2486;
        float _2492 = _2482 * 0.15915493667125701904296875;
        float _2494 = _2490;
        if (_812)
        {
            _2456 = _1746;
        }
        float _2496 = _2456;
        float _2498 = _2336 * 6.283185482025146484375;
        float _2500 = sin(_2498);
        float _2502 = fma(_2462, _2490, _2418);
        float _2504 = _2496;
        if (_812)
        {
            _2488 = _1746;
        }
        float _2506 = _2488;
        float _2508 = _2506;
        if (_812)
        {
            _2494 = _1746;
        }
        float _2510 = _2494;
        float _2512 = _2510;
        if (!_812)
        {
            _2504 = _1748;
        }
        float _2514 = _2504;
        float _2516 = _2466 * 6.283185482025146484375;
        float _2518 = sin(_2516);
        float _2520 = fma(_2480, _2472, _2398);
        _1994 = _2514;
        if (_812)
        {
            _2474 = _1742;
        }
        float _2522 = _2474;
        float _2524 = _2522;
        if (!_812)
        {
            _2524 = _1744;
        }
        float _2526 = _2524;
        if (!_812)
        {
            _2512 = _1748;
        }
        float _2528 = _2512;
        float _2530 = _2302 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = fma(_2500, _2430, _2436);
        if (_812)
        {
            _2446 = _1746;
        }
        float _2536 = _2446;
        float _2538 = _2536;
        if (!_812)
        {
            _2538 = _1748;
        }
        float _2540 = _2538;
        if (!_812)
        {
            _2508 = _1748;
        }
        float _2542 = _2508;
        float _2544 = _2354 * 6.283185482025146484375;
        float _2546 = sin(_2544);
        float _2548 = fma(_2518, _2526, _2520);
        float _2550 = _2492 * 6.283185482025146484375;
        float _2552 = sin(_2550);
        float _2554 = fma(_2532, _2514, _2484);
        float _2556 = _2468 * 6.283185482025146484375;
        float _2558 = sin(_2556);
        float _2560 = fma(_2546, _2540, _2534);
        float _2562 = fma(_2552, _2528, _2502);
        float _2564 = -_2560;
        float _2566 = _2564 + _2562;
        float _2568 = fma(_2558, _2542, _2548);
        float _2570 = -_2568;
        float _2572 = _2554 + _2570;
        float _2574 = _2572 + _2566;
        _2070 = _2554;
        _2046 = _2548;
        _2012 = _2566;
        _2072 = _2574;
    }
    _2074 = false;
    float _2576 = _1994;
    float _2578 = _2070;
    float _2580 = _2046;
    float _2582 = _2012;
    float _2584 = _2072;
    float _2586 = _796 + _652;
    float _2588 = _286 * _538;
    float _2590 = _538 + _2586;
    float _2592 = fma(_186, _2588, _164);
    float _2594 = fma(_192, _2588, _170);
    float _2596 = fma(_180, _2588, _158);
    float _2598 = _2590 + _672;
    float _2600 = _2576;
    float _2602 = _2578;
    float _2604 = _2576;
    float _2606 = _2580;
    float _2608 = _2582;
    float _2822;
    if (!_694)
    {
        if (_812)
        {
            _308 = _1716;
        }
        float _2610 = _308;
        if (_812)
        {
            _310 = 0.60000002384185791015625;
        }
        float _2612 = _310;
        float _2614 = _2610;
        if (!_812)
        {
            float _2616 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2614 = _2616;
        }
        float _2618 = _2614;
        if (_812)
        {
            _732 = _1720;
        }
        float _2620 = _732;
        float _2622 = _2612;
        if (!_812)
        {
            float _2624 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2622 = _2624;
        }
        float _2626 = _2622;
        if (_812)
        {
            _2600 = _1724;
        }
        float _2628 = _2600;
        float _2630 = _2620;
        if (!_812)
        {
            float _2632 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2630 = _2632;
        }
        float _2634 = _2630;
        float _2636 = _2628;
        if (!_812)
        {
            float _2638 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2636 = _2638;
        }
        float _2640 = _2636;
        float _2642 = _2598 * 6.283184051513671875;
        float _2644 = _536 * _2618;
        float _2646 = _2618;
        if (!_812)
        {
            _1782 = _2618;
        }
        float _2648 = _1782;
        if (_812)
        {
            _2646 = 0.60000002384185791015625;
        }
        float _2650 = _2646;
        float _2652 = _536 * _2626;
        float _2654 = _2650;
        if (!_812)
        {
            _2654 = _2626;
        }
        float _2656 = _2654;
        float _2658 = 1.0 / _2644;
        float _2660 = _536 * _2648;
        float _2662 = _536 * _2634;
        if (!_812)
        {
            _1784 = _2634;
        }
        float _2664 = _1784;
        float _2666 = _536 * _2656;
        float _2668 = _536 * _2640;
        if (!_812)
        {
            _1786 = _2640;
        }
        float _2670 = _1786;
        float _2672 = 1.0 / _2652;
        float _2674 = _536 * _2664;
        float _2676 = _536 * _2670;
        float _2678 = 1.0 / _2662;
        float _2680 = _2658 * _2642;
        float _2682 = _2680 * 0.15915493667125701904296875;
        float _2684 = 1.0 / _2668;
        float _2686 = _2672 * _2642;
        float _2688 = _2686 * 0.15915493667125701904296875;
        float _2690 = 1.0 / _2660;
        float _2692 = _2678 * _2642;
        float _2694 = _2692 * 0.15915493667125701904296875;
        float _2696 = 1.0 / _2666;
        float _2698 = _2684 * _2642;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = 1.0 / _2674;
        float _2704 = _2586 * _2690;
        float _2706 = _2704 * 6.283184051513671875;
        float _2708 = 1.0 / _2676;
        float _2710 = _2586 * _2696;
        float _2712 = _2706 * 0.15915493667125701904296875;
        float _2714 = _2710 * 6.283184051513671875;
        float _2716 = _2586 * _2702;
        float _2718 = _2682 * 6.283185482025146484375;
        float _2720 = sin(_2718);
        float _2722 = _2676;
        float _2724 = _2714;
        if (_812)
        {
            _2722 = _1742;
        }
        float _2726 = _2722;
        float _2728 = _2716 * 6.283184051513671875;
        float _2730 = _2726;
        float _2732 = _2728;
        if (!_812)
        {
            _2730 = _1744;
        }
        float _2734 = _2730;
        if (!_812)
        {
            _1788 = _1744;
        }
        float _2736 = _1788;
        float _2738 = _2586 * _2708;
        float _2740 = _2712 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        float _2744 = _2714 * 0.15915493667125701904296875;
        float _2746 = _2728 * 0.15915493667125701904296875;
        float _2748 = _2738 * 6.283184051513671875;
        if (_812)
        {
            _2724 = _1734;
        }
        float _2750 = _2724;
        float _2752 = _2750;
        if (!_812)
        {
            _2752 = _1736;
        }
        float _2754 = _2752;
        float _2756 = _2748 * 0.15915493667125701904296875;
        float _2758 = _2688 * 6.283185482025146484375;
        float _2760 = sin(_2758);
        if (!_812)
        {
            _1790 = _1736;
        }
        float _2762 = _1790;
        float _2764 = _2762;
        if (_812)
        {
            _2732 = _1738;
        }
        float _2766 = _2732;
        float _2768 = _2720 * _2754;
        float _2770 = _2766;
        if (!_812)
        {
            _2770 = _1740;
        }
        float _2772 = _2770;
        if (!_812)
        {
            _1792 = _1740;
        }
        float _2774 = _1792;
        float _2776 = _2744 * 6.283185482025146484375;
        float _2778 = sin(_2776);
        float _2780 = _2742 * _2762;
        if (_812)
        {
            _2764 = _1746;
        }
        float _2782 = _2764;
        float _2784 = _2782;
        if (!_812)
        {
            _2784 = _1748;
        }
        float _2786 = _2784;
        if (!_812)
        {
            _1794 = _1748;
        }
        float _2788 = _1794;
        float _2790 = _2694 * 6.283185482025146484375;
        float _2792 = sin(_2790);
        float _2794 = fma(_2760, _2772, _2768);
        float _2796 = _2746 * 6.283185482025146484375;
        float _2798 = sin(_2796);
        float _2800 = fma(_2778, _2774, _2780);
        float _2802 = _2700 * 6.283185482025146484375;
        float _2804 = sin(_2802);
        float _2806 = fma(_2792, _2734, _2794);
        float _2808 = _2756 * 6.283185482025146484375;
        float _2810 = sin(_2808);
        float _2812 = fma(_2798, _2736, _2800);
        float _2814 = fma(_2804, _2786, _2806);
        float _2816 = fma(_2810, _2788, _2812);
        float _2818 = -_2816;
        float _2820 = _2814 + _2818;
        _2822 = _2820;
        _2824 = true;
    }
    else
    {
        if (_812)
        {
            _2602 = _1716;
        }
        float _2826 = _2602;
        if (_812)
        {
            _2604 = 0.60000002384185791015625;
        }
        float _2828 = _2604;
        if (_812)
        {
            _2606 = _1720;
        }
        float _2830 = _2606;
        float _2832 = _2826;
        if (!_812)
        {
            float _2834 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2832 = _2834;
        }
        float _2836 = _2832;
        float _2838 = _2828;
        if (!_812)
        {
            float _2840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2838 = _2840;
        }
        float _2842 = _2838;
        if (_812)
        {
            _2608 = _1724;
        }
        float _2844 = _2608;
        float _2846 = _2830;
        if (!_812)
        {
            float _2848 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2846 = _2848;
        }
        float _2850 = _2846;
        float _2852 = _2844;
        if (!_812)
        {
            float _2854 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2852 = _2854;
        }
        float _2856 = _2852;
        if (_812)
        {
            _312 = _1716;
        }
        float _2858 = _312;
        float _2860 = _2598 * 6.283184051513671875;
        float _2862 = _2858;
        if (_812)
        {
            _314 = _1716;
        }
        float _2864 = _314;
        float _2866 = _652 * 6.283184051513671875;
        float _2868 = _652 + _672;
        float _2870 = _2864;
        if (!_812)
        {
            _2862 = _2836;
        }
        float _2872 = _2862;
        float _2874 = _536 * _2836;
        float _2876 = _2872;
        if (!_812)
        {
            _2870 = _2836;
        }
        float _2878 = _2870;
        float _2880 = _536 * _2842;
        float _2882 = _2878;
        if (!_812)
        {
            _1796 = _2836;
        }
        float _2884 = _1796;
        float _2886 = 1.0 / _2874;
        float _2888 = _536 * _2878;
        float _2890 = _536 * _2850;
        float _2892 = _2850;
        if (_812)
        {
            _2882 = 0.60000002384185791015625;
        }
        float _2894 = _2882;
        float _2896 = _536 * _2884;
        float _2898 = _2894;
        if (!_812)
        {
            _2898 = _2842;
        }
        float _2900 = _2898;
        float _2902 = _536 * _2856;
        float _2904 = 1.0 / _2880;
        float _2906 = _536 * _2900;
        float _2908 = _2900;
        if (_812)
        {
            _2908 = _1720;
        }
        float _2910 = _2908;
        float _2912 = _2910;
        if (!_812)
        {
            _2912 = _2850;
        }
        float _2914 = _2912;
        float _2916 = 1.0 / _2890;
        float _2918 = _536 * _2872;
        float _2920 = _2914;
        if (_812)
        {
            _2876 = 0.60000002384185791015625;
        }
        float _2922 = _2876;
        float _2924 = _2922;
        if (!_812)
        {
            _2924 = _2842;
        }
        float _2926 = _2924;
        float _2928 = 1.0 / _2902;
        float _2930 = _536 * _2926;
        float _2932 = _2926;
        if (_812)
        {
            _2932 = 0.60000002384185791015625;
        }
        float _2934 = _2932;
        float _2936 = _2934;
        if (!_812)
        {
            _2936 = _2842;
        }
        float _2938 = _2936;
        float _2940 = 1.0 / _2918;
        float _2942 = _536 * _2938;
        float _2944 = _2938;
        if (_812)
        {
            _2944 = _1720;
        }
        float _2946 = _2944;
        float _2948 = _2946;
        if (!_812)
        {
            _2948 = _2850;
        }
        float _2950 = _2948;
        float _2952 = _2950;
        if (!_812)
        {
            _1798 = _2850;
        }
        float _2954 = _1798;
        float _2956 = 1.0 / _2888;
        float _2958 = _536 * _2914;
        float _2960 = _536 * _2950;
        if (_812)
        {
            _2920 = _1724;
        }
        float _2962 = _2920;
        float _2964 = _2962;
        if (_812)
        {
            _2952 = _1724;
        }
        float _2966 = _2952;
        float _2968 = _2966;
        if (!_812)
        {
            _2964 = _2856;
        }
        float _2970 = _2964;
        float _2972 = 1.0 / _2896;
        if (!_812)
        {
            _2968 = _2856;
        }
        float _2974 = _2968;
        if (!_812)
        {
            _1800 = _2856;
        }
        float _2976 = _1800;
        if (_812)
        {
            _2892 = _1746;
        }
        float _2978 = _2892;
        float _2980 = _536 * _2974;
        float _2982 = _2978;
        if (!_812)
        {
            _2982 = _1748;
        }
        float _2984 = _2982;
        float _2986 = 1.0 / _2906;
        float _2988 = _2586 * _2956;
        float _2990 = _2988 * 6.283184051513671875;
        float _2992 = 1.0 / _2960;
        float _2994 = _536 * _2954;
        float _2996 = _536 * _2970;
        float _2998 = _2972 * _2866;
        float _3000 = 1.0 / _2942;
        float _3002 = _536 * _2976;
        float _3004 = _2886 * _2860;
        float _3006 = _3004 * 0.15915493667125701904296875;
        float _3008 = _2904 * _2860;
        float _3010 = 1.0 / _3002;
        float _3012 = _3008 * 0.15915493667125701904296875;
        float _3014 = _2916 * _2860;
        float _3016 = 1.0 / _2980;
        float _3018 = _2868 * 6.283184051513671875;
        float _3020 = _2940 * _3018;
        float _3022 = 1.0 / _2930;
        float _3024 = _3014 * 0.15915493667125701904296875;
        float _3026 = _2928 * _2860;
        float _3028 = _2998 * 0.15915493667125701904296875;
        float _3030 = _2986 * _3018;
        float _3032 = _3020 * 0.15915493667125701904296875;
        float _3034 = _2986;
        float _3036 = _2992;
        float _3038 = _3018;
        float _3040 = _3016;
        float _3042 = _2990;
        if (_812)
        {
            _3034 = _1746;
        }
        float _3044 = _3034;
        float _3046 = _3026 * 0.15915493667125701904296875;
        float _3048 = 1.0 / _2994;
        float _3050 = _3030 * 0.15915493667125701904296875;
        float _3052 = _3000 * _2866;
        float _3054 = _3044;
        float _3056 = _3048;
        if (!_812)
        {
            _3054 = _1748;
        }
        float _3058 = _3054;
        float _3060 = _3052 * 0.15915493667125701904296875;
        float _3062 = _2992 * _3018;
        float _3064 = 1.0 / _2958;
        float _3066 = _2586 * _3022;
        if (_812)
        {
            _3036 = _1734;
        }
        float _3068 = _3036;
        float _3070 = _3062 * 0.15915493667125701904296875;
        float _3072 = _3016 * _3018;
        float _3074 = _3068;
        if (_812)
        {
            _3038 = _1746;
        }
        float _3076 = _3038;
        float _3078 = _3066 * 6.283184051513671875;
        float _3080 = _3076;
        if (!_812)
        {
            _3080 = _1748;
        }
        float _3082 = _3080;
        float _3084 = 1.0 / _2996;
        if (!_812)
        {
            _1802 = _1748;
        }
        float _3086 = _1802;
        float _3088 = _3072 * 0.15915493667125701904296875;
        if (_812)
        {
            _1804 = _1742;
        }
        float _3090 = _1804;
        float _3092 = _3010 * _2866;
        float _3094 = _3090;
        if (_812)
        {
            _3040 = _1742;
        }
        float _3096 = _3040;
        float _3098 = _3078 * 0.15915493667125701904296875;
        float _3100 = _3096;
        if (!_812)
        {
            _3094 = _1744;
        }
        float _3102 = _3094;
        float _3104 = _3032 * 6.283185482025146484375;
        float _3106 = sin(_3104);
        if (!_812)
        {
            _3100 = _1744;
        }
        float _3108 = _3100;
        float _3110 = _2586 * _3064;
        if (!_812)
        {
            _3074 = _1736;
        }
        float _3112 = _3074;
        float _3114 = _3092 * 0.15915493667125701904296875;
        float _3116 = _3110 * 6.283184051513671875;
        float _3118 = _3006 * 6.283185482025146484375;
        float _3120 = sin(_3118);
        float _3122 = _3048 * _2866;
        float _3124 = _3116;
        float _3126 = _3114;
        if (_812)
        {
            _3056 = _1742;
        }
        float _3128 = _3056;
        float _3130 = _2586 * _3084;
        float _3132 = _3128;
        float _3134 = _3084;
        if (!_812)
        {
            _3132 = _1744;
        }
        float _3136 = _3132;
        float _3138 = _3122 * 0.15915493667125701904296875;
        float _3140 = _3138;
        if (!_812)
        {
            _1806 = _1744;
        }
        float _3142 = _1806;
        float _3144 = _2990 * 0.15915493667125701904296875;
        float _3146 = _3028 * 6.283185482025146484375;
        float _3148 = sin(_3146);
        if (_812)
        {
            _3042 = _1734;
        }
        float _3150 = _3042;
        float _3152 = _3130 * 6.283184051513671875;
        float _3154 = _3150;
        if (!_812)
        {
            _3154 = _1736;
        }
        float _3156 = _3154;
        if (_812)
        {
            _3134 = _1738;
        }
        float _3158 = _3134;
        float _3160 = _3152 * 0.15915493667125701904296875;
        float _3162 = _3158;
        if (!_812)
        {
            _3162 = _1740;
        }
        float _3164 = _3162;
        float _3166 = _3144 * 6.283185482025146484375;
        float _3168 = sin(_3166);
        float _3170 = _3120 * _3112;
        float _3172 = _3138 * 6.283185482025146484375;
        float _3174 = sin(_3172);
        float _3176 = _3012 * 6.283185482025146484375;
        float _3178 = sin(_3176);
        if (_812)
        {
            _3140 = _1734;
        }
        float _3180 = _3140;
        float _3182 = _3168 * _3156;
        float _3184 = _3180;
        if (!_812)
        {
            _3184 = _1736;
        }
        float _3186 = _3184;
        if (!_812)
        {
            _1808 = _1736;
        }
        float _3188 = _1808;
        float _3190 = _3116 * 0.15915493667125701904296875;
        if (_812)
        {
            _3124 = _1738;
        }
        float _3192 = _3124;
        float _3194 = _3050 * 6.283185482025146484375;
        float _3196 = sin(_3194);
        float _3198 = _3192;
        if (!_812)
        {
            _3198 = _1740;
        }
        float _3200 = _3198;
        float _3202 = _3106 * _3186;
        float _3204 = _3148 * _3188;
        float _3206 = _3060 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        float _3210 = fma(_3178, _3200, _3170);
        float _3212 = _3098 * 6.283185482025146484375;
        float _3214 = sin(_3212);
        float _3216 = _3024 * 6.283185482025146484375;
        float _3218 = sin(_3216);
        float _3220 = _3070 * 6.283185482025146484375;
        float _3222 = sin(_3220);
        float _3224 = fma(_3214, _3164, _3182);
        float _3226 = _3190 * 6.283185482025146484375;
        float _3228 = sin(_3226);
        float _3230 = fma(_3218, _3102, _3210);
        float _3232 = _3046 * 6.283185482025146484375;
        float _3234 = sin(_3232);
        float _3236 = _3088 * 6.283185482025146484375;
        float _3238 = sin(_3236);
        float _3240 = fma(_3228, _3108, _3224);
        float _3242 = _3114 * 6.283185482025146484375;
        float _3244 = sin(_3242);
        float _3246 = fma(_3234, _2984, _3230);
        float _3248 = _3160 * 6.283185482025146484375;
        float _3250 = sin(_3248);
        if (_812)
        {
            _3126 = _1738;
        }
        float _3252 = _3126;
        float _3254 = _3252;
        if (!_812)
        {
            _3254 = _1740;
        }
        float _3256 = _3254;
        if (!_812)
        {
            _1810 = _1740;
        }
        float _3258 = _1810;
        float _3260 = fma(_3196, _3256, _3202);
        float _3262 = fma(_3208, _3258, _3204);
        float _3264 = fma(_3222, _3136, _3260);
        float _3266 = fma(_3174, _3142, _3262);
        float _3268 = fma(_3238, _3082, _3264);
        float _3270 = fma(_3250, _3058, _3240);
        float _3272 = fma(_3244, _3086, _3266);
        float _3274 = -_3270;
        float _3276 = _3246 + _3274;
        float _3278 = -_3268;
        float _3280 = _3278 + _3272;
        float _3282 = _3276 + _3280;
        _2822 = _3282;
    }
    _2824 = false;
    float _3284 = _2822;
    float _3286 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _3288 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _3290 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _3292 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _3294 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _3296 = fma(_560, _2584, _2592);
    float _3298 = fma(_562, _3284, _2594);
    float _3300 = trunc(_3286);
    int _3302 = int(_3300);
    float _3304 = _286 * _3290;
    float _3306 = _286 * _3288;
    float _3308 = _286 * _3292;
    float _3310 = _538 * _3304;
    float _3312 = fma(_558, _1750, _2596);
    float _3314 = _538 * _3306;
    bool _3316 = _3294 > 0.0;
    bool _3318 = _3302 != 1;
    float _3320 = _3312;
    bool _3322 = _3316;
    if (!_3318)
    {
        float _3324 = _3310 * _506;
        _600 = _3324;
    }
    float _3326 = _600;
    if (!_3318)
    {
        float _3328 = _3310 * _508;
        _602 = _3328;
    }
    float _3330 = _602;
    float _3332 = _3330;
    if (!_3318)
    {
        float _3334 = _3310 * _510;
        _604 = _3334;
    }
    float _3336 = _604;
    if (_3318)
    {
        _606 = _3314;
    }
    float _3338 = _606;
    float _3340 = _3338;
    if (!_3318)
    {
        float _3342 = fma(_3314, _512, _3326);
        _608 = _3342;
    }
    float _3344 = _608;
    if (!_3318)
    {
        float _3346 = fma(_3314, _514, _3330);
        _610 = _3346;
    }
    float _3348 = _610;
    float _3350 = _538 * _3308;
    float _3352 = _3350;
    if (!_3318)
    {
        float _3354 = fma(_3314, _516, _3336);
        _612 = _3354;
    }
    float _3356 = _612;
    if (_3318)
    {
        _3332 = _3310;
    }
    float _3358 = _3332;
    float _3360 = _3358;
    if (!_3318)
    {
        float _3362 = fma(_3350, _518, _3344);
        _3340 = _3362;
    }
    float _3364 = _3340;
    if (!_3318)
    {
        float _3366 = fma(_3350, _520, _3348);
        _3360 = _3366;
    }
    float _3368 = _3360;
    if (!_3318)
    {
        float _3370 = fma(_3350, _522, _3356);
        _3352 = _3370;
    }
    float _3372 = _3352;
    float _3374 = _3312 + _3364;
    float _3376 = _3296 + _3368;
    float _3378 = _3298 + _3372;
    if (!_3316)
    {
        _614 = _3374;
    }
    float _3380 = _614;
    float _3382 = _3380;
    float _3384 = _3380;
    if (!_3316)
    {
        _616 = _3376;
    }
    float _3386 = _616;
    float _3388 = _3386;
    float _3390 = _3386;
    if (!_3316)
    {
        _618 = _3378;
    }
    float _3392 = _618;
    bool _3394 = !_3316;
    float _3396 = _3392;
    float _3398 = _3392;
    if (!_3394)
    {
        bool _3400 = !_174;
        if (!_3400)
        {
            float _3402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3426 = _3376 * _3404;
            float _3428 = _3376 * _3412;
            float _3430 = fma(_3374, _3402, _3426);
            float _3432 = _3376 * _3420;
            float _3434 = fma(_3374, _3410, _3428);
            float _3436 = fma(_3378, _3406, _3430);
            float _3438 = fma(_3374, _3418, _3432);
            float _3440 = fma(_3378, _3414, _3434);
            float _3442 = _3408 + _3436;
            float _3444 = fma(_3378, _3422, _3438);
            float _3446 = _3416 + _3440;
            float _3448 = _3424 + _3444;
            _3384 = _3442;
            _3398 = _3448;
            _3390 = _3446;
            _3320 = _3410;
            _3450 = true;
        }
        else
        {
            int _3452 = as_type<int>(_152) & 1024;
            bool _3454 = _3452 != 0;
            bool _3456 = !_3454;
            if (!_3456)
            {
                float _3458 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _3460 = uint(int(uint(_154) >> uint(2)));
                float _3462 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3460)]);
                int _3464 = _154 + 4;
                uint _3466 = uint(int(uint(_3464) >> uint(2)));
                float _3468 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3466)]);
                int _3470 = _154 + 8;
                uint _3472 = uint(int(uint(_3470) >> uint(2)));
                float _3474 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3472)]);
                uint _3476 = uint(int(uint(_154) >> uint(2)));
                float _3478 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3476)]);
                int _3480 = _154 + 4;
                uint _3482 = uint(int(uint(_3480) >> uint(2)));
                float _3484 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3482)]);
                int _3486 = _154 + 8;
                uint _3488 = uint(int(uint(_3486) >> uint(2)));
                float _3490 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3488)]);
                uint _3492 = uint(int(uint(_154) >> uint(2)));
                float _3494 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3492)]);
                int _3496 = _154 + 4;
                uint _3498 = uint(int(uint(_3496) >> uint(2)));
                float _3500 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3498)]);
                int _3502 = _154 + 8;
                uint _3504 = uint(int(uint(_3502) >> uint(2)));
                float _3506 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3504)]);
                float _3508 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _3510 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3512 = _3376 * _3468;
                float _3514 = _3376 * _3484;
                float _3516 = _3376 * _3500;
                float _3518 = fma(_3374, _3462, _3512);
                float _3520 = fma(_3374, _3478, _3514);
                float _3522 = fma(_3374, _3494, _3516);
                float _3524 = fma(_3378, _3474, _3518);
                float _3526 = fma(_3378, _3490, _3520);
                float _3528 = fma(_3378, _3506, _3522);
                float _3530 = _3458 + _3524;
                float _3532 = _3508 + _3526;
                float _3534 = _3510 + _3528;
                _3384 = _3530;
                _3398 = _3534;
                _3390 = _3532;
                _3320 = _3478;
                _3450 = true;
            }
            else
            {
                int _3536 = as_type<int>(_152) & 2048;
                bool _3538 = _3536 != 0;
                if (!_3538)
                {
                    _3382 = _3374;
                }
                float _3540 = _3382;
                _3384 = _3540;
                if (!_3538)
                {
                    _3388 = _3376;
                }
                float _3542 = _3388;
                _3390 = _3542;
                if (!_3538)
                {
                    _3396 = _3378;
                }
                float _3544 = _3396;
                bool _3546 = !_3538;
                _3398 = _3544;
                if (!_3546)
                {
                    uint _3548 = uint(int(uint(_154) >> uint(2)));
                    float _3550 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3548)]);
                    int _3552 = _154 + 4;
                    uint _3554 = uint(int(uint(_3552) >> uint(2)));
                    float _3556 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3554)]);
                    int _3558 = _154 + 8;
                    uint _3560 = uint(int(uint(_3558) >> uint(2)));
                    float _3562 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3560)]);
                    int _3564 = _154 + 12;
                    uint _3566 = uint(int(uint(_3564) >> uint(2)));
                    float _3568 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3566)]);
                    uint _3570 = uint(int(uint(_154) >> uint(2)));
                    float _3572 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3570)]);
                    int _3574 = _154 + 4;
                    uint _3576 = uint(int(uint(_3574) >> uint(2)));
                    float _3578 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3576)]);
                    int _3580 = _154 + 8;
                    uint _3582 = uint(int(uint(_3580) >> uint(2)));
                    float _3584 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3582)]);
                    int _3586 = _154 + 12;
                    uint _3588 = uint(int(uint(_3586) >> uint(2)));
                    float _3590 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3588)]);
                    uint _3592 = uint(int(uint(_154) >> uint(2)));
                    float _3594 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3592)]);
                    int _3596 = _154 + 4;
                    uint _3598 = uint(int(uint(_3596) >> uint(2)));
                    float _3600 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3598)]);
                    int _3602 = _154 + 8;
                    uint _3604 = uint(int(uint(_3602) >> uint(2)));
                    float _3606 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3604)]);
                    int _3608 = _154 + 12;
                    uint _3610 = uint(int(uint(_3608) >> uint(2)));
                    float _3612 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3610)]);
                    float _3614 = _3376 * _3556;
                    float _3616 = _3376 * _3578;
                    float _3618 = fma(_3374, _3550, _3614);
                    float _3620 = _3376 * _3600;
                    float _3622 = fma(_3374, _3572, _3616);
                    float _3624 = fma(_3374, _3594, _3620);
                    float _3626 = fma(_3378, _3562, _3618);
                    float _3628 = fma(_3378, _3584, _3622);
                    float _3630 = fma(_3378, _3606, _3624);
                    float _3632 = _3626 + _3568;
                    float _3634 = _3628 + _3590;
                    float _3636 = _3630 + _3612;
                    _3384 = _3632;
                    _3398 = _3636;
                    _3390 = _3634;
                    _3320 = _3572;
                }
            }
        }
    }
    _3450 = false;
    float _3638 = _3384;
    float _3640 = _3398;
    float _3642 = _3390;
    float _3644 = _3320;
    float _3646 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _3648 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _3650 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _3652 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _3654 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _3656 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _3658 = _3646 != 0.0;
    bool _3660 = isnan(_3646);
    bool _3662 = _3658 || _3660;
    bool _3664 = isnan(0.0);
    bool _3666 = _3662 || _3664;
    float _3668 = _544 * _3648;
    float _3670 = _544 * _3650;
    float _3672 = _544 * _3652;
    float _3674 = fma(_3654, _3638, _3668);
    float _3676 = fma(_3654, _3640, _3670);
    float _3678 = fma(_3654, _3642, _3672);
    float _3680 = _3656;
    float _3682 = _3644;
    if (_3666)
    {
        float _3684 = _266 * _3656;
        _3680 = _3684;
    }
    float _3686 = _3680;
    float _3688 = _3678 + _3686;
    float _3690 = -_3686;
    bool _3692 = _3674 >= _3690;
    bool _3694 = isnan(_3674);
    bool _3696 = _3692 || _3694;
    bool _3698 = isnan(_3690);
    bool _3700 = _3696 || _3698;
    float _3702 = _3674 + _3686;
    float _3704 = -_3686;
    bool _3706 = _3676 >= _3704;
    bool _3708 = isnan(_3676);
    bool _3710 = _3706 || _3708;
    bool _3712 = isnan(_3704);
    bool _3714 = _3710 || _3712;
    float _3716 = _3676 + _3686;
    float _3718 = -_3686;
    bool _3720 = _3678 >= _3718;
    bool _3722 = isnan(_3678);
    bool _3724 = _3720 || _3722;
    bool _3726 = isnan(_3718);
    bool _3728 = _3724 || _3726;
    bool _3730 = !_3700;
    float _3732 = -_3702;
    float _3734 = _3730 ? _3732 : _3702;
    bool _3736 = !_3714;
    float _3738 = -_3716;
    float _3740 = _3736 ? _3738 : _3716;
    bool _3742 = !_3728;
    float _3744 = -_3688;
    float _3746 = _3742 ? _3744 : _3688;
    float _3748 = _3734 * 0.03125;
    float _3750 = _3740 * 0.03125;
    float _3752 = _3746 * 0.03125;
    float3 _10059 = float3(_3748, _3752, _3750);
    float3 _3756 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_10059, float3(0.0), isnan(_10059)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_10059, float3(0.0), isnan(_10059)), level(0.0)).xyz;
    float _3758 = _3756.x;
    float _3760 = _3756.y;
    float _3762 = _3756.z;
    float _3764 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _3766 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _3768 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _3770 = _3758 + (-0.5);
    float _3772 = _3760 + (-0.5);
    float _3774 = _3762 + (-0.5);
    float _3776 = _3770 * _3764;
    float _3778 = _3772 * _3766;
    float _3780 = _3774 * _3768;
    float _3782 = _3774;
    float _3784 = _3766;
    float _3786 = _3772;
    if (!_3316)
    {
        _3782 = _3776;
    }
    float _3788 = _3782;
    float _3790 = _3788;
    float _3792 = _3788;
    if (!_3316)
    {
        _3784 = _3778;
    }
    float _3794 = _3784;
    float _3796 = _3794;
    float _3798 = _3794;
    if (!_3316)
    {
        _3786 = _3780;
    }
    float _3800 = _3786;
    bool _3802 = !_3316;
    float _3804 = _3800;
    float _3806 = _3800;
    if (!_3802)
    {
        bool _3808 = !_174;
        if (!_3808)
        {
            float _3810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3828 = _3814 * _3816;
            float _3830 = _3814 * _3818;
            float _3832 = _3812 * _3816;
            float _3834 = -_3828;
            float _3836 = fma(_3810, _3820, _3834);
            float _3838 = -_3830;
            float _3840 = fma(_3812, _3820, _3838);
            float _3842 = -_3832;
            float _3844 = fma(_3810, _3818, _3842);
            float _3846 = _3824 * _3810;
            float _3848 = _3824 * _3836;
            float _3850 = _3826 * _3812;
            float _3852 = _3822 * _3818;
            float _3854 = -_3846;
            float _3856 = fma(_3822, _3812, _3854);
            float _3858 = -_3848;
            float _3860 = fma(_3822, _3840, _3858);
            float _3862 = _3824 * _3820;
            float _3864 = _3826 * _3816;
            float _3866 = -_3852;
            float _3868 = fma(_3824, _3816, _3866);
            float _3870 = fma(_3826, _3844, _3860);
            float _3872 = -_3862;
            float _3874 = fma(_3826, _3818, _3872);
            float _3876 = -_3864;
            float _3878 = fma(_3822, _3820, _3876);
            float _3880 = _3822 * _3814;
            float _3882 = -_3810;
            float _3884 = fma(_3882, _3820, _3828);
            float _3886 = -_3850;
            float _3888 = fma(_3824, _3814, _3886);
            float _3890 = 1.0 / _3870;
            float _3892 = -_3880;
            float _3894 = fma(_3826, _3810, _3892);
            float _3896 = _3874 * _3890;
            float _3898 = _3878 * _3890;
            float _3900 = _3868 * _3890;
            float _3902 = _3776 * _3890;
            float _3904 = _3778 * _3896;
            float _3906 = _3778 * _3898;
            float _3908 = _3778 * _3900;
            float _3910 = _3884 * _3890;
            float _3912 = _3888 * _3890;
            float _3914 = _3894 * _3890;
            float _3916 = _3856 * _3890;
            float _3918 = fma(_3840, _3902, _3904);
            float _3920 = fma(_3776, _3910, _3906);
            float _3922 = fma(_3844, _3902, _3908);
            float _3924 = fma(_3780, _3912, _3918);
            float _3926 = fma(_3780, _3914, _3920);
            float _3928 = fma(_3780, _3916, _3922);
            _3798 = _3926;
            _3806 = _3928;
            _3792 = _3924;
            _3682 = _3810;
            _3930 = true;
        }
        else
        {
            int _3932 = as_type<int>(_152) & 1024;
            bool _3934 = _3932 != 0;
            if (_3934)
            {
                _3322 = true;
            }
            bool _3936 = _3322;
            bool _3938 = _3936;
            if (!_3934)
            {
                int _3940 = as_type<int>(_152) & 2048;
                bool _3942 = _3940 != 0;
                _3938 = _3942;
            }
            bool _3944 = _3938;
            if (!_3944)
            {
                _3790 = _3776;
            }
            float _3946 = _3790;
            _3792 = _3946;
            if (!_3944)
            {
                _3796 = _3778;
            }
            float _3948 = _3796;
            _3798 = _3948;
            if (!_3944)
            {
                _3804 = _3780;
            }
            float _3950 = _3804;
            bool _3952 = !_3944;
            _3806 = _3950;
            if (!_3952)
            {
                uint _3954 = uint(int(uint(_154) >> uint(2)));
                float _3956 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3954)]);
                int _3958 = _154 + 4;
                uint _3960 = uint(int(uint(_3958) >> uint(2)));
                float _3962 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3960)]);
                int _3964 = _154 + 8;
                uint _3966 = uint(int(uint(_3964) >> uint(2)));
                float _3968 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3966)]);
                uint _3970 = uint(int(uint(_154) >> uint(2)));
                float _3972 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3970)]);
                int _3974 = _154 + 4;
                uint _3976 = uint(int(uint(_3974) >> uint(2)));
                float _3978 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3976)]);
                int _3980 = _154 + 8;
                uint _3982 = uint(int(uint(_3980) >> uint(2)));
                float _3984 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3982)]);
                uint _3986 = uint(int(uint(_154) >> uint(2)));
                float _3988 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3986)]);
                int _3990 = _154 + 4;
                uint _3992 = uint(int(uint(_3990) >> uint(2)));
                float _3994 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3992)]);
                int _3996 = _154 + 8;
                uint _3998 = uint(int(uint(_3996) >> uint(2)));
                float _4000 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3998)]);
                float _4002 = _3968 * _3972;
                float _4004 = _3968 * _3978;
                float _4006 = _3962 * _3972;
                float _4008 = -_4002;
                float _4010 = fma(_3956, _3984, _4008);
                float _4012 = -_4004;
                float _4014 = fma(_3962, _3984, _4012);
                float _4016 = -_4006;
                float _4018 = fma(_3956, _3978, _4016);
                float _4020 = _3994 * _3956;
                float _4022 = _3994 * _4010;
                float _4024 = _4000 * _3962;
                float _4026 = _3988 * _3978;
                float _4028 = -_4020;
                float _4030 = fma(_3988, _3962, _4028);
                float _4032 = -_4022;
                float _4034 = fma(_3988, _4014, _4032);
                float _4036 = _3994 * _3984;
                float _4038 = _4000 * _3972;
                float _4040 = -_4026;
                float _4042 = fma(_3994, _3972, _4040);
                float _4044 = fma(_4000, _4018, _4034);
                float _4046 = -_4036;
                float _4048 = fma(_4000, _3978, _4046);
                float _4050 = -_4038;
                float _4052 = fma(_3988, _3984, _4050);
                float _4054 = _3988 * _3968;
                float _4056 = -_3956;
                float _4058 = fma(_4056, _3984, _4002);
                float _4060 = -_4024;
                float _4062 = fma(_3994, _3968, _4060);
                float _4064 = 1.0 / _4044;
                float _4066 = -_4054;
                float _4068 = fma(_4000, _3956, _4066);
                float _4070 = _4048 * _4064;
                float _4072 = _4052 * _4064;
                float _4074 = _4042 * _4064;
                float _4076 = _3776 * _4064;
                float _4078 = _3778 * _4070;
                float _4080 = _3778 * _4072;
                float _4082 = _3778 * _4074;
                float _4084 = _4058 * _4064;
                float _4086 = _4062 * _4064;
                float _4088 = _4068 * _4064;
                float _4090 = _4030 * _4064;
                float _4092 = fma(_4014, _4076, _4078);
                float _4094 = fma(_3776, _4084, _4080);
                float _4096 = fma(_4018, _4076, _4082);
                float _4098 = fma(_3780, _4086, _4092);
                float _4100 = fma(_3780, _4088, _4094);
                float _4102 = fma(_3780, _4090, _4096);
                _3798 = _4100;
                _3806 = _4102;
                _3792 = _4098;
                _3682 = _3956;
            }
        }
    }
    _3930 = false;
    float _4104 = _3798;
    float _4106 = _3806;
    float _4108 = _3792;
    float _4110 = _3682;
    float _4112 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _4114 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _4116 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _4118 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _4120 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _4122 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _4124 = uint(int(uint(_176) >> uint(2)));
    float _4126 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_4124)]);
    float _4128 = fma(_538, _4104, _782);
    float _4130 = fma(_538, _4106, _784);
    bool _4132 = _4112 > 0.0;
    bool _4134 = _4114 > 0.0;
    float _4136 = _4116 * _4114;
    float _4138 = _538 * _4118;
    float _4140 = _4112;
    float _4142 = _4116;
    float _4144 = _4110;
    bool _4146 = _4134;
    float _4148 = _4136;
    if (_4132)
    {
        float _4150 = 1.0 / _4112;
        _4140 = _4150;
    }
    float _4152 = _4140;
    float _4154 = _538 * _4122;
    if (_4134)
    {
        float _4156 = -_4136;
        float _4158 = fma(_266, _4156, _4116);
        _4142 = _4158;
    }
    float _4160 = _4142;
    float _4162 = _4160;
    if (_4132)
    {
        float _4164 = _680 * _4152;
        _734 = _4164;
    }
    float _4166 = _734;
    if (_4132)
    {
        float _4168 = precise::min(_4166, 1.0);
        _4144 = _4168;
    }
    float _4170 = _4144;
    float _4172 = fma(_538, _4108, _792);
    float _4174 = _538 * _4120;
    float _4176 = _4174;
    if (_4132)
    {
        float _4178 = _4170 * _4160;
        _4162 = _4178;
    }
    float _4180 = _4162;
    float _4182 = _4138 * _4180;
    float _4184 = _4174 * _4180;
    float _4186 = _4154 * _4180;
    bool _4188 = !_174;
    float _4190 = _4180;
    float _4312;
    float _4314;
    float _4316;
    if (!_4188)
    {
        float _4192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _4194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _4196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _4198 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _4200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _4202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _4204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _4206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _4208 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _4210 = _4196 * _4198;
        float _4212 = _4196 * _4200;
        float _4214 = _4194 * _4198;
        float _4216 = -_4210;
        float _4218 = fma(_4192, _4202, _4216);
        float _4220 = -_4212;
        float _4222 = fma(_4194, _4202, _4220);
        float _4224 = -_4214;
        float _4226 = fma(_4192, _4200, _4224);
        float _4228 = _4206 * _4192;
        float _4230 = _4206 * _4218;
        float _4232 = _4208 * _4194;
        float _4234 = _4204 * _4200;
        float _4236 = -_4228;
        float _4238 = fma(_4204, _4194, _4236);
        float _4240 = -_4230;
        float _4242 = fma(_4204, _4222, _4240);
        float _4244 = _4206 * _4202;
        float _4246 = _4208 * _4198;
        float _4248 = -_4232;
        float _4250 = fma(_4206, _4196, _4248);
        float _4252 = fma(_4208, _4226, _4242);
        float _4254 = -_4244;
        float _4256 = fma(_4208, _4200, _4254);
        float _4258 = -_4246;
        float _4260 = fma(_4204, _4202, _4258);
        float _4262 = -_4234;
        float _4264 = fma(_4206, _4198, _4262);
        float _4266 = 1.0 / _4252;
        float _4268 = _4204 * _4196;
        float _4270 = -_4192;
        float _4272 = fma(_4270, _4202, _4210);
        float _4274 = -_4268;
        float _4276 = fma(_4208, _4192, _4274);
        float _4278 = _4256 * _4266;
        float _4280 = _4260 * _4266;
        float _4282 = _4264 * _4266;
        float _4284 = _4182 * _4266;
        float _4286 = _4278 * _4184;
        float _4288 = _4280 * _4184;
        float _4290 = _4282 * _4184;
        float _4292 = _4272 * _4266;
        float _4294 = _4250 * _4266;
        float _4296 = fma(_4222, _4284, _4286);
        float _4298 = _4276 * _4266;
        float _4300 = _4238 * _4266;
        float _4302 = fma(_4292, _4182, _4288);
        float _4304 = fma(_4226, _4284, _4290);
        float _4306 = fma(_4294, _4186, _4296);
        float _4308 = fma(_4298, _4186, _4302);
        float _4310 = fma(_4300, _4186, _4304);
        _4312 = _4306;
        _4314 = _4308;
        _4316 = _4310;
        _4318 = true;
    }
    else
    {
        int _4320 = as_type<int>(_152) & 1024;
        bool _4322 = _4320 != 0;
        if (_4322)
        {
            _4146 = true;
        }
        bool _4324 = _4146;
        bool _4326 = _4324;
        if (!_4322)
        {
            int _4328 = as_type<int>(_152) & 2048;
            bool _4330 = _4328 != 0;
            _4326 = _4330;
        }
        bool _4332 = _4326;
        if (!_4332)
        {
            _4148 = _4182;
        }
        float _4334 = _4148;
        _4312 = _4334;
        if (!_4332)
        {
            _4190 = _4184;
        }
        float _4336 = _4190;
        _4314 = _4336;
        if (!_4332)
        {
            _4176 = _4186;
        }
        float _4338 = _4176;
        bool _4340 = !_4332;
        _4316 = _4338;
        if (!_4340)
        {
            uint _4342 = uint(int(uint(_154) >> uint(2)));
            float _4344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4342)]);
            int _4346 = _154 + 4;
            uint _4348 = uint(int(uint(_4346) >> uint(2)));
            float _4350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4348)]);
            int _4352 = _154 + 8;
            uint _4354 = uint(int(uint(_4352) >> uint(2)));
            float _4356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4354)]);
            uint _4358 = uint(int(uint(_154) >> uint(2)));
            float _4360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4358)]);
            int _4362 = _154 + 4;
            uint _4364 = uint(int(uint(_4362) >> uint(2)));
            float _4366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4364)]);
            int _4368 = _154 + 8;
            uint _4370 = uint(int(uint(_4368) >> uint(2)));
            float _4372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4370)]);
            uint _4374 = uint(int(uint(_154) >> uint(2)));
            float _4376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4374)]);
            int _4378 = _154 + 4;
            uint _4380 = uint(int(uint(_4378) >> uint(2)));
            float _4382 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4380)]);
            int _4384 = _154 + 8;
            uint _4386 = uint(int(uint(_4384) >> uint(2)));
            float _4388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4386)]);
            float _4390 = _4356 * _4360;
            float _4392 = _4356 * _4366;
            float _4394 = _4350 * _4360;
            float _4396 = -_4390;
            float _4398 = fma(_4344, _4372, _4396);
            float _4400 = -_4392;
            float _4402 = fma(_4350, _4372, _4400);
            float _4404 = -_4394;
            float _4406 = fma(_4344, _4366, _4404);
            float _4408 = _4382 * _4344;
            float _4410 = _4382 * _4398;
            float _4412 = _4388 * _4350;
            float _4414 = _4376 * _4366;
            float _4416 = -_4408;
            float _4418 = fma(_4376, _4350, _4416);
            float _4420 = -_4410;
            float _4422 = fma(_4376, _4402, _4420);
            float _4424 = _4382 * _4372;
            float _4426 = _4388 * _4360;
            float _4428 = -_4412;
            float _4430 = fma(_4382, _4356, _4428);
            float _4432 = fma(_4388, _4406, _4422);
            float _4434 = -_4424;
            float _4436 = fma(_4388, _4366, _4434);
            float _4438 = -_4426;
            float _4440 = fma(_4376, _4372, _4438);
            float _4442 = -_4414;
            float _4444 = fma(_4382, _4360, _4442);
            float _4446 = 1.0 / _4432;
            float _4448 = _4376 * _4356;
            float _4450 = -_4344;
            float _4452 = fma(_4450, _4372, _4390);
            float _4454 = -_4448;
            float _4456 = fma(_4388, _4344, _4454);
            float _4458 = _4436 * _4446;
            float _4460 = _4440 * _4446;
            float _4462 = _4444 * _4446;
            float _4464 = _4182 * _4446;
            float _4466 = _4458 * _4184;
            float _4468 = _4460 * _4184;
            float _4470 = _4462 * _4184;
            float _4472 = _4452 * _4446;
            float _4474 = _4430 * _4446;
            float _4476 = fma(_4402, _4464, _4466);
            float _4478 = _4456 * _4446;
            float _4480 = _4418 * _4446;
            float _4482 = fma(_4472, _4182, _4468);
            float _4484 = fma(_4406, _4464, _4470);
            float _4486 = fma(_4474, _4186, _4476);
            float _4488 = fma(_4478, _4186, _4482);
            float _4490 = fma(_4480, _4186, _4484);
            _4312 = _4486;
            _4314 = _4488;
            _4316 = _4490;
        }
    }
    _4318 = false;
    float _4492 = _4312;
    float _4494 = _4314;
    float _4496 = _4316;
    float _4498 = _3374 + _4492;
    float _4500 = _3376 + _4494;
    int _4502 = _154 + 4;
    float _4504 = _3378 + _4496;
    int _4506 = _154 + 8;
    uint _4508 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4508)] = as_type<uint>(_4126);
    float _4510 = -_158;
    float _4512 = _4510 + _4498;
    float _4514 = -_164;
    float _4516 = _4514 + _4500;
    uint _4518 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4518)] = as_type<uint>(_4498);
    float _4520 = -_170;
    float _4522 = _4520 + _4504;
    uint _4524 = uint(int(uint(_4502) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4524)] = as_type<uint>(_4500);
    uint _4526 = uint(int(uint(_4506) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4526)] = as_type<uint>(_4504);
    uint _4528 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4528)] = as_type<uint>(_4172);
    uint _4530 = uint(int(uint(_4502) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4530)] = as_type<uint>(_4128);
    uint _4532 = uint(int(uint(_4506) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4532)] = as_type<uint>(_4130);
    uint _4534 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4534)] = as_type<uint>(_4512);
    uint _4536 = uint(int(uint(_4502) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4536)] = as_type<uint>(_4516);
    uint _4538 = uint(int(uint(_4506) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4538)] = as_type<uint>(_4522);
    float _4540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4542 = _4516 * _4516;
    float _4544 = _4128 * _4128;
    float _4546 = fma(_4512, _4512, _4542);
    float _4548 = fma(_4172, _4172, _4544);
    float _4550 = fma(_4522, _4522, _4546);
    float _4552 = fma(_4130, _4130, _4548);
    float _4554 = sqrt(_4550);
    float _4556 = sqrt(_4552);
    bool _4558 = _4554 >= 9.9999999747524270787835121154785e-07;
    bool _4560 = isnan(_4554);
    bool _4562 = _4558 || _4560;
    bool _4564 = isnan(9.9999999747524270787835121154785e-07);
    bool _4566 = _4562 || _4564;
    if (!_4566)
    {
        bool _4568 = _544 != _282;
        bool _4570 = isnan(_544);
        bool _4572 = _4568 || _4570;
        bool _4574 = isnan(_282);
        bool _4576 = _4572 || _4574;
        _4578 = _4576;
        if (!_4578)
        {
            float _4580 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _4582 = _4580 > 0.0;
            bool _4584 = !_4582;
            if (!_4584)
            {
                float _4586 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _4588 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _4590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _4592 = _4588 * _4588;
                float _4594 = fma(_4586, _4586, _4592);
                float _4596 = fma(_4590, _4590, _4594);
                float _4598 = rsqrt(_4596);
                float _4600 = _4598 * 9.9999999747524270787835121154785e-07;
                float _4602 = _4586 * _4600;
                float _4604 = _4588 * _4600;
                float _4606 = _4590 * _4600;
                _328 = as_type<int>(_4602);
                _330 = as_type<int>(_4604);
                _332 = as_type<int>(_4606);
                _4578 = true;
            }
            else
            {
                bool _4608 = _4556 >= 9.9999999747524270787835121154785e-07;
                bool _4610 = isnan(_4556);
                bool _4612 = _4608 || _4610;
                bool _4614 = isnan(9.9999999747524270787835121154785e-07);
                bool _4616 = _4612 || _4614;
                if (!_4616)
                {
                    float _4618 = _4500 * _4500;
                    float _4620 = fma(_4498, _4498, _4618);
                    float _4622 = fma(_4504, _4504, _4620);
                    float _4624 = sqrt(_4622);
                    bool _4626 = _4624 >= 9.9999999747524270787835121154785e-07;
                    bool _4628 = isnan(_4624);
                    bool _4630 = _4626 || _4628;
                    bool _4632 = isnan(9.9999999747524270787835121154785e-07);
                    bool _4634 = _4630 || _4632;
                    float _4636 = _4624;
                    if (_4634)
                    {
                        float _4638 = rsqrt(_4622);
                        _4636 = _4638;
                    }
                    float _4640 = _4636;
                    if (!_4634)
                    {
                        _316 = 0;
                    }
                    int _4642 = _316;
                    int _4644 = _4642;
                    if (!_4634)
                    {
                        _318 = 897988541;
                    }
                    int _4646 = _318;
                    int _4648 = _4646;
                    if (!_4634)
                    {
                        _320 = 0;
                    }
                    int _4650 = _320;
                    float _4652 = _4640;
                    int _4654 = _4650;
                    if (_4634)
                    {
                        float _4656 = _4640 * 9.9999999747524270787835121154785e-07;
                        _4652 = _4656;
                    }
                    float _4658 = _4652;
                    if (_4634)
                    {
                        float _4660 = _4498 * _4658;
                        _4644 = as_type<int>(_4660);
                    }
                    int _4662 = _4644;
                    _328 = _4662;
                    if (_4634)
                    {
                        float _4664 = _4500 * _4658;
                        _4648 = as_type<int>(_4664);
                    }
                    int _4666 = _4648;
                    _330 = _4666;
                    if (_4634)
                    {
                        float _4668 = _4504 * _4658;
                        _4654 = as_type<int>(_4668);
                    }
                    int _4670 = _4654;
                    _332 = _4670;
                    _4578 = true;
                }
                else
                {
                    float _4672 = rsqrt(_4552);
                    float _4674 = _4672 * 9.9999999747524270787835121154785e-07;
                    float _4676 = _4172 * _4674;
                    float _4678 = _4128 * _4674;
                    float _4680 = _4130 * _4674;
                    _328 = as_type<int>(_4676);
                    _330 = as_type<int>(_4678);
                    _332 = as_type<int>(_4680);
                    _4578 = true;
                }
            }
        }
    }
    else
    {
        float _4682 = _4556 * _4540;
        bool _4684 = _4682 >= 0.001000000047497451305389404296875;
        bool _4686 = isnan(_4682);
        bool _4688 = _4684 || _4686;
        bool _4690 = isnan(0.001000000047497451305389404296875);
        bool _4692 = _4688 || _4690;
        bool _4694 = _4682 > 0.0;
        bool _4696 = !_4692;
        bool _4698 = _4694 && _4696;
        bool _4700 = _4554 < 0.001000000047497451305389404296875;
        bool _4702 = _4700 && _4698;
        if (!_4702)
        {
            _322 = as_type<int>(_4512);
        }
        int _4704 = _322;
        int _4706 = _4704;
        if (_4702)
        {
            float _4708 = _4172 * _4540;
            _4706 = as_type<int>(_4708);
        }
        int _4710 = _4706;
        _328 = _4710;
        if (!_4702)
        {
            _324 = as_type<int>(_4516);
        }
        int _4712 = _324;
        int _4714 = _4712;
        if (_4702)
        {
            float _4716 = _4128 * _4540;
            _4714 = as_type<int>(_4716);
        }
        int _4718 = _4714;
        _330 = _4718;
        if (!_4702)
        {
            _326 = as_type<int>(_4522);
        }
        int _4720 = _326;
        _332 = _4720;
        if (_4702)
        {
            float _4722 = _4130 * _4540;
            _332 = as_type<int>(_4722);
        }
    }
    _4578 = false;
    int _4724 = _328;
    int _4726 = _330;
    int _4728 = _332;
    uint _4730 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4730)] = uint(_4724);
    uint _4732 = uint(int(uint(_4502) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4732)] = uint(_4726);
    uint _4734 = uint(int(uint(_4506) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4734)] = uint(_4728);
}

