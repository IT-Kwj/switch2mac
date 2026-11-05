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
    texture3d<float> cp_t_tcb_12 [[id(11)]];
    sampler cp_t_tcb_12Smplr [[id(12)]];
    sampler cp_t_tcb_12Smplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3836 = false;
    bool _3570 = false;
    bool _3094 = false;
    bool _2552 = false;
    bool _1796 = false;
    bool _884 = false;
    float _62 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    int _69 = as_type<int>(_66) << 5;
    int _71 = _69 + as_type<int>(_64);
    float _73 = trunc(_62);
    int _75 = int(_73);
    bool _79 = _71 >= _75;
    int _81 = 0;
    if (_79)
    {
        _81 = 0;
    }
    int _83 = _81;
    int _85 = _83;
    int _87 = _83;
    if (!_79)
    {
        int _89 = _71 << 4;
        int _91 = _89 + 12;
        uint _94 = uint(int(uint(_91) >> uint(2)));
        float _96 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_94)]);
        float _98 = trunc(_96);
        int _100 = int(_98);
        bool _102 = _100 >= 1;
        int _104 = _102 ? (-1) : 0;
        if (!_102)
        {
            _85 = 0;
        }
        int _106 = _85;
        bool _108 = !_102;
        _87 = _106;
        if (!_108)
        {
            float _110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _112 = uint(int(uint(_91) >> uint(2)));
            float _114 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_112)]);
            float _116 = float(_100);
            float _118 = -_114;
            float _120 = _110 + _118;
            bool _122 = _120 > _116;
            int _124 = as_type<int>(_110);
            if (!_122)
            {
                bool _126 = _110 >= _114;
                bool _128 = isnan(_110);
                bool _130 = _126 || _128;
                bool _132 = isnan(_114);
                bool _134 = _130 || _132;
                _104 = _134 ? (-1) : 0;
            }
            int _136 = _104;
            if (_122)
            {
                _124 = 0;
            }
            int _138 = _124;
            _87 = _138;
            if (!_122)
            {
                int _140 = ~_136;
                int _142 = (_140 != 0) ? 0 : 1;
                _87 = _142;
            }
        }
    }
    int _144 = _87;
    int _146 = _144 & 1;
    bool _148 = _146 != 0;
    if (!_148)
    {
        return;
    }
    int _150 = _71 << 4;
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[12]);
    uint _154 = uint(int(uint(_150) >> uint(2)));
    float _156 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_154)]);
    int _158 = _150 + 4;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_160)]);
    int _164 = _150 + 8;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_166)]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[16]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[17]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _180 = _150 + 12;
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[15]);
    uint _184 = uint(int(uint(_150) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_184)]);
    int _188 = _150 + 4;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_190)]);
    int _194 = _150 + 8;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_196)]);
    int _200 = _150 + 12;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_202)]);
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[1]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[2]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    uint _214 = uint(int(uint(_180) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_214)]);
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    uint _224 = uint(int(uint(_150) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_224)]);
    int _228 = _150 + 4;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_230)]);
    int _234 = _150 + 8;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_236)]);
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    uint _244 = uint(int(uint(_180) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_244)]);
    bool _248 = _152 != 1.0;
    bool _250 = isnan(_152);
    bool _252 = _248 || _250;
    bool _254 = isnan(1.0);
    bool _256 = _252 || _254;
    uint _258 = uint(int(uint(_150) >> uint(2)));
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_258)]);
    int _262 = _150 + 4;
    uint _264 = uint(int(uint(_262) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_264)]);
    int _268 = _150 + 8;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_270)]);
    float _274 = _256 ? _162 : 0.3141500055789947509765625;
    float _276 = _256 ? _156 : 0.0;
    float _278 = _256 ? _168 : 0.92653000354766845703125;
    float _280 = _170 * 0.00999999977648258209228515625;
    float _282 = _174 * _274;
    float _284 = _174 * _276;
    float _286 = _174 * _278;
    float _288 = _174 * _280;
    float _290 = _276;
    float _292 = _162;
    float _294 = _284;
    float _296 = _278;
    float _298 = _282;
    float _300 = _286;
    float _302 = _182;
    float _304 = _204;
    float _306 = _238;
    float _308 = _288;
    float _310 = _226;
    float _312 = _288;
    float _314 = _226;
    float _316 = _238;
    float _318 = _210;
    float _320 = _208;
    float _322 = _206;
    int _324 = as_type<int>(_266);
    int _326 = as_type<int>(_266);
    int _328 = as_type<int>(_272);
    int _330 = as_type<int>(_260);
    int _332 = as_type<int>(_266);
    int _334 = as_type<int>(_272);
    if (!_256)
    {
        float _336 = _172 * 0.00999999977648258209228515625;
        float _338 = _178 * _288;
        float _340 = fma(_162, 2.0, -1.0);
        float _342 = _174 * _336;
        float _344 = fma(_156, 2.0, -1.0);
        float _346 = fma(_168, 2.0, -1.0);
        float _348 = fma(_342, _340, _338);
        float _350 = fma(_342, _344, _338);
        float _352 = fma(_342, _346, _338);
        float _354 = _282 + _348;
        float _356 = _284 + _350;
        float _358 = _286 + _352;
        _290 = _342;
        _292 = _340;
        _294 = _356;
        _296 = _352;
        _298 = _354;
        _300 = _358;
    }
    float _360 = _290;
    float _362 = _292;
    float _364 = _294;
    float _366 = _296;
    float _368 = _298;
    float _370 = _300;
    float _372 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[13]);
    float _374 = -_176;
    float _376 = _374 + 1.0;
    float _378 = -_212;
    float _380 = _378 + 1.0;
    float _382 = -_216;
    float _384 = _178 + _382;
    float _386 = _360;
    float _388 = _362;
    float _390 = _384;
    float _392 = _366;
    float _394 = _366;
    float _396 = _364;
    if (_256)
    {
        _386 = 0.0;
    }
    float _398 = _386;
    float _400 = _398;
    if (!_256)
    {
        float _402 = _176 * _288;
        _400 = _402;
    }
    float _404 = _400;
    float _406 = fma(_376, _380, _212);
    float _408 = _220 * _240;
    float _410 = abs(_212);
    float _412 = log2(_410);
    float _414 = _218 * _240;
    bool _416 = _404 != 0.0;
    bool _418 = isnan(_404);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _222 * _240;
    bool _428 = _406 != 1.0;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan(1.0);
    bool _436 = _432 || _434;
    bool _438 = _182 != 1.0;
    bool _440 = isnan(_182);
    bool _442 = _438 || _440;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = !_436;
    bool _450 = _446 || _448;
    float _452 = _376;
    float _454 = _406;
    float _456 = _426;
    float _458 = _426;
    float _460 = _404;
    if (!_450)
    {
        float _462 = abs(_406);
        float _464 = log2(_462);
        _452 = _464;
    }
    float _466 = _452;
    if (!_450)
    {
        float _468 = -_406;
        float _470 = _468 + 1.0;
        _388 = _470;
    }
    float _472 = _388;
    if (!_450)
    {
        float _474 = 1.0 / _472;
        _302 = _474;
    }
    float _476 = _302;
    if (!_450)
    {
        float _478 = _384 * _466;
        _304 = _478;
    }
    float _480 = _304;
    float _482 = _176 * _412;
    float _484 = _176 * _408;
    float _486 = _246 * _176;
    float _488 = _480;
    if (!_450)
    {
        float _490 = exp2(_480);
        _488 = _490;
    }
    float _492 = _488;
    float _494 = exp2(_482);
    if (!_450)
    {
        float _496 = -_492;
        float _498 = _496 + 1.0;
        _454 = _498;
    }
    float _500 = _454;
    float _502 = _176 * _426;
    if (!_450)
    {
        float _504 = _500 * _476;
        _390 = _504;
    }
    float _506 = _390;
    float _508 = _176 * _414;
    int _510 = as_type<int>(_242) & 512;
    bool _512 = _510 != 0;
    float _514 = fma(_232, _486, _192);
    float _516 = _506 + _364;
    float _518 = fma(_232, _494, _484);
    float _520 = fma(_238, _494, _502);
    float _522 = fma(_226, _494, _508);
    float _524 = _176 + _516;
    float _526 = fma(_226, _486, _186);
    float _528 = fma(_238, _486, _198);
    float _530 = _524 + _404;
    bool _532 = _372 != 1.0;
    bool _534 = isnan(_372);
    bool _536 = _532 || _534;
    bool _538 = isnan(1.0);
    bool _540 = _536 || _538;
    bool _542 = _512;
    float _622;
    float _636;
    float _638;
    float _640;
    float _774;
    float _806;
    float _826;
    float _844;
    float _848;
    float _856;
    float _858;
    float _862;
    float _866;
    float _870;
    float _874;
    float _878;
    float _880;
    float _882;
    if (!_424)
    {
        if (_540)
        {
            _306 = 0.60000002384185791015625;
        }
        float _544 = _306;
        float _546 = 0.0;
        if (!_540)
        {
            float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _546 = _548;
        }
        float _550 = _546;
        if (_540)
        {
            _456 = 0.4199999868869781494140625;
        }
        float _552 = _456;
        if (_540)
        {
            _308 = 0.23000000417232513427734375;
        }
        float _554 = _308;
        float _556 = 0.0;
        if (!_540)
        {
            float _558 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _556 = _558;
        }
        float _560 = _556;
        float _562 = _544;
        if (!_540)
        {
            float _564 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _562 = _564;
        }
        float _566 = _562;
        float _568 = _552;
        if (!_540)
        {
            float _570 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _568 = _570;
        }
        float _572 = _568;
        if (_540)
        {
            _392 = 0.1500000059604644775390625;
        }
        float _574 = _392;
        float _576 = _554;
        if (!_540)
        {
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _576 = _578;
        }
        float _580 = _576;
        float _582 = _574;
        if (!_540)
        {
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _582 = _584;
        }
        float _586 = _582;
        float _588 = 0.0;
        if (!_540)
        {
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _588 = _590;
        }
        float _592 = _588;
        float _594 = 0.0;
        if (!_540)
        {
            float _596 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _594 = _596;
        }
        float _598 = _594;
        if (_540)
        {
            _310 = 0.60000002384185791015625;
        }
        float _600 = _310;
        float _602 = _530 * 6.283184051513671875;
        float _604 = _174 * _566;
        float _606 = _600;
        float _608 = _566;
        if (!_540)
        {
            _606 = _566;
        }
        float _610 = _606;
        float _612 = _610;
        if (_540)
        {
            _608 = 0.4199999868869781494140625;
        }
        float _614 = _608;
        float _616 = _174 * _572;
        float _618 = 1.0 / _604;
        float _620 = _614;
        _622 = _550;
        if (!_540)
        {
            _620 = _572;
        }
        float _624 = _620;
        float _626 = _174 * _580;
        float _628 = 1.0 / _616;
        float _630 = _174 * _586;
        float _632 = _174 * _610;
        float _634 = _624;
        _636 = _560;
        _638 = _592;
        _640 = _598;
        if (_540)
        {
            _612 = 0.23000000417232513427734375;
        }
        float _642 = _612;
        float _644 = _174 * _624;
        float _646 = 1.0 / _626;
        float _648 = _642;
        if (!_540)
        {
            _648 = _580;
        }
        float _650 = _648;
        float _652 = _618 * _602;
        if (_540)
        {
            _634 = 0.1500000059604644775390625;
        }
        float _654 = _634;
        float _656 = 1.0 / _644;
        float _658 = _654;
        if (!_540)
        {
            _658 = _586;
        }
        float _660 = _658;
        float _662 = _174 * _650;
        float _664 = _652 * 0.15915493667125701904296875;
        float _666 = 1.0 / _630;
        float _668 = _628 * _602;
        float _670 = 1.0 / _632;
        float _672 = _174 * _660;
        float _674 = _668 * 0.15915493667125701904296875;
        float _676 = _646 * _602;
        float _678 = _516 * _656;
        float _680 = 1.0 / _662;
        float _682 = _676 * 0.15915493667125701904296875;
        float _684 = _666 * _602;
        float _686 = _678 * 6.283184051513671875;
        float _688 = 1.0 / _672;
        float _690 = _684 * 0.15915493667125701904296875;
        float _692 = _516 * _670;
        float _694 = _686 * 0.15915493667125701904296875;
        float _696 = _674 * 6.283185482025146484375;
        float _698 = sin(_696);
        float _700 = _692 * 6.283184051513671875;
        float _702 = _516 * _680;
        float _704 = _680;
        float _706 = _702;
        if (_540)
        {
            _704 = 3.0;
        }
        float _708 = _704;
        float _710 = _700 * 0.15915493667125701904296875;
        float _712 = _694 * 6.283185482025146484375;
        float _714 = sin(_712);
        float _716 = _516 * _688;
        float _718 = _702 * 6.283184051513671875;
        float _720 = _708;
        float _722 = _718;
        if (!_540)
        {
            _720 = _550;
        }
        float _724 = _720;
        float _726 = _716 * 6.283184051513671875;
        float _728 = _664 * 6.283185482025146484375;
        float _730 = sin(_728);
        float _732 = _718 * 0.15915493667125701904296875;
        float _734 = _698 * _724;
        float _736 = _726 * 0.15915493667125701904296875;
        float _738 = _726;
        float _740 = _732;
        float _742 = _734;
        if (_540)
        {
            _706 = 3.0;
        }
        float _744 = _706;
        float _746 = _710 * 6.283185482025146484375;
        float _748 = sin(_746);
        float _750 = _744;
        if (!_540)
        {
            _750 = _550;
        }
        float _752 = _750;
        float _754 = _752;
        if (_540)
        {
            _722 = 4.0;
        }
        float _756 = _722;
        float _758 = _682 * 6.283185482025146484375;
        float _760 = sin(_758);
        float _762 = _756;
        if (!_540)
        {
            _762 = _560;
        }
        float _764 = _762;
        float _766 = _714 * _752;
        float _768 = _732 * 6.283185482025146484375;
        float _770 = sin(_768);
        float _772 = _764;
        _774 = _714;
        if (_540)
        {
            _754 = 4.0;
        }
        float _776 = _754;
        float _778 = _776;
        if (!_540)
        {
            _778 = _560;
        }
        float _780 = _778;
        float _782 = _690 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = fma(_730, _764, _734);
        float _788 = _730;
        float _790 = _786;
        if (_540)
        {
            _738 = 2.0;
        }
        float _792 = _738;
        float _794 = _736 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792;
        if (_540)
        {
            _772 = 2.0;
        }
        float _800 = _772;
        float _802 = fma(_748, _780, _766);
        float _804 = _800;
        _806 = _748;
        if (!_540)
        {
            _798 = _592;
        }
        float _808 = _798;
        if (!_540)
        {
            _804 = _592;
        }
        float _810 = _804;
        float _812 = _810;
        if (_540)
        {
            _740 = 1.5;
        }
        float _814 = _740;
        float _816 = _814;
        if (_540)
        {
            _742 = 1.5;
        }
        float _818 = _742;
        float _820 = fma(_760, _808, _786);
        float _822 = _818;
        float _824 = _820;
        _826 = _760;
        if (!_540)
        {
            _816 = _598;
        }
        float _828 = _816;
        float _830 = fma(_770, _810, _802);
        float _832 = _828;
        if (!_540)
        {
            _822 = _598;
        }
        float _834 = _822;
        float _836 = fma(_784, _828, _820);
        float _838 = fma(_796, _834, _830);
        float _840 = _834;
        float _842 = _796;
        _844 = _836;
        if (_540)
        {
            _824 = 1.5;
        }
        float _846 = _824;
        _848 = _846;
        if (_540)
        {
            _832 = 2.0;
        }
        float _850 = _832;
        float _852 = -_838;
        float _854 = _836 + _852;
        _856 = _850;
        _858 = _854;
        if (_540)
        {
            _840 = 3.0;
        }
        float _860 = _840;
        _862 = _860;
        if (_540)
        {
            _812 = 4.0;
        }
        float _864 = _812;
        _866 = _864;
        if (_540)
        {
            _788 = 0.1500000059604644775390625;
        }
        float _868 = _788;
        _870 = _868;
        if (_540)
        {
            _790 = 0.23000000417232513427734375;
        }
        float _872 = _790;
        _874 = _872;
        if (_540)
        {
            _842 = 0.4199999868869781494140625;
        }
        float _876 = _842;
        _878 = _876;
        _880 = 0.0;
        _882 = 0.0;
        _884 = true;
    }
    else
    {
        if (_540)
        {
            _458 = 0.4199999868869781494140625;
        }
        float _886 = _458;
        float _888 = 0.0;
        if (!_540)
        {
            float _890 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _888 = _890;
        }
        float _892 = _888;
        if (_540)
        {
            _312 = 0.60000002384185791015625;
        }
        float _894 = _312;
        if (_540)
        {
            _394 = 0.23000000417232513427734375;
        }
        float _896 = _394;
        float _898 = 0.0;
        if (!_540)
        {
            float _900 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _898 = _900;
        }
        float _902 = _898;
        float _904 = _886;
        if (!_540)
        {
            float _906 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _904 = _906;
        }
        float _908 = _904;
        float _910 = 0.0;
        if (_540)
        {
            _910 = 0.1500000059604644775390625;
        }
        float _912 = _910;
        float _914 = _894;
        if (!_540)
        {
            float _916 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _914 = _916;
        }
        float _918 = _914;
        float _920 = _896;
        if (!_540)
        {
            float _922 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _920 = _922;
        }
        float _924 = _920;
        float _926 = _912;
        if (!_540)
        {
            float _928 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _926 = _928;
        }
        float _930 = _926;
        float _932 = 0.0;
        if (!_540)
        {
            float _934 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _932 = _934;
        }
        float _936 = _932;
        float _938 = 0.0;
        if (!_540)
        {
            float _940 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _938 = _940;
        }
        float _942 = _938;
        if (_540)
        {
            _314 = 0.4199999868869781494140625;
        }
        float _944 = _314;
        float _946 = _944;
        if (_540)
        {
            _316 = 0.4199999868869781494140625;
        }
        float _948 = _316;
        float _950 = _364 * 6.283184051513671875;
        float _952 = _948;
        float _954 = _908;
        if (!_540)
        {
            _946 = _908;
        }
        float _956 = _946;
        float _958 = _174 * _908;
        float _960 = _956;
        if (!_540)
        {
            _952 = _908;
        }
        float _962 = _952;
        float _964 = 1.0 / _958;
        float _966 = _174 * _956;
        float _968 = _962;
        if (_540)
        {
            _960 = 0.4199999868869781494140625;
        }
        float _970 = _960;
        float _972 = _174 * _924;
        float _974 = _970;
        _622 = _892;
        if (!_540)
        {
            _974 = _908;
        }
        float _976 = _974;
        float _978 = _174 * _918;
        float _980 = _976;
        if (_540)
        {
            _954 = 0.60000002384185791015625;
        }
        float _982 = _954;
        float _984 = _174 * _962;
        float _986 = _982;
        if (_540)
        {
            _968 = 0.60000002384185791015625;
        }
        float _988 = _968;
        float _990 = _988;
        if (!_540)
        {
            _990 = _918;
        }
        float _992 = _990;
        float _994 = _992;
        if (!_540)
        {
            _986 = _918;
        }
        float _996 = _986;
        float _998 = 1.0 / _972;
        float _1000 = _174 * _976;
        float _1002 = _996;
        if (_540)
        {
            _980 = 0.60000002384185791015625;
        }
        float _1004 = _980;
        float _1006 = _174 * _930;
        float _1008 = _1004;
        _636 = _902;
        _638 = _936;
        _640 = _942;
        if (!_540)
        {
            _1008 = _918;
        }
        float _1010 = _1008;
        float _1012 = 1.0 / _978;
        float _1014 = _174 * _992;
        float _1016 = _1010;
        if (_540)
        {
            _994 = 0.23000000417232513427734375;
        }
        float _1018 = _994;
        float _1020 = _1018;
        if (!_540)
        {
            _1020 = _924;
        }
        float _1022 = _1020;
        float _1024 = _174 * _996;
        float _1026 = _1022;
        if (_540)
        {
            _1002 = 0.23000000417232513427734375;
        }
        float _1028 = _1002;
        float _1030 = 1.0 / _1006;
        float _1032 = _1028;
        if (!_540)
        {
            _1032 = _924;
        }
        float _1034 = _1032;
        float _1036 = _530 * 6.283184051513671875;
        float _1038 = 1.0 / _966;
        float _1040 = _174 * _1010;
        float _1042 = _1034;
        if (_540)
        {
            _1016 = 0.23000000417232513427734375;
        }
        float _1044 = _1016;
        float _1046 = _1044;
        if (!_540)
        {
            _1046 = _924;
        }
        float _1048 = _1046;
        float _1050 = 1.0 / _1024;
        float _1052 = _174 * _1022;
        float _1054 = 1.0 / _984;
        float _1056 = _1048;
        if (_540)
        {
            _1026 = 0.1500000059604644775390625;
        }
        float _1058 = _1026;
        float _1060 = _1058;
        if (!_540)
        {
            _1060 = _930;
        }
        float _1062 = _1060;
        float _1064 = 1.0 / _1000;
        float _1066 = _174 * _1034;
        if (_540)
        {
            _1042 = 0.1500000059604644775390625;
        }
        float _1068 = _1042;
        float _1070 = 1.0 / _1052;
        float _1072 = _1068;
        if (!_540)
        {
            _1072 = _930;
        }
        float _1074 = _1072;
        float _1076 = 1.0 / _1014;
        float _1078 = _964 * _1036;
        float _1080 = 1.0 / _1066;
        float _1082 = _174 * _1048;
        if (_540)
        {
            _1056 = 0.1500000059604644775390625;
        }
        float _1084 = _1056;
        float _1086 = _1084;
        if (!_540)
        {
            _1086 = _930;
        }
        float _1088 = _1086;
        float _1090 = _174 * _1062;
        float _1092 = _1078 * 0.15915493667125701904296875;
        float _1094 = _1012 * _1036;
        float _1096 = 1.0 / _1040;
        float _1098 = _174 * _1074;
        float _1100 = _174 * _1088;
        float _1102 = _1094 * 0.15915493667125701904296875;
        float _1104 = _998 * _1036;
        float _1106 = 1.0 / _1090;
        float _1108 = 1.0 / _1098;
        float _1110 = _364 + _404;
        float _1112 = _1110 * 6.283184051513671875;
        float _1114 = _1104 * 0.15915493667125701904296875;
        float _1116 = _1030 * _1036;
        float _1118 = _1116 * 0.15915493667125701904296875;
        float _1120 = _1054 * _1112;
        float _1122 = _1120 * 0.15915493667125701904296875;
        float _1124 = _1064 * _950;
        float _1126 = _1092 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        float _1130 = _1124 * 0.15915493667125701904296875;
        float _1132 = _1076 * _1112;
        float _1134 = 1.0 / _1082;
        float _1136 = _1132 * 0.15915493667125701904296875;
        float _1138 = _1096 * _950;
        float _1140 = _516 * _1038;
        float _1142 = _1138 * 0.15915493667125701904296875;
        float _1144 = _1130 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1138;
        if (_540)
        {
            _1148 = 3.0;
        }
        float _1150 = _1148;
        float _1152 = _1140 * 6.283184051513671875;
        float _1154 = _1150;
        if (!_540)
        {
            _1154 = _892;
        }
        float _1156 = _1154;
        float _1158 = _1152 * 0.15915493667125701904296875;
        float _1160 = _1122 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1128 * _1156;
        float _1166 = _1156;
        float _1168 = _1164;
        if (_540)
        {
            _1166 = 3.0;
        }
        float _1170 = _1166;
        float _1172 = _1070 * _1112;
        float _1174 = _1170;
        float _1176 = _1172;
        if (!_540)
        {
            _1174 = _892;
        }
        float _1178 = _1174;
        float _1180 = 1.0 / _1100;
        float _1182 = _1172 * 0.15915493667125701904296875;
        if (_540)
        {
            _1176 = 3.0;
        }
        float _1184 = _1176;
        float _1186 = _1146 * _1178;
        float _1188 = _1134 * _950;
        float _1190 = _1136 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1184;
        if (!_540)
        {
            _1194 = _892;
        }
        float _1196 = _1194;
        float _1198 = _1188 * 0.15915493667125701904296875;
        float _1200 = _1106 * _1112;
        float _1202 = _516 * _1050;
        float _1204 = _1158 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1200 * 0.15915493667125701904296875;
        float _1210 = _1202 * 6.283184051513671875;
        float _1212 = _1162 * _1196;
        float _1214 = _1142 * 6.283185482025146484375;
        float _1216 = sin(_1214);
        float _1218 = _1196;
        float _1220 = _1202;
        if (_540)
        {
            _1218 = 4.0;
        }
        float _1222 = _1218;
        float _1224 = _1222;
        if (_540)
        {
            _396 = 3.0;
        }
        float _1226 = _396;
        float _1228 = _1226;
        if (!_540)
        {
            _1224 = _902;
        }
        float _1230 = _1224;
        float _1232 = _1102 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        if (!_540)
        {
            _1228 = _892;
        }
        float _1236 = _1228;
        float _1238 = _1236;
        if (_540)
        {
            _1220 = 4.0;
        }
        float _1240 = _1220;
        float _1242 = _1198 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240;
        if (!_540)
        {
            _1246 = _902;
        }
        float _1248 = _1246;
        float _1250 = fma(_1192, _1230, _1212);
        float _1252 = _1206 * _1236;
        float _1254 = _516 * _1080;
        float _1256 = _1210 * 0.15915493667125701904296875;
        float _1258 = _1254;
        if (_540)
        {
            _1238 = 4.0;
        }
        float _1260 = _1238;
        float _1262 = fma(_1216, _1248, _1186);
        float _1264 = _1260;
        if (!_540)
        {
            _1264 = _902;
        }
        float _1266 = _1264;
        float _1268 = _1256 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1254 * 6.283184051513671875;
        float _1274 = _516 * _1108;
        float _1276 = fma(_1234, _1266, _1164);
        float _1278 = _1180 * _950;
        float _1280 = _1272 * 0.15915493667125701904296875;
        float _1282 = _1274 * 6.283184051513671875;
        float _1284 = _1266;
        float _1286 = _1272;
        float _1288 = _1276;
        _880 = _1278;
        if (_540)
        {
            _1284 = 4.0;
        }
        float _1290 = _1284;
        float _1292 = _1114 * 6.283185482025146484375;
        float _1294 = sin(_1292);
        float _1296 = _1278 * 0.15915493667125701904296875;
        float _1298 = _1290;
        if (!_540)
        {
            _1298 = _902;
        }
        float _1300 = _1298;
        float _1302 = _1282 * 0.15915493667125701904296875;
        float _1304 = _1182 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = fma(_1270, _1300, _1252);
        float _1310 = _1280 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1300;
        if (_540)
        {
            _1168 = 2.0;
        }
        float _1316 = _1168;
        float _1318 = _1316;
        if (_540)
        {
            _1258 = 2.0;
        }
        float _1320 = _1258;
        float _1322 = _1320;
        if (_540)
        {
            _1286 = 2.0;
        }
        float _1324 = _1286;
        float _1326 = _1118 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1324;
        if (!_540)
        {
            _1318 = _936;
        }
        float _1332 = _1318;
        float _1334 = _1332;
        if (!_540)
        {
            _1322 = _936;
        }
        float _1336 = _1322;
        float _1338 = _1208 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336;
        if (!_540)
        {
            _1330 = _936;
        }
        float _1344 = _1330;
        float _1346 = _1296 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344;
        if (_540)
        {
            _1314 = 2.0;
        }
        float _1352 = _1314;
        float _1354 = _1302 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        float _1358 = _1352;
        if (!_540)
        {
            _1358 = _936;
        }
        float _1360 = _1358;
        float _1362 = fma(_1294, _1332, _1276);
        float _1364 = fma(_1306, _1336, _1250);
        float _1366 = fma(_1244, _1344, _1262);
        float _1368 = _1362;
        _826 = _1294;
        _882 = _1306;
        if (_540)
        {
            _1288 = 1.5;
        }
        float _1370 = _1288;
        float _1372 = _1370;
        if (_540)
        {
            _1334 = 1.5;
        }
        float _1374 = _1334;
        float _1376 = _1374;
        if (_540)
        {
            _1342 = 1.5;
        }
        float _1378 = _1342;
        float _1380 = _1378;
        if (_540)
        {
            _1350 = 1.5;
        }
        float _1382 = _1350;
        float _1384 = fma(_1312, _1360, _1308);
        float _1386 = _1382;
        float _1388 = _1312;
        _774 = _1348;
        if (!_540)
        {
            _1372 = _942;
        }
        float _1390 = _1372;
        float _1392 = _1390;
        if (!_540)
        {
            _1380 = _942;
        }
        float _1394 = _1380;
        float _1396 = _1394;
        if (!_540)
        {
            _1386 = _942;
        }
        float _1398 = _1386;
        if (!_540)
        {
            _1376 = _942;
        }
        float _1400 = _1376;
        float _1402 = fma(_1328, _1390, _1362);
        float _1404 = fma(_1340, _1394, _1364);
        float _1406 = fma(_1348, _1398, _1366);
        float _1408 = fma(_1356, _1400, _1384);
        float _1410 = -_1404;
        float _1412 = _1410 + _1406;
        float _1414 = -_1408;
        float _1416 = _1402 + _1414;
        float _1418 = _1400;
        float _1420 = _1408;
        _878 = _1356;
        _806 = _1404;
        _844 = _1416;
        if (_540)
        {
            _1418 = 1.5;
        }
        float _1422 = _1418;
        _848 = _1422;
        if (_540)
        {
            _1392 = 2.0;
        }
        float _1424 = _1392;
        float _1426 = _1416 + _1412;
        _856 = _1424;
        _858 = _1426;
        if (_540)
        {
            _1420 = 3.0;
        }
        float _1428 = _1420;
        _862 = _1428;
        if (_540)
        {
            _1396 = 4.0;
        }
        float _1430 = _1396;
        _866 = _1430;
        if (_540)
        {
            _1388 = 0.1500000059604644775390625;
        }
        float _1432 = _1388;
        _870 = _1432;
        if (_540)
        {
            _1368 = 0.23000000417232513427734375;
        }
        float _1434 = _1368;
        _874 = _1434;
        if (_540)
        {
            _878 = 0.4199999868869781494140625;
        }
    }
    _884 = false;
    float _1436 = _878;
    float _1438 = _826;
    float _1440 = _874;
    float _1442 = _806;
    float _1444 = _870;
    float _1446 = _774;
    float _1448 = _880;
    float _1450 = _844;
    float _1452 = _862;
    float _1454 = _622;
    float _1456 = _866;
    float _1458 = _636;
    float _1460 = _856;
    float _1462 = _638;
    float _1464 = _848;
    float _1466 = _640;
    float _1468 = _882;
    float _1470 = _858;
    float _1472 = _506 + _368;
    float _1474 = _176 + _1472;
    float _1476 = _1474 + _404;
    float _1478 = _1438;
    float _1480 = _1442;
    float _1482 = _1446;
    float _1484 = _1448;
    float _1486 = _1450;
    float _1488 = _1442;
    float _1490 = _1446;
    float _1492 = _1448;
    float _1494 = _1468;
    float _1496 = _1438;
    float _1498 = _1450;
    float _1500 = _1472;
    float _1502 = _1436;
    float _1504 = _1440;
    float _1506 = _1444;
    float _1508 = _1460;
    float _1510 = _1452;
    float _1512 = _1456;
    float _1514 = _1464;
    float _1516 = _1436;
    float _1518 = _1440;
    float _1520 = _1444;
    float _1522 = _1464;
    float _1524 = _1460;
    float _1526 = _1452;
    float _1528 = _1456;
    float _1712;
    float _1730;
    float _1748;
    float _1766;
    float _1790;
    float _1792;
    float _1794;
    if (!_424)
    {
        if (_540)
        {
            _1478 = _1436;
        }
        float _1530 = _1478;
        if (_540)
        {
            _1480 = 0.60000002384185791015625;
        }
        float _1532 = _1480;
        float _1534 = _1530;
        if (!_540)
        {
            float _1536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1534 = _1536;
        }
        float _1538 = _1534;
        if (_540)
        {
            _1482 = _1440;
        }
        float _1540 = _1482;
        float _1542 = _1532;
        if (!_540)
        {
            float _1544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1542 = _1544;
        }
        float _1546 = _1542;
        if (_540)
        {
            _1484 = _1444;
        }
        float _1548 = _1484;
        float _1550 = _1540;
        if (!_540)
        {
            float _1552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1550 = _1552;
        }
        float _1554 = _1550;
        float _1556 = _1548;
        if (!_540)
        {
            float _1558 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1556 = _1558;
        }
        float _1560 = _1556;
        if (_540)
        {
            _1486 = _1436;
        }
        float _1562 = _1486;
        float _1564 = _1476 * 6.283184051513671875;
        float _1566 = _174 * _1538;
        float _1568 = _1562;
        float _1570 = _1538;
        if (!_540)
        {
            _1568 = _1538;
        }
        float _1572 = _1568;
        float _1574 = _1572;
        if (_540)
        {
            _1570 = 0.60000002384185791015625;
        }
        float _1576 = _1570;
        float _1578 = 1.0 / _1566;
        float _1580 = _174 * _1546;
        float _1582 = _174 * _1572;
        float _1584 = _1576;
        if (!_540)
        {
            _1584 = _1546;
        }
        float _1586 = _1584;
        float _1588 = _174 * _1554;
        float _1590 = _1586;
        if (_540)
        {
            _1574 = _1440;
        }
        float _1592 = _1574;
        float _1594 = _1592;
        if (!_540)
        {
            _1594 = _1554;
        }
        float _1596 = _1594;
        float _1598 = 1.0 / _1580;
        float _1600 = _174 * _1560;
        float _1602 = _174 * _1586;
        if (_540)
        {
            _1590 = _1444;
        }
        float _1604 = _1590;
        float _1606 = _1604;
        if (!_540)
        {
            _1606 = _1560;
        }
        float _1608 = _1606;
        float _1610 = 1.0 / _1588;
        float _1612 = _1578 * _1564;
        float _1614 = 1.0 / _1582;
        float _1616 = _174 * _1596;
        float _1618 = _1612 * 0.15915493667125701904296875;
        float _1620 = _1598 * _1564;
        float _1622 = 1.0 / _1600;
        float _1624 = 1.0 / _1602;
        float _1626 = _174 * _1608;
        float _1628 = _1620 * 0.15915493667125701904296875;
        float _1630 = _1610 * _1564;
        float _1632 = _1630 * 0.15915493667125701904296875;
        float _1634 = 1.0 / _1616;
        float _1636 = _1472 * _1614;
        float _1638 = _1622 * _1564;
        float _1640 = _1636 * 6.283184051513671875;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = 1.0 / _1626;
        float _1646 = _1472 * _1624;
        float _1648 = _1640 * 0.15915493667125701904296875;
        float _1650 = _1646 * 6.283184051513671875;
        float _1652 = _1472 * _1634;
        float _1654 = _1618 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1650 * 0.15915493667125701904296875;
        float _1660 = _1634;
        float _1662 = _1652;
        if (_540)
        {
            _1660 = _1452;
        }
        float _1664 = _1660;
        float _1666 = _1652 * 6.283184051513671875;
        float _1668 = _1664;
        float _1670 = _1666;
        if (_540)
        {
            _1662 = _1452;
        }
        float _1672 = _1662;
        float _1674 = _1672;
        if (!_540)
        {
            _1668 = _1454;
        }
        float _1676 = _1668;
        float _1678 = _1472 * _1644;
        float _1680 = _1648 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        float _1684 = _1666 * 0.15915493667125701904296875;
        float _1686 = _1676;
        if (!_540)
        {
            _1674 = _1454;
        }
        float _1688 = _1674;
        float _1690 = _1678 * 6.283184051513671875;
        float _1692 = _1690;
        float _1694 = _1688;
        if (_540)
        {
            _1670 = _1456;
        }
        float _1696 = _1670;
        float _1698 = _1696;
        if (!_540)
        {
            _1698 = _1458;
        }
        float _1700 = _1698;
        float _1702 = _1690 * 0.15915493667125701904296875;
        float _1704 = _1628 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1656 * _1676;
        float _1710 = _1700;
        _1712 = _1656;
        if (_540)
        {
            _1686 = _1460;
        }
        float _1714 = _1686;
        float _1716 = _1714;
        if (!_540)
        {
            _1716 = _1462;
        }
        float _1718 = _1716;
        if (_540)
        {
            _1692 = _1464;
        }
        float _1720 = _1692;
        float _1722 = _1658 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1682 * _1688;
        float _1728 = _1720;
        _1730 = _1682;
        if (_540)
        {
            _1694 = _1456;
        }
        float _1732 = _1694;
        float _1734 = _1732;
        if (!_540)
        {
            _1734 = _1458;
        }
        float _1736 = _1734;
        if (!_540)
        {
            _1728 = _1466;
        }
        float _1738 = _1728;
        float _1740 = _1632 * 6.283185482025146484375;
        float _1742 = sin(_1740);
        float _1744 = fma(_1706, _1700, _1708);
        float _1746 = _1706;
        _1748 = _1738;
        if (_540)
        {
            _1710 = _1460;
        }
        float _1750 = _1710;
        float _1752 = _1750;
        if (!_540)
        {
            _1752 = _1462;
        }
        float _1754 = _1752;
        if (_540)
        {
            _1746 = _1464;
        }
        float _1756 = _1746;
        float _1758 = _1684 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = fma(_1724, _1736, _1726);
        float _1764 = _1756;
        _1766 = _1724;
        if (!_540)
        {
            _1764 = _1466;
        }
        float _1768 = _1764;
        float _1770 = _1642 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        float _1774 = fma(_1742, _1718, _1744);
        float _1776 = _1702 * 6.283185482025146484375;
        float _1778 = sin(_1776);
        float _1780 = fma(_1760, _1754, _1762);
        float _1782 = fma(_1772, _1768, _1774);
        float _1784 = fma(_1778, _1738, _1780);
        float _1786 = -_1784;
        float _1788 = _1782 + _1786;
        _1790 = _1768;
        _1792 = _1774;
        _1794 = _1788;
        _1796 = true;
    }
    else
    {
        if (_540)
        {
            _1488 = _1436;
        }
        float _1798 = _1488;
        if (_540)
        {
            _1490 = 0.60000002384185791015625;
        }
        float _1800 = _1490;
        float _1802 = _1798;
        if (!_540)
        {
            float _1804 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1802 = _1804;
        }
        float _1806 = _1802;
        if (_540)
        {
            _1492 = _1440;
        }
        float _1808 = _1492;
        if (_540)
        {
            _1494 = _1444;
        }
        float _1810 = _1494;
        float _1812 = _1800;
        if (!_540)
        {
            float _1814 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1812 = _1814;
        }
        float _1816 = _1812;
        float _1818 = _1808;
        if (!_540)
        {
            float _1820 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1818 = _1820;
        }
        float _1822 = _1818;
        float _1824 = _1810;
        if (!_540)
        {
            float _1826 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1824 = _1826;
        }
        float _1828 = _1824;
        if (_540)
        {
            _1496 = _1436;
        }
        float _1830 = _1496;
        float _1832 = _368 * 6.283184051513671875;
        float _1834 = _1830;
        if (_540)
        {
            _1498 = _1436;
        }
        float _1836 = _1498;
        float _1838 = _1836;
        float _1840 = _1806;
        if (!_540)
        {
            _1834 = _1806;
        }
        float _1842 = _1834;
        float _1844 = _174 * _1806;
        float _1846 = _1842;
        if (!_540)
        {
            _1838 = _1806;
        }
        float _1848 = _1838;
        float _1850 = _174 * _1816;
        float _1852 = _174 * _1842;
        float _1854 = _1848;
        if (_540)
        {
            _1846 = _1436;
        }
        float _1856 = _1846;
        float _1858 = 1.0 / _1844;
        float _1860 = _1856;
        if (!_540)
        {
            _1860 = _1806;
        }
        float _1862 = _1860;
        float _1864 = _174 * _1822;
        float _1866 = _1862;
        if (_540)
        {
            _1840 = 0.60000002384185791015625;
        }
        float _1868 = _1840;
        float _1870 = _174 * _1828;
        float _1872 = _174 * _1862;
        float _1874 = _1868;
        if (_540)
        {
            _1866 = 0.60000002384185791015625;
        }
        float _1876 = _1866;
        float _1878 = 1.0 / _1850;
        float _1880 = _174 * _1848;
        float _1882 = _1876;
        if (_540)
        {
            _1854 = 0.60000002384185791015625;
        }
        float _1884 = _1854;
        float _1886 = _1884;
        if (!_540)
        {
            _1874 = _1816;
        }
        float _1888 = _1874;
        float _1890 = _1888;
        if (!_540)
        {
            _1886 = _1816;
        }
        float _1892 = _1886;
        float _1894 = _1892;
        if (!_540)
        {
            _1882 = _1816;
        }
        float _1896 = _1882;
        float _1898 = 1.0 / _1864;
        float _1900 = _174 * _1888;
        float _1902 = _1896;
        if (_540)
        {
            _1890 = _1440;
        }
        float _1904 = _1890;
        float _1906 = _1904;
        if (!_540)
        {
            _1906 = _1822;
        }
        float _1908 = _1906;
        float _1910 = 1.0 / _1870;
        float _1912 = _174 * _1892;
        float _1914 = _1908;
        if (_540)
        {
            _1894 = _1440;
        }
        float _1916 = _1894;
        float _1918 = _1916;
        if (!_540)
        {
            _1918 = _1822;
        }
        float _1920 = _1918;
        float _1922 = 1.0 / _1880;
        float _1924 = _174 * _1896;
        float _1926 = _1920;
        if (_540)
        {
            _1902 = _1440;
        }
        float _1928 = _1902;
        float _1930 = _174 * _1920;
        float _1932 = _1928;
        if (!_540)
        {
            _1932 = _1822;
        }
        float _1934 = _1932;
        float _1936 = _1934;
        if (_540)
        {
            _1926 = _1444;
        }
        float _1938 = _1926;
        float _1940 = _1938;
        if (!_540)
        {
            _1940 = _1828;
        }
        float _1942 = _1940;
        float _1944 = _174 * _1908;
        float _1946 = _174 * _1934;
        if (_540)
        {
            _1914 = _1444;
        }
        float _1948 = _1914;
        float _1950 = 1.0 / _1900;
        float _1952 = _1948;
        if (_540)
        {
            _1936 = _1444;
        }
        float _1954 = _1936;
        float _1956 = _174 * _1942;
        float _1958 = _1954;
        if (!_540)
        {
            _1952 = _1828;
        }
        float _1960 = _1952;
        if (!_540)
        {
            _1958 = _1828;
        }
        float _1962 = _1958;
        float _1964 = _1476 * 6.283184051513671875;
        float _1966 = 1.0 / _1944;
        float _1968 = 1.0 / _1872;
        float _1970 = _1858 * _1964;
        float _1972 = 1.0 / _1852;
        float _1974 = _1472 * _1966;
        float _1976 = 1.0 / _1930;
        float _1978 = 1.0 / _1912;
        float _1980 = _174 * _1962;
        float _1982 = _1970 * 0.15915493667125701904296875;
        float _1984 = _1878 * _1964;
        float _1986 = 1.0 / _1956;
        float _1988 = _174 * _1960;
        float _1990 = 1.0 / _1988;
        float _1992 = _368 + _404;
        float _1994 = _1968 * _1832;
        float _1996 = _1994 * 0.15915493667125701904296875;
        float _1998 = 1.0 / _1924;
        float _2000 = _1984 * 0.15915493667125701904296875;
        float _2002 = _1898 * _1964;
        float _2004 = _2002 * 0.15915493667125701904296875;
        float _2006 = _1910 * _1964;
        float _2008 = _1992 * 6.283184051513671875;
        float _2010 = 1.0 / _1980;
        float _2012 = _2006 * 0.15915493667125701904296875;
        float _2014 = _1922 * _2008;
        float _2016 = _1978 * _2008;
        float _2018 = _1982 * 6.283185482025146484375;
        float _2020 = sin(_2018);
        float _2022 = _2014 * 0.15915493667125701904296875;
        float _2024 = _1472 * _1972;
        float _2026 = _2016 * 0.15915493667125701904296875;
        float _2028 = _1998 * _1832;
        float _2030 = _2024 * 6.283184051513671875;
        float _2032 = 1.0 / _1946;
        float _2034 = _2028 * 0.15915493667125701904296875;
        float _2036 = _2030 * 0.15915493667125701904296875;
        float _2038 = _2028;
        float _2040 = _1974;
        if (_540)
        {
            _2038 = _1452;
        }
        float _2042 = _2038;
        float _2044 = _1976 * _2008;
        float _2046 = _2042;
        float _2048 = _2044;
        if (!_540)
        {
            _2046 = _1454;
        }
        float _2050 = _2046;
        float _2052 = _1996 * 6.283185482025146484375;
        float _2054 = sin(_2052);
        float _2056 = _2044 * 0.15915493667125701904296875;
        float _2058 = _2020 * _2050;
        float _2060 = _2050;
        float _2062 = _2020;
        if (_540)
        {
            _2060 = _1452;
        }
        float _2064 = _2060;
        float _2066 = _2064;
        if (!_540)
        {
            _2066 = _1454;
        }
        float _2068 = _2066;
        if (_540)
        {
            _2048 = _1452;
        }
        float _2070 = _2048;
        float _2072 = _2022 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = _2032 * _1832;
        float _2078 = _2070;
        if (_540)
        {
            _2062 = _1452;
        }
        float _2080 = _2062;
        float _2082 = _2080;
        if (!_540)
        {
            _2078 = _1454;
        }
        float _2084 = _2078;
        float _2086 = _2076 * 0.15915493667125701904296875;
        float _2088 = _1986 * _2008;
        float _2090 = _2084;
        if (!_540)
        {
            _2082 = _1454;
        }
        float _2092 = _2082;
        float _2094 = _2036 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        float _2098 = _2054 * _2068;
        float _2100 = _1472 * _1950;
        float _2102 = _2088 * 0.15915493667125701904296875;
        float _2104 = _2000 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2074 * _2084;
        float _2110 = _2100 * 6.283184051513671875;
        float _2112 = _2100;
        float _2114 = _2092;
        if (_540)
        {
            _2112 = _1456;
        }
        float _2116 = _2112;
        float _2118 = _2116;
        if (!_540)
        {
            _2118 = _1458;
        }
        float _2120 = _2118;
        if (_540)
        {
            _2090 = _1456;
        }
        float _2122 = _2090;
        float _2124 = _2034 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = _2096 * _2092;
        float _2130 = _2122;
        if (_540)
        {
            _2114 = _1456;
        }
        float _2132 = _2114;
        float _2134 = _2110 * 0.15915493667125701904296875;
        float _2136 = _2132;
        if (!_540)
        {
            _2136 = _1458;
        }
        float _2138 = _2136;
        float _2140 = _2010 * _1832;
        if (!_540)
        {
            _2130 = _1458;
        }
        float _2142 = _2130;
        float _2144 = _2026 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = fma(_2106, _2138, _2058);
        float _2150 = _1472 * _1990;
        float _2152 = _2140 * 0.15915493667125701904296875;
        float _2154 = _2142;
        if (_540)
        {
            _1500 = _1456;
        }
        float _2156 = _1500;
        float _2158 = _2150 * 6.283184051513671875;
        float _2160 = _2156;
        float _2162 = _2158;
        if (!_540)
        {
            _2160 = _1458;
        }
        float _2164 = _2160;
        float _2166 = fma(_2126, _2120, _2098);
        float _2168 = _1974 * 6.283184051513671875;
        float _2170 = _2134 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        float _2174 = _2158 * 0.15915493667125701904296875;
        float _2176 = _2168;
        float _2178 = _2164;
        if (_540)
        {
            _2040 = _1460;
        }
        float _2180 = _2040;
        float _2182 = _2180;
        if (!_540)
        {
            _2182 = _1462;
        }
        float _2184 = _2182;
        float _2186 = fma(_2146, _2142, _2108);
        float _2188 = _2168 * 0.15915493667125701904296875;
        float _2190 = _2004 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = _2184;
        if (_540)
        {
            _2154 = _1460;
        }
        float _2196 = _2154;
        float _2198 = _2196;
        if (_540)
        {
            _2176 = _1460;
        }
        float _2200 = _2176;
        float _2202 = _2200;
        if (!_540)
        {
            _2198 = _1462;
        }
        float _2204 = _2198;
        float _2206 = _2204;
        if (!_540)
        {
            _2202 = _1462;
        }
        float _2208 = _2202;
        float _2210 = _2056 * 6.283185482025146484375;
        float _2212 = sin(_2210);
        float _2214 = fma(_2172, _2164, _2128);
        float _2216 = _2208;
        _1730 = _2214;
        if (_540)
        {
            _2178 = _1460;
        }
        float _2218 = _2178;
        float _2220 = _2218;
        if (!_540)
        {
            _2220 = _1462;
        }
        float _2222 = _2220;
        _1748 = _2222;
        if (_540)
        {
            _2162 = _1464;
        }
        float _2224 = _2162;
        float _2226 = _2086 * 6.283185482025146484375;
        float _2228 = sin(_2226);
        float _2230 = fma(_2192, _2204, _2148);
        float _2232 = _2224;
        _1792 = _2230;
        if (_540)
        {
            _2206 = _1464;
        }
        float _2234 = _2206;
        float _2236 = _2234;
        if (!_540)
        {
            _2232 = _1466;
        }
        float _2238 = _2232;
        _1790 = _2238;
        if (!_540)
        {
            _2236 = _1466;
        }
        float _2240 = _2236;
        float _2242 = _2188 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = fma(_2212, _2184, _2186);
        if (_540)
        {
            _2194 = _1464;
        }
        float _2248 = _2194;
        float _2250 = _2248;
        if (!_540)
        {
            _2250 = _1466;
        }
        float _2252 = _2250;
        float _2254 = _2012 * 6.283185482025146484375;
        float _2256 = sin(_2254);
        float _2258 = fma(_2228, _2208, _2166);
        if (_540)
        {
            _2216 = _1464;
        }
        float _2260 = _2216;
        float _2262 = _2260;
        if (!_540)
        {
            _2262 = _1466;
        }
        float _2264 = _2262;
        float _2266 = _2102 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = fma(_2244, _2222, _2214);
        float _2272 = _2152 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = fma(_2256, _2238, _2230);
        float _2278 = _2174 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = fma(_2268, _2252, _2246);
        float _2284 = fma(_2274, _2264, _2258);
        float _2286 = -_2282;
        float _2288 = _2286 + _2284;
        float _2290 = fma(_2280, _2240, _2270);
        float _2292 = -_2290;
        float _2294 = _2276 + _2292;
        float _2296 = _2294 + _2288;
        _1712 = _2290;
        _1766 = _2288;
        _1794 = _2296;
    }
    _1796 = false;
    float _2298 = _1748;
    float _2300 = _1790;
    float _2302 = _1712;
    float _2304 = _1792;
    float _2306 = _1766;
    float _2308 = _1730;
    float _2310 = _1794;
    float _2312 = _506 + _370;
    float _2314 = _176 + _2312;
    float _2316 = _2314 + _404;
    float _2318 = _2298;
    float _2320 = _2300;
    float _2322 = _2302;
    float _2324 = _2304;
    float _2326 = _2302;
    float _2328 = _2306;
    float _2330 = _2308;
    float _2332 = _2300;
    float _2334 = _2298;
    float _2336 = _2312;
    float _2550;
    if (!_424)
    {
        if (_540)
        {
            _460 = _1436;
        }
        float _2338 = _460;
        if (_540)
        {
            _2318 = 0.60000002384185791015625;
        }
        float _2340 = _2318;
        float _2342 = _2338;
        if (!_540)
        {
            float _2344 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2342 = _2344;
        }
        float _2346 = _2342;
        if (_540)
        {
            _2320 = _1440;
        }
        float _2348 = _2320;
        float _2350 = _2340;
        if (!_540)
        {
            float _2352 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2350 = _2352;
        }
        float _2354 = _2350;
        if (_540)
        {
            _2322 = _1444;
        }
        float _2356 = _2322;
        float _2358 = _2348;
        if (!_540)
        {
            float _2360 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2358 = _2360;
        }
        float _2362 = _2358;
        float _2364 = _2356;
        if (!_540)
        {
            float _2366 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2364 = _2366;
        }
        float _2368 = _2364;
        float _2370 = _2316 * 6.283184051513671875;
        float _2372 = _174 * _2346;
        float _2374 = _2346;
        if (!_540)
        {
            _1502 = _2346;
        }
        float _2376 = _1502;
        if (_540)
        {
            _2374 = 0.60000002384185791015625;
        }
        float _2378 = _2374;
        float _2380 = _174 * _2354;
        float _2382 = _2378;
        if (!_540)
        {
            _2382 = _2354;
        }
        float _2384 = _2382;
        float _2386 = 1.0 / _2372;
        float _2388 = _174 * _2376;
        float _2390 = _174 * _2362;
        if (!_540)
        {
            _1504 = _2362;
        }
        float _2392 = _1504;
        float _2394 = _174 * _2384;
        float _2396 = _174 * _2368;
        if (!_540)
        {
            _1506 = _2368;
        }
        float _2398 = _1506;
        float _2400 = 1.0 / _2380;
        float _2402 = _174 * _2392;
        float _2404 = _174 * _2398;
        float _2406 = 1.0 / _2390;
        float _2408 = _2386 * _2370;
        float _2410 = 1.0 / _2396;
        float _2412 = 1.0 / _2388;
        float _2414 = 1.0 / _2394;
        float _2416 = _2408 * 0.15915493667125701904296875;
        float _2418 = _2400 * _2370;
        float _2420 = _2418 * 0.15915493667125701904296875;
        float _2422 = _2406 * _2370;
        float _2424 = 1.0 / _2402;
        float _2426 = _2312 * _2412;
        float _2428 = _2422 * 0.15915493667125701904296875;
        float _2430 = _2410 * _2370;
        float _2432 = _2426 * 6.283184051513671875;
        float _2434 = 1.0 / _2404;
        float _2436 = _2430 * 0.15915493667125701904296875;
        float _2438 = _2312 * _2414;
        float _2440 = _2432 * 0.15915493667125701904296875;
        float _2442 = _2432;
        if (_540)
        {
            _2442 = _1460;
        }
        float _2444 = _2442;
        float _2446 = _2444;
        if (!_540)
        {
            _2446 = _1462;
        }
        float _2448 = _2446;
        float _2450 = _2416 * 6.283185482025146484375;
        float _2452 = sin(_2450);
        float _2454 = _2438 * 6.283184051513671875;
        float _2456 = _2312 * _2424;
        float _2458 = _2454;
        if (!_540)
        {
            _1508 = _1462;
        }
        float _2460 = _1508;
        float _2462 = _2454 * 0.15915493667125701904296875;
        float _2464 = _2456 * 6.283184051513671875;
        float _2466 = _2464;
        if (_540)
        {
            _2458 = _1452;
        }
        float _2468 = _2458;
        float _2470 = _2312 * _2434;
        float _2472 = _2440 * 6.283185482025146484375;
        float _2474 = sin(_2472);
        float _2476 = _2464 * 0.15915493667125701904296875;
        float _2478 = _2468;
        if (!_540)
        {
            _2478 = _1454;
        }
        float _2480 = _2478;
        float _2482 = _2470 * 6.283184051513671875;
        float _2484 = _2480;
        if (!_540)
        {
            _1510 = _1454;
        }
        float _2486 = _1510;
        if (_540)
        {
            _2466 = _1456;
        }
        float _2488 = _2466;
        float _2490 = _2482 * 0.15915493667125701904296875;
        float _2492 = _2420 * 6.283185482025146484375;
        float _2494 = sin(_2492);
        float _2496 = _2488;
        if (!_540)
        {
            _2496 = _1458;
        }
        float _2498 = _2496;
        float _2500 = _2452 * _2480;
        if (!_540)
        {
            _1512 = _1458;
        }
        float _2502 = _1512;
        if (_540)
        {
            _2484 = _1464;
        }
        float _2504 = _2484;
        float _2506 = _2504;
        if (!_540)
        {
            _2506 = _1466;
        }
        float _2508 = _2506;
        float _2510 = _2462 * 6.283185482025146484375;
        float _2512 = sin(_2510);
        float _2514 = _2474 * _2486;
        if (!_540)
        {
            _1514 = _1466;
        }
        float _2516 = _1514;
        float _2518 = _2428 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        float _2522 = fma(_2494, _2498, _2500);
        float _2524 = _2476 * 6.283185482025146484375;
        float _2526 = sin(_2524);
        float _2528 = fma(_2512, _2502, _2514);
        float _2530 = _2436 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = fma(_2520, _2448, _2522);
        float _2536 = _2490 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        float _2540 = fma(_2526, _2460, _2528);
        float _2542 = fma(_2532, _2508, _2534);
        float _2544 = fma(_2538, _2516, _2540);
        float _2546 = -_2544;
        float _2548 = _2542 + _2546;
        _2550 = _2548;
        _2552 = true;
    }
    else
    {
        if (_540)
        {
            _2324 = _1436;
        }
        float _2554 = _2324;
        if (_540)
        {
            _2326 = 0.60000002384185791015625;
        }
        float _2556 = _2326;
        if (_540)
        {
            _2328 = _1440;
        }
        float _2558 = _2328;
        float _2560 = _2554;
        if (!_540)
        {
            float _2562 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2560 = _2562;
        }
        float _2564 = _2560;
        float _2566 = _2556;
        if (!_540)
        {
            float _2568 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2566 = _2568;
        }
        float _2570 = _2566;
        float _2572 = _2558;
        if (!_540)
        {
            float _2574 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2572 = _2574;
        }
        float _2576 = _2572;
        if (_540)
        {
            _2330 = _1444;
        }
        float _2578 = _2330;
        float _2580 = _2578;
        if (!_540)
        {
            float _2582 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2580 = _2582;
        }
        float _2584 = _2580;
        if (_540)
        {
            _2332 = _1436;
        }
        float _2586 = _2332;
        float _2588 = _2316 * 6.283184051513671875;
        float _2590 = _2586;
        if (_540)
        {
            _2334 = _1436;
        }
        float _2592 = _2334;
        float _2594 = _370 + _404;
        float _2596 = _2592;
        if (!_540)
        {
            _2596 = _2564;
        }
        float _2598 = _2596;
        float _2600 = _174 * _2564;
        float _2602 = _2598;
        if (!_540)
        {
            _1516 = _2564;
        }
        float _2604 = _1516;
        float _2606 = _174 * _2570;
        float _2608 = _2604;
        if (!_540)
        {
            _2590 = _2564;
        }
        float _2610 = _2590;
        float _2612 = 1.0 / _2600;
        float _2614 = _174 * _2604;
        float _2616 = _2610;
        if (_540)
        {
            _2608 = 0.60000002384185791015625;
        }
        float _2618 = _2608;
        float _2620 = _174 * _2576;
        float _2622 = _174 * _2610;
        float _2624 = _2618;
        if (!_540)
        {
            _2624 = _2570;
        }
        float _2626 = _2624;
        float _2628 = _2626;
        if (_540)
        {
            _2616 = 0.60000002384185791015625;
        }
        float _2630 = _2616;
        float _2632 = 1.0 / _2606;
        float _2634 = _2630;
        if (!_540)
        {
            _2634 = _2570;
        }
        float _2636 = _2634;
        float _2638 = _174 * _2584;
        float _2640 = _174 * _2636;
        float _2642 = 1.0 / _2620;
        float _2644 = _174 * _2598;
        if (_540)
        {
            _2602 = 0.60000002384185791015625;
        }
        float _2646 = _2602;
        float _2648 = _2646;
        if (!_540)
        {
            _2648 = _2570;
        }
        float _2650 = _2648;
        float _2652 = _174 * _2626;
        float _2654 = _2650;
        if (_540)
        {
            _2628 = _1440;
        }
        float _2656 = _2628;
        float _2658 = _2656;
        if (!_540)
        {
            _2658 = _2576;
        }
        float _2660 = _2658;
        float _2662 = _174 * _2650;
        float _2664 = _2660;
        if (_540)
        {
            _2654 = _1440;
        }
        float _2666 = _2654;
        float _2668 = 1.0 / _2644;
        float _2670 = _2666;
        if (!_540)
        {
            _2670 = _2576;
        }
        float _2672 = _2670;
        float _2674 = _2672;
        if (!_540)
        {
            _1518 = _2576;
        }
        float _2676 = _1518;
        float _2678 = 1.0 / _2640;
        float _2680 = _174 * _2672;
        if (_540)
        {
            _2674 = _1444;
        }
        float _2682 = _2674;
        float _2684 = _2682;
        if (!_540)
        {
            _2684 = _2584;
        }
        float _2686 = _2684;
        float _2688 = 1.0 / _2662;
        float _2690 = _174 * _2660;
        float _2692 = _2686;
        if (_540)
        {
            _2664 = _1444;
        }
        float _2694 = _2664;
        float _2696 = _2694;
        if (!_540)
        {
            _2696 = _2584;
        }
        float _2698 = _2696;
        if (!_540)
        {
            _1520 = _2584;
        }
        float _2700 = _1520;
        float _2702 = 1.0 / _2638;
        float _2704 = _174 * _2676;
        float _2706 = _174 * _2686;
        float _2708 = _174 * _2698;
        float _2710 = _174 * _2700;
        float _2712 = _2612 * _2588;
        float _2714 = _2710;
        if (_540)
        {
            _2692 = _1464;
        }
        float _2716 = _2692;
        float _2718 = 1.0 / _2614;
        float _2720 = _2716;
        if (!_540)
        {
            _2720 = _1466;
        }
        float _2722 = _2720;
        float _2724 = 1.0 / _2652;
        float _2726 = _2712 * 0.15915493667125701904296875;
        float _2728 = _2632 * _2588;
        float _2730 = 1.0 / _2706;
        float _2732 = _2728 * 0.15915493667125701904296875;
        float _2734 = _2642 * _2588;
        float _2736 = 1.0 / _2622;
        float _2738 = _2594 * 6.283184051513671875;
        float _2740 = _370 * 6.283184051513671875;
        float _2742 = _2718 * _2740;
        float _2744 = 1.0 / _2690;
        float _2746 = _2734 * 0.15915493667125701904296875;
        float _2748 = _2702 * _2588;
        float _2750 = _2748 * 0.15915493667125701904296875;
        float _2752 = _2668 * _2738;
        float _2754 = 1.0 / _2708;
        float _2756 = _2742 * 0.15915493667125701904296875;
        float _2758 = _2688 * _2738;
        float _2760 = _2312 * _2736;
        float _2762 = _2752 * 0.15915493667125701904296875;
        float _2764 = _2758 * 0.15915493667125701904296875;
        float _2766 = _2724 * _2740;
        float _2768 = 1.0 / _2680;
        float _2770 = _2760 * 6.283184051513671875;
        float _2772 = _2766 * 0.15915493667125701904296875;
        float _2774 = _2744 * _2738;
        float _2776 = _2770 * 0.15915493667125701904296875;
        float _2778 = _2744;
        float _2780 = _2738;
        float _2782 = _2740;
        if (_540)
        {
            _2778 = _1460;
        }
        float _2784 = _2778;
        float _2786 = 1.0 / _2710;
        float _2788 = _2774 * 0.15915493667125701904296875;
        float _2790 = _2754 * _2738;
        float _2792 = _2754;
        float _2794 = _2784;
        if (_540)
        {
            _2780 = _1452;
        }
        float _2796 = _2780;
        float _2798 = _2796;
        if (!_540)
        {
            _2798 = _1454;
        }
        float _2800 = _2798;
        float _2802 = _2790 * 0.15915493667125701904296875;
        if (_540)
        {
            _2792 = _1460;
        }
        float _2804 = _2792;
        float _2806 = 1.0 / _2704;
        float _2808 = _2804;
        if (_540)
        {
            _2714 = _1464;
        }
        float _2810 = _2714;
        float _2812 = _2810;
        if (!_540)
        {
            _2812 = _1466;
        }
        float _2814 = _2812;
        if (!_540)
        {
            _2794 = _1462;
        }
        float _2816 = _2794;
        if (!_540)
        {
            _2808 = _1462;
        }
        float _2818 = _2808;
        float _2820 = _2786 * _2740;
        float _2822 = _2762 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        float _2826 = _2786;
        if (_540)
        {
            _2826 = _1452;
        }
        float _2828 = _2826;
        float _2830 = _2820 * 0.15915493667125701904296875;
        float _2832 = _2312 * _2678;
        float _2834 = _2828;
        if (!_540)
        {
            _2834 = _1454;
        }
        float _2836 = _2834;
        float _2838 = _2832 * 6.283184051513671875;
        float _2840 = _2806 * _2740;
        float _2842 = _2312 * _2768;
        float _2844 = _2806;
        if (_540)
        {
            _2844 = _1464;
        }
        float _2846 = _2844;
        float _2848 = _2726 * 6.283185482025146484375;
        float _2850 = sin(_2848);
        float _2852 = _2840 * 0.15915493667125701904296875;
        float _2854 = _2846;
        float _2856 = _2852;
        if (!_540)
        {
            _2854 = _1466;
        }
        float _2858 = _2854;
        if (!_540)
        {
            _1522 = _1466;
        }
        float _2860 = _1522;
        float _2862 = _2838 * 0.15915493667125701904296875;
        float _2864 = _2842 * 6.283184051513671875;
        float _2866 = _2312 * _2730;
        float _2868 = _2852 * 6.283185482025146484375;
        float _2870 = sin(_2868);
        float _2872 = _2864;
        float _2874 = _2866;
        if (_540)
        {
            _2782 = _1460;
        }
        float _2876 = _2782;
        float _2878 = _2876;
        if (!_540)
        {
            _2878 = _1462;
        }
        float _2880 = _2878;
        if (!_540)
        {
            _1524 = _1462;
        }
        float _2882 = _1524;
        float _2884 = _2866 * 6.283184051513671875;
        if (_540)
        {
            _2336 = _1456;
        }
        float _2886 = _2336;
        float _2888 = _2756 * 6.283185482025146484375;
        float _2890 = sin(_2888);
        float _2892 = _2886;
        if (_540)
        {
            _2856 = _1452;
        }
        float _2894 = _2856;
        float _2896 = _2884 * 0.15915493667125701904296875;
        float _2898 = _2894;
        if (!_540)
        {
            _2898 = _1454;
        }
        float _2900 = _2898;
        float _2902 = _2850 * _2836;
        if (!_540)
        {
            _1526 = _1454;
        }
        float _2904 = _1526;
        float _2906 = _2864 * 0.15915493667125701904296875;
        if (_540)
        {
            _2872 = _1456;
        }
        float _2908 = _2872;
        float _2910 = _2776 * 6.283185482025146484375;
        float _2912 = sin(_2910);
        float _2914 = _2908;
        if (_540)
        {
            _2874 = _1456;
        }
        float _2916 = _2874;
        float _2918 = _2824 * _2900;
        float _2920 = _2916;
        if (!_540)
        {
            _2914 = _1458;
        }
        float _2922 = _2914;
        if (!_540)
        {
            _2892 = _1458;
        }
        float _2924 = _2892;
        if (!_540)
        {
            _2920 = _1458;
        }
        float _2926 = _2920;
        float _2928 = _2732 * 6.283185482025146484375;
        float _2930 = sin(_2928);
        if (!_540)
        {
            _1528 = _1458;
        }
        float _2932 = _1528;
        float _2934 = _2890 * _2904;
        float _2936 = _2764 * 6.283185482025146484375;
        float _2938 = sin(_2936);
        float _2940 = _2912 * _2800;
        float _2942 = _2772 * 6.283185482025146484375;
        float _2944 = sin(_2942);
        float _2946 = fma(_2930, _2922, _2902);
        float _2948 = _2862 * 6.283185482025146484375;
        float _2950 = sin(_2948);
        float _2952 = fma(_2938, _2926, _2918);
        float _2954 = _2746 * 6.283185482025146484375;
        float _2956 = sin(_2954);
        float _2958 = fma(_2944, _2932, _2934);
        float _2960 = fma(_2870, _2882, _2958);
        float _2962 = _2788 * 6.283185482025146484375;
        float _2964 = sin(_2962);
        float _2966 = fma(_2950, _2924, _2940);
        float _2968 = _2906 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        float _2972 = fma(_2956, _2816, _2946);
        float _2974 = _2750 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = fma(_2964, _2880, _2952);
        float _2980 = _2802 * 6.283185482025146484375;
        float _2982 = sin(_2980);
        float _2984 = fma(_2970, _2818, _2966);
        float _2986 = _2830 * 6.283185482025146484375;
        float _2988 = sin(_2986);
        float _2990 = fma(_2976, _2858, _2972);
        float _2992 = _2896 * 6.283185482025146484375;
        float _2994 = sin(_2992);
        float _2996 = fma(_2982, _2814, _2978);
        float _2998 = fma(_2988, _2860, _2960);
        float _3000 = -_2996;
        float _3002 = _3000 + _2998;
        float _3004 = fma(_2994, _2722, _2984);
        float _3006 = -_3004;
        float _3008 = _2990 + _3006;
        float _3010 = _3008 + _3002;
        _2550 = _3010;
    }
    _2552 = false;
    float _3012 = _2550;
    float _3014 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _3016 = fma(_206, _1470, _526);
    float _3018 = fma(_208, _2310, _514);
    float _3020 = fma(_210, _3012, _528);
    bool _3022 = _3014 > 0.0;
    if (!_3022)
    {
        _318 = _3016;
    }
    float _3024 = _318;
    float _3026 = _3024;
    float _3028 = _3024;
    if (!_3022)
    {
        _320 = _3018;
    }
    float _3030 = _320;
    float _3032 = _3030;
    float _3034 = _3030;
    if (!_3022)
    {
        _322 = _3020;
    }
    float _3036 = _322;
    bool _3038 = !_3022;
    float _3040 = _3036;
    float _3042 = _3036;
    if (!_3038)
    {
        bool _3044 = !_512;
        if (!_3044)
        {
            float _3046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _3054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3068 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3070 = _3018 * _3048;
            float _3072 = _3018 * _3056;
            float _3074 = fma(_3016, _3046, _3070);
            float _3076 = _3018 * _3064;
            float _3078 = fma(_3016, _3054, _3072);
            float _3080 = fma(_3020, _3050, _3074);
            float _3082 = fma(_3016, _3062, _3076);
            float _3084 = fma(_3020, _3058, _3078);
            float _3086 = _3052 + _3080;
            float _3088 = fma(_3020, _3066, _3082);
            float _3090 = _3060 + _3084;
            float _3092 = _3068 + _3088;
            _3028 = _3086;
            _3042 = _3092;
            _3034 = _3090;
            _3094 = true;
        }
        else
        {
            int _3096 = as_type<int>(_242) & 1024;
            bool _3098 = _3096 != 0;
            bool _3100 = !_3098;
            if (!_3100)
            {
                float _3102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _3104 = uint(int(uint(_150) >> uint(2)));
                float _3106 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3104)]);
                int _3108 = _150 + 4;
                uint _3110 = uint(int(uint(_3108) >> uint(2)));
                float _3112 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3110)]);
                int _3114 = _150 + 8;
                uint _3116 = uint(int(uint(_3114) >> uint(2)));
                float _3118 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3116)]);
                uint _3120 = uint(int(uint(_150) >> uint(2)));
                float _3122 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3120)]);
                int _3124 = _150 + 4;
                uint _3126 = uint(int(uint(_3124) >> uint(2)));
                float _3128 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3126)]);
                int _3130 = _150 + 8;
                uint _3132 = uint(int(uint(_3130) >> uint(2)));
                float _3134 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3132)]);
                uint _3136 = uint(int(uint(_150) >> uint(2)));
                float _3138 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3136)]);
                int _3140 = _150 + 4;
                uint _3142 = uint(int(uint(_3140) >> uint(2)));
                float _3144 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3142)]);
                int _3146 = _150 + 8;
                uint _3148 = uint(int(uint(_3146) >> uint(2)));
                float _3150 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3148)]);
                float _3152 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _3154 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3156 = _3018 * _3112;
                float _3158 = _3018 * _3128;
                float _3160 = _3018 * _3144;
                float _3162 = fma(_3016, _3106, _3156);
                float _3164 = fma(_3016, _3122, _3158);
                float _3166 = fma(_3016, _3138, _3160);
                float _3168 = fma(_3020, _3118, _3162);
                float _3170 = fma(_3020, _3134, _3164);
                float _3172 = fma(_3020, _3150, _3166);
                float _3174 = _3102 + _3168;
                float _3176 = _3152 + _3170;
                float _3178 = _3154 + _3172;
                _3028 = _3174;
                _3042 = _3178;
                _3034 = _3176;
                _3094 = true;
            }
            else
            {
                int _3180 = as_type<int>(_242) & 2048;
                bool _3182 = _3180 != 0;
                if (!_3182)
                {
                    _3026 = _3016;
                }
                float _3184 = _3026;
                _3028 = _3184;
                if (!_3182)
                {
                    _3032 = _3018;
                }
                float _3186 = _3032;
                _3034 = _3186;
                if (!_3182)
                {
                    _3040 = _3020;
                }
                float _3188 = _3040;
                bool _3190 = !_3182;
                _3042 = _3188;
                if (!_3190)
                {
                    uint _3192 = uint(int(uint(_150) >> uint(2)));
                    float _3194 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3192)]);
                    int _3196 = _150 + 4;
                    uint _3198 = uint(int(uint(_3196) >> uint(2)));
                    float _3200 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3198)]);
                    int _3202 = _150 + 8;
                    uint _3204 = uint(int(uint(_3202) >> uint(2)));
                    float _3206 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3204)]);
                    int _3208 = _150 + 12;
                    uint _3210 = uint(int(uint(_3208) >> uint(2)));
                    float _3212 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3210)]);
                    uint _3214 = uint(int(uint(_150) >> uint(2)));
                    float _3216 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3214)]);
                    int _3218 = _150 + 4;
                    uint _3220 = uint(int(uint(_3218) >> uint(2)));
                    float _3222 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3220)]);
                    int _3224 = _150 + 8;
                    uint _3226 = uint(int(uint(_3224) >> uint(2)));
                    float _3228 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3226)]);
                    int _3230 = _150 + 12;
                    uint _3232 = uint(int(uint(_3230) >> uint(2)));
                    float _3234 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3232)]);
                    uint _3236 = uint(int(uint(_150) >> uint(2)));
                    float _3238 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3236)]);
                    int _3240 = _150 + 4;
                    uint _3242 = uint(int(uint(_3240) >> uint(2)));
                    float _3244 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3242)]);
                    int _3246 = _150 + 8;
                    uint _3248 = uint(int(uint(_3246) >> uint(2)));
                    float _3250 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3248)]);
                    int _3252 = _150 + 12;
                    uint _3254 = uint(int(uint(_3252) >> uint(2)));
                    float _3256 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3254)]);
                    float _3258 = _3018 * _3200;
                    float _3260 = _3018 * _3222;
                    float _3262 = fma(_3016, _3194, _3258);
                    float _3264 = _3018 * _3244;
                    float _3266 = fma(_3016, _3216, _3260);
                    float _3268 = fma(_3016, _3238, _3264);
                    float _3270 = fma(_3020, _3206, _3262);
                    float _3272 = fma(_3020, _3228, _3266);
                    float _3274 = fma(_3020, _3250, _3268);
                    float _3276 = _3270 + _3212;
                    float _3278 = _3272 + _3234;
                    float _3280 = _3274 + _3256;
                    _3028 = _3276;
                    _3042 = _3280;
                    _3034 = _3278;
                }
            }
        }
    }
    _3094 = false;
    float _3282 = _3028;
    float _3284 = _3042;
    float _3286 = _3034;
    float _3288 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _3290 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[60]);
    float _3292 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[62]);
    float _3294 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[61]);
    float _3296 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[59]);
    float _3298 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[63]);
    bool _3300 = _3288 != 0.0;
    bool _3302 = isnan(_3288);
    bool _3304 = _3300 || _3302;
    bool _3306 = isnan(0.0);
    bool _3308 = _3304 || _3306;
    float _3310 = _178 * _3290;
    float _3312 = _178 * _3292;
    float _3314 = _178 * _3294;
    float _3316 = fma(_3296, _3282, _3310);
    float _3318 = fma(_3296, _3284, _3312);
    float _3320 = fma(_3296, _3286, _3314);
    float _3322 = _3298;
    if (_3308)
    {
        float _3324 = _156 * _3298;
        _3322 = _3324;
    }
    float _3326 = _3322;
    float _3328 = _3320 + _3326;
    float _3330 = -_3326;
    bool _3332 = _3316 >= _3330;
    bool _3334 = isnan(_3316);
    bool _3336 = _3332 || _3334;
    bool _3338 = isnan(_3330);
    bool _3340 = _3336 || _3338;
    float _3342 = _3316 + _3326;
    float _3344 = -_3326;
    bool _3346 = _3318 >= _3344;
    bool _3348 = isnan(_3318);
    bool _3350 = _3346 || _3348;
    bool _3352 = isnan(_3344);
    bool _3354 = _3350 || _3352;
    float _3356 = _3318 + _3326;
    float _3358 = -_3326;
    bool _3360 = _3320 >= _3358;
    bool _3362 = isnan(_3320);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan(_3358);
    bool _3368 = _3364 || _3366;
    bool _3370 = !_3340;
    float _3372 = -_3342;
    float _3374 = _3370 ? _3372 : _3342;
    bool _3376 = !_3354;
    float _3378 = -_3356;
    float _3380 = _3376 ? _3378 : _3356;
    bool _3382 = !_3368;
    float _3384 = -_3328;
    float _3386 = _3382 ? _3384 : _3328;
    float _3388 = _3374 * 0.03125;
    float _3390 = _3380 * 0.03125;
    float _3392 = _3386 * 0.03125;
    float3 _8801 = float3(_3388, _3392, _3390);
    float3 _3396 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_8801, float3(0.0), isnan(_8801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_8801, float3(0.0), isnan(_8801)), level(0.0)).xyz;
    float _3398 = _3396.x;
    float _3400 = _3396.y;
    float _3402 = _3396.z;
    float _3404 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[56]);
    float _3406 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[57]);
    float _3408 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[58]);
    float _3410 = _3398 + (-0.5);
    float _3412 = _3400 + (-0.5);
    float _3414 = _3402 + (-0.5);
    float _3416 = _3410 * _3404;
    float _3418 = _3412 * _3406;
    float _3420 = _3414 * _3408;
    float _3422 = _3410;
    float _3424 = _3404;
    float _3426 = _3412;
    if (!_3022)
    {
        _3422 = _3416;
    }
    float _3428 = _3422;
    float _3430 = _3428;
    float _3432 = _3428;
    if (!_3022)
    {
        _3424 = _3418;
    }
    float _3434 = _3424;
    float _3436 = _3434;
    float _3438 = _3434;
    if (!_3022)
    {
        _3426 = _3420;
    }
    float _3440 = _3426;
    bool _3442 = !_3022;
    float _3444 = _3440;
    float _3446 = _3440;
    if (!_3442)
    {
        bool _3448 = !_512;
        if (!_3448)
        {
            float _3450 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _3452 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _3454 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _3456 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _3458 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _3460 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _3462 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _3464 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _3466 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _3468 = _3454 * _3456;
            float _3470 = _3454 * _3458;
            float _3472 = _3452 * _3456;
            float _3474 = -_3468;
            float _3476 = fma(_3450, _3460, _3474);
            float _3478 = -_3470;
            float _3480 = fma(_3452, _3460, _3478);
            float _3482 = -_3472;
            float _3484 = fma(_3450, _3458, _3482);
            float _3486 = _3464 * _3450;
            float _3488 = _3464 * _3476;
            float _3490 = _3466 * _3452;
            float _3492 = _3462 * _3458;
            float _3494 = -_3486;
            float _3496 = fma(_3462, _3452, _3494);
            float _3498 = -_3488;
            float _3500 = fma(_3462, _3480, _3498);
            float _3502 = _3464 * _3460;
            float _3504 = _3466 * _3456;
            float _3506 = -_3492;
            float _3508 = fma(_3464, _3456, _3506);
            float _3510 = fma(_3466, _3484, _3500);
            float _3512 = -_3502;
            float _3514 = fma(_3466, _3458, _3512);
            float _3516 = -_3504;
            float _3518 = fma(_3462, _3460, _3516);
            float _3520 = _3462 * _3454;
            float _3522 = 1.0 / _3510;
            float _3524 = -_3450;
            float _3526 = fma(_3524, _3460, _3468);
            float _3528 = -_3490;
            float _3530 = fma(_3464, _3454, _3528);
            float _3532 = -_3520;
            float _3534 = fma(_3466, _3450, _3532);
            float _3536 = _3514 * _3522;
            float _3538 = _3518 * _3522;
            float _3540 = _3508 * _3522;
            float _3542 = _3416 * _3522;
            float _3544 = _3418 * _3536;
            float _3546 = _3418 * _3538;
            float _3548 = _3418 * _3540;
            float _3550 = _3526 * _3522;
            float _3552 = _3530 * _3522;
            float _3554 = fma(_3480, _3542, _3544);
            float _3556 = _3534 * _3522;
            float _3558 = _3496 * _3522;
            float _3560 = fma(_3416, _3550, _3546);
            float _3562 = fma(_3484, _3542, _3548);
            float _3564 = fma(_3420, _3552, _3554);
            float _3566 = fma(_3420, _3556, _3560);
            float _3568 = fma(_3420, _3558, _3562);
            _3432 = _3564;
            _3438 = _3566;
            _3446 = _3568;
            _3570 = true;
        }
        else
        {
            int _3572 = as_type<int>(_242) & 1024;
            bool _3574 = _3572 != 0;
            if (_3574)
            {
                _542 = true;
            }
            bool _3576 = _542;
            bool _3578 = _3576;
            if (!_3574)
            {
                int _3580 = as_type<int>(_242) & 2048;
                bool _3582 = _3580 != 0;
                _3578 = _3582;
            }
            bool _3584 = _3578;
            if (!_3584)
            {
                _3430 = _3416;
            }
            float _3586 = _3430;
            _3432 = _3586;
            if (!_3584)
            {
                _3436 = _3418;
            }
            float _3588 = _3436;
            _3438 = _3588;
            if (!_3584)
            {
                _3444 = _3420;
            }
            float _3590 = _3444;
            bool _3592 = !_3584;
            _3446 = _3590;
            if (!_3592)
            {
                uint _3594 = uint(int(uint(_150) >> uint(2)));
                float _3596 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3594)]);
                int _3598 = _150 + 4;
                uint _3600 = uint(int(uint(_3598) >> uint(2)));
                float _3602 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3600)]);
                int _3604 = _150 + 8;
                uint _3606 = uint(int(uint(_3604) >> uint(2)));
                float _3608 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3606)]);
                uint _3610 = uint(int(uint(_150) >> uint(2)));
                float _3612 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3610)]);
                int _3614 = _150 + 4;
                uint _3616 = uint(int(uint(_3614) >> uint(2)));
                float _3618 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3616)]);
                int _3620 = _150 + 8;
                uint _3622 = uint(int(uint(_3620) >> uint(2)));
                float _3624 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3622)]);
                uint _3626 = uint(int(uint(_150) >> uint(2)));
                float _3628 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3626)]);
                int _3630 = _150 + 4;
                uint _3632 = uint(int(uint(_3630) >> uint(2)));
                float _3634 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3632)]);
                int _3636 = _150 + 8;
                uint _3638 = uint(int(uint(_3636) >> uint(2)));
                float _3640 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3638)]);
                float _3642 = _3608 * _3612;
                float _3644 = _3608 * _3618;
                float _3646 = _3602 * _3612;
                float _3648 = -_3642;
                float _3650 = fma(_3596, _3624, _3648);
                float _3652 = -_3644;
                float _3654 = fma(_3602, _3624, _3652);
                float _3656 = -_3646;
                float _3658 = fma(_3596, _3618, _3656);
                float _3660 = _3634 * _3596;
                float _3662 = _3634 * _3650;
                float _3664 = _3640 * _3602;
                float _3666 = _3628 * _3618;
                float _3668 = -_3660;
                float _3670 = fma(_3628, _3602, _3668);
                float _3672 = -_3662;
                float _3674 = fma(_3628, _3654, _3672);
                float _3676 = _3634 * _3624;
                float _3678 = _3640 * _3612;
                float _3680 = -_3666;
                float _3682 = fma(_3634, _3612, _3680);
                float _3684 = fma(_3640, _3658, _3674);
                float _3686 = -_3676;
                float _3688 = fma(_3640, _3618, _3686);
                float _3690 = -_3678;
                float _3692 = fma(_3628, _3624, _3690);
                float _3694 = _3628 * _3608;
                float _3696 = 1.0 / _3684;
                float _3698 = -_3596;
                float _3700 = fma(_3698, _3624, _3642);
                float _3702 = -_3664;
                float _3704 = fma(_3634, _3608, _3702);
                float _3706 = -_3694;
                float _3708 = fma(_3640, _3596, _3706);
                float _3710 = _3688 * _3696;
                float _3712 = _3692 * _3696;
                float _3714 = _3682 * _3696;
                float _3716 = _3416 * _3696;
                float _3718 = _3418 * _3710;
                float _3720 = _3418 * _3712;
                float _3722 = _3418 * _3714;
                float _3724 = _3700 * _3696;
                float _3726 = _3704 * _3696;
                float _3728 = fma(_3654, _3716, _3718);
                float _3730 = _3708 * _3696;
                float _3732 = _3670 * _3696;
                float _3734 = fma(_3416, _3724, _3720);
                float _3736 = fma(_3658, _3716, _3722);
                float _3738 = fma(_3420, _3726, _3728);
                float _3740 = fma(_3420, _3730, _3734);
                float _3742 = fma(_3420, _3732, _3736);
                _3432 = _3738;
                _3438 = _3740;
                _3446 = _3742;
            }
        }
    }
    _3570 = false;
    float _3744 = _3432;
    float _3746 = _3438;
    float _3748 = _3446;
    uint _3750 = uint(int(uint(_180) >> uint(2)));
    float _3752 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3750)]);
    float _3754 = fma(_176, _3744, _522);
    float _3756 = fma(_176, _3746, _518);
    float _3758 = fma(_176, _3748, _520);
    int _3760 = _150 + 4;
    float _3762 = -_186;
    float _3764 = _3762 + _3016;
    int _3766 = _150 + 8;
    float _3768 = -_192;
    float _3770 = _3768 + _3018;
    float _3772 = -_198;
    float _3774 = _3772 + _3020;
    float _3776 = _3770 * _3770;
    float _3778 = fma(_3764, _3764, _3776);
    float _3780 = fma(_3774, _3774, _3778);
    uint _3782 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3782)] = as_type<uint>(_3752);
    uint _3784 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3784)] = as_type<uint>(_3016);
    uint _3786 = uint(int(uint(_3760) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3786)] = as_type<uint>(_3018);
    uint _3788 = uint(int(uint(_3766) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3788)] = as_type<uint>(_3020);
    uint _3790 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3790)] = as_type<uint>(_3754);
    uint _3792 = uint(int(uint(_3760) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3792)] = as_type<uint>(_3756);
    uint _3794 = uint(int(uint(_3766) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3794)] = as_type<uint>(_3758);
    uint _3796 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3796)] = as_type<uint>(_3764);
    uint _3798 = uint(int(uint(_3760) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3798)] = as_type<uint>(_3770);
    uint _3800 = uint(int(uint(_3766) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3800)] = as_type<uint>(_3774);
    float _3802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3804 = sqrt(_3780);
    float _3806 = _3756 * _3756;
    float _3808 = fma(_3754, _3754, _3806);
    float _3810 = fma(_3758, _3758, _3808);
    float _3812 = sqrt(_3810);
    bool _3814 = _3804 >= 9.9999999747524270787835121154785e-07;
    bool _3816 = isnan(_3804);
    bool _3818 = _3814 || _3816;
    bool _3820 = isnan(9.9999999747524270787835121154785e-07);
    bool _3822 = _3818 || _3820;
    float _3824 = _3810;
    if (!_3822)
    {
        bool _3826 = _178 != _216;
        bool _3828 = isnan(_178);
        bool _3830 = _3826 || _3828;
        bool _3832 = isnan(_216);
        bool _3834 = _3830 || _3832;
        _3836 = _3834;
        if (!_3836)
        {
            float _3838 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _3840 = _3838 > 0.0;
            bool _3842 = !_3840;
            if (!_3842)
            {
                float _3844 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _3846 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _3848 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _3850 = _3846 * _3846;
                float _3852 = fma(_3844, _3844, _3850);
                float _3854 = fma(_3848, _3848, _3852);
                float _3856 = rsqrt(_3854);
                float _3858 = _3856 * 9.9999999747524270787835121154785e-07;
                float _3860 = _3844 * _3858;
                float _3862 = _3846 * _3858;
                float _3864 = _3848 * _3858;
                _330 = as_type<int>(_3860);
                _332 = as_type<int>(_3862);
                _334 = as_type<int>(_3864);
                _3836 = true;
            }
            else
            {
                bool _3866 = _3812 >= 9.9999999747524270787835121154785e-07;
                bool _3868 = isnan(_3812);
                bool _3870 = _3866 || _3868;
                bool _3872 = isnan(9.9999999747524270787835121154785e-07);
                bool _3874 = _3870 || _3872;
                if (!_3874)
                {
                    float _3876 = _3018 * _3018;
                    float _3878 = fma(_3016, _3016, _3876);
                    float _3880 = fma(_3020, _3020, _3878);
                    float _3882 = sqrt(_3880);
                    bool _3884 = _3882 >= 9.9999999747524270787835121154785e-07;
                    bool _3886 = isnan(_3882);
                    bool _3888 = _3884 || _3886;
                    bool _3890 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3892 = _3888 || _3890;
                    int _3894 = as_type<int>(_272);
                    int _3896 = as_type<int>(_3882);
                    if (_3892)
                    {
                        float _3898 = rsqrt(_3880);
                        _3894 = as_type<int>(_3898);
                    }
                    int _3900 = _3894;
                    if (!_3892)
                    {
                        _3896 = 0;
                    }
                    int _3902 = _3896;
                    int _3904 = _3902;
                    if (!_3892)
                    {
                        _324 = 897988541;
                    }
                    int _3906 = _324;
                    int _3908 = _3900;
                    int _3910 = _3906;
                    if (_3892)
                    {
                        float _3912 = as_type<float>(_3900) * 9.9999999747524270787835121154785e-07;
                        _3824 = _3912;
                    }
                    float _3914 = _3824;
                    if (!_3892)
                    {
                        _3908 = 0;
                    }
                    int _3916 = _3908;
                    int _3918 = _3916;
                    if (_3892)
                    {
                        float _3920 = _3016 * _3914;
                        _3904 = as_type<int>(_3920);
                    }
                    int _3922 = _3904;
                    _330 = _3922;
                    if (_3892)
                    {
                        float _3924 = _3018 * _3914;
                        _3910 = as_type<int>(_3924);
                    }
                    int _3926 = _3910;
                    _332 = _3926;
                    if (_3892)
                    {
                        float _3928 = _3020 * _3914;
                        _3918 = as_type<int>(_3928);
                    }
                    int _3930 = _3918;
                    _334 = _3930;
                    _3836 = true;
                }
                else
                {
                    float _3932 = rsqrt(_3810);
                    float _3934 = _3932 * 9.9999999747524270787835121154785e-07;
                    float _3936 = _3754 * _3934;
                    float _3938 = _3756 * _3934;
                    float _3940 = _3758 * _3934;
                    _330 = as_type<int>(_3936);
                    _332 = as_type<int>(_3938);
                    _334 = as_type<int>(_3940);
                    _3836 = true;
                }
            }
        }
    }
    else
    {
        float _3942 = _3812 * _3802;
        bool _3944 = _3942 >= 0.001000000047497451305389404296875;
        bool _3946 = isnan(_3942);
        bool _3948 = _3944 || _3946;
        bool _3950 = isnan(0.001000000047497451305389404296875);
        bool _3952 = _3948 || _3950;
        bool _3954 = _3942 > 0.0;
        bool _3956 = !_3952;
        bool _3958 = _3954 && _3956;
        bool _3960 = _3804 < 0.001000000047497451305389404296875;
        bool _3962 = _3960 && _3958;
        int _3964 = as_type<int>(_3942);
        if (!_3962)
        {
            _3964 = as_type<int>(_3764);
        }
        int _3966 = _3964;
        int _3968 = _3966;
        if (_3962)
        {
            float _3970 = _3754 * _3802;
            _3968 = as_type<int>(_3970);
        }
        int _3972 = _3968;
        _330 = _3972;
        if (!_3962)
        {
            _326 = as_type<int>(_3770);
        }
        int _3974 = _326;
        int _3976 = _3974;
        if (_3962)
        {
            float _3978 = _3756 * _3802;
            _3976 = as_type<int>(_3978);
        }
        int _3980 = _3976;
        _332 = _3980;
        if (!_3962)
        {
            _328 = as_type<int>(_3774);
        }
        int _3982 = _328;
        _334 = _3982;
        if (_3962)
        {
            float _3984 = _3758 * _3802;
            _334 = as_type<int>(_3984);
        }
    }
    _3836 = false;
    int _3986 = _330;
    int _3988 = _332;
    int _3990 = _334;
    uint _3992 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3992)] = uint(_3986);
    uint _3994 = uint(int(uint(_3760) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3994)] = uint(_3988);
    uint _3996 = uint(int(uint(_3766) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3996)] = uint(_3990);
}

