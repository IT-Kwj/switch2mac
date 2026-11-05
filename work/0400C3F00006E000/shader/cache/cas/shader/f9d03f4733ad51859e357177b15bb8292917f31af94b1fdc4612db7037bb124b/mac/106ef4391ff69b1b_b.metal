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
    texture2d<float> cp_t_tcb_2A [[id(13)]];
    sampler cp_t_tcb_2ASmplr [[id(14)]];
    sampler cp_t_tcb_2ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _4286 = false;
    bool _3292 = false;
    bool _2588 = false;
    bool _1818 = false;
    bool _898 = false;
    float _66 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    float _70 = as_type<float>(gl_WorkGroupID.x);
    int _73 = as_type<int>(_70) << 5;
    int _75 = _73 + as_type<int>(_68);
    float _77 = trunc(_66);
    int _79 = int(_77);
    bool _83 = _75 >= _79;
    int _85 = 0;
    if (_83)
    {
        _85 = 0;
    }
    int _87 = _85;
    int _89 = _87;
    int _91 = _87;
    if (!_83)
    {
        int _93 = _75 << 4;
        int _95 = _93 + 12;
        uint _98 = uint(int(uint(_95) >> uint(2)));
        float _100 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_98)]);
        float _102 = trunc(_100);
        int _104 = int(_102);
        bool _106 = _104 >= 1;
        int _108 = _106 ? (-1) : 0;
        if (!_106)
        {
            _89 = 0;
        }
        int _110 = _89;
        bool _112 = !_106;
        _91 = _110;
        if (!_112)
        {
            float _114 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _116 = uint(int(uint(_95) >> uint(2)));
            float _118 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_116)]);
            float _120 = float(_104);
            float _122 = -_118;
            float _124 = _114 + _122;
            bool _126 = _124 > _120;
            int _128 = as_type<int>(_114);
            if (!_126)
            {
                bool _130 = _114 >= _118;
                bool _132 = isnan(_114);
                bool _134 = _130 || _132;
                bool _136 = isnan(_118);
                bool _138 = _134 || _136;
                _108 = _138 ? (-1) : 0;
            }
            int _140 = _108;
            if (_126)
            {
                _128 = 0;
            }
            int _142 = _128;
            _91 = _142;
            if (!_126)
            {
                int _144 = ~_140;
                int _146 = (_144 != 0) ? 0 : 1;
                _91 = _146;
            }
        }
    }
    int _148 = _91;
    int _150 = _148 & 1;
    bool _152 = _150 != 0;
    if (!_152)
    {
        return;
    }
    int _154 = _75 << 4;
    float _156 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[12]);
    uint _158 = uint(int(uint(_154) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_158)]);
    int _162 = _154 + 4;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_164)]);
    int _168 = _154 + 8;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_170)]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[16]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[17]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _184 = _154 + 12;
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[15]);
    uint _188 = uint(int(uint(_154) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_188)]);
    int _192 = _154 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_194)]);
    int _198 = _154 + 8;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_200)]);
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[1]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[2]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    uint _214 = uint(int(uint(_184) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_214)]);
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    uint _224 = uint(int(uint(_154) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    int _228 = _154 + 4;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    int _234 = _154 + 8;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_236)]);
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    uint _244 = uint(int(uint(_184) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_244)]);
    bool _248 = _156 != 1.0;
    bool _250 = isnan(_156);
    bool _252 = _248 || _250;
    bool _254 = isnan(1.0);
    bool _256 = _252 || _254;
    uint _258 = uint(int(uint(_154) >> uint(2)));
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_258)]);
    int _262 = _154 + 4;
    uint _264 = uint(int(uint(_262) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_264)]);
    int _268 = _154 + 8;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_270)]);
    float _274 = _256 ? _160 : 0.0;
    float _276 = _256 ? _166 : 0.3141500055789947509765625;
    float _278 = _256 ? _172 : 0.92653000354766845703125;
    float _280 = _174 * 0.00999999977648258209228515625;
    float _282 = _178 * _274;
    float _284 = _178 * _276;
    float _286 = _178 * _278;
    float _288 = _178 * _280;
    float _290 = _274;
    float _292 = _166;
    float _294 = _278;
    float _296 = _276;
    float _298 = _282;
    float _300 = _284;
    float _302 = _286;
    float _304 = _210;
    float _306 = _226;
    float _308 = _238;
    float _310 = _238;
    float _312 = _288;
    float _314 = _226;
    float _316 = _242;
    float _318 = _180;
    int _320 = as_type<int>(_190);
    int _322 = as_type<int>(_266);
    int _324 = as_type<int>(_260);
    int _326 = as_type<int>(_266);
    int _328 = as_type<int>(_272);
    int _330 = as_type<int>(_260);
    int _332 = as_type<int>(_266);
    int _334 = as_type<int>(_272);
    if (!_256)
    {
        float _336 = _176 * 0.00999999977648258209228515625;
        float _338 = _182 * _288;
        float _340 = fma(_166, 2.0, -1.0);
        float _342 = _178 * _336;
        float _344 = fma(_160, 2.0, -1.0);
        float _346 = fma(_172, 2.0, -1.0);
        float _348 = fma(_342, _340, _338);
        float _350 = fma(_342, _344, _338);
        float _352 = fma(_342, _346, _338);
        float _354 = _284 + _348;
        float _356 = _282 + _350;
        float _358 = _286 + _352;
        _290 = _342;
        _292 = _340;
        _294 = _352;
        _296 = _350;
        _298 = _356;
        _300 = _354;
        _302 = _358;
    }
    float _360 = _290;
    float _362 = _292;
    float _364 = _294;
    float _366 = _296;
    float _368 = _298;
    float _370 = _300;
    float _372 = _302;
    float _374 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[13]);
    float _376 = -_180;
    float _378 = _376 + 1.0;
    float _380 = -_212;
    float _382 = _380 + 1.0;
    float _384 = _360;
    float _386 = _362;
    float _388 = _366;
    float _390 = _364;
    if (_256)
    {
        _384 = 0.0;
    }
    float _392 = _384;
    float _394 = _392;
    if (!_256)
    {
        float _396 = _180 * _288;
        _394 = _396;
    }
    float _398 = _394;
    float _400 = _218 * _240;
    float _402 = fma(_378, _382, _212);
    float _404 = _220 * _240;
    float _406 = abs(_212);
    float _408 = log2(_406);
    bool _410 = _398 != 0.0;
    bool _412 = isnan(_398);
    bool _414 = _410 || _412;
    bool _416 = isnan(0.0);
    bool _418 = _414 || _416;
    float _420 = _222 * _240;
    bool _422 = _402 != 1.0;
    bool _424 = isnan(_402);
    bool _426 = _422 || _424;
    bool _428 = isnan(1.0);
    bool _430 = _426 || _428;
    float _432 = _180 * _404;
    int _434 = as_type<int>(_242) & 512;
    bool _436 = _434 != 0;
    bool _438 = _186 != 1.0;
    bool _440 = isnan(_186);
    bool _442 = _438 || _440;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = !_430;
    bool _450 = _446 || _448;
    float _452 = -_216;
    float _454 = _182 + _452;
    float _456 = _378;
    float _458 = _402;
    float _460 = _400;
    float _462 = _420;
    float _464 = _408;
    float _466 = _400;
    float _468 = _420;
    float _470 = _408;
    float _472 = _398;
    if (!_450)
    {
        float _474 = abs(_402);
        float _476 = log2(_474);
        _456 = _476;
    }
    float _478 = _456;
    if (!_450)
    {
        float _480 = -_402;
        float _482 = _480 + 1.0;
        _386 = _482;
    }
    float _484 = _386;
    if (_450)
    {
        _388 = _454;
    }
    float _486 = _388;
    float _488 = _486;
    if (!_450)
    {
        float _490 = 1.0 / _484;
        _390 = _490;
    }
    float _492 = _390;
    float _494 = _492;
    if (!_450)
    {
        float _496 = _454 * _478;
        _304 = _496;
    }
    float _498 = _304;
    float _500 = _180 * _408;
    float _502 = _180 * _420;
    float _504 = _498;
    if (!_450)
    {
        float _506 = exp2(_498);
        _504 = _506;
    }
    float _508 = _504;
    float _510 = exp2(_500);
    if (!_450)
    {
        float _512 = -_508;
        float _514 = _512 + 1.0;
        _458 = _514;
    }
    float _516 = _458;
    float _518 = _180 * _400;
    if (!_450)
    {
        float _520 = _516 * _492;
        _488 = _520;
    }
    float _522 = _488;
    float _524 = fma(_226, _510, _518);
    float _526 = fma(_232, _510, _432);
    float _528 = fma(_238, _510, _502);
    bool _530 = _374 != 1.0;
    bool _532 = isnan(_374);
    bool _534 = _530 || _532;
    bool _536 = isnan(1.0);
    bool _538 = _534 || _536;
    float _540 = _246 * _180;
    float _542 = _522 + _368;
    float _544 = fma(_226, _540, _190);
    float _546 = _180 + _542;
    float _548 = fma(_232, _540, _196);
    float _550 = fma(_238, _540, _202);
    float _552 = _546 + _398;
    float _554 = _542;
    float _556 = _544;
    float _558 = _548;
    float _560 = _550;
    float _640;
    float _658;
    float _660;
    float _662;
    float _756;
    float _846;
    float _860;
    float _868;
    float _870;
    float _874;
    float _878;
    float _882;
    float _886;
    float _890;
    float _892;
    float _894;
    float _896;
    if (!_418)
    {
        if (_538)
        {
            _306 = 0.60000002384185791015625;
        }
        float _562 = _306;
        float _564 = 0.0;
        if (!_538)
        {
            float _566 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _564 = _566;
        }
        float _568 = _564;
        if (_538)
        {
            _308 = 0.4199999868869781494140625;
        }
        float _570 = _308;
        if (_538)
        {
            _460 = 0.23000000417232513427734375;
        }
        float _572 = _460;
        float _574 = _176;
        if (!_538)
        {
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _574 = _576;
        }
        float _578 = _574;
        float _580 = _562;
        if (!_538)
        {
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _580 = _582;
        }
        float _584 = _580;
        if (_538)
        {
            _462 = 0.1500000059604644775390625;
        }
        float _586 = _462;
        float _588 = _570;
        if (!_538)
        {
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _588 = _590;
        }
        float _592 = _588;
        float _594 = _572;
        if (!_538)
        {
            float _596 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _594 = _596;
        }
        float _598 = _594;
        float _600 = _586;
        if (!_538)
        {
            float _602 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _600 = _602;
        }
        float _604 = _600;
        float _606 = 0.0;
        if (!_538)
        {
            float _608 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _606 = _608;
        }
        float _610 = _606;
        float _612 = 0.0;
        if (!_538)
        {
            float _614 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _612 = _614;
        }
        float _616 = _612;
        if (_538)
        {
            _464 = 0.60000002384185791015625;
        }
        float _618 = _464;
        float _620 = _552 * 6.283184051513671875;
        float _622 = _178 * _584;
        float _624 = _618;
        float _626 = _584;
        if (!_538)
        {
            _624 = _584;
        }
        float _628 = _624;
        float _630 = _628;
        if (_538)
        {
            _626 = 0.4199999868869781494140625;
        }
        float _632 = _626;
        float _634 = _178 * _592;
        float _636 = 1.0 / _622;
        float _638 = _632;
        _640 = _568;
        if (!_538)
        {
            _638 = _592;
        }
        float _642 = _638;
        float _644 = _178 * _598;
        float _646 = 1.0 / _634;
        float _648 = _178 * _604;
        float _650 = _178 * _628;
        float _652 = _178 * _642;
        float _654 = 1.0 / _644;
        float _656 = _642;
        _658 = _578;
        _660 = _610;
        _662 = _616;
        if (_538)
        {
            _656 = 0.1500000059604644775390625;
        }
        float _664 = _656;
        float _666 = _664;
        if (!_538)
        {
            _666 = _604;
        }
        float _668 = _666;
        float _670 = _636 * _620;
        if (_538)
        {
            _630 = 0.23000000417232513427734375;
        }
        float _672 = _630;
        float _674 = 1.0 / _652;
        float _676 = _672;
        if (!_538)
        {
            _676 = _598;
        }
        float _678 = _676;
        float _680 = _178 * _668;
        float _682 = _670 * 0.15915493667125701904296875;
        float _684 = 1.0 / _648;
        float _686 = _178 * _678;
        float _688 = _646 * _620;
        float _690 = 1.0 / _650;
        float _692 = _688 * 0.15915493667125701904296875;
        float _694 = _654 * _620;
        float _696 = 1.0 / _686;
        float _698 = _694 * 0.15915493667125701904296875;
        float _700 = _684 * _620;
        float _702 = _542 * _674;
        float _704 = 1.0 / _680;
        float _706 = _702 * 6.283184051513671875;
        float _708 = _700 * 0.15915493667125701904296875;
        float _710 = _542 * _690;
        float _712 = _706 * 0.15915493667125701904296875;
        float _714 = _710 * 6.283184051513671875;
        float _716 = _542 * _696;
        float _718 = _692 * 6.283185482025146484375;
        float _720 = sin(_718);
        float _722 = _714 * 0.15915493667125701904296875;
        float _724 = _716 * 6.283184051513671875;
        float _726 = _712 * 6.283185482025146484375;
        float _728 = sin(_726);
        float _730 = _542 * _704;
        float _732 = _724 * 0.15915493667125701904296875;
        float _734 = _714;
        float _736 = _724;
        float _738 = _720;
        if (_538)
        {
            _554 = 3.0;
        }
        float _740 = _554;
        float _742 = _730 * 6.283184051513671875;
        float _744 = _682 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = _740;
        if (!_538)
        {
            _748 = _568;
        }
        float _750 = _748;
        float _752 = _742 * 0.15915493667125701904296875;
        float _754 = _750;
        _756 = _752;
        if (_538)
        {
            _734 = 3.0;
        }
        float _758 = _734;
        float _760 = _722 * 6.283185482025146484375;
        float _762 = sin(_760);
        float _764 = _758;
        if (!_538)
        {
            _764 = _568;
        }
        float _766 = _764;
        float _768 = _728 * _750;
        float _770 = _766;
        if (_538)
        {
            _736 = 4.0;
        }
        float _772 = _736;
        float _774 = _698 * 6.283185482025146484375;
        float _776 = sin(_774);
        float _778 = _772;
        if (!_538)
        {
            _778 = _578;
        }
        float _780 = _778;
        float _782 = _720 * _766;
        float _784 = _732 * 6.283185482025146484375;
        float _786 = sin(_784);
        float _788 = _780;
        if (_538)
        {
            _754 = 4.0;
        }
        float _790 = _754;
        float _792 = _790;
        if (!_538)
        {
            _792 = _578;
        }
        float _794 = _792;
        float _796 = _708 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = fma(_746, _780, _782);
        float _802 = _746;
        float _804 = _800;
        if (_538)
        {
            _738 = 2.0;
        }
        float _806 = _738;
        float _808 = _752 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806;
        if (_538)
        {
            _788 = 2.0;
        }
        float _814 = _788;
        float _816 = fma(_762, _794, _768);
        float _818 = _814;
        if (!_538)
        {
            _812 = _610;
        }
        float _820 = _812;
        float _822 = _820;
        if (!_538)
        {
            _818 = _610;
        }
        float _824 = _818;
        float _826 = _824;
        if (_538)
        {
            _802 = 1.5;
        }
        float _828 = _802;
        float _830 = _828;
        if (_538)
        {
            _770 = 1.5;
        }
        float _832 = _770;
        float _834 = fma(_776, _820, _800);
        float _836 = _832;
        float _838 = _834;
        if (!_538)
        {
            _830 = _616;
        }
        float _840 = _830;
        float _842 = fma(_786, _824, _816);
        float _844 = _840;
        _846 = _842;
        if (!_538)
        {
            _836 = _616;
        }
        float _848 = _836;
        float _850 = fma(_798, _840, _834);
        float _852 = fma(_810, _848, _842);
        float _854 = _852;
        float _856 = _850;
        if (_538)
        {
            _822 = 1.5;
        }
        float _858 = _822;
        _860 = _858;
        if (_538)
        {
            _844 = 2.0;
        }
        float _862 = _844;
        float _864 = -_852;
        float _866 = _850 + _864;
        _868 = _862;
        _870 = _866;
        if (_538)
        {
            _854 = 3.0;
        }
        float _872 = _854;
        _874 = _872;
        if (_538)
        {
            _826 = 4.0;
        }
        float _876 = _826;
        _878 = _876;
        if (_538)
        {
            _804 = 0.1500000059604644775390625;
        }
        float _880 = _804;
        _882 = _880;
        if (_538)
        {
            _838 = 0.23000000417232513427734375;
        }
        float _884 = _838;
        _886 = _884;
        if (_538)
        {
            _856 = 0.4199999868869781494140625;
        }
        float _888 = _856;
        _890 = _888;
        _892 = 0.0;
        _894 = 0.0;
        _896 = 0.0;
        _898 = true;
    }
    else
    {
        if (_538)
        {
            _310 = 0.4199999868869781494140625;
        }
        float _900 = _310;
        float _902 = 0.0;
        if (!_538)
        {
            float _904 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _902 = _904;
        }
        float _906 = _902;
        if (_538)
        {
            _466 = 0.60000002384185791015625;
        }
        float _908 = _466;
        if (_538)
        {
            _468 = 0.23000000417232513427734375;
        }
        float _910 = _468;
        float _912 = _176;
        if (!_538)
        {
            float _914 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _912 = _914;
        }
        float _916 = _912;
        float _918 = _900;
        if (!_538)
        {
            float _920 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _918 = _920;
        }
        float _922 = _918;
        float _924 = _908;
        if (!_538)
        {
            float _926 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _924 = _926;
        }
        float _928 = _924;
        float _930 = _910;
        if (!_538)
        {
            float _932 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _930 = _932;
        }
        float _934 = _930;
        if (_538)
        {
            _312 = 0.1500000059604644775390625;
        }
        float _936 = _312;
        float _938 = 0.0;
        if (!_538)
        {
            float _940 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _938 = _940;
        }
        float _942 = _938;
        float _944 = _936;
        if (!_538)
        {
            float _946 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _944 = _946;
        }
        float _948 = _944;
        float _950 = 0.0;
        if (!_538)
        {
            float _952 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _950 = _952;
        }
        float _954 = _950;
        if (_538)
        {
            _470 = 0.4199999868869781494140625;
        }
        float _956 = _470;
        float _958 = _956;
        if (_538)
        {
            _314 = 0.4199999868869781494140625;
        }
        float _960 = _314;
        float _962 = _552 * 6.283184051513671875;
        float _964 = _960;
        float _966 = _922;
        if (!_538)
        {
            _958 = _922;
        }
        float _968 = _958;
        float _970 = _178 * _922;
        float _972 = _178 * _968;
        float _974 = _968;
        if (_538)
        {
            _974 = 0.4199999868869781494140625;
        }
        float _976 = _974;
        float _978 = _976;
        if (!_538)
        {
            _978 = _922;
        }
        float _980 = _978;
        float _982 = _980;
        if (!_538)
        {
            _964 = _922;
        }
        float _984 = _964;
        float _986 = 1.0 / _970;
        float _988 = _178 * _980;
        float _990 = _984;
        if (_538)
        {
            _982 = 0.60000002384185791015625;
        }
        float _992 = _982;
        float _994 = _992;
        _640 = _906;
        _660 = _942;
        if (!_538)
        {
            _994 = _928;
        }
        float _996 = _994;
        float _998 = _178 * _934;
        float _1000 = _178 * _984;
        float _1002 = _996;
        if (_538)
        {
            _990 = 0.60000002384185791015625;
        }
        float _1004 = _990;
        float _1006 = _1004;
        if (!_538)
        {
            _1006 = _928;
        }
        float _1008 = _1006;
        float _1010 = _178 * _928;
        float _1012 = _1008;
        if (_538)
        {
            _966 = 0.60000002384185791015625;
        }
        float _1014 = _966;
        float _1016 = _1014;
        if (!_538)
        {
            _1016 = _928;
        }
        float _1018 = _1016;
        float _1020 = _178 * _996;
        float _1022 = 1.0 / _998;
        float _1024 = _1018;
        if (_538)
        {
            _1002 = 0.23000000417232513427734375;
        }
        float _1026 = _1002;
        float _1028 = _1026;
        if (!_538)
        {
            _1028 = _934;
        }
        float _1030 = _1028;
        float _1032 = _178 * _1008;
        float _1034 = 1.0 / _1010;
        float _1036 = _178 * _948;
        float _1038 = _1030;
        if (_538)
        {
            _1012 = 0.23000000417232513427734375;
        }
        float _1040 = _1012;
        float _1042 = 1.0 / _972;
        float _1044 = _178 * _1018;
        float _1046 = _1040;
        if (!_538)
        {
            _1046 = _934;
        }
        float _1048 = _1046;
        float _1050 = 1.0 / _1032;
        float _1052 = _1048;
        if (_538)
        {
            _1024 = 0.23000000417232513427734375;
        }
        float _1054 = _1024;
        float _1056 = _1054;
        if (!_538)
        {
            _1056 = _934;
        }
        float _1058 = _1056;
        float _1060 = _178 * _1030;
        float _1062 = _1058;
        if (_538)
        {
            _1038 = 0.1500000059604644775390625;
        }
        float _1064 = _1038;
        float _1066 = _1064;
        if (!_538)
        {
            _1066 = _948;
        }
        float _1068 = _1066;
        float _1070 = 1.0 / _1036;
        float _1072 = 1.0 / _1044;
        float _1074 = _178 * _1068;
        float _1076 = _986 * _962;
        float _1078 = 1.0 / _1000;
        float _1080 = _178 * _1048;
        if (_538)
        {
            _1052 = 0.1500000059604644775390625;
        }
        float _1082 = _1052;
        float _1084 = _1082;
        if (!_538)
        {
            _1084 = _948;
        }
        float _1086 = _1084;
        float _1088 = 1.0 / _1060;
        float _1090 = _178 * _1058;
        float _1092 = _1076 * 0.15915493667125701904296875;
        float _1094 = _1034 * _962;
        float _1096 = 1.0 / _988;
        float _1098 = 1.0 / _1090;
        if (_538)
        {
            _1062 = 0.1500000059604644775390625;
        }
        float _1100 = _1062;
        float _1102 = _178 * _1086;
        float _1104 = _1094 * 0.15915493667125701904296875;
        float _1106 = _1022 * _962;
        float _1108 = 1.0 / _1080;
        float _1110 = _1100;
        if (!_538)
        {
            _1110 = _948;
        }
        float _1112 = _1110;
        float _1114 = 1.0 / _1020;
        float _1116 = _368 + _398;
        float _1118 = _178 * _1112;
        float _1120 = _1106 * 0.15915493667125701904296875;
        float _1122 = _1070 * _962;
        float _1124 = _1116 * 6.283184051513671875;
        float _1126 = _368 * 6.283184051513671875;
        float _1128 = _1122 * 0.15915493667125701904296875;
        float _1130 = _1078 * _1124;
        float _1132 = _1096 * _1126;
        float _1134 = 1.0 / _1074;
        float _1136 = _1132 * 0.15915493667125701904296875;
        float _1138 = _1050 * _1124;
        float _1140 = _1130 * 0.15915493667125701904296875;
        float _1142 = _542 * _1042;
        float _1144 = 1.0 / _1118;
        float _1146 = _1138 * 0.15915493667125701904296875;
        float _1148 = _1142 * 6.283184051513671875;
        float _1150 = _1092 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1114 * _1126;
        float _1156 = _1148 * 0.15915493667125701904296875;
        float _1158 = _1108 * _1124;
        float _1160 = _1154 * 0.15915493667125701904296875;
        float _1162 = 1.0 / _1102;
        float _1164 = _1154;
        float _1166 = _1158;
        float _1168 = _1128;
        _658 = _916;
        _662 = _954;
        _896 = _1156;
        if (_538)
        {
            _1164 = 3.0;
        }
        float _1170 = _1164;
        float _1172 = _1170;
        if (!_538)
        {
            _1172 = _906;
        }
        float _1174 = _1172;
        float _1176 = _1140 * 6.283185482025146484375;
        float _1178 = sin(_1176);
        float _1180 = _1136 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = _1158 * 0.15915493667125701904296875;
        float _1186 = _1152 * _1174;
        float _1188 = _1156 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = _1174;
        if (_538)
        {
            _1166 = 3.0;
        }
        float _1194 = _1166;
        float _1196 = _1088 * _1126;
        float _1198 = _1194;
        if (_538)
        {
            _1192 = 3.0;
        }
        float _1200 = _1192;
        float _1202 = _1146 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        float _1206 = _1200;
        if (!_538)
        {
            _1198 = _906;
        }
        float _1208 = _1198;
        float _1210 = _1208;
        if (!_538)
        {
            _1206 = _906;
        }
        float _1212 = _1206;
        float _1214 = _1196 * 0.15915493667125701904296875;
        float _1216 = _1104 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = _1162 * _1124;
        float _1222 = _1178 * _1208;
        float _1224 = _1182 * _1212;
        float _1226 = _1128 * 6.283185482025146484375;
        float _1228 = sin(_1226);
        float _1230 = _542 * _1072;
        float _1232 = _1230;
        _890 = _1228;
        _756 = _1222;
        if (_538)
        {
            _1210 = 4.0;
        }
        float _1234 = _1210;
        float _1236 = _1234;
        if (!_538)
        {
            _1236 = _916;
        }
        float _1238 = _1236;
        if (_538)
        {
            _1168 = 3.0;
        }
        float _1240 = _1168;
        float _1242 = _1240;
        if (!_538)
        {
            _1242 = _906;
        }
        float _1244 = _1242;
        float _1246 = _1160 * 6.283185482025146484375;
        float _1248 = sin(_1246);
        float _1250 = _1220 * 0.15915493667125701904296875;
        float _1252 = _1230 * 6.283184051513671875;
        float _1254 = _1190 * _1244;
        float _1256 = _1244;
        if (_538)
        {
            _1256 = 4.0;
        }
        float _1258 = _1256;
        float _1260 = _1258;
        if (!_538)
        {
            _1260 = _916;
        }
        float _1262 = _1260;
        float _1264 = fma(_1204, _1238, _1222);
        float _1266 = _542 * _1098;
        float _1268 = _1252 * 0.15915493667125701904296875;
        float _1270 = _1134 * _1126;
        float _1272 = fma(_1218, _1262, _1186);
        float _1274 = _542 * _1144;
        float _1276 = _1266;
        float _1278 = _1262;
        float _1280 = _1272;
        if (_538)
        {
            _1232 = 4.0;
        }
        float _1282 = _1232;
        float _1284 = _1266 * 6.283184051513671875;
        float _1286 = _1282;
        float _1288 = _1284;
        if (!_538)
        {
            _1286 = _916;
        }
        float _1290 = _1286;
        float _1292 = _1268 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        float _1296 = _1270 * 0.15915493667125701904296875;
        float _1298 = _1284 * 0.15915493667125701904296875;
        float _1300 = _1274 * 6.283184051513671875;
        float _1302 = fma(_1248, _1290, _1224);
        float _1304 = _1184 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = _1290;
        float _1310 = _1300;
        if (_538)
        {
            _1276 = 4.0;
        }
        float _1312 = _1276;
        float _1314 = _1214 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1312;
        if (!_538)
        {
            _1318 = _916;
        }
        float _1320 = _1318;
        float _1322 = _1120 * 6.283185482025146484375;
        float _1324 = sin(_1322);
        float _1326 = _1296 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1320;
        if (_538)
        {
            _1308 = 2.0;
        }
        float _1332 = _1308;
        float _1334 = _1300 * 0.15915493667125701904296875;
        float _1336 = _1298 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        float _1340 = _1332;
        if (_538)
        {
            _1288 = 2.0;
        }
        float _1342 = _1288;
        float _1344 = _1342;
        if (_538)
        {
            _1278 = 2.0;
        }
        float _1346 = _1278;
        float _1348 = _1250 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        float _1352 = _1346;
        if (!_538)
        {
            _1340 = _942;
        }
        float _1354 = _1340;
        float _1356 = _1354;
        if (!_538)
        {
            _1344 = _942;
        }
        float _1358 = _1344;
        float _1360 = _1334 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1358;
        if (!_538)
        {
            _1352 = _942;
        }
        float _1366 = _1352;
        float _1368 = fma(_1294, _1320, _1254);
        float _1370 = _1366;
        _846 = _1368;
        if (_538)
        {
            _1330 = 2.0;
        }
        float _1372 = _1330;
        float _1374 = fma(_1306, _1354, _1264);
        float _1376 = _1372;
        _494 = _1306;
        if (!_538)
        {
            _1376 = _942;
        }
        float _1378 = _1376;
        float _1380 = fma(_1316, _1358, _1302);
        float _1382 = fma(_1324, _1366, _1272);
        float _1384 = _1378;
        _894 = _1380;
        if (_538)
        {
            _1356 = 1.5;
        }
        float _1386 = _1356;
        float _1388 = _1386;
        if (_538)
        {
            _1364 = 1.5;
        }
        float _1390 = _1364;
        float _1392 = _1390;
        if (_538)
        {
            _1310 = 1.5;
        }
        float _1394 = _1310;
        float _1396 = _1394;
        if (_538)
        {
            _1370 = 1.5;
        }
        float _1398 = _1370;
        float _1400 = _1398;
        if (!_538)
        {
            _1388 = _954;
        }
        float _1402 = _1388;
        if (!_538)
        {
            _1392 = _954;
        }
        float _1404 = _1392;
        float _1406 = fma(_1338, _1378, _1368);
        float _1408 = _1362;
        _892 = _1350;
        if (!_538)
        {
            _1396 = _954;
        }
        float _1410 = _1396;
        if (!_538)
        {
            _1400 = _954;
        }
        float _1412 = _1400;
        float _1414 = fma(_1350, _1402, _1374);
        float _1416 = fma(_1328, _1404, _1380);
        float _1418 = fma(_1228, _1410, _1382);
        float _1420 = fma(_1362, _1412, _1406);
        float _1422 = -_1414;
        float _1424 = _1422 + _1416;
        float _1426 = -_1420;
        float _1428 = _1418 + _1426;
        float _1430 = _1420;
        float _1432 = _1418;
        float _1434 = _1428;
        if (_538)
        {
            _1430 = 1.5;
        }
        float _1436 = _1430;
        _860 = _1436;
        if (_538)
        {
            _1432 = 2.0;
        }
        float _1438 = _1432;
        float _1440 = _1428 + _1424;
        _868 = _1438;
        _870 = _1440;
        if (_538)
        {
            _1384 = 3.0;
        }
        float _1442 = _1384;
        _874 = _1442;
        if (_538)
        {
            _1434 = 4.0;
        }
        float _1444 = _1434;
        _878 = _1444;
        if (_538)
        {
            _1280 = 0.1500000059604644775390625;
        }
        float _1446 = _1280;
        _882 = _1446;
        if (_538)
        {
            _1408 = 0.23000000417232513427734375;
        }
        float _1448 = _1408;
        _886 = _1448;
        if (_538)
        {
            _890 = 0.4199999868869781494140625;
        }
    }
    _898 = false;
    float _1450 = _890;
    float _1452 = _886;
    float _1454 = _846;
    float _1456 = _882;
    float _1458 = _494;
    float _1460 = _892;
    float _1462 = _894;
    float _1464 = _756;
    float _1466 = _878;
    float _1468 = _874;
    float _1470 = _640;
    float _1472 = _658;
    float _1474 = _868;
    float _1476 = _660;
    float _1478 = _860;
    float _1480 = _662;
    float _1482 = _896;
    float _1484 = _870;
    float _1486 = _522 + _370;
    float _1488 = _180 + _1486;
    float _1490 = _1488 + _398;
    float _1492 = _1454;
    float _1494 = _1458;
    float _1496 = _1460;
    float _1498 = _1462;
    float _1500 = _1464;
    float _1502 = _1486;
    float _1504 = _1458;
    float _1506 = _1460;
    float _1508 = _1482;
    float _1510 = _1462;
    float _1512 = _1454;
    float _1514 = _1464;
    float _1516 = _1486;
    float _1518 = _1450;
    float _1520 = _1452;
    float _1522 = _1456;
    float _1524 = _1474;
    float _1526 = _1468;
    float _1528 = _1466;
    float _1530 = _1478;
    float _1532 = _1450;
    float _1534 = _1452;
    float _1536 = _1456;
    float _1538 = _1474;
    float _1540 = _1478;
    float _1542 = _1468;
    float _1544 = _1466;
    float _1546 = _1472;
    float _1548 = _1470;
    float _1550 = _1480;
    float _1552 = _1484;
    float _1760;
    float _1762;
    float _1776;
    float _1794;
    float _1812;
    float _1814;
    float _1816;
    if (!_418)
    {
        if (_538)
        {
            _1492 = _1450;
        }
        float _1554 = _1492;
        if (_538)
        {
            _1494 = 0.60000002384185791015625;
        }
        float _1556 = _1494;
        if (_538)
        {
            _1496 = _1452;
        }
        float _1558 = _1496;
        float _1560 = _1554;
        if (!_538)
        {
            float _1562 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1560 = _1562;
        }
        float _1564 = _1560;
        if (_538)
        {
            _1498 = _1456;
        }
        float _1566 = _1498;
        float _1568 = _1556;
        if (!_538)
        {
            float _1570 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1568 = _1570;
        }
        float _1572 = _1568;
        float _1574 = _1558;
        if (!_538)
        {
            float _1576 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1574 = _1576;
        }
        float _1578 = _1574;
        float _1580 = _1566;
        if (!_538)
        {
            float _1582 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1580 = _1582;
        }
        float _1584 = _1580;
        if (_538)
        {
            _1500 = _1450;
        }
        float _1586 = _1500;
        float _1588 = _1490 * 6.283184051513671875;
        float _1590 = _178 * _1564;
        float _1592 = _1586;
        float _1594 = _1564;
        if (!_538)
        {
            _1592 = _1564;
        }
        float _1596 = _1592;
        float _1598 = _1596;
        if (_538)
        {
            _1594 = 0.60000002384185791015625;
        }
        float _1600 = _1594;
        float _1602 = 1.0 / _1590;
        float _1604 = _178 * _1572;
        float _1606 = _1600;
        if (!_538)
        {
            _1606 = _1572;
        }
        float _1608 = _1606;
        float _1610 = _178 * _1596;
        float _1612 = _178 * _1578;
        float _1614 = _1608;
        if (_538)
        {
            _1598 = _1452;
        }
        float _1616 = _1598;
        float _1618 = _1616;
        if (!_538)
        {
            _1618 = _1578;
        }
        float _1620 = _1618;
        float _1622 = 1.0 / _1604;
        float _1624 = _178 * _1584;
        float _1626 = _178 * _1608;
        if (_538)
        {
            _1614 = _1456;
        }
        float _1628 = _1614;
        float _1630 = _178 * _1620;
        float _1632 = _1628;
        if (!_538)
        {
            _1632 = _1584;
        }
        float _1634 = _1632;
        float _1636 = 1.0 / _1612;
        float _1638 = _1602 * _1588;
        float _1640 = _178 * _1634;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = 1.0 / _1610;
        float _1646 = _1622 * _1588;
        float _1648 = _1646 * 0.15915493667125701904296875;
        float _1650 = 1.0 / _1624;
        float _1652 = _1636 * _1588;
        float _1654 = _1652 * 0.15915493667125701904296875;
        float _1656 = 1.0 / _1626;
        float _1658 = 1.0 / _1630;
        float _1660 = _1486 * _1644;
        float _1662 = _1650 * _1588;
        float _1664 = _1660 * 6.283184051513671875;
        float _1666 = 1.0 / _1640;
        float _1668 = _1664 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = sin(_1670);
        float _1674 = _1662 * 0.15915493667125701904296875;
        float _1676 = _1486 * _1656;
        float _1678 = _1676 * 6.283184051513671875;
        float _1680 = _1486 * _1658;
        float _1682 = _1642 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1486 * _1666;
        float _1688 = _1680;
        float _1690 = _1678;
        if (_538)
        {
            _1502 = _1466;
        }
        float _1692 = _1502;
        float _1694 = _1680 * 6.283184051513671875;
        float _1696 = _1692;
        if (_538)
        {
            _1688 = _1468;
        }
        float _1698 = _1688;
        float _1700 = _1698;
        if (!_538)
        {
            _1700 = _1470;
        }
        float _1702 = _1700;
        float _1704 = _1694 * 0.15915493667125701904296875;
        float _1706 = _1648 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        float _1710 = _1686 * 6.283184051513671875;
        float _1712 = _1702;
        if (!_538)
        {
            _1696 = _1472;
        }
        float _1714 = _1696;
        float _1716 = _1672 * _1702;
        float _1718 = _1714;
        if (_538)
        {
            _1712 = _1466;
        }
        float _1720 = _1712;
        float _1722 = _1710 * 0.15915493667125701904296875;
        float _1724 = _1720;
        if (!_538)
        {
            _1724 = _1472;
        }
        float _1726 = _1724;
        float _1728 = _1654 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1678 * 0.15915493667125701904296875;
        if (_538)
        {
            _1690 = _1468;
        }
        float _1734 = _1690;
        float _1736 = _1734;
        if (!_538)
        {
            _1736 = _1470;
        }
        float _1738 = _1736;
        float _1740 = _1732 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = _1684 * _1738;
        float _1746 = _1684;
        float _1748 = _1738;
        if (_538)
        {
            _1746 = _1474;
        }
        float _1750 = _1746;
        float _1752 = _1750;
        if (!_538)
        {
            _1752 = _1476;
        }
        float _1754 = _1752;
        float _1756 = fma(_1708, _1714, _1744);
        float _1758 = _1708;
        _1760 = _1754;
        _1762 = _1756;
        if (_538)
        {
            _1718 = _1474;
        }
        float _1764 = _1718;
        float _1766 = _1704 * 6.283185482025146484375;
        float _1768 = sin(_1766);
        float _1770 = _1764;
        if (!_538)
        {
            _1770 = _1476;
        }
        float _1772 = _1770;
        float _1774 = fma(_1730, _1754, _1756);
        _1776 = _1772;
        if (_538)
        {
            _1758 = _1478;
        }
        float _1778 = _1758;
        float _1780 = _1778;
        if (_538)
        {
            _1748 = _1478;
        }
        float _1782 = _1748;
        float _1784 = _1782;
        if (!_538)
        {
            _1780 = _1480;
        }
        float _1786 = _1780;
        float _1788 = _1674 * 6.283185482025146484375;
        float _1790 = sin(_1788);
        float _1792 = fma(_1742, _1726, _1716);
        _1794 = _1792;
        if (!_538)
        {
            _1784 = _1480;
        }
        float _1796 = _1784;
        float _1798 = _1722 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = fma(_1768, _1772, _1792);
        float _1804 = fma(_1790, _1786, _1774);
        float _1806 = fma(_1800, _1796, _1802);
        float _1808 = -_1806;
        float _1810 = _1804 + _1808;
        _1812 = _1806;
        _1814 = _1790;
        _1816 = _1810;
        _1818 = true;
    }
    else
    {
        if (_538)
        {
            _1504 = _1450;
        }
        float _1820 = _1504;
        if (_538)
        {
            _1506 = 0.60000002384185791015625;
        }
        float _1822 = _1506;
        float _1824 = _1820;
        if (!_538)
        {
            float _1826 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1824 = _1826;
        }
        float _1828 = _1824;
        if (_538)
        {
            _1508 = _1456;
        }
        float _1830 = _1508;
        if (_538)
        {
            _1510 = _1452;
        }
        float _1832 = _1510;
        float _1834 = _1822;
        if (!_538)
        {
            float _1836 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1834 = _1836;
        }
        float _1838 = _1834;
        float _1840 = _1830;
        if (!_538)
        {
            float _1842 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1840 = _1842;
        }
        float _1844 = _1840;
        float _1846 = _1832;
        if (!_538)
        {
            float _1848 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1846 = _1848;
        }
        float _1850 = _1846;
        if (_538)
        {
            _1512 = _1450;
        }
        float _1852 = _1512;
        float _1854 = _1852;
        if (_538)
        {
            _1514 = _1450;
        }
        float _1856 = _1514;
        float _1858 = _1490 * 6.283184051513671875;
        float _1860 = _370 * 6.283184051513671875;
        float _1862 = _1856;
        float _1864 = _1828;
        if (!_538)
        {
            _1854 = _1828;
        }
        float _1866 = _1854;
        float _1868 = _178 * _1828;
        float _1870 = _178 * _1866;
        float _1872 = _1866;
        if (_538)
        {
            _1872 = _1450;
        }
        float _1874 = _1872;
        float _1876 = _1874;
        if (!_538)
        {
            _1876 = _1828;
        }
        float _1878 = _1876;
        float _1880 = _1878;
        if (!_538)
        {
            _1862 = _1828;
        }
        float _1882 = _1862;
        float _1884 = 1.0 / _1868;
        float _1886 = _178 * _1878;
        float _1888 = _1882;
        if (_538)
        {
            _1880 = 0.60000002384185791015625;
        }
        float _1890 = _1880;
        float _1892 = _178 * _1844;
        float _1894 = _1890;
        if (!_538)
        {
            _1894 = _1838;
        }
        float _1896 = _1894;
        float _1898 = _178 * _1850;
        float _1900 = _178 * _1882;
        float _1902 = _1896;
        if (_538)
        {
            _1888 = 0.60000002384185791015625;
        }
        float _1904 = _1888;
        float _1906 = _1904;
        if (!_538)
        {
            _1906 = _1838;
        }
        float _1908 = _1906;
        float _1910 = _178 * _1838;
        float _1912 = _1908;
        if (_538)
        {
            _1864 = 0.60000002384185791015625;
        }
        float _1914 = _1864;
        float _1916 = 1.0 / _1892;
        float _1918 = _1914;
        if (!_538)
        {
            _1918 = _1838;
        }
        float _1920 = _1918;
        float _1922 = 1.0 / _1898;
        float _1924 = _178 * _1896;
        float _1926 = _1920;
        if (_538)
        {
            _1902 = _1452;
        }
        float _1928 = _1902;
        float _1930 = _1928;
        if (!_538)
        {
            _1930 = _1850;
        }
        float _1932 = _1930;
        float _1934 = 1.0 / _1910;
        float _1936 = _178 * _1908;
        float _1938 = _1932;
        if (_538)
        {
            _1912 = _1452;
        }
        float _1940 = _1912;
        float _1942 = _1940;
        if (!_538)
        {
            _1942 = _1850;
        }
        float _1944 = _1942;
        float _1946 = _178 * _1920;
        float _1948 = _1944;
        if (_538)
        {
            _1926 = _1452;
        }
        float _1950 = _1926;
        float _1952 = _1950;
        if (!_538)
        {
            _1952 = _1850;
        }
        float _1954 = _1952;
        float _1956 = _178 * _1932;
        float _1958 = _1954;
        if (_538)
        {
            _1938 = _1456;
        }
        float _1960 = _1938;
        float _1962 = _178 * _1944;
        float _1964 = _1960;
        if (!_538)
        {
            _1964 = _1844;
        }
        float _1966 = _1964;
        float _1968 = 1.0 / _1962;
        if (_538)
        {
            _1948 = _1456;
        }
        float _1970 = _1948;
        float _1972 = _1970;
        if (!_538)
        {
            _1972 = _1844;
        }
        float _1974 = _1972;
        float _1976 = _178 * _1966;
        float _1978 = _1884 * _1858;
        float _1980 = 1.0 / _1900;
        float _1982 = 1.0 / _1956;
        float _1984 = _178 * _1954;
        if (_538)
        {
            _1958 = _1456;
        }
        float _1986 = _1958;
        float _1988 = 1.0 / _1946;
        float _1990 = _1978 * 0.15915493667125701904296875;
        float _1992 = _1934 * _1858;
        float _1994 = _1986;
        if (!_538)
        {
            _1994 = _1844;
        }
        float _1996 = _1994;
        float _1998 = 1.0 / _1886;
        float _2000 = 1.0 / _1984;
        float _2002 = _178 * _1974;
        float _2004 = 1.0 / _1870;
        float _2006 = _1992 * 0.15915493667125701904296875;
        float _2008 = _1922 * _1858;
        float _2010 = 1.0 / _1936;
        float _2012 = _2008 * 0.15915493667125701904296875;
        float _2014 = _1916 * _1858;
        float _2016 = 1.0 / _2002;
        float _2018 = _370 + _398;
        float _2020 = 1.0 / _1924;
        float _2022 = _2018 * 6.283184051513671875;
        float _2024 = _178 * _1996;
        float _2026 = 1.0 / _1976;
        float _2028 = _1998 * _1860;
        float _2030 = _2014 * 0.15915493667125701904296875;
        float _2032 = _1980 * _2022;
        float _2034 = 1.0 / _2024;
        float _2036 = _2028 * 0.15915493667125701904296875;
        float _2038 = _2032 * 0.15915493667125701904296875;
        float _2040 = _1486 * _2004;
        float _2042 = _2010 * _2022;
        float _2044 = _1990 * 6.283185482025146484375;
        float _2046 = sin(_2044);
        float _2048 = _2040 * 6.283184051513671875;
        float _2050 = _2042 * 0.15915493667125701904296875;
        float _2052 = _2020 * _1860;
        float _2054 = _2036 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2048 * 0.15915493667125701904296875;
        float _2060 = _2052 * 0.15915493667125701904296875;
        float _2062 = _2052;
        float _2064 = _2018;
        if (_538)
        {
            _2062 = _1468;
        }
        float _2066 = _2062;
        float _2068 = _2066;
        if (!_538)
        {
            _2068 = _1470;
        }
        float _2070 = _2068;
        float _2072 = _2038 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = _1968 * _2022;
        float _2078 = _2046 * _2070;
        float _2080 = _2070;
        float _2082 = _2076;
        if (_538)
        {
            _2080 = _1468;
        }
        float _2084 = _2080;
        float _2086 = _2058 * 6.283185482025146484375;
        float _2088 = sin(_2086);
        float _2090 = _1982 * _1860;
        float _2092 = _2084;
        if (!_538)
        {
            _2092 = _1470;
        }
        float _2094 = _2092;
        float _2096 = _2076 * 0.15915493667125701904296875;
        if (_538)
        {
            _2082 = _1468;
        }
        float _2098 = _2082;
        float _2100 = _2090 * 0.15915493667125701904296875;
        float _2102 = _2006 * 6.283185482025146484375;
        float _2104 = sin(_2102);
        float _2106 = _2098;
        if (_538)
        {
            _2064 = _1468;
        }
        float _2108 = _2064;
        float _2110 = _2016 * _2022;
        float _2112 = _2108;
        if (!_538)
        {
            _2106 = _1470;
        }
        float _2114 = _2106;
        float _2116 = _2056 * _2094;
        float _2118 = _2060 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = _2114;
        if (!_538)
        {
            _2112 = _1470;
        }
        float _2124 = _2112;
        float _2126 = _1486 * _1988;
        float _2128 = _2074 * _2114;
        float _2130 = _2110 * 0.15915493667125701904296875;
        float _2132 = _2088 * _2124;
        float _2134 = _2126 * 6.283184051513671875;
        float _2136 = _2124;
        float _2138 = _2126;
        if (_538)
        {
            _2136 = _1466;
        }
        float _2140 = _2136;
        float _2142 = _2140;
        if (_538)
        {
            _2138 = _1466;
        }
        float _2144 = _2138;
        float _2146 = _2144;
        if (!_538)
        {
            _2142 = _1472;
        }
        float _2148 = _2142;
        if (!_538)
        {
            _2146 = _1472;
        }
        float _2150 = _2146;
        float _2152 = _1486 * _2000;
        float _2154 = _2134 * 0.15915493667125701904296875;
        float _2156 = _2026 * _1860;
        float _2158 = fma(_2104, _2148, _2078);
        float _2160 = fma(_2120, _2150, _2116);
        float _2162 = _2050 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = _1486 * _2034;
        float _2168 = _2152 * 6.283184051513671875;
        float _2170 = _2156 * 0.15915493667125701904296875;
        float _2172 = _2166 * 6.283184051513671875;
        float _2174 = _2168 * 0.15915493667125701904296875;
        float _2176 = _2154 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        float _2180 = _2152;
        float _2182 = _2168;
        float _2184 = _2172;
        _1762 = _2158;
        if (_538)
        {
            _2122 = _1466;
        }
        float _2186 = _2122;
        float _2188 = _2186;
        if (!_538)
        {
            _2188 = _1472;
        }
        float _2190 = _2188;
        float _2192 = _2012 * 6.283185482025146484375;
        float _2194 = sin(_2192);
        float _2196 = _2190;
        if (_538)
        {
            _2180 = _1466;
        }
        float _2198 = _2180;
        float _2200 = _2096 * 6.283185482025146484375;
        float _2202 = sin(_2200);
        float _2204 = _2198;
        if (!_538)
        {
            _2204 = _1472;
        }
        float _2206 = _2204;
        float _2208 = _2100 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = _2170 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = fma(_2164, _2190, _2128);
        float _2218 = _2172 * 0.15915493667125701904296875;
        float _2220 = _2174 * 6.283185482025146484375;
        float _2222 = sin(_2220);
        float _2224 = _2206;
        _1814 = _2178;
        if (_538)
        {
            _2196 = _1474;
        }
        float _2226 = _2196;
        float _2228 = _2226;
        if (_538)
        {
            _1516 = _1474;
        }
        float _2230 = _1516;
        float _2232 = _2230;
        if (_538)
        {
            _2182 = _1474;
        }
        float _2234 = _2182;
        float _2236 = _2030 * 6.283185482025146484375;
        float _2238 = sin(_2236);
        float _2240 = _2234;
        if (!_538)
        {
            _2228 = _1476;
        }
        float _2242 = _2228;
        float _2244 = fma(_2178, _2206, _2132);
        float _2246 = _2242;
        if (!_538)
        {
            _2232 = _1476;
        }
        float _2248 = _2232;
        float _2250 = _2130 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2248;
        if (!_538)
        {
            _2240 = _1476;
        }
        float _2256 = _2240;
        float _2258 = _2218 * 6.283185482025146484375;
        float _2260 = sin(_2258);
        float _2262 = _2256;
        if (_538)
        {
            _2224 = _1474;
        }
        float _2264 = _2224;
        float _2266 = _2264;
        if (!_538)
        {
            _2266 = _1476;
        }
        float _2268 = _2266;
        float _2270 = fma(_2194, _2242, _2158);
        float _2272 = fma(_2202, _2248, _2216);
        float _2274 = fma(_2210, _2256, _2160);
        if (_538)
        {
            _2184 = _1478;
        }
        float _2276 = _2184;
        float _2278 = _2276;
        if (_538)
        {
            _2246 = _1478;
        }
        float _2280 = _2246;
        float _2282 = _2280;
        if (_538)
        {
            _2254 = _1478;
        }
        float _2284 = _2254;
        float _2286 = _2284;
        if (_538)
        {
            _2262 = _1478;
        }
        float _2288 = _2262;
        float _2290 = fma(_2222, _2268, _2244);
        float _2292 = _2288;
        if (!_538)
        {
            _2278 = _1480;
        }
        float _2294 = _2278;
        if (!_538)
        {
            _2286 = _1480;
        }
        float _2296 = _2286;
        _1776 = _2296;
        if (!_538)
        {
            _2292 = _1480;
        }
        float _2298 = _2292;
        if (!_538)
        {
            _2282 = _1480;
        }
        float _2300 = _2282;
        float _2302 = fma(_2238, _2294, _2270);
        float _2304 = fma(_2252, _2296, _2272);
        float _2306 = fma(_2214, _2298, _2274);
        float _2308 = fma(_2260, _2300, _2290);
        float _2310 = -_2304;
        float _2312 = _2310 + _2306;
        float _2314 = -_2308;
        float _2316 = _2302 + _2314;
        float _2318 = _2316 + _2312;
        _1760 = _2300;
        _1812 = _2308;
        _1794 = _2238;
        _1816 = _2318;
    }
    _1818 = false;
    float _2320 = _1776;
    float _2322 = _1760;
    float _2324 = _1762;
    float _2326 = _1812;
    float _2328 = _1794;
    float _2330 = _1814;
    float _2332 = _1816;
    float _2334 = _522 + _372;
    float _2336 = _180 + _2334;
    float _2338 = _2336 + _398;
    float _2340 = _2320;
    float _2342 = _2322;
    float _2344 = _2324;
    float _2346 = _2330;
    float _2348 = _2328;
    float _2350 = _2324;
    float _2352 = _2326;
    float _2354 = _2320;
    float _2356 = _2322;
    float _2358 = _2334;
    float _2360 = _2332;
    float _2456;
    float _2458;
    float _2528;
    float _2540;
    float _2582;
    float _2584;
    float _2586;
    if (!_418)
    {
        if (_538)
        {
            _472 = _1450;
        }
        float _2362 = _472;
        if (_538)
        {
            _2340 = 0.60000002384185791015625;
        }
        float _2364 = _2340;
        if (_538)
        {
            _2342 = _1452;
        }
        float _2366 = _2342;
        float _2368 = _2362;
        if (!_538)
        {
            float _2370 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2368 = _2370;
        }
        float _2372 = _2368;
        if (_538)
        {
            _2344 = _1456;
        }
        float _2374 = _2344;
        float _2376 = _2364;
        if (!_538)
        {
            float _2378 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2376 = _2378;
        }
        float _2380 = _2376;
        float _2382 = _2366;
        if (!_538)
        {
            float _2384 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2382 = _2384;
        }
        float _2386 = _2382;
        float _2388 = _2374;
        if (!_538)
        {
            float _2390 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2388 = _2390;
        }
        float _2392 = _2388;
        float _2394 = _2338 * 6.283184051513671875;
        float _2396 = _178 * _2372;
        float _2398 = _2372;
        if (!_538)
        {
            _1518 = _2372;
        }
        float _2400 = _1518;
        if (_538)
        {
            _2398 = 0.60000002384185791015625;
        }
        float _2402 = _2398;
        float _2404 = 1.0 / _2396;
        float _2406 = _178 * _2380;
        float _2408 = _178 * _2400;
        float _2410 = _2402;
        if (!_538)
        {
            _2410 = _2380;
        }
        float _2412 = _2410;
        float _2414 = _178 * _2386;
        if (!_538)
        {
            _1520 = _2386;
        }
        float _2416 = _1520;
        float _2418 = 1.0 / _2406;
        float _2420 = _178 * _2392;
        if (!_538)
        {
            _1522 = _2392;
        }
        float _2422 = _1522;
        float _2424 = _178 * _2412;
        float _2426 = _178 * _2422;
        float _2428 = 1.0 / _2414;
        float _2430 = _178 * _2416;
        float _2432 = _2404 * _2394;
        float _2434 = _2432 * 0.15915493667125701904296875;
        float _2436 = 1.0 / _2420;
        float _2438 = _2418 * _2394;
        float _2440 = _2438 * 0.15915493667125701904296875;
        float _2442 = 1.0 / _2408;
        float _2444 = _2428 * _2394;
        float _2446 = _2444 * 0.15915493667125701904296875;
        float _2448 = 1.0 / _2424;
        float _2450 = _2436 * _2394;
        float _2452 = 1.0 / _2430;
        float _2454 = _2424;
        _2456 = _2436;
        _2458 = _2404;
        if (_538)
        {
            _2454 = _1474;
        }
        float _2460 = _2454;
        float _2462 = _2460;
        if (!_538)
        {
            _2462 = _1476;
        }
        float _2464 = _2462;
        if (!_538)
        {
            _1524 = _1476;
        }
        float _2466 = _1524;
        float _2468 = 1.0 / _2426;
        float _2470 = _2334 * _2442;
        float _2472 = _2450 * 0.15915493667125701904296875;
        float _2474 = _2334 * _2448;
        float _2476 = _2470 * 6.283184051513671875;
        float _2478 = _2434 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        float _2482 = _2476 * 0.15915493667125701904296875;
        float _2484 = _2474 * 6.283184051513671875;
        float _2486 = _2334 * _2452;
        float _2488 = _2484 * 0.15915493667125701904296875;
        float _2490 = _2486 * 6.283184051513671875;
        float _2492 = _2334 * _2468;
        float _2494 = _2482 * 6.283185482025146484375;
        float _2496 = sin(_2494);
        float _2498 = _2484;
        float _2500 = _2490;
        if (_538)
        {
            _2498 = _1468;
        }
        float _2502 = _2498;
        float _2504 = _2490 * 0.15915493667125701904296875;
        float _2506 = _2492 * 6.283184051513671875;
        float _2508 = _2502;
        if (!_538)
        {
            _2508 = _1470;
        }
        float _2510 = _2508;
        if (!_538)
        {
            _1526 = _1470;
        }
        float _2512 = _1526;
        float _2514 = _2506 * 0.15915493667125701904296875;
        float _2516 = _2440 * 6.283185482025146484375;
        float _2518 = sin(_2516);
        float _2520 = _2512;
        if (_538)
        {
            _2500 = _1466;
        }
        float _2522 = _2500;
        float _2524 = _2480 * _2510;
        float _2526 = _2522;
        _2528 = _2480;
        if (!_538)
        {
            _2526 = _1472;
        }
        float _2530 = _2526;
        if (!_538)
        {
            _1528 = _1472;
        }
        float _2532 = _1528;
        float _2534 = _2488 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = _2496 * _2512;
        _2540 = _2538;
        if (_538)
        {
            _2520 = _1478;
        }
        float _2542 = _2520;
        float _2544 = _2542;
        if (!_538)
        {
            _2544 = _1480;
        }
        float _2546 = _2544;
        if (!_538)
        {
            _1530 = _1480;
        }
        float _2548 = _1530;
        float _2550 = _2446 * 6.283185482025146484375;
        float _2552 = sin(_2550);
        float _2554 = fma(_2518, _2530, _2524);
        float _2556 = _2504 * 6.283185482025146484375;
        float _2558 = sin(_2556);
        float _2560 = fma(_2536, _2532, _2538);
        float _2562 = _2472 * 6.283185482025146484375;
        float _2564 = sin(_2562);
        float _2566 = fma(_2552, _2464, _2554);
        float _2568 = _2514 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        float _2572 = fma(_2558, _2466, _2560);
        float _2574 = fma(_2564, _2546, _2566);
        float _2576 = fma(_2570, _2548, _2572);
        float _2578 = -_2576;
        float _2580 = _2574 + _2578;
        _2582 = _2580;
        _2584 = _2576;
        _2586 = _2572;
        _2588 = true;
    }
    else
    {
        if (_538)
        {
            _2346 = _1450;
        }
        float _2590 = _2346;
        if (_538)
        {
            _2348 = _1452;
        }
        float _2592 = _2348;
        if (_538)
        {
            _2350 = 0.60000002384185791015625;
        }
        float _2594 = _2350;
        float _2596 = _2590;
        if (!_538)
        {
            float _2598 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2596 = _2598;
        }
        float _2600 = _2596;
        float _2602 = _2592;
        if (!_538)
        {
            float _2604 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2602 = _2604;
        }
        float _2606 = _2602;
        float _2608 = _2594;
        if (!_538)
        {
            float _2610 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2608 = _2610;
        }
        float _2612 = _2608;
        if (_538)
        {
            _2352 = _1456;
        }
        float _2614 = _2352;
        float _2616 = _2614;
        if (!_538)
        {
            float _2618 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2616 = _2618;
        }
        float _2620 = _2616;
        if (_538)
        {
            _2354 = _1450;
        }
        float _2622 = _2354;
        float _2624 = _2622;
        if (_538)
        {
            _2356 = _1450;
        }
        float _2626 = _2356;
        float _2628 = _2338 * 6.283184051513671875;
        float _2630 = _372 + _398;
        float _2632 = _2626;
        if (!_538)
        {
            _2624 = _2600;
        }
        float _2634 = _2624;
        float _2636 = _2634;
        if (!_538)
        {
            _1532 = _2600;
        }
        float _2638 = _1532;
        float _2640 = _178 * _2606;
        float _2642 = _178 * _2634;
        if (_538)
        {
            _2636 = 0.60000002384185791015625;
        }
        float _2644 = _2636;
        float _2646 = _2644;
        if (!_538)
        {
            _2632 = _2600;
        }
        float _2648 = _2632;
        float _2650 = _2648;
        if (!_538)
        {
            _2646 = _2612;
        }
        float _2652 = _2646;
        float _2654 = 1.0 / _2640;
        float _2656 = _178 * _2648;
        float _2658 = _2652;
        if (_538)
        {
            _2650 = 0.60000002384185791015625;
        }
        float _2660 = _2650;
        float _2662 = _178 * _2600;
        float _2664 = _178 * _2612;
        float _2666 = _2660;
        if (!_538)
        {
            _2666 = _2612;
        }
        float _2668 = _2666;
        float _2670 = _178 * _2638;
        float _2672 = _178 * _2652;
        float _2674 = _2668;
        if (_538)
        {
            _2658 = 0.60000002384185791015625;
        }
        float _2676 = _2658;
        float _2678 = _2676;
        if (!_538)
        {
            _2678 = _2612;
        }
        float _2680 = _2678;
        float _2682 = 1.0 / _2662;
        float _2684 = _178 * _2680;
        float _2686 = _2680;
        if (_538)
        {
            _2686 = _1452;
        }
        float _2688 = _2686;
        float _2690 = 1.0 / _2664;
        float _2692 = _2688;
        if (!_538)
        {
            _2692 = _2606;
        }
        float _2694 = _2692;
        float _2696 = _178 * _2668;
        float _2698 = _2694;
        if (_538)
        {
            _2674 = _1452;
        }
        float _2700 = _2674;
        float _2702 = _2700;
        if (!_538)
        {
            _1534 = _2606;
        }
        float _2704 = _1534;
        float _2706 = 1.0 / _2696;
        float _2708 = _178 * _2694;
        float _2710 = _2704;
        if (_538)
        {
            _2698 = _1456;
        }
        float _2712 = _2698;
        float _2714 = _178 * _2620;
        float _2716 = _2712;
        if (!_538)
        {
            _2702 = _2606;
        }
        float _2718 = _2702;
        if (!_538)
        {
            _2716 = _2620;
        }
        float _2720 = _2716;
        float _2722 = _178 * _2704;
        float _2724 = _2720;
        if (_538)
        {
            _2710 = _1456;
        }
        float _2726 = _2710;
        float _2728 = _2726;
        if (!_538)
        {
            _2728 = _2620;
        }
        float _2730 = _2728;
        if (!_538)
        {
            _1536 = _2620;
        }
        float _2732 = _1536;
        float _2734 = 1.0 / _2672;
        float _2736 = _178 * _2718;
        float _2738 = _178 * _2730;
        float _2740 = _178 * _2732;
        float _2742 = 1.0 / _2714;
        float _2744 = _178 * _2720;
        float _2746 = _2682 * _2628;
        float _2748 = 1.0 / _2642;
        float _2750 = _2746 * 0.15915493667125701904296875;
        float _2752 = _2690 * _2628;
        float _2754 = 1.0 / _2670;
        float _2756 = 1.0 / _2684;
        float _2758 = _2752 * 0.15915493667125701904296875;
        float _2760 = _2654 * _2628;
        float _2762 = 1.0 / _2744;
        float _2764 = _2760 * 0.15915493667125701904296875;
        float _2766 = _2742 * _2628;
        float _2768 = _2630 * 6.283184051513671875;
        float _2770 = _2766 * 0.15915493667125701904296875;
        float _2772 = _372 * 6.283184051513671875;
        float _2774 = _2748 * _2768;
        float _2776 = 1.0 / _2656;
        float _2778 = 1.0 / _2708;
        float _2780 = _2774 * 0.15915493667125701904296875;
        float _2782 = _2754 * _2772;
        float _2784 = _2782 * 0.15915493667125701904296875;
        float _2786 = _2706 * _2768;
        float _2788 = 1.0 / _2738;
        float _2790 = 1.0 / _2736;
        float _2792 = 1.0 / _2740;
        float _2794 = _2786 * 0.15915493667125701904296875;
        float _2796 = _2756 * _2772;
        float _2798 = 1.0 / _2722;
        float _2800 = _2796 * 0.15915493667125701904296875;
        float _2802 = _2778 * _2768;
        float _2804 = _2802 * 0.15915493667125701904296875;
        float _2806 = _2788 * _2768;
        float _2808 = _2334 * _2776;
        float _2810 = _2806 * 0.15915493667125701904296875;
        float _2812 = _2792 * _2772;
        float _2814 = _2808 * 6.283184051513671875;
        float _2816 = _2770 * 6.283185482025146484375;
        float _2818 = sin(_2816);
        float _2820 = _2798 * _2772;
        float _2822 = _2812 * 0.15915493667125701904296875;
        float _2824 = _2334 * _2734;
        float _2826 = _2798;
        float _2828 = _2768;
        float _2830 = _2770;
        float _2832 = _2778;
        float _2834 = _2794;
        float _2836 = _2792;
        float _2838 = _2788;
        if (_538)
        {
            _2826 = _1474;
        }
        float _2840 = _2826;
        float _2842 = _2840;
        if (_538)
        {
            _2828 = _1474;
        }
        float _2844 = _2828;
        float _2846 = _2844;
        if (!_538)
        {
            _2842 = _1476;
        }
        float _2848 = _2842;
        _2586 = _2848;
        if (_538)
        {
            _2830 = _1474;
        }
        float _2850 = _2830;
        float _2852 = _2850;
        if (!_538)
        {
            _2846 = _1476;
        }
        float _2854 = _2846;
        if (!_538)
        {
            _2852 = _1476;
        }
        float _2856 = _2852;
        if (!_538)
        {
            _1538 = _1476;
        }
        float _2858 = _1538;
        float _2860 = _2814 * 0.15915493667125701904296875;
        float _2862 = _2824 * 6.283184051513671875;
        float _2864 = _2794 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        float _2868 = _2334 * _2790;
        if (_538)
        {
            _2832 = _1478;
        }
        float _2870 = _2832;
        float _2872 = _2870;
        if (_538)
        {
            _2724 = _1478;
        }
        float _2874 = _2724;
        float _2876 = _2820 * 0.15915493667125701904296875;
        float _2878 = _2874;
        float _2880 = _2876;
        if (!_538)
        {
            _2872 = _1480;
        }
        float _2882 = _2872;
        if (!_538)
        {
            _2878 = _1480;
        }
        float _2884 = _2878;
        if (_538)
        {
            _2834 = _1478;
        }
        float _2886 = _2834;
        float _2888 = _2886;
        if (!_538)
        {
            _2888 = _1480;
        }
        float _2890 = _2888;
        if (!_538)
        {
            _1540 = _1480;
        }
        float _2892 = _1540;
        float _2894 = _2862 * 0.15915493667125701904296875;
        float _2896 = _2868 * 6.283184051513671875;
        float _2898 = _2750 * 6.283185482025146484375;
        float _2900 = sin(_2898);
        float _2902 = _2334 * _2762;
        float _2904 = _2896;
        float _2906 = _2902;
        if (_538)
        {
            _2836 = _1468;
        }
        float _2908 = _2836;
        float _2910 = _2896 * 0.15915493667125701904296875;
        float _2912 = _2908;
        if (_538)
        {
            _2838 = _1468;
        }
        float _2914 = _2838;
        float _2916 = _2780 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        float _2920 = _2914;
        if (!_538)
        {
            _2912 = _1470;
        }
        float _2922 = _2912;
        if (!_538)
        {
            _2920 = _1470;
        }
        float _2924 = _2920;
        float _2926 = _2784 * 6.283185482025146484375;
        float _2928 = sin(_2926);
        float _2930 = _2860 * 6.283185482025146484375;
        float _2932 = sin(_2930);
        float _2934 = _2876 * 6.283185482025146484375;
        float _2936 = sin(_2934);
        if (_538)
        {
            _2904 = _1466;
        }
        float _2938 = _2904;
        float _2940 = _2938;
        if (_538)
        {
            _2880 = _1468;
        }
        float _2942 = _2880;
        float _2944 = _2758 * 6.283185482025146484375;
        float _2946 = sin(_2944);
        float _2948 = _2942;
        if (!_538)
        {
            _2948 = _1470;
        }
        float _2950 = _2948;
        if (!_538)
        {
            _1542 = _1470;
        }
        float _2952 = _1542;
        float _2954 = _2902 * 6.283184051513671875;
        float _2956 = _2800 * 6.283185482025146484375;
        float _2958 = sin(_2956);
        float _2960 = _2954 * 0.15915493667125701904296875;
        _1548 = _2960;
        if (_538)
        {
            _2358 = _1466;
        }
        float _2962 = _2358;
        float _2964 = _2894 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962;
        if (_538)
        {
            _2906 = _1466;
        }
        float _2970 = _2906;
        float _2972 = _2970;
        if (!_538)
        {
            _2940 = _1472;
        }
        float _2974 = _2940;
        if (!_538)
        {
            _2968 = _1472;
        }
        float _2976 = _2968;
        float _2978 = _2764 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        _2584 = _2976;
        if (!_538)
        {
            _2972 = _1472;
        }
        float _2982 = _2972;
        if (!_538)
        {
            _1544 = _1472;
        }
        float _2984 = _1544;
        float _2986 = _2804 * 6.283185482025146484375;
        float _2988 = sin(_2986);
        float _2990 = _2910 * 6.283185482025146484375;
        float _2992 = sin(_2990);
        float _2994 = _2900 * _2922;
        float _2996 = _2918 * _2950;
        float _2998 = _2928 * _2952;
        float _3000 = _2932 * _2924;
        float _3002 = _2810 * 6.283185482025146484375;
        float _3004 = sin(_3002);
        float _3006 = _2822 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        float _3010 = _2960 * 6.283185482025146484375;
        float _3012 = sin(_3010);
        float _3014 = fma(_2946, _2974, _2994);
        float _3016 = fma(_2866, _2982, _2996);
        float _3018 = fma(_2958, _2984, _2998);
        float _3020 = fma(_2966, _2976, _3000);
        float _3022 = fma(_2980, _2848, _3014);
        float _3024 = fma(_2988, _2856, _3016);
        float _3026 = fma(_2936, _2858, _3018);
        float _3028 = fma(_2992, _2854, _3020);
        float _3030 = fma(_2818, _2882, _3022);
        float _3032 = fma(_3004, _2890, _3024);
        float _3034 = fma(_3008, _2892, _3026);
        float _3036 = fma(_3012, _2884, _3028);
        float _3038 = -_3032;
        float _3040 = _3038 + _3034;
        float _3042 = -_3036;
        float _3044 = _3030 + _3042;
        float _3046 = _3044 + _3040;
        _2582 = _3046;
        _2528 = _3044;
        _1546 = _3012;
        _2456 = _2946;
        _2540 = _3014;
        _1550 = _3020;
        _2458 = _3028;
    }
    _2588 = false;
    float _3048 = _2582;
    float _3050 = _2584;
    float _3052 = _2528;
    float _3054 = _1546;
    float _3056 = _2456;
    float _3058 = _1548;
    float _3060 = _2540;
    float _3062 = _2586;
    float _3064 = _1550;
    float _3066 = _2458;
    float _3068 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _3070 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    float _3072 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    float _3074 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[128]);
    float _3076 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[129]);
    float _3078 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[130]);
    uint _3080 = uint(int(uint(_184) >> uint(2)));
    float _3082 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3080)]);
    float _3084 = fma(_204, _1484, _544);
    float _3086 = fma(_206, _2332, _548);
    float _3088 = fma(_208, _3048, _550);
    bool _3090 = _3068 > 0.0;
    bool _3092 = _3070 > 0.0;
    float _3094 = _3072 * _3070;
    float _3096 = _180 * _3074;
    float _3098 = _3068;
    float _3100 = _3072;
    float _3102 = _3050;
    bool _3104 = _3092;
    float _3106 = _3048;
    float _3108 = _3052;
    float _3110 = _3094;
    float _3112 = _3096;
    float _3114 = _3076;
    float _3116 = _3088;
    float _3118 = _3084;
    if (_3090)
    {
        float _3120 = 1.0 / _3068;
        _3098 = _3120;
    }
    float _3122 = _3098;
    float _3124 = _180 * _3078;
    float _3126 = _3124;
    if (_3092)
    {
        float _3128 = -_3094;
        float _3130 = fma(_160, _3128, _3072);
        _3100 = _3130;
    }
    float _3132 = _3100;
    float _3134 = _180 * _3076;
    float _3136 = _3132;
    float _3138 = _3122;
    if (_3090)
    {
        float _3140 = _454 * _3122;
        _3102 = _3140;
    }
    float _3142 = _3102;
    float _3144 = _3142;
    if (_3090)
    {
        float _3146 = precise::min(_3142, 1.0);
        _3144 = _3146;
    }
    float _3148 = _3144;
    float _3150 = _3148;
    if (_3090)
    {
        float _3152 = _3148 * _3132;
        _3136 = _3152;
    }
    float _3154 = _3136;
    float _3156 = _3096 * _3154;
    float _3158 = _3134 * _3154;
    float _3160 = _3124 * _3154;
    bool _3162 = !_436;
    float _3164 = _3154;
    float _3166 = _3158;
    float _3288;
    float _3290;
    if (!_3162)
    {
        float _3168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3172 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3186 = _3172 * _3174;
        float _3188 = _3172 * _3176;
        float _3190 = _3170 * _3174;
        float _3192 = -_3186;
        float _3194 = fma(_3168, _3178, _3192);
        float _3196 = -_3188;
        float _3198 = fma(_3170, _3178, _3196);
        float _3200 = -_3190;
        float _3202 = fma(_3168, _3176, _3200);
        float _3204 = _3182 * _3168;
        float _3206 = _3182 * _3194;
        float _3208 = _3184 * _3170;
        float _3210 = _3180 * _3176;
        float _3212 = -_3204;
        float _3214 = fma(_3180, _3170, _3212);
        float _3216 = -_3206;
        float _3218 = fma(_3180, _3198, _3216);
        float _3220 = _3182 * _3178;
        float _3222 = _3184 * _3174;
        float _3224 = _3180 * _3172;
        float _3226 = fma(_3184, _3202, _3218);
        float _3228 = -_3220;
        float _3230 = fma(_3184, _3176, _3228);
        float _3232 = -_3222;
        float _3234 = fma(_3180, _3178, _3232);
        float _3236 = -_3210;
        float _3238 = fma(_3182, _3174, _3236);
        float _3240 = 1.0 / _3226;
        float _3242 = -_3224;
        float _3244 = fma(_3184, _3168, _3242);
        float _3246 = -_3168;
        float _3248 = fma(_3246, _3178, _3186);
        float _3250 = -_3208;
        float _3252 = fma(_3182, _3172, _3250);
        float _3254 = _3230 * _3240;
        float _3256 = _3234 * _3240;
        float _3258 = _3238 * _3240;
        float _3260 = _3248 * _3240;
        float _3262 = _3158 * _3254;
        float _3264 = _3158 * _3256;
        float _3266 = _3158 * _3258;
        float _3268 = _3156 * _3240;
        float _3270 = _3252 * _3240;
        float _3272 = _3244 * _3240;
        float _3274 = _3214 * _3240;
        float _3276 = fma(_3198, _3268, _3262);
        float _3278 = fma(_3156, _3260, _3264);
        float _3280 = fma(_3202, _3268, _3266);
        float _3282 = fma(_3160, _3270, _3276);
        float _3284 = fma(_3160, _3272, _3278);
        float _3286 = fma(_3160, _3274, _3280);
        _3108 = _3240;
        _3110 = _3180;
        _2360 = _3182;
        _3150 = _3184;
        _3112 = _3270;
        _3114 = _3272;
        _3126 = _3280;
        _556 = _3268;
        _558 = _3262;
        _560 = _3276;
        _316 = _3174;
        _318 = _3176;
        _1552 = _3178;
        _3164 = _3186;
        _3166 = _3284;
        _3288 = _3282;
        _3290 = _3286;
        _3292 = true;
    }
    else
    {
        int _3294 = as_type<int>(_242) & 1024;
        bool _3296 = _3294 != 0;
        if (_3296)
        {
            _3104 = true;
        }
        bool _3298 = _3104;
        bool _3300 = _3298;
        if (!_3296)
        {
            int _3302 = as_type<int>(_242) & 2048;
            bool _3304 = _3302 != 0;
            _3300 = _3304;
        }
        bool _3306 = _3300;
        if (!_3306)
        {
            _3138 = _3156;
        }
        float _3308 = _3138;
        _3288 = _3308;
        if (!_3306)
        {
            _3106 = _3160;
        }
        float _3310 = _3106;
        bool _3312 = !_3306;
        _3290 = _3310;
        if (!_3312)
        {
            uint _3314 = uint(int(uint(_154) >> uint(2)));
            float _3316 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3314)]);
            int _3318 = _154 + 4;
            uint _3320 = uint(int(uint(_3318) >> uint(2)));
            float _3322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3320)]);
            int _3324 = _154 + 8;
            uint _3326 = uint(int(uint(_3324) >> uint(2)));
            float _3328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3326)]);
            uint _3330 = uint(int(uint(_154) >> uint(2)));
            float _3332 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3330)]);
            int _3334 = _154 + 4;
            uint _3336 = uint(int(uint(_3334) >> uint(2)));
            float _3338 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3336)]);
            int _3340 = _154 + 8;
            uint _3342 = uint(int(uint(_3340) >> uint(2)));
            float _3344 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3342)]);
            uint _3346 = uint(int(uint(_154) >> uint(2)));
            float _3348 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3346)]);
            int _3350 = _154 + 4;
            uint _3352 = uint(int(uint(_3350) >> uint(2)));
            float _3354 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3352)]);
            int _3356 = _154 + 8;
            uint _3358 = uint(int(uint(_3356) >> uint(2)));
            float _3360 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3358)]);
            float _3362 = _3328 * _3332;
            float _3364 = _3328 * _3338;
            float _3366 = _3322 * _3332;
            float _3368 = -_3362;
            float _3370 = fma(_3316, _3344, _3368);
            float _3372 = -_3364;
            float _3374 = fma(_3322, _3344, _3372);
            float _3376 = -_3366;
            float _3378 = fma(_3316, _3338, _3376);
            float _3380 = _3354 * _3316;
            float _3382 = _3354 * _3370;
            float _3384 = _3360 * _3322;
            float _3386 = _3348 * _3338;
            float _3388 = -_3380;
            float _3390 = fma(_3348, _3322, _3388);
            float _3392 = -_3382;
            float _3394 = fma(_3348, _3374, _3392);
            float _3396 = _3354 * _3344;
            float _3398 = _3360 * _3332;
            float _3400 = _3348 * _3328;
            float _3402 = fma(_3360, _3378, _3394);
            float _3404 = -_3396;
            float _3406 = fma(_3360, _3338, _3404);
            float _3408 = -_3398;
            float _3410 = fma(_3348, _3344, _3408);
            float _3412 = -_3386;
            float _3414 = fma(_3354, _3332, _3412);
            float _3416 = 1.0 / _3402;
            float _3418 = -_3400;
            float _3420 = fma(_3360, _3316, _3418);
            float _3422 = -_3316;
            float _3424 = fma(_3422, _3344, _3362);
            float _3426 = -_3384;
            float _3428 = fma(_3354, _3328, _3426);
            float _3430 = _3406 * _3416;
            float _3432 = _3410 * _3416;
            float _3434 = _3414 * _3416;
            float _3436 = _3424 * _3416;
            float _3438 = _3158 * _3430;
            float _3440 = _3158 * _3432;
            float _3442 = _3158 * _3434;
            float _3444 = _3156 * _3416;
            float _3446 = _3428 * _3416;
            float _3448 = _3420 * _3416;
            float _3450 = _3390 * _3416;
            float _3452 = fma(_3374, _3444, _3438);
            float _3454 = fma(_3156, _3436, _3440);
            float _3456 = fma(_3378, _3444, _3442);
            float _3458 = fma(_3160, _3446, _3452);
            float _3460 = fma(_3160, _3448, _3454);
            float _3462 = fma(_3160, _3450, _3456);
            _3108 = _3416;
            _3110 = _3348;
            _2360 = _3354;
            _3150 = _3360;
            _3112 = _3446;
            _3114 = _3448;
            _3126 = _3456;
            _556 = _3444;
            _558 = _3438;
            _560 = _3452;
            _316 = _3332;
            _318 = _3338;
            _1552 = _3344;
            _3164 = _3362;
            _3166 = _3460;
            _3288 = _3458;
            _3290 = _3462;
        }
    }
    _3292 = false;
    float _3464 = _3108;
    float _3466 = _3110;
    float _3468 = _2360;
    float _3470 = _3150;
    float _3472 = _3112;
    float _3474 = _3114;
    float _3476 = _3126;
    float _3478 = _556;
    float _3480 = _558;
    float _3482 = _560;
    float _3484 = _316;
    float _3486 = _318;
    float _3488 = _1552;
    float _3490 = _3164;
    float _3492 = _3166;
    float _3494 = _3288;
    float _3496 = _3290;
    uint _3498 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3498)] = as_type<uint>(_3082);
    float _3500 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    int _3502 = as_type<int>(_3500) & 512;
    bool _3504 = _3502 != 0;
    int _3506 = as_type<int>(_3500) & 1024;
    bool _3508 = _3506 != 0;
    int _3510 = as_type<int>(_3500) & 2048;
    bool _3512 = _3510 != 0;
    float _3514 = _3160;
    float _3516 = _3054;
    float _3518 = _3056;
    float _3520 = _3058;
    if (_3504)
    {
        float _3522 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3524 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3528 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3514 = _3522;
        _3516 = _3524;
        _3518 = _3526;
        _3520 = _3528;
    }
    float _3530 = _3514;
    float _3532 = _3516;
    float _3534 = _3518;
    float _3536 = _3520;
    float _3538 = _3464;
    float _3540 = _3060;
    float _3542 = _3156;
    float _3544 = _3062;
    if (_3504)
    {
        float _3546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3548 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3552 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3538 = _3546;
        _3540 = _3548;
        _3542 = _3550;
        _3544 = _3552;
    }
    float _3554 = _3538;
    float _3556 = _3540;
    float _3558 = _3542;
    float _3560 = _3544;
    float _3562 = _3466;
    float _3564 = _3468;
    float _3566 = _3470;
    if (_3508)
    {
        uint _3568 = uint(int(uint(_154) >> uint(2)));
        float _3570 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3568)]);
        int _3572 = _154 + 4;
        uint _3574 = uint(int(uint(_3572) >> uint(2)));
        float _3576 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3574)]);
        int _3578 = _154 + 8;
        uint _3580 = uint(int(uint(_3578) >> uint(2)));
        float _3582 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3580)]);
        _3562 = _3570;
        _3564 = _3576;
        _3566 = _3582;
    }
    float _3584 = _3562;
    float _3586 = _3564;
    float _3588 = _3566;
    float _3590 = _3472;
    float _3592 = _3474;
    float _3594 = _3476;
    if (_3508)
    {
        uint _3596 = uint(int(uint(_154) >> uint(2)));
        float _3598 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3596)]);
        int _3600 = _154 + 4;
        uint _3602 = uint(int(uint(_3600) >> uint(2)));
        float _3604 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3602)]);
        int _3606 = _154 + 8;
        uint _3608 = uint(int(uint(_3606) >> uint(2)));
        float _3610 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3608)]);
        _3590 = _3598;
        _3592 = _3604;
        _3594 = _3610;
    }
    float _3612 = _3590;
    float _3614 = _3592;
    float _3616 = _3594;
    float _3618 = _3500;
    float _3620 = _3478;
    float _3622 = _3480;
    float _3624 = _3482;
    if (_3512)
    {
        uint _3626 = uint(int(uint(_154) >> uint(2)));
        float _3628 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3626)]);
        int _3630 = _154 + 4;
        uint _3632 = uint(int(uint(_3630) >> uint(2)));
        float _3634 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3632)]);
        int _3636 = _154 + 8;
        uint _3638 = uint(int(uint(_3636) >> uint(2)));
        float _3640 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3638)]);
        int _3642 = _154 + 12;
        uint _3644 = uint(int(uint(_3642) >> uint(2)));
        float _3646 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_3644)]);
        _3618 = _3628;
        _3620 = _3634;
        _3622 = _3640;
        _3624 = _3646;
    }
    float _3648 = _3618;
    float _3650 = _3620;
    float _3652 = _3622;
    float _3654 = _3624;
    float _3656 = _3484;
    float _3658 = _3486;
    float _3660 = _3488;
    float _3662 = _3490;
    if (_3512)
    {
        uint _3664 = uint(int(uint(_154) >> uint(2)));
        float _3666 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3664)]);
        int _3668 = _154 + 4;
        uint _3670 = uint(int(uint(_3668) >> uint(2)));
        float _3672 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3670)]);
        int _3674 = _154 + 8;
        uint _3676 = uint(int(uint(_3674) >> uint(2)));
        float _3678 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3676)]);
        int _3680 = _154 + 12;
        uint _3682 = uint(int(uint(_3680) >> uint(2)));
        float _3684 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3682)]);
        _3656 = _3666;
        _3658 = _3672;
        _3660 = _3678;
        _3662 = _3684;
    }
    float _3686 = _3656;
    float _3688 = _3658;
    float _3690 = _3660;
    float _3692 = _3662;
    float _3694 = _3064;
    if (_3508)
    {
        float _3696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3694 = _3696;
    }
    float _3698 = _3694;
    float _3700 = _3066;
    if (_3508)
    {
        float _3702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3700 = _3702;
    }
    float _3704 = _3700;
    float _3706 = _3086 + _3492;
    float _3708 = _3084 + _3494;
    float _3710 = _3088 + _3496;
    if (!_3504)
    {
        _3116 = 0.0;
    }
    float _3712 = _3116;
    float _3714 = _3530;
    float _3716 = _3712;
    if (_3504)
    {
        float _3718 = _3706 * _3532;
        _3118 = _3718;
    }
    float _3720 = _3118;
    float _3722 = _3720;
    if (_3504)
    {
        float _3724 = fma(_3708, _3530, _3720);
        _3722 = _3724;
    }
    float _3726 = _3722;
    float _3728 = _3586;
    float _3730 = _3554;
    float _3732 = _3584;
    float _3734 = _3612;
    float _3736 = _3688;
    float _3738 = _3726;
    float _3740 = _3648;
    float _3742 = _3690;
    float _3744 = _3652;
    if (_3504)
    {
        float _3746 = _3706 * _3556;
        _3714 = _3746;
    }
    float _3748 = _3714;
    float _3750 = _3748;
    if (_3508)
    {
        float _3752 = _3706 * _3586;
        _3728 = _3752;
    }
    float _3754 = _3728;
    float _3756 = _3754;
    if (_3504)
    {
        float _3758 = fma(_3708, _3554, _3748);
        _3730 = _3758;
    }
    float _3760 = _3730;
    float _3762 = _3760;
    if (_3508)
    {
        float _3764 = _3706 * _3614;
        _3750 = _3764;
    }
    float _3766 = _3750;
    if (_3508)
    {
        float _3768 = fma(_3708, _3584, _3754);
        _3756 = _3768;
    }
    float _3770 = _3756;
    float _3772 = _3770;
    if (_3512)
    {
        float _3774 = _3706 * _3650;
        _3732 = _3774;
    }
    float _3776 = _3732;
    if (_3508)
    {
        float _3778 = fma(_3708, _3612, _3766);
        _3734 = _3778;
    }
    float _3780 = _3734;
    float _3782 = _3780;
    if (_3512)
    {
        float _3784 = _3706 * _3688;
        _3736 = _3784;
    }
    float _3786 = _3736;
    float _3788 = _3786;
    if (_3504)
    {
        float _3790 = fma(_3710, _3534, _3726);
        _3738 = _3790;
    }
    float _3792 = _3738;
    float _3794 = _3792;
    if (_3512)
    {
        float _3796 = fma(_3708, _3648, _3776);
        _3740 = _3796;
    }
    float _3798 = _3740;
    float _3800 = _3798;
    if (_3512)
    {
        float _3802 = fma(_3708, _3686, _3786);
        _3788 = _3802;
    }
    float _3804 = _3788;
    if (_3504)
    {
        float _3806 = fma(_3710, _3558, _3760);
        _3762 = _3806;
    }
    float _3808 = _3762;
    if (_3508)
    {
        float _3810 = fma(_3710, _3616, _3780);
        _3782 = _3810;
    }
    float _3812 = _3782;
    float _3814 = _3812;
    if (_3508)
    {
        float _3816 = fma(_3710, _3588, _3770);
        _3772 = _3816;
    }
    float _3818 = _3772;
    if (_3504)
    {
        float _3820 = _3536 + _3792;
        _3716 = _3820;
    }
    float _3822 = _3716;
    float _3824 = _3822;
    if (_3512)
    {
        float _3826 = fma(_3710, _3652, _3798);
        _3800 = _3826;
    }
    float _3828 = _3800;
    if (_3512)
    {
        float _3830 = fma(_3710, _3690, _3804);
        _3742 = _3830;
    }
    float _3832 = _3742;
    if (!_3504)
    {
        _3794 = 0.0;
    }
    float _3834 = _3794;
    float _3836 = _3834;
    if (_3504)
    {
        float _3838 = _3560 + _3808;
        _3836 = _3838;
    }
    float _3840 = _3836;
    float _3842 = _3840;
    if (_3508)
    {
        float _3844 = _3698 + _3812;
        _3824 = _3844;
    }
    float _3846 = _3824;
    float _3848 = _3846;
    if (_3508)
    {
        float _3850 = _3704 + _3818;
        _3842 = _3850;
    }
    float _3852 = _3842;
    float _3854 = _3852;
    if (_3512)
    {
        float _3856 = _3654 + _3828;
        _3848 = _3856;
    }
    float _3858 = _3848;
    if (_3512)
    {
        float _3860 = _3692 + _3832;
        _3854 = _3860;
    }
    float _3862 = _3854;
    float _3864 = fma(_3858, 6.2500002968590706586837768554688e-05, 0.5);
    float _3866 = fma(_3862, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _9853 = float2(_3864, _3866);
    float _3868 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9853, float2(0.0), isnan(_9853)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9853, float2(0.0), isnan(_9853)), level(0.0)).x;
    bool _3870 = _454 > 0.001000000047497451305389404296875;
    bool _3872 = isnan(_454);
    bool _3874 = _3870 || _3872;
    bool _3876 = isnan(0.001000000047497451305389404296875);
    bool _3878 = _3874 || _3876;
    float _3880 = fma(_3858, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _3882 = fma(_3858, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _3884 = fma(_3862, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _3886 = _3828;
    float _3888 = _3880;
    float _3890 = _3864;
    float _3892 = _3866;
    if (!_3878)
    {
        float _3894 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[76]);
        _3886 = _3894;
    }
    float _3896 = _3886;
    bool _3898 = _3868 != 0.0;
    bool _3900 = isnan(_3868);
    bool _3902 = _3898 || _3900;
    bool _3904 = isnan(0.0);
    bool _3906 = _3902 || _3904;
    if (!_3906)
    {
        _3744 = 4.0;
    }
    float _3908 = _3744;
    float _3910 = _3868;
    float _3912 = _3908;
    if (!_3906)
    {
        float2 _9918 = float2(_3864, _3866);
        float _3914 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9918, float2(0.0), isnan(_9918)), level(_3908)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9918, float2(0.0), isnan(_9918)), level(_3908)).x;
        _3910 = _3914;
    }
    float _3916 = _3910;
    float2 _9930 = float2(_3880, _3866);
    float _3918 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9930, float2(0.0), isnan(_9930)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9930, float2(0.0), isnan(_9930)), level(0.0)).x;
    float2 _9938 = float2(_3882, _3866);
    float _3920 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9938, float2(0.0), isnan(_9938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9938, float2(0.0), isnan(_9938)), level(0.0)).x;
    float2 _9946 = float2(_3864, _3884);
    float _3922 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_9946, float2(0.0), isnan(_9946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_9946, float2(0.0), isnan(_9946)), level(0.0)).x;
    float _3924 = -_190;
    float _3926 = _3924 + _3708;
    float _3928 = -_202;
    float _3930 = _3928 + _3710;
    float _3932 = _3916 * 2000.0;
    bool _3934 = _3932 != 0.0;
    bool _3936 = isnan(_3932);
    bool _3938 = _3934 || _3936;
    bool _3940 = isnan(0.0);
    bool _3942 = _3938 || _3940;
    float _3944 = _3896;
    float _3946 = _3932;
    float _3948 = _3922;
    float _3950 = _3920;
    if (!_3878)
    {
        float _3952 = _3932 + _3896;
        _3944 = _3952;
    }
    float _3954 = _3944;
    float _3956 = _3954;
    if (!_3878)
    {
        int _3958 = _154 + 4;
        _3946 = as_type<float>(_3958);
    }
    float _3960 = _3946;
    bool _3962 = _454 <= 0.001000000047497451305389404296875;
    bool _3964 = !_3942;
    bool _3966 = _3962 && _3964;
    float _3968 = _3960;
    if (!_3878)
    {
        uint _3970 = uint(int(uint(as_type<int>(_3960)) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_3970)] = as_type<uint>(_3954);
    }
    bool _3972 = !_3966;
    int _3974 = _3972 ? as_type<int>(_3082) : 0;
    float _3976 = -_196;
    float _3978 = _3976 + _3706;
    if (_3878)
    {
        _320 = _3974;
    }
    int _3980 = _320;
    int _3982 = _3980;
    if (!_3878)
    {
        bool _3984 = _3918 != 0.0;
        bool _3986 = isnan(_3918);
        bool _3988 = _3984 || _3986;
        bool _3990 = isnan(0.0);
        bool _3992 = _3988 || _3990;
        float _3994 = fma(_3862, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _10055 = float2(_3880, _3884);
        float _3996 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10055, float2(0.0), isnan(_10055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10055, float2(0.0), isnan(_10055)), level(0.0)).x;
        float2 _10063 = float2(_3882, _3884);
        float _3998 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10063, float2(0.0), isnan(_10063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10063, float2(0.0), isnan(_10063)), level(0.0)).x;
        float2 _10071 = float2(_3880, _3994);
        float _4000 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10071, float2(0.0), isnan(_10071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10071, float2(0.0), isnan(_10071)), level(0.0)).x;
        float _4002 = _3866;
        if (_3992)
        {
            _3912 = _3918;
        }
        float _4004 = _3912;
        float2 _10085 = float2(_3864, _3994);
        float _4006 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10085, float2(0.0), isnan(_10085)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10085, float2(0.0), isnan(_10085)), level(0.0)).x;
        float2 _10093 = float2(_3882, _3994);
        float _4008 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10093, float2(0.0), isnan(_10093)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10093, float2(0.0), isnan(_10093)), level(0.0)).x;
        if (!_3992)
        {
            _3956 = 4.0;
        }
        float _4010 = _3956;
        float _4012 = _4004;
        float _4014 = _4010;
        if (!_3992)
        {
            float2 _10111 = float2(_3880, _3866);
            float _4016 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10111, float2(0.0), isnan(_10111)), level(_4010)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10111, float2(0.0), isnan(_10111)), level(_4010)).x;
            _4012 = _4016;
        }
        float _4018 = _4012;
        bool _4020 = _3920 != 0.0;
        bool _4022 = isnan(_3920);
        bool _4024 = _4020 || _4022;
        bool _4026 = isnan(0.0);
        bool _4028 = _4024 || _4026;
        bool _4030 = _3922 != 0.0;
        bool _4032 = isnan(_3922);
        bool _4034 = _4030 || _4032;
        bool _4036 = isnan(0.0);
        bool _4038 = _4034 || _4036;
        if (_4028)
        {
            _3968 = _3920;
        }
        float _4040 = _3968;
        if (!_4028)
        {
            _3888 = 4.0;
        }
        float _4042 = _3888;
        if (_4038)
        {
            _4014 = _3922;
        }
        float _4044 = _4014;
        float _4046 = _4040;
        if (!_4028)
        {
            float2 _10164 = float2(_3882, _3866);
            float _4048 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10164, float2(0.0), isnan(_10164)), level(_4042)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10164, float2(0.0), isnan(_10164)), level(_4042)).x;
            _4046 = _4048;
        }
        float _4050 = _4046;
        if (!_4038)
        {
            _3890 = 4.0;
        }
        float _4052 = _3890;
        bool _4054 = _3996 != 0.0;
        bool _4056 = isnan(_3996);
        bool _4058 = _4054 || _4056;
        bool _4060 = isnan(0.0);
        bool _4062 = _4058 || _4060;
        bool _4064 = _3998 != 0.0;
        bool _4066 = isnan(_3998);
        bool _4068 = _4064 || _4066;
        bool _4070 = isnan(0.0);
        bool _4072 = _4068 || _4070;
        bool _4074 = _4000 != 0.0;
        bool _4076 = isnan(_4000);
        bool _4078 = _4074 || _4076;
        bool _4080 = isnan(0.0);
        bool _4082 = _4078 || _4080;
        bool _4084 = _4006 != 0.0;
        bool _4086 = isnan(_4006);
        bool _4088 = _4084 || _4086;
        bool _4090 = isnan(0.0);
        bool _4092 = _4088 || _4090;
        bool _4094 = _4008 != 0.0;
        bool _4096 = isnan(_4008);
        bool _4098 = _4094 || _4096;
        bool _4100 = isnan(0.0);
        bool _4102 = _4098 || _4100;
        if (!_4062)
        {
            _4002 = 4.0;
        }
        float _4104 = _4002;
        if (!_4072)
        {
            _3948 = 4.0;
        }
        float _4106 = _3948;
        if (!_4082)
        {
            _3950 = 4.0;
        }
        float _4108 = _3950;
        float _4110 = _3996;
        if (!_4062)
        {
            float2 _10255 = float2(_3880, _3884);
            float _4112 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10255, float2(0.0), isnan(_10255)), level(_4104)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10255, float2(0.0), isnan(_10255)), level(_4104)).x;
            _4110 = _4112;
        }
        float _4114 = _4110;
        float _4116 = _3998;
        if (!_4072)
        {
            float2 _10271 = float2(_3882, _3884);
            float _4118 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10271, float2(0.0), isnan(_10271)), level(_4106)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10271, float2(0.0), isnan(_10271)), level(_4106)).x;
            _4116 = _4118;
        }
        float _4120 = _4116;
        float _4122 = _4000;
        if (!_4082)
        {
            float2 _10287 = float2(_3880, _3994);
            float _4124 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10287, float2(0.0), isnan(_10287)), level(_4108)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10287, float2(0.0), isnan(_10287)), level(_4108)).x;
            _4122 = _4124;
        }
        float _4126 = _4122;
        if (!_4092)
        {
            _3892 = 4.0;
        }
        float _4128 = _3892;
        if (!_4102)
        {
            _3814 = 4.0;
        }
        float _4130 = _3814;
        float _4132 = _4008;
        if (!_4102)
        {
            float2 _10313 = float2(_3882, _3994);
            float _4134 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10313, float2(0.0), isnan(_10313)), level(_4130)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10313, float2(0.0), isnan(_10313)), level(_4130)).x;
            _4132 = _4134;
        }
        float _4136 = _4132;
        float _4138 = _4044;
        if (!_4038)
        {
            float2 _10329 = float2(_3864, _3884);
            float _4140 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10329, float2(0.0), isnan(_10329)), level(_4052)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10329, float2(0.0), isnan(_10329)), level(_4052)).x;
            _4138 = _4140;
        }
        float _4142 = _4138;
        float _4144 = _4006;
        if (!_4092)
        {
            float2 _10345 = float2(_3864, _3994);
            float _4146 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10345, float2(0.0), isnan(_10345)), level(_4128)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10345, float2(0.0), isnan(_10345)), level(_4128)).x;
            _4144 = _4146;
        }
        float _4148 = _4144;
        float _4150 = -_4018;
        float _4152 = _3916 + _4150;
        float _4154 = -_4050;
        float _4156 = _3916 + _4154;
        float _4158 = abs(_4152);
        float _4160 = abs(_4156);
        float _4162 = precise::max(_4158, _4160);
        float _4164 = -_4114;
        float _4166 = _3916 + _4164;
        float _4168 = -_4120;
        float _4170 = _3916 + _4168;
        float _4172 = -_4126;
        float _4174 = _3916 + _4172;
        float _4176 = abs(_4166);
        float _4178 = abs(_4174);
        float _4180 = precise::max(_4176, _4178);
        float _4182 = -_4136;
        float _4184 = _3916 + _4182;
        float _4186 = -_4142;
        float _4188 = _3916 + _4186;
        float _4190 = -_4148;
        float _4192 = _3916 + _4190;
        float _4194 = abs(_4170);
        float _4196 = abs(_4184);
        float _4198 = precise::max(_4194, _4196);
        float _4200 = abs(_4188);
        float _4202 = abs(_4192);
        float _4204 = precise::max(_4200, _4202);
        float _4206 = precise::max(_4180, _4198);
        float _4208 = precise::max(_4162, _4204);
        bool _4210 = _4206 > 0.00150000001303851604461669921875;
        bool _4212 = _4208 > 0.00150000001303851604461669921875;
        bool _4214 = _4212 || _4210;
        bool _4216 = !_4214;
        int _4218 = _4216 ? _3974 : 0;
        _3982 = _4218;
    }
    int _4220 = _3982;
    int _4222 = _154 + 4;
    int _4224 = _154 + 8;
    uint _4226 = uint(int(uint(_184) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4226)] = uint(_4220);
    uint _4228 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4228)] = as_type<uint>(_3708);
    uint _4230 = uint(int(uint(_4222) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4230)] = as_type<uint>(_3706);
    uint _4232 = uint(int(uint(_4224) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4232)] = as_type<uint>(_3710);
    uint _4234 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4234)] = as_type<uint>(_524);
    uint _4236 = uint(int(uint(_4222) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4236)] = as_type<uint>(_526);
    uint _4238 = uint(int(uint(_4224) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4238)] = as_type<uint>(_528);
    uint _4240 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4240)] = as_type<uint>(_3926);
    uint _4242 = uint(int(uint(_4222) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4242)] = as_type<uint>(_3978);
    uint _4244 = uint(int(uint(_4224) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4244)] = as_type<uint>(_3930);
    float _4246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4248 = _3978 * _3978;
    float _4250 = _526 * _526;
    float _4252 = fma(_3926, _3926, _4248);
    float _4254 = fma(_524, _524, _4250);
    float _4256 = fma(_3930, _3930, _4252);
    float _4258 = fma(_528, _528, _4254);
    float _4260 = sqrt(_4258);
    float _4262 = sqrt(_4256);
    bool _4264 = _4262 >= 9.9999999747524270787835121154785e-07;
    bool _4266 = isnan(_4262);
    bool _4268 = _4264 || _4266;
    bool _4270 = isnan(9.9999999747524270787835121154785e-07);
    bool _4272 = _4268 || _4270;
    float _4274 = _4262;
    if (!_4272)
    {
        bool _4276 = _182 != _216;
        bool _4278 = isnan(_182);
        bool _4280 = _4276 || _4278;
        bool _4282 = isnan(_216);
        bool _4284 = _4280 || _4282;
        _4286 = _4284;
        if (!_4286)
        {
            float _4288 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _4290 = _4288 > 0.0;
            bool _4292 = !_4290;
            if (!_4292)
            {
                float _4294 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _4296 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _4298 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _4300 = _4296 * _4296;
                float _4302 = fma(_4294, _4294, _4300);
                float _4304 = fma(_4298, _4298, _4302);
                float _4306 = rsqrt(_4304);
                float _4308 = _4306 * 9.9999999747524270787835121154785e-07;
                float _4310 = _4294 * _4308;
                float _4312 = _4296 * _4308;
                float _4314 = _4298 * _4308;
                _330 = as_type<int>(_4310);
                _332 = as_type<int>(_4312);
                _334 = as_type<int>(_4314);
                _4286 = true;
            }
            else
            {
                bool _4316 = _4260 >= 9.9999999747524270787835121154785e-07;
                bool _4318 = isnan(_4260);
                bool _4320 = _4316 || _4318;
                bool _4322 = isnan(9.9999999747524270787835121154785e-07);
                bool _4324 = _4320 || _4322;
                if (!_4324)
                {
                    float _4326 = _3706 * _3706;
                    float _4328 = fma(_3708, _3708, _4326);
                    float _4330 = fma(_3710, _3710, _4328);
                    float _4332 = sqrt(_4330);
                    bool _4334 = _4332 >= 9.9999999747524270787835121154785e-07;
                    bool _4336 = isnan(_4332);
                    bool _4338 = _4334 || _4336;
                    bool _4340 = isnan(9.9999999747524270787835121154785e-07);
                    bool _4342 = _4338 || _4340;
                    int _4344 = as_type<int>(_272);
                    int _4346 = as_type<int>(_4332);
                    if (_4342)
                    {
                        float _4348 = rsqrt(_4330);
                        _4344 = as_type<int>(_4348);
                    }
                    int _4350 = _4344;
                    if (!_4342)
                    {
                        _4346 = 0;
                    }
                    int _4352 = _4346;
                    int _4354 = _4352;
                    if (!_4342)
                    {
                        _322 = 897988541;
                    }
                    int _4356 = _322;
                    int _4358 = _4350;
                    int _4360 = _4356;
                    if (_4342)
                    {
                        float _4362 = as_type<float>(_4350) * 9.9999999747524270787835121154785e-07;
                        _4274 = _4362;
                    }
                    float _4364 = _4274;
                    if (!_4342)
                    {
                        _4358 = 0;
                    }
                    int _4366 = _4358;
                    int _4368 = _4366;
                    if (_4342)
                    {
                        float _4370 = _3708 * _4364;
                        _4354 = as_type<int>(_4370);
                    }
                    int _4372 = _4354;
                    _330 = _4372;
                    if (_4342)
                    {
                        float _4374 = _3706 * _4364;
                        _4360 = as_type<int>(_4374);
                    }
                    int _4376 = _4360;
                    _332 = _4376;
                    if (_4342)
                    {
                        float _4378 = _3710 * _4364;
                        _4368 = as_type<int>(_4378);
                    }
                    int _4380 = _4368;
                    _334 = _4380;
                    _4286 = true;
                }
                else
                {
                    float _4382 = rsqrt(_4258);
                    float _4384 = _4382 * 9.9999999747524270787835121154785e-07;
                    float _4386 = _524 * _4384;
                    float _4388 = _526 * _4384;
                    float _4390 = _528 * _4384;
                    _330 = as_type<int>(_4386);
                    _332 = as_type<int>(_4388);
                    _334 = as_type<int>(_4390);
                    _4286 = true;
                }
            }
        }
    }
    else
    {
        float _4392 = _4260 * _4246;
        bool _4394 = _4392 >= 0.001000000047497451305389404296875;
        bool _4396 = isnan(_4392);
        bool _4398 = _4394 || _4396;
        bool _4400 = isnan(0.001000000047497451305389404296875);
        bool _4402 = _4398 || _4400;
        bool _4404 = _4392 > 0.0;
        bool _4406 = !_4402;
        bool _4408 = _4404 && _4406;
        bool _4410 = _4262 < 0.001000000047497451305389404296875;
        bool _4412 = _4410 && _4408;
        if (!_4412)
        {
            _324 = as_type<int>(_3926);
        }
        int _4414 = _324;
        int _4416 = _4414;
        if (_4412)
        {
            float _4418 = _524 * _4246;
            _4416 = as_type<int>(_4418);
        }
        int _4420 = _4416;
        _330 = _4420;
        if (!_4412)
        {
            _326 = as_type<int>(_3978);
        }
        int _4422 = _326;
        int _4424 = _4422;
        if (_4412)
        {
            float _4426 = _526 * _4246;
            _4424 = as_type<int>(_4426);
        }
        int _4428 = _4424;
        _332 = _4428;
        if (!_4412)
        {
            _328 = as_type<int>(_3930);
        }
        int _4430 = _328;
        _334 = _4430;
        if (_4412)
        {
            float _4432 = _528 * _4246;
            _334 = as_type<int>(_4432);
        }
    }
    _4286 = false;
    int _4434 = _330;
    int _4436 = _332;
    int _4438 = _334;
    uint _4440 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4440)] = uint(_4434);
    uint _4442 = uint(int(uint(_4222) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4442)] = uint(_4436);
    uint _4444 = uint(int(uint(_4224) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4444)] = uint(_4438);
}

