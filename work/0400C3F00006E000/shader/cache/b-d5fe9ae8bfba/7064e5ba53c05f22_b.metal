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
    bool _5546 = false;
    bool _5284 = false;
    bool _4896 = false;
    bool _4410 = false;
    bool _3686 = false;
    bool _2558 = false;
    bool _1788 = false;
    bool _880 = false;
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
    int _152 = _73 << 4;
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[12]);
    uint _156 = uint(int(uint(_152) >> uint(2)));
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_156)]);
    int _160 = _152 + 4;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_162)]);
    int _166 = _152 + 8;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_168)]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[16]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[17]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _182 = _152 + 12;
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[15]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[0]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[1]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[2]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[3]);
    uint _194 = uint(int(uint(_182) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    uint _198 = uint(int(uint(_152) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_198)]);
    int _202 = _152 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    int _208 = _152 + 8;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[68]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
    uint _222 = uint(int(uint(_152) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_222)]);
    int _226 = _152 + 4;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_228)]);
    int _232 = _152 + 8;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_234)]);
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[30]);
    bool _242 = _154 != 1.0;
    bool _244 = isnan(_154);
    bool _246 = _242 || _244;
    bool _248 = isnan(1.0);
    bool _250 = _246 || _248;
    uint _252 = uint(int(uint(_152) >> uint(2)));
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_252)]);
    int _256 = _152 + 4;
    uint _258 = uint(int(uint(_256) >> uint(2)));
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_258)]);
    int _262 = _152 + 8;
    uint _264 = uint(int(uint(_262) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_264)]);
    float _268 = _250 ? _158 : 0.0;
    float _270 = _250 ? _164 : 0.3141500055789947509765625;
    uint _272 = uint(int(uint(_182) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_272)]);
    float _276 = _250 ? _170 : 0.92653000354766845703125;
    float _278 = _172 * 0.00999999977648258209228515625;
    float _280 = _176 * _268;
    float _282 = _176 * _270;
    float _284 = _176 * _276;
    float _286 = _176 * _278;
    float _288 = 0.0;
    float _290 = _174;
    float _292 = _280;
    float _294 = _282;
    float _296 = _284;
    float _298 = _184;
    float _300 = _192;
    float _302 = _268;
    float _304 = _238;
    float _306 = _270;
    float _308 = _238;
    float _310 = _270;
    float _312 = _218;
    float _314 = _278;
    float _316 = _186;
    float _318 = _274;
    int _320 = as_type<int>(_260);
    int _322 = as_type<int>(_260);
    int _324 = as_type<int>(_266);
    int _326 = as_type<int>(_254);
    int _328 = as_type<int>(_260);
    int _330 = as_type<int>(_266);
    if (!_250)
    {
        float _332 = _174 * 0.00999999977648258209228515625;
        float _334 = _180 * _286;
        float _336 = fma(_164, 2.0, -1.0);
        float _338 = fma(_158, 2.0, -1.0);
        float _340 = _176 * _332;
        float _342 = fma(_170, 2.0, -1.0);
        float _344 = fma(_340, _336, _334);
        float _346 = fma(_340, _338, _334);
        float _348 = fma(_340, _342, _334);
        float _350 = _282 + _344;
        float _352 = _280 + _346;
        float _354 = _284 + _348;
        _288 = _334;
        _290 = _340;
        _292 = _352;
        _294 = _350;
        _296 = _354;
    }
    float _356 = _288;
    float _358 = _290;
    float _360 = _292;
    float _362 = _294;
    float _364 = _296;
    float _366 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[13]);
    float _368 = -_178;
    float _370 = _368 + 1.0;
    float _372 = -_214;
    float _374 = _372 + 1.0;
    float _376 = _216 * _238;
    float _378 = _220 * _238;
    float _380 = fma(_370, _374, _214);
    float _382 = -_196;
    float _384 = _180 + _382;
    float _386 = abs(_214);
    float _388 = log2(_386);
    bool _390 = _380 != 1.0;
    bool _392 = isnan(_380);
    bool _394 = _390 || _392;
    bool _396 = isnan(1.0);
    bool _398 = _394 || _396;
    bool _400 = _184 != 1.0;
    bool _402 = isnan(_184);
    bool _404 = _400 || _402;
    bool _406 = isnan(1.0);
    bool _408 = _404 || _406;
    bool _410 = !_398;
    bool _412 = _408 || _410;
    float _414 = _358;
    float _416 = _380;
    float _418 = _380;
    float _420 = _364;
    float _422 = _384;
    if (_250)
    {
        _298 = 0.0;
    }
    float _424 = _298;
    float _426 = _424;
    if (!_250)
    {
        float _428 = _178 * _286;
        _426 = _428;
    }
    float _430 = _426;
    float _432 = _178 * _376;
    int _434 = as_type<int>(_240) & 512;
    bool _436 = _434 != 0;
    bool _438 = _430 != 0.0;
    bool _440 = isnan(_430);
    bool _442 = _438 || _440;
    bool _444 = isnan(0.0);
    bool _446 = _442 || _444;
    float _448 = _178 * _388;
    float _450 = _356;
    float _452 = _388;
    float _454 = _430;
    if (!_412)
    {
        float _456 = abs(_380);
        float _458 = log2(_456);
        _450 = _458;
    }
    float _460 = _450;
    if (!_412)
    {
        float _462 = -_380;
        float _464 = _462 + 1.0;
        _300 = _464;
    }
    float _466 = _300;
    float _468 = _466;
    if (_412)
    {
        _414 = _384;
    }
    float _470 = _414;
    float _472 = _470;
    if (!_412)
    {
        float _474 = 1.0 / _466;
        _468 = _474;
    }
    float _476 = _468;
    float _478 = _476;
    float _480 = _476;
    if (!_412)
    {
        float _482 = _384 * _460;
        _302 = _482;
    }
    float _484 = _302;
    float _486 = exp2(_448);
    float _488 = _218 * _238;
    float _490 = _178 * _488;
    float _492 = _484;
    if (!_412)
    {
        float _494 = exp2(_484);
        _492 = _494;
    }
    float _496 = _492;
    float _498 = fma(_200, _486, _432);
    float _500 = _486;
    float _502 = _486;
    if (!_412)
    {
        float _504 = -_496;
        float _506 = _504 + 1.0;
        _452 = _506;
    }
    float _508 = _452;
    float _510 = _178 * _378;
    if (!_412)
    {
        float _512 = _508 * _476;
        _472 = _512;
    }
    float _514 = _472;
    float _516 = fma(_212, _486, _510);
    float _518 = _514 + _360;
    float _520 = _178 + _518;
    float _522 = _520 + _430;
    bool _524 = _366 != 1.0;
    bool _526 = isnan(_366);
    bool _528 = _524 || _526;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    float _534 = fma(_206, _486, _490);
    float _536 = _518;
    float _538 = _516;
    float _540 = _534;
    float _608;
    float _618;
    float _626;
    float _628;
    float _630;
    float _776;
    float _840;
    float _844;
    float _852;
    float _854;
    float _858;
    float _862;
    float _866;
    float _870;
    float _874;
    float _876;
    float _878;
    if (!_446)
    {
        if (_532)
        {
            _416 = 0.60000002384185791015625;
        }
        float _542 = _416;
        float _544 = 0.0;
        if (!_532)
        {
            float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _544 = _546;
        }
        float _548 = _544;
        if (_532)
        {
            _478 = 0.4199999868869781494140625;
        }
        float _550 = _478;
        if (_532)
        {
            _304 = 0.23000000417232513427734375;
        }
        float _552 = _304;
        float _554 = 0.0;
        if (!_532)
        {
            float _556 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _554 = _556;
        }
        float _558 = _554;
        float _560 = _542;
        if (!_532)
        {
            float _562 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _560 = _562;
        }
        float _564 = _560;
        float _566 = _550;
        if (!_532)
        {
            float _568 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _566 = _568;
        }
        float _570 = _566;
        if (_532)
        {
            _306 = 0.1500000059604644775390625;
        }
        float _572 = _306;
        float _574 = _552;
        if (!_532)
        {
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _574 = _576;
        }
        float _578 = _574;
        float _580 = _572;
        if (!_532)
        {
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _580 = _582;
        }
        float _584 = _580;
        float _586 = 0.0;
        if (!_532)
        {
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _586 = _588;
        }
        float _590 = _586;
        float _592 = 0.0;
        if (!_532)
        {
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _592 = _594;
        }
        float _596 = _592;
        if (_532)
        {
            _500 = 0.60000002384185791015625;
        }
        float _598 = _500;
        float _600 = _522 * 6.283184051513671875;
        float _602 = _176 * _564;
        float _604 = _598;
        float _606 = _564;
        _608 = _600;
        if (!_532)
        {
            _604 = _564;
        }
        float _610 = _604;
        float _612 = _176 * _570;
        float _614 = 1.0 / _602;
        float _616 = _610;
        _618 = _548;
        if (_532)
        {
            _606 = 0.4199999868869781494140625;
        }
        float _620 = _606;
        float _622 = _176 * _578;
        float _624 = _620;
        _626 = _558;
        _628 = _590;
        _630 = _596;
        if (!_532)
        {
            _624 = _570;
        }
        float _632 = _624;
        float _634 = _176 * _610;
        float _636 = 1.0 / _612;
        float _638 = _176 * _632;
        float _640 = _176 * _584;
        float _642 = _632;
        if (_532)
        {
            _616 = 0.23000000417232513427734375;
        }
        float _644 = _616;
        float _646 = _644;
        if (!_532)
        {
            _646 = _578;
        }
        float _648 = _646;
        float _650 = 1.0 / _622;
        float _652 = _176 * _648;
        float _654 = _614 * _600;
        float _656 = 1.0 / _638;
        if (_532)
        {
            _642 = 0.1500000059604644775390625;
        }
        float _658 = _642;
        float _660 = _654 * 0.15915493667125701904296875;
        float _662 = _658;
        if (!_532)
        {
            _662 = _584;
        }
        float _664 = _662;
        float _666 = 1.0 / _640;
        float _668 = _636 * _600;
        float _670 = _176 * _664;
        float _672 = 1.0 / _634;
        float _674 = _668 * 0.15915493667125701904296875;
        float _676 = _650 * _600;
        float _678 = _518 * _656;
        float _680 = 1.0 / _652;
        float _682 = _676 * 0.15915493667125701904296875;
        float _684 = _666 * _600;
        float _686 = _678 * 6.283184051513671875;
        float _688 = 1.0 / _670;
        float _690 = _684 * 0.15915493667125701904296875;
        float _692 = _518 * _672;
        float _694 = _686 * 0.15915493667125701904296875;
        float _696 = _692 * 6.283184051513671875;
        float _698 = _518 * _680;
        float _700 = _674 * 6.283185482025146484375;
        float _702 = sin(_700);
        float _704 = _696 * 0.15915493667125701904296875;
        float _706 = _698 * 6.283184051513671875;
        float _708 = _518 * _688;
        float _710 = _694 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _706 * 0.15915493667125701904296875;
        float _716 = _708 * 6.283184051513671875;
        float _718 = _660 * 6.283185482025146484375;
        float _720 = sin(_718);
        float _722 = _716 * 0.15915493667125701904296875;
        float _724 = _686;
        float _726 = _698;
        float _728 = _706;
        float _730 = _716;
        if (_532)
        {
            _724 = 3.0;
        }
        float _732 = _724;
        float _734 = _732;
        if (_532)
        {
            _726 = 3.0;
        }
        float _736 = _726;
        float _738 = _704 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736;
        if (!_532)
        {
            _734 = _548;
        }
        float _744 = _734;
        float _746 = _744;
        if (!_532)
        {
            _742 = _548;
        }
        float _748 = _742;
        float _750 = _748;
        if (_532)
        {
            _728 = 4.0;
        }
        float _752 = _728;
        float _754 = _682 * 6.283185482025146484375;
        float _756 = sin(_754);
        float _758 = _752;
        if (!_532)
        {
            _758 = _558;
        }
        float _760 = _758;
        float _762 = _702 * _744;
        float _764 = _714 * 6.283185482025146484375;
        float _766 = sin(_764);
        float _768 = _712 * _748;
        float _770 = _760;
        float _772 = _762;
        float _774 = _702;
        _776 = _768;
        if (_532)
        {
            _750 = 4.0;
        }
        float _778 = _750;
        float _780 = _778;
        if (!_532)
        {
            _780 = _558;
        }
        float _782 = _780;
        float _784 = _690 * 6.283185482025146484375;
        float _786 = sin(_784);
        float _788 = fma(_720, _760, _762);
        float _790 = _720;
        float _792 = _788;
        if (_532)
        {
            _746 = 2.0;
        }
        float _794 = _746;
        float _796 = _722 * 6.283185482025146484375;
        float _798 = sin(_796);
        float _800 = _794;
        if (_532)
        {
            _770 = 2.0;
        }
        float _802 = _770;
        float _804 = fma(_740, _782, _768);
        float _806 = _802;
        if (!_532)
        {
            _800 = _590;
        }
        float _808 = _800;
        if (!_532)
        {
            _806 = _590;
        }
        float _810 = _806;
        float _812 = _810;
        if (_532)
        {
            _772 = 1.5;
        }
        float _814 = _772;
        float _816 = _814;
        if (_532)
        {
            _730 = 1.5;
        }
        float _818 = _730;
        float _820 = fma(_756, _808, _788);
        float _822 = _818;
        float _824 = _820;
        if (!_532)
        {
            _816 = _596;
        }
        float _826 = _816;
        float _828 = fma(_766, _810, _804);
        float _830 = _826;
        if (!_532)
        {
            _822 = _596;
        }
        float _832 = _822;
        float _834 = fma(_786, _826, _820);
        float _836 = fma(_798, _832, _828);
        float _838 = _836;
        _840 = _798;
        if (_532)
        {
            _824 = 1.5;
        }
        float _842 = _824;
        _844 = _842;
        if (_532)
        {
            _830 = 2.0;
        }
        float _846 = _830;
        float _848 = -_836;
        float _850 = _834 + _848;
        _852 = _846;
        _854 = _850;
        if (_532)
        {
            _838 = 3.0;
        }
        float _856 = _838;
        _858 = _856;
        if (_532)
        {
            _812 = 4.0;
        }
        float _860 = _812;
        _862 = _860;
        if (_532)
        {
            _790 = 0.1500000059604644775390625;
        }
        float _864 = _790;
        _866 = _864;
        if (_532)
        {
            _792 = 0.23000000417232513427734375;
        }
        float _868 = _792;
        _870 = _868;
        if (_532)
        {
            _774 = 0.4199999868869781494140625;
        }
        float _872 = _774;
        _874 = _872;
        _876 = 0.0;
        _878 = 0.0;
        _880 = true;
    }
    else
    {
        if (_532)
        {
            _480 = 0.4199999868869781494140625;
        }
        float _882 = _480;
        float _884 = 0.0;
        if (!_532)
        {
            float _886 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[9]);
            _884 = _886;
        }
        float _888 = _884;
        if (_532)
        {
            _308 = 0.60000002384185791015625;
        }
        float _890 = _308;
        if (_532)
        {
            _310 = 0.23000000417232513427734375;
        }
        float _892 = _310;
        float _894 = 0.0;
        if (!_532)
        {
            float _896 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[8]);
            _894 = _896;
        }
        float _898 = _894;
        float _900 = _882;
        if (!_532)
        {
            float _902 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _900 = _902;
        }
        float _904 = _900;
        float _906 = _890;
        if (!_532)
        {
            float _908 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _906 = _908;
        }
        float _910 = _906;
        float _912 = _892;
        if (!_532)
        {
            float _914 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _912 = _914;
        }
        float _916 = _912;
        if (_532)
        {
            _312 = 0.1500000059604644775390625;
        }
        float _918 = _312;
        float _920 = 0.0;
        if (!_532)
        {
            float _922 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[10]);
            _920 = _922;
        }
        float _924 = _920;
        float _926 = _918;
        if (!_532)
        {
            float _928 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _926 = _928;
        }
        float _930 = _926;
        float _932 = 0.0;
        if (!_532)
        {
            float _934 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[11]);
            _932 = _934;
        }
        float _936 = _932;
        if (_532)
        {
            _502 = 0.4199999868869781494140625;
        }
        float _938 = _502;
        float _940 = _938;
        if (_532)
        {
            _418 = 0.4199999868869781494140625;
        }
        float _942 = _418;
        float _944 = _522 * 6.283184051513671875;
        float _946 = _360 * 6.283184051513671875;
        float _948 = _942;
        float _950 = _904;
        if (!_532)
        {
            _940 = _904;
        }
        float _952 = _940;
        float _954 = _176 * _952;
        float _956 = _952;
        if (_532)
        {
            _956 = 0.4199999868869781494140625;
        }
        float _958 = _956;
        float _960 = _958;
        if (!_532)
        {
            _960 = _904;
        }
        float _962 = _960;
        float _964 = _962;
        if (!_532)
        {
            _948 = _904;
        }
        float _966 = _948;
        float _968 = _176 * _904;
        float _970 = _176 * _962;
        float _972 = _966;
        if (_532)
        {
            _964 = 0.60000002384185791015625;
        }
        float _974 = _964;
        float _976 = _176 * _916;
        float _978 = _974;
        _618 = _888;
        _628 = _924;
        if (!_532)
        {
            _978 = _910;
        }
        float _980 = _978;
        float _982 = _176 * _910;
        float _984 = _980;
        if (_532)
        {
            _950 = 0.60000002384185791015625;
        }
        float _986 = _950;
        float _988 = _176 * _966;
        float _990 = _986;
        if (!_532)
        {
            _990 = _910;
        }
        float _992 = _990;
        float _994 = 1.0 / _968;
        float _996 = _992;
        if (_532)
        {
            _972 = 0.60000002384185791015625;
        }
        float _998 = _972;
        float _1000 = _998;
        if (!_532)
        {
            _1000 = _910;
        }
        float _1002 = _1000;
        float _1004 = 1.0 / _976;
        float _1006 = _176 * _1002;
        float _1008 = _1002;
        if (_532)
        {
            _1008 = 0.23000000417232513427734375;
        }
        float _1010 = _1008;
        float _1012 = 1.0 / _982;
        float _1014 = _176 * _980;
        float _1016 = _1010;
        if (_532)
        {
            _984 = 0.23000000417232513427734375;
        }
        float _1018 = _984;
        float _1020 = _1018;
        if (!_532)
        {
            _1020 = _916;
        }
        float _1022 = _1020;
        float _1024 = _176 * _992;
        float _1026 = _1022;
        if (_532)
        {
            _996 = 0.23000000417232513427734375;
        }
        float _1028 = _996;
        float _1030 = _1028;
        if (!_532)
        {
            _1030 = _916;
        }
        float _1032 = _1030;
        float _1034 = _1032;
        if (!_532)
        {
            _1016 = _916;
        }
        float _1036 = _1016;
        float _1038 = _176 * _1022;
        float _1040 = _176 * _930;
        float _1042 = _1036;
        _626 = _898;
        _630 = _936;
        if (_532)
        {
            _1026 = 0.1500000059604644775390625;
        }
        float _1044 = _1026;
        float _1046 = _176 * _1032;
        float _1048 = _1044;
        if (!_532)
        {
            _1048 = _930;
        }
        float _1050 = _1048;
        float _1052 = 1.0 / _970;
        if (_532)
        {
            _1034 = 0.1500000059604644775390625;
        }
        float _1054 = _1034;
        float _1056 = 1.0 / _1046;
        float _1058 = _1054;
        _314 = _1056;
        if (!_532)
        {
            _1058 = _930;
        }
        float _1060 = _1058;
        float _1062 = 1.0 / _1040;
        float _1064 = _176 * _1050;
        float _1066 = _994 * _944;
        float _1068 = 1.0 / _1024;
        float _1070 = _176 * _1036;
        if (_532)
        {
            _1042 = 0.1500000059604644775390625;
        }
        float _1072 = _1042;
        float _1074 = 1.0 / _1006;
        float _1076 = _1072;
        if (!_532)
        {
            _1076 = _930;
        }
        float _1078 = _1076;
        float _1080 = _176 * _1060;
        float _1082 = 1.0 / _988;
        float _1084 = _1066 * 0.15915493667125701904296875;
        float _1086 = _1012 * _944;
        float _1088 = _176 * _1078;
        float _1090 = 1.0 / _1070;
        float _1092 = _1086 * 0.15915493667125701904296875;
        float _1094 = _1004 * _944;
        float _1096 = 1.0 / _954;
        float _1098 = 1.0 / _1088;
        float _1100 = 1.0 / _1080;
        float _1102 = _360 + _430;
        float _1104 = _1102 * 6.283184051513671875;
        float _1106 = _1094 * 0.15915493667125701904296875;
        float _1108 = _1062 * _944;
        float _1110 = 1.0 / _1014;
        float _1112 = _1108 * 0.15915493667125701904296875;
        float _1114 = _1082 * _1104;
        float _1116 = 1.0 / _1064;
        float _1118 = _1114 * 0.15915493667125701904296875;
        float _1120 = _1052 * _946;
        float _1122 = _1112 * 6.283185482025146484375;
        float _1124 = sin(_1122);
        float _1126 = _1120 * 0.15915493667125701904296875;
        float _1128 = _1074 * _1104;
        float _1130 = _518 * _1096;
        float _1132 = _1084 * 6.283185482025146484375;
        float _1134 = sin(_1132);
        float _1136 = _1130 * 6.283184051513671875;
        float _1138 = _1128 * 0.15915493667125701904296875;
        float _1140 = _1110 * _946;
        float _1142 = _1136 * 0.15915493667125701904296875;
        float _1144 = 1.0 / _1038;
        float _1146 = _1140 * 0.15915493667125701904296875;
        float _1148 = _1140;
        float _1150 = _1106;
        _876 = _1104;
        _878 = _1116;
        if (_532)
        {
            _1148 = 3.0;
        }
        float _1152 = _1148;
        float _1154 = _1152;
        if (!_532)
        {
            _1154 = _888;
        }
        float _1156 = _1154;
        float _1158 = _1126 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1090 * _1104;
        float _1164 = _1118 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1142 * 6.283185482025146484375;
        float _1170 = sin(_1168);
        float _1172 = _1134 * _1156;
        float _1174 = _1156;
        float _1176 = _1162;
        if (_532)
        {
            _1174 = 3.0;
        }
        float _1178 = _1174;
        float _1180 = _1162 * 0.15915493667125701904296875;
        float _1182 = _1178;
        if (!_532)
        {
            _1182 = _888;
        }
        float _1184 = _1182;
        float _1186 = _1144 * _946;
        float _1188 = _1138 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        if (_532)
        {
            _1176 = 3.0;
        }
        float _1192 = _1176;
        float _1194 = _1192;
        if (!_532)
        {
            _1194 = _888;
        }
        float _1196 = _1194;
        float _1198 = _1160 * _1184;
        float _1200 = _1092 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1186 * 0.15915493667125701904296875;
        float _1206 = _518 * _1068;
        float _1208 = _1098 * _1104;
        float _1210 = _1106 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1166 * _1196;
        float _1216 = _1196;
        float _1218 = _1206;
        if (_532)
        {
            _1216 = 4.0;
        }
        float _1220 = _1216;
        float _1222 = _1146 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220;
        if (_532)
        {
            _1150 = 3.0;
        }
        float _1228 = _1150;
        float _1230 = _1228;
        if (!_532)
        {
            _1230 = _888;
        }
        float _1232 = _1230;
        float _1234 = _1232;
        if (!_532)
        {
            _1226 = _898;
        }
        float _1236 = _1226;
        float _1238 = _1170 * _1232;
        float _1240 = _1206 * 6.283184051513671875;
        if (_532)
        {
            _1234 = 4.0;
        }
        float _1242 = _1234;
        float _1244 = _1208 * 0.15915493667125701904296875;
        float _1246 = _1242;
        if (_532)
        {
            _1218 = 4.0;
        }
        float _1248 = _1218;
        float _1250 = _1240 * 0.15915493667125701904296875;
        float _1252 = _1248;
        if (!_532)
        {
            _1246 = _898;
        }
        float _1254 = _1246;
        float _1256 = _1116 * _946;
        float _1258 = _1254;
        if (!_532)
        {
            _1252 = _898;
        }
        float _1260 = _1252;
        float _1262 = fma(_1190, _1236, _1214);
        float _1264 = _518 * _1056;
        float _1266 = fma(_1202, _1254, _1172);
        float _1268 = _1256 * 0.15915493667125701904296875;
        float _1270 = fma(_1224, _1260, _1198);
        float _1272 = _518 * _1100;
        float _1274 = _1264 * 6.283184051513671875;
        float _1276 = _1250 * 6.283185482025146484375;
        float _1278 = sin(_1276);
        float _1280 = _1272 * 6.283184051513671875;
        float _1282 = _1274 * 0.15915493667125701904296875;
        float _1284 = _1280 * 0.15915493667125701904296875;
        float _1286 = _1180 * 6.283185482025146484375;
        float _1288 = sin(_1286);
        float _1290 = _1264;
        float _1292 = _1274;
        float _1294 = _1266;
        if (_532)
        {
            _536 = 4.0;
        }
        float _1296 = _536;
        float _1298 = _1204 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        float _1302 = _1296;
        if (!_532)
        {
            _1302 = _898;
        }
        float _1304 = _1302;
        float _1306 = _1282 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = _1304;
        if (_532)
        {
            _1258 = 2.0;
        }
        float _1312 = _1258;
        float _1314 = _1312;
        if (_532)
        {
            _1290 = 2.0;
        }
        float _1316 = _1290;
        float _1318 = _1316;
        if (_532)
        {
            _1292 = 2.0;
        }
        float _1320 = _1292;
        float _1322 = _1244 * 6.283185482025146484375;
        float _1324 = sin(_1322);
        float _1326 = _1320;
        if (!_532)
        {
            _1314 = _924;
        }
        float _1328 = _1314;
        float _1330 = fma(_1278, _1304, _1238);
        float _1332 = _1328;
        if (!_532)
        {
            _1318 = _924;
        }
        float _1334 = _1318;
        float _1336 = _1268 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        float _1340 = _1334;
        if (!_532)
        {
            _1326 = _924;
        }
        float _1342 = _1326;
        float _1344 = _1284 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1342;
        if (_532)
        {
            _1310 = 2.0;
        }
        float _1350 = _1310;
        float _1352 = _1350;
        if (!_532)
        {
            _1352 = _924;
        }
        float _1354 = _1352;
        float _1356 = fma(_1212, _1328, _1266);
        float _1358 = fma(_1288, _1334, _1262);
        float _1360 = fma(_1300, _1342, _1270);
        float _1362 = _1354;
        float _1364 = _1356;
        _608 = _1360;
        _840 = _1358;
        if (_532)
        {
            _1294 = 1.5;
        }
        float _1366 = _1294;
        float _1368 = _1366;
        if (_532)
        {
            _1332 = 1.5;
        }
        float _1370 = _1332;
        float _1372 = _1370;
        if (_532)
        {
            _1340 = 1.5;
        }
        float _1374 = _1340;
        float _1376 = _1374;
        if (_532)
        {
            _1348 = 1.5;
        }
        float _1378 = _1348;
        float _1380 = fma(_1308, _1354, _1330);
        float _1382 = _1378;
        _776 = _1380;
        if (!_532)
        {
            _1368 = _936;
        }
        float _1384 = _1368;
        float _1386 = _1384;
        if (!_532)
        {
            _1376 = _936;
        }
        float _1388 = _1376;
        float _1390 = _1388;
        if (!_532)
        {
            _1382 = _936;
        }
        float _1392 = _1382;
        if (!_532)
        {
            _1372 = _936;
        }
        float _1394 = _1372;
        float _1396 = fma(_1124, _1384, _1356);
        float _1398 = fma(_1324, _1388, _1358);
        float _1400 = fma(_1338, _1392, _1360);
        float _1402 = fma(_1346, _1394, _1380);
        float _1404 = -_1398;
        float _1406 = _1404 + _1400;
        float _1408 = -_1402;
        float _1410 = _1396 + _1408;
        float _1412 = _1402;
        float _1414 = _1346;
        _874 = _1338;
        if (_532)
        {
            _1412 = 1.5;
        }
        float _1416 = _1412;
        _844 = _1416;
        if (_532)
        {
            _1386 = 2.0;
        }
        float _1418 = _1386;
        float _1420 = _1410 + _1406;
        _852 = _1418;
        _854 = _1420;
        if (_532)
        {
            _1362 = 3.0;
        }
        float _1422 = _1362;
        _858 = _1422;
        if (_532)
        {
            _1390 = 4.0;
        }
        float _1424 = _1390;
        _862 = _1424;
        if (_532)
        {
            _1414 = 0.1500000059604644775390625;
        }
        float _1426 = _1414;
        _866 = _1426;
        if (_532)
        {
            _1364 = 0.23000000417232513427734375;
        }
        float _1428 = _1364;
        _870 = _1428;
        if (_532)
        {
            _874 = 0.4199999868869781494140625;
        }
    }
    _880 = false;
    float _1430 = _874;
    float _1432 = _776;
    float _1434 = _870;
    float _1436 = _608;
    float _1438 = _866;
    float _1440 = _314;
    float _1442 = _876;
    float _1444 = _840;
    float _1446 = _858;
    float _1448 = _618;
    float _1450 = _862;
    float _1452 = _626;
    float _1454 = _852;
    float _1456 = _628;
    float _1458 = _844;
    float _1460 = _630;
    float _1462 = _878;
    float _1464 = _854;
    float _1466 = _514 + _362;
    float _1468 = _178 + _1466;
    float _1470 = _1468 + _430;
    float _1472 = _1432;
    float _1474 = _1436;
    float _1476 = _1440;
    float _1478 = _1442;
    float _1480 = _1444;
    float _1482 = _1436;
    float _1484 = _1442;
    float _1486 = _1440;
    float _1488 = _1462;
    float _1490 = _1432;
    float _1492 = _1444;
    float _1494 = _1466;
    float _1496 = _1430;
    float _1498 = _1434;
    float _1500 = _1438;
    float _1502 = _1454;
    float _1504 = _1446;
    float _1506 = _1450;
    float _1508 = _1458;
    float _1510 = _1430;
    float _1512 = _1434;
    float _1514 = _1438;
    float _1516 = _1454;
    float _1518 = _1458;
    float _1520 = _1446;
    float _1522 = _1450;
    float _1732;
    float _1734;
    float _1752;
    float _1782;
    float _1784;
    float _1786;
    if (!_446)
    {
        if (_532)
        {
            _1472 = _1430;
        }
        float _1524 = _1472;
        if (_532)
        {
            _1474 = 0.60000002384185791015625;
        }
        float _1526 = _1474;
        float _1528 = _1524;
        if (!_532)
        {
            float _1530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1528 = _1530;
        }
        float _1532 = _1528;
        if (_532)
        {
            _1476 = _1434;
        }
        float _1534 = _1476;
        float _1536 = _1526;
        if (!_532)
        {
            float _1538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1536 = _1538;
        }
        float _1540 = _1536;
        if (_532)
        {
            _1478 = _1438;
        }
        float _1542 = _1478;
        float _1544 = _1534;
        if (!_532)
        {
            float _1546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1544 = _1546;
        }
        float _1548 = _1544;
        float _1550 = _1542;
        if (!_532)
        {
            float _1552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1550 = _1552;
        }
        float _1554 = _1550;
        if (_532)
        {
            _1480 = _1430;
        }
        float _1556 = _1480;
        float _1558 = _1470 * 6.283184051513671875;
        float _1560 = _176 * _1532;
        float _1562 = _1556;
        float _1564 = _1532;
        if (!_532)
        {
            _1562 = _1532;
        }
        float _1566 = _1562;
        float _1568 = _1566;
        if (_532)
        {
            _1564 = 0.60000002384185791015625;
        }
        float _1570 = _1564;
        float _1572 = 1.0 / _1560;
        float _1574 = _176 * _1540;
        float _1576 = _176 * _1566;
        float _1578 = _1570;
        if (!_532)
        {
            _1578 = _1540;
        }
        float _1580 = _1578;
        float _1582 = _176 * _1548;
        float _1584 = _1580;
        if (_532)
        {
            _1568 = _1434;
        }
        float _1586 = _1568;
        float _1588 = _1586;
        if (!_532)
        {
            _1588 = _1548;
        }
        float _1590 = _1588;
        float _1592 = 1.0 / _1574;
        float _1594 = _176 * _1554;
        float _1596 = _176 * _1580;
        if (_532)
        {
            _1584 = _1438;
        }
        float _1598 = _1584;
        float _1600 = _176 * _1590;
        float _1602 = _1598;
        if (!_532)
        {
            _1602 = _1554;
        }
        float _1604 = _1602;
        float _1606 = 1.0 / _1582;
        float _1608 = _1572 * _1558;
        float _1610 = _176 * _1604;
        float _1612 = 1.0 / _1576;
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1592 * _1558;
        float _1618 = 1.0 / _1594;
        float _1620 = 1.0 / _1596;
        float _1622 = 1.0 / _1600;
        float _1624 = _1616 * 0.15915493667125701904296875;
        float _1626 = _1606 * _1558;
        float _1628 = _1626 * 0.15915493667125701904296875;
        float _1630 = _1618 * _1558;
        float _1632 = 1.0 / _1610;
        float _1634 = _1466 * _1612;
        float _1636 = _1630 * 0.15915493667125701904296875;
        float _1638 = _1466 * _1620;
        float _1640 = _1634 * 6.283184051513671875;
        float _1642 = _1614 * 6.283185482025146484375;
        float _1644 = sin(_1642);
        float _1646 = _1640 * 0.15915493667125701904296875;
        float _1648 = _1638 * 6.283184051513671875;
        float _1650 = _1466 * _1622;
        float _1652 = _1640;
        float _1654 = _1650;
        if (_532)
        {
            _1652 = _1446;
        }
        float _1656 = _1652;
        float _1658 = _1648 * 0.15915493667125701904296875;
        float _1660 = _1650 * 6.283184051513671875;
        float _1662 = _1646 * 6.283185482025146484375;
        float _1664 = sin(_1662);
        float _1666 = _1466 * _1632;
        float _1668 = _1656;
        float _1670 = _1660;
        if (_532)
        {
            _1654 = _1446;
        }
        float _1672 = _1654;
        float _1674 = _1660 * 0.15915493667125701904296875;
        float _1676 = _1672;
        if (!_532)
        {
            _1668 = _1448;
        }
        float _1678 = _1668;
        float _1680 = _1666 * 6.283184051513671875;
        float _1682 = _1678;
        float _1684 = _1680;
        if (!_532)
        {
            _1676 = _1448;
        }
        float _1686 = _1676;
        float _1688 = _1624 * 6.283185482025146484375;
        float _1690 = sin(_1688);
        float _1692 = _1680 * 0.15915493667125701904296875;
        float _1694 = _1644 * _1678;
        float _1696 = _1686;
        if (_532)
        {
            _1670 = _1450;
        }
        float _1698 = _1670;
        float _1700 = _1698;
        if (!_532)
        {
            _1700 = _1452;
        }
        float _1702 = _1700;
        float _1704 = _1702;
        if (_532)
        {
            _1682 = _1454;
        }
        float _1706 = _1682;
        float _1708 = _1658 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1664 * _1686;
        float _1714 = _1706;
        if (_532)
        {
            _1696 = _1450;
        }
        float _1716 = _1696;
        float _1718 = _1716;
        if (!_532)
        {
            _1718 = _1452;
        }
        float _1720 = _1718;
        if (!_532)
        {
            _1714 = _1456;
        }
        float _1722 = _1714;
        float _1724 = _1628 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = fma(_1690, _1702, _1694);
        float _1730 = _1690;
        _1732 = _1722;
        _1734 = _1728;
        if (_532)
        {
            _1704 = _1454;
        }
        float _1736 = _1704;
        float _1738 = _1736;
        if (!_532)
        {
            _1738 = _1456;
        }
        float _1740 = _1738;
        if (_532)
        {
            _1730 = _1458;
        }
        float _1742 = _1730;
        float _1744 = _1674 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = fma(_1710, _1720, _1712);
        float _1750 = _1742;
        _1752 = _1748;
        if (_532)
        {
            _1684 = _1458;
        }
        float _1754 = _1684;
        float _1756 = _1754;
        if (!_532)
        {
            _1750 = _1460;
        }
        float _1758 = _1750;
        if (!_532)
        {
            _1756 = _1460;
        }
        float _1760 = _1756;
        float _1762 = _1636 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = fma(_1726, _1722, _1728);
        float _1768 = _1692 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        float _1772 = fma(_1746, _1740, _1748);
        float _1774 = fma(_1764, _1758, _1766);
        float _1776 = fma(_1770, _1760, _1772);
        float _1778 = -_1776;
        float _1780 = _1774 + _1778;
        _1782 = _1764;
        _1784 = _1776;
        _1786 = _1780;
        _1788 = true;
    }
    else
    {
        if (_532)
        {
            _1482 = _1430;
        }
        float _1790 = _1482;
        if (_532)
        {
            _1484 = _1434;
        }
        float _1792 = _1484;
        if (_532)
        {
            _1486 = 0.60000002384185791015625;
        }
        float _1794 = _1486;
        float _1796 = _1790;
        if (!_532)
        {
            float _1798 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _1796 = _1798;
        }
        float _1800 = _1796;
        if (_532)
        {
            _1488 = _1438;
        }
        float _1802 = _1488;
        float _1804 = _1792;
        if (!_532)
        {
            float _1806 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _1804 = _1806;
        }
        float _1808 = _1804;
        float _1810 = _1794;
        if (!_532)
        {
            float _1812 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _1810 = _1812;
        }
        float _1814 = _1810;
        float _1816 = _1802;
        if (!_532)
        {
            float _1818 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _1816 = _1818;
        }
        float _1820 = _1816;
        if (_532)
        {
            _1490 = _1430;
        }
        float _1822 = _1490;
        float _1824 = _1822;
        if (_532)
        {
            _1492 = _1430;
        }
        float _1826 = _1492;
        float _1828 = _1470 * 6.283184051513671875;
        float _1830 = _362 * 6.283184051513671875;
        float _1832 = _1826;
        float _1834 = _1800;
        if (!_532)
        {
            _1824 = _1800;
        }
        float _1836 = _1824;
        float _1838 = _1836;
        if (!_532)
        {
            _1832 = _1800;
        }
        float _1840 = _1832;
        float _1842 = _176 * _1836;
        float _1844 = _1840;
        if (_532)
        {
            _1838 = _1430;
        }
        float _1846 = _1838;
        float _1848 = _176 * _1840;
        float _1850 = _176 * _1808;
        float _1852 = _1846;
        if (!_532)
        {
            _1852 = _1800;
        }
        float _1854 = _1852;
        float _1856 = _176 * _1800;
        float _1858 = _1854;
        if (_532)
        {
            _1844 = 0.60000002384185791015625;
        }
        float _1860 = _1844;
        float _1862 = _1860;
        float _1864 = _1814;
        if (!_532)
        {
            _1862 = _1814;
        }
        float _1866 = _1862;
        float _1868 = 1.0 / _1850;
        float _1870 = _176 * _1820;
        float _1872 = _1866;
        if (_532)
        {
            _1834 = 0.60000002384185791015625;
        }
        float _1874 = _1834;
        float _1876 = 1.0 / _1856;
        float _1878 = _176 * _1854;
        float _1880 = _1874;
        if (_532)
        {
            _1858 = 0.60000002384185791015625;
        }
        float _1882 = _1858;
        float _1884 = _1882;
        if (!_532)
        {
            _1884 = _1814;
        }
        float _1886 = _1884;
        float _1888 = _176 * _1866;
        if (_532)
        {
            _1872 = _1434;
        }
        float _1890 = _1872;
        float _1892 = _1890;
        if (!_532)
        {
            _1892 = _1808;
        }
        float _1894 = _1892;
        float _1896 = 1.0 / _1870;
        float _1898 = _176 * _1814;
        float _1900 = _1894;
        if (!_532)
        {
            _1880 = _1814;
        }
        float _1902 = _1880;
        float _1904 = _176 * _1886;
        float _1906 = _176 * _1894;
        float _1908 = _1902;
        if (_532)
        {
            _1900 = _1434;
        }
        float _1910 = _1900;
        float _1912 = 1.0 / _1898;
        float _1914 = _1910;
        if (!_532)
        {
            _1914 = _1808;
        }
        float _1916 = _1914;
        float _1918 = 1.0 / _1842;
        float _1920 = _176 * _1902;
        float _1922 = _1916;
        if (_532)
        {
            _1908 = _1434;
        }
        float _1924 = _1908;
        float _1926 = _1924;
        if (!_532)
        {
            _1926 = _1808;
        }
        float _1928 = _1926;
        float _1930 = 1.0 / _1888;
        float _1932 = _1928;
        if (_532)
        {
            _1864 = _1438;
        }
        float _1934 = _1864;
        float _1936 = _1934;
        if (!_532)
        {
            _1936 = _1820;
        }
        float _1938 = _1936;
        float _1940 = _176 * _1916;
        if (_532)
        {
            _1922 = _1438;
        }
        float _1942 = _1922;
        float _1944 = 1.0 / _1878;
        float _1946 = _1942;
        if (!_532)
        {
            _1946 = _1820;
        }
        float _1948 = _1946;
        float _1950 = _176 * _1928;
        if (_532)
        {
            _1932 = _1438;
        }
        float _1952 = _1932;
        float _1954 = _1952;
        if (!_532)
        {
            _1954 = _1820;
        }
        float _1956 = _1954;
        float _1958 = _176 * _1948;
        float _1960 = _1876 * _1828;
        float _1962 = 1.0 / _1920;
        float _1964 = _176 * _1938;
        float _1966 = _176 * _1956;
        float _1968 = 1.0 / _1848;
        float _1970 = _1960 * 0.15915493667125701904296875;
        float _1972 = _1912 * _1828;
        float _1974 = 1.0 / _1940;
        float _1976 = _1972 * 0.15915493667125701904296875;
        float _1978 = _1868 * _1828;
        float _1980 = 1.0 / _1964;
        float _1982 = _1978 * 0.15915493667125701904296875;
        float _1984 = _1896 * _1828;
        float _1986 = _362 + _430;
        float _1988 = 1.0 / _1904;
        float _1990 = _1986 * 6.283184051513671875;
        float _1992 = _1944 * _1830;
        float _1994 = _1968 * _1990;
        float _1996 = 1.0 / _1950;
        float _1998 = _1992 * 0.15915493667125701904296875;
        float _2000 = _1930 * _1990;
        float _2002 = 1.0 / _1958;
        float _2004 = _1994 * 0.15915493667125701904296875;
        float _2006 = _1466 * _1918;
        float _2008 = _1970 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = _2006 * 6.283184051513671875;
        float _2014 = 1.0 / _1966;
        float _2016 = _2012 * 0.15915493667125701904296875;
        float _2018 = _1996 * _1990;
        float _2020 = _2000 * 0.15915493667125701904296875;
        float _2022 = _1988 * _1830;
        float _2024 = _1998 * 6.283185482025146484375;
        float _2026 = sin(_2024);
        float _2028 = _2022 * 0.15915493667125701904296875;
        float _2030 = _2022;
        float _2032 = _2018;
        float _2034 = _2010;
        if (_532)
        {
            _2030 = _1446;
        }
        float _2036 = _2030;
        float _2038 = _2036;
        if (!_532)
        {
            _2038 = _1448;
        }
        float _2040 = _2038;
        float _2042 = _2004 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = _2016 * 6.283185482025146484375;
        float _2048 = sin(_2046);
        float _2050 = _2018 * 0.15915493667125701904296875;
        float _2052 = _2040;
        if (_532)
        {
            _2032 = _1446;
        }
        float _2054 = _2032;
        float _2056 = _2020 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        float _2060 = _1974 * _1830;
        float _2062 = _2054;
        if (!_532)
        {
            _2062 = _1448;
        }
        float _2064 = _2062;
        float _2066 = _2014 * _1990;
        float _2068 = 1.0 / _1906;
        float _2070 = _2010 * _2040;
        float _2072 = _2064;
        if (_532)
        {
            _2052 = _1446;
        }
        float _2074 = _2052;
        float _2076 = _2074;
        if (!_532)
        {
            _2076 = _1448;
        }
        float _2078 = _2076;
        float _2080 = _1976 * 6.283185482025146484375;
        float _2082 = sin(_2080);
        if (_532)
        {
            _2034 = _1446;
        }
        float _2084 = _2034;
        float _2086 = _2026 * _2078;
        float _2088 = _2084;
        if (!_532)
        {
            _2088 = _1448;
        }
        float _2090 = _2088;
        float _2092 = _1466 * _1962;
        float _2094 = _2028 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        float _2098 = _2060 * 0.15915493667125701904296875;
        float _2100 = _2044 * _2064;
        float _2102 = _2048 * _2090;
        float _2104 = _2090;
        float _2106 = _2092;
        if (_532)
        {
            _2104 = _1450;
        }
        float _2108 = _2104;
        float _2110 = _2092 * 6.283184051513671875;
        float _2112 = _2108;
        if (!_532)
        {
            _2112 = _1452;
        }
        float _2114 = _2112;
        if (_532)
        {
            _2106 = _1450;
        }
        float _2116 = _2106;
        float _2118 = _2110 * 0.15915493667125701904296875;
        float _2120 = _2116;
        if (!_532)
        {
            _2120 = _1452;
        }
        float _2122 = _2120;
        float _2124 = _1466 * _2068;
        float _2126 = fma(_2082, _2114, _2070);
        float _2128 = _1466 * _1980;
        float _2130 = _2066 * 0.15915493667125701904296875;
        float _2132 = fma(_2096, _2122, _2086);
        float _2134 = _2124 * 6.283184051513671875;
        float _2136 = _2118 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        float _2140 = _2002 * _1830;
        float _2142 = _2128 * 6.283184051513671875;
        float _2144 = _2134 * 0.15915493667125701904296875;
        float _2146 = _1984 * 0.15915493667125701904296875;
        float _2148 = _2140 * 0.15915493667125701904296875;
        float _2150 = _2142 * 0.15915493667125701904296875;
        float _2152 = _1982 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        float _2156 = _2124;
        float _2158 = _2134;
        float _2160 = _2126;
        if (_532)
        {
            _2072 = _1450;
        }
        float _2162 = _2072;
        float _2164 = _2162;
        if (!_532)
        {
            _2164 = _1452;
        }
        float _2166 = _2164;
        float _2168 = _2050 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2166;
        if (_532)
        {
            _1494 = _1450;
        }
        float _2174 = _1494;
        float _2176 = _2098 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        float _2180 = _2174;
        if (!_532)
        {
            _2180 = _1452;
        }
        float _2182 = _2180;
        float _2184 = fma(_2058, _2166, _2100);
        float _2186 = _2144 * 6.283185482025146484375;
        float _2188 = sin(_2186);
        float _2190 = _2182;
        if (_532)
        {
            _2172 = _1454;
        }
        float _2192 = _2172;
        float _2194 = _2192;
        if (_532)
        {
            _2156 = _1454;
        }
        float _2196 = _2156;
        float _2198 = _2196;
        if (_532)
        {
            _2158 = _1454;
        }
        float _2200 = _2158;
        float _2202 = _2146 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = _2200;
        if (!_532)
        {
            _2194 = _1456;
        }
        float _2208 = _2194;
        float _2210 = fma(_2138, _2182, _2102);
        float _2212 = _2208;
        _1784 = _2138;
        if (!_532)
        {
            _2198 = _1456;
        }
        float _2214 = _2198;
        float _2216 = _2130 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = _2214;
        if (!_532)
        {
            _2206 = _1456;
        }
        float _2222 = _2206;
        float _2224 = _2148 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2222;
        if (_532)
        {
            _2190 = _1454;
        }
        float _2230 = _2190;
        float _2232 = _2150 * 6.283185482025146484375;
        float _2234 = sin(_2232);
        float _2236 = _2230;
        if (!_532)
        {
            _2236 = _1456;
        }
        float _2238 = _2236;
        float _2240 = fma(_2154, _2208, _2126);
        float _2242 = fma(_2170, _2214, _2184);
        float _2244 = fma(_2178, _2222, _2132);
        _1732 = _2204;
        _1752 = _2154;
        if (_532)
        {
            _2160 = _1458;
        }
        float _2246 = _2160;
        float _2248 = _2246;
        if (_532)
        {
            _2212 = _1458;
        }
        float _2250 = _2212;
        float _2252 = _2250;
        if (_532)
        {
            _2220 = _1458;
        }
        float _2254 = _2220;
        float _2256 = _2254;
        if (_532)
        {
            _2228 = _1458;
        }
        float _2258 = _2228;
        float _2260 = fma(_2188, _2238, _2210);
        float _2262 = _2258;
        _1734 = _2188;
        if (!_532)
        {
            _2248 = _1460;
        }
        float _2264 = _2248;
        if (!_532)
        {
            _2256 = _1460;
        }
        float _2266 = _2256;
        if (!_532)
        {
            _2262 = _1460;
        }
        float _2268 = _2262;
        if (!_532)
        {
            _2252 = _1460;
        }
        float _2270 = _2252;
        float _2272 = fma(_2204, _2264, _2240);
        float _2274 = fma(_2218, _2266, _2242);
        float _2276 = fma(_2226, _2268, _2244);
        float _2278 = fma(_2234, _2270, _2260);
        float _2280 = -_2274;
        float _2282 = _2280 + _2276;
        float _2284 = -_2278;
        float _2286 = _2272 + _2284;
        float _2288 = _2286 + _2282;
        _1782 = _2278;
        _1786 = _2288;
    }
    _1788 = false;
    float _2290 = _1732;
    float _2292 = _1734;
    float _2294 = _1752;
    float _2296 = _1782;
    float _2298 = _1784;
    float _2300 = _1786;
    float _2302 = _514 + _364;
    float _2304 = _274 * _178;
    float _2306 = _178 + _2302;
    float _2308 = fma(_200, _2304, _224);
    float _2310 = fma(_206, _2304, _230);
    float _2312 = fma(_212, _2304, _236);
    float _2314 = _2306 + _430;
    float _2316 = _2304;
    float _2318 = _2290;
    float _2320 = _2292;
    float _2322 = _2292;
    float _2324 = _2294;
    float _2326 = _2296;
    float _2328 = _2298;
    float _2330 = _2290;
    float _2332 = _2304;
    float _2334 = _2310;
    float _2336 = _2312;
    float _2460;
    float _2512;
    float _2554;
    float _2556;
    if (!_446)
    {
        if (_532)
        {
            _454 = _1430;
        }
        float _2338 = _454;
        if (_532)
        {
            _2316 = 0.60000002384185791015625;
        }
        float _2340 = _2316;
        if (_532)
        {
            _2318 = _1434;
        }
        float _2342 = _2318;
        float _2344 = _2338;
        if (!_532)
        {
            float _2346 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2344 = _2346;
        }
        float _2348 = _2344;
        if (_532)
        {
            _2320 = _1438;
        }
        float _2350 = _2320;
        float _2352 = _2340;
        if (!_532)
        {
            float _2354 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2352 = _2354;
        }
        float _2356 = _2352;
        float _2358 = _2342;
        if (!_532)
        {
            float _2360 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2358 = _2360;
        }
        float _2362 = _2358;
        float _2364 = _2350;
        if (!_532)
        {
            float _2366 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2364 = _2366;
        }
        float _2368 = _2364;
        float _2370 = _2314 * 6.283184051513671875;
        float _2372 = _176 * _2348;
        float _2374 = _2348;
        if (!_532)
        {
            _1496 = _2348;
        }
        float _2376 = _1496;
        if (_532)
        {
            _2374 = 0.60000002384185791015625;
        }
        float _2378 = _2374;
        float _2380 = 1.0 / _2372;
        float _2382 = _176 * _2356;
        float _2384 = _176 * _2376;
        float _2386 = _2378;
        if (!_532)
        {
            _2386 = _2356;
        }
        float _2388 = _2386;
        float _2390 = _176 * _2362;
        if (!_532)
        {
            _1498 = _2362;
        }
        float _2392 = _1498;
        float _2394 = 1.0 / _2382;
        float _2396 = _176 * _2368;
        float _2398 = _176 * _2388;
        float _2400 = _176 * _2392;
        float _2402 = _2400;
        if (!_532)
        {
            _1500 = _2368;
        }
        float _2404 = _1500;
        float _2406 = 1.0 / _2390;
        float _2408 = _2380 * _2370;
        float _2410 = _176 * _2404;
        float _2412 = _2408 * 0.15915493667125701904296875;
        float _2414 = 1.0 / _2396;
        float _2416 = _2394 * _2370;
        float _2418 = 1.0 / _2384;
        float _2420 = 1.0 / _2398;
        float _2422 = 1.0 / _2400;
        float _2424 = _2416 * 0.15915493667125701904296875;
        float _2426 = _2406 * _2370;
        float _2428 = _2302 * _2418;
        float _2430 = _2426 * 0.15915493667125701904296875;
        float _2432 = _2414 * _2370;
        float _2434 = 1.0 / _2410;
        float _2436 = _2428 * 6.283184051513671875;
        if (_532)
        {
            _2402 = _1454;
        }
        float _2438 = _2402;
        float _2440 = _2432 * 0.15915493667125701904296875;
        float _2442 = _2302 * _2420;
        float _2444 = _2436 * 0.15915493667125701904296875;
        float _2446 = _2438;
        if (!_532)
        {
            _2446 = _1456;
        }
        float _2448 = _2446;
        float _2450 = _2442 * 6.283184051513671875;
        float _2452 = _2302 * _2422;
        float _2454 = _2412 * 6.283185482025146484375;
        float _2456 = sin(_2454);
        float _2458 = _2450;
        _2460 = _2448;
        if (!_532)
        {
            _1502 = _1456;
        }
        float _2462 = _1502;
        float _2464 = _2450 * 0.15915493667125701904296875;
        float _2466 = _2452 * 6.283184051513671875;
        float _2468 = _2466;
        if (_532)
        {
            _2458 = _1446;
        }
        float _2470 = _2458;
        float _2472 = _2302 * _2434;
        float _2474 = _2466 * 0.15915493667125701904296875;
        float _2476 = _2444 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2470;
        if (!_532)
        {
            _2480 = _1448;
        }
        float _2482 = _2480;
        float _2484 = _2472 * 6.283184051513671875;
        if (!_532)
        {
            _1504 = _1448;
        }
        float _2486 = _1504;
        float _2488 = _2486;
        if (_532)
        {
            _2468 = _1450;
        }
        float _2490 = _2468;
        float _2492 = _2484 * 0.15915493667125701904296875;
        float _2494 = _2490;
        if (!_532)
        {
            _2494 = _1452;
        }
        float _2496 = _2494;
        float _2498 = _2424 * 6.283185482025146484375;
        float _2500 = sin(_2498);
        if (!_532)
        {
            _1506 = _1452;
        }
        float _2502 = _1506;
        float _2504 = _2456 * _2482;
        float _2506 = _2464 * 6.283185482025146484375;
        float _2508 = sin(_2506);
        float _2510 = _2478 * _2486;
        _2512 = _2504;
        if (_532)
        {
            _2488 = _1458;
        }
        float _2514 = _2488;
        float _2516 = _2514;
        if (!_532)
        {
            _2516 = _1460;
        }
        float _2518 = _2516;
        if (!_532)
        {
            _1508 = _1460;
        }
        float _2520 = _1508;
        float _2522 = _2430 * 6.283185482025146484375;
        float _2524 = sin(_2522);
        float _2526 = fma(_2500, _2496, _2504);
        float _2528 = _2474 * 6.283185482025146484375;
        float _2530 = sin(_2528);
        float _2532 = fma(_2508, _2502, _2510);
        float _2534 = _2440 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = fma(_2524, _2448, _2526);
        float _2540 = _2492 * 6.283185482025146484375;
        float _2542 = sin(_2540);
        float _2544 = fma(_2530, _2462, _2532);
        float _2546 = fma(_2536, _2518, _2538);
        float _2548 = fma(_2542, _2520, _2544);
        float _2550 = -_2548;
        float _2552 = _2546 + _2550;
        _2554 = _2538;
        _2556 = _2552;
        _2558 = true;
    }
    else
    {
        if (_532)
        {
            _2322 = _1430;
        }
        float _2560 = _2322;
        if (_532)
        {
            _2324 = _1434;
        }
        float _2562 = _2324;
        if (_532)
        {
            _2326 = 0.60000002384185791015625;
        }
        float _2564 = _2326;
        float _2566 = _2560;
        if (!_532)
        {
            float _2568 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[5]);
            _2566 = _2568;
        }
        float _2570 = _2566;
        float _2572 = _2562;
        if (!_532)
        {
            float _2574 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[6]);
            _2572 = _2574;
        }
        float _2576 = _2572;
        float _2578 = _2564;
        if (!_532)
        {
            float _2580 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[4]);
            _2578 = _2580;
        }
        float _2582 = _2578;
        if (_532)
        {
            _2328 = _1438;
        }
        float _2584 = _2328;
        float _2586 = _2584;
        if (!_532)
        {
            float _2588 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[7]);
            _2586 = _2588;
        }
        float _2590 = _2586;
        if (_532)
        {
            _2330 = _1430;
        }
        float _2592 = _2330;
        float _2594 = _2592;
        if (_532)
        {
            _2332 = _1430;
        }
        float _2596 = _2332;
        float _2598 = _2314 * 6.283184051513671875;
        float _2600 = _364 + _430;
        float _2602 = _176 * _2570;
        float _2604 = _2596;
        float _2606 = _2570;
        float _2608 = _2600;
        if (!_532)
        {
            _2594 = _2570;
        }
        float _2610 = _2594;
        float _2612 = _2610;
        if (!_532)
        {
            _2604 = _2570;
        }
        float _2614 = _2604;
        float _2616 = 1.0 / _2602;
        if (!_532)
        {
            _1510 = _2570;
        }
        float _2618 = _1510;
        float _2620 = _176 * _2576;
        if (_532)
        {
            _2606 = 0.60000002384185791015625;
        }
        float _2622 = _2606;
        float _2624 = _176 * _2582;
        float _2626 = _2622;
        float _2628 = _2582;
        if (!_532)
        {
            _2626 = _2582;
        }
        float _2630 = _2626;
        float _2632 = _176 * _2610;
        float _2634 = _2630;
        if (_532)
        {
            _2612 = 0.60000002384185791015625;
        }
        float _2636 = _2612;
        float _2638 = _2636;
        if (!_532)
        {
            _2638 = _2582;
        }
        float _2640 = _2638;
        float _2642 = 1.0 / _2620;
        float _2644 = _176 * _2590;
        float _2646 = 1.0 / _2624;
        float _2648 = _176 * _2618;
        float _2650 = _176 * _2630;
        float _2652 = _2640;
        if (_532)
        {
            _2634 = _1434;
        }
        float _2654 = _2634;
        float _2656 = _2654;
        if (!_532)
        {
            _2656 = _2576;
        }
        float _2658 = _2656;
        float _2660 = _176 * _2640;
        float _2662 = _2658;
        if (_532)
        {
            _2652 = 0.60000002384185791015625;
        }
        float _2664 = _2652;
        float _2666 = _2664;
        if (!_532)
        {
            _2666 = _2582;
        }
        float _2668 = _2666;
        if (_532)
        {
            _2628 = _1434;
        }
        float _2670 = _2628;
        float _2672 = 1.0 / _2660;
        float _2674 = _2670;
        if (!_532)
        {
            _2674 = _2576;
        }
        float _2676 = _2674;
        float _2678 = 1.0 / _2632;
        float _2680 = _176 * _2658;
        float _2682 = _176 * _2668;
        float _2684 = _176 * _2676;
        float _2686 = 1.0 / _2644;
        if (_532)
        {
            _2662 = _1438;
        }
        float _2688 = _2662;
        float _2690 = 1.0 / _2680;
        float _2692 = _2688;
        float _2694 = _2690;
        if (!_532)
        {
            _2692 = _2590;
        }
        float _2696 = _2692;
        float _2698 = _2616 * _2598;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = _2646 * _2598;
        float _2704 = 1.0 / _2648;
        if (!_532)
        {
            _1512 = _2576;
        }
        float _2706 = _1512;
        float _2708 = _2702 * 0.15915493667125701904296875;
        float _2710 = _2642 * _2598;
        float _2712 = 1.0 / _2650;
        float _2714 = _2710 * 0.15915493667125701904296875;
        float _2716 = _2686 * _2598;
        float _2718 = _176 * _2706;
        float _2720 = _176 * _2696;
        float _2722 = _2706;
        if (_532)
        {
            _2722 = _1438;
        }
        float _2724 = _2722;
        float _2726 = 1.0 / _2720;
        float _2728 = _2724;
        if (!_532)
        {
            _2728 = _2590;
        }
        float _2730 = _2728;
        float _2732 = _2716 * 0.15915493667125701904296875;
        float _2734 = _364 * 6.283184051513671875;
        float _2736 = _2600 * 6.283184051513671875;
        float _2738 = 1.0 / _2682;
        float _2740 = _2678 * _2736;
        float _2742 = _176 * _2730;
        float _2744 = _2736;
        float _2746 = _2734;
        if (!_532)
        {
            _1514 = _2590;
        }
        float _2748 = _1514;
        float _2750 = _2740 * 0.15915493667125701904296875;
        float _2752 = _2704 * _2734;
        float _2754 = _176 * _2748;
        float _2756 = 1.0 / _2742;
        float _2758 = _2752 * 0.15915493667125701904296875;
        float _2760 = _2712 * _2736;
        float _2762 = _176 * _2614;
        float _2764 = _2760 * 0.15915493667125701904296875;
        float _2766 = _2738 * _2734;
        float _2768 = 1.0 / _2754;
        float _2770 = _2766 * 0.15915493667125701904296875;
        float _2772 = _2690 * _2736;
        float _2774 = 1.0 / _2762;
        float _2776 = _2772 * 0.15915493667125701904296875;
        float _2778 = _2756 * _2736;
        float _2780 = 1.0 / _2684;
        float _2782 = _2778 * 0.15915493667125701904296875;
        float _2784 = _2768 * _2734;
        float _2786 = 1.0 / _2718;
        float _2788 = _2302 * _2774;
        float _2790 = _2784 * 0.15915493667125701904296875;
        float _2792 = _2302 * _2672;
        float _2794 = _2788 * 6.283184051513671875;
        float _2796 = _2792 * 6.283184051513671875;
        float _2798 = _2302 * _2780;
        float _2800 = _2738;
        float _2802 = _2756;
        float _2804 = _2768;
        if (_532)
        {
            _2744 = _1454;
        }
        float _2806 = _2744;
        float _2808 = _2794 * 0.15915493667125701904296875;
        float _2810 = _2806;
        float _2812 = _2808;
        if (_532)
        {
            _420 = _1454;
        }
        float _2814 = _420;
        float _2816 = _2814;
        if (!_532)
        {
            _2810 = _1456;
        }
        float _2818 = _2810;
        float _2820 = _2786 * _2734;
        float _2822 = _2786;
        if (_532)
        {
            _2822 = _1454;
        }
        float _2824 = _2822;
        float _2826 = _2824;
        if (!_532)
        {
            _2826 = _1456;
        }
        float _2828 = _2826;
        if (!_532)
        {
            _2816 = _1456;
        }
        float _2830 = _2816;
        _2460 = _2830;
        if (!_532)
        {
            _1516 = _1456;
        }
        float _2832 = _1516;
        float _2834 = _2796 * 0.15915493667125701904296875;
        if (_532)
        {
            _2694 = _1458;
        }
        float _2836 = _2694;
        float _2838 = _2798 * 6.283184051513671875;
        float _2840 = _2836;
        float _2842 = _2838;
        if (_532)
        {
            _2800 = _1458;
        }
        float _2844 = _2800;
        float _2846 = _2844;
        if (_532)
        {
            _2608 = _1458;
        }
        float _2848 = _2608;
        float _2850 = _2700 * 6.283185482025146484375;
        float _2852 = sin(_2850);
        float _2854 = _2848;
        if (!_532)
        {
            _2840 = _1460;
        }
        float _2856 = _2840;
        float _2858 = _2302 * _2726;
        if (!_532)
        {
            _2846 = _1460;
        }
        float _2860 = _2846;
        if (!_532)
        {
            _2854 = _1460;
        }
        float _2862 = _2854;
        if (!_532)
        {
            _1518 = _1460;
        }
        float _2864 = _1518;
        float _2866 = _2750 * 6.283185482025146484375;
        float _2868 = sin(_2866);
        float _2870 = _2838 * 0.15915493667125701904296875;
        float _2872 = _2820 * 0.15915493667125701904296875;
        float _2874 = _2858 * 6.283184051513671875;
        float _2876 = _2758 * 6.283185482025146484375;
        float _2878 = sin(_2876);
        float _2880 = _2808 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        float _2884 = _2874 * 0.15915493667125701904296875;
        float _2886 = _2872;
        if (_532)
        {
            _2746 = _1446;
        }
        float _2888 = _2746;
        float _2890 = _2708 * 6.283185482025146484375;
        float _2892 = sin(_2890);
        float _2894 = _2888;
        if (_532)
        {
            _2802 = _1446;
        }
        float _2896 = _2802;
        float _2898 = _2764 * 6.283185482025146484375;
        float _2900 = sin(_2898);
        float _2902 = _2896;
        if (!_532)
        {
            _2894 = _1448;
        }
        float _2904 = _2894;
        float _2906 = _2770 * 6.283185482025146484375;
        float _2908 = sin(_2906);
        if (!_532)
        {
            _2902 = _1448;
        }
        float _2910 = _2902;
        float _2912 = _2834 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        if (_532)
        {
            _2812 = _1450;
        }
        float _2916 = _2812;
        float _2918 = _2714 * 6.283185482025146484375;
        float _2920 = sin(_2918);
        float _2922 = _2916;
        if (_532)
        {
            _2804 = _1450;
        }
        float _2924 = _2804;
        float _2926 = _2776 * 6.283185482025146484375;
        float _2928 = sin(_2926);
        float _2930 = _2924;
        if (_532)
        {
            _2842 = _1450;
        }
        float _2932 = _2842;
        float _2934 = _2872 * 6.283185482025146484375;
        float _2936 = sin(_2934);
        float _2938 = _2932;
        if (!_532)
        {
            _2922 = _1452;
        }
        float _2940 = _2922;
        float _2942 = _2870 * 6.283185482025146484375;
        float _2944 = sin(_2942);
        if (_532)
        {
            _2886 = _1446;
        }
        float _2946 = _2886;
        float _2948 = _2946;
        if (!_532)
        {
            _2948 = _1448;
        }
        float _2950 = _2948;
        if (!_532)
        {
            _1520 = _1448;
        }
        float _2952 = _1520;
        float _2954 = _2732 * 6.283185482025146484375;
        float _2956 = sin(_2954);
        if (!_532)
        {
            _2930 = _1452;
        }
        float _2958 = _2930;
        float _2960 = _2852 * _2904;
        if (!_532)
        {
            _2938 = _1452;
        }
        float _2962 = _2938;
        float _2964 = _2868 * _2950;
        _2512 = _2964;
        if (!_532)
        {
            _1522 = _1452;
        }
        float _2966 = _1522;
        float _2968 = _2782 * 6.283185482025146484375;
        float _2970 = sin(_2968);
        float _2972 = _2878 * _2952;
        float _2974 = _2882 * _2910;
        float _2976 = _2790 * 6.283185482025146484375;
        float _2978 = sin(_2976);
        float _2980 = _2884 * 6.283185482025146484375;
        float _2982 = sin(_2980);
        float _2984 = fma(_2892, _2940, _2960);
        float _2986 = fma(_2900, _2962, _2964);
        float _2988 = fma(_2908, _2966, _2972);
        float _2990 = fma(_2914, _2958, _2974);
        float _2992 = fma(_2920, _2828, _2984);
        float _2994 = fma(_2928, _2830, _2986);
        float _2996 = fma(_2936, _2832, _2988);
        float _2998 = fma(_2944, _2818, _2990);
        float _3000 = fma(_2956, _2856, _2992);
        float _3002 = fma(_2970, _2862, _2994);
        float _3004 = fma(_2978, _2864, _2996);
        float _3006 = fma(_2982, _2860, _2998);
        float _3008 = -_3002;
        float _3010 = _3008 + _3004;
        float _3012 = -_3006;
        float _3014 = _3000 + _3012;
        float _3016 = _3014 + _3010;
        _2554 = _2986;
        _2556 = _3016;
    }
    _2558 = false;
    float _3018 = _2554;
    float _3020 = _2556;
    float _3022 = _2512;
    float _3024 = _2460;
    float _3026 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[36]);
    bool _3028 = _3026 > 0.0;
    float _3030 = _3018;
    float _3032 = _3022;
    float _3034 = _3024;
    if (_3028)
    {
        float _3036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _3030 = _3036;
    }
    float _3038 = _3030;
    float _3040 = fma(_186, _1464, _2308);
    float _3042 = fma(_188, _2300, _2310);
    float _3044 = fma(_190, _3020, _2312);
    bool _3046 = _3038 == 0.0;
    bool _3048 = _3038 == 0.0;
    bool _3050 = _3048 && _3028;
    float _3052 = _3038;
    if (_3050)
    {
        _316 = 0.0;
    }
    float _3054 = _316;
    float _3056 = _3054;
    if (_3050)
    {
        _3032 = 0.0;
    }
    float _3058 = _3032;
    float _3060 = _3058;
    if (_3050)
    {
        _3034 = 0.0;
    }
    float _3062 = _3034;
    bool _3064 = _3028 && _3046;
    float _3066 = _3062;
    float _3068 = _3062;
    if (!_3064)
    {
        float _3070 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[32]);
        bool _3072 = _3038 > 0.0;
        bool _3074 = _3072 && _3028;
        float _3076 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[28]);
        float _3078 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[29]);
        float _3080 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        float _3082 = trunc(_3070);
        int _3084 = int(_3082);
        bool _3086 = _3084 != 0;
        if (!_3086)
        {
            _2334 = 0.0;
            _2336 = 0.0;
        }
        float _3088 = _2334;
        float _3090 = _2336;
        float _3092 = _3088;
        float _3094 = _3090;
        float _3096 = _3088;
        float _3098 = _3090;
        if (!_3086)
        {
            _3052 = 0.0;
        }
        float _3100 = _3052;
        bool _3102 = !_3086;
        float _3104 = _3100;
        float _3106 = _3100;
        float _3108 = _3076;
        float _3110 = _3078;
        float _3112 = _3080;
        if (!_3102)
        {
            int _3114 = as_type<int>(_240) & 2048;
            bool _3116 = _3114 != 0;
            if (!_3116)
            {
                _3092 = 0.0;
                _3094 = 0.0;
            }
            float _3118 = _3092;
            float _3120 = _3094;
            _3096 = _3118;
            _3098 = _3120;
            if (!_3116)
            {
                _3104 = 0.0;
            }
            float _3122 = _3104;
            bool _3124 = !_3116;
            _3106 = _3122;
            if (!_3124)
            {
                float _3126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _3128 = uint(int(uint(_152) >> uint(2)));
                float _3130 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3128)]);
                int _3132 = _152 + 4;
                uint _3134 = uint(int(uint(_3132) >> uint(2)));
                float _3136 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3134)]);
                int _3138 = _152 + 8;
                uint _3140 = uint(int(uint(_3138) >> uint(2)));
                float _3142 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3140)]);
                int _3144 = _152 + 12;
                uint _3146 = uint(int(uint(_3144) >> uint(2)));
                float _3148 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3146)]);
                uint _3150 = uint(int(uint(_152) >> uint(2)));
                float _3152 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3150)]);
                int _3154 = _152 + 4;
                uint _3156 = uint(int(uint(_3154) >> uint(2)));
                float _3158 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3156)]);
                int _3160 = _152 + 8;
                uint _3162 = uint(int(uint(_3160) >> uint(2)));
                float _3164 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3162)]);
                int _3166 = _152 + 12;
                uint _3168 = uint(int(uint(_3166) >> uint(2)));
                float _3170 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3168)]);
                uint _3172 = uint(int(uint(_152) >> uint(2)));
                float _3174 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3172)]);
                int _3176 = _152 + 4;
                uint _3178 = uint(int(uint(_3176) >> uint(2)));
                float _3180 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3178)]);
                int _3182 = _152 + 8;
                uint _3184 = uint(int(uint(_3182) >> uint(2)));
                float _3186 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3184)]);
                int _3188 = _152 + 12;
                uint _3190 = uint(int(uint(_3188) >> uint(2)));
                float _3192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3190)]);
                float _3194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3198 = _3142 * _3152;
                float _3200 = _3142 * _3158;
                float _3202 = -_3198;
                float _3204 = fma(_3130, _3164, _3202);
                float _3206 = _3148 * _3164;
                float _3208 = _3148 * _3158;
                float _3210 = _3148 * _3152;
                float _3212 = _3136 * _3152;
                float _3214 = -_3200;
                float _3216 = fma(_3136, _3164, _3214);
                float _3218 = _3180 * _3204;
                float _3220 = -_3212;
                float _3222 = fma(_3130, _3158, _3220);
                float _3224 = -_3218;
                float _3226 = fma(_3174, _3216, _3224);
                float _3228 = fma(_3186, _3222, _3226);
                float _3230 = _3180 * _3164;
                float _3232 = 1.0 / _3228;
                float _3234 = -_3208;
                float _3236 = fma(_3136, _3170, _3234);
                float _3238 = -_3206;
                float _3240 = fma(_3142, _3170, _3238);
                float _3242 = -_3210;
                float _3244 = fma(_3130, _3170, _3242);
                float _3246 = -_3230;
                float _3248 = fma(_3186, _3158, _3246);
                float _3250 = _3174 * _3158;
                float _3252 = _3186 * _3152;
                float _3254 = _3186 * _3136;
                float _3256 = _3174 * _3142;
                float _3258 = _3186 * _3244;
                float _3260 = -_3252;
                float _3262 = fma(_3174, _3164, _3260);
                float _3264 = -_3254;
                float _3266 = fma(_3180, _3142, _3264);
                float _3268 = _3180 * _3130;
                float _3270 = -_3130;
                float _3272 = fma(_3270, _3164, _3198);
                float _3274 = -_3250;
                float _3276 = fma(_3180, _3152, _3274);
                float _3278 = -_3256;
                float _3280 = fma(_3186, _3130, _3278);
                float _3282 = -_3258;
                float _3284 = fma(_3174, _3240, _3282);
                float _3286 = _3262 * _3232;
                float _3288 = _3186 * _3236;
                float _3290 = -_3268;
                float _3292 = fma(_3174, _3136, _3290);
                float _3294 = _3248 * _3232;
                float _3296 = _3276 * _3232;
                float _3298 = fma(_3192, _3204, _3284);
                float _3300 = _3272 * _3232;
                float _3302 = _3126 * _3286;
                float _3304 = -_3288;
                float _3306 = fma(_3180, _3240, _3304);
                float _3308 = _3194 * _3232;
                float _3310 = _3126 * _3294;
                float _3312 = _3180 * _3244;
                float _3314 = _3126 * _3296;
                float _3316 = fma(_3194, _3300, _3302);
                float _3318 = fma(_3192, _3216, _3306);
                float _3320 = fma(_3216, _3308, _3310);
                float _3322 = -_3312;
                float _3324 = fma(_3174, _3236, _3322);
                float _3326 = fma(_3222, _3308, _3314);
                float _3328 = _3266 * _3232;
                float _3330 = _3280 * _3232;
                float _3332 = _3292 * _3232;
                float _3334 = fma(_3192, _3222, _3324);
                float _3336 = fma(_3196, _3328, _3320);
                float _3338 = fma(_3196, _3330, _3316);
                float _3340 = fma(_3196, _3332, _3326);
                float _3342 = -_3318;
                float _3344 = fma(_3342, _3232, _3336);
                float _3346 = fma(_3298, _3232, _3338);
                float _3348 = -_3334;
                float _3350 = fma(_3348, _3232, _3340);
                _3066 = _3332;
                _3096 = _3344;
                _3098 = _3346;
                _3106 = _3350;
            }
        }
        float _3352 = _3066;
        float _3354 = _3096;
        float _3356 = _3098;
        float _3358 = _3106;
        bool _3360 = !_3074;
        float _3362 = _3352;
        float _3364 = _3354;
        if (!_3360)
        {
            float _3366 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _3368 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _3370 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _3372 = !_436;
            _3108 = _3366;
            _3110 = _3368;
            _3112 = _3370;
            if (!_3372)
            {
                float _3374 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _3376 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _3378 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _3380 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _3382 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _3384 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _3386 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _3388 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _3390 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _3392 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _3394 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _3396 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _3398 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _3400 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _3402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _3404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _3406 = _3380 * _3386;
                float _3408 = _3380 * _3384;
                float _3410 = _3380 * _3382;
                float _3412 = _3396 * _3386;
                float _3414 = _3396 * _3384;
                float _3416 = _3396 * _3382;
                float _3418 = _3396 * _3378;
                float _3420 = -_3406;
                float _3422 = fma(_3378, _3388, _3420);
                float _3424 = -_3408;
                float _3426 = fma(_3376, _3388, _3424);
                float _3428 = -_3410;
                float _3430 = fma(_3374, _3388, _3428);
                float _3432 = -_3412;
                float _3434 = fma(_3394, _3388, _3432);
                float _3436 = -_3414;
                float _3438 = fma(_3392, _3388, _3436);
                float _3440 = -_3416;
                float _3442 = fma(_3390, _3388, _3440);
                float _3444 = -_3418;
                float _3446 = fma(_3394, _3380, _3444);
                float _3448 = _3378 * _3384;
                float _3450 = _3378 * _3382;
                float _3452 = _3394 * _3384;
                float _3454 = _3394 * _3382;
                float _3456 = _3396 * _3376;
                float _3458 = _3396 * _3374;
                float _3460 = -_3448;
                float _3462 = fma(_3376, _3386, _3460);
                float _3464 = -_3450;
                float _3466 = fma(_3374, _3386, _3464);
                float _3468 = -_3452;
                float _3470 = fma(_3392, _3386, _3468);
                float _3472 = -_3454;
                float _3474 = fma(_3390, _3386, _3472);
                float _3476 = _3394 * _3376;
                float _3478 = -_3456;
                float _3480 = fma(_3392, _3380, _3478);
                float _3482 = -_3458;
                float _3484 = fma(_3390, _3380, _3482);
                float _3486 = _3376 * _3382;
                float _3488 = _3392 * _3382;
                float _3490 = -_3476;
                float _3492 = fma(_3392, _3378, _3490);
                float _3494 = _3394 * _3430;
                float _3496 = _3394 * _3374;
                float _3498 = -_3488;
                float _3500 = fma(_3390, _3384, _3498);
                float _3502 = _3394 * _3426;
                float _3504 = -_3494;
                float _3506 = fma(_3390, _3422, _3504);
                float _3508 = -_3486;
                float _3510 = fma(_3374, _3384, _3508);
                float _3512 = _3392 * _3374;
                float _3514 = _3392 * _3430;
                float _3516 = -_3502;
                float _3518 = fma(_3392, _3422, _3516);
                float _3520 = fma(_3396, _3466, _3506);
                float _3522 = -_3496;
                float _3524 = fma(_3390, _3378, _3522);
                float _3526 = -_3512;
                float _3528 = fma(_3390, _3376, _3526);
                float _3530 = _3392 * _3466;
                float _3532 = -_3514;
                float _3534 = fma(_3390, _3426, _3532);
                float _3536 = fma(_3396, _3462, _3518);
                float _3538 = _3400 * _3520;
                float _3540 = -_3530;
                float _3542 = fma(_3390, _3462, _3540);
                float _3544 = _3402 * _3426;
                float _3546 = fma(_3396, _3510, _3534);
                float _3548 = -_3538;
                float _3550 = fma(_3398, _3536, _3548);
                float _3552 = fma(_3394, _3510, _3542);
                float _3554 = -_3544;
                float _3556 = fma(_3400, _3422, _3554);
                float _3558 = _3402 * _3430;
                float _3560 = fma(_3402, _3546, _3550);
                float _3562 = _3400 * _3430;
                float _3564 = _3402 * _3480;
                float _3566 = -_3558;
                float _3568 = fma(_3398, _3422, _3566);
                float _3570 = -_3404;
                float _3572 = fma(_3570, _3552, _3560);
                float _3574 = _3402 * _3442;
                float _3576 = -_3562;
                float _3578 = fma(_3398, _3426, _3576);
                float _3580 = fma(_3404, _3462, _3556);
                float _3582 = 1.0 / _3572;
                float _3584 = -_3574;
                float _3586 = fma(_3398, _3434, _3584);
                float _3588 = _3402 * _3484;
                float _3590 = _3402 * _3438;
                float _3592 = -_3564;
                float _3594 = fma(_3400, _3446, _3592);
                float _3596 = _3400 * _3442;
                float _3598 = _3400 * _3484;
                float _3600 = -_3588;
                float _3602 = fma(_3398, _3446, _3600);
                float _3604 = fma(_3404, _3510, _3578);
                float _3606 = fma(_3404, _3466, _3568);
                float _3608 = -_3590;
                float _3610 = fma(_3400, _3434, _3608);
                float _3612 = -_3596;
                float _3614 = fma(_3398, _3438, _3612);
                float _3616 = -_3598;
                float _3618 = fma(_3398, _3480, _3616);
                float _3620 = fma(_3404, _3474, _3586);
                float _3622 = fma(_3404, _3470, _3610);
                float _3624 = fma(_3404, _3500, _3614);
                float _3626 = _3520 * _3582;
                float _3628 = _3580 * _3582;
                float _3630 = _3604 * _3582;
                float _3632 = _3536 * _3582;
                float _3634 = _3366 * _3626;
                float _3636 = _3606 * _3582;
                float _3638 = _3368 * _3628;
                float _3640 = _3546 * _3582;
                float _3642 = _3368 * _3630;
                float _3644 = -_3634;
                float _3646 = fma(_3368, _3636, _3644);
                float _3648 = -_3638;
                float _3650 = fma(_3366, _3632, _3648);
                float _3652 = _3622 * _3582;
                float _3654 = _3620 * _3582;
                float _3656 = -_3642;
                float _3658 = fma(_3366, _3640, _3656);
                float _3660 = _3624 * _3582;
                float _3662 = fma(_3404, _3492, _3594);
                float _3664 = fma(_3370, _3652, _3650);
                float _3666 = -_3654;
                float _3668 = fma(_3370, _3666, _3646);
                float _3670 = fma(_3404, _3524, _3602);
                float _3672 = fma(_3404, _3528, _3618);
                float _3674 = fma(_3370, _3660, _3658);
                float _3676 = -_3662;
                float _3678 = fma(_3676, _3582, _3664);
                float _3680 = fma(_3670, _3582, _3668);
                float _3682 = -_3672;
                float _3684 = fma(_3682, _3582, _3674);
                _3362 = _3628;
                _3108 = _3678;
                _3110 = _3680;
                _3112 = _3684;
                _3686 = true;
            }
            else
            {
                int _3688 = as_type<int>(_240) & 1024;
                bool _3690 = _3688 != 0;
                bool _3692 = !_3690;
                if (!_3692)
                {
                    float _3694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _3696 = uint(int(uint(_152) >> uint(2)));
                    float _3698 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3696)]);
                    int _3700 = _152 + 4;
                    uint _3702 = uint(int(uint(_3700) >> uint(2)));
                    float _3704 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3702)]);
                    int _3706 = _152 + 8;
                    uint _3708 = uint(int(uint(_3706) >> uint(2)));
                    float _3710 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3708)]);
                    uint _3712 = uint(int(uint(_152) >> uint(2)));
                    float _3714 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3712)]);
                    int _3716 = _152 + 4;
                    uint _3718 = uint(int(uint(_3716) >> uint(2)));
                    float _3720 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3718)]);
                    int _3722 = _152 + 8;
                    uint _3724 = uint(int(uint(_3722) >> uint(2)));
                    float _3726 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3724)]);
                    uint _3728 = uint(int(uint(_152) >> uint(2)));
                    float _3730 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3728)]);
                    int _3732 = _152 + 4;
                    uint _3734 = uint(int(uint(_3732) >> uint(2)));
                    float _3736 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3734)]);
                    int _3738 = _152 + 8;
                    uint _3740 = uint(int(uint(_3738) >> uint(2)));
                    float _3742 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3740)]);
                    float _3744 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _3746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _3748 = _3710 * _3714;
                    float _3750 = _3710 * _3720;
                    float _3752 = -_3748;
                    float _3754 = fma(_3698, _3726, _3752);
                    float _3756 = _3704 * _3714;
                    float _3758 = -_3750;
                    float _3760 = fma(_3704, _3726, _3758);
                    float _3762 = _3736 * _3754;
                    float _3764 = -_3756;
                    float _3766 = fma(_3698, _3720, _3764);
                    float _3768 = -_3762;
                    float _3770 = fma(_3730, _3760, _3768);
                    float _3772 = _3694 * _3726;
                    float _3774 = _3694 * _3720;
                    float _3776 = _3694 * _3714;
                    float _3778 = fma(_3742, _3766, _3770);
                    float _3780 = 1.0 / _3778;
                    float _3782 = _3742 * _3714;
                    float _3784 = _3736 * _3726;
                    float _3786 = -_3774;
                    float _3788 = fma(_3744, _3704, _3786);
                    float _3790 = -_3698;
                    float _3792 = fma(_3790, _3726, _3748);
                    float _3794 = _3730 * _3720;
                    float _3796 = -_3772;
                    float _3798 = fma(_3744, _3710, _3796);
                    float _3800 = -_3776;
                    float _3802 = fma(_3744, _3698, _3800);
                    float _3804 = _3730 * _3710;
                    float _3806 = -_3782;
                    float _3808 = fma(_3730, _3726, _3806);
                    float _3810 = -_3784;
                    float _3812 = fma(_3742, _3720, _3810);
                    float _3814 = _3736 * _3698;
                    float _3816 = -_3794;
                    float _3818 = fma(_3736, _3714, _3816);
                    float _3820 = -_3804;
                    float _3822 = fma(_3742, _3698, _3820);
                    float _3824 = _3742 * _3704;
                    float _3826 = _3742 * _3788;
                    float _3828 = _3812 * _3780;
                    float _3830 = _3808 * _3780;
                    float _3832 = -_3814;
                    float _3834 = fma(_3730, _3704, _3832);
                    float _3836 = _3818 * _3780;
                    float _3838 = _3742 * _3802;
                    float _3840 = -_3824;
                    float _3842 = fma(_3736, _3710, _3840);
                    float _3844 = _3736 * _3802;
                    float _3846 = -_3826;
                    float _3848 = fma(_3736, _3798, _3846);
                    float _3850 = _3828 * _3368;
                    float _3852 = _3830 * _3368;
                    float _3854 = _3836 * _3368;
                    float _3856 = _3792 * _3780;
                    float _3858 = _3760 * _3780;
                    float _3860 = _3766 * _3780;
                    float _3862 = -_3838;
                    float _3864 = fma(_3730, _3798, _3862);
                    float _3866 = fma(_3856, _3366, _3852);
                    float _3868 = fma(_3366, _3858, _3850);
                    float _3870 = fma(_3366, _3860, _3854);
                    float _3872 = _3822 * _3780;
                    float _3874 = _3842 * _3780;
                    float _3876 = _3834 * _3780;
                    float _3878 = -_3844;
                    float _3880 = fma(_3730, _3788, _3878);
                    float _3882 = fma(_3872, _3370, _3866);
                    float _3884 = fma(_3874, _3370, _3868);
                    float _3886 = fma(_3746, _3754, _3864);
                    float _3888 = fma(_3876, _3370, _3870);
                    float _3890 = fma(_3746, _3760, _3848);
                    float _3892 = fma(_3746, _3766, _3880);
                    float _3894 = fma(_3886, _3780, _3882);
                    float _3896 = -_3890;
                    float _3898 = fma(_3896, _3780, _3884);
                    float _3900 = -_3892;
                    float _3902 = fma(_3900, _3780, _3888);
                    _3362 = _3858;
                    _3108 = _3898;
                    _3110 = _3894;
                    _3112 = _3902;
                    _3686 = true;
                }
                else
                {
                    int _3904 = as_type<int>(_240) & 2048;
                    bool _3906 = _3904 != 0;
                    bool _3908 = !_3906;
                    if (!_3908)
                    {
                        uint _3910 = uint(int(uint(_152) >> uint(2)));
                        float _3912 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3910)]);
                        int _3914 = _152 + 4;
                        uint _3916 = uint(int(uint(_3914) >> uint(2)));
                        float _3918 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3916)]);
                        int _3920 = _152 + 8;
                        uint _3922 = uint(int(uint(_3920) >> uint(2)));
                        float _3924 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3922)]);
                        int _3926 = _152 + 12;
                        uint _3928 = uint(int(uint(_3926) >> uint(2)));
                        float _3930 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3928)]);
                        uint _3932 = uint(int(uint(_152) >> uint(2)));
                        float _3934 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3932)]);
                        int _3936 = _152 + 4;
                        uint _3938 = uint(int(uint(_3936) >> uint(2)));
                        float _3940 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3938)]);
                        int _3942 = _152 + 8;
                        uint _3944 = uint(int(uint(_3942) >> uint(2)));
                        float _3946 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3944)]);
                        int _3948 = _152 + 12;
                        uint _3950 = uint(int(uint(_3948) >> uint(2)));
                        float _3952 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3950)]);
                        uint _3954 = uint(int(uint(_152) >> uint(2)));
                        float _3956 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3954)]);
                        int _3958 = _152 + 4;
                        uint _3960 = uint(int(uint(_3958) >> uint(2)));
                        float _3962 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3960)]);
                        int _3964 = _152 + 8;
                        uint _3966 = uint(int(uint(_3964) >> uint(2)));
                        float _3968 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3966)]);
                        int _3970 = _152 + 12;
                        uint _3972 = uint(int(uint(_3970) >> uint(2)));
                        float _3974 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3972)]);
                        float _3976 = _3924 * _3934;
                        float _3978 = _3924 * _3940;
                        float _3980 = _3918 * _3934;
                        float _3982 = _3930 * _3940;
                        float _3984 = -_3976;
                        float _3986 = fma(_3912, _3946, _3984);
                        float _3988 = -_3978;
                        float _3990 = fma(_3918, _3946, _3988);
                        float _3992 = -_3980;
                        float _3994 = fma(_3912, _3940, _3992);
                        float _3996 = _3962 * _3946;
                        float _3998 = _3962 * _3986;
                        float _4000 = _3956 * _3940;
                        float _4002 = _3930 * _3946;
                        float _4004 = -_3996;
                        float _4006 = fma(_3968, _3940, _4004);
                        float _4008 = -_3998;
                        float _4010 = fma(_3956, _3990, _4008);
                        float _4012 = _3968 * _3934;
                        float _4014 = _3930 * _3934;
                        float _4016 = -_3982;
                        float _4018 = fma(_3918, _3952, _4016);
                        float _4020 = fma(_3968, _3994, _4010);
                        float _4022 = -_3912;
                        float _4024 = fma(_4022, _3946, _3976);
                        float _4026 = -_4012;
                        float _4028 = fma(_3956, _3946, _4026);
                        float _4030 = -_4000;
                        float _4032 = fma(_3962, _3934, _4030);
                        float _4034 = -_4002;
                        float _4036 = fma(_3924, _3952, _4034);
                        float _4038 = -_4014;
                        float _4040 = fma(_3912, _3952, _4038);
                        float _4042 = 1.0 / _4020;
                        float _4044 = _3956 * _3924;
                        float _4046 = _3968 * _3918;
                        float _4048 = _3962 * _3912;
                        float _4050 = _3962 * _4040;
                        float _4052 = -_4044;
                        float _4054 = fma(_3968, _3912, _4052);
                        float _4056 = -_4046;
                        float _4058 = fma(_3962, _3924, _4056);
                        float _4060 = _3968 * _4018;
                        float _4062 = -_4048;
                        float _4064 = fma(_3956, _3918, _4062);
                        float _4066 = _3968 * _4040;
                        float _4068 = -_4050;
                        float _4070 = fma(_3956, _4018, _4068);
                        float _4072 = -_4060;
                        float _4074 = fma(_3962, _4036, _4072);
                        float _4076 = -_4066;
                        float _4078 = fma(_3956, _4036, _4076);
                        float _4080 = fma(_3974, _3994, _4070);
                        float _4082 = fma(_3974, _3990, _4074);
                        float _4084 = _4006 * _4042;
                        float _4086 = _4028 * _4042;
                        float _4088 = _4032 * _4042;
                        float _4090 = _4024 * _4042;
                        float _4092 = _4084 * _3368;
                        float _4094 = _4086 * _3368;
                        float _4096 = _4088 * _3368;
                        float _4098 = _3990 * _4042;
                        float _4100 = _3994 * _4042;
                        float _4102 = fma(_4090, _3366, _4094);
                        float _4104 = _4054 * _4042;
                        float _4106 = fma(_3366, _4098, _4092);
                        float _4108 = fma(_3366, _4100, _4096);
                        float _4110 = _4058 * _4042;
                        float _4112 = _4064 * _4042;
                        float _4114 = fma(_4104, _3370, _4102);
                        float _4116 = fma(_3974, _3986, _4078);
                        float _4118 = fma(_4110, _3370, _4106);
                        float _4120 = fma(_4112, _3370, _4108);
                        float _4122 = fma(_4116, _4042, _4114);
                        float _4124 = -_4082;
                        float _4126 = fma(_4124, _4042, _4118);
                        float _4128 = -_4080;
                        float _4130 = fma(_4128, _4042, _4120);
                        _3362 = _4058;
                        _3108 = _4126;
                        _3110 = _4122;
                        _3112 = _4130;
                    }
                }
            }
        }
        _3686 = false;
        float _4132 = _3362;
        float _4134 = _3108;
        float _4136 = _3110;
        float _4138 = _3112;
        float _4140 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[33]);
        float _4142 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[34]);
        float _4144 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[35]);
        bool _4146 = _4140 != 0.0;
        bool _4148 = isnan(_4140);
        bool _4150 = _4146 || _4148;
        bool _4152 = isnan(0.0);
        bool _4154 = _4150 || _4152;
        bool _4156 = _4142 != 0.0;
        bool _4158 = isnan(_4142);
        bool _4160 = _4156 || _4158;
        bool _4162 = isnan(0.0);
        bool _4164 = _4160 || _4162;
        bool _4166 = _4144 != 0.0;
        bool _4168 = isnan(_4144);
        bool _4170 = _4166 || _4168;
        bool _4172 = isnan(0.0);
        bool _4174 = _4170 || _4172;
        float _4176 = _4140;
        float _4178 = _4134;
        float _4180 = _4136;
        float _4182 = _4138;
        float _4184 = _4142;
        if (_4154)
        {
            float _4186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _4176 = _4186;
        }
        float _4188 = _4176;
        float _4190 = _4144;
        if (_4164)
        {
            float _4192 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _4190 = _4192;
        }
        float _4194 = _4190;
        float _4196 = _4132;
        if (_4174)
        {
            float _4198 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[31]);
            _4196 = _4198;
        }
        float _4200 = _4196;
        if (_4154)
        {
            float _4202 = _3354 + _4134;
            _4178 = _4202;
        }
        float _4204 = _4178;
        float _4206 = _4204;
        if (_4164)
        {
            float _4208 = _3356 + _4136;
            _4180 = _4208;
        }
        float _4210 = _4180;
        float _4212 = _4210;
        if (_4174)
        {
            float _4214 = _3358 + _4138;
            _4182 = _4214;
        }
        float _4216 = _4182;
        float _4218 = _4216;
        if (!_4164)
        {
            _4184 = 0.0;
        }
        float _4220 = _4184;
        float _4222 = _4220;
        if (_4154)
        {
            float _4224 = -_3040;
            float _4226 = _4224 + _4204;
            _4206 = _4226;
        }
        float _4228 = _4206;
        float _4230 = _4228;
        if (_4164)
        {
            float _4232 = -_3042;
            float _4234 = _4232 + _4210;
            _3364 = _4234;
        }
        float _4236 = _3364;
        float _4238 = _4236;
        if (_4154)
        {
            float _4240 = -_498;
            float _4242 = _4240 + _4228;
            _4230 = _4242;
        }
        float _4244 = _4230;
        float _4246 = _4244;
        if (_4164)
        {
            float _4248 = -_534;
            float _4250 = _4248 + _4236;
            _4238 = _4250;
        }
        float _4252 = _4238;
        float _4254 = _4188;
        float _4256 = _4252;
        if (_4154)
        {
            float _4258 = _4244 * _4188;
            _4254 = _4258;
        }
        float _4260 = _4254;
        float _4262 = _4260;
        if (!_4154)
        {
            _4246 = 0.0;
        }
        float _4264 = _4246;
        float _4266 = _4264;
        float _4268 = _4200;
        if (_4164)
        {
            float _4270 = _4252 * _4194;
            _4212 = _4270;
        }
        float _4272 = _4212;
        if (_4174)
        {
            float _4274 = -_3044;
            float _4276 = _4274 + _4216;
            _4256 = _4276;
        }
        float _4278 = _4256;
        float _4280 = _4278;
        if (_4154)
        {
            float _4282 = _274 * _4260;
            _4218 = _4282;
        }
        float _4284 = _4218;
        if (_4174)
        {
            float _4286 = -_516;
            float _4288 = _4286 + _4278;
            _4262 = _4288;
        }
        float _4290 = _4262;
        float _4292 = _4290;
        if (_4164)
        {
            float _4294 = _274 * _4272;
            _4280 = _4294;
        }
        float _4296 = _4280;
        if (_4154)
        {
            float _4298 = _178 * _4284;
            _4266 = _4298;
        }
        float _4300 = _4266;
        _3056 = _4300;
        if (_4174)
        {
            float _4302 = _4290 * _4200;
            _4292 = _4302;
        }
        float _4304 = _4292;
        if (!_4174)
        {
            _4268 = 0.0;
        }
        float _4306 = _4268;
        _3068 = _4306;
        if (_4164)
        {
            float _4308 = _178 * _4296;
            _4222 = _4308;
        }
        float _4310 = _4222;
        _3060 = _4310;
        if (_4174)
        {
            float _4312 = _274 * _4304;
            _318 = _4312;
        }
        float _4314 = _318;
        if (_4174)
        {
            float _4316 = _178 * _4314;
            _3068 = _4316;
        }
    }
    float _4318 = _3056;
    float _4320 = _3068;
    float _4322 = _3060;
    float _4324 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _4326 = _498 + _4318;
    float _4328 = _516 + _4320;
    float _4330 = _534 + _4322;
    bool _4332 = _4324 > 0.0;
    float _4334 = _4324;
    float _4336 = _4318;
    bool _4338 = _4332;
    if (!_4332)
    {
        _4334 = _3040;
    }
    float _4340 = _4334;
    float _4342 = _4340;
    float _4344 = _4340;
    if (!_4332)
    {
        _4336 = _3042;
    }
    float _4346 = _4336;
    float _4348 = _4346;
    float _4350 = _4346;
    if (!_4332)
    {
        _538 = _3044;
    }
    float _4352 = _538;
    bool _4354 = !_4332;
    float _4356 = _4352;
    float _4358 = _4352;
    if (!_4354)
    {
        bool _4360 = !_436;
        if (!_4360)
        {
            float _4362 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _4364 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _4366 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _4368 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _4370 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _4372 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _4374 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _4376 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _4378 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _4380 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _4382 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _4384 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _4386 = _3042 * _4364;
            float _4388 = _3042 * _4372;
            float _4390 = fma(_3040, _4362, _4386);
            float _4392 = _3042 * _4380;
            float _4394 = fma(_3040, _4370, _4388);
            float _4396 = fma(_3044, _4366, _4390);
            float _4398 = fma(_3040, _4378, _4392);
            float _4400 = fma(_3044, _4374, _4394);
            float _4402 = fma(_3044, _4382, _4398);
            float _4404 = _4368 + _4396;
            float _4406 = _4376 + _4400;
            float _4408 = _4384 + _4402;
            _4344 = _4404;
            _4358 = _4408;
            _4350 = _4406;
            _540 = _4368;
            _4410 = true;
        }
        else
        {
            int _4412 = as_type<int>(_240) & 1024;
            bool _4414 = _4412 != 0;
            bool _4416 = !_4414;
            if (!_4416)
            {
                float _4418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _4420 = uint(int(uint(_152) >> uint(2)));
                float _4422 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4420)]);
                int _4424 = _152 + 4;
                uint _4426 = uint(int(uint(_4424) >> uint(2)));
                float _4428 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4426)]);
                int _4430 = _152 + 8;
                uint _4432 = uint(int(uint(_4430) >> uint(2)));
                float _4434 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4432)]);
                int _4436 = _152 + 12;
                uint _4438 = uint(int(uint(_4436) >> uint(2)));
                float _4440 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4438)]);
                uint _4442 = uint(int(uint(_152) >> uint(2)));
                float _4444 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4442)]);
                int _4446 = _152 + 4;
                uint _4448 = uint(int(uint(_4446) >> uint(2)));
                float _4450 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4448)]);
                int _4452 = _152 + 8;
                uint _4454 = uint(int(uint(_4452) >> uint(2)));
                float _4456 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4454)]);
                uint _4458 = uint(int(uint(_152) >> uint(2)));
                float _4460 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4458)]);
                int _4462 = _152 + 4;
                uint _4464 = uint(int(uint(_4462) >> uint(2)));
                float _4466 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4464)]);
                int _4468 = _152 + 8;
                uint _4470 = uint(int(uint(_4468) >> uint(2)));
                float _4472 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4470)]);
                float _4474 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _4476 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _4478 = _3042 * _4428;
                float _4480 = _3042 * _4450;
                float _4482 = fma(_3040, _4422, _4478);
                float _4484 = _3042 * _4466;
                float _4486 = fma(_3040, _4444, _4480);
                float _4488 = fma(_3044, _4434, _4482);
                float _4490 = fma(_3040, _4460, _4484);
                float _4492 = fma(_3044, _4456, _4486);
                float _4494 = fma(_3044, _4472, _4490);
                float _4496 = _4418 + _4488;
                float _4498 = _4474 + _4492;
                float _4500 = _4476 + _4494;
                _4344 = _4496;
                _4358 = _4500;
                _4350 = _4498;
                _540 = _4440;
                _4410 = true;
            }
            else
            {
                int _4502 = as_type<int>(_240) & 2048;
                bool _4504 = _4502 != 0;
                if (!_4504)
                {
                    _4342 = _3040;
                }
                float _4506 = _4342;
                _4344 = _4506;
                if (!_4504)
                {
                    _4348 = _3042;
                }
                float _4508 = _4348;
                _4350 = _4508;
                if (!_4504)
                {
                    _4356 = _3044;
                }
                float _4510 = _4356;
                bool _4512 = !_4504;
                _4358 = _4510;
                if (!_4512)
                {
                    uint _4514 = uint(int(uint(_152) >> uint(2)));
                    float _4516 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4514)]);
                    int _4518 = _152 + 4;
                    uint _4520 = uint(int(uint(_4518) >> uint(2)));
                    float _4522 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4520)]);
                    int _4524 = _152 + 8;
                    uint _4526 = uint(int(uint(_4524) >> uint(2)));
                    float _4528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4526)]);
                    int _4530 = _152 + 12;
                    uint _4532 = uint(int(uint(_4530) >> uint(2)));
                    float _4534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4532)]);
                    uint _4536 = uint(int(uint(_152) >> uint(2)));
                    float _4538 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4536)]);
                    int _4540 = _152 + 4;
                    uint _4542 = uint(int(uint(_4540) >> uint(2)));
                    float _4544 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4542)]);
                    int _4546 = _152 + 8;
                    uint _4548 = uint(int(uint(_4546) >> uint(2)));
                    float _4550 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4548)]);
                    int _4552 = _152 + 12;
                    uint _4554 = uint(int(uint(_4552) >> uint(2)));
                    float _4556 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4554)]);
                    uint _4558 = uint(int(uint(_152) >> uint(2)));
                    float _4560 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4558)]);
                    int _4562 = _152 + 4;
                    uint _4564 = uint(int(uint(_4562) >> uint(2)));
                    float _4566 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4564)]);
                    int _4568 = _152 + 8;
                    uint _4570 = uint(int(uint(_4568) >> uint(2)));
                    float _4572 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4570)]);
                    int _4574 = _152 + 12;
                    uint _4576 = uint(int(uint(_4574) >> uint(2)));
                    float _4578 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4576)]);
                    float _4580 = _3042 * _4522;
                    float _4582 = _3042 * _4544;
                    float _4584 = fma(_3040, _4516, _4580);
                    float _4586 = _3042 * _4566;
                    float _4588 = fma(_3040, _4538, _4582);
                    float _4590 = fma(_3040, _4560, _4586);
                    float _4592 = fma(_3044, _4528, _4584);
                    float _4594 = fma(_3044, _4550, _4588);
                    float _4596 = fma(_3044, _4572, _4590);
                    float _4598 = _4534 + _4592;
                    float _4600 = _4556 + _4594;
                    float _4602 = _4578 + _4596;
                    _4344 = _4598;
                    _4358 = _4602;
                    _4350 = _4600;
                    _540 = _4556;
                }
            }
        }
    }
    _4410 = false;
    float _4604 = _4344;
    float _4606 = _4358;
    float _4608 = _4350;
    float _4610 = _540;
    float _4612 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _4614 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[60]);
    float _4616 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[62]);
    float _4618 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[59]);
    float _4620 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[61]);
    float _4622 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[63]);
    bool _4624 = _4612 != 0.0;
    bool _4626 = isnan(_4612);
    bool _4628 = _4624 || _4626;
    bool _4630 = isnan(0.0);
    bool _4632 = _4628 || _4630;
    float _4634 = _180 * _4614;
    float _4636 = _180 * _4616;
    float _4638 = fma(_4618, _4604, _4634);
    float _4640 = fma(_4618, _4606, _4636);
    float _4642 = _180 * _4620;
    float _4644 = _4622;
    float _4646 = _4610;
    if (_4632)
    {
        float _4648 = _158 * _4622;
        _4644 = _4648;
    }
    float _4650 = _4644;
    float _4652 = fma(_4618, _4608, _4642);
    float _4654 = -_4650;
    bool _4656 = _4638 >= _4654;
    bool _4658 = isnan(_4638);
    bool _4660 = _4656 || _4658;
    bool _4662 = isnan(_4654);
    bool _4664 = _4660 || _4662;
    float _4666 = _4638 + _4650;
    float _4668 = -_4650;
    bool _4670 = _4640 >= _4668;
    bool _4672 = isnan(_4640);
    bool _4674 = _4670 || _4672;
    bool _4676 = isnan(_4668);
    bool _4678 = _4674 || _4676;
    float _4680 = _4640 + _4650;
    float _4682 = _4652 + _4650;
    float _4684 = -_4650;
    bool _4686 = _4652 >= _4684;
    bool _4688 = isnan(_4652);
    bool _4690 = _4686 || _4688;
    bool _4692 = isnan(_4684);
    bool _4694 = _4690 || _4692;
    bool _4696 = !_4664;
    float _4698 = -_4666;
    float _4700 = _4696 ? _4698 : _4666;
    bool _4702 = !_4678;
    float _4704 = -_4680;
    float _4706 = _4702 ? _4704 : _4680;
    bool _4708 = !_4694;
    float _4710 = -_4682;
    float _4712 = _4708 ? _4710 : _4682;
    float _4714 = _4700 * 0.03125;
    float _4716 = _4706 * 0.03125;
    float _4718 = _4712 * 0.03125;
    float3 _12556 = float3(_4714, _4718, _4716);
    float3 _4722 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_12556, float3(0.0), isnan(_12556)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_12556, float3(0.0), isnan(_12556)), level(0.0)).xyz;
    float _4724 = _4722.x;
    float _4726 = _4722.y;
    float _4728 = _4722.z;
    float _4730 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[56]);
    float _4732 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[57]);
    float _4734 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[58]);
    float _4736 = _4724 + (-0.5);
    float _4738 = _4726 + (-0.5);
    float _4740 = _4728 + (-0.5);
    float _4742 = _4736 * _4730;
    float _4744 = _4738 * _4732;
    float _4746 = _4740 * _4734;
    float _4748 = _4734;
    float _4750 = _4730;
    float _4752 = _4650;
    if (!_4332)
    {
        _4748 = _4742;
    }
    float _4754 = _4748;
    float _4756 = _4754;
    float _4758 = _4754;
    if (!_4332)
    {
        _4646 = _4744;
    }
    float _4760 = _4646;
    float _4762 = _4760;
    float _4764 = _4760;
    if (!_4332)
    {
        _4750 = _4746;
    }
    float _4766 = _4750;
    bool _4768 = !_4332;
    float _4770 = _4766;
    float _4772 = _4766;
    if (!_4768)
    {
        bool _4774 = !_436;
        if (!_4774)
        {
            float _4776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _4778 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _4780 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _4782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _4784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _4786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _4788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _4790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _4792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _4794 = _4780 * _4782;
            float _4796 = _4780 * _4784;
            float _4798 = _4778 * _4782;
            float _4800 = -_4794;
            float _4802 = fma(_4776, _4786, _4800);
            float _4804 = -_4796;
            float _4806 = fma(_4778, _4786, _4804);
            float _4808 = -_4798;
            float _4810 = fma(_4776, _4784, _4808);
            float _4812 = _4790 * _4776;
            float _4814 = _4790 * _4802;
            float _4816 = _4792 * _4778;
            float _4818 = _4788 * _4784;
            float _4820 = -_4812;
            float _4822 = fma(_4788, _4778, _4820);
            float _4824 = -_4814;
            float _4826 = fma(_4788, _4806, _4824);
            float _4828 = _4790 * _4786;
            float _4830 = _4792 * _4782;
            float _4832 = _4788 * _4780;
            float _4834 = fma(_4792, _4810, _4826);
            float _4836 = -_4828;
            float _4838 = fma(_4792, _4784, _4836);
            float _4840 = -_4830;
            float _4842 = fma(_4788, _4786, _4840);
            float _4844 = -_4818;
            float _4846 = fma(_4790, _4782, _4844);
            float _4848 = 1.0 / _4834;
            float _4850 = -_4832;
            float _4852 = fma(_4792, _4776, _4850);
            float _4854 = -_4776;
            float _4856 = fma(_4854, _4786, _4794);
            float _4858 = -_4816;
            float _4860 = fma(_4790, _4780, _4858);
            float _4862 = _4838 * _4848;
            float _4864 = _4842 * _4848;
            float _4866 = _4846 * _4848;
            float _4868 = _4742 * _4848;
            float _4870 = _4744 * _4862;
            float _4872 = _4744 * _4864;
            float _4874 = _4744 * _4866;
            float _4876 = _4856 * _4848;
            float _4878 = _4860 * _4848;
            float _4880 = _4852 * _4848;
            float _4882 = _4822 * _4848;
            float _4884 = fma(_4806, _4868, _4870);
            float _4886 = fma(_4742, _4876, _4872);
            float _4888 = fma(_4810, _4868, _4874);
            float _4890 = fma(_4746, _4878, _4884);
            float _4892 = fma(_4746, _4880, _4886);
            float _4894 = fma(_4746, _4882, _4888);
            _4752 = _4792;
            _4764 = _4892;
            _4758 = _4890;
            _4772 = _4894;
            _4896 = true;
        }
        else
        {
            int _4898 = as_type<int>(_240) & 1024;
            bool _4900 = _4898 != 0;
            if (_4900)
            {
                _4338 = true;
            }
            bool _4902 = _4338;
            bool _4904 = _4902;
            if (!_4900)
            {
                int _4906 = as_type<int>(_240) & 2048;
                bool _4908 = _4906 != 0;
                _4904 = _4908;
            }
            bool _4910 = _4904;
            if (!_4910)
            {
                _4756 = _4742;
            }
            float _4912 = _4756;
            _4758 = _4912;
            if (!_4910)
            {
                _4762 = _4744;
            }
            float _4914 = _4762;
            _4764 = _4914;
            if (!_4910)
            {
                _4770 = _4746;
            }
            float _4916 = _4770;
            bool _4918 = !_4910;
            _4772 = _4916;
            if (!_4918)
            {
                uint _4920 = uint(int(uint(_152) >> uint(2)));
                float _4922 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4920)]);
                int _4924 = _152 + 4;
                uint _4926 = uint(int(uint(_4924) >> uint(2)));
                float _4928 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4926)]);
                int _4930 = _152 + 8;
                uint _4932 = uint(int(uint(_4930) >> uint(2)));
                float _4934 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4932)]);
                uint _4936 = uint(int(uint(_152) >> uint(2)));
                float _4938 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4936)]);
                int _4940 = _152 + 4;
                uint _4942 = uint(int(uint(_4940) >> uint(2)));
                float _4944 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4942)]);
                int _4946 = _152 + 8;
                uint _4948 = uint(int(uint(_4946) >> uint(2)));
                float _4950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4948)]);
                uint _4952 = uint(int(uint(_152) >> uint(2)));
                float _4954 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4952)]);
                int _4956 = _152 + 4;
                uint _4958 = uint(int(uint(_4956) >> uint(2)));
                float _4960 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4958)]);
                int _4962 = _152 + 8;
                uint _4964 = uint(int(uint(_4962) >> uint(2)));
                float _4966 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4964)]);
                float _4968 = _4934 * _4938;
                float _4970 = _4934 * _4944;
                float _4972 = _4928 * _4938;
                float _4974 = -_4968;
                float _4976 = fma(_4922, _4950, _4974);
                float _4978 = -_4970;
                float _4980 = fma(_4928, _4950, _4978);
                float _4982 = _4966 * _4928;
                float _4984 = _4954 * _4944;
                float _4986 = _4960 * _4976;
                float _4988 = -_4972;
                float _4990 = fma(_4922, _4944, _4988);
                float _4992 = _4960 * _4922;
                float _4994 = _4966 * _4938;
                float _4996 = -_4986;
                float _4998 = fma(_4954, _4980, _4996);
                float _5000 = _4954 * _4934;
                float _5002 = -_4992;
                float _5004 = fma(_4954, _4928, _5002);
                float _5006 = _4960 * _4950;
                float _5008 = fma(_4966, _4990, _4998);
                float _5010 = -_4982;
                float _5012 = fma(_4960, _4934, _5010);
                float _5014 = -_4994;
                float _5016 = fma(_4954, _4950, _5014);
                float _5018 = -_5006;
                float _5020 = fma(_4966, _4944, _5018);
                float _5022 = 1.0 / _5008;
                float _5024 = -_4984;
                float _5026 = fma(_4960, _4938, _5024);
                float _5028 = -_5000;
                float _5030 = fma(_4966, _4922, _5028);
                float _5032 = -_4922;
                float _5034 = fma(_5032, _4950, _4968);
                float _5036 = _5020 * _5022;
                float _5038 = _5016 * _5022;
                float _5040 = _5026 * _5022;
                float _5042 = _4742 * _5022;
                float _5044 = _5036 * _4744;
                float _5046 = _5038 * _4744;
                float _5048 = _5040 * _4744;
                float _5050 = _5034 * _5022;
                float _5052 = _5012 * _5022;
                float _5054 = _5030 * _5022;
                float _5056 = _5004 * _5022;
                float _5058 = fma(_4980, _5042, _5044);
                float _5060 = fma(_5050, _4742, _5046);
                float _5062 = fma(_4990, _5042, _5048);
                float _5064 = fma(_5052, _4746, _5058);
                float _5066 = fma(_5054, _4746, _5060);
                float _5068 = fma(_5056, _4746, _5062);
                _4752 = _4966;
                _4764 = _5066;
                _4758 = _5064;
                _4772 = _5068;
            }
        }
    }
    _4896 = false;
    float _5070 = _4752;
    float _5072 = _4764;
    float _5074 = _4758;
    float _5076 = _4772;
    float _5078 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _5080 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    float _5082 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    float _5084 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _5086 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _5088 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _5090 = uint(int(uint(_182) >> uint(2)));
    float _5092 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_5090)]);
    bool _5094 = _5078 > 0.0;
    bool _5096 = _5080 > 0.0;
    float _5098 = _5082 * _5080;
    float _5100 = _178 * _5084;
    float _5102 = _5070;
    float _5104 = _5082;
    bool _5106 = _5096;
    float _5108 = _5086;
    float _5110 = _5100;
    if (_5094)
    {
        float _5112 = 1.0 / _5078;
        _5102 = _5112;
    }
    float _5114 = _5102;
    float _5116 = _178 * _5088;
    float _5118 = _5116;
    if (_5096)
    {
        float _5120 = -_5098;
        float _5122 = fma(_158, _5120, _5082);
        _5104 = _5122;
    }
    float _5124 = _5104;
    float _5126 = fma(_178, _5072, _4330);
    float _5128 = _5114;
    float _5130 = _5124;
    if (_5094)
    {
        float _5132 = _384 * _5114;
        _422 = _5132;
    }
    float _5134 = _422;
    if (_5094)
    {
        float _5136 = precise::min(_5134, 1.0);
        _5128 = _5136;
    }
    float _5138 = _5128;
    float _5140 = fma(_178, _5074, _4326);
    float _5142 = _178 * _5086;
    float _5144 = fma(_178, _5076, _4328);
    if (_5094)
    {
        float _5146 = _5138 * _5124;
        _5130 = _5146;
    }
    float _5148 = _5130;
    float _5150 = _5100 * _5148;
    float _5152 = _5142 * _5148;
    float _5154 = _5116 * _5148;
    bool _5156 = !_436;
    float _5278;
    float _5280;
    float _5282;
    if (!_5156)
    {
        float _5158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _5160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _5162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _5164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _5166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _5168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _5170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _5172 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _5174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _5176 = _5162 * _5164;
        float _5178 = _5162 * _5166;
        float _5180 = _5160 * _5164;
        float _5182 = -_5176;
        float _5184 = fma(_5158, _5168, _5182);
        float _5186 = -_5178;
        float _5188 = fma(_5160, _5168, _5186);
        float _5190 = -_5180;
        float _5192 = fma(_5158, _5166, _5190);
        float _5194 = _5172 * _5158;
        float _5196 = _5172 * _5184;
        float _5198 = _5174 * _5160;
        float _5200 = _5170 * _5166;
        float _5202 = -_5194;
        float _5204 = fma(_5170, _5160, _5202);
        float _5206 = -_5196;
        float _5208 = fma(_5170, _5188, _5206);
        float _5210 = _5172 * _5168;
        float _5212 = _5174 * _5164;
        float _5214 = -_5198;
        float _5216 = fma(_5172, _5162, _5214);
        float _5218 = fma(_5174, _5192, _5208);
        float _5220 = _5170 * _5162;
        float _5222 = -_5210;
        float _5224 = fma(_5174, _5166, _5222);
        float _5226 = -_5212;
        float _5228 = fma(_5170, _5168, _5226);
        float _5230 = -_5200;
        float _5232 = fma(_5172, _5164, _5230);
        float _5234 = -_5158;
        float _5236 = fma(_5234, _5168, _5176);
        float _5238 = 1.0 / _5218;
        float _5240 = -_5220;
        float _5242 = fma(_5174, _5158, _5240);
        float _5244 = _5224 * _5238;
        float _5246 = _5228 * _5238;
        float _5248 = _5232 * _5238;
        float _5250 = _5150 * _5238;
        float _5252 = _5244 * _5152;
        float _5254 = _5246 * _5152;
        float _5256 = _5248 * _5152;
        float _5258 = _5236 * _5238;
        float _5260 = _5216 * _5238;
        float _5262 = fma(_5188, _5250, _5252);
        float _5264 = _5242 * _5238;
        float _5266 = _5204 * _5238;
        float _5268 = fma(_5258, _5150, _5254);
        float _5270 = fma(_5192, _5250, _5256);
        float _5272 = fma(_5260, _5154, _5262);
        float _5274 = fma(_5264, _5154, _5268);
        float _5276 = fma(_5266, _5154, _5270);
        _5278 = _5272;
        _5280 = _5274;
        _5282 = _5276;
        _5284 = true;
    }
    else
    {
        int _5286 = as_type<int>(_240) & 1024;
        bool _5288 = _5286 != 0;
        if (_5288)
        {
            _5106 = true;
        }
        bool _5290 = _5106;
        bool _5292 = _5290;
        if (!_5288)
        {
            int _5294 = as_type<int>(_240) & 2048;
            bool _5296 = _5294 != 0;
            _5292 = _5296;
        }
        bool _5298 = _5292;
        if (!_5298)
        {
            _5118 = _5150;
        }
        float _5300 = _5118;
        _5278 = _5300;
        if (!_5298)
        {
            _5108 = _5152;
        }
        float _5302 = _5108;
        _5280 = _5302;
        if (!_5298)
        {
            _5110 = _5154;
        }
        float _5304 = _5110;
        bool _5306 = !_5298;
        _5282 = _5304;
        if (!_5306)
        {
            uint _5308 = uint(int(uint(_152) >> uint(2)));
            float _5310 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5308)]);
            int _5312 = _152 + 4;
            uint _5314 = uint(int(uint(_5312) >> uint(2)));
            float _5316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5314)]);
            int _5318 = _152 + 8;
            uint _5320 = uint(int(uint(_5318) >> uint(2)));
            float _5322 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_5320)]);
            uint _5324 = uint(int(uint(_152) >> uint(2)));
            float _5326 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5324)]);
            int _5328 = _152 + 4;
            uint _5330 = uint(int(uint(_5328) >> uint(2)));
            float _5332 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5330)]);
            int _5334 = _152 + 8;
            uint _5336 = uint(int(uint(_5334) >> uint(2)));
            float _5338 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_5336)]);
            uint _5340 = uint(int(uint(_152) >> uint(2)));
            float _5342 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5340)]);
            int _5344 = _152 + 4;
            uint _5346 = uint(int(uint(_5344) >> uint(2)));
            float _5348 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5346)]);
            int _5350 = _152 + 8;
            uint _5352 = uint(int(uint(_5350) >> uint(2)));
            float _5354 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_5352)]);
            float _5356 = _5322 * _5326;
            float _5358 = _5322 * _5332;
            float _5360 = _5316 * _5326;
            float _5362 = -_5356;
            float _5364 = fma(_5310, _5338, _5362);
            float _5366 = -_5358;
            float _5368 = fma(_5316, _5338, _5366);
            float _5370 = -_5360;
            float _5372 = fma(_5310, _5332, _5370);
            float _5374 = _5348 * _5310;
            float _5376 = _5348 * _5364;
            float _5378 = _5354 * _5316;
            float _5380 = _5342 * _5332;
            float _5382 = -_5374;
            float _5384 = fma(_5342, _5316, _5382);
            float _5386 = -_5376;
            float _5388 = fma(_5342, _5368, _5386);
            float _5390 = _5348 * _5338;
            float _5392 = _5354 * _5326;
            float _5394 = -_5378;
            float _5396 = fma(_5348, _5322, _5394);
            float _5398 = fma(_5354, _5372, _5388);
            float _5400 = _5342 * _5322;
            float _5402 = -_5390;
            float _5404 = fma(_5354, _5332, _5402);
            float _5406 = -_5392;
            float _5408 = fma(_5342, _5338, _5406);
            float _5410 = -_5380;
            float _5412 = fma(_5348, _5326, _5410);
            float _5414 = -_5310;
            float _5416 = fma(_5414, _5338, _5356);
            float _5418 = 1.0 / _5398;
            float _5420 = -_5400;
            float _5422 = fma(_5354, _5310, _5420);
            float _5424 = _5404 * _5418;
            float _5426 = _5408 * _5418;
            float _5428 = _5412 * _5418;
            float _5430 = _5150 * _5418;
            float _5432 = _5424 * _5152;
            float _5434 = _5426 * _5152;
            float _5436 = _5428 * _5152;
            float _5438 = _5416 * _5418;
            float _5440 = _5396 * _5418;
            float _5442 = fma(_5368, _5430, _5432);
            float _5444 = _5422 * _5418;
            float _5446 = _5384 * _5418;
            float _5448 = fma(_5438, _5150, _5434);
            float _5450 = fma(_5372, _5430, _5436);
            float _5452 = fma(_5440, _5154, _5442);
            float _5454 = fma(_5444, _5154, _5448);
            float _5456 = fma(_5446, _5154, _5450);
            _5278 = _5452;
            _5280 = _5454;
            _5282 = _5456;
        }
    }
    _5284 = false;
    float _5458 = _5278;
    float _5460 = _5280;
    float _5462 = _5282;
    float _5464 = _3040 + _5458;
    float _5466 = _3042 + _5460;
    float _5468 = _3044 + _5462;
    int _5470 = _152 + 4;
    int _5472 = _152 + 8;
    uint _5474 = uint(int(uint(_182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5474)] = as_type<uint>(_5092);
    float _5476 = -_224;
    float _5478 = _5476 + _5464;
    float _5480 = -_230;
    float _5482 = _5480 + _5466;
    uint _5484 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5484)] = as_type<uint>(_5464);
    float _5486 = -_236;
    float _5488 = _5486 + _5468;
    uint _5490 = uint(int(uint(_5470) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5490)] = as_type<uint>(_5466);
    uint _5492 = uint(int(uint(_5472) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5492)] = as_type<uint>(_5468);
    uint _5494 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5494)] = as_type<uint>(_5140);
    uint _5496 = uint(int(uint(_5470) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5496)] = as_type<uint>(_5126);
    uint _5498 = uint(int(uint(_5472) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5498)] = as_type<uint>(_5144);
    uint _5500 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_5500)] = as_type<uint>(_5478);
    uint _5502 = uint(int(uint(_5470) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_5502)] = as_type<uint>(_5482);
    uint _5504 = uint(int(uint(_5472) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_5504)] = as_type<uint>(_5488);
    float _5506 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _5508 = _5482 * _5482;
    float _5510 = _5126 * _5126;
    float _5512 = fma(_5478, _5478, _5508);
    float _5514 = fma(_5140, _5140, _5510);
    float _5516 = fma(_5488, _5488, _5512);
    float _5518 = fma(_5144, _5144, _5514);
    float _5520 = sqrt(_5518);
    float _5522 = sqrt(_5516);
    bool _5524 = _5522 >= 9.9999999747524270787835121154785e-07;
    bool _5526 = isnan(_5522);
    bool _5528 = _5524 || _5526;
    bool _5530 = isnan(9.9999999747524270787835121154785e-07);
    bool _5532 = _5528 || _5530;
    float _5534 = _5522;
    if (!_5532)
    {
        bool _5536 = _180 != _196;
        bool _5538 = isnan(_180);
        bool _5540 = _5536 || _5538;
        bool _5542 = isnan(_196);
        bool _5544 = _5540 || _5542;
        _5546 = _5544;
        if (!_5546)
        {
            float _5548 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[67]);
            bool _5550 = _5548 > 0.0;
            bool _5552 = !_5550;
            if (!_5552)
            {
                float _5554 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[64]);
                float _5556 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[65]);
                float _5558 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[66]);
                float _5560 = _5556 * _5556;
                float _5562 = fma(_5554, _5554, _5560);
                float _5564 = fma(_5558, _5558, _5562);
                float _5566 = rsqrt(_5564);
                float _5568 = _5566 * 9.9999999747524270787835121154785e-07;
                float _5570 = _5554 * _5568;
                float _5572 = _5556 * _5568;
                float _5574 = _5558 * _5568;
                _326 = as_type<int>(_5570);
                _328 = as_type<int>(_5572);
                _330 = as_type<int>(_5574);
                _5546 = true;
            }
            else
            {
                bool _5576 = _5520 >= 9.9999999747524270787835121154785e-07;
                bool _5578 = isnan(_5520);
                bool _5580 = _5576 || _5578;
                bool _5582 = isnan(9.9999999747524270787835121154785e-07);
                bool _5584 = _5580 || _5582;
                if (!_5584)
                {
                    float _5586 = _5466 * _5466;
                    float _5588 = fma(_5464, _5464, _5586);
                    float _5590 = fma(_5468, _5468, _5588);
                    float _5592 = sqrt(_5590);
                    bool _5594 = _5592 >= 9.9999999747524270787835121154785e-07;
                    bool _5596 = isnan(_5592);
                    bool _5598 = _5594 || _5596;
                    bool _5600 = isnan(9.9999999747524270787835121154785e-07);
                    bool _5602 = _5598 || _5600;
                    int _5604 = as_type<int>(_266);
                    int _5606 = as_type<int>(_5592);
                    if (_5602)
                    {
                        float _5608 = rsqrt(_5590);
                        _5604 = as_type<int>(_5608);
                    }
                    int _5610 = _5604;
                    if (!_5602)
                    {
                        _5606 = 0;
                    }
                    int _5612 = _5606;
                    int _5614 = _5612;
                    if (!_5602)
                    {
                        _320 = 897988541;
                    }
                    int _5616 = _320;
                    int _5618 = _5610;
                    int _5620 = _5616;
                    if (_5602)
                    {
                        float _5622 = as_type<float>(_5610) * 9.9999999747524270787835121154785e-07;
                        _5534 = _5622;
                    }
                    float _5624 = _5534;
                    if (!_5602)
                    {
                        _5618 = 0;
                    }
                    int _5626 = _5618;
                    int _5628 = _5626;
                    if (_5602)
                    {
                        float _5630 = _5464 * _5624;
                        _5614 = as_type<int>(_5630);
                    }
                    int _5632 = _5614;
                    _326 = _5632;
                    if (_5602)
                    {
                        float _5634 = _5466 * _5624;
                        _5620 = as_type<int>(_5634);
                    }
                    int _5636 = _5620;
                    _328 = _5636;
                    if (_5602)
                    {
                        float _5638 = _5468 * _5624;
                        _5628 = as_type<int>(_5638);
                    }
                    int _5640 = _5628;
                    _330 = _5640;
                    _5546 = true;
                }
                else
                {
                    float _5642 = rsqrt(_5518);
                    float _5644 = _5642 * 9.9999999747524270787835121154785e-07;
                    float _5646 = _5140 * _5644;
                    float _5648 = _5126 * _5644;
                    float _5650 = _5144 * _5644;
                    _326 = as_type<int>(_5646);
                    _328 = as_type<int>(_5648);
                    _330 = as_type<int>(_5650);
                    _5546 = true;
                }
            }
        }
    }
    else
    {
        float _5652 = _5520 * _5506;
        bool _5654 = _5652 >= 0.001000000047497451305389404296875;
        bool _5656 = isnan(_5652);
        bool _5658 = _5654 || _5656;
        bool _5660 = isnan(0.001000000047497451305389404296875);
        bool _5662 = _5658 || _5660;
        bool _5664 = _5652 > 0.0;
        bool _5666 = !_5662;
        bool _5668 = _5664 && _5666;
        bool _5670 = _5522 < 0.001000000047497451305389404296875;
        bool _5672 = _5670 && _5668;
        int _5674 = as_type<int>(_5652);
        if (!_5672)
        {
            _5674 = as_type<int>(_5478);
        }
        int _5676 = _5674;
        int _5678 = _5676;
        if (_5672)
        {
            float _5680 = _5140 * _5506;
            _5678 = as_type<int>(_5680);
        }
        int _5682 = _5678;
        _326 = _5682;
        if (!_5672)
        {
            _322 = as_type<int>(_5482);
        }
        int _5684 = _322;
        int _5686 = _5684;
        if (_5672)
        {
            float _5688 = _5126 * _5506;
            _5686 = as_type<int>(_5688);
        }
        int _5690 = _5686;
        _328 = _5690;
        if (!_5672)
        {
            _324 = as_type<int>(_5488);
        }
        int _5692 = _324;
        _330 = _5692;
        if (_5672)
        {
            float _5694 = _5144 * _5506;
            _330 = as_type<int>(_5694);
        }
    }
    _5546 = false;
    int _5696 = _326;
    int _5698 = _328;
    int _5700 = _330;
    uint _5702 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_5702)] = uint(_5696);
    uint _5704 = uint(int(uint(_5470) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_5704)] = uint(_5698);
    uint _5706 = uint(int(uint(_5472) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_5706)] = uint(_5700);
}

