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
    texture2d<float> cp_t_tcb_2C [[id(11)]];
    sampler cp_t_tcb_2CSmplr [[id(12)]];
    sampler cp_t_tcb_2CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3938 = false;
    bool _2608 = false;
    bool _1806 = false;
    bool _894 = false;
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
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[1]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[2]);
    uint _190 = uint(int(uint(_180) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    uint _194 = uint(int(uint(_150) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    int _198 = _150 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    int _204 = _150 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_206)]);
    int _210 = _150 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_212)]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    uint _226 = uint(int(uint(_150) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_226)]);
    int _230 = _150 + 4;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_232)]);
    int _236 = _150 + 8;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    bool _246 = _152 != 1.0;
    bool _248 = isnan(_152);
    bool _250 = _246 || _248;
    bool _252 = isnan(1.0);
    bool _254 = _250 || _252;
    uint _256 = uint(int(uint(_150) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_256)]);
    int _260 = _150 + 4;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_262)]);
    int _266 = _150 + 8;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_268)]);
    float _272 = _254 ? _156 : 0.0;
    float _274 = _254 ? _162 : 0.3141500055789947509765625;
    uint _276 = uint(int(uint(_180) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_276)]);
    float _280 = _254 ? _168 : 0.92653000354766845703125;
    float _282 = _170 * 0.00999999977648258209228515625;
    float _284 = _174 * _272;
    float _286 = _174 * _274;
    float _288 = _174 * _280;
    float _290 = _174 * _282;
    float _292 = _156;
    float _294 = _272;
    float _296 = _284;
    float _298 = _274;
    float _300 = _286;
    float _302 = _288;
    float _304 = _182;
    float _306 = _162;
    float _308 = _214;
    float _310 = _224;
    float _312 = _290;
    float _314 = _196;
    float _316 = _208;
    float _318 = _196;
    float _320 = _208;
    float _322 = _174;
    float _324 = _188;
    float _326 = _184;
    float _328 = _186;
    int _330 = as_type<int>(_264);
    int _332 = as_type<int>(_258);
    int _334 = as_type<int>(_264);
    int _336 = as_type<int>(_270);
    int _338 = as_type<int>(_258);
    int _340 = as_type<int>(_264);
    int _342 = as_type<int>(_270);
    if (!_254)
    {
        float _344 = _172 * 0.00999999977648258209228515625;
        float _346 = _178 * _290;
        float _348 = fma(_156, 2.0, -1.0);
        float _350 = _174 * _344;
        float _352 = fma(_162, 2.0, -1.0);
        float _354 = fma(_168, 2.0, -1.0);
        float _356 = fma(_350, _348, _346);
        float _358 = fma(_350, _352, _346);
        float _360 = fma(_350, _354, _346);
        float _362 = _284 + _356;
        float _364 = _286 + _358;
        float _366 = _288 + _360;
        _292 = _356;
        _294 = _350;
        _296 = _362;
        _298 = _358;
        _300 = _364;
        _302 = _366;
    }
    float _368 = _292;
    float _370 = _294;
    float _372 = _296;
    float _374 = _298;
    float _376 = _300;
    float _378 = _302;
    float _380 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[13]);
    float _382 = -_176;
    float _384 = _382 + 1.0;
    float _386 = -_216;
    float _388 = _386 + 1.0;
    float _390 = -_192;
    float _392 = _178 + _390;
    float _394 = _218 * _242;
    float _396 = _222 * _242;
    float _398 = fma(_384, _388, _216);
    float _400 = abs(_216);
    float _402 = log2(_400);
    bool _404 = _398 != 1.0;
    bool _406 = isnan(_398);
    bool _408 = _404 || _406;
    bool _410 = isnan(1.0);
    bool _412 = _408 || _410;
    bool _414 = _182 != 1.0;
    bool _416 = isnan(_182);
    bool _418 = _414 || _416;
    bool _420 = isnan(1.0);
    bool _422 = _418 || _420;
    bool _424 = !_412;
    bool _426 = _422 || _424;
    float _428 = _370;
    float _430 = _368;
    float _432 = _396;
    float _434 = _374;
    float _436 = _394;
    float _438 = _374;
    float _440 = _394;
    float _442 = _396;
    if (_254)
    {
        _304 = 0.0;
    }
    float _444 = _304;
    float _446 = _444;
    if (!_254)
    {
        float _448 = _176 * _290;
        _446 = _448;
    }
    float _450 = _446;
    bool _452 = _450 != 0.0;
    bool _454 = isnan(_450);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _384;
    float _464 = _450;
    if (!_426)
    {
        float _466 = abs(_398);
        float _468 = log2(_466);
        _462 = _468;
    }
    float _470 = _462;
    if (!_426)
    {
        float _472 = -_398;
        float _474 = _472 + 1.0;
        _306 = _474;
    }
    float _476 = _306;
    if (_426)
    {
        _428 = _392;
    }
    float _478 = _428;
    float _480 = _478;
    if (!_426)
    {
        float _482 = 1.0 / _476;
        _430 = _482;
    }
    float _484 = _430;
    float _486 = _176 * _394;
    if (!_426)
    {
        float _488 = _392 * _470;
        _308 = _488;
    }
    float _490 = _308;
    float _492 = _176 * _402;
    float _494 = exp2(_492);
    float _496 = _490;
    if (!_426)
    {
        float _498 = exp2(_490);
        _496 = _498;
    }
    float _500 = _496;
    float _502 = fma(_196, _494, _486);
    if (!_426)
    {
        float _504 = -_500;
        float _506 = _504 + 1.0;
        _310 = _506;
    }
    float _508 = _310;
    float _510 = _176 * _396;
    if (!_426)
    {
        float _512 = _508 * _484;
        _480 = _512;
    }
    float _514 = _480;
    float _516 = _220 * _242;
    int _518 = as_type<int>(_244) & 512;
    bool _520 = _518 != 0;
    float _522 = _514 + _372;
    float _524 = _176 * _516;
    float _526 = _176 + _522;
    float _528 = fma(_202, _494, _524);
    float _530 = fma(_208, _494, _510);
    float _532 = _526 + _450;
    bool _534 = _380 != 1.0;
    bool _536 = isnan(_380);
    bool _538 = _534 || _536;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    float _544 = _524;
    float _546 = _380;
    float _548 = _522;
    float _550 = _524;
    float _552 = _380;
    float _554 = _522;
    float _630;
    float _648;
    float _650;
    float _652;
    float _782;
    float _816;
    float _852;
    float _856;
    float _864;
    float _866;
    float _870;
    float _874;
    float _878;
    float _882;
    float _886;
    float _888;
    float _890;
    float _892;
    if (!_460)
    {
        if (_542)
        {
            _432 = 0.60000002384185791015625;
        }
        float _556 = _432;
        float _558 = _172;
        if (!_542)
        {
            float _560 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _558 = _560;
        }
        float _562 = _558;
        if (_542)
        {
            _544 = 0.4199999868869781494140625;
        }
        float _564 = _544;
        if (_542)
        {
            _546 = 0.23000000417232513427734375;
        }
        float _566 = _546;
        float _568 = _242;
        if (!_542)
        {
            float _570 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _568 = _570;
        }
        float _572 = _568;
        float _574 = _556;
        if (!_542)
        {
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _574 = _576;
        }
        float _578 = _574;
        if (_542)
        {
            _434 = 0.1500000059604644775390625;
        }
        float _580 = _434;
        float _582 = _564;
        if (!_542)
        {
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _582 = _584;
        }
        float _586 = _582;
        float _588 = _566;
        if (!_542)
        {
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _588 = _590;
        }
        float _592 = _588;
        float _594 = _580;
        if (!_542)
        {
            float _596 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _594 = _596;
        }
        float _598 = _594;
        float _600 = 0.0;
        if (!_542)
        {
            float _602 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _600 = _602;
        }
        float _604 = _600;
        float _606 = 0.0;
        if (!_542)
        {
            float _608 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _606 = _608;
        }
        float _610 = _606;
        if (_542)
        {
            _436 = 0.60000002384185791015625;
        }
        float _612 = _436;
        float _614 = _174 * _578;
        float _616 = _612;
        float _618 = _578;
        if (!_542)
        {
            _616 = _578;
        }
        float _620 = _616;
        float _622 = _620;
        if (_542)
        {
            _618 = 0.4199999868869781494140625;
        }
        float _624 = _618;
        float _626 = _174 * _586;
        float _628 = _624;
        _630 = _562;
        if (!_542)
        {
            _628 = _586;
        }
        float _632 = _628;
        float _634 = 1.0 / _614;
        float _636 = _174 * _592;
        float _638 = 1.0 / _626;
        float _640 = _174 * _598;
        float _642 = _174 * _632;
        float _644 = 1.0 / _636;
        float _646 = _632;
        _648 = _572;
        _650 = _604;
        _652 = _610;
        if (_542)
        {
            _646 = 0.1500000059604644775390625;
        }
        float _654 = _646;
        float _656 = _654;
        if (!_542)
        {
            _656 = _598;
        }
        float _658 = _656;
        float _660 = _532 * 6.283184051513671875;
        float _662 = _174 * _620;
        float _664 = 1.0 / _642;
        if (_542)
        {
            _622 = 0.23000000417232513427734375;
        }
        float _666 = _622;
        float _668 = _634 * _660;
        float _670 = _666;
        if (!_542)
        {
            _670 = _592;
        }
        float _672 = _670;
        float _674 = 1.0 / _640;
        float _676 = _668 * 0.15915493667125701904296875;
        float _678 = _174 * _672;
        float _680 = _638 * _660;
        float _682 = 1.0 / _662;
        float _684 = _680 * 0.15915493667125701904296875;
        float _686 = _644 * _660;
        float _688 = _174 * _658;
        float _690 = _522 * _664;
        float _692 = 1.0 / _678;
        float _694 = _686 * 0.15915493667125701904296875;
        float _696 = _674 * _660;
        float _698 = _690 * 6.283184051513671875;
        float _700 = 1.0 / _688;
        float _702 = _696 * 0.15915493667125701904296875;
        float _704 = _522 * _682;
        float _706 = _698 * 0.15915493667125701904296875;
        float _708 = _704 * 6.283184051513671875;
        float _710 = _522 * _692;
        float _712 = _706 * 6.283185482025146484375;
        float _714 = sin(_712);
        float _716 = _708 * 0.15915493667125701904296875;
        float _718 = _710 * 6.283184051513671875;
        float _720 = _684 * 6.283185482025146484375;
        float _722 = sin(_720);
        float _724 = _522 * _700;
        float _726 = _718 * 0.15915493667125701904296875;
        float _728 = _710;
        float _730 = _708;
        if (_542)
        {
            _728 = 3.0;
        }
        float _732 = _728;
        float _734 = _724 * 6.283184051513671875;
        float _736 = _676 * 6.283185482025146484375;
        float _738 = sin(_736);
        float _740 = _732;
        if (!_542)
        {
            _740 = _562;
        }
        float _742 = _740;
        float _744 = _742;
        if (_542)
        {
            _730 = 3.0;
        }
        float _746 = _730;
        float _748 = _694 * 6.283185482025146484375;
        float _750 = sin(_748);
        float _752 = _746;
        if (!_542)
        {
            _752 = _562;
        }
        float _754 = _752;
        float _756 = _716 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = _754;
        if (_542)
        {
            _548 = 4.0;
        }
        float _762 = _548;
        float _764 = _722 * _754;
        float _766 = _762;
        float _768 = _722;
        if (!_542)
        {
            _766 = _572;
        }
        float _770 = _766;
        float _772 = _726 * 6.283185482025146484375;
        float _774 = sin(_772);
        float _776 = _734 * 0.15915493667125701904296875;
        float _778 = _714 * _742;
        float _780 = _770;
        _782 = _776;
        if (_542)
        {
            _744 = 4.0;
        }
        float _784 = _744;
        float _786 = _784;
        if (!_542)
        {
            _786 = _572;
        }
        float _788 = _786;
        float _790 = _702 * 6.283185482025146484375;
        float _792 = sin(_790);
        float _794 = fma(_738, _770, _764);
        float _796 = _738;
        float _798 = _788;
        float _800 = _794;
        if (_542)
        {
            _768 = 2.0;
        }
        float _802 = _768;
        float _804 = _776 * 6.283185482025146484375;
        float _806 = sin(_804);
        float _808 = _802;
        if (_542)
        {
            _780 = 2.0;
        }
        float _810 = _780;
        float _812 = fma(_758, _788, _778);
        float _814 = _810;
        _816 = _812;
        if (!_542)
        {
            _808 = _604;
        }
        float _818 = _808;
        float _820 = _818;
        if (!_542)
        {
            _814 = _604;
        }
        float _822 = _814;
        float _824 = _822;
        if (_542)
        {
            _796 = 1.5;
        }
        float _826 = _796;
        float _828 = _826;
        if (_542)
        {
            _760 = 1.5;
        }
        float _830 = _760;
        float _832 = fma(_750, _818, _794);
        float _834 = _830;
        float _836 = _832;
        if (!_542)
        {
            _828 = _610;
        }
        float _838 = _828;
        float _840 = fma(_774, _822, _812);
        float _842 = _838;
        if (!_542)
        {
            _834 = _610;
        }
        float _844 = _834;
        float _846 = fma(_792, _838, _832);
        float _848 = fma(_806, _844, _840);
        float _850 = _844;
        _852 = _806;
        if (_542)
        {
            _850 = 1.5;
        }
        float _854 = _850;
        _856 = _854;
        if (_542)
        {
            _820 = 2.0;
        }
        float _858 = _820;
        float _860 = -_848;
        float _862 = _846 + _860;
        _864 = _858;
        _866 = _862;
        if (_542)
        {
            _824 = 3.0;
        }
        float _868 = _824;
        _870 = _868;
        if (_542)
        {
            _798 = 4.0;
        }
        float _872 = _798;
        _874 = _872;
        if (_542)
        {
            _842 = 0.1500000059604644775390625;
        }
        float _876 = _842;
        _878 = _876;
        if (_542)
        {
            _800 = 0.23000000417232513427734375;
        }
        float _880 = _800;
        _882 = _880;
        if (_542)
        {
            _836 = 0.4199999868869781494140625;
        }
        float _884 = _836;
        _886 = _884;
        _888 = 0.0;
        _890 = 0.0;
        _892 = 0.0;
        _894 = true;
    }
    else
    {
        if (_542)
        {
            _550 = 0.4199999868869781494140625;
        }
        float _896 = _550;
        float _898 = _172;
        if (!_542)
        {
            float _900 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _898 = _900;
        }
        float _902 = _898;
        if (_542)
        {
            _552 = 0.60000002384185791015625;
        }
        float _904 = _552;
        if (_542)
        {
            _438 = 0.23000000417232513427734375;
        }
        float _906 = _438;
        float _908 = _242;
        if (!_542)
        {
            float _910 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _908 = _910;
        }
        float _912 = _908;
        float _914 = _896;
        if (!_542)
        {
            float _916 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _914 = _916;
        }
        float _918 = _914;
        if (_542)
        {
            _312 = 0.1500000059604644775390625;
        }
        float _920 = _312;
        float _922 = _904;
        if (!_542)
        {
            float _924 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _922 = _924;
        }
        float _926 = _922;
        float _928 = _906;
        if (!_542)
        {
            float _930 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _928 = _930;
        }
        float _932 = _928;
        float _934 = _920;
        if (!_542)
        {
            float _936 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _934 = _936;
        }
        float _938 = _934;
        float _940 = 0.0;
        if (!_542)
        {
            float _942 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _940 = _942;
        }
        float _944 = _940;
        float _946 = 0.0;
        if (!_542)
        {
            float _948 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _946 = _948;
        }
        float _950 = _946;
        if (_542)
        {
            _440 = 0.4199999868869781494140625;
        }
        float _952 = _440;
        float _954 = _952;
        if (_542)
        {
            _442 = 0.4199999868869781494140625;
        }
        float _956 = _442;
        float _958 = _956;
        float _960 = _918;
        if (!_542)
        {
            _954 = _918;
        }
        float _962 = _954;
        float _964 = _174 * _918;
        float _966 = _962;
        if (!_542)
        {
            _958 = _918;
        }
        float _968 = _958;
        float _970 = _174 * _962;
        float _972 = _968;
        if (_542)
        {
            _966 = 0.4199999868869781494140625;
        }
        float _974 = _966;
        float _976 = _974;
        if (!_542)
        {
            _976 = _918;
        }
        float _978 = _976;
        float _980 = 1.0 / _964;
        float _982 = _174 * _932;
        float _984 = _978;
        _630 = _902;
        if (_542)
        {
            _960 = 0.60000002384185791015625;
        }
        float _986 = _960;
        float _988 = _174 * _978;
        float _990 = _986;
        if (_542)
        {
            _984 = 0.60000002384185791015625;
        }
        float _992 = _984;
        float _994 = _174 * _938;
        float _996 = _174 * _968;
        float _998 = _992;
        _648 = _912;
        _650 = _944;
        _652 = _950;
        if (_542)
        {
            _972 = 0.60000002384185791015625;
        }
        float _1000 = _972;
        float _1002 = _1000;
        if (!_542)
        {
            _1002 = _926;
        }
        float _1004 = _1002;
        float _1006 = _174 * _926;
        float _1008 = _1004;
        if (!_542)
        {
            _998 = _926;
        }
        float _1010 = _998;
        float _1012 = _1010;
        if (!_542)
        {
            _990 = _926;
        }
        float _1014 = _990;
        float _1016 = 1.0 / _982;
        float _1018 = 1.0 / _994;
        float _1020 = _174 * _1004;
        float _1022 = _1014;
        if (_542)
        {
            _1008 = 0.23000000417232513427734375;
        }
        float _1024 = _1008;
        float _1026 = _1024;
        if (!_542)
        {
            _1026 = _932;
        }
        float _1028 = _1026;
        float _1030 = 1.0 / _1006;
        float _1032 = _174 * _1010;
        float _1034 = _1028;
        if (_542)
        {
            _1012 = 0.23000000417232513427734375;
        }
        float _1036 = _1012;
        float _1038 = _1036;
        if (!_542)
        {
            _1038 = _932;
        }
        float _1040 = _1038;
        float _1042 = _174 * _1014;
        float _1044 = 1.0 / _1020;
        float _1046 = _532 * 6.283184051513671875;
        float _1048 = _1040;
        if (_542)
        {
            _1022 = 0.23000000417232513427734375;
        }
        float _1050 = _1022;
        float _1052 = 1.0 / _1042;
        float _1054 = _174 * _1040;
        float _1056 = _1050;
        if (_542)
        {
            _1048 = 0.1500000059604644775390625;
        }
        float _1058 = _1048;
        float _1060 = _1058;
        if (!_542)
        {
            _1060 = _938;
        }
        float _1062 = _1060;
        float _1064 = _174 * _1028;
        if (!_542)
        {
            _1056 = _932;
        }
        float _1066 = _1056;
        float _1068 = 1.0 / _988;
        float _1070 = _1066;
        if (_542)
        {
            _1034 = 0.1500000059604644775390625;
        }
        float _1072 = _1034;
        float _1074 = _1072;
        if (!_542)
        {
            _1074 = _938;
        }
        float _1076 = _1074;
        float _1078 = 1.0 / _1064;
        float _1080 = _174 * _1076;
        float _1082 = _980 * _1046;
        float _1084 = 1.0 / _1032;
        float _1086 = 1.0 / _996;
        float _1088 = _174 * _1062;
        float _1090 = _1082 * 0.15915493667125701904296875;
        float _1092 = _1030 * _1046;
        float _1094 = _174 * _1066;
        if (_542)
        {
            _1070 = 0.1500000059604644775390625;
        }
        float _1096 = _1070;
        float _1098 = _1096;
        if (!_542)
        {
            _1098 = _938;
        }
        float _1100 = _1098;
        float _1102 = 1.0 / _1094;
        float _1104 = _174 * _1100;
        float _1106 = _1092 * 0.15915493667125701904296875;
        float _1108 = _1016 * _1046;
        float _1110 = 1.0 / _970;
        float _1112 = 1.0 / _1080;
        float _1114 = 1.0 / _1054;
        float _1116 = _372 + _450;
        float _1118 = _1116 * 6.283184051513671875;
        float _1120 = _1108 * 0.15915493667125701904296875;
        float _1122 = _1018 * _1046;
        float _1124 = 1.0 / _1104;
        float _1126 = _372 * 6.283184051513671875;
        float _1128 = _1122 * 0.15915493667125701904296875;
        float _1130 = _1086 * _1118;
        float _1132 = _522 * _1110;
        float _1134 = _1130 * 0.15915493667125701904296875;
        float _1136 = _1068 * _1126;
        float _1138 = _1090 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1132 * 6.283184051513671875;
        float _1144 = _1136 * 0.15915493667125701904296875;
        float _1146 = _1044 * _1118;
        float _1148 = 1.0 / _1088;
        float _1150 = _1146 * 0.15915493667125701904296875;
        float _1152 = _1084 * _1126;
        float _1154 = _1142 * 0.15915493667125701904296875;
        float _1156 = _1144 * 6.283185482025146484375;
        float _1158 = sin(_1156);
        float _1160 = _1152 * 0.15915493667125701904296875;
        float _1162 = _1152;
        _892 = _1126;
        if (_542)
        {
            _1162 = 3.0;
        }
        float _1164 = _1162;
        float _1166 = _1164;
        if (!_542)
        {
            _1166 = _902;
        }
        float _1168 = _1166;
        float _1170 = _1134 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        float _1174 = _1078 * _1118;
        float _1176 = _1140 * _1168;
        float _1178 = _1154 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = _1174 * 0.15915493667125701904296875;
        float _1184 = _1114 * _1126;
        float _1186 = _1168;
        float _1188 = _1174;
        float _1190 = _1140;
        if (_542)
        {
            _1186 = 3.0;
        }
        float _1192 = _1186;
        float _1194 = _1192;
        if (_542)
        {
            _1188 = 3.0;
        }
        float _1196 = _1188;
        float _1198 = _1150 * 6.283185482025146484375;
        float _1200 = sin(_1198);
        float _1202 = _1196;
        if (!_542)
        {
            _1194 = _902;
        }
        float _1204 = _1194;
        if (!_542)
        {
            _1202 = _902;
        }
        float _1206 = _1202;
        float _1208 = _1184 * 0.15915493667125701904296875;
        float _1210 = _1206;
        if (_542)
        {
            _1190 = 3.0;
        }
        float _1212 = _1190;
        float _1214 = _1106 * 6.283185482025146484375;
        float _1216 = sin(_1214);
        float _1218 = _1112 * _1118;
        float _1220 = _1212;
        if (!_542)
        {
            _1220 = _902;
        }
        float _1222 = _1220;
        float _1224 = _1158 * _1204;
        float _1226 = _1160 * 6.283185482025146484375;
        float _1228 = sin(_1226);
        float _1230 = _1172 * _1206;
        float _1232 = _522 * _1052;
        float _1234 = _1222;
        float _1236 = _1232;
        if (_542)
        {
            _1210 = 4.0;
        }
        float _1238 = _1210;
        float _1240 = _1218 * 0.15915493667125701904296875;
        float _1242 = _1238;
        if (!_542)
        {
            _1242 = _912;
        }
        float _1244 = _1242;
        float _1246 = _1180 * _1222;
        float _1248 = _1232 * 6.283184051513671875;
        if (_542)
        {
            _1234 = 4.0;
        }
        float _1250 = _1234;
        float _1252 = _1250;
        if (_542)
        {
            _1236 = 4.0;
        }
        float _1254 = _1236;
        float _1256 = fma(_1200, _1244, _1230);
        float _1258 = _1254;
        if (!_542)
        {
            _1252 = _912;
        }
        float _1260 = _1252;
        float _1262 = _1260;
        if (!_542)
        {
            _1258 = _912;
        }
        float _1264 = _1258;
        float _1266 = _522 * _1102;
        float _1268 = _1248 * 0.15915493667125701904296875;
        float _1270 = _1148 * _1126;
        float _1272 = fma(_1216, _1260, _1176);
        float _1274 = fma(_1228, _1264, _1224);
        float _1276 = _522 * _1124;
        float _1278 = _1266 * 6.283184051513671875;
        float _1280 = _1268 * 6.283185482025146484375;
        float _1282 = sin(_1280);
        float _1284 = _1270 * 0.15915493667125701904296875;
        float _1286 = _1276 * 6.283184051513671875;
        float _1288 = _1278 * 0.15915493667125701904296875;
        float _1290 = _1182 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1266;
        float _1296 = _1278;
        float _1298 = _1286;
        float _1300 = _1272;
        if (_542)
        {
            _1294 = 4.0;
        }
        float _1302 = _1294;
        float _1304 = _1208 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = _1302;
        if (!_542)
        {
            _1308 = _912;
        }
        float _1310 = _1308;
        float _1312 = _1120 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = _1284 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        float _1320 = _1310;
        _888 = _1318;
        if (_542)
        {
            _554 = 2.0;
        }
        float _1322 = _554;
        float _1324 = _1286 * 0.15915493667125701904296875;
        float _1326 = _1288 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1322;
        if (_542)
        {
            _1296 = 2.0;
        }
        float _1332 = _1296;
        float _1334 = _1332;
        if (_542)
        {
            _1262 = 2.0;
        }
        float _1336 = _1262;
        float _1338 = _1240 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336;
        if (!_542)
        {
            _1330 = _944;
        }
        float _1344 = _1330;
        float _1346 = _1344;
        if (!_542)
        {
            _1334 = _944;
        }
        float _1348 = _1334;
        float _1350 = _1128 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        float _1354 = _1348;
        if (!_542)
        {
            _1342 = _944;
        }
        float _1356 = _1342;
        float _1358 = fma(_1282, _1310, _1246);
        float _1360 = _1324 * 6.283185482025146484375;
        float _1362 = sin(_1360);
        float _1364 = _1356;
        _816 = _1282;
        if (_542)
        {
            _1320 = 2.0;
        }
        float _1366 = _1320;
        float _1368 = fma(_1292, _1344, _1256);
        float _1370 = _1366;
        _782 = _1368;
        if (!_542)
        {
            _1370 = _944;
        }
        float _1372 = _1370;
        float _1374 = fma(_1306, _1348, _1274);
        float _1376 = fma(_1314, _1356, _1272);
        float _1378 = _1372;
        _886 = _1376;
        _890 = _1306;
        if (_542)
        {
            _1346 = 1.5;
        }
        float _1380 = _1346;
        float _1382 = _1380;
        if (_542)
        {
            _1354 = 1.5;
        }
        float _1384 = _1354;
        float _1386 = _1384;
        if (_542)
        {
            _1298 = 1.5;
        }
        float _1388 = _1298;
        float _1390 = _1388;
        if (_542)
        {
            _1364 = 1.5;
        }
        float _1392 = _1364;
        float _1394 = _1392;
        if (!_542)
        {
            _1382 = _950;
        }
        float _1396 = _1382;
        if (!_542)
        {
            _1386 = _950;
        }
        float _1398 = _1386;
        float _1400 = fma(_1328, _1372, _1358);
        _852 = _1400;
        if (!_542)
        {
            _1390 = _950;
        }
        float _1402 = _1390;
        if (!_542)
        {
            _1394 = _950;
        }
        float _1404 = _1394;
        float _1406 = fma(_1340, _1396, _1368);
        float _1408 = fma(_1318, _1398, _1374);
        float _1410 = fma(_1352, _1402, _1376);
        float _1412 = fma(_1362, _1404, _1400);
        float _1414 = -_1406;
        float _1416 = _1414 + _1408;
        float _1418 = -_1412;
        float _1420 = _1410 + _1418;
        float _1422 = _1412;
        float _1424 = _1420;
        float _1426 = _1416;
        float _1428 = _1410;
        if (_542)
        {
            _1378 = 1.5;
        }
        float _1430 = _1378;
        _856 = _1430;
        if (_542)
        {
            _1422 = 2.0;
        }
        float _1432 = _1422;
        float _1434 = _1420 + _1416;
        _864 = _1432;
        _866 = _1434;
        if (_542)
        {
            _1424 = 3.0;
        }
        float _1436 = _1424;
        _870 = _1436;
        if (_542)
        {
            _1426 = 4.0;
        }
        float _1438 = _1426;
        _874 = _1438;
        if (_542)
        {
            _1428 = 0.1500000059604644775390625;
        }
        float _1440 = _1428;
        _878 = _1440;
        if (_542)
        {
            _1300 = 0.23000000417232513427734375;
        }
        float _1442 = _1300;
        _882 = _1442;
        if (_542)
        {
            _886 = 0.4199999868869781494140625;
        }
    }
    _894 = false;
    float _1444 = _886;
    float _1446 = _882;
    float _1448 = _816;
    float _1450 = _878;
    float _1452 = _782;
    float _1454 = _888;
    float _1456 = _890;
    float _1458 = _852;
    float _1460 = _874;
    float _1462 = _870;
    float _1464 = _630;
    float _1466 = _648;
    float _1468 = _864;
    float _1470 = _650;
    float _1472 = _856;
    float _1474 = _652;
    float _1476 = _892;
    float _1478 = _866;
    float _1480 = _514 + _376;
    float _1482 = _176 + _1480;
    float _1484 = _1482 + _450;
    float _1486 = _1448;
    float _1488 = _1452;
    float _1490 = _1454;
    float _1492 = _1456;
    float _1494 = _1458;
    float _1496 = _1480;
    float _1498 = _1452;
    float _1500 = _1454;
    float _1502 = _1476;
    float _1504 = _1456;
    float _1506 = _1448;
    float _1508 = _1458;
    float _1510 = _1480;
    float _1512 = _1444;
    float _1514 = _1446;
    float _1516 = _1450;
    float _1518 = _1468;
    float _1520 = _1462;
    float _1522 = _1460;
    float _1524 = _1472;
    float _1526 = _1444;
    float _1528 = _1446;
    float _1530 = _1450;
    float _1532 = _1472;
    float _1534 = _1462;
    float _1536 = _1460;
    float _1538 = _1468;
    float _1540 = _1464;
    float _1542 = _1474;
    float _1716;
    float _1752;
    float _1754;
    float _1768;
    float _1802;
    float _1804;
    if (!_460)
    {
        if (_542)
        {
            _1486 = _1444;
        }
        float _1544 = _1486;
        if (_542)
        {
            _1488 = 0.60000002384185791015625;
        }
        float _1546 = _1488;
        if (_542)
        {
            _1490 = _1446;
        }
        float _1548 = _1490;
        float _1550 = _1544;
        if (!_542)
        {
            float _1552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1550 = _1552;
        }
        float _1554 = _1550;
        if (_542)
        {
            _1492 = _1450;
        }
        float _1556 = _1492;
        float _1558 = _1546;
        if (!_542)
        {
            float _1560 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1558 = _1560;
        }
        float _1562 = _1558;
        float _1564 = _1548;
        if (!_542)
        {
            float _1566 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1564 = _1566;
        }
        float _1568 = _1564;
        float _1570 = _1556;
        if (!_542)
        {
            float _1572 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1570 = _1572;
        }
        float _1574 = _1570;
        if (_542)
        {
            _1494 = _1444;
        }
        float _1576 = _1494;
        float _1578 = _1484 * 6.283184051513671875;
        float _1580 = _174 * _1554;
        float _1582 = _1576;
        float _1584 = _1554;
        if (!_542)
        {
            _1582 = _1554;
        }
        float _1586 = _1582;
        float _1588 = _1586;
        if (_542)
        {
            _1584 = 0.60000002384185791015625;
        }
        float _1590 = _1584;
        float _1592 = 1.0 / _1580;
        float _1594 = _174 * _1562;
        float _1596 = _1590;
        if (!_542)
        {
            _1596 = _1562;
        }
        float _1598 = _1596;
        float _1600 = _174 * _1586;
        float _1602 = _174 * _1568;
        float _1604 = _1598;
        if (_542)
        {
            _1588 = _1446;
        }
        float _1606 = _1588;
        float _1608 = _1606;
        if (!_542)
        {
            _1608 = _1568;
        }
        float _1610 = _1608;
        float _1612 = 1.0 / _1594;
        float _1614 = _174 * _1574;
        float _1616 = _174 * _1598;
        if (_542)
        {
            _1604 = _1450;
        }
        float _1618 = _1604;
        float _1620 = _174 * _1610;
        float _1622 = _1618;
        if (!_542)
        {
            _1622 = _1574;
        }
        float _1624 = _1622;
        float _1626 = 1.0 / _1602;
        float _1628 = _1592 * _1578;
        float _1630 = _174 * _1624;
        float _1632 = _1628 * 0.15915493667125701904296875;
        float _1634 = 1.0 / _1600;
        float _1636 = _1612 * _1578;
        float _1638 = _1636 * 0.15915493667125701904296875;
        float _1640 = 1.0 / _1614;
        float _1642 = _1626 * _1578;
        float _1644 = _1642 * 0.15915493667125701904296875;
        float _1646 = 1.0 / _1616;
        float _1648 = 1.0 / _1620;
        float _1650 = _1480 * _1634;
        float _1652 = _1640 * _1578;
        float _1654 = _1650 * 6.283184051513671875;
        float _1656 = 1.0 / _1630;
        float _1658 = _1654 * 0.15915493667125701904296875;
        float _1660 = _1658 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = _1652 * 0.15915493667125701904296875;
        float _1666 = _1480 * _1646;
        float _1668 = _1666 * 6.283184051513671875;
        float _1670 = _1480 * _1648;
        float _1672 = _1632 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        float _1676 = _1480 * _1656;
        float _1678 = _1670;
        float _1680 = _1668;
        if (_542)
        {
            _1496 = _1460;
        }
        float _1682 = _1496;
        float _1684 = _1670 * 6.283184051513671875;
        float _1686 = _1682;
        if (_542)
        {
            _1678 = _1462;
        }
        float _1688 = _1678;
        float _1690 = _1688;
        if (!_542)
        {
            _1690 = _1464;
        }
        float _1692 = _1690;
        float _1694 = _1684 * 0.15915493667125701904296875;
        float _1696 = _1638 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        float _1700 = _1676 * 6.283184051513671875;
        float _1702 = _1692;
        if (!_542)
        {
            _1686 = _1466;
        }
        float _1704 = _1686;
        float _1706 = _1662 * _1692;
        float _1708 = _1704;
        if (_542)
        {
            _1702 = _1460;
        }
        float _1710 = _1702;
        float _1712 = _1700 * 0.15915493667125701904296875;
        float _1714 = _1710;
        _1716 = _1712;
        if (!_542)
        {
            _1714 = _1466;
        }
        float _1718 = _1714;
        float _1720 = _1644 * 6.283185482025146484375;
        float _1722 = sin(_1720);
        float _1724 = _1668 * 0.15915493667125701904296875;
        if (_542)
        {
            _1680 = _1462;
        }
        float _1726 = _1680;
        float _1728 = _1726;
        if (!_542)
        {
            _1728 = _1464;
        }
        float _1730 = _1728;
        float _1732 = _1724 * 6.283185482025146484375;
        float _1734 = sin(_1732);
        float _1736 = _1674 * _1730;
        float _1738 = _1674;
        float _1740 = _1730;
        if (_542)
        {
            _1738 = _1468;
        }
        float _1742 = _1738;
        float _1744 = _1742;
        if (!_542)
        {
            _1744 = _1470;
        }
        float _1746 = _1744;
        float _1748 = fma(_1698, _1704, _1736);
        float _1750 = _1698;
        _1752 = _1746;
        _1754 = _1748;
        if (_542)
        {
            _1708 = _1468;
        }
        float _1756 = _1708;
        float _1758 = _1694 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1756;
        if (!_542)
        {
            _1762 = _1470;
        }
        float _1764 = _1762;
        float _1766 = fma(_1722, _1746, _1748);
        _1768 = _1764;
        if (_542)
        {
            _1750 = _1472;
        }
        float _1770 = _1750;
        float _1772 = _1770;
        if (_542)
        {
            _1740 = _1472;
        }
        float _1774 = _1740;
        float _1776 = _1774;
        if (!_542)
        {
            _1772 = _1474;
        }
        float _1778 = _1772;
        float _1780 = _1664 * 6.283185482025146484375;
        float _1782 = sin(_1780);
        float _1784 = fma(_1734, _1718, _1706);
        if (!_542)
        {
            _1776 = _1474;
        }
        float _1786 = _1776;
        float _1788 = _1712 * 6.283185482025146484375;
        float _1790 = sin(_1788);
        float _1792 = fma(_1760, _1764, _1784);
        float _1794 = fma(_1782, _1778, _1766);
        float _1796 = fma(_1790, _1786, _1792);
        float _1798 = -_1796;
        float _1800 = _1794 + _1798;
        _1802 = _1782;
        _1804 = _1800;
        _1806 = true;
    }
    else
    {
        if (_542)
        {
            _1498 = _1444;
        }
        float _1808 = _1498;
        if (_542)
        {
            _1500 = 0.60000002384185791015625;
        }
        float _1810 = _1500;
        float _1812 = _1808;
        if (!_542)
        {
            float _1814 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1812 = _1814;
        }
        float _1816 = _1812;
        if (_542)
        {
            _1502 = _1450;
        }
        float _1818 = _1502;
        if (_542)
        {
            _1504 = _1446;
        }
        float _1820 = _1504;
        float _1822 = _1810;
        if (!_542)
        {
            float _1824 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1822 = _1824;
        }
        float _1826 = _1822;
        float _1828 = _1818;
        if (!_542)
        {
            float _1830 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1828 = _1830;
        }
        float _1832 = _1828;
        float _1834 = _1820;
        if (!_542)
        {
            float _1836 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1834 = _1836;
        }
        float _1838 = _1834;
        if (_542)
        {
            _1506 = _1444;
        }
        float _1840 = _1506;
        float _1842 = _1840;
        if (_542)
        {
            _1508 = _1444;
        }
        float _1844 = _1508;
        float _1846 = _376 * 6.283184051513671875;
        float _1848 = _1844;
        float _1850 = _1816;
        if (!_542)
        {
            _1842 = _1816;
        }
        float _1852 = _1842;
        float _1854 = _174 * _1816;
        float _1856 = _174 * _1852;
        float _1858 = _1852;
        if (_542)
        {
            _1858 = _1444;
        }
        float _1860 = _1858;
        float _1862 = _1860;
        if (!_542)
        {
            _1862 = _1816;
        }
        float _1864 = _1862;
        float _1866 = _1864;
        if (!_542)
        {
            _1848 = _1816;
        }
        float _1868 = _1848;
        float _1870 = 1.0 / _1854;
        float _1872 = _174 * _1864;
        float _1874 = _1868;
        if (_542)
        {
            _1866 = 0.60000002384185791015625;
        }
        float _1876 = _1866;
        float _1878 = _174 * _1832;
        float _1880 = _1876;
        if (!_542)
        {
            _1880 = _1826;
        }
        float _1882 = _1880;
        float _1884 = _174 * _1838;
        float _1886 = _174 * _1868;
        float _1888 = _1882;
        if (_542)
        {
            _1874 = 0.60000002384185791015625;
        }
        float _1890 = _1874;
        float _1892 = _1890;
        if (!_542)
        {
            _1892 = _1826;
        }
        float _1894 = _1892;
        float _1896 = _174 * _1826;
        float _1898 = _1894;
        if (_542)
        {
            _1850 = 0.60000002384185791015625;
        }
        float _1900 = _1850;
        float _1902 = 1.0 / _1878;
        float _1904 = _1900;
        if (!_542)
        {
            _1904 = _1826;
        }
        float _1906 = _1904;
        float _1908 = 1.0 / _1884;
        float _1910 = _174 * _1882;
        float _1912 = _1906;
        if (_542)
        {
            _1888 = _1446;
        }
        float _1914 = _1888;
        float _1916 = _1914;
        if (!_542)
        {
            _1916 = _1838;
        }
        float _1918 = _1916;
        float _1920 = 1.0 / _1896;
        float _1922 = _174 * _1894;
        float _1924 = _1918;
        if (_542)
        {
            _1898 = _1446;
        }
        float _1926 = _1898;
        float _1928 = _1926;
        if (!_542)
        {
            _1928 = _1838;
        }
        float _1930 = _1928;
        float _1932 = _174 * _1906;
        float _1934 = _1930;
        if (_542)
        {
            _1912 = _1446;
        }
        float _1936 = _1912;
        float _1938 = _1936;
        if (!_542)
        {
            _1938 = _1838;
        }
        float _1940 = _1938;
        float _1942 = _174 * _1918;
        float _1944 = _1940;
        if (_542)
        {
            _1924 = _1450;
        }
        float _1946 = _1924;
        float _1948 = _174 * _1930;
        float _1950 = _1946;
        if (!_542)
        {
            _1950 = _1832;
        }
        float _1952 = _1950;
        float _1954 = 1.0 / _1856;
        if (_542)
        {
            _1934 = _1450;
        }
        float _1956 = _1934;
        float _1958 = _1956;
        if (!_542)
        {
            _1958 = _1832;
        }
        float _1960 = _1958;
        float _1962 = _1484 * 6.283184051513671875;
        float _1964 = 1.0 / _1948;
        float _1966 = _174 * _1952;
        float _1968 = _1870 * _1962;
        float _1970 = 1.0 / _1886;
        float _1972 = 1.0 / _1942;
        float _1974 = _174 * _1940;
        if (_542)
        {
            _1944 = _1450;
        }
        float _1976 = _1944;
        float _1978 = 1.0 / _1932;
        float _1980 = _1968 * 0.15915493667125701904296875;
        float _1982 = _1920 * _1962;
        float _1984 = _1976;
        if (!_542)
        {
            _1984 = _1832;
        }
        float _1986 = _1984;
        float _1988 = 1.0 / _1872;
        float _1990 = 1.0 / _1974;
        float _1992 = _174 * _1960;
        float _1994 = _1982 * 0.15915493667125701904296875;
        float _1996 = _1908 * _1962;
        float _1998 = 1.0 / _1922;
        float _2000 = 1.0 / _1992;
        float _2002 = 1.0 / _1910;
        float _2004 = _376 + _450;
        float _2006 = _2004 * 6.283184051513671875;
        float _2008 = _1996 * 0.15915493667125701904296875;
        float _2010 = _1902 * _1962;
        float _2012 = 1.0 / _1966;
        float _2014 = _174 * _1986;
        float _2016 = _1988 * _1846;
        float _2018 = _2010 * 0.15915493667125701904296875;
        float _2020 = _1970 * _2006;
        float _2022 = 1.0 / _2014;
        float _2024 = _2016 * 0.15915493667125701904296875;
        float _2026 = _2020 * 0.15915493667125701904296875;
        float _2028 = _1480 * _1954;
        float _2030 = _1998 * _2006;
        float _2032 = _1980 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        float _2036 = _2028 * 6.283184051513671875;
        float _2038 = _2030 * 0.15915493667125701904296875;
        float _2040 = _2002 * _1846;
        float _2042 = _2024 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = _2036 * 0.15915493667125701904296875;
        float _2048 = _2040 * 0.15915493667125701904296875;
        float _2050 = _2040;
        float _2052 = _2004;
        if (_542)
        {
            _2050 = _1462;
        }
        float _2054 = _2050;
        float _2056 = _2054;
        if (!_542)
        {
            _2056 = _1464;
        }
        float _2058 = _2056;
        float _2060 = _2026 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        float _2064 = _1964 * _2006;
        float _2066 = _2034 * _2058;
        float _2068 = _2058;
        float _2070 = _2064;
        if (_542)
        {
            _2068 = _1462;
        }
        float _2072 = _2068;
        float _2074 = _2046 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _1972 * _1846;
        float _2080 = _2072;
        if (!_542)
        {
            _2080 = _1464;
        }
        float _2082 = _2080;
        float _2084 = _2064 * 0.15915493667125701904296875;
        if (_542)
        {
            _2070 = _1462;
        }
        float _2086 = _2070;
        float _2088 = _2078 * 0.15915493667125701904296875;
        float _2090 = _1994 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        float _2094 = _2086;
        if (_542)
        {
            _2052 = _1462;
        }
        float _2096 = _2052;
        float _2098 = _2000 * _2006;
        float _2100 = _2096;
        if (!_542)
        {
            _2094 = _1464;
        }
        float _2102 = _2094;
        float _2104 = _2044 * _2082;
        float _2106 = _2048 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = _2102;
        if (!_542)
        {
            _2100 = _1464;
        }
        float _2112 = _2100;
        float _2114 = _1480 * _1978;
        float _2116 = _2062 * _2102;
        float _2118 = _2098 * 0.15915493667125701904296875;
        float _2120 = _2076 * _2112;
        float _2122 = _2114 * 6.283184051513671875;
        float _2124 = _2112;
        float _2126 = _2114;
        if (_542)
        {
            _2124 = _1460;
        }
        float _2128 = _2124;
        float _2130 = _2128;
        if (_542)
        {
            _2126 = _1460;
        }
        float _2132 = _2126;
        float _2134 = _2132;
        if (!_542)
        {
            _2130 = _1466;
        }
        float _2136 = _2130;
        if (!_542)
        {
            _2134 = _1466;
        }
        float _2138 = _2134;
        float _2140 = _1480 * _1990;
        float _2142 = _2122 * 0.15915493667125701904296875;
        float _2144 = _2012 * _1846;
        float _2146 = fma(_2092, _2136, _2066);
        float _2148 = fma(_2108, _2138, _2104);
        float _2150 = _2038 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = _1480 * _2022;
        float _2156 = _2140 * 6.283184051513671875;
        float _2158 = _2144 * 0.15915493667125701904296875;
        float _2160 = _2154 * 6.283184051513671875;
        float _2162 = _2156 * 0.15915493667125701904296875;
        float _2164 = _2142 * 6.283185482025146484375;
        float _2166 = sin(_2164);
        float _2168 = _2140;
        float _2170 = _2156;
        float _2172 = _2160;
        _1754 = _2146;
        if (_542)
        {
            _2110 = _1460;
        }
        float _2174 = _2110;
        float _2176 = _2174;
        if (!_542)
        {
            _2176 = _1466;
        }
        float _2178 = _2176;
        float _2180 = _2008 * 6.283185482025146484375;
        float _2182 = sin(_2180);
        float _2184 = _2178;
        if (_542)
        {
            _2168 = _1460;
        }
        float _2186 = _2168;
        float _2188 = _2084 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2186;
        if (!_542)
        {
            _2192 = _1466;
        }
        float _2194 = _2192;
        float _2196 = _2088 * 6.283185482025146484375;
        float _2198 = sin(_2196);
        float _2200 = _2158 * 6.283185482025146484375;
        float _2202 = sin(_2200);
        float _2204 = fma(_2152, _2178, _2116);
        float _2206 = _2160 * 0.15915493667125701904296875;
        float _2208 = _2162 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = _2194;
        _1802 = _2166;
        if (_542)
        {
            _2184 = _1468;
        }
        float _2214 = _2184;
        float _2216 = _2214;
        if (_542)
        {
            _1510 = _1468;
        }
        float _2218 = _1510;
        float _2220 = _2218;
        if (_542)
        {
            _2170 = _1468;
        }
        float _2222 = _2170;
        float _2224 = _2018 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2222;
        if (!_542)
        {
            _2216 = _1470;
        }
        float _2230 = _2216;
        float _2232 = fma(_2166, _2194, _2120);
        float _2234 = _2230;
        if (!_542)
        {
            _2220 = _1470;
        }
        float _2236 = _2220;
        float _2238 = _2118 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2236;
        if (!_542)
        {
            _2228 = _1470;
        }
        float _2244 = _2228;
        float _2246 = _2206 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2244;
        if (_542)
        {
            _2212 = _1468;
        }
        float _2252 = _2212;
        float _2254 = _2252;
        if (!_542)
        {
            _2254 = _1470;
        }
        float _2256 = _2254;
        float _2258 = fma(_2182, _2230, _2146);
        float _2260 = fma(_2190, _2236, _2204);
        float _2262 = fma(_2198, _2244, _2148);
        _1716 = _2260;
        if (_542)
        {
            _2172 = _1472;
        }
        float _2264 = _2172;
        float _2266 = _2264;
        if (_542)
        {
            _2234 = _1472;
        }
        float _2268 = _2234;
        float _2270 = _2268;
        if (_542)
        {
            _2242 = _1472;
        }
        float _2272 = _2242;
        float _2274 = _2272;
        if (_542)
        {
            _2250 = _1472;
        }
        float _2276 = _2250;
        float _2278 = fma(_2210, _2256, _2232);
        float _2280 = _2276;
        if (!_542)
        {
            _2266 = _1474;
        }
        float _2282 = _2266;
        if (!_542)
        {
            _2274 = _1474;
        }
        float _2284 = _2274;
        _1768 = _2284;
        if (!_542)
        {
            _2280 = _1474;
        }
        float _2286 = _2280;
        if (!_542)
        {
            _2270 = _1474;
        }
        float _2288 = _2270;
        float _2290 = fma(_2226, _2282, _2258);
        float _2292 = fma(_2240, _2284, _2260);
        float _2294 = fma(_2202, _2286, _2262);
        float _2296 = fma(_2248, _2288, _2278);
        float _2298 = -_2292;
        float _2300 = _2298 + _2294;
        float _2302 = -_2296;
        float _2304 = _2290 + _2302;
        float _2306 = _2304 + _2300;
        _1752 = _2288;
        _1804 = _2306;
    }
    _1806 = false;
    float _2308 = _1768;
    float _2310 = _1752;
    float _2312 = _1754;
    float _2314 = _1802;
    float _2316 = _1716;
    float _2318 = _1804;
    float _2320 = _514 + _378;
    float _2322 = _202 * _176;
    float _2324 = _196 * _176;
    float _2326 = _208 * _176;
    float _2328 = _176 + _2320;
    float _2330 = fma(_278, _2322, _234);
    float _2332 = fma(_278, _2324, _228);
    float _2334 = fma(_278, _2326, _240);
    float _2336 = _2328 + _450;
    float _2338 = _2308;
    float _2340 = _2310;
    float _2342 = _2308;
    float _2344 = _2312;
    float _2346 = _2314;
    float _2348 = _2320;
    float _2350 = _2312;
    float _2352 = _2314;
    float _2354 = _2316;
    float _2448;
    float _2450;
    float _2458;
    float _2488;
    float _2490;
    float _2492;
    float _2516;
    float _2536;
    float _2538;
    float _2586;
    float _2588;
    float _2590;
    float _2592;
    float _2594;
    float _2596;
    float _2598;
    float _2600;
    float _2602;
    float _2604;
    float _2606;
    if (!_460)
    {
        if (_542)
        {
            _314 = _1444;
        }
        float _2356 = _314;
        if (_542)
        {
            _316 = 0.60000002384185791015625;
        }
        float _2358 = _316;
        float _2360 = _2356;
        if (!_542)
        {
            float _2362 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2360 = _2362;
        }
        float _2364 = _2360;
        if (_542)
        {
            _464 = _1446;
        }
        float _2366 = _464;
        float _2368 = _2358;
        if (!_542)
        {
            float _2370 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2368 = _2370;
        }
        float _2372 = _2368;
        if (_542)
        {
            _2338 = _1450;
        }
        float _2374 = _2338;
        float _2376 = _2366;
        if (!_542)
        {
            float _2378 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2376 = _2378;
        }
        float _2380 = _2376;
        float _2382 = _2374;
        if (!_542)
        {
            float _2384 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2382 = _2384;
        }
        float _2386 = _2382;
        float _2388 = _174 * _2364;
        float _2390 = _2364;
        if (!_542)
        {
            _1512 = _2364;
        }
        float _2392 = _1512;
        if (_542)
        {
            _2390 = 0.60000002384185791015625;
        }
        float _2394 = _2390;
        float _2396 = _174 * _2372;
        float _2398 = _2394;
        if (!_542)
        {
            _2398 = _2372;
        }
        float _2400 = _2398;
        float _2402 = 1.0 / _2388;
        float _2404 = _174 * _2392;
        float _2406 = _174 * _2380;
        float _2408 = _2336 * 6.283184051513671875;
        float _2410 = _2408;
        if (!_542)
        {
            _1514 = _2380;
        }
        float _2412 = _1514;
        float _2414 = _174 * _2386;
        if (!_542)
        {
            _1516 = _2386;
        }
        float _2416 = _1516;
        float _2418 = 1.0 / _2396;
        float _2420 = _174 * _2412;
        float _2422 = _174 * _2416;
        float _2424 = 1.0 / _2406;
        float _2426 = _174 * _2400;
        float _2428 = _2402 * _2408;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = 1.0 / _2414;
        float _2434 = _2418 * _2408;
        float _2436 = _2434 * 0.15915493667125701904296875;
        float _2438 = 1.0 / _2404;
        float _2440 = _2424 * _2408;
        float _2442 = _2440 * 0.15915493667125701904296875;
        float _2444 = 1.0 / _2426;
        float _2446 = _2432 * _2408;
        _2448 = _2432;
        _2450 = _2418;
        if (_542)
        {
            _2410 = _1468;
        }
        float _2452 = _2410;
        float _2454 = _2452;
        if (!_542)
        {
            _2454 = _1470;
        }
        float _2456 = _2454;
        _2458 = _2456;
        if (!_542)
        {
            _1518 = _1470;
        }
        float _2460 = _1518;
        float _2462 = 1.0 / _2420;
        float _2464 = _2320 * _2438;
        float _2466 = _2464 * 6.283184051513671875;
        float _2468 = 1.0 / _2422;
        float _2470 = _2446 * 0.15915493667125701904296875;
        float _2472 = _2320 * _2444;
        float _2474 = _2466 * 0.15915493667125701904296875;
        float _2476 = _2472 * 6.283184051513671875;
        float _2478 = _2320 * _2462;
        float _2480 = _2430 * 6.283185482025146484375;
        float _2482 = sin(_2480);
        float _2484 = _2476 * 0.15915493667125701904296875;
        float _2486 = _2476;
        _2488 = _2444;
        _2490 = _2460;
        _2492 = _2438;
        if (_542)
        {
            _2486 = _1462;
        }
        float _2494 = _2486;
        float _2496 = _2478 * 6.283184051513671875;
        float _2498 = _2494;
        float _2500 = _2496;
        if (!_542)
        {
            _2498 = _1464;
        }
        float _2502 = _2498;
        float _2504 = _2502;
        if (!_542)
        {
            _1520 = _1464;
        }
        float _2506 = _1520;
        float _2508 = _2320 * _2468;
        float _2510 = _2474 * 6.283185482025146484375;
        float _2512 = sin(_2510);
        float _2514 = _2496 * 0.15915493667125701904296875;
        _2516 = _2506;
        if (_542)
        {
            _2500 = _1460;
        }
        float _2518 = _2500;
        float _2520 = _2508 * 6.283184051513671875;
        float _2522 = _2518;
        if (!_542)
        {
            _2522 = _1466;
        }
        float _2524 = _2522;
        if (!_542)
        {
            _1522 = _1466;
        }
        float _2526 = _1522;
        float _2528 = _2520 * 0.15915493667125701904296875;
        float _2530 = _2436 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2482 * _2502;
        _2536 = _2534;
        _2538 = _2526;
        if (_542)
        {
            _2504 = _1472;
        }
        float _2540 = _2504;
        float _2542 = _2540;
        if (!_542)
        {
            _2542 = _1474;
        }
        float _2544 = _2542;
        if (!_542)
        {
            _1524 = _1474;
        }
        float _2546 = _1524;
        float _2548 = _2484 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        float _2552 = _2512 * _2506;
        float _2554 = _2442 * 6.283185482025146484375;
        float _2556 = sin(_2554);
        float _2558 = fma(_2532, _2524, _2534);
        float _2560 = _2514 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = fma(_2550, _2526, _2552);
        float _2566 = _2470 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = fma(_2556, _2456, _2558);
        float _2572 = _2528 * 6.283185482025146484375;
        float _2574 = sin(_2572);
        float _2576 = fma(_2562, _2460, _2564);
        float _2578 = fma(_2568, _2544, _2570);
        float _2580 = fma(_2574, _2546, _2576);
        float _2582 = -_2580;
        float _2584 = _2578 + _2582;
        _2586 = _2564;
        _2588 = _2576;
        _2590 = _2568;
        _2592 = _2584;
        _2594 = _2552;
        _2596 = _2580;
        _2598 = _2546;
        _2600 = _2558;
        _2602 = _2578;
        _2604 = _2532;
        _2606 = _2570;
        _2608 = true;
    }
    else
    {
        if (_542)
        {
            _2340 = _1444;
        }
        float _2610 = _2340;
        if (_542)
        {
            _2342 = 0.60000002384185791015625;
        }
        float _2612 = _2342;
        float _2614 = _2610;
        if (!_542)
        {
            float _2616 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2614 = _2616;
        }
        float _2618 = _2614;
        if (_542)
        {
            _2344 = _1446;
        }
        float _2620 = _2344;
        float _2622 = _2612;
        if (!_542)
        {
            float _2624 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2622 = _2624;
        }
        float _2626 = _2622;
        if (_542)
        {
            _2346 = _1450;
        }
        float _2628 = _2346;
        float _2630 = _2620;
        if (!_542)
        {
            float _2632 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2630 = _2632;
        }
        float _2634 = _2630;
        float _2636 = _2628;
        if (!_542)
        {
            float _2638 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2636 = _2638;
        }
        float _2640 = _2636;
        if (_542)
        {
            _318 = _1444;
        }
        float _2642 = _318;
        float _2644 = _2336 * 6.283184051513671875;
        float _2646 = _2642;
        if (_542)
        {
            _320 = _1444;
        }
        float _2648 = _320;
        float _2650 = _378 + _450;
        float _2652 = _378 * 6.283184051513671875;
        float _2654 = _2650 * 6.283184051513671875;
        float _2656 = _2648;
        float _2658 = _2654;
        if (!_542)
        {
            _2646 = _2618;
        }
        float _2660 = _2646;
        float _2662 = _174 * _2618;
        float _2664 = _2660;
        if (!_542)
        {
            _2656 = _2618;
        }
        float _2666 = _2656;
        float _2668 = _174 * _2626;
        float _2670 = _174 * _2660;
        float _2672 = _2666;
        if (_542)
        {
            _2664 = 0.60000002384185791015625;
        }
        float _2674 = _2664;
        float _2676 = _174 * _2666;
        float _2678 = _2674;
        if (!_542)
        {
            _2678 = _2626;
        }
        float _2680 = _2678;
        float _2682 = 1.0 / _2668;
        float _2684 = _2680;
        if (_542)
        {
            _2672 = 0.60000002384185791015625;
        }
        float _2686 = _2672;
        float _2688 = _174 * _2634;
        float _2690 = _2686;
        if (!_542)
        {
            _2690 = _2626;
        }
        float _2692 = _2690;
        float _2694 = _174 * _2640;
        float _2696 = _2692;
        if (!_542)
        {
            _1526 = _2618;
        }
        float _2698 = _1526;
        float _2700 = 1.0 / _2662;
        float _2702 = _174 * _2680;
        if (_542)
        {
            _2684 = 0.60000002384185791015625;
        }
        float _2704 = _2684;
        float _2706 = _174 * _2698;
        float _2708 = _2704;
        if (!_542)
        {
            _2708 = _2626;
        }
        float _2710 = _2708;
        float _2712 = 1.0 / _2688;
        float _2714 = _174 * _2710;
        float _2716 = _2710;
        if (_542)
        {
            _2716 = _1446;
        }
        float _2718 = _2716;
        float _2720 = _2718;
        if (!_542)
        {
            _2720 = _2634;
        }
        float _2722 = _2720;
        float _2724 = 1.0 / _2702;
        float _2726 = _174 * _2692;
        float _2728 = _2722;
        if (_542)
        {
            _2696 = _1446;
        }
        float _2730 = _2696;
        float _2732 = _2730;
        if (!_542)
        {
            _1528 = _2634;
        }
        float _2734 = _1528;
        if (!_542)
        {
            _2732 = _2634;
        }
        float _2736 = _2732;
        float _2738 = 1.0 / _2676;
        float _2740 = _174 * _2722;
        float _2742 = _2736;
        if (_542)
        {
            _2728 = _1450;
        }
        float _2744 = _2728;
        float _2746 = _2744;
        if (!_542)
        {
            _2746 = _2640;
        }
        float _2748 = _2746;
        float _2750 = 1.0 / _2726;
        float _2752 = 1.0 / _2694;
        float _2754 = _174 * _2734;
        float _2756 = _174 * _2748;
        float _2758 = _2700 * _2644;
        float _2760 = _2320 * _2738;
        float _2762 = 1.0 / _2670;
        float _2764 = _2758 * 0.15915493667125701904296875;
        float _2766 = _2682 * _2644;
        float _2768 = _2760 * 6.283184051513671875;
        float _2770 = _2768 * 0.15915493667125701904296875;
        float _2772 = 1.0 / _2706;
        float _2774 = _2768;
        if (_542)
        {
            _2774 = _1462;
        }
        float _2776 = _2774;
        float _2778 = _2776;
        if (!_542)
        {
            _2778 = _1464;
        }
        float _2780 = _2778;
        float _2782 = 1.0 / _2754;
        float _2784 = _174 * _2736;
        _2602 = _2780;
        if (_542)
        {
            _2742 = _1450;
        }
        float _2786 = _2742;
        float _2788 = _2786;
        if (!_542)
        {
            _2788 = _2640;
        }
        float _2790 = _2788;
        if (!_542)
        {
            _1530 = _2640;
        }
        float _2792 = _1530;
        float _2794 = 1.0 / _2714;
        float _2796 = _2766 * 0.15915493667125701904296875;
        float _2798 = _2712 * _2644;
        float _2800 = _174 * _2790;
        float _2802 = _174 * _2792;
        float _2804 = _2802;
        if (_542)
        {
            _322 = _1472;
        }
        float _2806 = _322;
        float _2808 = _2798 * 0.15915493667125701904296875;
        float _2810 = _2752 * _2644;
        float _2812 = 1.0 / _2800;
        float _2814 = _2806;
        if (!_542)
        {
            _2814 = _1474;
        }
        float _2816 = _2814;
        float _2818 = 1.0 / _2740;
        float _2820 = _2810 * 0.15915493667125701904296875;
        float _2822 = _2762 * _2654;
        float _2824 = _2822 * 0.15915493667125701904296875;
        float _2826 = _2772 * _2652;
        float _2828 = 1.0 / _2756;
        float _2830 = _2826 * 0.15915493667125701904296875;
        float _2832 = _2750 * _2654;
        float _2834 = 1.0 / _2784;
        float _2836 = _2832 * 0.15915493667125701904296875;
        float _2838 = _2794 * _2652;
        float _2840 = _2794;
        _2604 = _2816;
        if (_542)
        {
            _2840 = _1472;
        }
        float _2842 = _2840;
        float _2844 = _2842;
        if (!_542)
        {
            _2844 = _1474;
        }
        float _2846 = _2844;
        float _2848 = _2838 * 0.15915493667125701904296875;
        float _2850 = _2818 * _2654;
        float _2852 = 1.0 / _2802;
        float _2854 = _2818;
        if (_542)
        {
            _2854 = _1468;
        }
        float _2856 = _2854;
        float _2858 = _2850 * 0.15915493667125701904296875;
        float _2860 = _2828 * _2654;
        float _2862 = _2828;
        float _2864 = _2856;
        if (_542)
        {
            _2862 = _1462;
        }
        float _2866 = _2862;
        float _2868 = _2866;
        if (_542)
        {
            _2658 = _1462;
        }
        float _2870 = _2658;
        float _2872 = _2820 * 6.283185482025146484375;
        float _2874 = sin(_2872);
        float _2876 = _2870;
        if (_542)
        {
            _2804 = _1472;
        }
        float _2878 = _2804;
        float _2880 = _2878;
        if (!_542)
        {
            _2880 = _1474;
        }
        float _2882 = _2880;
        _2588 = _2882;
        if (!_542)
        {
            _1532 = _1474;
        }
        float _2884 = _1532;
        float _2886 = _2860 * 0.15915493667125701904296875;
        if (!_542)
        {
            _2868 = _1464;
        }
        float _2888 = _2868;
        float _2890 = _2852 * _2652;
        float _2892 = _2782 * _2652;
        float _2894 = _2764 * 6.283185482025146484375;
        float _2896 = sin(_2894);
        float _2898 = _2852;
        float _2900 = _2892;
        if (!_542)
        {
            _2876 = _1464;
        }
        float _2902 = _2876;
        float _2904 = _2890 * 0.15915493667125701904296875;
        float _2906 = _2320 * _2724;
        float _2908 = _2892 * 0.15915493667125701904296875;
        _2536 = _2902;
        if (!_542)
        {
            _1534 = _1464;
        }
        float _2910 = _1534;
        float _2912 = _2906 * 6.283184051513671875;
        float _2914 = _2320 * _2834;
        float _2916 = _2824 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2516 = _2910;
        if (_542)
        {
            _2898 = _1468;
        }
        float _2920 = _2898;
        float _2922 = _2912 * 0.15915493667125701904296875;
        float _2924 = _2914 * 6.283184051513671875;
        float _2926 = _2320 * _2812;
        float _2928 = _2924;
        float _2930 = _2926;
        float _2932 = _2920;
        if (_542)
        {
            _2348 = _1460;
        }
        float _2934 = _2348;
        float _2936 = _2924 * 0.15915493667125701904296875;
        float _2938 = _2830 * 6.283185482025146484375;
        float _2940 = sin(_2938);
        float _2942 = _2926 * 6.283184051513671875;
        float _2944 = _2934;
        if (_542)
        {
            _2928 = _1460;
        }
        float _2946 = _2928;
        float _2948 = _2896 * _2888;
        float _2950 = _2946;
        _2488 = _2896;
        _2590 = _2948;
        if (_542)
        {
            _2930 = _1460;
        }
        float _2952 = _2930;
        float _2954 = _2942 * 0.15915493667125701904296875;
        float _2956 = _2952;
        _1540 = _2954;
        if (!_542)
        {
            _2944 = _1466;
        }
        float _2958 = _2944;
        float _2960 = _2770 * 6.283185482025146484375;
        float _2962 = sin(_2960);
        _2596 = _2958;
        if (!_542)
        {
            _2950 = _1466;
        }
        float _2964 = _2950;
        float _2966 = _2918 * _2780;
        if (!_542)
        {
            _2956 = _1466;
        }
        float _2968 = _2956;
        if (!_542)
        {
            _1536 = _1466;
        }
        float _2970 = _1536;
        _2538 = _2970;
        if (_542)
        {
            _2900 = _1468;
        }
        float _2972 = _2900;
        float _2974 = _2796 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2940 * _2910;
        float _2980 = _2972;
        if (!_542)
        {
            _2932 = _1470;
        }
        float _2982 = _2932;
        _2492 = _2982;
        if (!_542)
        {
            _2864 = _1470;
        }
        float _2984 = _2864;
        _2594 = _2984;
        if (!_542)
        {
            _2980 = _1470;
        }
        float _2986 = _2980;
        float _2988 = _2836 * 6.283185482025146484375;
        float _2990 = sin(_2988);
        float _2992 = _2962 * _2902;
        _2458 = _2986;
        if (!_542)
        {
            _1538 = _1470;
        }
        float _2994 = _1538;
        float _2996 = _2848 * 6.283185482025146484375;
        float _2998 = sin(_2996);
        float _3000 = fma(_2976, _2958, _2948);
        float _3002 = _2922 * 6.283185482025146484375;
        float _3004 = sin(_3002);
        float _3006 = fma(_2990, _2968, _2966);
        float _3008 = _2808 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        float _3012 = fma(_2998, _2970, _2978);
        float _3014 = _2858 * 6.283185482025146484375;
        float _3016 = sin(_3014);
        float _3018 = fma(_3004, _2964, _2992);
        float _3020 = _2908 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = fma(_3010, _2982, _3000);
        float _3026 = fma(_2874, _2846, _3024);
        float _3028 = _2936 * 6.283185482025146484375;
        float _3030 = sin(_3028);
        float _3032 = fma(_3016, _2986, _3006);
        float _3034 = _2886 * 6.283185482025146484375;
        float _3036 = sin(_3034);
        float _3038 = fma(_3022, _2994, _3012);
        float _3040 = _2904 * 6.283185482025146484375;
        float _3042 = sin(_3040);
        float _3044 = fma(_3030, _2984, _3018);
        float _3046 = _2954 * 6.283185482025146484375;
        float _3048 = sin(_3046);
        float _3050 = fma(_3036, _2816, _3032);
        float _3052 = fma(_3042, _2884, _3038);
        float _3054 = -_3050;
        float _3056 = _3054 + _3052;
        float _3058 = fma(_3048, _2882, _3044);
        float _3060 = -_3058;
        float _3062 = _3026 + _3060;
        float _3064 = _3062 + _3056;
        _2350 = _3004;
        _2352 = _3030;
        _2586 = _3062;
        _2448 = _3000;
        _2450 = _3024;
        _2490 = _2994;
        _1542 = _3050;
        _2354 = _3048;
        _2592 = _3064;
        _2598 = _3056;
        _2600 = _3006;
        _2606 = _3058;
    }
    _2608 = false;
    float _3066 = _2350;
    float _3068 = _2352;
    float _3070 = _1540;
    float _3072 = _2586;
    float _3074 = _2448;
    float _3076 = _2450;
    float _3078 = _2488;
    float _3080 = _2490;
    float _3082 = _2588;
    float _3084 = _2590;
    float _3086 = _2492;
    float _3088 = _1542;
    float _3090 = _2354;
    float _3092 = _2592;
    float _3094 = _2536;
    float _3096 = _2594;
    float _3098 = _2596;
    float _3100 = _2598;
    float _3102 = _2600;
    float _3104 = _2602;
    float _3106 = _2458;
    float _3108 = _2538;
    float _3110 = _2604;
    float _3112 = _2516;
    float _3114 = _2606;
    float _3116 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[50]);
    int _3118 = as_type<int>(_244) & 1024;
    bool _3120 = _3118 != 0;
    int _3122 = as_type<int>(_244) & 2048;
    bool _3124 = _3122 != 0;
    float _3126 = _3066;
    float _3128 = _1466;
    float _3130 = _3068;
    float _3132 = _3070;
    if (_520)
    {
        float _3134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3140 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3126 = _3134;
        _3128 = _3136;
        _3130 = _3138;
        _3132 = _3140;
    }
    float _3142 = _3126;
    float _3144 = _3128;
    float _3146 = _3130;
    float _3148 = _3132;
    float _3150 = _3072;
    float _3152 = _3074;
    float _3154 = _3076;
    float _3156 = _3078;
    if (_520)
    {
        float _3158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3150 = _3158;
        _3152 = _3160;
        _3154 = _3162;
        _3156 = _3164;
    }
    float _3166 = _3150;
    float _3168 = _3152;
    float _3170 = _3154;
    float _3172 = _3156;
    float _3174 = _3080;
    float _3176 = _3082;
    float _3178 = _3084;
    float _3180 = _3086;
    if (_3120)
    {
        uint _3182 = uint(int(uint(_150) >> uint(2)));
        float _3184 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3182)]);
        int _3186 = _150 + 4;
        uint _3188 = uint(int(uint(_3186) >> uint(2)));
        float _3190 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3188)]);
        int _3192 = _150 + 8;
        uint _3194 = uint(int(uint(_3192) >> uint(2)));
        float _3196 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3194)]);
        int _3198 = _150 + 12;
        uint _3200 = uint(int(uint(_3198) >> uint(2)));
        float _3202 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3200)]);
        _3174 = _3184;
        _3176 = _3190;
        _3178 = _3196;
        _3180 = _3202;
    }
    float _3204 = _3174;
    float _3206 = _3176;
    float _3208 = _3178;
    float _3210 = _3180;
    float _3212 = _3088;
    if (_3120)
    {
        float _3214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3212 = _3214;
    }
    float _3216 = _3212;
    float _3218 = _3090;
    if (_3120)
    {
        float _3220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = fma(_186, _2318, _2330);
    float _3226 = fma(_188, _3092, _2334);
    float _3228 = _3094;
    float _3230 = _3096;
    float _3232 = _3098;
    float _3234 = _3100;
    if (_3120)
    {
        uint _3236 = uint(int(uint(_150) >> uint(2)));
        float _3238 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3236)]);
        int _3240 = _150 + 4;
        uint _3242 = uint(int(uint(_3240) >> uint(2)));
        float _3244 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3242)]);
        int _3246 = _150 + 8;
        uint _3248 = uint(int(uint(_3246) >> uint(2)));
        float _3250 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3248)]);
        int _3252 = _150 + 12;
        uint _3254 = uint(int(uint(_3252) >> uint(2)));
        float _3256 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3254)]);
        _3228 = _3238;
        _3230 = _3244;
        _3232 = _3250;
        _3234 = _3256;
    }
    float _3258 = _3228;
    float _3260 = _3230;
    float _3262 = _3232;
    float _3264 = _3234;
    float _3266 = fma(_184, _1478, _2332);
    float _3268 = _3102;
    float _3270 = _3104;
    float _3272 = _3106;
    float _3274 = _3108;
    if (_3124)
    {
        uint _3276 = uint(int(uint(_150) >> uint(2)));
        float _3278 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3276)]);
        int _3280 = _150 + 4;
        uint _3282 = uint(int(uint(_3280) >> uint(2)));
        float _3284 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3282)]);
        int _3286 = _150 + 8;
        uint _3288 = uint(int(uint(_3286) >> uint(2)));
        float _3290 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3288)]);
        int _3292 = _150 + 12;
        uint _3294 = uint(int(uint(_3292) >> uint(2)));
        float _3296 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3294)]);
        _3268 = _3278;
        _3270 = _3284;
        _3272 = _3290;
        _3274 = _3296;
    }
    float _3298 = _3268;
    float _3300 = _3270;
    float _3302 = _3272;
    float _3304 = _3274;
    float _3306 = _244;
    float _3308 = _3110;
    float _3310 = _3112;
    float _3312 = _3114;
    if (_3124)
    {
        uint _3314 = uint(int(uint(_150) >> uint(2)));
        float _3316 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3314)]);
        int _3318 = _150 + 4;
        uint _3320 = uint(int(uint(_3318) >> uint(2)));
        float _3322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3320)]);
        int _3324 = _150 + 8;
        uint _3326 = uint(int(uint(_3324) >> uint(2)));
        float _3328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3326)]);
        int _3330 = _150 + 12;
        uint _3332 = uint(int(uint(_3330) >> uint(2)));
        float _3334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3332)]);
        _3306 = _3316;
        _3308 = _3322;
        _3310 = _3328;
        _3312 = _3334;
    }
    float _3336 = _3306;
    float _3338 = _3308;
    float _3340 = _3310;
    float _3342 = _3312;
    float _3344 = trunc(_3116);
    int _3346 = int(_3344);
    bool _3348 = _3346 != 0;
    bool _3350 = _3346 != 1;
    bool _3352 = _3346 != 2;
    if (_3348)
    {
        _324 = _3224;
    }
    float _3354 = _324;
    float _3356 = _3210;
    float _3358 = _3354;
    float _3360 = _3206;
    if (_3348)
    {
        _3356 = _3226;
    }
    float _3362 = _3356;
    float _3364 = _3362;
    float _3366 = _3264;
    float _3368 = _3260;
    float _3370 = _3144;
    float _3372 = _3168;
    float _3374 = _3258;
    float _3376 = _3338;
    float _3378 = _3298;
    float _3380 = _3146;
    float _3382 = _3170;
    float _3384 = _3302;
    float _3386 = _3340;
    if (!_3348)
    {
        float _3388 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _3390 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _3392 = _278 * _3388;
        float _3394 = _176 * _3392;
        bool _3396 = _3390 != 0.0;
        bool _3398 = isnan(_3390);
        bool _3400 = _3396 || _3398;
        bool _3402 = isnan(0.0);
        bool _3404 = _3400 || _3402;
        float _3406 = _3394 * 0.15915493667125701904296875;
        float _3408 = _3406 * 6.283185482025146484375;
        float _3410 = sin(_3408);
        float _3412 = _3406 * 6.283185482025146484375;
        float _3414 = cos(_3412);
        float _3416 = _3226 * _3410;
        float _3418 = _3224 * _3410;
        float _3420 = fma(_3224, _3414, _3416);
        float _3422 = -_3418;
        float _3424 = fma(_3226, _3414, _3422);
        bool _3426 = !_3404;
        float _3428 = _3420;
        _326 = _3418;
        _3364 = _3424;
        _328 = _3414;
        _3358 = _3420;
        _3366 = _3390;
        if (!_3426)
        {
            float _3430 = _3424 * _3424;
            float _3432 = fma(_3420, _3420, _3430);
            bool _3434 = _3432 > 0.0;
            float _3436 = _3430;
            _328 = _3432;
            if (_3434)
            {
                float _3438 = rsqrt(_3432);
                _3436 = _3438;
            }
            float _3440 = _3436;
            float _3442 = _3440;
            if (_3434)
            {
                float _3444 = _3390 * _3440;
                _3442 = _3444;
            }
            float _3446 = _3442;
            float _3448 = _3446;
            if (_3434)
            {
                float _3450 = _278 * _3446;
                _3448 = _3450;
            }
            float _3452 = _3448;
            float _3454 = _3452;
            if (_3434)
            {
                float _3456 = _176 * _3452;
                _3454 = _3456;
            }
            float _3458 = _3454;
            _326 = _3458;
            if (_3434)
            {
                float _3460 = fma(_3420, _3458, _3420);
                _3428 = _3460;
            }
            float _3462 = _3428;
            _3358 = _3462;
            if (_3434)
            {
                float _3464 = fma(_3424, _3458, _3424);
                _3364 = _3464;
            }
        }
    }
    float _3466 = _326;
    float _3468 = _3364;
    float _3470 = _328;
    float _3472 = _3358;
    float _3474 = _3366;
    float _3476 = _3474;
    float _3478 = _3466;
    float _3480 = _3470;
    float _3482 = _3468;
    float _3484 = _3472;
    if (_3350)
    {
        _3476 = _3266;
    }
    float _3486 = _3476;
    float _3488 = _3486;
    if (!_3350)
    {
        float _3490 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _3492 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _3494 = _278 * _3490;
        float _3496 = _176 * _3494;
        bool _3498 = _3492 != 0.0;
        bool _3500 = isnan(_3492);
        bool _3502 = _3498 || _3500;
        bool _3504 = isnan(0.0);
        bool _3506 = _3502 || _3504;
        float _3508 = _3496 * 0.15915493667125701904296875;
        float _3510 = _3508 * 6.283185482025146484375;
        float _3512 = sin(_3510);
        float _3514 = _3508 * 6.283185482025146484375;
        float _3516 = cos(_3514);
        float _3518 = _3512 * _3468;
        float _3520 = _3266 * _3512;
        float _3522 = -_3518;
        float _3524 = fma(_3266, _3516, _3522);
        float _3526 = fma(_3516, _3468, _3520);
        bool _3528 = !_3506;
        float _3530 = _3526;
        _3478 = _3520;
        _3480 = _3518;
        _3488 = _3524;
        _3482 = _3526;
        if (!_3528)
        {
            float _3532 = _3524 * _3524;
            float _3534 = fma(_3526, _3526, _3532);
            bool _3536 = _3534 > 0.0;
            float _3538 = _3532;
            _3480 = _3534;
            if (_3536)
            {
                float _3540 = rsqrt(_3534);
                _3538 = _3540;
            }
            float _3542 = _3538;
            float _3544 = _3542;
            if (_3536)
            {
                float _3546 = _3492 * _3542;
                _3544 = _3546;
            }
            float _3548 = _3544;
            float _3550 = _3548;
            if (_3536)
            {
                float _3552 = _278 * _3548;
                _3550 = _3552;
            }
            float _3554 = _3550;
            float _3556 = _3554;
            if (_3536)
            {
                float _3558 = _176 * _3554;
                _3556 = _3558;
            }
            float _3560 = _3556;
            _3478 = _3560;
            if (_3536)
            {
                float _3562 = fma(_3526, _3560, _3526);
                _3530 = _3562;
            }
            float _3564 = _3530;
            _3482 = _3564;
            if (_3536)
            {
                float _3566 = fma(_3524, _3560, _3524);
                _3488 = _3566;
            }
        }
    }
    float _3568 = _3478;
    float _3570 = _3480;
    float _3572 = _3488;
    float _3574 = _3482;
    float _3576 = _3572;
    float _3578 = _3570;
    float _3580 = _3568;
    if (!_3352)
    {
        float _3582 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[48]);
        float _3584 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[49]);
        float _3586 = _278 * _3582;
        float _3588 = _176 * _3586;
        bool _3590 = _3584 != 0.0;
        bool _3592 = isnan(_3584);
        bool _3594 = _3590 || _3592;
        bool _3596 = isnan(0.0);
        bool _3598 = _3594 || _3596;
        float _3600 = _3588 * 0.15915493667125701904296875;
        float _3602 = _3600 * 6.283185482025146484375;
        float _3604 = sin(_3602);
        float _3606 = _3600 * 6.283185482025146484375;
        float _3608 = cos(_3606);
        float _3610 = _3604 * _3472;
        float _3612 = _3604 * _3572;
        float _3614 = fma(_3608, _3572, _3610);
        float _3616 = -_3612;
        float _3618 = fma(_3608, _3472, _3616);
        bool _3620 = !_3598;
        float _3622 = _3614;
        _3484 = _3618;
        _3576 = _3614;
        _3578 = _3612;
        _3580 = _3610;
        if (!_3620)
        {
            float _3624 = _3618 * _3618;
            float _3626 = fma(_3614, _3614, _3624);
            bool _3628 = _3626 > 0.0;
            float _3630 = _3624;
            _3578 = _3626;
            if (_3628)
            {
                float _3632 = rsqrt(_3626);
                _3630 = _3632;
            }
            float _3634 = _3630;
            float _3636 = _3634;
            if (_3628)
            {
                float _3638 = _3584 * _3634;
                _3636 = _3638;
            }
            float _3640 = _3636;
            float _3642 = _3640;
            if (_3628)
            {
                float _3644 = _278 * _3640;
                _3642 = _3644;
            }
            float _3646 = _3642;
            float _3648 = _3646;
            if (_3628)
            {
                float _3650 = _176 * _3646;
                _3648 = _3650;
            }
            float _3652 = _3648;
            _3580 = _3652;
            if (_3628)
            {
                float _3654 = fma(_3614, _3652, _3614);
                _3622 = _3654;
            }
            float _3656 = _3622;
            _3576 = _3656;
            if (_3628)
            {
                float _3658 = fma(_3618, _3652, _3618);
                _3484 = _3658;
            }
        }
    }
    float _3660 = _3484;
    float _3662 = _3576;
    float _3664 = _3578;
    float _3666 = _3580;
    float _3668 = _3664;
    float _3670 = _3666;
    if (_3120)
    {
        float _3672 = _3260 * _3660;
        _3368 = _3672;
    }
    float _3674 = _3368;
    float _3676 = _3674;
    if (_520)
    {
        float _3678 = _3144 * _3660;
        _3370 = _3678;
    }
    float _3680 = _3370;
    float _3682 = _3680;
    if (_520)
    {
        float _3684 = _3168 * _3660;
        _3372 = _3684;
    }
    float _3686 = _3372;
    float _3688 = _3686;
    if (_3120)
    {
        float _3690 = _3206 * _3660;
        _3360 = _3690;
    }
    float _3692 = _3360;
    float _3694 = _3692;
    if (_3120)
    {
        float _3696 = fma(_3258, _3662, _3674);
        _3676 = _3696;
    }
    float _3698 = _3676;
    float _3700 = _3698;
    if (_3124)
    {
        float _3702 = _3660 * _3300;
        _3374 = _3702;
    }
    float _3704 = _3374;
    if (_3124)
    {
        float _3706 = _3660 * _3338;
        _3376 = _3706;
    }
    float _3708 = _3376;
    float _3710 = _3708;
    if (_520)
    {
        float _3712 = fma(_3142, _3662, _3680);
        _3682 = _3712;
    }
    float _3714 = _3682;
    if (_520)
    {
        float _3716 = fma(_3166, _3662, _3686);
        _3688 = _3716;
    }
    float _3718 = _3688;
    if (_3120)
    {
        float _3720 = fma(_3204, _3662, _3692);
        _3694 = _3720;
    }
    float _3722 = _3694;
    float _3724 = _3722;
    if (_3124)
    {
        float _3726 = fma(_3662, _3298, _3704);
        _3378 = _3726;
    }
    float _3728 = _3378;
    if (_3124)
    {
        float _3730 = fma(_3662, _3336, _3708);
        _3710 = _3730;
    }
    float _3732 = _3710;
    if (_520)
    {
        float _3734 = fma(_3146, _3574, _3714);
        _3380 = _3734;
    }
    float _3736 = _3380;
    if (_520)
    {
        float _3738 = fma(_3170, _3574, _3718);
        _3382 = _3738;
    }
    float _3740 = _3382;
    if (_3120)
    {
        float _3742 = fma(_3208, _3574, _3722);
        _3724 = _3742;
    }
    float _3744 = _3724;
    if (_3120)
    {
        float _3746 = fma(_3262, _3574, _3698);
        _3700 = _3746;
    }
    float _3748 = _3700;
    if (!_520)
    {
        _3668 = 0.0;
        _3670 = 0.0;
    }
    float _3750 = _3668;
    float _3752 = _3670;
    float _3754 = _3750;
    float _3756 = _3752;
    if (_3124)
    {
        float _3758 = fma(_3574, _3302, _3728);
        _3384 = _3758;
    }
    float _3760 = _3384;
    float _3762 = _3760;
    if (_3124)
    {
        float _3764 = fma(_3574, _3340, _3732);
        _3386 = _3764;
    }
    float _3766 = _3386;
    if (_520)
    {
        float _3768 = _3148 + _3736;
        _3754 = _3768;
    }
    float _3770 = _3754;
    float _3772 = _3770;
    if (_520)
    {
        float _3774 = _3172 + _3740;
        _3756 = _3774;
    }
    float _3776 = _3756;
    float _3778 = _3776;
    if (_3120)
    {
        float _3780 = _3216 + _3744;
        _3772 = _3780;
    }
    float _3782 = _3772;
    float _3784 = _3782;
    if (_3120)
    {
        float _3786 = _3222 + _3748;
        _3778 = _3786;
    }
    float _3788 = _3778;
    float _3790 = _3788;
    if (_3124)
    {
        float _3792 = _3304 + _3760;
        _3784 = _3792;
    }
    float _3794 = _3784;
    if (_3124)
    {
        float _3796 = _3342 + _3766;
        _3790 = _3796;
    }
    float _3798 = _3790;
    float _3800 = fma(_3794, 6.2500002968590706586837768554688e-05, 0.5);
    float _3802 = fma(_3798, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _9348 = float2(_3800, _3802);
    float2 _3806 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9348, float2(0.0), isnan(_9348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9348, float2(0.0), isnan(_9348)), level(0.0)).xy;
    float _3808 = _3806.x;
    float _3810 = _3806.y;
    bool _3812 = _392 > 0.001000000047497451305389404296875;
    bool _3814 = isnan(_392);
    bool _3816 = _3812 || _3814;
    bool _3818 = isnan(0.001000000047497451305389404296875);
    bool _3820 = _3816 || _3818;
    bool _3822 = _3808 != 0.0;
    bool _3824 = isnan(_3808);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan(0.0);
    bool _3830 = _3826 || _3828;
    int _3832 = as_type<int>(_3808);
    if (_3830)
    {
        _3832 = as_type<int>(_3810);
    }
    int _3834 = _3832;
    if (!_3830)
    {
        _3762 = 4.0;
    }
    float _3836 = _3762;
    int _3838 = _3834;
    if (!_3830)
    {
        float2 _9402 = float2(_3800, _3802);
        float _3840 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9402, float2(0.0), isnan(_9402)), level(_3836)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9402, float2(0.0), isnan(_9402)), level(_3836)).y;
        _3838 = as_type<int>(_3840);
    }
    int _3842 = _3838;
    float _3844 = _3810;
    if (!_3820)
    {
        float _3846 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[76]);
        _3844 = _3846;
    }
    float _3848 = _3844;
    uint _3850 = uint(int(uint(_180) >> uint(2)));
    float _3852 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3850)]);
    int _3854 = _150 + 4;
    float _3856 = -_228;
    float _3858 = _3856 + _3662;
    int _3860 = _150 + 8;
    float _3862 = -_234;
    float _3864 = _3862 + _3660;
    float _3866 = -_240;
    float _3868 = _3866 + _3574;
    float _3870 = _3864 * _3864;
    float _3872 = fma(_3858, _3858, _3870);
    float _3874 = fma(_3868, _3868, _3872);
    int _3876 = _3842;
    if (!_3820)
    {
        float _3878 = fma(as_type<float>(_3842), 2000.0, _3848);
        _3876 = as_type<int>(_3878);
    }
    int _3880 = _3876;
    if (!_3820)
    {
        uint _3882 = uint(int(uint(_3854) >> uint(2)));
        (*spvDescriptorSet0.cp_s10)._m0[int(_3882)] = uint(_3880);
    }
    uint _3884 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3884)] = as_type<uint>(_3852);
    uint _3886 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3886)] = as_type<uint>(_3662);
    uint _3888 = uint(int(uint(_3854) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3888)] = as_type<uint>(_3660);
    uint _3890 = uint(int(uint(_3860) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3890)] = as_type<uint>(_3574);
    uint _3892 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3892)] = as_type<uint>(_502);
    uint _3894 = uint(int(uint(_3854) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3894)] = as_type<uint>(_528);
    uint _3896 = uint(int(uint(_3860) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3896)] = as_type<uint>(_530);
    uint _3898 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_3898)] = as_type<uint>(_3858);
    uint _3900 = uint(int(uint(_3854) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_3900)] = as_type<uint>(_3864);
    uint _3902 = uint(int(uint(_3860) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_3902)] = as_type<uint>(_3868);
    float _3904 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3906 = sqrt(_3874);
    float _3908 = _528 * _528;
    float _3910 = fma(_502, _502, _3908);
    float _3912 = fma(_530, _530, _3910);
    float _3914 = sqrt(_3912);
    bool _3916 = _3906 >= 9.9999999747524270787835121154785e-07;
    bool _3918 = isnan(_3906);
    bool _3920 = _3916 || _3918;
    bool _3922 = isnan(9.9999999747524270787835121154785e-07);
    bool _3924 = _3920 || _3922;
    float _3926 = _3912;
    if (!_3924)
    {
        bool _3928 = _178 != _192;
        bool _3930 = isnan(_178);
        bool _3932 = _3928 || _3930;
        bool _3934 = isnan(_192);
        bool _3936 = _3932 || _3934;
        _3938 = _3936;
        if (!_3938)
        {
            float _3940 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _3942 = _3940 > 0.0;
            bool _3944 = !_3942;
            if (!_3944)
            {
                float _3946 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _3948 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _3950 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _3952 = _3948 * _3948;
                float _3954 = fma(_3946, _3946, _3952);
                float _3956 = fma(_3950, _3950, _3954);
                float _3958 = rsqrt(_3956);
                float _3960 = _3958 * 9.9999999747524270787835121154785e-07;
                float _3962 = _3946 * _3960;
                float _3964 = _3948 * _3960;
                float _3966 = _3950 * _3960;
                _338 = as_type<int>(_3962);
                _340 = as_type<int>(_3964);
                _342 = as_type<int>(_3966);
                _3938 = true;
            }
            else
            {
                bool _3968 = _3914 >= 9.9999999747524270787835121154785e-07;
                bool _3970 = isnan(_3914);
                bool _3972 = _3968 || _3970;
                bool _3974 = isnan(9.9999999747524270787835121154785e-07);
                bool _3976 = _3972 || _3974;
                if (!_3976)
                {
                    float _3978 = _3660 * _3660;
                    float _3980 = fma(_3662, _3662, _3978);
                    float _3982 = fma(_3574, _3574, _3980);
                    float _3984 = sqrt(_3982);
                    bool _3986 = _3984 >= 9.9999999747524270787835121154785e-07;
                    bool _3988 = isnan(_3984);
                    bool _3990 = _3986 || _3988;
                    bool _3992 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3994 = _3990 || _3992;
                    int _3996 = as_type<int>(_270);
                    int _3998 = as_type<int>(_3984);
                    if (_3994)
                    {
                        float _4000 = rsqrt(_3982);
                        _3996 = as_type<int>(_4000);
                    }
                    int _4002 = _3996;
                    if (!_3994)
                    {
                        _3998 = 0;
                    }
                    int _4004 = _3998;
                    int _4006 = _4004;
                    if (!_3994)
                    {
                        _330 = 897988541;
                    }
                    int _4008 = _330;
                    int _4010 = _4002;
                    int _4012 = _4008;
                    if (_3994)
                    {
                        float _4014 = as_type<float>(_4002) * 9.9999999747524270787835121154785e-07;
                        _3926 = _4014;
                    }
                    float _4016 = _3926;
                    if (!_3994)
                    {
                        _4010 = 0;
                    }
                    int _4018 = _4010;
                    int _4020 = _4018;
                    if (_3994)
                    {
                        float _4022 = _3662 * _4016;
                        _4006 = as_type<int>(_4022);
                    }
                    int _4024 = _4006;
                    _338 = _4024;
                    if (_3994)
                    {
                        float _4026 = _3660 * _4016;
                        _4012 = as_type<int>(_4026);
                    }
                    int _4028 = _4012;
                    _340 = _4028;
                    if (_3994)
                    {
                        float _4030 = _3574 * _4016;
                        _4020 = as_type<int>(_4030);
                    }
                    int _4032 = _4020;
                    _342 = _4032;
                    _3938 = true;
                }
                else
                {
                    float _4034 = rsqrt(_3912);
                    float _4036 = _4034 * 9.9999999747524270787835121154785e-07;
                    float _4038 = _502 * _4036;
                    float _4040 = _528 * _4036;
                    float _4042 = _530 * _4036;
                    _338 = as_type<int>(_4038);
                    _340 = as_type<int>(_4040);
                    _342 = as_type<int>(_4042);
                    _3938 = true;
                }
            }
        }
    }
    else
    {
        float _4044 = _3914 * _3904;
        bool _4046 = _4044 >= 0.001000000047497451305389404296875;
        bool _4048 = isnan(_4044);
        bool _4050 = _4046 || _4048;
        bool _4052 = isnan(0.001000000047497451305389404296875);
        bool _4054 = _4050 || _4052;
        bool _4056 = _4044 > 0.0;
        bool _4058 = !_4054;
        bool _4060 = _4056 && _4058;
        bool _4062 = _3906 < 0.001000000047497451305389404296875;
        bool _4064 = _4062 && _4060;
        if (!_4064)
        {
            _332 = as_type<int>(_3858);
        }
        int _4066 = _332;
        int _4068 = _4066;
        if (_4064)
        {
            float _4070 = _502 * _3904;
            _4068 = as_type<int>(_4070);
        }
        int _4072 = _4068;
        _338 = _4072;
        if (!_4064)
        {
            _334 = as_type<int>(_3864);
        }
        int _4074 = _334;
        int _4076 = _4074;
        if (_4064)
        {
            float _4078 = _528 * _3904;
            _4076 = as_type<int>(_4078);
        }
        int _4080 = _4076;
        _340 = _4080;
        if (!_4064)
        {
            _336 = as_type<int>(_3868);
        }
        int _4082 = _336;
        _342 = _4082;
        if (_4064)
        {
            float _4084 = _530 * _3904;
            _342 = as_type<int>(_4084);
        }
    }
    _3938 = false;
    int _4086 = _338;
    int _4088 = _340;
    int _4090 = _342;
    uint _4092 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_4092)] = uint(_4086);
    uint _4094 = uint(int(uint(_3854) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_4094)] = uint(_4088);
    uint _4096 = uint(int(uint(_3860) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_4096)] = uint(_4090);
}

