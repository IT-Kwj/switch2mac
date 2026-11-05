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
    texture2d<float> cp_t_tcb_26 [[id(13)]];
    sampler cp_t_tcb_26Smplr [[id(14)]];
    texture2d<float> cp_t_tcb_2C [[id(15)]];
    sampler cp_t_tcb_2CSmplr [[id(16)]];
    sampler cp_t_tcb_2CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3935 = false;
    bool _3699 = false;
    bool _2616 = false;
    bool _1824 = false;
    bool _904 = false;
    float _68 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _70 = as_type<float>(gl_LocalInvocationID.x);
    float _72 = as_type<float>(gl_WorkGroupID.x);
    int _75 = as_type<int>(_72) << 5;
    int _77 = _75 + as_type<int>(_70);
    float _79 = trunc(_68);
    int _81 = int(_79);
    bool _85 = _77 >= _81;
    int _87 = 0;
    if (_85)
    {
        _87 = 0;
    }
    int _89 = _87;
    int _91 = _89;
    int _93 = _89;
    if (!_85)
    {
        int _95 = _77 << 4;
        int _97 = _95 + 12;
        uint _100 = uint(int(uint(_97) >> uint(2)));
        float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
        float _104 = trunc(_102);
        int _106 = int(_104);
        bool _108 = _106 >= 1;
        int _110 = _108 ? (-1) : 0;
        if (!_108)
        {
            _91 = 0;
        }
        int _112 = _91;
        bool _114 = !_108;
        _93 = _112;
        if (!_114)
        {
            float _116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _118 = uint(int(uint(_97) >> uint(2)));
            float _120 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_118)]);
            float _122 = float(_106);
            float _124 = -_120;
            float _126 = _116 + _124;
            bool _128 = _126 > _122;
            int _130 = as_type<int>(_116);
            if (!_128)
            {
                bool _132 = _116 >= _120;
                bool _134 = isnan(_116);
                bool _136 = _132 || _134;
                bool _138 = isnan(_120);
                bool _140 = _136 || _138;
                _110 = _140 ? (-1) : 0;
            }
            int _142 = _110;
            if (_128)
            {
                _130 = 0;
            }
            int _144 = _130;
            _93 = _144;
            if (!_128)
            {
                int _146 = ~_142;
                int _148 = (_146 != 0) ? 0 : 1;
                _93 = _148;
            }
        }
    }
    int _150 = _93;
    int _152 = _150 & 1;
    bool _154 = _152 != 0;
    if (!_154)
    {
        return;
    }
    int _156 = _77 << 4;
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[12]);
    uint _160 = uint(int(uint(_156) >> uint(2)));
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_160)]);
    int _164 = _156 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_166)]);
    int _170 = _156 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_172)]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[16]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[17]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _186 = _156 + 12;
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[15]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[1]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[2]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    uint _200 = uint(int(uint(_186) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    uint _212 = uint(int(uint(_156) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_212)]);
    int _216 = _156 + 4;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_218)]);
    int _222 = _156 + 8;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    uint _232 = uint(int(uint(_186) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_232)]);
    bool _236 = _158 != 1.0;
    bool _238 = isnan(_158);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.0);
    bool _244 = _240 || _242;
    uint _246 = uint(int(uint(_156) >> uint(2)));
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_246)]);
    int _250 = _156 + 4;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_252)]);
    int _256 = _156 + 8;
    uint _258 = uint(int(uint(_256) >> uint(2)));
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_258)]);
    float _262 = _244 ? _162 : 0.0;
    float _264 = _244 ? _168 : 0.3141500055789947509765625;
    uint _266 = uint(int(uint(_156) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_266)]);
    int _270 = _156 + 4;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_272)]);
    int _276 = _156 + 8;
    uint _278 = uint(int(uint(_276) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_278)]);
    int _282 = _156 + 12;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_284)]);
    float _288 = _244 ? _174 : 0.92653000354766845703125;
    float _290 = _176 * 0.00999999977648258209228515625;
    float _292 = _180 * _262;
    float _294 = _180 * _264;
    float _296 = _180 * _288;
    float _298 = _180 * _290;
    float _300 = 0.0;
    float _302 = _178;
    float _304 = _292;
    float _306 = _294;
    float _308 = _296;
    float _310 = _188;
    float _312 = _286;
    float _314 = _196;
    float _316 = _228;
    float _318 = _220;
    float _320 = _206;
    float _322 = _198;
    float _324 = _220;
    float _326 = _206;
    float _328 = _210;
    float _330 = _198;
    float _332 = _228;
    float _334 = _194;
    float _336 = _190;
    float _338 = _162;
    int _340 = as_type<int>(_268);
    int _342 = as_type<int>(_274);
    int _344 = as_type<int>(_280);
    int _346 = as_type<int>(_268);
    int _348 = as_type<int>(_274);
    int _350 = as_type<int>(_280);
    int _352 = as_type<int>(_268);
    int _354 = as_type<int>(_274);
    int _356 = as_type<int>(_280);
    if (!_244)
    {
        float _358 = _178 * 0.00999999977648258209228515625;
        float _360 = _184 * _298;
        float _362 = fma(_168, 2.0, -1.0);
        float _364 = fma(_162, 2.0, -1.0);
        float _366 = _180 * _358;
        float _368 = fma(_174, 2.0, -1.0);
        float _370 = fma(_366, _362, _360);
        float _372 = fma(_366, _364, _360);
        float _374 = fma(_366, _368, _360);
        float _376 = _294 + _370;
        float _378 = _292 + _372;
        float _380 = _296 + _374;
        _300 = _360;
        _302 = _366;
        _304 = _378;
        _306 = _376;
        _308 = _380;
    }
    float _382 = _300;
    float _384 = _302;
    float _386 = _304;
    float _388 = _306;
    float _390 = _308;
    float _392 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[13]);
    float _394 = -_182;
    float _396 = _394 + 1.0;
    float _398 = -_198;
    float _400 = _398 + 1.0;
    float _402 = -_202;
    float _404 = _184 + _402;
    float _406 = _204 * _228;
    float _408 = _208 * _228;
    float _410 = fma(_396, _400, _198);
    float _412 = abs(_198);
    float _414 = log2(_412);
    bool _416 = _410 != 1.0;
    bool _418 = isnan(_410);
    bool _420 = _416 || _418;
    bool _422 = isnan(1.0);
    bool _424 = _420 || _422;
    bool _426 = _188 != 1.0;
    bool _428 = isnan(_188);
    bool _430 = _426 || _428;
    bool _432 = isnan(1.0);
    bool _434 = _430 || _432;
    bool _436 = !_424;
    bool _438 = _434 || _436;
    float _440 = _384;
    float _442 = _410;
    float _444 = _404;
    if (_244)
    {
        _310 = 0.0;
    }
    float _446 = _310;
    float _448 = _446;
    if (!_244)
    {
        float _450 = _182 * _298;
        _448 = _450;
    }
    float _452 = _448;
    bool _454 = _452 != 0.0;
    bool _456 = isnan(_452);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    float _464 = _182 * _414;
    float _466 = _382;
    float _468 = _452;
    if (!_438)
    {
        float _470 = abs(_410);
        float _472 = log2(_470);
        _466 = _472;
    }
    float _474 = _466;
    if (!_438)
    {
        float _476 = -_410;
        float _478 = _476 + 1.0;
        _312 = _478;
    }
    float _480 = _312;
    if (_438)
    {
        _440 = _404;
    }
    float _482 = _440;
    float _484 = 0.0;
    float _486 = _482;
    if (!_438)
    {
        float _488 = 1.0 / _480;
        _484 = _488;
    }
    float _490 = _484;
    if (!_438)
    {
        float _492 = _404 * _474;
        _314 = _492;
    }
    float _494 = _314;
    float _496 = exp2(_464);
    float _498 = _206 * _228;
    float _500 = _234 * _182;
    float _502 = _182 * _498;
    float _504 = _494;
    if (!_438)
    {
        float _506 = exp2(_494);
        _504 = _506;
    }
    float _508 = _504;
    if (!_438)
    {
        float _510 = -_508;
        float _512 = _510 + 1.0;
        _442 = _512;
    }
    float _514 = _442;
    float _516 = _182 * _408;
    if (!_438)
    {
        float _518 = _514 * _490;
        _486 = _518;
    }
    float _520 = _486;
    float _522 = _182 * _406;
    int _524 = as_type<int>(_230) & 512;
    bool _526 = _524 != 0;
    float _528 = _520 + _386;
    float _530 = fma(_214, _496, _522);
    float _532 = fma(_220, _496, _502);
    float _534 = fma(_226, _496, _516);
    float _536 = _182 + _528;
    float _538 = fma(_214, _500, _248);
    float _540 = fma(_220, _500, _254);
    float _542 = fma(_226, _500, _260);
    float _544 = _536 + _452;
    bool _546 = _392 != 1.0;
    bool _548 = isnan(_392);
    bool _550 = _546 || _548;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    float _556 = _392;
    float _558 = _392;
    float _560 = _520;
    float _562 = _520;
    float _638;
    float _646;
    float _648;
    float _650;
    float _752;
    float _796;
    float _862;
    float _864;
    float _868;
    float _876;
    float _878;
    float _882;
    float _886;
    float _890;
    float _894;
    float _898;
    float _900;
    float _902;
    if (!_462)
    {
        if (_554)
        {
            _316 = 0.60000002384185791015625;
        }
        float _564 = _316;
        float _566 = _298;
        if (!_554)
        {
            float _568 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _566 = _568;
        }
        float _570 = _566;
        if (_554)
        {
            _318 = 0.4199999868869781494140625;
        }
        float _572 = _318;
        if (_554)
        {
            _556 = 0.23000000417232513427734375;
        }
        float _574 = _556;
        float _576 = _234;
        if (!_554)
        {
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _576 = _578;
        }
        float _580 = _576;
        float _582 = _564;
        if (!_554)
        {
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _582 = _584;
        }
        float _586 = _582;
        float _588 = _572;
        if (!_554)
        {
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _588 = _590;
        }
        float _592 = _588;
        if (_554)
        {
            _320 = 0.1500000059604644775390625;
        }
        float _594 = _320;
        float _596 = _574;
        if (!_554)
        {
            float _598 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _596 = _598;
        }
        float _600 = _596;
        float _602 = _594;
        if (!_554)
        {
            float _604 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _602 = _604;
        }
        float _606 = _602;
        float _608 = 0.0;
        if (!_554)
        {
            float _610 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _608 = _610;
        }
        float _612 = _608;
        float _614 = _490;
        if (!_554)
        {
            float _616 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _614 = _616;
        }
        float _618 = _614;
        if (_554)
        {
            _322 = 0.60000002384185791015625;
        }
        float _620 = _322;
        float _622 = _544 * 6.283184051513671875;
        float _624 = _180 * _586;
        float _626 = _620;
        float _628 = _586;
        if (!_554)
        {
            _626 = _586;
        }
        float _630 = _626;
        float _632 = _180 * _592;
        float _634 = 1.0 / _624;
        float _636 = _630;
        _638 = _570;
        if (_554)
        {
            _628 = 0.4199999868869781494140625;
        }
        float _640 = _628;
        float _642 = _180 * _600;
        float _644 = _640;
        _646 = _580;
        _648 = _612;
        _650 = _618;
        if (!_554)
        {
            _644 = _592;
        }
        float _652 = _644;
        float _654 = _180 * _630;
        float _656 = 1.0 / _632;
        float _658 = _180 * _606;
        float _660 = _652;
        if (_554)
        {
            _636 = 0.23000000417232513427734375;
        }
        float _662 = _636;
        float _664 = _180 * _652;
        float _666 = _662;
        if (!_554)
        {
            _666 = _600;
        }
        float _668 = _666;
        float _670 = 1.0 / _642;
        float _672 = _180 * _668;
        float _674 = _634 * _622;
        if (_554)
        {
            _660 = 0.1500000059604644775390625;
        }
        float _676 = _660;
        float _678 = 1.0 / _664;
        float _680 = _676;
        if (!_554)
        {
            _680 = _606;
        }
        float _682 = _680;
        float _684 = 1.0 / _658;
        float _686 = _180 * _682;
        float _688 = 1.0 / _654;
        float _690 = _674 * 0.15915493667125701904296875;
        float _692 = _656 * _622;
        float _694 = 1.0 / _672;
        float _696 = _692 * 0.15915493667125701904296875;
        float _698 = _670 * _622;
        float _700 = _528 * _678;
        float _702 = 1.0 / _686;
        float _704 = _698 * 0.15915493667125701904296875;
        float _706 = _684 * _622;
        float _708 = _700 * 6.283184051513671875;
        float _710 = _706 * 0.15915493667125701904296875;
        float _712 = _528 * _688;
        float _714 = _708 * 0.15915493667125701904296875;
        float _716 = _712 * 6.283184051513671875;
        float _718 = _528 * _694;
        float _720 = _690 * 6.283185482025146484375;
        float _722 = sin(_720);
        float _724 = _528 * _702;
        float _726 = _696 * 6.283185482025146484375;
        float _728 = sin(_726);
        float _730 = _716 * 0.15915493667125701904296875;
        float _732 = _718 * 6.283184051513671875;
        float _734 = _724 * 6.283184051513671875;
        float _736 = _714 * 6.283185482025146484375;
        float _738 = sin(_736);
        float _740 = _732 * 0.15915493667125701904296875;
        float _742 = _734 * 0.15915493667125701904296875;
        float _744 = _708;
        float _746 = _718;
        float _748 = _732;
        float _750 = _722;
        _752 = _740;
        if (_554)
        {
            _744 = 3.0;
        }
        float _754 = _744;
        float _756 = _754;
        if (_554)
        {
            _746 = 3.0;
        }
        float _758 = _746;
        float _760 = _730 * 6.283185482025146484375;
        float _762 = sin(_760);
        float _764 = _758;
        if (!_554)
        {
            _756 = _570;
        }
        float _766 = _756;
        float _768 = _766;
        if (!_554)
        {
            _764 = _570;
        }
        float _770 = _764;
        float _772 = _770;
        if (_554)
        {
            _748 = 4.0;
        }
        float _774 = _748;
        float _776 = _704 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = _774;
        if (!_554)
        {
            _780 = _580;
        }
        float _782 = _780;
        float _784 = _728 * _766;
        float _786 = _738 * _770;
        float _788 = _740 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _728;
        float _794 = _782;
        _796 = _786;
        if (_554)
        {
            _772 = 4.0;
        }
        float _798 = _772;
        float _800 = _798;
        if (!_554)
        {
            _800 = _580;
        }
        float _802 = _800;
        float _804 = _710 * 6.283185482025146484375;
        float _806 = sin(_804);
        float _808 = fma(_722, _782, _784);
        float _810 = _808;
        if (_554)
        {
            _792 = 2.0;
        }
        float _812 = _792;
        float _814 = _742 * 6.283185482025146484375;
        float _816 = sin(_814);
        float _818 = _812;
        if (_554)
        {
            _794 = 2.0;
        }
        float _820 = _794;
        float _822 = fma(_762, _802, _786);
        float _824 = _820;
        float _826 = _822;
        if (!_554)
        {
            _818 = _612;
        }
        float _828 = _818;
        float _830 = _828;
        if (!_554)
        {
            _824 = _612;
        }
        float _832 = _824;
        float _834 = _832;
        if (_554)
        {
            _750 = 1.5;
        }
        float _836 = _750;
        float _838 = _836;
        if (_554)
        {
            _768 = 1.5;
        }
        float _840 = _768;
        float _842 = fma(_778, _828, _808);
        float _844 = _840;
        if (!_554)
        {
            _838 = _618;
        }
        float _846 = _838;
        float _848 = fma(_790, _832, _822);
        float _850 = _846;
        if (!_554)
        {
            _844 = _618;
        }
        float _852 = _844;
        float _854 = fma(_806, _846, _842);
        float _856 = fma(_816, _852, _848);
        float _858 = _852;
        float _860 = _856;
        _862 = _854;
        _864 = _816;
        if (_554)
        {
            _858 = 1.5;
        }
        float _866 = _858;
        _868 = _866;
        if (_554)
        {
            _830 = 2.0;
        }
        float _870 = _830;
        float _872 = -_856;
        float _874 = _854 + _872;
        _876 = _870;
        _878 = _874;
        if (_554)
        {
            _834 = 3.0;
        }
        float _880 = _834;
        _882 = _880;
        if (_554)
        {
            _826 = 4.0;
        }
        float _884 = _826;
        _886 = _884;
        if (_554)
        {
            _850 = 0.1500000059604644775390625;
        }
        float _888 = _850;
        _890 = _888;
        if (_554)
        {
            _810 = 0.23000000417232513427734375;
        }
        float _892 = _810;
        _894 = _892;
        if (_554)
        {
            _860 = 0.4199999868869781494140625;
        }
        float _896 = _860;
        _898 = _896;
        _900 = 0.0;
        _902 = 0.0;
        _904 = true;
    }
    else
    {
        if (_554)
        {
            _324 = 0.4199999868869781494140625;
        }
        float _906 = _324;
        float _908 = _298;
        if (!_554)
        {
            float _910 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _908 = _910;
        }
        float _912 = _908;
        if (_554)
        {
            _558 = 0.60000002384185791015625;
        }
        float _914 = _558;
        if (_554)
        {
            _326 = 0.23000000417232513427734375;
        }
        float _916 = _326;
        float _918 = _234;
        if (!_554)
        {
            float _920 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _918 = _920;
        }
        float _922 = _918;
        float _924 = _906;
        if (!_554)
        {
            float _926 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _924 = _926;
        }
        float _928 = _924;
        float _930 = _914;
        if (!_554)
        {
            float _932 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _930 = _932;
        }
        float _934 = _930;
        if (_554)
        {
            _328 = 0.1500000059604644775390625;
        }
        float _936 = _328;
        float _938 = _916;
        if (!_554)
        {
            float _940 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _938 = _940;
        }
        float _942 = _938;
        float _944 = _936;
        if (!_554)
        {
            float _946 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _944 = _946;
        }
        float _948 = _944;
        float _950 = 0.0;
        if (!_554)
        {
            float _952 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _950 = _952;
        }
        float _954 = _950;
        float _956 = _490;
        if (!_554)
        {
            float _958 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _956 = _958;
        }
        float _960 = _956;
        if (_554)
        {
            _330 = 0.4199999868869781494140625;
        }
        float _962 = _330;
        float _964 = _962;
        if (_554)
        {
            _332 = 0.4199999868869781494140625;
        }
        float _966 = _332;
        float _968 = _544 * 6.283184051513671875;
        float _970 = _966;
        float _972 = _928;
        if (!_554)
        {
            _964 = _928;
        }
        float _974 = _964;
        float _976 = _180 * _974;
        float _978 = _974;
        if (_554)
        {
            _978 = 0.4199999868869781494140625;
        }
        float _980 = _978;
        float _982 = _980;
        if (!_554)
        {
            _982 = _928;
        }
        float _984 = _982;
        float _986 = _180 * _928;
        float _988 = _984;
        if (!_554)
        {
            _970 = _928;
        }
        float _990 = _970;
        float _992 = _180 * _984;
        float _994 = _990;
        if (_554)
        {
            _988 = 0.60000002384185791015625;
        }
        float _996 = _988;
        float _998 = 1.0 / _986;
        float _1000 = _996;
        _638 = _912;
        _648 = _954;
        if (!_554)
        {
            _1000 = _934;
        }
        float _1002 = _1000;
        float _1004 = _180 * _934;
        float _1006 = _1002;
        if (_554)
        {
            _972 = 0.60000002384185791015625;
        }
        float _1008 = _972;
        float _1010 = _1008;
        if (!_554)
        {
            _1010 = _934;
        }
        float _1012 = _1010;
        float _1014 = _180 * _942;
        float _1016 = _180 * _990;
        float _1018 = _1012;
        if (_554)
        {
            _994 = 0.60000002384185791015625;
        }
        float _1020 = _994;
        float _1022 = _1020;
        if (!_554)
        {
            _1022 = _934;
        }
        float _1024 = _1022;
        float _1026 = _180 * _1002;
        float _1028 = 1.0 / _1004;
        float _1030 = _1024;
        if (_554)
        {
            _1006 = 0.23000000417232513427734375;
        }
        float _1032 = _1006;
        float _1034 = _1032;
        if (!_554)
        {
            _1034 = _942;
        }
        float _1036 = _1034;
        float _1038 = 1.0 / _1014;
        float _1040 = _180 * _1012;
        float _1042 = _1036;
        if (_554)
        {
            _1018 = 0.23000000417232513427734375;
        }
        float _1044 = _1018;
        float _1046 = _1044;
        if (!_554)
        {
            _1046 = _942;
        }
        float _1048 = _1046;
        float _1050 = _180 * _948;
        float _1052 = _180 * _1024;
        float _1054 = _1048;
        if (_554)
        {
            _1030 = 0.23000000417232513427734375;
        }
        float _1056 = _1030;
        float _1058 = _1056;
        if (!_554)
        {
            _1058 = _942;
        }
        float _1060 = _1058;
        float _1062 = _180 * _1036;
        float _1064 = 1.0 / _1016;
        float _1066 = _1060;
        if (_554)
        {
            _1042 = 0.1500000059604644775390625;
        }
        float _1068 = _1042;
        float _1070 = _1068;
        if (!_554)
        {
            _1070 = _948;
        }
        float _1072 = _1070;
        float _1074 = _180 * _1048;
        float _1076 = 1.0 / _976;
        if (_554)
        {
            _1054 = 0.1500000059604644775390625;
        }
        float _1078 = _1054;
        float _1080 = _1078;
        if (!_554)
        {
            _1080 = _948;
        }
        float _1082 = _1080;
        float _1084 = 1.0 / _1040;
        float _1086 = _180 * _1082;
        float _1088 = 1.0 / _1074;
        float _1090 = _180 * _1060;
        if (_554)
        {
            _1066 = 0.1500000059604644775390625;
        }
        float _1092 = _1066;
        float _1094 = _1092;
        if (!_554)
        {
            _1094 = _948;
        }
        float _1096 = _1094;
        float _1098 = 1.0 / _1050;
        float _1100 = _180 * _1072;
        float _1102 = _998 * _968;
        float _1104 = _180 * _1096;
        float _1106 = 1.0 / _992;
        float _1108 = 1.0 / _1090;
        float _1110 = _1102 * 0.15915493667125701904296875;
        float _1112 = _1028 * _968;
        float _1114 = 1.0 / _1086;
        float _1116 = _1112 * 0.15915493667125701904296875;
        float _1118 = _1038 * _968;
        float _1120 = 1.0 / _1104;
        float _1122 = 1.0 / _1052;
        float _1124 = _386 + _452;
        float _1126 = _386 * 6.283184051513671875;
        float _1128 = _1118 * 0.15915493667125701904296875;
        float _1130 = _1098 * _968;
        float _1132 = _1124 * 6.283184051513671875;
        float _1134 = 1.0 / _1026;
        float _1136 = _528 * _1076;
        float _1138 = _1130 * 0.15915493667125701904296875;
        float _1140 = _1064 * _1132;
        float _1142 = _1140 * 0.15915493667125701904296875;
        float _1144 = _1106 * _1126;
        float _1146 = _1110 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1136 * 6.283184051513671875;
        float _1152 = _1144 * 0.15915493667125701904296875;
        float _1154 = _1122 * _1132;
        float _1156 = 1.0 / _1062;
        float _1158 = _1154 * 0.15915493667125701904296875;
        float _1160 = _1134 * _1126;
        float _1162 = _1150 * 0.15915493667125701904296875;
        float _1164 = _1152 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1160 * 0.15915493667125701904296875;
        float _1170 = _1160;
        float _1172 = _1148;
        if (_554)
        {
            _1170 = 3.0;
        }
        float _1174 = _1170;
        float _1176 = _1174;
        if (!_554)
        {
            _1176 = _912;
        }
        float _1178 = _1176;
        float _1180 = _1142 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = _1108 * _1132;
        float _1186 = _1162 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 0.15915493667125701904296875;
        float _1192 = _1184;
        float _1194 = _1178;
        if (_554)
        {
            _1192 = 3.0;
        }
        float _1196 = _1192;
        float _1198 = _1156 * _1126;
        float _1200 = _1196;
        if (!_554)
        {
            _1200 = _912;
        }
        float _1202 = _1200;
        float _1204 = 1.0 / _1100;
        float _1206 = _1198 * 0.15915493667125701904296875;
        float _1208 = _1158 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1148 * _1178;
        float _1214 = _1202;
        float _1216 = _1212;
        _902 = _1204;
        if (_554)
        {
            _1194 = 3.0;
        }
        float _1218 = _1194;
        float _1220 = _1218;
        if (!_554)
        {
            _1220 = _912;
        }
        float _1222 = _1220;
        if (_554)
        {
            _1172 = 3.0;
        }
        float _1224 = _1172;
        float _1226 = _1168 * 6.283185482025146484375;
        float _1228 = sin(_1226);
        float _1230 = _1224;
        if (!_554)
        {
            _1230 = _912;
        }
        float _1232 = _1230;
        float _1234 = _1120 * _1132;
        float _1236 = _1166 * _1222;
        float _1238 = _1182 * _1202;
        float _1240 = _528 * _1084;
        float _1242 = _1240;
        float _1244 = _1232;
        if (_554)
        {
            _1214 = 4.0;
        }
        float _1246 = _1214;
        float _1248 = _1188 * _1232;
        float _1250 = _1246;
        _646 = _922;
        _650 = _960;
        if (!_554)
        {
            _1250 = _922;
        }
        float _1252 = _1250;
        float _1254 = _1240 * 6.283184051513671875;
        if (_554)
        {
            _1242 = 4.0;
        }
        float _1256 = _1242;
        float _1258 = _1256;
        if (!_554)
        {
            _1258 = _922;
        }
        float _1260 = _1258;
        float _1262 = fma(_1210, _1252, _1238);
        float _1264 = _1116 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1234 * 0.15915493667125701904296875;
        float _1270 = _528 * _1088;
        float _1272 = _1254 * 0.15915493667125701904296875;
        float _1274 = fma(_1228, _1260, _1236);
        float _1276 = _528 * _1114;
        float _1278 = _1270 * 6.283184051513671875;
        float _1280 = _1272 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = _1278 * 0.15915493667125701904296875;
        float _1286 = _1276 * 6.283184051513671875;
        float _1288 = _1270;
        float _1290 = _1278;
        if (_554)
        {
            _1244 = 4.0;
        }
        float _1292 = _1244;
        float _1294 = _1204 * _1126;
        float _1296 = _1292;
        if (!_554)
        {
            _1296 = _922;
        }
        float _1298 = _1296;
        float _1300 = _1286 * 0.15915493667125701904296875;
        float _1302 = _1128 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1294 * 0.15915493667125701904296875;
        float _1308 = fma(_1266, _1298, _1212);
        float _1310 = _1190 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1298;
        float _1316 = _1266;
        _862 = _1308;
        _900 = _1306;
        if (_554)
        {
            _1314 = 4.0;
        }
        float _1318 = _1314;
        float _1320 = _1206 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318;
        if (!_554)
        {
            _1324 = _922;
        }
        float _1326 = _1324;
        float _1328 = _1284 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326;
        if (_554)
        {
            _1316 = 2.0;
        }
        float _1334 = _1316;
        float _1336 = _1334;
        if (_554)
        {
            _1288 = 2.0;
        }
        float _1338 = _1288;
        float _1340 = _1338;
        if (_554)
        {
            _1290 = 2.0;
        }
        float _1342 = _1290;
        float _1344 = _1138 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1342;
        if (!_554)
        {
            _1336 = _954;
        }
        float _1350 = _1336;
        float _1352 = fma(_1282, _1326, _1248);
        float _1354 = _1350;
        _796 = _1282;
        if (!_554)
        {
            _1340 = _954;
        }
        float _1356 = _1340;
        float _1358 = _1268 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = _1356;
        if (!_554)
        {
            _1348 = _954;
        }
        float _1364 = _1348;
        float _1366 = _1306 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = _1364;
        if (_554)
        {
            _1332 = 2.0;
        }
        float _1372 = _1332;
        float _1374 = _1300 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = _1372;
        if (!_554)
        {
            _1378 = _954;
        }
        float _1380 = _1378;
        float _1382 = fma(_1304, _1350, _1308);
        float _1384 = fma(_1312, _1356, _1262);
        float _1386 = fma(_1322, _1364, _1274);
        float _1388 = _1380;
        float _1390 = _1346;
        _752 = _1384;
        if (_554)
        {
            _1216 = 1.5;
        }
        float _1392 = _1216;
        float _1394 = _1392;
        if (_554)
        {
            _1354 = 1.5;
        }
        float _1396 = _1354;
        float _1398 = _1396;
        if (_554)
        {
            _1362 = 1.5;
        }
        float _1400 = _1362;
        float _1402 = _1400;
        if (_554)
        {
            _1370 = 1.5;
        }
        float _1404 = _1370;
        float _1406 = fma(_1330, _1380, _1352);
        float _1408 = _1404;
        _864 = _1406;
        if (!_554)
        {
            _1394 = _960;
        }
        float _1410 = _1394;
        if (!_554)
        {
            _1402 = _960;
        }
        float _1412 = _1402;
        float _1414 = _1412;
        if (!_554)
        {
            _1408 = _960;
        }
        float _1416 = _1408;
        if (!_554)
        {
            _1398 = _960;
        }
        float _1418 = _1398;
        float _1420 = fma(_1346, _1410, _1382);
        float _1422 = fma(_1360, _1412, _1384);
        float _1424 = fma(_1368, _1416, _1386);
        float _1426 = fma(_1376, _1418, _1406);
        float _1428 = -_1422;
        float _1430 = _1428 + _1424;
        float _1432 = -_1426;
        float _1434 = _1420 + _1432;
        float _1436 = _1426;
        float _1438 = _1430;
        float _1440 = _1434;
        _898 = _1376;
        if (_554)
        {
            _1388 = 1.5;
        }
        float _1442 = _1388;
        _868 = _1442;
        if (_554)
        {
            _1436 = 2.0;
        }
        float _1444 = _1436;
        float _1446 = _1434 + _1430;
        _876 = _1444;
        _878 = _1446;
        if (_554)
        {
            _1414 = 3.0;
        }
        float _1448 = _1414;
        _882 = _1448;
        if (_554)
        {
            _1438 = 4.0;
        }
        float _1450 = _1438;
        _886 = _1450;
        if (_554)
        {
            _1440 = 0.1500000059604644775390625;
        }
        float _1452 = _1440;
        _890 = _1452;
        if (_554)
        {
            _1390 = 0.23000000417232513427734375;
        }
        float _1454 = _1390;
        _894 = _1454;
        if (_554)
        {
            _898 = 0.4199999868869781494140625;
        }
    }
    _904 = false;
    float _1456 = _898;
    float _1458 = _894;
    float _1460 = _862;
    float _1462 = _864;
    float _1464 = _890;
    float _1466 = _752;
    float _1468 = _900;
    float _1470 = _796;
    float _1472 = _882;
    float _1474 = _638;
    float _1476 = _886;
    float _1478 = _646;
    float _1480 = _876;
    float _1482 = _648;
    float _1484 = _868;
    float _1486 = _650;
    float _1488 = _902;
    float _1490 = _878;
    float _1492 = _520 + _388;
    float _1494 = _182 + _1492;
    float _1496 = _1494 + _452;
    float _1498 = _1460;
    float _1500 = _1462;
    float _1502 = _1466;
    float _1504 = _1468;
    float _1506 = _1470;
    float _1508 = _1462;
    float _1510 = _1468;
    float _1512 = _1466;
    float _1514 = _1488;
    float _1516 = _1460;
    float _1518 = _1470;
    float _1520 = _1492;
    float _1522 = _1456;
    float _1524 = _1458;
    float _1526 = _1464;
    float _1528 = _1480;
    float _1530 = _1472;
    float _1532 = _1476;
    float _1534 = _1484;
    float _1536 = _1456;
    float _1538 = _1458;
    float _1540 = _1464;
    float _1542 = _1484;
    float _1544 = _1480;
    float _1546 = _1472;
    float _1548 = _1476;
    float _1550 = _1474;
    float _1552 = _1486;
    float _1554 = _1482;
    float _1704;
    float _1766;
    float _1768;
    float _1776;
    float _1816;
    float _1818;
    float _1820;
    float _1822;
    if (!_462)
    {
        if (_554)
        {
            _1498 = _1456;
        }
        float _1556 = _1498;
        if (_554)
        {
            _1500 = 0.60000002384185791015625;
        }
        float _1558 = _1500;
        if (_554)
        {
            _1502 = _1458;
        }
        float _1560 = _1502;
        float _1562 = _1556;
        if (!_554)
        {
            float _1564 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1562 = _1564;
        }
        float _1566 = _1562;
        float _1568 = _1558;
        if (!_554)
        {
            float _1570 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1568 = _1570;
        }
        float _1572 = _1568;
        if (_554)
        {
            _1504 = _1464;
        }
        float _1574 = _1504;
        float _1576 = _1560;
        if (!_554)
        {
            float _1578 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1576 = _1578;
        }
        float _1580 = _1576;
        float _1582 = _1574;
        if (!_554)
        {
            float _1584 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1582 = _1584;
        }
        float _1586 = _1582;
        if (_554)
        {
            _1506 = _1456;
        }
        float _1588 = _1506;
        float _1590 = _1496 * 6.283184051513671875;
        float _1592 = _180 * _1566;
        float _1594 = _1588;
        float _1596 = _1566;
        if (!_554)
        {
            _1594 = _1566;
        }
        float _1598 = _1594;
        float _1600 = _1598;
        if (_554)
        {
            _1596 = 0.60000002384185791015625;
        }
        float _1602 = _1596;
        float _1604 = 1.0 / _1592;
        float _1606 = _180 * _1572;
        float _1608 = _180 * _1598;
        float _1610 = _1602;
        if (!_554)
        {
            _1610 = _1572;
        }
        float _1612 = _1610;
        float _1614 = _180 * _1580;
        float _1616 = _1612;
        if (_554)
        {
            _1600 = _1458;
        }
        float _1618 = _1600;
        float _1620 = _1618;
        if (!_554)
        {
            _1620 = _1580;
        }
        float _1622 = _1620;
        float _1624 = 1.0 / _1606;
        float _1626 = _180 * _1586;
        float _1628 = _180 * _1612;
        if (_554)
        {
            _1616 = _1464;
        }
        float _1630 = _1616;
        float _1632 = _180 * _1622;
        float _1634 = _1630;
        if (!_554)
        {
            _1634 = _1586;
        }
        float _1636 = _1634;
        float _1638 = 1.0 / _1614;
        float _1640 = _1604 * _1590;
        float _1642 = _180 * _1636;
        float _1644 = 1.0 / _1608;
        float _1646 = 1.0 / _1626;
        float _1648 = 1.0 / _1628;
        float _1650 = _1640 * 0.15915493667125701904296875;
        float _1652 = _1624 * _1590;
        float _1654 = 1.0 / _1632;
        float _1656 = _1652 * 0.15915493667125701904296875;
        float _1658 = _1638 * _1590;
        float _1660 = _1658 * 0.15915493667125701904296875;
        float _1662 = _1646 * _1590;
        float _1664 = 1.0 / _1642;
        float _1666 = _1492 * _1644;
        float _1668 = _1662 * 0.15915493667125701904296875;
        float _1670 = _1492 * _1648;
        float _1672 = _1666 * 6.283184051513671875;
        float _1674 = _1650 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 * 0.15915493667125701904296875;
        float _1680 = _1670 * 6.283184051513671875;
        float _1682 = _1492 * _1654;
        float _1684 = _1672;
        float _1686 = _1682;
        if (_554)
        {
            _1684 = _1472;
        }
        float _1688 = _1684;
        float _1690 = _1680 * 0.15915493667125701904296875;
        float _1692 = _1682 * 6.283184051513671875;
        float _1694 = _1678 * 6.283185482025146484375;
        float _1696 = sin(_1694);
        float _1698 = _1492 * _1664;
        float _1700 = _1688;
        float _1702 = _1692;
        _1704 = _1664;
        if (_554)
        {
            _1686 = _1472;
        }
        float _1706 = _1686;
        float _1708 = _1692 * 0.15915493667125701904296875;
        float _1710 = _1706;
        if (!_554)
        {
            _1700 = _1474;
        }
        float _1712 = _1700;
        float _1714 = _1698 * 6.283184051513671875;
        float _1716 = _1712;
        float _1718 = _1714;
        if (!_554)
        {
            _1710 = _1474;
        }
        float _1720 = _1710;
        float _1722 = _1656 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1714 * 0.15915493667125701904296875;
        float _1728 = _1676 * _1712;
        float _1730 = _1720;
        if (_554)
        {
            _1702 = _1476;
        }
        float _1732 = _1702;
        float _1734 = _1732;
        if (!_554)
        {
            _1734 = _1478;
        }
        float _1736 = _1734;
        float _1738 = _1736;
        if (_554)
        {
            _1716 = _1480;
        }
        float _1740 = _1716;
        float _1742 = _1690 * 6.283185482025146484375;
        float _1744 = sin(_1742);
        float _1746 = _1696 * _1720;
        float _1748 = _1740;
        if (_554)
        {
            _1730 = _1476;
        }
        float _1750 = _1730;
        float _1752 = _1750;
        if (!_554)
        {
            _1752 = _1478;
        }
        float _1754 = _1752;
        if (!_554)
        {
            _1748 = _1482;
        }
        float _1756 = _1748;
        float _1758 = _1660 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = fma(_1724, _1736, _1728);
        float _1764 = _1724;
        _1766 = _1756;
        _1768 = _1762;
        if (_554)
        {
            _1738 = _1480;
        }
        float _1770 = _1738;
        float _1772 = _1770;
        if (!_554)
        {
            _1772 = _1482;
        }
        float _1774 = _1772;
        _1776 = _1774;
        if (_554)
        {
            _1764 = _1484;
        }
        float _1778 = _1764;
        float _1780 = _1708 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = fma(_1744, _1754, _1746);
        float _1786 = _1778;
        if (_554)
        {
            _1718 = _1484;
        }
        float _1788 = _1718;
        float _1790 = _1788;
        if (!_554)
        {
            _1786 = _1486;
        }
        float _1792 = _1786;
        if (!_554)
        {
            _1790 = _1486;
        }
        float _1794 = _1790;
        float _1796 = _1668 * 6.283185482025146484375;
        float _1798 = sin(_1796);
        float _1800 = fma(_1760, _1756, _1762);
        float _1802 = _1726 * 6.283185482025146484375;
        float _1804 = sin(_1802);
        float _1806 = fma(_1782, _1774, _1784);
        float _1808 = fma(_1798, _1792, _1800);
        float _1810 = fma(_1804, _1794, _1806);
        float _1812 = -_1810;
        float _1814 = _1808 + _1812;
        _1816 = _1798;
        _1818 = _1810;
        _1820 = _1808;
        _1822 = _1814;
        _1824 = true;
    }
    else
    {
        if (_554)
        {
            _1508 = _1456;
        }
        float _1826 = _1508;
        if (_554)
        {
            _1510 = _1458;
        }
        float _1828 = _1510;
        if (_554)
        {
            _1512 = 0.60000002384185791015625;
        }
        float _1830 = _1512;
        float _1832 = _1826;
        if (!_554)
        {
            float _1834 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1832 = _1834;
        }
        float _1836 = _1832;
        if (_554)
        {
            _1514 = _1464;
        }
        float _1838 = _1514;
        float _1840 = _1828;
        if (!_554)
        {
            float _1842 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1840 = _1842;
        }
        float _1844 = _1840;
        float _1846 = _1830;
        if (!_554)
        {
            float _1848 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1846 = _1848;
        }
        float _1850 = _1846;
        float _1852 = _1838;
        if (!_554)
        {
            float _1854 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1852 = _1854;
        }
        float _1856 = _1852;
        if (_554)
        {
            _1516 = _1456;
        }
        float _1858 = _1516;
        float _1860 = _1858;
        if (_554)
        {
            _1518 = _1456;
        }
        float _1862 = _1518;
        float _1864 = _1496 * 6.283184051513671875;
        float _1866 = _388 * 6.283184051513671875;
        float _1868 = _1862;
        float _1870 = _1836;
        if (!_554)
        {
            _1860 = _1836;
        }
        float _1872 = _1860;
        float _1874 = _1872;
        if (!_554)
        {
            _1868 = _1836;
        }
        float _1876 = _1868;
        float _1878 = _180 * _1872;
        float _1880 = _1876;
        if (_554)
        {
            _1874 = _1456;
        }
        float _1882 = _1874;
        float _1884 = _180 * _1876;
        float _1886 = _180 * _1844;
        float _1888 = _1882;
        if (!_554)
        {
            _1888 = _1836;
        }
        float _1890 = _1888;
        float _1892 = _180 * _1836;
        float _1894 = _1890;
        if (_554)
        {
            _1880 = 0.60000002384185791015625;
        }
        float _1896 = _1880;
        float _1898 = _1896;
        float _1900 = _1850;
        if (!_554)
        {
            _1898 = _1850;
        }
        float _1902 = _1898;
        float _1904 = 1.0 / _1886;
        float _1906 = _180 * _1856;
        float _1908 = _1902;
        if (_554)
        {
            _1870 = 0.60000002384185791015625;
        }
        float _1910 = _1870;
        float _1912 = 1.0 / _1892;
        float _1914 = _180 * _1890;
        float _1916 = _1910;
        if (_554)
        {
            _1894 = 0.60000002384185791015625;
        }
        float _1918 = _1894;
        float _1920 = _1918;
        if (!_554)
        {
            _1920 = _1850;
        }
        float _1922 = _1920;
        float _1924 = _180 * _1902;
        if (_554)
        {
            _1908 = _1458;
        }
        float _1926 = _1908;
        float _1928 = _1926;
        if (!_554)
        {
            _1928 = _1844;
        }
        float _1930 = _1928;
        float _1932 = 1.0 / _1906;
        float _1934 = _180 * _1850;
        float _1936 = _1930;
        if (!_554)
        {
            _1916 = _1850;
        }
        float _1938 = _1916;
        float _1940 = _180 * _1922;
        float _1942 = _180 * _1930;
        float _1944 = _1938;
        if (_554)
        {
            _1936 = _1458;
        }
        float _1946 = _1936;
        float _1948 = 1.0 / _1934;
        float _1950 = _1946;
        if (!_554)
        {
            _1950 = _1844;
        }
        float _1952 = _1950;
        float _1954 = _180 * _1938;
        float _1956 = _1952;
        if (_554)
        {
            _1944 = _1458;
        }
        float _1958 = _1944;
        float _1960 = 1.0 / _1924;
        float _1962 = _1958;
        if (!_554)
        {
            _1962 = _1844;
        }
        float _1964 = _1962;
        float _1966 = _1964;
        if (_554)
        {
            _1900 = _1464;
        }
        float _1968 = _1900;
        float _1970 = _180 * _1952;
        float _1972 = _1968;
        if (_554)
        {
            _1956 = _1464;
        }
        float _1974 = _1956;
        float _1976 = 1.0 / _1914;
        float _1978 = _1974;
        if (!_554)
        {
            _1978 = _1856;
        }
        float _1980 = _1978;
        if (!_554)
        {
            _1972 = _1856;
        }
        float _1982 = _1972;
        float _1984 = _180 * _1964;
        if (_554)
        {
            _1966 = _1464;
        }
        float _1986 = _1966;
        float _1988 = _1986;
        if (!_554)
        {
            _1988 = _1856;
        }
        float _1990 = _1988;
        float _1992 = _180 * _1980;
        float _1994 = _1912 * _1864;
        float _1996 = 1.0 / _1954;
        float _1998 = _180 * _1990;
        float _2000 = 1.0 / _1884;
        float _2002 = _180 * _1982;
        float _2004 = _1994 * 0.15915493667125701904296875;
        float _2006 = _1948 * _1864;
        float _2008 = _2006 * 0.15915493667125701904296875;
        float _2010 = 1.0 / _1878;
        float _2012 = _1904 * _1864;
        float _2014 = 1.0 / _2002;
        float _2016 = 1.0 / _1940;
        float _2018 = _388 + _452;
        float _2020 = _2012 * 0.15915493667125701904296875;
        float _2022 = _1932 * _1864;
        float _2024 = _2018 * 6.283184051513671875;
        float _2026 = 1.0 / _1998;
        float _2028 = _1976 * _1866;
        float _2030 = _2022 * 0.15915493667125701904296875;
        float _2032 = _2000 * _2024;
        float _2034 = _2028 * 0.15915493667125701904296875;
        float _2036 = _2032 * 0.15915493667125701904296875;
        float _2038 = _1492 * _2010;
        float _2040 = 1.0 / _1984;
        float _2042 = _1960 * _2024;
        float _2044 = _2038 * 6.283184051513671875;
        float _2046 = _2004 * 6.283185482025146484375;
        float _2048 = sin(_2046);
        float _2050 = _2042 * 0.15915493667125701904296875;
        float _2052 = _2016 * _1866;
        float _2054 = 1.0 / _1970;
        float _2056 = _2052 * 0.15915493667125701904296875;
        float _2058 = _2052;
        float _2060 = _2018;
        if (_554)
        {
            _2058 = _1472;
        }
        float _2062 = _2058;
        float _2064 = 1.0 / _1992;
        float _2066 = _2062;
        if (!_554)
        {
            _2066 = _1474;
        }
        float _2068 = _2066;
        float _2070 = _2034 * 6.283185482025146484375;
        float _2072 = sin(_2070);
        float _2074 = _2044 * 0.15915493667125701904296875;
        float _2076 = _2040 * _2024;
        float _2078 = _2048 * _2068;
        float _2080 = _2036 * 6.283185482025146484375;
        float _2082 = sin(_2080);
        float _2084 = _2054 * _1866;
        float _2086 = _2068;
        float _2088 = _2076;
        if (_554)
        {
            _2086 = _1472;
        }
        float _2090 = _2086;
        float _2092 = _2074 * 6.283185482025146484375;
        float _2094 = sin(_2092);
        float _2096 = _2090;
        if (!_554)
        {
            _2096 = _1474;
        }
        float _2098 = _2096;
        float _2100 = _2076 * 0.15915493667125701904296875;
        if (_554)
        {
            _2088 = _1472;
        }
        float _2102 = _2088;
        float _2104 = 1.0 / _1942;
        float _2106 = _2084 * 0.15915493667125701904296875;
        float _2108 = _2102;
        if (_554)
        {
            _2060 = _1472;
        }
        float _2110 = _2060;
        float _2112 = _2026 * _2024;
        float _2114 = _2110;
        if (!_554)
        {
            _2108 = _1474;
        }
        float _2116 = _2108;
        float _2118 = _2008 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = _2116;
        if (!_554)
        {
            _2114 = _1474;
        }
        float _2124 = _2114;
        float _2126 = _2072 * _2098;
        float _2128 = _1492 * _1996;
        float _2130 = _2056 * 6.283185482025146484375;
        float _2132 = sin(_2130);
        float _2134 = _2082 * _2116;
        float _2136 = _2112 * 0.15915493667125701904296875;
        float _2138 = _2094 * _2124;
        float _2140 = _2128 * 6.283184051513671875;
        float _2142 = _2124;
        float _2144 = _2128;
        if (_554)
        {
            _2142 = _1476;
        }
        float _2146 = _2142;
        float _2148 = _2146;
        if (_554)
        {
            _2144 = _1476;
        }
        float _2150 = _2144;
        float _2152 = _2150;
        if (!_554)
        {
            _2148 = _1478;
        }
        float _2154 = _2148;
        if (!_554)
        {
            _2152 = _1478;
        }
        float _2156 = _2152;
        float _2158 = _1492 * _2104;
        float _2160 = _2140 * 0.15915493667125701904296875;
        float _2162 = _2064 * _1866;
        float _2164 = fma(_2120, _2154, _2078);
        float _2166 = fma(_2132, _2156, _2126);
        float _2168 = _2050 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _1492 * _2014;
        float _2174 = _2158 * 6.283184051513671875;
        float _2176 = _2162 * 0.15915493667125701904296875;
        float _2178 = _2172 * 6.283184051513671875;
        float _2180 = _2174 * 0.15915493667125701904296875;
        float _2182 = _2160 * 6.283185482025146484375;
        float _2184 = sin(_2182);
        float _2186 = _2158;
        float _2188 = _2174;
        float _2190 = _2178;
        _1768 = _2164;
        if (_554)
        {
            _2122 = _1476;
        }
        float _2192 = _2122;
        float _2194 = _2192;
        if (!_554)
        {
            _2194 = _1478;
        }
        float _2196 = _2194;
        float _2198 = _2020 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = _2196;
        if (_554)
        {
            _1520 = _1476;
        }
        float _2204 = _1520;
        float _2206 = _2100 * 6.283185482025146484375;
        float _2208 = sin(_2206);
        float _2210 = _2204;
        if (!_554)
        {
            _2210 = _1478;
        }
        float _2212 = _2210;
        float _2214 = _2106 * 6.283185482025146484375;
        float _2216 = sin(_2214);
        float _2218 = _2176 * 6.283185482025146484375;
        float _2220 = sin(_2218);
        float _2222 = fma(_2170, _2196, _2134);
        float _2224 = _2178 * 0.15915493667125701904296875;
        float _2226 = _2180 * 6.283185482025146484375;
        float _2228 = sin(_2226);
        float _2230 = _2212;
        _1816 = _2184;
        if (_554)
        {
            _2202 = _1480;
        }
        float _2232 = _2202;
        float _2234 = _2232;
        if (_554)
        {
            _2186 = _1480;
        }
        float _2236 = _2186;
        float _2238 = _2236;
        if (_554)
        {
            _2188 = _1480;
        }
        float _2240 = _2188;
        float _2242 = _2030 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = _2240;
        if (!_554)
        {
            _2234 = _1482;
        }
        float _2248 = _2234;
        float _2250 = fma(_2184, _2212, _2138);
        float _2252 = _2248;
        if (!_554)
        {
            _2238 = _1482;
        }
        float _2254 = _2238;
        float _2256 = _2136 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2254;
        if (!_554)
        {
            _2246 = _1482;
        }
        float _2262 = _2246;
        float _2264 = _2224 * 6.283185482025146484375;
        float _2266 = sin(_2264);
        float _2268 = _2262;
        if (_554)
        {
            _2230 = _1480;
        }
        float _2270 = _2230;
        float _2272 = _2270;
        if (!_554)
        {
            _2272 = _1482;
        }
        float _2274 = _2272;
        float _2276 = fma(_2200, _2248, _2164);
        float _2278 = fma(_2208, _2254, _2222);
        float _2280 = fma(_2216, _2262, _2166);
        if (_554)
        {
            _2190 = _1484;
        }
        float _2282 = _2190;
        float _2284 = _2282;
        if (_554)
        {
            _2252 = _1484;
        }
        float _2286 = _2252;
        float _2288 = _2286;
        if (_554)
        {
            _2260 = _1484;
        }
        float _2290 = _2260;
        float _2292 = _2290;
        if (_554)
        {
            _2268 = _1484;
        }
        float _2294 = _2268;
        float _2296 = fma(_2228, _2274, _2250);
        float _2298 = _2294;
        if (!_554)
        {
            _2284 = _1486;
        }
        float _2300 = _2284;
        if (!_554)
        {
            _2292 = _1486;
        }
        float _2302 = _2292;
        _1776 = _2302;
        if (!_554)
        {
            _2298 = _1486;
        }
        float _2304 = _2298;
        if (!_554)
        {
            _2288 = _1486;
        }
        float _2306 = _2288;
        float _2308 = fma(_2244, _2300, _2276);
        float _2310 = fma(_2258, _2302, _2278);
        float _2312 = fma(_2220, _2304, _2280);
        float _2314 = fma(_2266, _2306, _2296);
        float _2316 = -_2310;
        float _2318 = _2316 + _2312;
        float _2320 = -_2314;
        float _2322 = _2308 + _2320;
        float _2324 = _2322 + _2318;
        _1766 = _2306;
        _1818 = _2314;
        _1704 = _2318;
        _1820 = _2322;
        _1822 = _2324;
    }
    _1824 = false;
    float _2326 = _1776;
    float _2328 = _1766;
    float _2330 = _1816;
    float _2332 = _1818;
    float _2334 = _1768;
    float _2336 = _1704;
    float _2338 = _1820;
    float _2340 = _1822;
    float _2342 = _520 + _390;
    float _2344 = _182 + _2342;
    float _2346 = _2344 + _452;
    float _2348 = _2326;
    float _2350 = _2328;
    float _2352 = _2328;
    float _2354 = _2334;
    float _2356 = _2330;
    float _2358 = _2332;
    float _2360 = _2326;
    float _2362 = _2342;
    float _2364 = _2336;
    float _2366 = _2338;
    float _2470;
    float _2472;
    float _2474;
    float _2510;
    float _2538;
    float _2542;
    float _2552;
    float _2594;
    float _2596;
    float _2598;
    float _2600;
    float _2602;
    float _2604;
    float _2606;
    float _2608;
    float _2610;
    float _2612;
    float _2614;
    if (!_462)
    {
        if (_554)
        {
            _468 = _1456;
        }
        float _2368 = _468;
        if (_554)
        {
            _560 = 0.60000002384185791015625;
        }
        float _2370 = _560;
        float _2372 = _2368;
        if (!_554)
        {
            float _2374 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2372 = _2374;
        }
        float _2376 = _2372;
        if (_554)
        {
            _2348 = _1458;
        }
        float _2378 = _2348;
        float _2380 = _2370;
        if (!_554)
        {
            float _2382 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2380 = _2382;
        }
        float _2384 = _2380;
        if (_554)
        {
            _2350 = _1464;
        }
        float _2386 = _2350;
        float _2388 = _2378;
        if (!_554)
        {
            float _2390 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2388 = _2390;
        }
        float _2392 = _2388;
        float _2394 = _2386;
        if (!_554)
        {
            float _2396 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2394 = _2396;
        }
        float _2398 = _2394;
        float _2400 = _2346 * 6.283184051513671875;
        float _2402 = _180 * _2376;
        float _2404 = _2376;
        if (!_554)
        {
            _1522 = _2376;
        }
        float _2406 = _1522;
        if (_554)
        {
            _2404 = 0.60000002384185791015625;
        }
        float _2408 = _2404;
        float _2410 = _180 * _2384;
        float _2412 = _2408;
        if (!_554)
        {
            _2412 = _2384;
        }
        float _2414 = _2412;
        float _2416 = 1.0 / _2402;
        float _2418 = _180 * _2406;
        float _2420 = _180 * _2392;
        if (!_554)
        {
            _1524 = _2392;
        }
        float _2422 = _1524;
        float _2424 = _180 * _2414;
        float _2426 = _180 * _2398;
        if (!_554)
        {
            _1526 = _2398;
        }
        float _2428 = _1526;
        float _2430 = 1.0 / _2410;
        float _2432 = _180 * _2428;
        float _2434 = 1.0 / _2420;
        float _2436 = _180 * _2422;
        float _2438 = _2416 * _2400;
        float _2440 = _2438 * 0.15915493667125701904296875;
        float _2442 = 1.0 / _2426;
        float _2444 = _2430 * _2400;
        float _2446 = _2444 * 0.15915493667125701904296875;
        float _2448 = 1.0 / _2418;
        float _2450 = _2434 * _2400;
        float _2452 = _2450 * 0.15915493667125701904296875;
        float _2454 = 1.0 / _2424;
        float _2456 = _2442 * _2400;
        float _2458 = _2456 * 0.15915493667125701904296875;
        float _2460 = 1.0 / _2436;
        float _2462 = 1.0 / _2432;
        float _2464 = _2342 * _2448;
        float _2466 = _2342 * _2454;
        float _2468 = _2454;
        _2470 = _2442;
        _2472 = _2430;
        _2474 = _2448;
        if (_554)
        {
            _2468 = _1480;
        }
        float _2476 = _2468;
        float _2478 = _2464 * 6.283184051513671875;
        float _2480 = _2476;
        if (!_554)
        {
            _2480 = _1482;
        }
        float _2482 = _2480;
        float _2484 = _2440 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        float _2488 = _2478 * 0.15915493667125701904296875;
        float _2490 = _2466 * 6.283184051513671875;
        float _2492 = _2342 * _2460;
        float _2494 = _2490;
        if (!_554)
        {
            _1528 = _1482;
        }
        float _2496 = _1528;
        float _2498 = _2490 * 0.15915493667125701904296875;
        float _2500 = _2492 * 6.283184051513671875;
        float _2502 = _2342 * _2462;
        float _2504 = _2488 * 6.283185482025146484375;
        float _2506 = sin(_2504);
        float _2508 = _2500;
        _2510 = _2496;
        if (_554)
        {
            _2494 = _1472;
        }
        float _2512 = _2494;
        float _2514 = _2500 * 0.15915493667125701904296875;
        float _2516 = _2502 * 6.283184051513671875;
        float _2518 = _2512;
        if (!_554)
        {
            _2518 = _1474;
        }
        float _2520 = _2518;
        if (!_554)
        {
            _1530 = _1474;
        }
        float _2522 = _1530;
        float _2524 = _2516 * 0.15915493667125701904296875;
        float _2526 = _2446 * 6.283185482025146484375;
        float _2528 = sin(_2526);
        float _2530 = _2522;
        if (_554)
        {
            _2508 = _1476;
        }
        float _2532 = _2508;
        float _2534 = _2486 * _2520;
        float _2536 = _2532;
        _2538 = _2534;
        if (!_554)
        {
            _2536 = _1478;
        }
        float _2540 = _2536;
        _2542 = _2540;
        if (!_554)
        {
            _1532 = _1478;
        }
        float _2544 = _1532;
        float _2546 = _2498 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        float _2550 = _2506 * _2522;
        _2552 = _2506;
        if (_554)
        {
            _2530 = _1484;
        }
        float _2554 = _2530;
        float _2556 = _2554;
        if (!_554)
        {
            _2556 = _1486;
        }
        float _2558 = _2556;
        if (!_554)
        {
            _1534 = _1486;
        }
        float _2560 = _1534;
        float _2562 = _2452 * 6.283185482025146484375;
        float _2564 = sin(_2562);
        float _2566 = fma(_2528, _2540, _2534);
        float _2568 = _2514 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        float _2572 = fma(_2548, _2544, _2550);
        float _2574 = _2458 * 6.283185482025146484375;
        float _2576 = sin(_2574);
        float _2578 = fma(_2564, _2482, _2566);
        float _2580 = _2524 * 6.283185482025146484375;
        float _2582 = sin(_2580);
        float _2584 = fma(_2570, _2496, _2572);
        float _2586 = fma(_2576, _2558, _2578);
        float _2588 = fma(_2582, _2560, _2584);
        float _2590 = -_2588;
        float _2592 = _2586 + _2590;
        _2594 = _2576;
        _2596 = _2582;
        _2598 = _2548;
        _2600 = _2560;
        _2602 = _2564;
        _2604 = _2578;
        _2606 = _2588;
        _2608 = _2566;
        _2610 = _2572;
        _2612 = _2586;
        _2614 = _2592;
        _2616 = true;
    }
    else
    {
        if (_554)
        {
            _2352 = _1456;
        }
        float _2618 = _2352;
        if (_554)
        {
            _2354 = 0.60000002384185791015625;
        }
        float _2620 = _2354;
        if (_554)
        {
            _2356 = _1458;
        }
        float _2622 = _2356;
        float _2624 = _2618;
        if (!_554)
        {
            float _2626 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2624 = _2626;
        }
        float _2628 = _2624;
        float _2630 = _2620;
        if (!_554)
        {
            float _2632 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2630 = _2632;
        }
        float _2634 = _2630;
        float _2636 = _2622;
        if (!_554)
        {
            float _2638 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2636 = _2638;
        }
        float _2640 = _2636;
        if (_554)
        {
            _2358 = _1464;
        }
        float _2642 = _2358;
        float _2644 = _2642;
        if (!_554)
        {
            float _2646 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2644 = _2646;
        }
        float _2648 = _2644;
        if (_554)
        {
            _2360 = _1456;
        }
        float _2650 = _2360;
        float _2652 = _2346 * 6.283184051513671875;
        float _2654 = _2650;
        if (_554)
        {
            _562 = _1456;
        }
        float _2656 = _562;
        float _2658 = _390 + _452;
        float _2660 = _2656;
        float _2662 = _2628;
        if (!_554)
        {
            _2654 = _2628;
        }
        float _2664 = _2654;
        float _2666 = _180 * _2628;
        float _2668 = _2664;
        if (!_554)
        {
            _1536 = _2628;
        }
        float _2670 = _1536;
        float _2672 = _180 * _2634;
        if (!_554)
        {
            _2660 = _2628;
        }
        float _2674 = _2660;
        float _2676 = 1.0 / _2666;
        if (_554)
        {
            _2662 = 0.60000002384185791015625;
        }
        float _2678 = _2662;
        float _2680 = _180 * _2640;
        float _2682 = _2678;
        if (!_554)
        {
            _2682 = _2634;
        }
        float _2684 = _2682;
        float _2686 = _180 * _2674;
        float _2688 = 1.0 / _2672;
        float _2690 = _180 * _2684;
        float _2692 = _2684;
        if (_554)
        {
            _2692 = _1458;
        }
        float _2694 = _2692;
        float _2696 = _180 * _2648;
        float _2698 = _2694;
        if (!_554)
        {
            _2698 = _2640;
        }
        float _2700 = _2698;
        float _2702 = 1.0 / _2680;
        float _2704 = _180 * _2664;
        if (_554)
        {
            _2668 = 0.60000002384185791015625;
        }
        float _2706 = _2668;
        float _2708 = _2706;
        if (!_554)
        {
            _2708 = _2634;
        }
        float _2710 = _2708;
        float _2712 = 1.0 / _2704;
        float _2714 = _180 * _2670;
        float _2716 = _180 * _2710;
        float _2718 = _2710;
        if (_554)
        {
            _2718 = 0.60000002384185791015625;
        }
        float _2720 = _2718;
        float _2722 = _2720;
        if (!_554)
        {
            _2722 = _2634;
        }
        float _2724 = _2722;
        float _2726 = 1.0 / _2690;
        float _2728 = _180 * _2700;
        float _2730 = _180 * _2724;
        float _2732 = _2724;
        float _2734 = _2728;
        if (_554)
        {
            _2732 = _1458;
        }
        float _2736 = _2732;
        float _2738 = _2736;
        if (!_554)
        {
            _2738 = _2640;
        }
        float _2740 = _2738;
        float _2742 = _2740;
        if (!_554)
        {
            _1538 = _2640;
        }
        float _2744 = _1538;
        float _2746 = 1.0 / _2716;
        float _2748 = _180 * _2740;
        float _2750 = _2744;
        if (_554)
        {
            _2742 = _1464;
        }
        float _2752 = _2742;
        float _2754 = _180 * _2744;
        float _2756 = _2752;
        if (_554)
        {
            _2750 = _1464;
        }
        float _2758 = _2750;
        float _2760 = _2758;
        if (!_554)
        {
            _2756 = _2648;
        }
        float _2762 = _2756;
        float _2764 = 1.0 / _2696;
        if (!_554)
        {
            _2760 = _2648;
        }
        float _2766 = _2760;
        if (!_554)
        {
            _1540 = _2648;
        }
        float _2768 = _1540;
        float _2770 = _180 * _2762;
        float _2772 = _180 * _2766;
        float _2774 = _180 * _2768;
        float _2776 = _2676 * _2652;
        float _2778 = 1.0 / _2730;
        float _2780 = 1.0 / _2714;
        float _2782 = _2776 * 0.15915493667125701904296875;
        float _2784 = _2688 * _2652;
        float _2786 = 1.0 / _2774;
        float _2788 = _2784 * 0.15915493667125701904296875;
        float _2790 = _2702 * _2652;
        float _2792 = _2790 * 0.15915493667125701904296875;
        float _2794 = _2764 * _2652;
        float _2796 = 1.0 / _2748;
        float _2798 = _2658 * 6.283184051513671875;
        float _2800 = _390 * 6.283184051513671875;
        float _2802 = _2794 * 0.15915493667125701904296875;
        float _2804 = _2712 * _2798;
        float _2806 = 1.0 / _2772;
        float _2808 = _2804 * 0.15915493667125701904296875;
        float _2810 = _2780 * _2800;
        float _2812 = _2810 * 0.15915493667125701904296875;
        float _2814 = _2726 * _2798;
        float _2816 = 1.0 / _2686;
        float _2818 = _2814 * 0.15915493667125701904296875;
        float _2820 = _2778 * _2800;
        float _2822 = _2820 * 0.15915493667125701904296875;
        float _2824 = _2796 * _2798;
        float _2826 = 1.0 / _2754;
        float _2828 = _2796;
        float _2830 = _2798;
        float _2832 = _2800;
        float _2834 = _2770;
        if (_554)
        {
            _2828 = _1480;
        }
        float _2836 = _2828;
        float _2838 = _2824 * 0.15915493667125701904296875;
        float _2840 = _2806 * _2798;
        float _2842 = _2806;
        float _2844 = _2836;
        if (_554)
        {
            _2830 = _1484;
        }
        float _2846 = _2830;
        float _2848 = _2342 * _2816;
        float _2850 = _2846;
        if (!_554)
        {
            _2850 = _1486;
        }
        float _2852 = _2850;
        float _2854 = 1.0 / _2728;
        float _2856 = _2840 * 0.15915493667125701904296875;
        float _2858 = _2786 * _2800;
        float _2860 = _2848 * 6.283184051513671875;
        float _2862 = _2860;
        _2602 = _2852;
        if (_554)
        {
            _2842 = _1480;
        }
        float _2864 = _2842;
        float _2866 = _2858 * 0.15915493667125701904296875;
        float _2868 = _2342 * _2746;
        float _2870 = 1.0 / _2770;
        float _2872 = _2826 * _2800;
        float _2874 = _2826;
        float _2876 = _2864;
        if (_554)
        {
            _2874 = _1484;
        }
        float _2878 = _2874;
        float _2880 = _2868 * 6.283184051513671875;
        float _2882 = _2878;
        if (!_554)
        {
            _2882 = _1486;
        }
        float _2884 = _2882;
        float _2886 = _2872 * 0.15915493667125701904296875;
        float _2888 = _2886;
        _2552 = _2884;
        if (_554)
        {
            _2832 = _1480;
        }
        float _2890 = _2832;
        float _2892 = _2880 * 0.15915493667125701904296875;
        float _2894 = _2342 * _2854;
        float _2896 = _2890;
        if (_554)
        {
            _2834 = _1484;
        }
        float _2898 = _2834;
        float _2900 = _2886 * 6.283185482025146484375;
        float _2902 = sin(_2900);
        float _2904 = _2898;
        if (!_554)
        {
            _2904 = _1486;
        }
        float _2906 = _2904;
        float _2908 = _2894 * 6.283184051513671875;
        float _2910 = _2908;
        if (!_554)
        {
            _1542 = _1486;
        }
        float _2912 = _1542;
        float _2914 = _2860 * 0.15915493667125701904296875;
        if (_554)
        {
            _2734 = _1472;
        }
        float _2916 = _2734;
        float _2918 = _2342 * _2870;
        float _2920 = _2916;
        float _2922 = _2918;
        if (_554)
        {
            _2862 = _1472;
        }
        float _2924 = _2862;
        float _2926 = _2782 * 6.283185482025146484375;
        float _2928 = sin(_2926);
        float _2930 = _2924;
        if (_554)
        {
            _2888 = _1472;
        }
        float _2932 = _2888;
        float _2934 = _2932;
        if (!_554)
        {
            _2844 = _1482;
        }
        float _2936 = _2844;
        if (!_554)
        {
            _2876 = _1482;
        }
        float _2938 = _2876;
        if (!_554)
        {
            _2896 = _1482;
        }
        float _2940 = _2896;
        float _2942 = _2808 * 6.283185482025146484375;
        float _2944 = sin(_2942);
        _2604 = _2940;
        if (!_554)
        {
            _1544 = _1482;
        }
        float _2946 = _1544;
        float _2948 = _2918 * 6.283184051513671875;
        _2510 = _2946;
        if (!_554)
        {
            _2920 = _1474;
        }
        float _2950 = _2920;
        _2598 = _2950;
        if (!_554)
        {
            _2930 = _1474;
        }
        float _2952 = _2930;
        float _2954 = _2948 * 0.15915493667125701904296875;
        _2608 = _2952;
        if (!_554)
        {
            _2934 = _1474;
        }
        float _2956 = _2934;
        float _2958 = _2812 * 6.283185482025146484375;
        float _2960 = sin(_2958);
        if (!_554)
        {
            _1546 = _1474;
        }
        float _2962 = _1546;
        float _2964 = _2908 * 0.15915493667125701904296875;
        if (_554)
        {
            _2910 = _1476;
        }
        float _2966 = _2910;
        float _2968 = _2928 * _2950;
        float _2970 = _2966;
        _2470 = _2968;
        if (_554)
        {
            _2362 = _1476;
        }
        float _2972 = _2362;
        float _2974 = _2972;
        if (_554)
        {
            _2922 = _1476;
        }
        float _2976 = _2922;
        float _2978 = _2914 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = _2976;
        if (!_554)
        {
            _2970 = _1478;
        }
        float _2984 = _2970;
        float _2986 = _2944 * _2956;
        _2538 = _2986;
        _2364 = _2944;
        if (!_554)
        {
            _2974 = _1478;
        }
        float _2988 = _2974;
        _2606 = _2988;
        if (!_554)
        {
            _2982 = _1478;
        }
        float _2990 = _2982;
        _2542 = _2990;
        if (!_554)
        {
            _1548 = _1478;
        }
        float _2992 = _1548;
        float _2994 = _2788 * 6.283185482025146484375;
        float _2996 = sin(_2994);
        float _2998 = _2960 * _2962;
        float _3000 = _2818 * 6.283185482025146484375;
        float _3002 = sin(_3000);
        float _3004 = _2980 * _2952;
        float _3006 = _2822 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        float _3010 = fma(_2996, _2984, _2968);
        float _3012 = _2892 * 6.283185482025146484375;
        float _3014 = sin(_3012);
        float _3016 = fma(_3002, _2990, _2986);
        float _3018 = _2792 * 6.283185482025146484375;
        float _3020 = sin(_3018);
        float _3022 = fma(_3008, _2992, _2998);
        float _3024 = fma(_2902, _2946, _3022);
        float _3026 = _2838 * 6.283185482025146484375;
        float _3028 = sin(_3026);
        float _3030 = fma(_3014, _2988, _3004);
        float _3032 = _2964 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = fma(_3020, _2936, _3010);
        float _3038 = _2802 * 6.283185482025146484375;
        float _3040 = sin(_3038);
        float _3042 = fma(_3028, _2940, _3016);
        float _3044 = _2856 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = fma(_3034, _2938, _3030);
        float _3050 = _2866 * 6.283185482025146484375;
        float _3052 = sin(_3050);
        float _3054 = fma(_3040, _2884, _3036);
        float _3056 = _2954 * 6.283185482025146484375;
        float _3058 = sin(_3056);
        float _3060 = fma(_3046, _2852, _3042);
        float _3062 = fma(_3052, _2912, _3024);
        float _3064 = -_3060;
        float _3066 = _3064 + _3062;
        float _3068 = fma(_3058, _2906, _3048);
        float _3070 = -_3068;
        float _3072 = _3054 + _3070;
        float _3074 = _3072 + _3066;
        _2594 = _3068;
        _2596 = _3010;
        _2472 = _3072;
        _2600 = _3066;
        _1550 = _3048;
        _2474 = _3030;
        _1552 = _3004;
        _1554 = _3058;
        _2610 = _3022;
        _2612 = _2998;
        _2366 = _3036;
        _2614 = _3074;
    }
    _2616 = false;
    float _3076 = _2594;
    float _3078 = _2596;
    float _3080 = _2598;
    float _3082 = _2552;
    float _3084 = _2470;
    float _3086 = _2472;
    float _3088 = _2600;
    float _3090 = _2510;
    float _3092 = _2602;
    float _3094 = _1550;
    float _3096 = _2474;
    float _3098 = _1552;
    float _3100 = _1554;
    float _3102 = _2538;
    float _3104 = _2604;
    float _3106 = _2606;
    float _3108 = _2608;
    float _3110 = _2610;
    float _3112 = _2542;
    float _3114 = _2612;
    float _3116 = _2364;
    float _3118 = _2366;
    float _3120 = _2614;
    int _3122 = as_type<int>(_230) & 1024;
    bool _3124 = _3122 != 0;
    float _3126 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[114]);
    float _3128 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[112]);
    int _3130 = as_type<int>(_230) & 2048;
    bool _3132 = _3130 != 0;
    float _3134 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[116]);
    float _3136 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[118]);
    float _3138 = _3076;
    float _3140 = _3078;
    float _3142 = _3080;
    if (_3124)
    {
        uint _3144 = uint(int(uint(_156) >> uint(2)));
        float _3146 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3144)]);
        int _3148 = _156 + 4;
        uint _3150 = uint(int(uint(_3148) >> uint(2)));
        float _3152 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3150)]);
        int _3154 = _156 + 8;
        uint _3156 = uint(int(uint(_3154) >> uint(2)));
        float _3158 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3156)]);
        _3138 = _3146;
        _3140 = _3152;
        _3142 = _3158;
    }
    float _3160 = _3138;
    float _3162 = _3140;
    float _3164 = _3142;
    float _3166 = _3082;
    float _3168 = _3084;
    float _3170 = _1478;
    float _3172 = _3086;
    if (_526)
    {
        float _3174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3166 = _3174;
        _3168 = _3176;
        _3170 = _3178;
        _3172 = _3180;
    }
    float _3182 = _3166;
    float _3184 = _3168;
    float _3186 = _3170;
    float _3188 = _3172;
    float _3190 = _3088;
    float _3192 = _3090;
    float _3194 = _3092;
    if (_3124)
    {
        uint _3196 = uint(int(uint(_156) >> uint(2)));
        float _3198 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3196)]);
        int _3200 = _156 + 4;
        uint _3202 = uint(int(uint(_3200) >> uint(2)));
        float _3204 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3202)]);
        int _3206 = _156 + 8;
        uint _3208 = uint(int(uint(_3206) >> uint(2)));
        float _3210 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3208)]);
        _3190 = _3198;
        _3192 = _3204;
        _3194 = _3210;
    }
    float _3212 = _3190;
    float _3214 = _3192;
    float _3216 = _3194;
    float _3218 = _3094;
    float _3220 = _3096;
    float _3222 = _3098;
    float _3224 = _3100;
    if (_526)
    {
        float _3226 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3218 = _3226;
        _3220 = _3228;
        _3222 = _3230;
        _3224 = _3232;
    }
    float _3234 = _3218;
    float _3236 = _3220;
    float _3238 = _3222;
    float _3240 = _3224;
    float _3242 = _3102;
    float _3244 = _3104;
    float _3246 = _3106;
    float _3248 = _3108;
    if (_3132)
    {
        uint _3250 = uint(int(uint(_156) >> uint(2)));
        float _3252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3250)]);
        int _3254 = _156 + 4;
        uint _3256 = uint(int(uint(_3254) >> uint(2)));
        float _3258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3256)]);
        int _3260 = _156 + 8;
        uint _3262 = uint(int(uint(_3260) >> uint(2)));
        float _3264 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3262)]);
        int _3266 = _156 + 12;
        uint _3268 = uint(int(uint(_3266) >> uint(2)));
        float _3270 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3268)]);
        _3242 = _3252;
        _3244 = _3258;
        _3246 = _3264;
        _3248 = _3270;
    }
    float _3272 = _3242;
    float _3274 = _3244;
    float _3276 = _3246;
    float _3278 = _3248;
    float _3280 = _230;
    float _3282 = _3110;
    float _3284 = _3112;
    float _3286 = _3114;
    if (_3132)
    {
        uint _3288 = uint(int(uint(_156) >> uint(2)));
        float _3290 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3288)]);
        int _3292 = _156 + 4;
        uint _3294 = uint(int(uint(_3292) >> uint(2)));
        float _3296 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3294)]);
        int _3298 = _156 + 8;
        uint _3300 = uint(int(uint(_3298) >> uint(2)));
        float _3302 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3300)]);
        int _3304 = _156 + 12;
        uint _3306 = uint(int(uint(_3304) >> uint(2)));
        float _3308 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3306)]);
        _3280 = _3290;
        _3282 = _3296;
        _3284 = _3302;
        _3286 = _3308;
    }
    float _3310 = _3280;
    float _3312 = _3282;
    float _3314 = _3284;
    float _3316 = _3286;
    float _3318 = _3116;
    if (_3124)
    {
        float _3320 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3318 = _3320;
    }
    float _3322 = _3318;
    float _3324 = _3118;
    if (_3124)
    {
        float _3326 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3324 = _3326;
    }
    float _3328 = _3324;
    float _3330 = fma(_192, _2340, _540);
    float _3332 = fma(_194, _3120, _542);
    float _3334 = fma(_190, _1490, _538);
    float _3336 = _3126 * _3126;
    float _3338 = fma(_3128, _3128, _3336);
    float _3340 = rsqrt(_3338);
    float _3342 = _3184;
    float _3344 = _3162;
    float _3346 = _3182;
    float _3348 = _3212;
    float _3350 = _3312;
    float _3352 = _3234;
    float _3354 = _3272;
    float _3356 = _3314;
    float _3358 = _3160;
    if (_3124)
    {
        float _3360 = _3330 * _3162;
        _334 = _3360;
    }
    float _3362 = _334;
    float _3364 = _3340 * (-20.0);
    float _3366 = fma(_3128, _3364, _3134);
    float _3368 = fma(_3126, _3364, _3136);
    float _3370 = _3366 * 0.5;
    float _3372 = _3368 * 0.5;
    float _3374 = _3362;
    float _3376 = _3364;
    if (_526)
    {
        float _3378 = _3330 * _3184;
        _3342 = _3378;
    }
    float _3380 = _3342;
    if (_3124)
    {
        float _3382 = fma(_3334, _3160, _3362);
        _3344 = _3382;
    }
    float _3384 = _3344;
    float _3386 = _3384;
    if (_3124)
    {
        float _3388 = _3330 * _3214;
        _3374 = _3388;
    }
    float _3390 = _3374;
    float _3392 = floor(_3370);
    float _3394 = _3390;
    if (_526)
    {
        float _3396 = fma(_3334, _3182, _3380);
        _3346 = _3396;
    }
    float _3398 = _3346;
    float _3400 = _3398;
    if (_526)
    {
        float _3402 = _3330 * _3236;
        _336 = _3402;
    }
    float _3404 = _336;
    float _3406 = _3404;
    if (_3124)
    {
        float _3408 = fma(_3334, _3212, _3390);
        _3394 = _3408;
    }
    float _3410 = _3394;
    float _3412 = _3410;
    if (_3132)
    {
        float _3414 = _3330 * _3274;
        _3348 = _3414;
    }
    float _3416 = _3348;
    float _3418 = floor(_3372);
    if (_3132)
    {
        float _3420 = _3330 * _3312;
        _3350 = _3420;
    }
    float _3422 = _3350;
    float _3424 = _3422;
    if (_526)
    {
        float _3426 = fma(_3332, _3186, _3398);
        _3400 = _3426;
    }
    float _3428 = _3400;
    if (_526)
    {
        float _3430 = fma(_3334, _3234, _3404);
        _3352 = _3430;
    }
    float _3432 = _3352;
    float _3434 = _3432;
    if (_3124)
    {
        float _3436 = fma(_3332, _3216, _3410);
        _3412 = _3436;
    }
    float _3438 = _3412;
    if (!_526)
    {
        _3376 = 0.0;
    }
    float _3440 = _3376;
    float _3442 = _3440;
    if (_3132)
    {
        float _3444 = fma(_3334, _3272, _3416);
        _3354 = _3444;
    }
    float _3446 = _3354;
    float _3448 = _3446;
    if (_3132)
    {
        float _3450 = fma(_3334, _3310, _3422);
        _3424 = _3450;
    }
    float _3452 = _3424;
    if (_526)
    {
        float _3454 = _3188 + _3428;
        _3442 = _3454;
    }
    float _3456 = _3442;
    float _3458 = _3456;
    if (_526)
    {
        float _3460 = fma(_3332, _3238, _3432);
        _3434 = _3460;
    }
    float _3462 = _3434;
    if (_3124)
    {
        float _3464 = _3322 + _3438;
        _3458 = _3464;
    }
    float _3466 = _3458;
    float _3468 = _3466;
    if (_3124)
    {
        float _3470 = fma(_3332, _3164, _3384);
        _3386 = _3470;
    }
    float _3472 = _3386;
    if (_3132)
    {
        float _3474 = fma(_3332, _3276, _3446);
        _3448 = _3474;
    }
    float _3476 = _3448;
    if (_3132)
    {
        float _3478 = fma(_3332, _3314, _3452);
        _3356 = _3478;
    }
    float _3480 = _3356;
    if (!_526)
    {
        _3406 = 0.0;
    }
    float _3482 = _3406;
    float _3484 = _3482;
    if (_526)
    {
        float _3486 = _3240 + _3462;
        _3484 = _3486;
    }
    float _3488 = _3484;
    float _3490 = _3488;
    if (_3124)
    {
        float _3492 = _3328 + _3472;
        _3490 = _3492;
    }
    float _3494 = _3490;
    float _3496 = fma(_3392, 2.0, -32.0);
    float _3498 = fma(_3418, 2.0, -32.0);
    float _3500 = _3494;
    if (_3132)
    {
        float _3502 = _3278 + _3476;
        _3500 = _3502;
    }
    float _3504 = _3500;
    if (_3132)
    {
        float _3506 = _3316 + _3480;
        _3468 = _3506;
    }
    float _3508 = _3468;
    float _3510 = -_3496;
    float _3512 = _3510 + _3504;
    float _3514 = -_3498;
    float _3516 = _3514 + _3508;
    float _3518 = _3512 * 0.015625;
    float _3520 = _3516 * 0.015625;
    float _3522 = fma(_3504, 6.2500002968590706586837768554688e-05, 0.5);
    float _3524 = fma(_3508, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _8939 = float2(_3518, _3520);
    float4 _3527 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_8939, float2(0.0), isnan(_8939)), int2(0), component::x).xyzw;
    float _3529 = _3527.x;
    float _3531 = _3527.y;
    float _3533 = _3527.z;
    float _3535 = _3527.w;
    float2 _8957 = float2(_3518, _3520);
    float4 _3537 = spvDescriptorSet0.cp_t_tcb_26.gather(spvDescriptorSet0.cp_t_tcb_26Smplr, select(_8957, float2(0.0), isnan(_8957)), int2(0), component::y).xyzw;
    float _3539 = _3537.x;
    float _3541 = _3537.y;
    float _3543 = _3537.z;
    float _3545 = _3537.w;
    float2 _8973 = float2(_3522, _3524);
    float2 _3549 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8973, float2(0.0), isnan(_8973)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8973, float2(0.0), isnan(_8973)), level(0.0)).xy;
    float _3551 = _3549.x;
    float _3553 = _3549.y;
    float _3555 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[74]);
    float _3557 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[73]);
    float _3559 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[72]);
    uint _3561 = uint(int(uint(_186) >> uint(2)));
    float _3563 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3561)]);
    bool _3565 = _3555 > 0.0;
    bool _3567 = _3557 > 0.0;
    float _3569 = _3555;
    float _3571 = _3557;
    float _3573 = _3559;
    float _3575 = _3551;
    if (_3565)
    {
        float _3577 = 1.0 / _3555;
        _3569 = _3577;
    }
    float _3579 = _3569;
    float _3581 = _3529 + _3531;
    float _3583 = _3539 + _3541;
    if (_3567)
    {
        float _3585 = _3559 * _3557;
        _3571 = _3585;
    }
    float _3587 = _3571;
    float _3589 = _3533 + _3581;
    float _3591 = _3543 + _3583;
    if (_3567)
    {
        float _3593 = -_3587;
        float _3595 = fma(_162, _3593, _3559);
        _3573 = _3595;
    }
    float _3597 = _3573;
    float _3599 = _3535 + _3589;
    float _3601 = _3597;
    if (_3565)
    {
        float _3603 = _404 * _3579;
        _444 = _3603;
    }
    float _3605 = _444;
    float _3607 = _3545 + _3591;
    float _3609 = _3605;
    if (_3565)
    {
        float _3611 = precise::min(_3605, 1.0);
        _3358 = _3611;
    }
    float _3613 = _3358;
    float _3615 = _3599 * 0.25;
    if (_3565)
    {
        float _3617 = _3613 * _3597;
        _3601 = _3617;
    }
    float _3619 = _3601;
    float _3621 = _3607 * 0.25;
    bool _3623 = !_526;
    float _3695;
    float _3697;
    if (!_3623)
    {
        float _3625 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3627 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3629 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3631 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3633 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3635 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3637 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3639 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3641 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3643 = _3629 * _3631;
        float _3645 = _3629 * _3633;
        float _3647 = _3627 * _3631;
        float _3649 = -_3643;
        float _3651 = fma(_3625, _3635, _3649);
        float _3653 = -_3645;
        float _3655 = fma(_3627, _3635, _3653);
        float _3657 = -_3647;
        float _3659 = fma(_3625, _3633, _3657);
        float _3661 = _3627 * _3641;
        float _3663 = _3651 * _3639;
        float _3665 = _3625 * _3639;
        float _3667 = -_3661;
        float _3669 = fma(_3629, _3639, _3667);
        float _3671 = -_3663;
        float _3673 = fma(_3655, _3637, _3671);
        float _3675 = -_3665;
        float _3677 = fma(_3627, _3637, _3675);
        float _3679 = fma(_3659, _3641, _3673);
        float _3681 = 1.0 / _3679;
        float _3683 = _3621 * _3681;
        float _3685 = _3615 * _3681;
        float _3687 = _3669 * _3683;
        float _3689 = _3677 * _3683;
        float _3691 = fma(_3655, _3685, _3687);
        float _3693 = fma(_3659, _3685, _3689);
        _3695 = _3691;
        _3697 = _3693;
        _3699 = true;
    }
    else
    {
        bool _3701 = _3122 != 0;
        bool _3703 = _3130 != 0;
        bool _3705 = _3703 || _3701;
        if (!_3705)
        {
            _3609 = _3615;
        }
        float _3707 = _3609;
        _3695 = _3707;
        if (!_3705)
        {
            _338 = _3621;
        }
        float _3709 = _338;
        bool _3711 = !_3705;
        _3697 = _3709;
        if (!_3711)
        {
            uint _3713 = uint(int(uint(_156) >> uint(2)));
            float _3715 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3713)]);
            int _3717 = _156 + 4;
            uint _3719 = uint(int(uint(_3717) >> uint(2)));
            float _3721 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3719)]);
            int _3723 = _156 + 8;
            uint _3725 = uint(int(uint(_3723) >> uint(2)));
            float _3727 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3725)]);
            uint _3729 = uint(int(uint(_156) >> uint(2)));
            float _3731 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3729)]);
            int _3733 = _156 + 4;
            uint _3735 = uint(int(uint(_3733) >> uint(2)));
            float _3737 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3735)]);
            int _3739 = _156 + 8;
            uint _3741 = uint(int(uint(_3739) >> uint(2)));
            float _3743 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3741)]);
            uint _3745 = uint(int(uint(_156) >> uint(2)));
            float _3747 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3745)]);
            int _3749 = _156 + 4;
            uint _3751 = uint(int(uint(_3749) >> uint(2)));
            float _3753 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3751)]);
            int _3755 = _156 + 8;
            uint _3757 = uint(int(uint(_3755) >> uint(2)));
            float _3759 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3757)]);
            float _3761 = _3727 * _3731;
            float _3763 = _3727 * _3737;
            float _3765 = _3721 * _3731;
            float _3767 = -_3761;
            float _3769 = fma(_3715, _3743, _3767);
            float _3771 = -_3763;
            float _3773 = fma(_3721, _3743, _3771);
            float _3775 = -_3765;
            float _3777 = fma(_3715, _3737, _3775);
            float _3779 = _3721 * _3759;
            float _3781 = _3769 * _3753;
            float _3783 = _3715 * _3753;
            float _3785 = -_3779;
            float _3787 = fma(_3727, _3753, _3785);
            float _3789 = -_3781;
            float _3791 = fma(_3773, _3747, _3789);
            float _3793 = -_3783;
            float _3795 = fma(_3721, _3747, _3793);
            float _3797 = fma(_3777, _3759, _3791);
            float _3799 = 1.0 / _3797;
            float _3801 = _3621 * _3799;
            float _3803 = _3615 * _3799;
            float _3805 = _3787 * _3801;
            float _3807 = _3795 * _3801;
            float _3809 = fma(_3773, _3803, _3805);
            float _3811 = fma(_3777, _3803, _3807);
            _3695 = _3809;
            _3697 = _3811;
        }
    }
    _3699 = false;
    float _3813 = _3695;
    float _3815 = _3697;
    bool _3817 = _3551 != 0.0;
    bool _3819 = isnan(_3551);
    bool _3821 = _3817 || _3819;
    bool _3823 = isnan(0.0);
    bool _3825 = _3821 || _3823;
    if (!_3825)
    {
        _3575 = 4.0;
    }
    float _3827 = _3575;
    float _3829 = _3553;
    if (!_3825)
    {
        float2 _9421 = float2(_3522, _3524);
        float _3831 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9421, float2(0.0), isnan(_9421)), level(_3827)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9421, float2(0.0), isnan(_9421)), level(_3827)).y;
        _3829 = _3831;
    }
    float _3833 = _3829;
    float _3835 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[76]);
    float _3837 = precise::max(_182, 1.0);
    float _3839 = -_530;
    float _3841 = fma(_3619, _3813, _3839);
    float _3843 = -_534;
    float _3845 = fma(_3619, _3815, _3843);
    float _3847 = -_248;
    float _3849 = _3847 + _3334;
    float _3851 = 1.0 / _3837;
    float _3853 = -_254;
    float _3855 = _3853 + _3330;
    float _3857 = _3851 * 0.5;
    float _3859 = fma(_3841, _3857, _530);
    float _3861 = fma(_3845, _3857, _534);
    int _3863 = _156 + 4;
    int _3865 = _156 + 8;
    float _3867 = -_260;
    float _3869 = _3867 + _3332;
    float _3871 = fma(_3833, 2000.0, _3835);
    uint _3873 = uint(int(uint(_3863) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_3873)] = as_type<uint>(_3871);
    uint _3875 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3875)] = as_type<uint>(_3563);
    uint _3877 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3877)] = as_type<uint>(_3334);
    uint _3879 = uint(int(uint(_3863) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3879)] = as_type<uint>(_3330);
    uint _3881 = uint(int(uint(_3865) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3881)] = as_type<uint>(_3332);
    uint _3883 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3883)] = as_type<uint>(_3859);
    uint _3885 = uint(int(uint(_3863) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3885)] = as_type<uint>(_532);
    uint _3887 = uint(int(uint(_3865) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3887)] = as_type<uint>(_3861);
    uint _3889 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3889)] = as_type<uint>(_3849);
    uint _3891 = uint(int(uint(_3863) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3891)] = as_type<uint>(_3855);
    uint _3893 = uint(int(uint(_3865) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3893)] = as_type<uint>(_3869);
    float _3895 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3897 = _3855 * _3855;
    float _3899 = _532 * _532;
    float _3901 = fma(_3849, _3849, _3897);
    float _3903 = fma(_3859, _3859, _3899);
    float _3905 = fma(_3869, _3869, _3901);
    float _3907 = fma(_3861, _3861, _3903);
    float _3909 = sqrt(_3905);
    float _3911 = sqrt(_3907);
    bool _3913 = _3909 >= 9.9999999747524270787835121154785e-07;
    bool _3915 = isnan(_3909);
    bool _3917 = _3913 || _3915;
    bool _3919 = isnan(9.9999999747524270787835121154785e-07);
    bool _3921 = _3917 || _3919;
    float _3923 = _3895;
    if (!_3921)
    {
        bool _3925 = _184 != _202;
        bool _3927 = isnan(_184);
        bool _3929 = _3925 || _3927;
        bool _3931 = isnan(_202);
        bool _3933 = _3929 || _3931;
        _3935 = _3933;
        if (!_3935)
        {
            float _3937 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _3939 = _3937 > 0.0;
            bool _3941 = !_3939;
            if (!_3941)
            {
                float _3943 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _3945 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _3947 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _3949 = _3945 * _3945;
                float _3951 = fma(_3943, _3943, _3949);
                float _3953 = fma(_3947, _3947, _3951);
                float _3955 = rsqrt(_3953);
                float _3957 = _3955 * 9.9999999747524270787835121154785e-07;
                float _3959 = _3943 * _3957;
                float _3961 = _3945 * _3957;
                float _3963 = _3947 * _3957;
                _352 = as_type<int>(_3959);
                _354 = as_type<int>(_3961);
                _356 = as_type<int>(_3963);
                _3935 = true;
            }
            else
            {
                bool _3965 = _3911 >= 9.9999999747524270787835121154785e-07;
                bool _3967 = isnan(_3911);
                bool _3969 = _3965 || _3967;
                bool _3971 = isnan(9.9999999747524270787835121154785e-07);
                bool _3973 = _3969 || _3971;
                if (!_3973)
                {
                    float _3975 = _3330 * _3330;
                    float _3977 = fma(_3334, _3334, _3975);
                    float _3979 = fma(_3332, _3332, _3977);
                    float _3981 = sqrt(_3979);
                    bool _3983 = _3981 >= 9.9999999747524270787835121154785e-07;
                    bool _3985 = isnan(_3981);
                    bool _3987 = _3983 || _3985;
                    bool _3989 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3991 = _3987 || _3989;
                    float _3993 = _3981;
                    if (_3991)
                    {
                        float _3995 = rsqrt(_3979);
                        _3993 = _3995;
                    }
                    float _3997 = _3993;
                    if (!_3991)
                    {
                        _340 = 0;
                    }
                    int _3999 = _340;
                    int _4001 = _3999;
                    if (!_3991)
                    {
                        _342 = 897988541;
                    }
                    int _4003 = _342;
                    int _4005 = _4003;
                    if (!_3991)
                    {
                        _344 = 0;
                    }
                    int _4007 = _344;
                    int _4009 = _4007;
                    if (_3991)
                    {
                        float _4011 = _3997 * 9.9999999747524270787835121154785e-07;
                        _3923 = _4011;
                    }
                    float _4013 = _3923;
                    if (_3991)
                    {
                        float _4015 = _3334 * _4013;
                        _4001 = as_type<int>(_4015);
                    }
                    int _4017 = _4001;
                    _352 = _4017;
                    if (_3991)
                    {
                        float _4019 = _3330 * _4013;
                        _4005 = as_type<int>(_4019);
                    }
                    int _4021 = _4005;
                    _354 = _4021;
                    if (_3991)
                    {
                        float _4023 = _3332 * _4013;
                        _4009 = as_type<int>(_4023);
                    }
                    int _4025 = _4009;
                    _356 = _4025;
                    _3935 = true;
                }
                else
                {
                    float _4027 = rsqrt(_3907);
                    float _4029 = _4027 * 9.9999999747524270787835121154785e-07;
                    float _4031 = _3859 * _4029;
                    float _4033 = _532 * _4029;
                    float _4035 = _3861 * _4029;
                    _352 = as_type<int>(_4031);
                    _354 = as_type<int>(_4033);
                    _356 = as_type<int>(_4035);
                    _3935 = true;
                }
            }
        }
    }
    else
    {
        float _4037 = _3911 * _3895;
        bool _4039 = _4037 >= 0.001000000047497451305389404296875;
        bool _4041 = isnan(_4037);
        bool _4043 = _4039 || _4041;
        bool _4045 = isnan(0.001000000047497451305389404296875);
        bool _4047 = _4043 || _4045;
        bool _4049 = _4037 > 0.0;
        bool _4051 = !_4047;
        bool _4053 = _4049 && _4051;
        bool _4055 = _3909 < 0.001000000047497451305389404296875;
        bool _4057 = _4055 && _4053;
        if (!_4057)
        {
            _346 = as_type<int>(_3849);
        }
        int _4059 = _346;
        int _4061 = _4059;
        if (_4057)
        {
            float _4063 = _3859 * _3895;
            _4061 = as_type<int>(_4063);
        }
        int _4065 = _4061;
        _352 = _4065;
        if (!_4057)
        {
            _348 = as_type<int>(_3855);
        }
        int _4067 = _348;
        int _4069 = _4067;
        if (_4057)
        {
            float _4071 = _532 * _3895;
            _4069 = as_type<int>(_4071);
        }
        int _4073 = _4069;
        _354 = _4073;
        if (!_4057)
        {
            _350 = as_type<int>(_3869);
        }
        int _4075 = _350;
        _356 = _4075;
        if (_4057)
        {
            float _4077 = _3861 * _3895;
            _356 = as_type<int>(_4077);
        }
    }
    _3935 = false;
    int _4079 = _352;
    int _4081 = _354;
    int _4083 = _356;
    uint _4085 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4085)] = uint(_4079);
    uint _4087 = uint(int(uint(_3863) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4087)] = uint(_4081);
    uint _4089 = uint(int(uint(_3865) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4089)] = uint(_4083);
}

